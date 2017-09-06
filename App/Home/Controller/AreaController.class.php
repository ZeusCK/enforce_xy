<?php
namespace Home\Controller;

class AreaController extends CommonController
{
    protected $tab_id = 'areaid';           //表主键
    //模型
    protected $models = ['area'=>'Enforce\AreaDep',
                         'user'=>'Enforce\User',
                         'areapro'=>'Enforce\AreaPro',
                         'employee'=>'Enforce\Employee',
                         'deptrole'=>'Enforce\DeptRole'];
    protected $link_tabs = ['ws_base', //工作站
                            'pe_base', //执法记录仪
                            'server_machine',  //服务器
                            // 'sys_notice',    //公告
                            'employee'];    //警员
    //控制器
    protected $actions = ['user'=>'User'];
    protected $logContent = '系统管理/部门管理';
    public function index()
    {
        $areaTree = $this->tree_list();
        $this->display('area');
    }

    public function dataList($request)
    {
        $request = u2gs($request);
        $page = $request['page'];
        $rows = $request['rows'];
        unset($request['page'],$request['rows'],$request['rand']);
        if(!empty($request)){
            foreach($request as $key=>$value){
                if($key != 'areaid' && $key != 'areacode')
                    $check[$key] = array('like','%'.$value.'%');
            }
        }
        $db = D($this->models['area']);
        $check[] = $this->get_manger_sql($request['areacode'],'areacode',false);
        $data['total'] = 0;
        $data['rows'] = array();
        $order = 'CONVERT(areacode,SIGNED) asc,sort asc';
        $data = $db->getTableList($check,$page,$rows,$order);
        $areas = $db->getField('areaid,areaname');
        // $areaType = $this->get_val_item('dictionary','areatype');
        $read_type = $this->get_val_item('dictionary','is_read');
        foreach ($data['rows'] as &$value) {
            $value['pareaname'] = array_key_exists($value['fatherareaid'], $areas) ? $areas[$value['fatherareaid']] : u2g('系统根部门');
            $value['areatype'] = $value['type'];
            // $value['typename'] = $areaType[$value['type']];
            $value['is_read_name'] = $read_type[$value['is_read']];
        }
        S('update'.$this->models['area'],null);     //更改部门后的加载，防止缓存失效
        $this->saveExcel($data,'部门详情'); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }

    public function dataAdd($request)
    {
        $request['type'] = $request['areatype'];
        $db = D($this->models['area']);
        $areacode = $db->where('areaid='.$request['fatherareaid'])->getField('areacode');
        $check[] = $this->get_manger_sql($areacode,'areacode',false);
        $mangerCount = $db->where($check)->count();
        if($mangerCount <= 0){
            $result['message'] = '对不起，你无法向该部门添加部门！因为该部门不在你的管辖范围。';
            return $result;
        }
        unset($request['areatype']);
        $request = u2gs($request);
        $result = $db->getTableAdd($request);
        if($result['status']){
            $syncData[] = $request;
            $this->sync('area_dep',$syncData,'add');
            $this->write_log('新增部门'.g2u($request['areaname']).':'.g2u($request['areacode']));
        }else{
            $result['message'] = '请确保部门代码的唯一性';
        }
        return $result;
    }

    public function dataRemove($request)
    {
        $where[] = $this->where_key_or(explode(',',$request['areacode']), 'areacode');
        $db = D($this->models['area']);
        $where[] = $this->get_manger_sql('','areacode',false);
        $removeDepts = $db->where($where)->getField('areacode',true);
        $result = $db->getTableDel($where);
        if($result['status']){
            foreach ($this->link_tabs as $tab) {
                $db_rm = D()->table($tab);
                $db_rm->where($where)->delete();
                //同步
                $data['areacode'] = '';
                $data['areaname'] = '';
                $syncData = $db_rm->where($where)->save($data);
                $this->sync($key,$syncData,'edit');
            }
            $this->write_log('删除部门,部门代码：'.$request['areacode']);
            //更新部门角色表
            $deptroledb = D($this->models['deptrole']);
            $deptWhere['dept_list'] = array('NEQ','');
            $deptRoles = $deptroledb->where($deptWhere)->getField('dept_role_id,dept_list');
            $syncDeptRoleData = array();
            foreach ($deptRoles as $key => $value) {
                $roleWhere['dept_role_id'] = $key;
                $roledepts = explode(',',$value);
                $saveDepts = array_diff($roledepts,$removeDepts);
                if(empty(array_diff($saveDepts,$roledepts))) continue;
                $data['dept_list'] = implode(',', $saveDepts);
                $deptroledb->where($roleWhere)->save($data);
                $syncDeptRoleData[] = array('id'=>$key);
            }
            $this->sync('dept_role',$syncDeptRoleData,'edit');
        }
        S('update'.$this->models['area'],true);     //设置部门缓存更新
        return $result;
    }

    public function dataEdit($request)
    {
        $db = D($this->models['area']);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $areaInfo = $db->where($where)->find();
        $request = u2gs($request);
        $result = $db->getTableEdit($where,$request);     //更新记录
        $request['old_areacode'] = $areaInfo['areacode'];
        //同步
        $syncAreaData[] = $request;
        $this->sync('area_dep',$syncAreaData,'edit');
        if($result['status']){
            if($areaInfo['areacode'] == session('areacode')){
                session_start();
                session('areacode',$request['areacode']);
            }
            if($areaInfo['areacode'] != $request['areacode']){      //更新关联表及下级部门
            //更新部门角色表
                $deptroledb = D($this->models['deptrole']);
                $deptWhere['dept_list'] = array('NEQ','');
                $deptRoles = $deptroledb->where($deptWhere)->getField('dept_role_id,dept_list');
                foreach ($deptRoles as $key => $value) {
                    $roleWhere['dept_role_id'] = $key;
                    $saveDepts = explode(',',$value);
                    $syncDeptRoleData = array();
                    //搜索如果存在
                    if(false !== $key = array_search($areaInfo['areacode'], $saveDepts)){
                        $saveDepts[$key] = $request['areacode'];
                        $data['dept_list'] = implode(',', $saveDepts);
                        $deptroledb->where($roleWhere)->save($data);
                        $syncDeptRoleData[] = array('id'=>$key);
                    }
                    $this->sync('dept_role',$syncDeptRoleData,'edit');
                }
                //更新关联表
                $linkTabs = $this->link_tabs;
                $linkTabs[] = 'area_dep';   //部门区域
                // error_log('更新表'.implode(',', $linkTabs."\r\n"),3,'error.log');
                foreach ($linkTabs as $tab) {
                    // $tab = C('DB_NAME').'.'.$tab;
                    $strLen = strlen($request['areacode']);
                     //同步数据
                    $syncData = D()->table($tab)->where('`areacode` like "'.$areaInfo['areacode'].'%"') ->select();
                    if($tab == 'area_dep'){
                        foreach ($syncData as &$areaData) {
                            $areaData['old_areacode'] = $areaData['areacode'];
                            // $areaData['areacode'] = substr_replace($areaData['areacode'],$request['areacode'],0,$strLen);
                            if($areaData['old_areacode'] == session('areacode')){
                                session_start();
                                session('areacode',$areaData['areacode']);
                            }
                        }
                    }
                    //更新所有符合条件的部门代码
                    $sql = 'UPDATE '.$tab.' SET `areacode`=CONCAT("'.$request['areacode'].'",RIGHT(`areacode`,char_length(`areacode`)-'.$strLen.')) WHERE `areacode` like "'.$areaInfo['areacode'].'%"';
                    // error_log('sql:'.$sql."\r\n",3,'sql.log');
                    M()->execute($sql);
                    if($tab == 'employee'){
                        foreach ($syncData as $areaData) {
                            $areaData['areacode'] = substr_replace($areaData['areacode'],$request['areacode'],0,$strLen);
                        }
                        // error_log('同步employee'."\r\n",3,'error.log');
                        M()->execute('UPDATE '.$tab.' SET `userarea`=CONCAT("'.$request['areacode'].'",RIGHT(`userarea`,char_length(`areacode`)-'.$strLen.')) WHERE `userarea` like "'.$areaInfo['areacode'].'%"');
                    }
                    //更新
                    $this->sync($tab,$syncData,'edit');
                    // error_log('更新表sql'.$sql."\r\n",3,'error.log');
                }
        }
        $this->write_log('更新部门:'.g2u($areaInfo['areaname']));
        }
        
        S('update'.$this->models['area'],true);     //设置部门缓存更新
        return $result;
    }
    //获取自身展示部门
    public function all_user_area($type)
    {
        $db = D($this->models['area']);
        $where = $this->get_manger_sql('','areacode',false). 'OR areacode="'.session('areacode').'"';
        $data_f = $db->where($where)->select();
        if(!empty($data_f)){
            $lc=['areaid','fatherareaid'];
            $data_s = $this->getParentData($data_f,$this->models['area'],$lc);
        }
        if(!empty($data_s)){
            $data = array_merge($data_f,$data_s);
        }else{
            $data = $data_f;
        }
        return $data;
    }
    //显示未绑定的交警部门的树
    public function show_tp_tree()
    {
        $type = 1;
        $data = $this->all_user_area($type);
        if(!empty($data)){
            $ids = array(0);
            //$l_arr 保存菜单的一些信息  0-id  1-text 2-iconCls 3-fid 4-odr
            $l_arr = ['areaid','areaname','fatherareaid','sort'];
            //$L_attributes 额外需要保存的信息 'type','code',
            $L_attributes = ['areacode','rperson','rphone','is_read'];
            $icons = ['icon-application_xp_terminal','icon-application'];
            $data_tree = $this->formatTree($ids,$data,$l_arr,$L_attributes,'',$icons,$noclose);
        }else{
            $data_tree = array();
        }
        $this->ajaxReturn(g2us($data_tree));
    }
    public function load_no_read_area($request)
    {
        //$where[] =  $this->get_manger_sql('','areacode',false);
        $where['is_read'] = 1;
        $data_f = D($this->models['area'])->where($where)->select();
        if(!empty($data_f)){
            $lc=['areaid','fatherareaid'];
            $data_s = $this->getParentData($data_f,$this->models['area'],$lc);
        }
        if(!empty($data_s)){
            $data = array_merge($data_f,$data_s);
        }else{
            $data = $data_f;
        }
        if(!empty($data)){
            $ids = array(0);
            //$l_arr 保存菜单的一些信息  0-id  1-text 2-iconCls 3-fid 4-odr
            $l_arr = ['areaid','areaname','fatherareaid','sort'];
            //$L_attributes 额外需要保存的信息 'type','code',
            $L_attributes = ['areacode','rperson','rphone','is_read'];
            $icons = ['icon-application_xp_terminal','icon-application'];
            $data_tree = $this->formatTree($ids,$data,$l_arr,$L_attributes,'',$icons,$noclose);
        }else{
            $data_tree = array();
        }
        return g2us($data_tree);
    }
    /**
     * 获取当前用户管理部门
     * @param boolean $new  是否最新数据 true是  false否
     * @return array easyui-tree
     */
    public function tree_list($new=false)
    {
        if(!S(session('code').'area') || $new){
            $db = D($this->models['area']);
            $data = $this->all_user_area();
            $ids = array(0);
            //$l_arr 保存菜单的一些信息  0-id  1-text 2-iconCls 3-fid 4-odr
            $l_arr = ['areaid','areaname','fatherareaid','sort'];
            //$L_attributes 额外需要保存的信息 'type','code',
            $L_attributes = ['areacode','rperson','rphone','is_read'];
            $icons = ['icon-application_xp_terminal','icon-application'];
            $noclose = $db->where('fatherareaid = 0')->getField('areaid',true);
            $data_tree = $this->formatTree($ids,$data,$l_arr,$L_attributes,'',$icons,$noclose);
            S(session('code').'area',$data_tree,5*60);
        }else{
            $data_tree = S(session('code').'area');
        }
        return $data_tree;
    }
    //前端请求
    public function data_tree_list()
    {
        $new = I('new') == '' ? false : true;
        $data_tree = $this->tree_list($new);
        $this->ajaxReturn(g2us($data_tree));
    }
    /**
     * 获取目标警员的管理区域
     * @param  int $userid 目标用户id
     * @return string         目标用户管理区域用 , 隔开
     */
    public function m_userarea($empid)
    {
        $db = D($this->models['employee']);
        $where['empid'] = $empid;
        $userarea = $db->where($where)->getField('userarea');
        return explode(',',$userarea);
    }
    //功能作废
    public function userarea()
    {
        $action = A($this->actions['user']);
        return $action->s_userarea();
    }
    /**
     * 获取目标部门的子部门及自身
     * @param  int $areaid 目标部门
     * @param  boolean $no_self 是否加上自身部门  true  否  false 是
     * @return array
     */
    public function carea($areaid,$no_self=false)
    {
        $db = D($this->models['area']);
        $where['areaid'] = $areaid;
        $data = $db->where($where)->select();
        $l_arr = [0=>'areaid',1=>'fatherareaid'];
        $info_f = $this->getChData($data,$this->models['area'],$l_arr);
        if(!$no_self) $info_f = array_merge($data,$info_f);

        $all_list = array();
        foreach ($info_f as  $info_c) {
            $all_list[] = $info_c['areaid'];
        }
        return $all_list;
    }
    /**
     * 获取目标部门的上级部门
     * @param  int $areaid 目标部门
     * @param  boolean $no_self 是否加上自身部门  true  否  false 是
     * @return array
     */
    public function parea($areaid,$no_self=false)
    {
        $db = D($this->models['area']);
        $where['areaid'] = $areaid;
        $data = $db->where($where)->select();

        $l_arr = [0=>'areaid',1=>'fatherareaid'];
        $info_f = $this->getParentData($data,$this->models['area'],$l_arr);
        if(!$no_self) $info_f = array_merge($data,$info_f);
        $all_list = array();
        foreach ($info_f as  $info_c) {
            $all_list[] = $info_c['areaid'];
        }
        return $all_list;
    }
    /**
     * 根据选择目标部门筛选出需要查询的部门和需要显示的部门
     * @param  string $areacode 部门代码
     * @return array
     */
    public function show_sat_area($areacode)
    {
        $db = D($this->models['area']);
        $areaInfo = $db->where('areacode="'.$areacode.'"')->find();
        $show = $db->where('fatherareaid="'.$areaInfo['areaid'].'"')->select();
        $result = array();
        if(!empty($show)) $result = $show;
        $result[] = $areaInfo;
        return $result;
    }
    //获取能添加的部门代码
    public function get_add_code($request)
    {
        //areaid  上级ID
        $db = D($this->models['area']);
        $where['fatherareaid'] = $request['areaid'];
        $current = $db->where($request)->getField('areacode');
        $areacodes = $db->where($where)->getField('areacode',true);
        foreach ($areacodes as &$areacode) {
            $areacode = (int)str_replace($current, '', $areacode);
        }
        $allCodes = range(1,99);
        $useCodes = array_diff($allCodes,$areacodes);
        sort($useCodes);
        return array('areacode'=>sprintf('%02d',reset($useCodes)));
    }
    public function show_all_area($request)
    {
        $db = D($this->models['area']);
        $where['is_read'] = array('NEQ',1);
        $data = $db->where($where)->select();
        $ids = array(0);
        //$l_arr 保存菜单的一些信息  0-id  1-text 2-iconCls 3-fid 4-odr
        $l_arr = ['areaid','areaname','fatherareaid','sort'];
        //$L_attributes 额外需要保存的信息 'type', 'code',
        $L_attributes = ['areacode','rperson','rphone','is_read'];
        $icons = ['icon-application_xp_terminal','icon-application'];
        $noclose = $db->where('fatherareaid = 0')->getField('areaid',true);
        $data_tree = $this->formatTree($ids,$data,$l_arr,$L_attributes,'',$icons,$noclose);
        return g2us($data_tree);
    }
    //导入部门的excel
    public function import_excel()
    {
        set_time_limit(0);
        $func = A('Function');
        $is_read = I('is_read');
        $res = $func->save_upload($_FILES['file'],array('xls','xlsx'));
        $db = D($this->models['area']);
        $areaType = array_flip($this->get_val_item('dictionary','areatype'));
        $key_code = array();
        $name_code = array('部门名称'=>'areaname',
                           '部门编号'=>'areacode',
                           // '部门类型'=>'type',
                           // '部门标识'=>'code',
                           '联系人'=>'rperson',
                           '联系方式'=>'rphone');
        $allow = 0;
        $deny = 0;
        $success = 0;
        $fail = 0;
        if($res){
            $data = $func->read_excel($res);
            $header = array_shift($data);
            foreach ($header as $key => $value) {
                if(array_key_exists($value,$name_code)){
                    $key_code[$key] = $name_code[$value];
                }
            }
            $allData = array();
            $sortItem = array();
            foreach ($data as $value) {
                $saveData= array();
                foreach ($value as $k => $val) {
                    if($val === null){
                        $val = '';
                    }else{
                        $val = u2g($val);
                    }
                    if(!array_key_exists($k,$key_code)) continue;
                    if($key_code[$k] == 'type'){             //
                        $saveData[$key_code[$k]] = $areaType[$val];
                    }else{
                        $saveData[$key_code[$k]] = $val;
                    }
                    if($key_code[$k] == 'areacode') $sortItem[] = $val;

                }
                $allData[] = $saveData;
            }
            array_multisort($sortItem,SORT_ASC,$allData);           //排序后确保上级部门在前
            foreach ($allData as $value) {
                $allow++;
                $parentAreacode = substr(trim($value['areacode']), 0,-2);   //上级部门代码
                $parentAreaInfo = $db->where('areacode="'.$parentAreacode.'"')->find();
                $value['fatherareaid'] = $parentAreaInfo ?  $parentAreaInfo['fatherareaid'] : 0;
                $value['is_read'] = $is_read;
                $areaInfo = $db->where('areacode="'.trim($value['areacode']).'"')->find();
                if($areaInfo){
                    $res = $db->where('areacode="'.trim($value['areacode']).'"')->save($value);
                }else{
                    $res = $db->add($value);
                }
                $res ? $success++ : $fail++;
            }
            $result['message'] = '允许导入：'.$allow.'<br>'.'禁止导入：'.$deny.'<br>'.'成功导入：'.$success.'<br>'.'导入失败：'.$fail.'<br>';
            $this->write_log($result['message']);
        }else{
             $result['message'] = '文件上传失败，可能原因文件类型不对，服务器权限不足，文件超过2M';
        }
        exit(json_encode($result));
    }
    public function ztree()
    {
        $info = D($this->models['area'])->field('areaid as id,fatherareaid as pId,areaname as name')->select();
        $this->ajaxReturn(g2us($info));
    }
}