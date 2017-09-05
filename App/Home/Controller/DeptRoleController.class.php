<?php
namespace Home\Controller;

class DeptRoleController extends CommonController
{
    protected $tab_id = 'dept_role_id';
    protected $models = ['dept_role'=>'Enforce\DeptRole',
                         'area'=>'Enforce\AreaDep',                 //部门
                         'employee'=>'Enforce\Employee'];
    protected $views = ['index'=>'role'];
    protected $actions = ['menu'=>'Menu'];
    protected $logContent = '系统管理/部门角色';
    public function index()
    {
        $this->display('dept_role');
    }

    public function dataList($request)
    {
        $page = $request['page'];
        $rows = $request['rows'];
        $request = u2gs($request);
        if($request['rolename']){
            $check['rolename'] = array('like','%'.$request['rolename'].'%');
        }
        $db = D($this->models['dept_role']);
        $order = 'rolename ASC';
        $data = $db->getTableList($check,$page,$rows,$order);
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }

    public function dataAdd($request)
    {
        $db = D($this->models['dept_role']);
        $request = u2gs($request);
        $where['rolename'] = $request['rolename'];
        $request['dept_role_id'] = $this->msectime();
        if($db->checkExistence($where)){
            $result['message'] = '角色已存在！换一个吧';
            $result['status']  = true;
        }else{
            $result = $db->getTableAdd($request);
        }
        if($result['status']){
            $syncData[] = $request;
            $this->sync('dept_role',$syncData,'add');
            $this->write_log('添加'.g2u($request['rolename']));
        }
        return $result;
    }

    public function dataRemove($request)
    {
        $db = D($this->models['dept_role']);
        $roles = explode(',',$request[$this->tab_id]);
        //检查外键表是否存在删除的角色
        $link_db = D($this->models['employee']);
        $check = $link_db->where("dept_role_id in('".$request[$this->tab_id]."')")->find();
        if(!empty($check)){
            $result['message'] = '删除失败，请先删除分配有该角色的警员！';
            $result['status']  = true;
        }else{
            $where[$this->tab_id] = array('in',$request[$this->tab_id]);
            $result = $db->getTableDel($where);
            if($result['status']){
                $syncData = array();
                foreach ($roles as $value) {
                    $syncData[] = array('dept_role_id'=>$value);
                }
                $this->sync('dept_role',$syncData,'del');
                $this->write_log('删除部门角色');
            }
        }
        
        return $result;
    }

    public function dataEdit($request)
    {
        $db = D($this->models['dept_role']);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $result = $db->getTableEdit($where,u2gs($request));
        if($result['status']){
            $syncData[] = array('dept_role_id'=>$where[$this->tab_id]);
            $this->sync('dept_role',$syncData,'edit');
        }
        return $result;
    }
    //目标用户的权限 roleid
    public function roleDept($request)
    {
        $db = D($this->models['dept_role']);
        $where[$this->tab_id] = $request[$this->tab_id];
        $depts = $db->where($where)->field('dept_list')->find();
        $depts = $depts['dept_list'] ? explode(',',$depts['dept_list']) : '';
        $areadb = D($this->models['area']);
        if($depts){
            foreach ($depts as &$value) {
                $value = 'areacode like "'.$value.'%"';
            }
            $sql = implode(' OR ',$depts);
        }else{
            $sql = 'areacode = ""';
        }
        $where[] = $sql;
        $allowDepts = $areadb->where($where)->getField('areaid',true);
        $allDepts = $areadb->select();
        $ids = [0];
        $l_arr = ['areaid','areaname','fatherareaid','areacode'];
        $l_attributes = ['areacode'];
        $icons = ['icon-application_xp_terminal','icon-application'];
        $tree = $this->formatTree($ids,$allDepts,$l_arr,$l_attributes,$allowDepts,$icons,array());
        return g2us($tree);
    }
    //保存权限
    public function save_depts($request)
    {
        $searchArr = array();
        $getDepts = explode(',',$request['dept_list']);
        $depts = $this->parseAreacode($getDepts);
        $db = D($this->models['dept_role']);
        $saveData['dept_list'] = implode(',', $depts);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $result = $db->getTableEdit($where,$saveData);
        if($result['status']){
            $syncData[] = array('dept_role_id'=>$where[$this->tab_id]);
            $this->sync('dept_role',$syncData,'edit');
        }
        return $result;
    }
}