<?php
namespace Home\Controller;

class AreaController extends CommonController
{
    protected $tab_id = 'areaid';           //表主键
    //模型
    protected $models = ['area'=>'Enforce\AreaDep',
                         'user'=>'Enforce\User',
                         'areapro'=>'Enforce\AreaPro',
                         'employee'=>'Enforce\Employee'];
    protected $link_tabs = ['enforce.ws_base', //工作站
                            'enforce.pe_base', //执法记录仪
                            'enforce.server_machine',  //服务器
                            'enforce.sys.notice',    //公告
                            'enforce.employee'];    //警员
    //控制器
    protected $actions = ['user'=>'User'];
    protected $logContent = '系统管理/部门管理';
    public function index()
    {
        $areaTree = $this->tree_list();
        $rootId = !empty($areaTree) ? $areaTree[0]['id'] : 0;
        $rootName = !empty($areaTree) ? g2u($areaTree[0]['text']) : '系统根部门';
        $this->assign('areaid',$rootId);
        $this->assign('areaname',$rootName);
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
                if($key!='areaid' || $key != 'areacode')
                    $check[$key] = array('like','%'.$value.'%');
            }
        }
        $db = D($this->models['area']);
        $check[] = $this->get_manger_sql($request['areacode'],'areacode',false);
        $data['total'] = 0;
        $data['rows'] = array();
        $order = 'fatherareaid asc';
        $data = $db->getTableList($check,$page,$rows,$order);
        $areas = $db->getField('areaid,areaname');
        foreach ($data['rows'] as &$value) {
            $value['pareaname'] = array_key_exists($value['fatherareaid'], $areas) ? $areas[$value['fatherareaid']] : u2g('系统根部门');
            $value['areatype'] = $value['type'];
            $value['typename'] = $value['type'] == '' ? '无' : $value['type'] == 0 ? '交警' : '其他';
            $value['typename'] = u2g($value['typename']);
        }
        S('update'.$this->models['area'],null);     //更改部门后的加载，防止缓存失效
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }

    public function dataAdd($request)
    {
        $request['type'] = $request['areatype'];
        unset($request['areatype']);
        $db = D($this->models['area']);
        $result = $db->getTableAdd(u2gs($request));
        if(!$result['status']) $result['message'] = '请确保部门代码的唯一性';
        return $result;
    }

    public function dataRemove($request)
    {
        $where[] = $this->where_key_or(explode(',',$request['code']), 'areacode');
        $db = D($this->models['area']);
        $where[] = $this->get_manger_sql($request['areacode'],'areacode',false);
        foreach ($this->link_tabs as $tab) {
            $db_rm = D()->table($tab);
            $db_rm->getTableDel($where);
        }
        $this->write_log('删除部门,部门代码：'.$request['areacode']);
        S('update'.$this->models['area'],true);     //设置部门缓存更新
        return $result;
    }

    public function dataEdit($request)
    {
        $db = D($this->models['area']);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $areaInfo = $db->where($where)->find();

        foreach ($this->link_tabs as $tab) {
            if($tab == 'enforce.employee'){
                M()->query('UPDATE '.$tab.' SET `userarea`=REPLACE(`userarea`,"'.$areaInfo['areacode'].'","'.$request['areacode'].'")');
            }
            M()->query('UPDATE '.$tab.' SET `areacode`=REPLACE(`areacode`,"'.$areaInfo['areacode'].'","'.$request['areacode'].'")');
        }
        $result = $db->getTableEdit($where,u2gs($request));
        S('update'.$this->models['area'],true);     //设置部门缓存更新
        return $result;
    }
    //获取自身展示部门
    public function all_user_area($type)
    {
        $db = D($this->models['area']);
        $userarea = $this->m_userarea(session('empid'));
        if(!in_array(session('areaid'), $userarea)){
            $userarea[] = session('areaid');
        }
        $data_f = array();
        $data_s = array();
        if(!empty($userarea)){
            $where['areaid'] = array('in',$userarea);
            if(isset($type)){
                $where['type'] = $type;
                $where['code'] = '';
            }
            $data_f = $db->where($where)->select();
        }
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
            $l_arr = ['areaid','areaname','fatherareaid','areaid'];
            //$L_attributes 额外需要保存的信息
            $L_attributes = ['areacode','rperson','rphone','type','code'];
            $icons = ['icon-application_xp_terminal','icon-application'];
            $data_tree = $this->formatTree($ids,$data,$l_arr,$L_attributes,'',$icons,$noclose);
        }else{
            $data_tree = array();
        }
        $this->ajaxReturn(g2us($data_tree));
    }
    /**
     * 获取当前用户管理部门
     * @param boolean $new  是否最新数据 true是  false否
     * @return array easyui-tree
     */
    public function tree_list($new=false)
    {
        if(!S(session('user').'area') || $new){
            $db = D($this->models['area']);
            $data = $this->all_user_area();
            $ids = array(0);
            //$l_arr 保存菜单的一些信息  0-id  1-text 2-iconCls 3-fid 4-odr
            $l_arr = ['areaid','areaname','fatherareaid','areaid'];
            //$L_attributes 额外需要保存的信息
            $L_attributes = ['areacode','rperson','rphone','type','code'];
            $icons = ['icon-application_xp_terminal','icon-application'];
            $noclose = $db->where('fatherareaid = 0')->getField('areaid',true);
            $data_tree = $this->formatTree($ids,$data,$l_arr,$L_attributes,'',$icons,$noclose);
            S(session('user').'area',$data_tree,5*60);
        }else{
            $data_tree = S(session('user').'area');
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
     * @param  int $mooDarea 部门ID
     * @return array
     */
    public function show_sat_area($moodArea)
    {
        //显示的树
        $currentUserAreas = $this->all_user_area();
        $userAreas = array();
        foreach ($currentUserAreas as $currentUserArea) {
            $userAreas[] = $currentUserArea['areaid'];
        }
        $areaids = array();
        if(session('userarea') != ''){
            $areaids = explode(',',session('userarea'));
        }
        $areadb = D($this->models['area']);
        $parent = array(0);             //父级部门ID
        if($moodArea != ''){
            $where['areaid'] = $moodArea;
            $parent = (array)$areadb->where($where)->getField('fatherareaid');
            $show = $this->carea($moodArea);
            //需要查询的数据
            $areaids = array_intersect($show,$areaids);
            //页面需要显示的数据
            $userAreas = array_intersect($show,$userAreas);
        }
        $areas = array();
        $areas['areaids'] = $areaids;
        $areas['userAreas'] = $userAreas;
        return $areas;
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
}