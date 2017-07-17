<?php
/**************************
 *媒体控制器
 **************************/
namespace Home\Controller;

class ApplyController extends CommonController
{
    protected $models = ['apply'=>'Enforce\Apply',        //调阅申请
                         'apply_video_list'=>'Enforce\ApplyVideoList', //调阅信息
                         'pe_video_list'=>'Enforce\PeVideoList',    //媒体信息
                         'area'=>'Enforce\AreaDep',                 //部门
                         'employee'=>'Enforce\Employee'];           //警员
    protected $actions = ['area'=>'Area',
                          'role'=>'Role',
                          'employee'=>'Employee'];
    protected $views = ['play_video'=>'playVideo'];
    protected $logContent = '调阅/调阅管理';
    //申请列表
    public function apply()
    {
        $this->display('apply');
    }
    //审核列表
    public function allow_apply()
    {
        $this->display('allow_apply');
    }
    //调阅查询
    public function apply_video()
    {
        $this->display('apply_video');
    }
    //申请数据请求
    public function apply_list()
    {
        $data = $this->show_info(1);
        $this->saveExcel($data);
        $this->ajaxReturn(g2us($data));
    }
    //审核数据请求
    public function allow_list()
    {
        $data = $this->show_info(2);
        $this->saveExcel($data);
        $this->ajaxReturn(g2us($data));
    }
    //数据显示类型
    public function show_info($type)
    {
        $request = array();
        $request['read'] = I('read');    //读取状态
        $request['status'] = I('status');   //审批状态
        $page = I('page');
        $rows = I('rows');
        $where = array();
        //仅显示登录用户的申请单
        if($type == 1) $where['code'] = session('code');
        //审批人
        if($type == 2){
            $where['parent_code'] = session('code');
            $where['status'] = 0;
        }
        if($request['read'] != '') $where['read'] = $request['read'];
        if($request['status'] != '') $where['status'] = $request['status'];
        $applydb = D($this->models['apply']);
        $order = 'status desc,`read` asc';        //已审核，未读
        $data = $applydb->getTableList($where,$page,$rows,$order);
        $status = ['未审核','通过','需要修改','拒绝'];
        $read = ['未读','已读'];
        $areadb = D($this->models['area']);
        $areas = $areadb->getField('areaid,areaname');
        $empdb = D($this->models['employee']);
        $emps = $empdb->getField('code,name');
        foreach ($data['rows'] as &$value) {
            $value['status_name'] = u2g($status[$value['status']]);
            $value['read_name'] = u2g($read[$value['read']]);
            $value['areaname'] = $areas[$value['areaid']];
            $codes = explode(',',$value['codes']);
            $names = array();
            foreach ($codes as $code) {
                $names[] = $emps[$code];
            }
            $value['names'] = implode(',', $names);
        }
        return $data;
    }
    //添加申请
    public function apply_add()
    {
        $request = array();
        $request['from_time'] = I('from_time')." 00:00:00";    //申请资源时间
        $request['codes'] = I('codes');            //申请资源警员
        $request['reason'] = I('reason');          //申请原因
        $request['view_code'] = I('view_code');    //允许查看的警员
        $request['view_name'] = I('view_name');    //允许查看的警员
        $request['crt_time'] = date('Y-m-d H:i:s'); //申请时间
        $request['code'] = session('code');      //申请人
        $request['name'] = session('user');        //申请人
        $request['areaid'] = session('areaid');  //部门
        $request['parent_code'] = I('parent_code');  //审批人
        $request['parent_name'] = I('parent_name');  //审批人
        $db = D($this->models['apply']);
        $result = $db->getTableAdd(u2gs($request));
        $this->write_log('申请调阅');
        $this->ajaxReturn($result);
    }
    //修改申请
    public function apply_edit()
    {
        $request = array();
        $db = D($this->models['apply']);
        $request['from_time'] = I('from_time');    //申请资源时间
        $request['codes'] = I('codes');            //申请资源警员
        $request['reason'] = I('reason');          //申请原因
        $request['view_code'] = I('view_code');    //允许查看的警员
        $request['view_name'] = I('view_name');    //允许查看的警员
        $request['parent_code'] = I('parent_code');  //审批人
        $request['parent_name'] = I('parent_name');  //审批人
        $request['read'] = 0;           //修改的信息变更为未读状态
        $request['status'] = 0;         //调整审批状态
        $where['apply_id'] = I('apply_id');     //申请单号
        $result = $db->getTableEdit($where,u2gs($request));
        $this->write_log('修改申请单'.I('apply_id'));
        $this->ajaxReturn($result);
    }
    //变更信息为未读状态
    public function toRead()
    {
        $db = D($this->models['apply']);
        $request['read'] = I('read');
        $where['apply_id'] = I('apply_id');     //申请单号
        $result = $db->getTableEdit($where,u2gs($request));
        $this->ajaxReturn($result);
    }
    //审批意见
    public function allow()
    {
        $status = I('status');
        $request['status'] = $status;
        $where['apply_id'] = I('apply_id');
        $request['remark'] = I('remark');
        $db = D($this->models['apply']);
        //审核通过时
        if($status == 1){
            $row = $db->where($where)->find();
            $codes = explode(',',$row['codes']);
            $appWhere = $this->where_key_or($codes,'jybh');
            $time = explode(' ',$row['from_time']);
            $btime = $time[0].' 00:00:00';
            $etime = $time[0].' 23:59:59';
            $appWhere['start_time'][] = array('EGT',$btime);
            $appWhere['start_time'][] = array('ELT',$etime);
            //$this->ajaxReturn($appWhere);
            $res = $this->move_data($appWhere,$row['view_code'],$row['apply_id']);
            if($res){
                $result = $db->getTableEdit($where,u2gs($request));
                $result['message'] = $result['status'] ? '审批完成' : '审批失败';
            }else{
                $result['message'] = '审核失败';
            }
        }else{
            $result = $db->getTableEdit($where,u2gs($request));
            $result['message'] = $result['status'] ? '审批完成' : '审批失败';
        }
        $apply_res = $status == 1 ? '通过' : $status == 2 ? '修改' : '拒绝';
        $this->write_log($where['apply_id'].'审批'.$apply_res);
        $this->ajaxReturn($result);
    }
    //筛选最适合的审批人
    public function get_parent()
    {
        $areadb = D($this->models['area']);
        $parea = $areadb->where('areaid='.session('areaid'))->getField('fatherareaid');
        //超级管理员无需申请
        if(session('areaid') == 0){
            $res = array();
            $this->ajaxReturn($res);
        }
        $action = A($this->actions['area']);
        //获取所有的上级部门
        $pareas = $action->parea(session('areaid'),true);
        //所有能审阅的部门
        $careas = $action->carea($parea,true);
        //选出符合条件的审核人
        $empdb = D($this->models['employee']);
        $empWhere = array();
        $empWhere['userarea'][] = array('NEQ','');
        $empWhere['userarea'][] = array('exp','is not null');
        $empWhere['areaid'] = array('in',$pareas);
        $empsInfo = $empdb->where($empWhere)->getField('code,name,userarea');
        //准备审核人
        $info = array();
        //能审阅的部门总数
        $careascount = count($careas);
        foreach ($empsInfo as $key => $empInfo) {
            //能管理的部门
            $manArea = explode(',', $empInfo['userarea']);
            //上级管理的部门与需要调阅的部门差集为0 说明该上级拥有全部权限
            if(count(array_diff($careas,$manArea)) < 1){
                //在符合条件的上级中选出最小的交集
                $info[$key] = count(array_diff($manArea, $careas));
            }
        }
        $min = min($info);
        $showParent = array();
        foreach ($info as $key => $value) {
            if($value == $min){
                $showParent[] = $empsInfo[$key];
            }
        }
        $this->ajaxReturn(g2us($showParent));
    }
    /**
     * 审核通过后移动文件
     * @param  array $where 筛选条件
     * @param  string $code  移动后警员
     * @return bool
     */
    public function move_data($where,$code,$apply_id)
    {
        $listdb = D($this->models['pe_video_list']);
        $data = $listdb->where($where)->select();
        if(!$data){
            return true;
        }
        foreach ($data as &$value) {
            $value['jybh'] = $code;
            $value['apply_id'] = $apply_id;
        }
        $apply_listdb = D($this->models['apply_video_list']);
        $res = $apply_listdb->addAll($data);
        return $res ? true : false;
    }
    //获取首页显示信息
    public function index_show()
    {
        session_write_close();
        $db = D($this->models['apply']);
        //申请人
        $requestwhere['code'] = session('code');
        $requestwhere['read'] = 0;
        $requestwhere['status'] = array('GT',0);
        //审核过，未读
        $requestnum = $db->where($requestwhere)->count('apply_id');
        //审核人
        $allowwhere['parent_code'] = session('code');
        $allowwhere['status'] = 0;
        //未审核数据
        $allownum = $db->where($allowwhere)->count('apply_id');
        $show = array();
        $show['request'] = $requestnum;
        $show['allow'] = $allownum;
        $this->ajaxReturn($show);
    }
}