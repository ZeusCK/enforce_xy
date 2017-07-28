<?php
namespace Home\Controller;

class IndexController extends CommonController {
    protected $models = ['area'=>'Enforce\Area',
                         'role'=>'Enforce\Role',
                         'user'=>'Enforce\User',
                         'employee'=>'Enforce\Employee',
                         'menu'=>'Enforce\Menu'];
    protected $actions = ['menu'=>'Menu'];
    protected $logContent = '平台系统';
    public function index()
    {
        if(!(session('?role'))){
            $this->redirect('Index/login');
            exit;
        }
        /*$dir = LOG_PATH.'Home/';     //需要删除的目录
        if(!is_dir($dir))   mkdir($dir);
        $this->del_dir($dir);*/
        //$name = M('functionreg')->getField('funname');
        $action = A($this->actions['menu']);
    	$menus = $action->getFunList();
    	$this->assign('menus',g2us($menus));
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
            $res = $empDb->where($where)->find();
            if($res){
                if($res['bindingip'] == 1){
                    if($ip != $res['clientip']){
                       $res['message'] = '请在指定IP登录';
                       $this->ajaxReturn($result);
                    }
                }
                $roleData = $roleDb->where('roleid = '.$res['roleid'])->field('rolename,functionlist,level')->find();
                $roleData = g2us($roleData);
                session('areaid',$res['areaid']);
                session('role',$roleData['rolename']);
                session('menu',$roleData['functionlist']);
                session('user',g2u($res['name']));
                session('roleid',$res['roleid']);
                session('rolelevel',$roleData['level']);
                session('code',I('username'));
                session('empid',$res['empid']);
                session('userarea',$res['userarea']);
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
        $this->display();
    }
}