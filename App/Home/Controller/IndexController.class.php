<?php
namespace Home\Controller;

class IndexController extends CommonController {
    protected $models = ['area'=>'Enforce\AreaDep',
                         'role'=>'Enforce\Role',
                         'user'=>'Enforce\User',
                         'employee'=>'Enforce\Employee',
                         'menu'=>'Enforce\Menu'];
    protected $actions = ['menu'=>'Menu'];
    protected $logContent = '平台系统';
    public function index()
    {
        if(!(session('role'))){
            $this->redirect('Index/login');
            exit;
        }
        /*$dir = LOG_PATH.'Home/';     //需要删除的目录
        if(!is_dir($dir))   mkdir($dir);
        $this->del_dir($dir);*/
        //$name = M('functionreg')->getField('funname');
        $action = A($this->actions['menu']);
    	$menus = $action->getFunList();
        // $this->ajaxReturn(json_encode(g2us($menus)));
    	$this->assign('menuData',json_encode(g2us($menus)));

        $this->display();
    }

    public function login()
    {
        $this->display('login');
    }
    //验证登陆
    public function check_login()
    {
        if(IS_POST){
            $result = array();
            $result['status'] = false;
            $result['message'] = '验证失败';
            //警员验证
            $where['code'] = I('username');
            $where['password'] = I('password');
            $empDb = D($this->models['employee']);
            $roleDb = D($this->models['role']);
            $areaDb = D($this->models['area']);
            $res = $empDb->where($where)->find();
            if($res){
                if($res['login'] == 0){
                    $result['message'] = '你无法在该平台进行登录！';
                    $this->ajaxReturn($result);
                }
                if($res['bindingip'] == 1){
                    $ip = get_client_ip();
                    if($ip != $res['clientip']){
                       $result['message'] = '请在指定IP登录';
                       $this->ajaxReturn($result);
                    }
                }
                $roleData = $roleDb->where('roleid = '.$res['roleid'])->field('rolename,functionlist,level')->find();
                $roleData = g2us($roleData);
                $areaData = $areaDb->where('areacode="'.$res['areacode'].'"')->find();
                $mangerArea = $this->real_manger_area($res['userarea'], $res['dept_role_id']);
                if($roleData['level'] == 0) $mangerArea = 'all';    //如果是系统管理员直接监管所有的部门
                session('mangerArea',$mangerArea);          //实际管理部门
                session('areaid',$areaData['areaid']);           //部门ID
                session('area_is_read',$areaData['is_read']);   //部门属性
                //session('area_type',$areaData['type']);   //部门类型
                session('role',$roleData['rolename']);      //角色姓名
                session('menu',$roleData['functionlist']);  //菜单
                session('user',g2u($res['name']));          //警员姓名
                session('areacode',$res['areacode']);       //部门代码
                session('areaname',g2u($areaData['areaname']));  //部门名称
                session('roleid',$res['roleid']);           //角色ID
                session('rolelevel',$roleData['level']);    //角色级别
                session('code',I('username'));          //警员编号
                session('empid',$res['empid']);         //警员ID
                session('userarea',$res['userarea']);   //管理部门
                //更新在线时间
                $where['code'] = session('code');
                $data['online_time'] = date('Y-m-d H:i:s');
                $empDb->where($where)->save($data);

                $result['status'] = true;
                $result['message'] = '验证成功';
            }else{
                $result['message'] = '用户名，密码错误';
            }
            $this->write_log('登录');
            $this->ajaxReturn($result);
        }
    }
    //登出
    public function loginOut()
    {
        $this->write_log('登出');
        session(null);
        $this->redirect('Index/login');
    }
    //更新在线时间
    public function update_emp_time($request)
    {
        $db = D($this->models['employee']);
        $where['code'] = session('code');
        $data['online_time'] = date('Y-m-d H:i:s');
        $res = $db->where($where)->save($data);
        $total = $db->count('empid');
        $empWhere['online_time'] = array('EGT',date('Y-m-d H:i:s',time()-5*60));
        $online = $db->where($empWhere)->count();
        return compact('total','online');
    }
    //修改密码
    public function change_password()
    {
        $newPassword = I('newpassword');
        $result['status'] = false;
        $empDb = D($this->models['employee']);
        $where['code'] = session('code');
        $data['password'] = I('newpassword');
        $res = $empDb->where($where)->save($data);
        if($res){
            $result['status'] = true;
        }else{
            $result['message'] = '新密码与原密码一致修改失败';
        }
        $this->ajaxReturn($result);
    }
    public function home()
    {
        if(session('rolelevel') == 4){
            $this->display('home4');
        }elseif(session('rolelevel') == 3){
             $this->display('home3');
        }else{
            $this->display();
        }
    }
}