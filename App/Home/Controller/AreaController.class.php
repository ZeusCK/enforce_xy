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
    protected $remove_link_tabs = ['employee'=>'Enforce\Employee'];    //删除部门时需要删除的警员
    //控制器
    protected $actions = ['user'=>'User'];
    protected $views = ['index'=>'area'];
    protected $logContent = '系统管理/部门管理';
    public function index()
    {
        $areaTree = $this->tree_list();
        $rootId = !empty($areaTree) ? $areaTree[0]['id'] : 0;
        $rootName = !empty($areaTree) ? g2u($areaTree[0]['text']) : '系统根部门';
        $this->assign('areaid',$rootId);
        $this->assign('areaname',$rootName);
        $this->display($this->views['index']);
    }

    public function dataList()
    {
        $request = I();
        $request = u2gs($request);
        $page = I('page');
        $rows = I('rows');
        unset($request['page'],$request['rows'],$request['rand']);
        if(!empty($request)){
            foreach($request as $key=>$value){
                if($key!='areaid')
                    $check[$key] = array('like','%'.$value.'%');
            }
        }
        $db = D($this->models['area']);
        //有关于部门管理不要直接取session
        $userarea = $this->m_userarea(session('empid'));
        $areaid = $request['areaid'];
        //初始数据展示限制只显示自身和下级角色
        $all_list = $this->carea($areaid);
        //将不属于自身部门的数据排除
        $all_list = array_intersect($all_list, $userarea);
        $check['areaid'] = array('in',$all_list);
        $data['total'] = 0;
        $data['rows'] = array();
        if(!empty($all_list)){
            $order = 'fatherareaid asc';
            $data = $db->getTableList($check,$page,$rows,$order);
            $areas = $db->getField('areaid,areaname');
            foreach ($data['rows'] as &$value) {
                $value['pareaname'] = array_key_exists($value['fatherareaid'], $areas) ? $areas[$value['fatherareaid']] : u2g('系统根部门');
            }
        }
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }

    public function dataAdd()
    {
        $request = I();
        $db = D($this->models['area']);
        $result = $db->getTableAdd(u2gs($request));
        $add_area = $result['add_id'];
        //增加时将所有自身,父用户添加相关部门
        $empWhere = array();
        $empWhere['userarea'][] = array('NEQ','');
        $empWhere['userarea'][] = array('exp','is not null');
        $empWhere['userarea'][] = 'AND';
        //更新警员表
        $empdb = D($this->models['employee']);
        //找出拥有管理权限的用户
        $empMans = $empdb->where($empWhere)->getField('empid,userarea');
        foreach ($empMans as $k => $v) {
            $manAreas = explode(',',$v);
            if(in_array($request['fatherareaid'],$manAreas)){
                $manAreas[] = $add_area;
                $data['userarea'] = implode(',', $manAreas);
                $updateWhere['empid'] = $k;
                $empdb->getTableEdit($updateWhere,$data);
            }
        }
        $this->write_log('添加'.$request['areaname']);
        $this->ajaxReturn($result);
    }

    public function dataRemove()
    {
        $request = I();
        $db = D($this->models['area']);
        $empdb = D($this->models['employee']);
        //有关于部门管理不要直接取session('userarea')
        $userarea = $this->m_userarea(session('empid'));
        $removearea = explode(',', $request[$this->tab_id]);
        //算出用户管理的部门与要删除的部门的交集 得到真正能删除的部门
        $intersect = array_intersect($removearea,$userarea);
        if(!empty($intersect)){
            $where[$this->tab_id] = array('in',$intersect);
            $result = $db->getTableDel($where);
            //删除与部门相关表的数据
            foreach ($this->remove_link_tabs as $tab) {
                $db_rm = D($tab);
                $db_rm->getTableDel($where);
            }
            //更新警员表
            $empWhere = array();
            $empWhere['userarea'][] = array('NEQ','');
            $empWhere['userarea'][] = array('exp','is not null');
            $empWhere['userarea'][] = 'AND';
            $empdb = D($this->models['employee']);
            //找出拥有管理权限的用户
            $empMans = $empdb->where($empWhere)->getField('empid,userarea');
            foreach ($empMans as $k => $v) {
                $manAreas = explode(',',$v);
                $holdArae = array_diff($manAreas, $intersect);
                $updateArae = implode(',', $holdArae);
                //如果更新之后的与之前的数据有所不同，那么更新警员信息表
                if($updateArae != $v){
                    $data['userarea'] = $updateArae;
                    $updateWhere['empid'] = $k;
                    $empdb->getTableEdit($updateWhere,$data);
                }
            }
        }else{
            $result['message'] = '对不起,你没有权限删除这些部门';
        }
        $this->write_log('删除部门');
        $this->ajaxReturn($result);
    }

    public function dataEdit()
    {
        $request = I();
        $db = D($this->models['area']);
        $where[$this->tab_id] = $request[$this->tab_id];
        unset($request[$this->tab_id]);
        $result = $db->getTableEdit($where,u2gs($request));
        $this->ajaxReturn($result);
    }
    //获取自身展示部门
    public function all_user_area()
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
            $L_attributes = ['areacode','rperson','rphone'];
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
}