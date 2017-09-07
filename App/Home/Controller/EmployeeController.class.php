<?php
namespace Home\Controller;

class EmployeeController extends CommonController
{
    //表的表名-自增主键
    protected $tab_id = 'empid';
    protected $models = ['pebase'=>'Enforce\PeBase',        //执法记录仪
                         'role'=>'Enforce\Role',            //角色
                         'dept_role'=>'Enforce\DeptRole',   //部门角色
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
        $this->assignInfo();
        $this->display($this->views['index']);
    }
   	public function showEmpPhoto()
    {
   		$action = A($this->actions['area']);
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
        $request = I('');
        $page = I('page');
        $rows = I('rows');
        unset($request['page'],$request['rows'],$request['rand']);
        if(!empty($request)){
            foreach($request as $key=>$value){
                if($key != 'areaid' && $key != 'areacode' && $key != 'code'){
                    $check[$key] = array('like','%'.u2g($value).'%');
                }
            }
        }
        $dbc = D($this->models['area']);
        $areas = $dbc->getField('areacode,areaname');
        $db = D($this->models['employee']);
        $deptroledb = D($this->models['dept_role']);
        $deptroles = $deptroledb->getField('dept_role_id,rolename');
        $check[] = $this->get_manger_sql(I('areacode'),'areacode','code').' OR areacode = ""';
        if($request['code']) $check['code'] = $request['code'];
        $roledb = D($this->models['role']);
        $roles = $roledb->getField('roleid,rolename');
        $order = 'areacode asc,level asc';
        $fields = 'e.*';
        $check[] = 'e.roleid = r.roleid';
        $rows = $db->table('employee as e,role as r')->field($fields)->where($check)->page($page,$rows)->order($order)->select();
        $total = $db->table('employee as e,role as r')->field($fields)->where($check)->order($order)->count('empid');
        $res['total'] =  $total;
        $res['rows'] =  $rows ? $rows : [];
        $empl_qualify_type = $this->get_val_item('dictionary','empl_qualify');
        foreach ($res['rows'] as &$value){
            $value['areaname'] = array_key_exists($value['areacode'],$areas) ? $areas[$value['areacode']]  : u2g('系统根部门');
            $value['rolename'] = $roles[$value['roleid']];
            $value['empl_qualify_name'] = $empl_qualify_type[$value['empl_qualify']];
            $value['dept_role_name'] = array_key_exists($value['dept_role_id'],$deptroles) ? $deptroles[$value['dept_role_id']]  : u2g('无');;
        }
        $this->saveExcel($res,'警员'); //监测是否为导出
        $this->ajaxReturn(g2us($res));
    }
    //根据部门获取具体部门的警员
    public function get_area_emp($request)
    {
        $where[] = $this->get_manger_sql($request['areacode'],'areacode','code');
        $where['areacode'] = $request['areacode'];
        $db = D($this->models['employee']);
        $rows = $db->where($where)->field('code,name')->select();
        return g2us($rows);
    }
    //增加事件
    public function dataAdd()
    {
        $request = I();
        $check[] = $this->get_manger_sql($request['areacode'],'areacode',false);
        $mangerCount = D($this->models['area'])->where($check)->count();
        if($mangerCount <= 0){
            $result['message'] = '对不起，你无法向该部门添加警员！因为该部门不在你的管辖范围，或者不全在管辖范围';
            exit(json_encode($result));
        }
        unset($request['empid']);
        if($_FILES['photo']['name']){
            $res = $this->save_image($_FILES['photo']);
            if($res){
                $request['photo_path'] = $res;
            }else{
                $info = '照片保存失败，可能原因服务器权限不足，';
            }
        }
        $request['password'] = '123456';           //登录密码 默认为警号
        $db = D($this->models['employee']);
        if($db->where('code ="'.$request['code'].'"')->find()){
            $result['message'] = '该警员已经录入！';
            exit(json_encode($result));
        }
        $request['create_user'] = session('user');
        $request = u2gs($request);
        $result = $db->getTableAdd($request);
        if($result['status']){
            //做数据同步
            $syncData[] = $request;
            $this->sync('employee',$syncData,'add');
        }
        if($result['status']) $this->add_emp_area($result['add_id']);
        if($info)  $result['message'] .= $info;
        $this->write_log('添加'.g2u($request['name']).'('.$request['code'].')');
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
        //做数据同步
        $syncData = $db->where($where)->select();
        //删除初始表数据
        $result = $db->getTableDel($where);
        if($result['status']){
            $this->sync('employee',$syncData,'del');
        }
        $info = implode(',',g2us(array_column($syncData,'name')));
        $this->write_log('删除警员-'.$info);
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
        $empInfo = $db->where('empid = '.$request['empid'])->find();
        // error_log($roleid.'-'.$request['roleid'],3,'error.log');
        $result = $db->getTableEdit($where,$request);
        if($result['status']){
            $request['old_code'] = $empInfo['code'];
            $syncData[] = $request;
            $this->sync('employee',$syncData,'edit');
        }
        if($empInfo['roleid'] != $request['roleid']) $this->add_emp_area($request['empid']); //如果角色ID改变那么重新计算
        $this->write_log('编辑警员-'.g2u($empInfo['name']));
        exit(json_encode($result));
    }
    public function initPwd($request)
    {
        $db = D($this->models['employee']);
        $where['empid'] = $request['empid'];
        $request['password'] = '123456';
        $empInfo = $db->where($where)->find();
        $result = $db->getTableEdit($where,$request);
        if($result['status']){
            $request['code'] = $empInfo['code'];
            $syncData[] = $request;
            $this->sync('employee',$syncData,'edit');
            $this->write_log('初始化密码-'.$request['code']);
            $result['message'] = '初始化密码成功';
        }else{
            $result['message'] = '初始化密码失败';
        }
        return $result;
    }
    public function emp_bind($request)
    {
        $where['empid'] = $request['empid'];
        $db = D($this->models['employee']);
        $request = u2gs($request);
        if($request['action'] == 'bind'){
            unset($request['empid']);
            unset($request['action']);
        }else{
            $request['areaname'] = $request['areacode'] = '';
        }
        $empInfo = $db->where($where)->find();
        $result = $db->getTableEdit($where,$request);
        if($result['status']){
            $request['code'] = $empInfo['code'];
            //执法记录仪一起变更
            $pedb = D($this->models['pebase']);
            $pewhere['jybh'] = $empInfo['code'];
            $peData['areacode'] = $request['areacode'];
            $peData['areaname'] = $request['areaname'];
            $cpxh = $pedb->where($pewhere)->getField('cpxh');
            $pedb->where($pewhere)->save($peData);
            //警员
            $syncData[] = $request;
            $this->sync('employee',$syncData,'edit');
            //执法
            $peData['cpxh'] = $cpxh;
            $syncPeData[] = $peData;
            $this->sync('pe_base',$syncPeData,'edit');
        }
        return $result;
    }
    //准备前端页面数据
    public function assignInfo()
    {
        $action = A($this->actions['role']);
        $db = D($this->models['dept_role']);
        $info['dept_role'] = g2us($db->select());
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
        $userarea = explode(',', session('userarea'));
        if(!empty($userareas)){
            $areas = array();
        }else{
            $areas = $action->all_user_area();
        }
        $db = D($this->models['area']);
        //$where['areaid'] = array('in',$areas);
        //$areas = $db->where($where)->select();
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
            //用户单位的下级部门
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
                //计算出 前端传值与登录用户和警员单位的交集等到最终的结果
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
        $L_attributes = ['areacode','rperson','rphone'];
        $icons = ['icon-application_xp_terminal','icon-application'];
        $data_tree = $this->formatTree($ids,$areas,$l_arr,$L_attributes,'',$icons);
        $checkeds = ['areacode','empid','name'];
        $attributes = ['code','name'];
        $icon = 'icon-user';
        $idField = 'areacode';
        $empAreaTree = $this->add_other_info($data_tree,$emps,$checkeds,$icon,$attributes,$idField);
        return $empAreaTree;
    }
    /**
     *获取带有警员的tree
     * @return
     */
    public function show_employee()
    {
        if(S(session('user').'emp_tree')){
            $this->ajaxReturn(S(session('user').'emp_tree'));
        }
        $empDb = D($this->models['employee']);
        $action = A($this->actions['area']);
        $areas = $action->all_user_area();
        $emps = array();
        $where[] = $this->get_manger_sql();
        $emps = $empDb->where($areawhere)->select();
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
        $roledb = D($this->models['role']);
        $empInfo = $empdb->where('empid='.$empid)->find();
        $roleInfo = $roledb->where('roleid='.$empInfo['roleid'])->find();
        if($roleInfo['level'] == 4){     //警员
            $data = array('userarea'=>'');
        }else{          //其他
            $data = array('userarea'=>$empInfo['areacode']);
        }
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
        $query['code'] = array('NEQ','');
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
    //导入警员的excel
    public function import_excel()
    {
        $func = A('Function');
        $db = D($this->models['employee']);
        $where[] = $this->get_manger_sql('','areacode',false);
        $area_code_name = D($this->models['area'])->where($where)->getField('areacode,areaname');
        $area_code_read = D($this->models['area'])->where($where)->getField('areacode,is_read');
        $area_name_code = array_flip($area_code_name);
        $empl_qualify_type = array_flip($this->get_val_item('dictionary','empl_qualify'));

        $role_id_name = D($this->models['role'])->getField('rolename,roleid');
        $role_id_level = D($this->models['role'])->getField('roleid,level');
        $deptrole_name_id = D($this->models['dept_role'])->getField('rolename,dept_role_id');
        $empl_qualify_name_value = D($this->models['dept_role'])->getField('rolename,dept_role_id');
        // $dept_role = D($this->models['de']);
        $role_level_id = array_flip($role_id_level);
        $code_arr = array_keys($area_code_name);
        $res = $func->save_upload($_FILES['file'],array('xls','xlsx'));
        $key_code = array();
        $name_code = array('警员警号'=>'code',
                           '单位'=>'areaname',
                           '姓名'=>'name',
                           '所属角色'=>'roleid',
                           '备注'=>'remark',
                           '性别'=>'sex',
                           '电话'=>'phone',
                           '部门角色'=>'dept_role_id',
                           '执法资格'=>'empl_qualify');
        $allow = 0; //允许导入
        $deny = 0;  //禁止导入
        $success = 0;   //成功导入
        $fail = 0;      //失败导入
        if($res){
            $data = $func->read_excel($res);
            $header = array_shift($data);
            foreach ($header as $key => $value) {
                if(array_key_exists($value,$name_code)){
                    $key_code[$key] = $name_code[$value];
                }
            }
            $allData = array();
            $syncUpdateData = array();
            $syncAddData = array();
            foreach ($data as $value) {
                $saveData= array();
                foreach ($value as $k => $val) {
                    $val = $val === null ? '' : $val = trim(u2g($val));
                    if(!array_key_exists($k,$key_code)) continue;
                    if($key_code[$k] == 'areaname'){
                        if(!in_array($val,$area_code_name)){
                            $deny++;
                            continue;
                        }else{
                            $saveData['areacode'] = $area_name_code[$val];
                            $allow++;
                        }
                    }
                    if($key_code[$k] == 'roleid'){             //设置警员属性
                        $saveData[$key_code[$k]] = $role_id_name[$val];
                        continue;
                    }
                    if($key_code[$k] == 'dept_role_id'){
                        $saveData[$key_code[$k]] = array_key_exists($val,$deptrole_name_id) ? array_key_exists($val,$deptrole_name_id) : 0;
                        continue;
                    }
                    if($key_code[$k] == 'empl_qualify'){
                        $saveData[$key_code[$k]] = array_key_exists($val,$empl_qualify_type) ? array_key_exists($val,$empl_qualify_type) : 0;
                        continue;
                    }
                    $saveData['password'] = '123456';
                    $saveData[$key_code[$k]] = $val;
                }

                $level = array_key_exists($saveData['roleid'],$role_id_level) ? $role_id_level[$saveData['roleid']] : 4;
                if($saveData['roleid'] == '') $saveData['roleid'] = $role_level_id[$level];           //如果没有角色
                if($level == 1 || $level == 2 || $level == 3) $saveData['userarea'] = $saveData['areacode'];
                if($area_code_read[$saveData['areacode']] == 0) $saveData['login'] = 0;
                $empInfo = $db->where('code="'.$saveData['code'].'"')->find();
                if($empInfo){
                    $res = $db->where('code="'.$saveData['code'].'"')->save($saveData);
                    $syncUpdateData[] = $saveData;
                }else{
                    $res = $db->add($saveData);
                    $syncAddData[] = $saveData;
                }
                $res ? $success++ : $fail++;
            }
            $result['message'] = '允许导入：'.$allow.'<br>'.'禁止导入：'.$deny.'<br>'.'成功导入：'.$success.'<br>'.'导入失败：'.$fail.'<br>';
            $this->write_log($result['message']);
            $this->sync('employee',$syncUpdateData,'edit');
            $this->sync('employee',$syncAddData,'add');
        }else{
             $result['message'] = '文件上传失败，可能原因文件类型不对，服务器权限不足，文件超过2M';
        }
        exit(json_encode($result));
    }
}
