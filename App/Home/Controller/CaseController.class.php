<?php
namespace Home\Controller;

class CaseController extends CommonController
{
    //模型
    protected $models = ['case'=>'Enforce\Case',
                         'pe_video_list'=>'Enforce\PeVideoList',
                         'area'=>'Enforce\AreaDep',
                         'employee'=>'Enforce\Employee',
                         'dictionary'=>'Enforce\dictionary'];
    protected $actions = ['media'=>'Media',
                          'area'=>'Area'];
    protected $pe_type = ['未知','一般警情(6个月)','重大警情(永久)','阻碍民警执法妨碍公务(永久)',
                          '行政强制执行(永久)','当场盘问检查(6个月)','无效数据(7天)','其他(6个月)'];
    protected $case_type = ['未知','行政案件','刑侦案件'];
    //日志模块
    protected $logContent = '案件管理';
    //播放页面
    public function play_case()
    {
        $this->display();
    }
    //案件列表
    public function show_case()
    {
        $this->assignInfo();
        $this->display();
    }
    //案件统计
    public function sat_case()
    {
        $this->assignInfo();
        $this->display();
    }
    //申请列表
    public function show_apply_case()
    {
        $this->assignInfo();
        $this->display('apply_case');
    }
    //移交视频
    public function show_applyed()
    {
        $this->assignInfo();
        $this->display('applyed');
    }
    //申请审核
    public function allow_case()
    {
        $this->assignInfo();
        $this->display('allow_case');
    }
    public function assignInfo()
    {
        $action = A($this->actions['area']);
         //如果没有
        $areaTree = $action->tree_list();
        $rootId = !empty($areaTree) ? $areaTree[0]['id'] : '';
        $rootName = !empty($areaTree) ? g2u($areaTree[0]['text']) : '系统根部门';
        $this->assign('areaid',$rootId);
        $this->assign('areaname',$rootName);
    }
    //案件查询
    public function case_list($request)
    {
        //case_no  案件编号
        //case_name 案件名称
        //case_type 案件类型
        //alarm_no 警情编号
        //alarm_name 警情名称
        //alarm_type 警情类型
        //jybh 警员编号
        //start_time.btime 开始时间
        //start_time.etime 结束时间
        //type 显示类型 0 正常产看  1 申请查看
        $type = $request['type'] ? $request['type'] : 0;
        $jybhField = $type == 0 ? 'jybh' : 'apply_jybh';
        $idField = $type == 0 ? 'areaid' : 'apply_areaid';
        $page = $request['page'];
        $rows = $request['rows'];
        $areaid = $request['areaid'];       //查询部门
        $action = A($this->actions['employee']);
        $manger_sql = $action->get_manger_sql($areaid,$idField);
        $where[] = $manger_sql;
        if($request['case_no']) $where['case_no'] = array('like','%'.$request['case_no'].'%');    //案件编号
        if($request['case_name']) $where['case_name'] = array('like','%'.$request['case_name'].'%');    //案件名称
        if($request['case_type']) $where['case_type'] = $request['case_type'];      //案件类型
        if($request['alarm_no']) $where['alarm_no'] = array('like','%'.$request['alarm_no'].'%');    //警情编号
        if($request['alarm_name']) $where['alarm_name'] = array('like','%'.$request['alarm_name'].'%');    //警情名称
        if($request['alarm_type']) $where['alarm_type'] = $request['alarm_type'];      //警情类型
        if($request['jybh']) $where[$jybhField] = $request['jybh'];                 //警员编号
        $where['start_time'][] = array('EGT',$request['start_time']['btime'] ? $request['start_time']['btime'].' 00:00:00' : date('Y-m-d',time()-7*24*60*60).' 00:00:00');      //开始时间
        $where['start_time'][] = array('ELT',$request['start_time']['etime'] ? $request['start_time']['etime'].' 00:00:00' : date('Y-m-d').' 00:00:00');                    //结束时间
        $casedb = D($this->models['case']);
        $res = $casedb->getTableList($where,$page,$rows,'title desc');
        $alarm_type = $this->get_val_item('dictionary', 'alarm_type');
        $case_type = $this->get_val_item('dictionary', 'case_type');
        foreach ($res['rows'] as &$row) {
            $row['alarm_type_name'] = $alarm_type[$row['alarm_type']];
            $row['case_type_name'] = $case_type[$row['case_type']];
        }
        $this->saveExcel($res); //监测是否为导出
        return g2us($res);
    }
    //修改案件
    public function edit_case($request)
    {
        $where['video_id'] = $request['video_id'];
        unset($request['video_id']);
        $result = $db->getTableEdit($where,u2gs($request));
        $this->write_log('修改案件'.I('video_title'));
        return $result;
    }
    //查看可以申请的数据
    public function show_apply_list($request)
    {
        //areaid  查看部门
        //page 页数
        //rows 条数
        $areas = explode(',',session('userarea'));
        foreach ($areas as &$area) {
            $area = 'areaid !="'.$area.'"';
        }
        $areasql = implode(' AND ');
        if(!in_array(session('areaid'),$areas)){
            $areasql .= ' AND jybh!="'.session('code').'"';
        }
        $where[] = $areasql;    //禁止查看的数据
        $action = A($this->actions['area']);
        $careas = $action->carea($request['areaid']);
        $where[] = $this->where_key_or($careas,'areaid');      //需要查看的数据
        $where['alarm_no'] = array('NEQ','');           //没有编辑过的不允许移交
        $db = D($this->models['case']);
        $data = $db->getTableList($where,$request['page'],$request['rows'],'title desc');
        $alarm_type = $this->get_val_item('dictionary', 'alarm_type');
        $case_type = $this->get_val_item('dictionary', 'case_type');
        foreach ($data['rows'] as &$row) {
            $row['alarm_type_name'] = $alarm_type[$row['alarm_type']];
            $row['case_type_name'] = $case_type[$row['case_type']];
        }
        return g2us($data);
    }
    //申请移交
    public function apply_case($request)
    {
        //video_id  案件ID 申请案件
        $data['apply_jybh'] = session('code');
        $data['apply_jyxm'] = u2g(session('user'));
        $data['apply_areaid'] = session('areaid');
        $data['apply_areaname'] = u2g(session('areaname'));
        $data['update_time'] = date('Y-m-d H:i:s');
        $data['hand_status'] = 1;   //待审核状态
        $db = D($this->models['case']);
        $result = $db->getTableEdit($request,$data);
        if($result['status']){
            $result['message'] = '提交申请成功';
        }else{
            $result['message'] = '提交申请失败';
        }
        $info = $db->where($request)->find();
        $this->write_log(g2u($info['video_title']).$result['message']);
        return $result;
    }
    public function allow_apply($request)
    {
        //video_id 案件ID
        $data['hand_status'] = 2;   //初始状态
        $result = $db->getTableEdit($request,$data);
        $result['message'] = $result['status'] ? '审核通过' : '审核通过失败,可能原因该案件已被其他管理员审核通过';
        return  $result;
    }
    //撤销，拒绝申请
    public function init_apply($request)
    {
        //video_id 案件ID
        //action  0 撤销 1 拒绝
        $data['hand_status'] = 0;   //初始状态
        $result = $db->getTableEdit($request,$data);
        if($result['status']){
            if($request['action'] == 0) $result['message'] = '撤销成功';
            if($request['action'] == 1) $result['message'] = '申请已拒绝';
        }else{
            if($request['action'] == 0) $result['message'] = '撤销失败';
            if($request['action'] == 1) $result['message'] = '申请拒绝失败';
        }
        $this->write_log(g2u($info['video_title']).$result['message']);
        return $result;
    }
    //播放,编辑信息
    public function play_case_info($request)
    {
        //video_id  案件ID
        $casedb = D($this->models['case']);
        $mediadb = D($this->models['pe_video_list']);
        $caseWhere['video_id'] = $request['video_id'];
        $caseInfo = $casedb->where($caseWhere)->find();
        $data = $mediadb->where($caseWhere)->select();
        $fileType = $this->get_val_item('dictionary','filetype');
        $video_source = $this->get_val_item('dictionary','video_source');
        foreach ($data as &$value) {
            $value['file_type_name'] = $fileType[$value['file_type']];
            $value['source_name'] = $video_source[$value['source']];
        }
        $res = array();
        $res['total'] = count($data);
        $res['rows'] = $data;
        $res['info'] = $caseInfo;
        $this->write_log(g2u($info['video_title']).'播放,编辑信息');
        return g2us($res);
    }
}