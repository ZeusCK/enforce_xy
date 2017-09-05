<?php
namespace Home\Controller;

class RoleController extends CommonController
{
    protected $tab_id = 'roleid';
    protected $models = ['role'=>'Enforce\Role',
                         'employee'=>'Enforce\Employee'];
    protected $views = ['index'=>'role'];
    protected $actions = ['menu'=>'Menu'];
    protected $logContent = '系统管理/角色管理';
    public function index()
    {
        $this->display($this->views['index']);
    }

    public function dataList()
    {
        $request = I();
        $page = I('page');
        $rows = I('rows');
        $request = u2gs($request);
        if($request['rolename']){
            $check['rolename'] = array('like','%'.$request['rolename'].'%');
        }
        $data = $this->get_role_info($check,$page,$rows);
        $level = ['系统','市局','县局','基层','警员','其他'];
        foreach ($data['rows'] as &$value) {
            $value['level_name'] = u2g($level[$value['level']]);
        }
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }

    public function get_role_info($check,$page,$rows)
    {
        $db = D($this->models['role']);
        //初始数据展示限制只显示自身和下级角色
        $check['level'] = array('EGT',session('rolelevel'));
        $order = 'level desc';
        return $db->getTableList($check,$page,$rows,$order);
    }
    public function dataAdd()
    {
        $request = I();
        $db = D($this->models['role']);
        $where['rolename'] = $request['rolename'];
        $request = u2gs($request);
        $request['roleid'] = $this->msectime();
        if($db->checkExistence($where)){
            $result['message'] = '角色已存在！换一个吧';
            $result['status']  = true;
        }else{
            $result = $db->getTableAdd($request);
        }
        if($result['status']){
            $syncData[] = $request;
            $this->sync('role',$syncData,'add');
            $this->write_log('添加'.u2g($request['rolename']));
        }
        $this->ajaxReturn($result);
    }

    public function dataRemove()
    {
        $request = I();
        $db = D($this->models['role']);
        $roles = explode(',',$request[$this->tab_id]);
        if(in_array(1, (array)$roles)){
            $result['message'] = '删除失败，无法删除系统内置的管理员！';
            $result['status']  = false;
            $this->ajaxReturn($result);
        }
        //检查外键表是否存在删除的角色
        $link_db = D($this->models['employee']);
        $check = $link_db->where("roleid in('".$request[$this->tab_id]."')")->select();
        if(!empty($check)){
            $result['message'] = '删除失败，请先删除分配有该角色的警员！';
            $result['status']  = true;
        }else{
            $where = $this->tab_id.' in('.$request[$this->tab_id].')';
            $result = $db->getTableDel($where);
            if($result['status']){
                $syncData = array();
                foreach ($roles as $value) {
                    $syncData[] = array('roleid'=>$value);
                }
                $this->sync('role',$syncData,'del');
                $this->write_log('删除角色');
            }
        }
        $this->ajaxReturn($result);
    }

    public function dataEdit()
    {
        $request = I();
        $db = D($this->models['role']);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $result = $db->getTableEdit($where,u2gs($request));
        if($result['status']){
            $syncData[] = array('roleid'=>$where[$this->tab_id]);
            $this->sync('role',$syncData,'edit');
        }
        $this->ajaxReturn($result);
    }
    //目标用户的权限 roleid
    public function roleMenu()
    {
        $request = I();
        $db = D($this->models['role']);
        $where[$this->tab_id] = $request[$this->tab_id];
        $menu = $db->where($where)->field('functionlist')->find();
        $menu = explode(',',$menu['functionlist']);
        $clientUserMenus = A($this->actions['menu'])->get_fun_data();
        $ids = [0];
        $l_arr = ['id','name','pid','ordernum'];
        $L_attributes = ['iconCls'=>'iconcls'];
        $tree = $this->formatTree($ids,$clientUserMenus,$l_arr,$L_attributes,$menu,array(),'all');
        $this->ajaxReturn(g2us($tree));
    }
    //保存权限
    public function saveMenu()
    {
        $request = I();
        $db = D($this->models['role']);
        /*$check['roleid'] = session('roleid');
        $fun = $db->where($check)->find();*/
        $userfun = explode(',', session('menu'));
        $putfun = explode(',', $request['functionlist']);
        //计算出权限赋值与当前用户实际拥有权限的交集
        $intersect = array_intersect($putfun,$userfun);
        $savefun['functionlist'] = implode(',', $intersect);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $result = $db->getTableEdit($where,$savefun);
        if($result['status']){
            $syncData[] = array('roleid'=>$request[$this->tab_id]);
            $this->sync('role',$syncData,'edit');
        }
        $this->ajaxReturn($result);
    }
}