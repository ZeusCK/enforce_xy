<?php
namespace Home\Controller;

class EmployeeController extends CommonController
{
    //表的表名-自增主键
    protected $tab_id = 'empid';
    protected $models = ['role'=>'Enforce\Role',            //角色
                         'employee'=>'Enforce\Employee',    //警员
                         'area'=>'Enforce\AreaDep'];           //部门
    protected $actions = ['area'=>'Area',
                          'role'=>'Role',
                          'user'=>'User'];
    protected $views = ['index'=>'employee',
                        'showEmpPhoto'=>'showEmpPhoto'];
    protected $logContent = '系统管理/警员管理';
    //展示
    public function index()
    {
        $action = A($this->actions['area']);
        //如果没有
        $areaTree = $action->tree_list();

        $rootId = !empty($areaTree) ? $areaTree[0]['id'] : 0;
        $rootName = !empty($areaTree) ? g2u($areaTree[0]['text']) : '系统根部门';
        $this->assign('areaid',$rootId);
        $this->assign('areaname',$rootName);
        $this->assignInfo();
        $this->display($this->views['index']);
    }
   	public function showEmpPhoto()
    {
   		$action = A($this->actions['area']);
        //如果没有
        $areaTree = $action->tree_list();
        $rootId = !empty($areaTree) ? $areaTree[0]['id'] : 0;
        $rootName = !empty($areaTree) ? g2u($areaTree[0]['text']) : '系统根部门';
        $this->assign('areaid',$rootId);
        $this->assign('areaname',$rootName);
        $this->assignInfo();
        $this->display($this->views['showEmpPhoto']);
   	}
    /**
     * 获取登录用户管理警员的信息 若带有部门id则检索出最终能管理的警员
     * @param  string $areaid 部门ID
     * @return array
     */
    public function get_manger_emp($areaid='')
    {
        $data = array();
        $db = D($this->models['employee']);
        //如果拥有管理区月
        if(session('userarea') != ''){
            $where['areaid'] = array('in',explode(',',session('userarea')));
            $data = $db->where($where)->getField('code',true);
        }
        //如果是警员用户 加上自身的信息
        if(session('code') && !in_array(session('code'),$data))  $data[] = session('code');
        //如果有部门ID  进行检索 找出最终能显示的警员信息
        $res = array();
        if($areaid != ''){
            $action = A($this->actions['area']);
            //加上检索部门
            $areas = $action->carea($areaid);
            //实际管理部门
            $reallyareas = array_intersect(explode(',', session('userarea')),$areas);
            if(!empty($reallyareas)){
                $where['areaid'] = array('in',$reallyareas);
                $codes = $db->where($where)->getField('code',true);
                if(in_array(session('areaid'),$areas) && !in_array(session('code'),$codes))  $codes[] = session('code');
                //查询区域没有数据直接返回空数组
                if(empty($codes)){
                    return $res;
                }else{
                    //检索出来的，与实际能管理的
                    $data = array_intersect((array)$codes,$data);
                }
            }else{
                //若自身所属区域不在查询区域内
                if(!in_array(session('areaid'),$areas)) return $res;
            }
        }
        $request['code'] = array('in',$data);
        //最终的警员信息
        if(!empty($data))  $res = $db->where($request)->getField('code,empid,name');
        return $res;
    }
    //数据获取
    public function dataList()
    {
        $request = I();
        $page = I('page');
        $rows = I('rows');
        unset($request['page'],$request['rows'],$request['rand']);
        if(!empty($request)){
            foreach($request as $key=>$value){
                if($key != 'areaid'){
                    $check[$key] = array('like','%'.u2g($value).'%');
                }
            }
        }
        $dbc = D($this->models['area']);
        $areas = $dbc->getField('areaid,areaname');
        $db = D($this->models['employee']);
        $emps = $this->get_manger_emp(I('areaid'));
        $roledb = D($this->models['role']);
        $roles = $roledb->getField('roleid,rolename');
        $allowCodes = array_keys($emps);
        if(!empty($allowCodes)){
            $check['code'] = array('in',$allowCodes);
        }else{
            $check['code'] = '';
        }
        $order = 'areaid asc,level asc';
        $fields = 'e.*';
        $check[] = 'e.roleid = r.roleid';
        $rows = $db->table('employee as e,role as r')->field($fields)->where($check)->page($page,$rows)->order($order)->select();
        $total = $db->table('employee as e,role as r')->field($fields)->where($check)->order($order)->count('empid');
        $res['total'] =  $total;
        $res['rows'] =  $rows ? $rows : [];
        foreach ($res['rows'] as &$value){
            $value['areaname'] = array_key_exists($value['areaid'],$areas) ? $areas[$value['areaid']]  : u2g('系统根部门');
            $value['rolename'] = $roles[$value['roleid']];
        }
        $this->saveExcel($res); //监测是否为导出
        $this->ajaxReturn(g2us($res));
    }
    //增加事件
    public function dataAdd()
    {
        $request = I();
        unset($request['empid']);
        if($_FILES['photo']['name']){
            $res = $this->save_image($_FILES['photo']);
            if($res){
                $request['photo_path'] = $res;
            }else{
                $info = '照片保存失败，可能原因服务器权限不足，';
            }
        }
        $request['password'] = I('code');           //登录密码 默认为警号
        $db = D($this->models['employee']);
        if($db->where('code ="'.$request['code'].'"')->find()){
            $result['message'] = '该警员已经录入！';
            exit(json_encode($result));
        }
        $c_area = explode(',', session('userarea'));
        if(in_array($request['areaid'],$c_area)){
            $result = $db->getTableAdd(u2gs($request));
            if(array_key_exists('add_id',$result))  $this->add_emp_area($result['add_id']);
        }else{
            $result['message'] = '对不起，你无法向该部门添加警员！因为该部门不在你的管辖范围，或者不全在管辖范围';
        }
        if($info)  $result['message'] .= $info;
        $this->write_log('添加'.$request['name']);
        exit(json_encode($result));
    }
    //删除事件
    public function dataRemove()
    {
        $request = I();
        $db = D($this->models['employee']);
        if($request[$this->tab_id] == ''){
            $result['message'] = '删除数据不能为空';
            $this->ajaxReturn($result);
        }
        $where = $this->tab_id.' in('.$request[$this->tab_id].')';
        $photos = $db->where($where)->getField('photo_path',true);
        foreach ($photos as  $photo) {
            unlink('..'.$photo);
        }
        //删除初始表数据
        $result = $db->getTableDel($where);
        $this->write_log('删除警员');
        $this->ajaxReturn($result);
    }
    //编辑事件
    public function dataEdit()
    {
        $request = I();
        $db = D($this->models['employee']);
        if($_FILES['photo']['name']){
            $res = $this->save_image($_FILES['photo']);
            $info = $res;
            if($res){
                $request['photo_path'] = $res;
                //照片更新时删除原来的照片
                $photoPath = $db->where('empid = '.$request['empid'])->getField('photo_path');
                unlink('..'.$photoPath);
            }else{
                $info = '照片保存失败，可能原因服务器权限不足，';
            }
        }
        $request = u2gs($request);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $result = $db->getTableEdit($where,$request);
        $roleid = $db->where('empid = '.$request['empid'])->getField('roleid');
        if($roleid != $request['roleid'])       //如果角色ID改变那么重新计算
            $this->add_emp_area($request['empid']);
        exit(json_encode($result));
    }
    //准备前端页面数据
    public function assignInfo()
    {
        $db = D($this->models['area']);
        $info['areareg'] = $db->select();
        $info['areareg'] = g2us($info['areareg']);
        $info['arearegJson'] = json_encode(g2us($info['areareg']));
        $action = A($this->actions['role']);
        //警员记录
        $info['role'] = $action->get_role_info()['rows'];
        $info['role'] = g2us($info['role']);
        $info['roleJson'] = json_encode($info['role']);
        $this->assign('info',$info);
    }
    /**
     * 保存图片
     * @param  array $file    包含图片的所有信息
     * @param  string $imagename 保存图片名
     * @return string          保存结果
     */
    public function save_image($file)
    {
        //2w张分目录
        $upload = new \Think\Upload(); //实例化上传类
        $upload->maxSize = 3145728; //设置附件上传大小
        $upload->exts = array('jpg', 'gif', 'png', 'jpeg','ico'); //设置附件上传类型
        $rootPath = explode(str_replace('/','',__ROOT__),__FILE__)[0].'upload/';
        $upload->autoSub = false;
        //$upload->subName = ''; //设置上传子目录
        $upload->replace = true; //设置是否覆盖上传文件
        //$upload->saveName = $imagename; //设置上传文件名
        $upload->rootPath = $rootPath; //设置上传文件位置
        //$upload->savePath = (string)$subName; // 设置附件上传目录
        // 上传文件
        if(!is_dir($rootPath)) mkdir($rootPath);
        $result = $upload->uploadOne($file);
        return $result ? '/upload/'.$result['savepath'].$result['savename'] : false;  //$upload->getError();
    }
    /**
     * 显示警员管理的部门
     * @param  int $empid 警员ID
     * @return
     */
    public function show_emp_manger_area()
    {
        $empid  = I('empid');
        $action = A($this->actions['area']);
        $empdb = D($this->models['employee']);
        $areaid = $empdb->where('empid='.$empid)->getField('areaid');
        $careas = $action->carea($areaid);
        $pareas = $action->parea($areaid,true);
        $areas = array_merge($careas,$pareas);
        $db = D($this->models['area']);
        $where['areaid'] = array('in',$areas);
        $areas = $db->where($where)->select();
        $ids = array(0);
        //$l_arr 保存菜单的一些信息  0-id  1-text 2-iconCls 3-fid 4-odr
        $l_arr = ['areaid','areaname','fatherareaid','areaid'];
        //$L_attributes 额外需要保存的信息
        //$L_attributes = ['arearcode','rperson','rphone'];
        $icons = ['icon-application_xp_terminal','icon-application'];
        $noclose = $db->where('fatherareaid = 0')->getField('areaid',true);
        $checks = $empdb->where('empid='.$empid)->getField('userarea');
        $checks = explode(',',$checks);
        $data_tree = $this->formatTree($ids,$areas,$l_arr,'',$checks,$icons,$noclose);
        $this->ajaxReturn(g2us($data_tree));
    }
    /**
     * 保存员工的权限信息
     * @param
     * @return
     */
    public function save_other_info()
    {
        $request = I();
        $in_fact_areas = '';
        //如果分配部门
        if($request['userarea']){
            //用户所属部门的下级部门
            $empid  = I('empid');
            $action = A($this->actions['area']);
            $empdb = D($this->models['employee']);
            $areaid = $empdb->where('empid='.$empid)->getField('areaid');
            $careas = $action->carea($areaid);
            if(empty($careas)){
                $message = ',经权限核验，该警员并没有可管理下级部门';
            }else{
                //登录用户的管理权限
                $userareas = explode(',',session('userarea'));
                $fontareas = explode(',',$request['userarea']);
                //计算出 前端传值与登录用户和警员所属部门的交集等到最终的结果
                $mangerAreas = array_intersect($fontareas,$userareas,$careas);

                if(empty($mangerAreas)){
                    $message = ',经权限核验，该警员并没有可管理下级部门';
                }else{
                    $in_fact_areas = implode(',',$mangerAreas);
                }
            }
        }
        $db = D($this->models['employee']);
        $data['userarea'] = $in_fact_areas;
        $data['bindingip'] = $request['bindingip'];
        $data['clientip'] = $request['clientip'];
        $where['empid'] = $request['empid'];
        $result = $db->getTableEdit($where,$data);
        if(isset($message)) $result['message'] .= $message;
        $this->ajaxReturn($result);
    }
    /**
     * 带警员的树
     * @param  array $areas 显示的树
     * @param  array $emps  显示的警员
     * @return array        easyui tree
     */
    public function emp_tree($areas,$emps)
    {
        $ids = array(0);
        //$l_arr 保存菜单的一些信息  0-id  1-text 2-iconCls 3-fid 4-odr
        $l_arr = ['areaid','areaname','fatherareaid','areaid'];
        //$L_attributes 额外需要保存的信息
        $L_attributes = ['arearcode','rperson','rphone'];
        $icons = ['icon-application_xp_terminal','icon-application'];
        $data_tree = $this->formatTree($ids,$areas,$l_arr,$L_attributes,'',$icons);
        $checkeds = ['areaid','empid','name'];
        $attributes = ['code','name'];
        $icon = 'icon-user';
        $empAreaTree = $this->add_other_info($data_tree,$emps,$checkeds,$icon,$attributes);
        return $empAreaTree;
    }
    /**
     *获取带有警员的tree
     * @return
     */
    public function show_employee()
    {
        session_write_close();
        if(S(session('user').'emp_tree')){
            $this->ajaxReturn(S(session('user').'emp_tree'));
        }
        $empDb = D($this->models['employee']);
        $where['code'] = session('code');
        $empInfo = $empDb->where($where)->find();
        //判断该警员是否拥有管理部门的权限
        if($empInfo['userarea'] != ''){
            $mangerareas = explode(',',$empInfo['userarea']);
        }
        $nowareaid = $mangerareas ? $mangerareas : array();
        $nowareaid[] = $empInfo['areaid'];
        $areaDb = D($this->models['area']);
        $request['areaid'] = array('in',$nowareaid);
        $areaInfo = $areaDb->where($request)->select();
        $l_arr = ['areaid','fatherareaid'];
        //选出所有需要展示的部门
        $areas = $this->getParentData($areaInfo,$this->models['area'],$l_arr);
        $areas = array_merge((array)$areaInfo,(array)$areas);
        $emps = array();
        //所有需要显示的警员
        if($mangerareas){
            $areawhere['areaid'] = array('in',$mangerareas);
            $emps = $empDb->where($areawhere)->select();
        }
        if(!in_array(session('areaid'),$mangerareas) && session('areaid') != 0){
            $emps[] = $empInfo;
        }
        $empAreaTree = $this->emp_tree($areas,$emps);
        S(session('user').'emp_tree',g2us($empAreaTree),5*60);
        $this->ajaxReturn(S(session('user').'emp_tree'));
    }
    //更新警员的部门
    public function update_emp_area()
    {
        $empid = I('empid');
        $result = array();
        if($this->add_emp_area($empid)){
            $result['status'] = true;
            $result['message'] = '更新成功';
        }else{
            $result['status'] = false;
            $result['message'] = '更新失败,可能原因管理部门并未发生变化';
        }
        $this->ajaxReturn($result);
    }
    /**
     * 根据警员id，自动添加管理区域
     * @param int $empid  警员ID
     * @return boolean 成功或失败
     */
    public function add_emp_area($empid)
    {
        $empdb = D($this->models['employee']);
        $areadb = D($this->models['area']);
        $roledb = D($this->models['role']);
        $empInfo = $empdb->where('empid='.$empid)->find();
        $roleInfo = $roledb->where('roleid='.$empInfo['roleid'])->find();
        $data = array('userarea'=>'');
        if($roleInfo['level'] == 4)
            return $empdb->where('empid='.$empid)->save($data) ? true : false;

        $areaInfo = $areadb->where('areaid='.$empInfo['areaid'])->find();
        //自身加上子集
        $areaAction = A($this->actions['area']);
        $careas = $areaAction->carea($areaInfo['areaid']);
        //$this->ajaxReturn(g2us($empInfo));
        if($areaInfo['type'] != 0){            //如果不是交警部门
            if($roleInfo['level'] == 0 || $roleInfo['level'] == 1){      //系统管理员,市局管理员,拥有全部
                $careas = $areadb->getField('areaid',true);             //拥有全部权限
            }else{
                $other = $this->get_link_area($careas);
                $careas = array_merge($careas,$other);
                /*if($areaInfo['code'] != ''){        //如果该部门拥有标识代码
                    $areawhere = array('code'=>$areaInfo['code'],'type'=>0);
                    $extraAreaInfo = $areadb->where($areawhere)->find();
                    if($extraAreaInfo){
                        $cpeareas = $areaAction->carea($extraAreaInfo['areaid']);     //交警部门的子集
                        $careas = array_unique(array_merge($careas,$cpeareas));
                    }
                }*/
            }
        }
        $data['userarea'] = implode(',',$careas);
        return $empdb->where('empid='.$empid)->save($data) ? true : false;
    }
    /**
     * 得到所有相关联的部门
     * @param  array $areas 需要进行关联的部门
     * @return array        关联的部门
     */
    public function get_link_area($areas)
    {
        if($areas == '' || empty($areas)) return array();
        $areadb = D($this->models['area']);
        $query[] = $this->where_key_or($areas,'areaid');
        $query['code'] = array('<>','');
        $codes = $areas->where($query)->getField('code',true);      //获取不为空的所有codes
        $tp_query[] = $this->where_key_or($codes,'code');
        $tp_query['type'] = 0;                                      //获取相关交警
        $tp_area = $areadb->where($tp_query)->getField('areaid',true);
        $allAreas = array();
        $areaAction = A($this->actions['area']);
        foreach ($tp_area as $value) {
            $allAreas = array_merge((array)$areaAction->carea($value),$allAreas);
        }
        return array_unique($allAreas);
    }
    /**
     * 调阅的树
     */
    public function show_apply_tree()
    {
        session_write_close();
        if(S(session('user').'apply_tree')){
            $this->ajaxReturn(S(session('user').'apply_tree'));
        }
        $areaDb = D($this->models['area']);
        //调阅的警员不是超级管理员
        if(session('areaid') != 0){
            $parentId = $areaDb->where('areaid='.session('areaid'))->getField('fatherareaid');
            $areaAction = A($this->actions['area']);
            //获取上级部门所有信息 不包含自身
            $pareas = $areaAction->parea($parentId);
            //获取下级部门所有信息 包含自身  会显示这之下的所有警员
            $careas = $areaAction->carea($parentId,true);
            //合并需要显示的树
            $areas = array_merge($pareas,$careas);
        }else{
            $areas = explode(',', session('userarea'));
        }
        $areawhere[] = $this->where_key_or($areas,'areaid');
        $allareas = $areaDb->where($areawhere)->select();

        $allowareas = array();
        if(isset($careas)){
            foreach ($careas as $value) {
                $allowareas[] = $value;
            }

        }else{
            foreach ($areas as $value) {
                $allowareas[] = $value;
            }
        }

        //查询需要显示的警员
        $empDb = D($this->models['employee']);
        $where[] = $this->where_key_or($allowareas,'areaid');
        $emps = $empDb->where($where)->select();
        $empAreaTree = $this->emp_tree($allareas,$emps);
        S(session('user').'apply_tree',g2us($empAreaTree),5*60);
        $this->ajaxReturn(S(session('user').'apply_tree'));
    }
}