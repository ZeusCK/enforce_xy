<?php
namespace Home\Controller;

class CaseController extends CommonController
{
    //模型
    protected $models = ['case'=>'Enforce\Case',
                         'pe_video_list'=>'Enforce\PeVideoList',
                         'area'=>'Enforce\AreaDep',
                         'employee'=>'Enforce\Employee',
                         'dictionary'=>'Enforce\dictionary',
                         'wsbase'=>'Enforce\WsBase'];
    protected $actions = ['media'=>'Media',
                          'employee'=>'Employee',
                          'area'=>'Area',
                          'wsbase'=>'WorkStation'];
    protected $pe_type = ['未知','一般警情(6个月)','重大警情(永久)','阻碍民警执法妨碍公务(永久)',
                          '行政强制执行(永久)','当场盘问检查(6个月)','无效数据(7天)','其他(6个月)'];
    protected $case_type = ['未知','行政案件','刑侦案件'];
    //日志模块
    protected $logContent = '案件管理';
    //播放页面
    public function play_case()
    {
        $request = I('');
        $data = $this->play_case_info($request);
        $this->assign('data',$data);
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
        //hand_status 案件移交状态
        //type 显示类型 0 正常产看  1 申请查看
        $type = $request['type'] ? $request['type'] : 0;
        $jybhField = $type == 0 ? 'jybh' : 'apply_jybh';
        $idField = $type == 0 ? 'areacode' : 'apply_areacode';
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        $areacode = $request['areacode'];       //查询部门
        $manger_sql = $this->get_manger_sql($areacode,$idField);
        $where[] = $manger_sql;

        if($request['case_no']) $where['case_no'] = array('like','%'.$request['case_no'].'%');    //案件编号
        if($request['case_name']) $where['case_name'] = array('like','%'.$request['case_name'].'%');    //案件名称
        if($request['case_type']) $where['case_type'] = $request['case_type'];      //案件类型
        if($request['alarm_no']) $where['alarm_no'] = array('like','%'.$request['alarm_no'].'%');    //警情编号
        if($request['alarm_name']) $where['alarm_name'] = array('like','%'.$request['alarm_name'].'%');    //警情名称
        if($request['alarm_type']) $where['alarm_type'] = $request['alarm_type'];      //警情类型
        if($request['jybh']) $where[$jybhField] = $request['jybh'];                 //警员编号
        if($request['hand_status']) $where['hand_status'] = $request['hand_status'];    //移交状态
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'] : date('Y-m-d H:i:s',time()-6*24*60*60);
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'] : date('Y-m-d H:i:s');
        $where['start_time'][] = array('EGT',$btime);      //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        foreach ($months as $month) {
            if(!in_array('case_'.$month,$tables)) continue;
            $total[$month] = M()->table('case_'.$month)->where($where)->count();
        }
        $tables = $this->get_query_table($total,$page,$rows);
        $res = array();
        $res['total'] = array_sum($total);
        $res['rows'] = array();
        foreach ($tables as $table => $start_limit) {
            error_log('查询数据表:'.'case_'.$month.'---查询数据:'.implode(',',$start_limit)."\r\n",3,'error.log');
            $data = M()->table('case_'.$table)->where($where)->limit(implode(',',$start_limit))->select();
            $res['rows'] = array_merge($res['rows'],(array)$data);
        }
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
        $where['case_key'] = $request['case_key'];
        $start_time = $request['start_time'];
        $table = date('Ym',strtotime($start_time));
        unset($request['case_key']);
        $db = D($this->models['case']);
        $result = $db->table('case_'.$table)->getTableEdit($where,u2gs($request));
        $this->write_log('修改案件'.I('video_title'));
        return $result;
    }
    //查看可以申请的数据
    public function show_apply_list($request)
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
        //hand_status 案件移交状态
        //type 显示类型 0 正常产看  1 申请查看
        //areacode 部门代码
        $type = $request['type'] ? $request['type'] : 0;
        $jybhField = $type == 0 ? 'jybh' : 'apply_jybh';
        $idField = $type == 0 ? 'areacode' : 'apply_areacode';
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        $areacode = $request['areacode'];
        $manger_sql = $this->get_manger_sql($areacode,$idField);
        $where[] = str_replace('OR','AND',str_replace('LIKE', 'NO LIKE', $manger_sql));
        if($request['case_no']) $where['case_no'] = array('like','%'.$request['case_no'].'%');    //案件编号
        if($request['case_name']) $where['case_name'] = array('like','%'.$request['case_name'].'%');    //案件名称
        if($request['case_type']) $where['case_type'] = $request['case_type'];      //案件类型
        if($request['alarm_no']) $where['alarm_no'] = array('like','%'.$request['alarm_no'].'%');    //警情编号
        if($request['alarm_name']) $where['alarm_name'] = array('like','%'.$request['alarm_name'].'%');    //警情名称
        if($request['alarm_type']) $where['alarm_type'] = $request['alarm_type'];      //警情类型
        if($request['jybh']) $where[$jybhField] = $request['jybh'];                 //警员编号
        if($request['hand_status']) $where['hand_status'] = $request['hand_status'];    //移交状态
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'] : date('Y-m-d H:i:s',time()-6*24*60*60);
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'] : date('Y-m-d H:i:s');
        $where['start_time'][] = array('EGT',$btime);      //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        foreach ($months as $month) {
            if(!in_array('case_'.$month,$tables)) continue;
            $total[$month] = M()->table('case_'.$month)->where($where)->count();
        }
        $tables = $this->get_query_table($total,$page,$rows);
        $res = array();
        $res['total'] = array_sum($total);
        $res['rows'] = array();
        foreach ($tables as $table => $start_limit) {
            error_log('查询数据表:'.'case_'.$month.'---查询数据:'.implode(',',$start_limit)."\r\n",3,'error.log');
            $data = M()->table('case_'.$table)->where($where)->limit(implode(',',$start_limit))->select();
            $res['rows'] = array_merge($res['rows'],(array)$data);
        }
        $alarm_type = $this->get_val_item('dictionary', 'alarm_type');
        $case_type = $this->get_val_item('dictionary', 'case_type');

        foreach ($res['rows'] as &$row) {
            $row['alarm_type_name'] = $alarm_type[$row['alarm_type']];
            $row['case_type_name'] = $case_type[$row['case_type']];
        }
        $this->saveExcel($res); //监测是否为导出
        return g2us($res);
    }
    //申请移交
    public function apply_case($request)
    {
        //case_key  案件关键字 申请案件
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
    //审批通过
    public function allow_apply($request)
    {
        //case_key 案件关键字
        $data['hand_status'] = 2;   //初始状态
        $db = D($this->models['case']);
        $result = $db->getTableEdit($request,$data);
        $result['message'] = $result['status'] ? '审核通过' : '审核通过失败,可能原因该案件已被其他管理员审核通过';
        return  $result;
    }
    //初始化案件
    public function init_case($request)
    {
        $keys = array('alarm_no','alarm_name','alarm_addr','case_name','case_no','remark','case_qualify','case_empl','case_dept');
        $initData = array_fill_keys($keys,'');
        $initData['alarm_type'] = 0;
        $initData['case_type'] = 0;
        $db = D($this->models['case']);
        $result = $db->getTableEdit($request,$initData);
        $result['message'] = $result['status'] ? '初始化案件成功' : '初始化案件失败';
        return $result;
    }
    //案件合并
    public function case_merage($request)
    {
        $casesId = explode(',',$request['case_key']);
        sort($casesId);
        $db = D($this->models['case']);
        $endCase = $db->where('case_key='.end($casesId))->find();
        //将第一个案件的结束时间调整至最后一个案件的结束时间
        $data['end_time'] = $endCase['end_time'];
        $where['case_key'] = reset($casesId);
        $result = $db->getTableEdit($request,$data);
        //将相关视频合并
        $mediadb = D($this->models['pe_video_list']);
        $caseData['case_key'] = array_shift($casesId);
        $caseWhere[] = $this->where_key_or($casesId, 'case_key');
        $result = $mediadb->getTableEdit($caseWhere,$caseData);
        return $result;
    }
    //案件拆包
    public function case_slice($request)
    {
        $wjbhs = explode(',', $request['wjbh']);
    }
    //撤销，拒绝申请
    public function init_apply($request)
    {
        //case_key 案件关键字
        //action  0 撤销 1 拒绝
        $data['hand_status'] = 0;   //初始状态
        $db = D($this->models['case']);
        $start_time = $request['start_time'];
        $table = date('Ym',strtotime($start_time));
        $result = $db->table('case_'.$table)->getTableEdit($request,$data);
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
        //case_key  案件关键字
        $casedb = D($this->models['case']);
        $mediadb = D($this->models['pe_video_list']);
        $caseWhere['case_key'] = $request['case_key'];
        $start_time = $request['start_time'];
        $table = date('Ym',strtotime($start_time));
        $caseInfo = $casedb->table('case_'.$table)->where($caseWhere)->find();
        $data = $mediadb->table('case_video_'.$table)->where($caseWhere)->select();
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
/*    var column = [
    [
        { field: 'areaname', title: '所属部门', rowspan: 2, width: 80, align: 'center' },
        { field: 'empnum', title: '警员总数', rowspan: 2, width: 80, align: 'center' },
        { field: 'workemp', title: '执法民警数', rowspan: 2, width: 80, align: 'center' },
        { field: 'recorder', title: '执法记录仪数', rowspan: 2, width: 80, align: 'center' },
        //{ field: 'upload', title: '民警上传情况', colspan: 3, align: 'center' },
        //{ field: 'warning', title: '警情数', colspan: 9, align: 'center' },
        //{ field: 'case', title: '案件数', colspan: 3, align: 'center' },
        //{ field: 'collect', title: '采集站情况', colspan: 3, align: 'center' }
    ],
    [
        //{ field: 'uploadnum', title: '上传警员数', width: 80, align: 'center' },
        //{ field: 'unuploadnum', title: '未上传民警数', width: 80, align: 'center' },
        //{ field: 'uploadper', title: '警员上传率', width: 80, align: 'center' },

        { field: 'common', title: '一般警情', width: 80, align: 'center' },
        { field: 'major', title: '重大警情', width: 80, align: 'center' },
        { field: 'spot', title: '当场盘问检查', align: 'center' },
        { field: 'force', title: '行政强制执行', width: 80, align: 'center' },
        { field: 'impede', title: '阻碍民警执法妨碍公务', align: 'center' },
        { field: 'otherdata', title: '其他数据', align: 'center' },
        { field: 'unmark', title: '未编辑数据', align: 'center' },
        { field: 'disuse', title: '无效数据', align: 'center' },
        { field: 'num', title: '合计', align: 'center' },

        { field: 'administration', title: '行政案件', align: 'center' },
        { field: 'criminal', title: '刑侦案件', align: 'center' },
        { field: 'case_num', title: '合计', width: 80, align: 'center' },

        { field: 'wsbase_num', title: '采集站数', width: 80, align: 'center' },
        { field: 'wsbase_online', title: '连接数', width: 80, align: 'center' },
        { field: 'wsbase_per', title: '连接率', width: 80, align: 'center' }
    ]
];*/
    //案件统计
    public function case_sat($request)
    {
        //----------------
        //基础where条件
        //----------------
        $areacode = $request['areacode'];
        $manger_sql = $this->get_manger_sql($areacode);
        $where[] = $manger_sql;
        $emWhere = $wsWhere = $serWhere = $caseWhere = $peWhere = $where;
        //---------------------
        //查询时间
        //---------------------
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'].' 00:00:00' : date('Y-m-d',time()-6*24*60*60).' 00:00:00'; //开始时间
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'].' 23:59:59' : date('Y-m-d').' 23:59:59'); //结束时间
        $where['start_time'][] = array('EGT',$btime);      //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        //警员统计
        $employeedb = D($this->models['employee']);
        $allEmp = $employeedb->field('areacode,count(1) as empnum')->where($wsWhere)->group('areacode')->select();




        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        foreach ($months as $month) {
            if(!in_array('case_'.$month,$tables)) continue;
            $total[$month] = M()->table('case_'.$month)->where($where)->count();
        }



        $db = D($this->models['case']);
        $caseWhere = $empWhere = $alarmWhere = $where;
        //案件统计 和 警情统计
        $caseData = $db->field('areacode,areaname,count(1) as num')->where($where)->group('areacode,alarm_type,case_type')->select();
        $sql = $action->get_manger_sql($areaid,'areaid',fasle);
        $wsWhere[]= $sql;
        //民警执勤统计
        $empData = $db->field('areaid,areaname,count(distinct(jybh)) as workemp')->where($where)->group('areaid')->select();
        $allEmp = D($this->models['employee'])->field('areacode,count(1) as empnum')->where($wsWhere)->group('areacode')->select();
        $wsDb = D($this->models['wsbase']);
        //工作站统计
        $wsData = $wsDb->field('areacode,areaname,count(1) as wsnum')->where($wsWhere)->group('areacode,zxzt')->select();
        //------------------
        //数据初始化阶段
        //------------------
        $areaAction = A($this->actions['area']);
        $areadb = D($this->models['area']);
        $initInfos = $areadb->field('areacode,areaname,fatherareaid as _parentId')->where($showWhere)->select();
        $keys = array('areaname','empnum','workemp','percent','common','major','major','impede',
                      'force','spot','disuse','unmark','num','criminal','administration','case_num',
                      'wsbase_num','wsbase_online','case_num');
        $this->ajaxReturn(g2us($allEmp));
    }
    /**
     * 分析数据
     * @param  array $init  初始化的数据
     * @param  array $data       需要处理的数据
     * @param  array $fields     处理的字段  保存信息=>处理字段 ['nomark'=>'num','wjcd'=>'wjcd']
     * @param  array $mark      标识字段     'jybh'
     * @param  array $paress 需要分析的字段 ['wflx'=>['field'=>'num','info'=>['video'=>1]]]  field,info 为必须字段
     * @param  array $doOne  仅仅处理一次的字段 ['areaname']
     * @return array             整合之后的数据
     */
    public function pares_data($init,$data,$fields,$mark = '',$paress,$doOne)
    {
        if(empty($data) || empty($init) || $mark == '') return $init;
        foreach ($data as $info) {
            if(!empty($doOne)){
                foreach ($doOne as $k => $value) {
                    $init[$info[$mark]][$k] = $info[$value];
                }
                unset($k);
            }
            if(!empty($fields)){
                foreach ($fields as $key => $field) {
                    $init[$info[$mark]][$key] = $init[$info[$mark]][$key] + $info[$field];
                }
                unset($key);
            }
            if(!empty($paress)){
                foreach ($paress as $ke => $pares) {
                    $field = $pares['field'];
                    foreach ($pares['info'] as $key => $value) {
                        if($info[$ke] == $value){
                            $init[$info[$mark]][$key] = $init[$info[$mark]][$key] + $info[$field];
                        }
                    }
                }
            }
        }
        return $init;
    }
}