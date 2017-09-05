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
                         'wsbase'=>'Enforce\WsBase',
                         'pebase'=>'Enforce\peBase'];
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
        if(session('role')){
            $request = I('');
            $data = $this->play_case_info($request);
            $wjbh = $request['wjbh'] ? $request['wjbh'] : '';
            $this->assign('data',json_encode($data));
            $this->assign('wjbh',$wjbh);
            $this->display();
        }else{
            $this->redirect('Index/login');
            exit;
        }
        
    }
    //案件编辑
    public function show_case()
    {
        $this->display();
    }
    //上传数据编辑情况
    public function edit_con_sat()
    {
        $this->display();
    }
    //案件统计
    public function sat_case()
    {
        $this->display();
    }
    //申请列表
    public function show_apply_case()
    {
        $this->display('apply_case');
    }
    //移交视频
    public function show_applyed()
    {
        $this->display('applyed');
    }
    //申请审核
    public function allow_case()
    {
        $this->display('allow_case');
    }
    //案件采集
    public function show_case_collect()
    {
        $this->display();
    }
    //案件查询
    public function show_case_search()
    {
        $this->display();
    }
    //回收站
    public function recycle_bin()
    {
        $this->display();
    }
    public function case_upload()
    {
        if(session('role')){
            $request = I('');
            $data = $this->play_case_info($request);
            $this->assign('data',json_encode($data));
            $this->display('upload');
        }else{
            $this->redirect('Index/login');
            exit;
        }
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
        //source 来源
        //type 显示类型 0 正常产看  1 申请查看
        //show_messager 首页公告  取60天数据
        $request = u2gs($request);
        $type = $request['type'] ? $request['type'] : 0;
        $jybhField = $type == 0 ? 'jybh' : 'apply_jybh';
        $idField = $type == 0 ? 'areacode' : 'apply_areacode';
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        $areacode = $request['areacode'] ? $request['areacode'] : '';       //查询部门
        $manger_sql = $this->get_manger_sql($areacode,$idField,$jybhField);
        $where[] = $manger_sql;
        $where['del_flag'] = $request['del_flag'] ? $request['del_flag'] : 0;
        if($request['case_no']) $where['case_no'] = array('like','%'.$request['case_no'].'%');    //案件编号
        if($request['case_name']) $where['case_name'] = array('like','%'.$request['case_name'].'%');    //案件名称
        if($request['case_type']) $where['case_type'] = $request['case_type'];      //案件类型
        if($request['alarm_no']) $where['alarm_no'] = array('like','%'.$request['alarm_no'].'%');    //警情编号
        if($request['alarm_name']) $where['alarm_name'] = array('like','%'.$request['alarm_name'].'%');    //警情名称
        if($request['alarm_addr']) $where['alarm_addr'] = array('like','%'.$request['alarm_addr'].'%');    //警情名称
        if($request['title']) $where['title'] = array('like','%'.$request['title'].'%');    //警情名称
        if($request['alarm_type']) $where['alarm_type'] = $request['alarm_type'];      //警情类型
        if($request['jyxm']) $where['jyxm'] = array('like','%'.$request['jyxm'].'%');      //警情类型
        if($request['apply']['btime']) $where['apply_time'][] = array('EGT',$request['apply']['btime']);      //移交时间
        if($request['apply']['etime']) $where['apply_time'][] = array('ELT',$request['apply']['etime']);      //移交时间
        if($request['source']) $where['source'] = $request['source'];      //警情来源
        if($request['jybh']) $where[$jybhField] = $request['jybh'];                 //警员编号
        if($request['hand_status']) $where['hand_status'] = $request['hand_status'];    //移交状态
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'] : date('Y-m-d H:i:s',time()-6*24*60*60);
        if($request['show_messager']) $btime = date('Y-m-d H:i:s',time()-60*24*60*60);
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
            // error_log('查询数据表:'.'case_'.$month.'---查询数据:'.implode(',',$start_limit)."\r\n",3,'error.log');
            $data = M()->table('case_'.$table)->where($where)->limit(implode(',',$start_limit))->order('scsj desc')->select();
            $res['rows'] = array_merge($res['rows'],(array)$data);
        }
        $alarm_type = $this->get_val_item('dictionary', 'alarm_type');
        $case_type = $this->get_val_item('dictionary', 'case_type');
        $areaInfos = D($this->models['area'])->getField('areacode,is_read');
        $video_source = $this->get_val_item('dictionary','video_source');
        foreach ($res['rows'] as &$row) {
            $row['alarm_type_name'] = $alarm_type[$row['alarm_type']];
            $row['case_type_name'] = $case_type[$row['case_type']];
            $row['is_read'] = $areaInfos[$row['areacode']];
            $row['source_name'] = $video_source[$row['source']];
        }
        $this->saveExcel($res); //监测是否为导出
        return g2us($res);
    }
    public function add_case($request)
    {
        //title       标题
        //edit_name   采集人
        //jyxm        上传人
        //start_time   采集时间
        //scsj      上传时间
        //source    来源
        $request['jyxm'] = session('user');
        $request['edit_name'] = session('user');
        $request['areacode'] = session('areacode');
        $request['areaname'] = session('areaname');
        $request['update_time'] = date('Y-m-d H:i:s');
        $request['start_time'] = date('Y-m-d H:i:s');
        $request['jybh'] = session('code');
        $start_time = $request['start_time'];
        $cpxh = D($this->models['pebase'])->where('jybh="'.session('code').'"')->getField('cpxh');
        $cpxh = $cpxh ? $caxh : 'cpxhpe';
        $request['case_key'] = date('YmdHis',strtotime($start_time)).'_'.$cpxh.'_'.session('areacode');
        $table = date('Ym',strtotime($start_time));
        $result = M()->table('case_'.$table)->add(u2gs($request));
        $request['tab_name'] = 'case_'.$table;
        $syncData[] = $request;
        $this->sync('case',$syncData,'add');
        $res = array();
        if($result){
            $res['status'] = true;
            $res['case_key'] = $request['case_key'];
            $res['start_time'] = $request['start_time'];
            $this->write_log('新增警情:'.$request['title']);
        }else{
            $res['status'] = false;
            $res['message'] = '新增失败';
        }
        return  $res;
    }
    //修改案件
    public function edit_case($request)
    {
        $where['case_key'] = $request['case_key'];
        $start_time = $request['start_time'];
        $table = date('Ym',strtotime($start_time));
        $request['edit_name'] = session('user');
		if($request['end_time'] == '') unset($request['end_time']);
        $request = u2gs($request);
        $request['update_time'] = date('Y-m-d H:i:s');
        $result = M()->table('case_'.$table)->where($where)->save($request);
        //同步
        $other = $request;
        $other['tab_name'] = 'case_'.$table;
        $syncData[] = $other;
        $this->sync('case',$syncData,'edit');
        if($result){
            $res['status'] = true;
            $res['message'] = '修改案件成功';
        }else{
            $res['status'] = false;
            $res['message'] = '修改案件失败';
        }
        $this->write_log('修改案件'.$request['case_key']);
        return $res;
    }
	public function remove_case($request){
		$where['case_key'] = $request['case_key'];
        $start_time = $request['start_time'];
        $table = date('Ym',strtotime($start_time));
        $request['edit_name'] = session('user');
        $data['del_flag'] = 1;
		if($request['end_time'] == '') unset($request['end_time']);
        $request = u2gs($request);
        $request['update_time'] = date('Y-m-d H:i:s');
		$cases = M()->table('case_'.$table)->where($where)->select();
        $result = M()->table('case_'.$table)->where($where)->save($data);
		foreach($cases as &$case){
			$case['tab_name'] = 'case_'.$table;
		}
        //同步案件
        $syncData = $cases;
        $this->sync('case',$syncData,'edit');
		$case_videos = M()->table('case_video_'.$table)->where($where)->select();
        M()->table('case_video_'.$table)->where($where)->save($data);
		foreach($case_videos as &$case_video){
			$case_video['tab_name'] = 'case_video_'.$table;
		}
        //同步视频
        $syncData = $case_videos;
        $this->sync('case_video',$syncData,'edit');
		
        if($result){
            $res['status'] = true;
            $res['message'] = '删除警情成功';
        }else{
            $res['status'] = false;
            $res['message'] = '删除警情失败';
        }
        $this->write_log('删除'.$request['case_key']);
        return $res;
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
        $request = u2gs($request);
        $page = $request['page'];
        $rows = $request['rows'];
        $areacode = $request['areacode'];

        /*$manger_sql = $this->get_manger_sql();
        $where[] = $manger_sql;
        $manger_sql = str_replace('OR','AND',str_replace('LIKE', 'NOT LIKE', $manger_sql));
        $where[] = str_replace('=','!=',str_replace('or','and',str_replace('like', 'not like', $manger_sql)));*/
        $is_read_areas = D($this->models['area'])->where('is_read = 0')->getField('areacode',true);
        $depts = $this->parseAreacode($is_read_areas);
        //$getDepts = explode(',',$request['dept_list']);
        $notLikes = array();
        foreach ($depts as $value) {
            if(!$value) $notLikes[] = $value;
        }
        foreach ($notLike as &$value) {
            $value = 'areacode not like '.$value.'%';
        }
        if(!empty($notLike)){
            $where[] = implode(' AND ',$notLike);
        }
        if($areacode){
            $where['areacode'] = array('like',$areacode.'%');
        }
        $where['del_flag'] = $request['del_flag'] ? $request['del_flag'] : 0;
        $where['hand_status'] = array('NEQ',2);
        $where['alarm_type'] = array('NEQ',0);
        if($request['alarm_no']) $where['alarm_no'] = array('like','%'.$request['alarm_no'].'%');    //警情编号
        if($request['alarm_name']) $where['alarm_name'] = array('like','%'.$request['alarm_name'].'%');    //警情名称
        if($request['alarm_addr']) $where['alarm_addr'] = array('like','%'.$request['alarm_addr'].'%');    //警情名称
        if($request['jyxm']) $where[$jybhField] = $request['jyxm'];                 //警员编号
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
        //error_log(json_encode($tables)."\r\n",3,'error.log');
        $res = array();
        $res['total'] = array_sum($total);
        $res['rows'] = array();
        foreach ($tables as $table => $start_limit) {
            // error_log('查询数据表:'.'case_'.$table.'---查询数据:'.implode(',',$start_limit)."\r\n",3,'error.log');
            $data = M()->table('case_'.$table)->where($where)->limit(implode(',',$start_limit))->order('scsj desc')->select();
            $res['rows'] = array_merge($res['rows'],(array)$data);
        }
        $alarm_type = $this->get_val_item('dictionary', 'alarm_type');
        $case_type = $this->get_val_item('dictionary', 'case_type');
        $areaInfos = D($this->models['area'])->getField('areacode,is_read');
        $video_source = $this->get_val_item('dictionary','video_source');
        foreach ($res['rows'] as &$row) {
            $row['alarm_type_name'] = $alarm_type[$row['alarm_type']];
            $row['case_type_name'] = $case_type[$row['case_type']];
            $row['is_read'] = $areaInfos[$row['areacode']];
            $row['source_name'] = $video_source[$row['source']];
        }
        $this->saveExcel($res); //监测是否为导出
        return g2us($res);
    }
    //申请移交
    public function apply_case($request)
    {
        //case_key  案件关键字 申请案件
        $start_time = $request['start_time'];
        $table = 'case_'.date('Ym',strtotime($start_time));
        $data['apply_jybh'] = session('code');
        $data['apply_jyxm'] = u2g(session('user'));
        $data['apply_areacode'] = session('areacode');
        $data['apply_areaname'] = u2g(session('areaname'));
        $data['update_time'] = date('Y-m-d H:i:s');
        $data['hand_status'] = 1;   //待审核状态
        //$db = D($this->models['case']);
        $where['case_key'] = $request['case_key'];
        $result = M()->table($table)->where($where)->save($data);
        //同步
        $syncData[] = array('tab_name'=>$table,'case_key'=>$request['case_key']);
        $this->sync('case',$syncData,'edit');

        if($result){
            $res['message'] = '提交申请成功';
        }else{
            $res['message'] = '提交申请失败';
        }
        $info = M()->table($table)->where($where)->find();
        $this->write_log('申请移交：'.g2u($info['title']).$res['message']);
        return $res;
    }
    //审批通过
    public function allow_apply($request)
    {
        //case_key 案件关键字
        //start_time  视频开始时间
        $start_time = $request['start_time'];
        $table = 'case_'.date('Ym',strtotime($start_time));
        $data['hand_status'] = 2;   //初始状态
        $where['case_key'] = $request['case_key'];
        $result = M()->table($table)->where($where)->save($data);
        //同步
        $syncData[] = array('tab_name'=>$table,'case_key'=>$request['case_key']);
        $this->sync('case',$syncData,'edit');

        $res['message'] = $result ? '审核通过' : '审核通过失败,可能原因该案件已被其他管理员审核通过';
        $this->write_log('审核申请-'.$request['case_key'].$res);
        return  $res;
    }
    //初始化案件
    public function init_case($request)
    {
        //case_key  案件关键字
        //start_time  案件开始时间
        $start_time = $request['start_time'];
        $table = 'case_'.date('Ym',strtotime($start_time));
        $keys = array('alarm_no','alarm_name','alarm_addr','case_name','case_no','remark','case_empl','case_dept');
        $initData = array_fill_keys($keys,'');
        $initData['alarm_type'] = 0;
        $initData['case_type'] = 0;
        $initData['update_time'] = date('Y-m-d H:i:s');
        // $this->ajaxReturn($request);
        $where['case_key'] = $request['case_key'];
        $res = M()->table($table)->where($where)->save($initData);
        //同步
        $syncData[] = array('tab_name'=>$table,'case_key'=>$request['case_key']);
        $this->sync('case',$syncData,'edit');

        $result['message'] = $res ? '初始化案件成功' : '初始化案件失败';
        $this->write_log('初始化案件-'.$request['case_key']);
        return $result;
    }
    //案件合并
    public function case_merage($request)
    {
        //$caseInfo=>array('case_key'=>'start_time');
        $caseInfo = $request['caseInfo'];
        foreach ($caseInfo as $case_key => $start_time) {
            $case_time[$case_key] = $start_time;
            $time_table[$start_time] = 'case_'.date('Ym',strtotime($start_time));
        }
        ksort($case_time);
        $endCase = M()->table($time_table[end($case_time)])->where('case_key="'.key($case_time).'"')->find();
        //将第一个案件的结束时间调整至最后一个案件的结束时间
        $data['end_time'] = $endCase['end_time'];
        $data['update_time'] = date('Y-m-d H:i:s');
        reset($case_time);
        $where['case_key'] = key($case_time);
        $result = M()->table($time_table[current($case_time)])->where($where)->save($data);
        //同步案件
        $syncData[] = array('tab_name'=>$time_table[current($case_time)],'case_key'=>$where['case_key']);
        $this->sync('case',$syncData,'edit');

        $video_data['case_key'] = $where['case_key'];
        $syncVideoData = array();
        foreach ($caseInfo as $case_key => $start_time) {
            if($case_key == $where['case_key']) continue;
            $video_where['case_key'] = $case_key;
            $video_table = 'case_video_'.date('Ym',strtotime($start_time));
            $case_table = 'case_'.date('Ym',strtotime($start_time));
            //同步数据
            $videoData = M()->field('wjbh,"'.$video_table.'" as tab_name')->table($video_table)->where($video_where)->select();
            //修改case_video
            $result = M()->table($video_table)->where($video_where)->save($video_data);
            $syncVideoData = array_merge($syncVideoData,$videoData);
            //删除案件
            $result = M()->table($case_table)->where($video_where)->delete();
            //同步数据
            $syncCaseData[] = array('tab_name'=>$case_table,'case_key'=>$case_key);
        }
        $this->sync('case',$syncCaseData,'del');
        $this->sync('case_video',$syncVideoData,'edit');

        //将相关视频合并
        if($result){
            $res['status'] = true;
            $res['message'] = '合并案件成功';
            $this->write_log('合并案件-'.implode(',',array_keys($caseInfo)));
        }else{
            $res['status'] = false;
            $res['message'] = '合并案件失败';
        }
        return $res;
    }
    //案件拆包
    public function case_slice($request)
    {
        $case_key = $request['case_key'];
        $wjbhInfo = $request['wjbhInfo'];
        foreach ($wjbhInfo as $wjbh => $start_time) {
            $video_time[$wjbh] = $start_time;
            $time_table[$start_time] = 'case_video_'.date('Ym',strtotime($start_time));
        }
        ksort($video_time);
        $firstTime = reset($video_time);
        $wjInfo = M()->table($time_table[$firstTime])->where('wjbh="'.key($video_time).'"')->find();
        $wjeInfo = M()->table($time_table[end($video_time)])->where('wjbh="'.key($video_time).'"')->find();
        $data['case_key'] = date('YmdHis',strtotime($firstTime)).'_'.$wjInfo['cpxh'].'_'.$wjInfo['areacode'];
        $data['title'] = date('YmdHis',strtotime($firstTime)).'_'.$wjInfo['jyxm'];
        $data['start_time'] = $firstTime;
        $data['end_time'] = $wjeInfo['end_time'];
        $data['scsj'] = date('Y-m-d H:i:s');
        $data['jybh']= $wjInfo['jybh'];
        $data['areacode'] = $wjInfo['areacode'];
        $data['jyxm'] = $wjInfo['jyxm'];
        $data['areaname'] = $wjInfo['areaname'];
        $data['update_time'] = $wjInfo['update_time'];
        $result = M()->table('case_'.date('Ym',strtotime($firstTime)))->add($data);
        if($result){
            //同步
            $syncData[] = array('tab_name'=>'case_'.date('Ym',strtotime($firstTime)),'case_key'=>$data['case_key']);
            $this->sync('case',$syncData,'add');

            $video_data['case_key'] = $data['case_key'];
            foreach ($wjbhInfo as $wjbh => $start_time) {
                $video_where['wjbh'] = $wjbh;
                $video_table = 'case_video_'.date('Ym',strtotime($start_time));
                M()->table($video_table)->where($video_where)->save($video_data);
                $syncVideoData[] = array('tab_name'=>$video_table,'wjbh'=>$wjbh);
            }
            $this->sync('case_video',$syncVideoData,'edit');
            $res['status'] = true;
            $res['message'] = '拆分案件成功';
            $this->write_log('拆分案件'.$case_key.',新增案件.'.$data['case_key']);
        }else{
            $res['status'] = false;
            $res['message'] = '拆分案件失败';
        }

        return $res;
    }
    //撤销，拒绝申请
    public function init_apply($request)
    {
        //case_key 案件关键字
        //action  0 撤销 1 拒绝
        $data['hand_status'] = 0;   //初始状态
        //$db = D($this->models['case']);
        $start_time = $request['start_time'];
        $table = 'case_'.date('Ym',strtotime($start_time));
        $where['case_key'] = $request['case_key'];
        $result = M()->table($table)->where($where)->save($data);
        if($result){
            if($request['action'] == 0) $res['message'] = '撤销成功';
            if($request['action'] == 1) $res['message'] = '申请已拒绝';
        }else{
            if($request['action'] == 0) $res['message'] = '撤销失败';
            if($request['action'] == 1) $res['message'] = '申请拒绝失败';
        }
        //同步
        $syncData[] = array('tab_name'=>$table,'case_key'=>$request['case_key']);
        $this->sync('case',$syncData,'edit');
        $this->write_log(g2u($request['case_key']).$result['message']);
        return $res;
    }
    //播放,编辑信息
    public function play_case_info($request)
    {
        //case_key  案件关键字
        $caseWhere['case_key'] = $request['case_key'];
        $caseWhere['del_flag'] = $request['del_flag'] ? $request['del_flag'] : 0;
        $start_time = $request['start_time'];
        $table = date('Ym',strtotime($start_time));
        $caseInfo = M()->table('case_'.$table)->where($caseWhere)->find();
        if($request['video_time']['btime']) $caseWhere['start_time'][] = array('EGT',$request['video_time']['btime']);
        if($request['video_time']['etime']) $caseWhere['start_time'][] = array('ELT',$request['video_time']['etime']);
        $data = M()->table('case_video_'.$table)->where($caseWhere)->select();
        $fileType = $this->get_val_item('dictionary','filetype');
        $video_source = $this->get_val_item('dictionary','video_source');
        foreach ($data as &$value) {
            if(strpos($value['bfwz'],'http') === false){
                $filePath = $value['bfwz'];
            }else{
                //$value = 'http://192.168.0.2/fiel/....';
                $filePathArr = explode('/',$value['bfwz']);
                $filePath = '../'.implode('/',array_slice($filePathArr,3));
            }
            if(!is_file($filePath)) $value['bfwz'] = '';
            $value['file_type_name'] = $fileType[$value['wjlx']];
            $value['source_name'] = $video_source[$value['source']];
        }
        $res = array();
        $res['total'] = count($data);
        $res['rows'] = $data;
        $res['info'] = $caseInfo;
        return g2us($res);
    }
    //案件统计
    public function case_sat($request)
    {
        //----------------
        //基础where条件
        //----------------
        $areacode = $request['areacode'] ? $request['areacode'] : session('areacode');
        $manger_sql = $this->get_manger_sql($areacode);
        $where[] = $manger_sql;
        $emWhere[] = $this->get_manger_sql($areacode,'areacode','code');
        $peWhere = $wsWhere[] = $this->get_manger_sql($areacode,'areacode',false);
        //---------------------
        //查询时间
        //---------------------
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'].' 00:00:00' : date('Y-m-d',time()-6*24*60*60).' 00:00:00'; //开始时间
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'].' 23:59:59' : date('Y-m-d').' 23:59:59'; //结束时间
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        //统计时间段
        $where['start_time'][] = array('EGT',$btime);      //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        //各部门警员总数统计   完成
        $employeedb = D($this->models['employee']);
        $allEmp = $employeedb->field('areacode,count(1) as empnum')->where($emWhere)->group('areacode')->select();
        //执法民警数
        $quaemWhere = $emWhere;
        $quaemWhere['empl_qualify'] = array('neq',0);
        $quaempnum = $employeedb->field('areacode,count(1) as quaempnum')->where($quaemWhere)->group('areacode')->select();
        //各部门上传警员统计
        $emWhere['start_time'][] = array('EGT',$btime);      //开始时间
        $emWhere['start_time'][] = array('ELT',$etime); //结束时间
        $where['del_flag'] = $request['del_flag'] ? $request['del_flag'] : 0;
        $uploadEmps = array();
        foreach ($months as $month) {
            if(!in_array('case_'.$month,$tables)) continue;
            $upload = M()->table('case_'.$month)->field('distinct(jybh) as jybh,areacode')->where($where)->group('jybh')->select();
            $uploadEmps = array_merge((array)$upload,$uploadEmps);
        }
        $uploadEmpArr = array();
        foreach ($uploadEmps as $value) {
            $uploadEmpArr[$value['areacode']][] = $value['jybh'];
        }
        $uploadNum = array();
        foreach ($uploadEmpArr as $key => $value) {
            $arr = array('areacode'=>$key,'uploadNum'=>count(array_unique($value)));
            $uploadNum[] = $arr;
        }
        //-----------------
        //统计案件数和警情数
        //------------------
        $caseNUm = array();
        foreach ($months as $month) {
            if(!in_array('case_'.$month,$tables)) continue;
            $case = M()->table('case_'.$month)->field('areacode,count(1) as num,alarm_type,case_type')->where($where)->group('areacode,alarm_type,case_type')->select();
            $caseNUm = array_merge((array)$case,$caseNUm);
        }
        //----------------
        //统计工作站
        //-----------------
        $wsDb = D($this->models['wsbase']);
        $wsData = $wsDb->field('areacode,count(1) as num,zxzt')->where($wsWhere)->group('areacode,zxzt')->select();
        //------------
        //执法记录仪
        //------------
        $peDb = D($this->models['pebase']);
        $peData = $peDb->field('areacode,count(1) as num')->where($peWhere)->group('areacode')->select();
        //------------------
        //数据初始化阶段
        //------------------
        $areaAction = A($this->actions['area']);
        $areadb = D($this->models['area']);
        $initInfos = $areadb->field('areaid,areacode,areaname,fatherareaid as _parentId')->select();
        $keys = array('empnum','quaempnum','recorder','uploadnum','unuploadnum','uploadper','common','major','impede',
                      'force','spot','otherdata','disuse','unmark','num','criminal','administration','case_num',
                      'wsbase_num','wsbase_online','wsbase_per');
        $initData = array_fill_keys($keys,0);
        $data = array();
        foreach ($initInfos as $key=> &$value) {
            $data[$value['areacode']] = array_merge($value,$initData);
        }
        //--------------------
        //解析数据
        //------------------
        $mark = 'areacode';
        //---------------
        //解析案件数
        //---------------
        $fields = array('num'=>'num');
        $paress = array(
            'alarm_type'=>array(
                'field'=>'num',
                'info'=>array(
                    'unmark'=>0,    //未编辑
                    'common'=>1,    //一般
                    'major'=>2,     //重大
                    'impede'=>3,    //妨碍
                    'force'=>4,     //强制
                    'spot'=>5,      //现场
                    'disuse'=>6,    //无效
                    'otherdata'=>7, //其他
                    )
                ),
            'case_type'=>array(
                'field'=>'num',
                'info'=>array(
                    'criminal'=>2,  //刑事
                    'administration'=>1, //行政
                    )
                )

            );
        $data = $this->pares_data($data,$caseNUm,$fields,$mark, $paress);
        //-----------
        //解析工作站
        //-----------
        $fields = array('wsbase_num'=>'num');
        $paress = array(
            'zxzt'=>array(
                'field'=>'num',
                'info'=>array(
                    'wsbase_online'=>1,    //在线数
                    )
                )
            );
        $data = $this->pares_data($data,$wsData,$fields,$mark,$paress);
        //--------------
        //解析执法记录仪
        //--------------
        $fields = array('recorder'=>'num');
        $data = $this->pares_data($data,$wsData,$fields,$mark);
        //--------------
        //解析总民警
        //--------------
        $fields = array('empnum'=>'empnum');
        $data = $this->pares_data($data,$allEmp,$fields,$mark);
        //--------------
        //执法民警
        //--------------
        $fields = array('quaempnum'=>'quaempnum');
        $data = $this->pares_data($data,$quaempnum,$fields,$mark);
        //--------------
        //上传民警
        //--------------
        $fields = array('uploadnum'=>'uploadNum');
        $data = $this->pares_data($data,$uploadNum,$fields,$mark);
        //----------------
        //为选择部门
        //-----------------
        $unselectAreas = array();
        if($request['areas']) $unselectAreas = $request['areas'];
        //-------------
        //是否进行数据累加
        //-------------
        if($request['link'] == 'link'){
            $fields = $keys;
            $pidFiled = '_parentId';
            $area_code_id = $areadb->getField('areacode,areaid');
            $change = array();
            foreach ($data as $key => $value) {
                if(in_array($key,$unselectAreas)) $value = array_merge($value,$initData);
                $change[$area_code_id[$key]] = $value;
            }
            $data = $this->ksort_sat_data($change,$pidFiled,$fields);
        }
        krsort($data);
        //---------------
        //最后数据处理
        //---------------
        //显示数据
        $areaInfo = $areadb->where('areacode="'.$areacode.'"')->find();
        $show = $areadb->where('fatherareaid="'.$areaInfo['areaid'].'"')->getField('areacode',true);
        $areacodes = array();
        if(!empty($show)) $areacodes = $show;
        $areacodes[] = $areacode;
        foreach ($data as $key=> &$value) {
            if(in_array($key,$unselectAreas)) $value = array_merge($value,$initData);
            if(!in_array($value['areacode'],$areacodes)){
                unset($data[$key]);
                continue;
            }
            if($value['areacode'] == $areacode) unset($value['_parentId']);
            $value['unuploadnum'] = $value['empnum'] - $value['uploadnum'];                         //未上传民警数
            $value['uploadper'] = $value['empnum'] == 0 ? 0 : round(($value['uploadnum'] / $value['empnum'])*100,2).'%';            //上传率
            $value['wsbase_per'] = $value['wsbase_num'] == 0 ? 0 :round(($value['wsbase_online'] / $value['wsbase_num'])*100,2).'%';   //工作站在线率
            $value['case_num'] = $value['administration'] + $value['criminal'];     //案件数
        }
        $rows = array_values($data);
        $total = count($rows);
        $this->saveExcel(compact('total','rows'));
        $rows = g2us($rows);
        $this->ajaxReturn(compact('total','rows'));
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
    public function pares_data($init,$data,$fields,$mark = '',$paress = array(),$doOne)
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
    /**
     * 按照需求上下级进行数据叠加
     * @param  array $data   [id]=>['id'=>id,'num'=>num,'pid'=>pid]
     * @param  string $pidFiled pid字段
     * @param  array $fields 需要叠加的字段
     * @param  array $root 根菜单节点
     * @return array         格式化之后的数据
     */
    public function ksort_sat_data($data,$pidFiled,$fields,$root)
    {
        krsort($data);
        foreach ($data as $key => $value) {
            $checkArr[$value[$pidFiled]][] = $key;
        }
        foreach ($data as $key => $value) {
            if(isset($root)){
                if($data[$key]['_parentId'] == $root)  unset($data[$key]['_parentId']);
            }
            if(empty($checkArr[$key])) continue;
            foreach ($checkArr[$key] as $val) {
                foreach ($fields as $field) {
                    $data[$key][$field] = $data[$key][$field] + $data[$val][$field];
                }
            }
        }
        return $data;
    }
    /*********************
     * 首页统计
     *********************/
    public function show_home_sat($request)
    {
        $btime = date('Y-m-d H:i:s',time()-9.5*24*60*60);
        $etime = date('Y-m-d H:i:s',time()-3.5*24*60*60);
        $dates = $this->get_twoDates($btime,$etime,'Y-m-d','+1 day');
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $tables = $this->get_dbTables();
        $where[] = $this->get_manger_sql();
        $where['start_time'][] = array('EGT',$btime);
        $where['start_time'][] = array('ELT',$etime);
        $where['del_flag'] = $request['del_flag'] ? $request['del_flag'] : 0;
        $unWhere = $where;
        $unWhere['alarm_type'] = 0;
        $unWhere['areacode'] = session('areacode');
        $unWhere['jybh'] = session('code');
        $alarm_total = array();
        $unalarm_total = array();
        foreach ($months as $month) {
            if(!in_array('case_'.$month,$tables)) continue;
            $unalarms = M()->table('case_'.$month)->field("count(1) as num,DATE_FORMAT(start_time,'%Y-%m-%d') as day")->where($unWhere)->group('day')->select();
            $unalarm_total = array_merge((array)$unalarms,$unalarm_total);
        }
        $countInfo = array('unalarms'=>0);
        $initInfo = array_fill_keys($dates,$countInfo);
        foreach ($unalarm_total as  $value) {
            $initInfo[$value['day']]['unalarms'] = (int)$value['num'];
        }
        return $initInfo;
    }
    public function show_area_sat($request)
    {
        $btime = date('Y-m-d H:i:s',time()-9.5*24*60*60);
        $etime = date('Y-m-d H:i:s',time()-3.5*24*60*60);
        $areadb = D($this->models['area']);
        $areaid = session('areaid') ? session('areaid') : 0;
        $areas = $areadb->where('fatherareaid="'.$areaid.'"')->getField('areacode,areaname');
        /*if(session('areacode')){
            $areas[session('areacode')] = u2g(session('areaname'));
        }*/
        $where[] = $this->get_manger_sql();
        $where['start_time'][] = array('EGT',$btime);
        $where['start_time'][] = array('ELT',$etime);
        $where['del_flag'] = $request['del_flag'] ? $request['del_flag'] : 0;
        $unwhere = $where;
        $where['alarm_type'] = 0;
        $unwhere['alarm_type'] = array('NEQ',0);
        $result = array();
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $tables = $this->get_dbTables();
        ksort($areas);
        foreach ($areas as $key=>$value) {
            $where['areacode'] = array('like',$key.'%');
            $total = 0;
            $untotal = 0;
            foreach ($months as $month) {
                if(!in_array('case_'.$month,$tables)) continue;
                $total = $total + M()->table('case_'.$month)->where($where)->count();
                $untotal = $unTotal + M()->table('case_'.$month)->where($unwhere)->count();
            }
            $all[] = $total + $untotal;
            $result[] = array('areaname'=>g2u($value),'total'=>$total,'untotal'=>$untotal,'all'=>$total + $untotal);
        }
        array_multisort($all,SORT_DESC,$result);
        return $result;
    }
    //编辑情况统计
    public function sat_edit_con($request)
    {
        $areadb = D($this->models['area']);
         //----------------
        //基础where条件
        //----------------
        $areacode = $request['areacode'] ? $request['areacode'] : session('areacode');
        $where[] = $this->get_manger_sql($areacode,'areacode',false);
        //---------------------
        //查询时间
        //---------------------
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'].' 00:00:00' : date('Y-m-d',time()-6*24*60*60).' 00:00:00'; //开始时间
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'].' 23:59:59' : date('Y-m-d').' 23:59:59'; //结束时间
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        //统计时间段
        $where['start_time'][] = array('EGT',$btime); //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        $where['del_flag'] = $request['del_flag'] ? $request['del_flag'] : 0;
        $areaInfo = $areadb->where('areacode="'.$areacode.'"')->find();
        $showAreas = $areadb->where('fatherareaid="'.$areaInfo['areaid'].'"')->getField('areacode,areaname');
        // $this->ajaxReturn(g2us($showAreas));
        $keys = array('upload','unmark','markTotal','common','major','impede',
                      'force','spot','otherdata','disuse','criminal','administration','uploadediter');
        $showData = array();
        $allTotal = array_fill_keys($keys,0);
        foreach ($showAreas as $key => $val) {
            // echo 'areacode:'.$key.'--areaname:'.g2u($value)."<br>";
            $initData = array_fill_keys($keys,0);
            $where['areacode'] = array('like',$key.'%');
            $caseWhere = $where;
            $caseWhere['case_type'] = array('NEQ',0);
            $alarmData = array();
            $caseData = array();
            foreach ($months as $month) {
                if(!in_array('case_'.$month,$tables)) continue;
                $alarm = M()->table('case_'.$month)->where($where)->field('count(1) as num,alarm_type')->group('alarm_type')->select();
                $case = M()->table('case_'.$month)->where($caseWhere)->field('count(1) as num,case_type')->group('case_type')->select();
                $alarmData = array_merge((array)$alarm,$alarmData);
                $caseData = array_merge((array)$case,$caseData);
            }
            //分析警情
            foreach ($alarmData as $value) {
                $initData['upload'] += $value['num'];  //上传数据
                if($value['alarm_type'] == '1') $initData['common'] += $value['num'];
                if($value['alarm_type'] == '2') $initData['major'] += $value['num'];
                if($value['alarm_type'] == '3') $initData['impede'] += $value['num'];
                if($value['alarm_type'] == '4') $initData['force'] += $value['num'];
                if($value['alarm_type'] == '5') $initData['spot'] += $value['num'];    
                if($value['alarm_type'] == '6') $initData['otherdata'] += $value['num'];
                if($value['alarm_type'] == '7') $initData['disuse'] += $value['num'];
                if($value['alarm_type'] == '0') $initData['unmark'] += $value['num'];
            }
            $initData['markTotal'] = $initData['upload'] - $initData['unmark'];  //已编辑合计
            foreach ($caseData as $value) {
                if($value['case_type'] == '1') $initData['administration'] += $value['num'];
                if($value['case_type'] == '2') $initData['criminal'] += $value['num'];
            }
            $initData['uploadediter'] = $initData['upload'] == 0 ? 0 : round(($initData['markTotal'] / $initData['upload'])*100,2);  //上传编辑率
            $orderData[] = $initData['uploadediter'];
            $orderTotal[] = $initData['upload'];
            $initData['uploadediter'] = $initData['uploadediter'].'%';
            $initData['areaname'] = g2u($val);
            //统计合计
            $allTotal['upload'] += $initData['upload'];
            $allTotal['common'] += $initData['common'];
            $allTotal['major'] += $initData['major'];
            $allTotal['impede'] += $initData['impede'];
            $allTotal['force'] += $initData['force'];
            $allTotal['spot'] += $initData['spot'];
            $allTotal['otherdata'] += $initData['otherdata'];
            $allTotal['disuse'] += $initData['disuse'];
            $allTotal['unmark'] += $initData['unmark'];
            $allTotal['criminal'] += $initData['criminal'];
            $allTotal['administration'] += $initData['administration'];
            $allTotal['markTotal'] += $initData['markTotal'];
            $showData[] = $initData;
        }
        array_multisort($orderData,SORT_DESC,$orderTotal,SORT_DESC,$showData);
        $allTotal['areaname'] = '合计';
        $allTotal['uploadediter'] = $allTotal['upload'] == 0 ? '0%' : round(($allTotal['markTotal'] / $allTotal['upload'])*100,2).'%';  //上传编辑率
        $showData[] = $allTotal;
        $data['total'] = count($showData);
        $data['rows'] = $showData;
        $this->draw_edit_con_sat_excel($data,$btime,$etime,g2u($areaInfo['areaname']));
        return $data;
    }
    /**
     * 编辑情况统计表
     * @param  array $showData 搜索的数据
     * @param  date $btime    搜索开始时间
     * @param  date $etime    搜索结束时间
     * @param  string $areaname 搜索部门
     * @return string   文件存放地址
     */
    public function draw_edit_con_sat_excel($data,$btime,$etime,$areaname)
    {
        if(!I('export'))  return false;

        $title = $areaname.date('n.j',strtotime($btime)).'-'.date('n.j',strtotime($etime)).'执法记录仪上传数据编辑情况统计表'.'    统计日期'.date('n月j日');

        //导出Excel表格
        Vendor('PHPExcel.PHPExcel');
        Vendor('PHPExcel.PHPExcel.Writer.Excel5');
        Vendor('PHPExcel.PHPExcel.Style.Alignment');
        /* 实例化类 */
        $objPHPExcel = new \PHPExcel();
        /* 设置输出的excel文件为2005兼容格式 */
        $objWriter = new \PHPExcel_Writer_Excel5($objPHPExcel);
        /* 设置当前的sheet */
        $objPHPExcel->setActiveSheetIndex(0);
        $objActSheet = $objPHPExcel->getActiveSheet();
        $cells = array(
            array('cell'=>array('A1','O1'),'content'=>$title),
            array('cell'=>array('A2','A4'),'content'=>'序号'),
            array('cell'=>array('B2','B4'),'content'=>'单位'),
            array('cell'=>array('C2','C4'),'content'=>'已上传数据'),
            array('cell'=>array('D2','D4'),'content'=>'未编辑数据'),
            array('cell'=>array('E2','N2'),'content'=>'已编辑数据'),
            array('cell'=>array('E3','E4'),'content'=>'合计'),
            array('cell'=>array('F3','K3'),'content'=>'警情'),
            array('cell'=>array('L3','M3'),'content'=>'案件'),
            array('cell'=>array('F4'),'content'=>'一般警情'),
            array('cell'=>array('G4'),'content'=>'重大警情'),
            array('cell'=>array('H4'),'content'=>'当场盘问检查'),
            array('cell'=>array('I4'),'content'=>'行政强制执行'),
            array('cell'=>array('J4'),'content'=>'阻碍民警执法妨碍公务'),
            array('cell'=>array('K4'),'content'=>'其他数据'),
            array('cell'=>array('L4'),'content'=>'行政案件'),
            array('cell'=>array('M4'),'content'=>'刑事案件'),
            array('cell'=>array('N3','N4'),'content'=>'无效数据'),
            array('cell'=>array('O2','O4'),'content'=>'上传编辑率'),
        );
        $fieldCells = array(
            'areaname'=>'B',
            'upload'=>'C',
            'unmark'=>'D',
            'markTotal'=>'E',
            'common'=>'F',
            'major'=>'G',
            'impede'=>'H',
            'force'=>'I',
            'spot'=>'J',
            'otherdata'=>'K',
            'disuse'=>'N',
            'criminal'=>'M',
            'administration'=>'L',
            'uploadediter'=>'O');
        foreach ($cells as $cell) {
            /*dump($cell['cell']);
            echo implode(':',$cell['cell']);
                exit;*/
            if(count($cell['cell']) > 1){
                $cellActive = $objActSheet->mergeCells(implode(':',$cell['cell']))->getStyle($cell['cell'][0]);
            }else{
                $cellActive = $objActSheet->getStyle($cell['cell'][0]);
            }
            $cellActive->applyFromArray(
                array(
                    'font' => array (
                        'bold' => true
                    ),
                    'alignment' => array(
                        'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                        'vertical'=>\PHPExcel_Style_Alignment::VERTICAL_CENTER
                    )
                )
            );
            $objActSheet->setCellValue($cell['cell'][0],$cell['content']);
        }
        $i = 5;
        $j = 1;
        foreach ($data['rows'] as $info) {
            $objActSheet->getStyle('A'.$i)->applyFromArray(
                array(
                    'alignment' => array(
                        'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                        'vertical'=>\PHPExcel_Style_Alignment::VERTICAL_CENTER
                    )
                )
            );
            $objActSheet->setCellValue('A'.$i,$j);
            foreach ($info as $key => $value) {
                $objActSheet->getStyle($fieldCells[$key].$i)->applyFromArray(
                    array(
                        'alignment' => array(
                            'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                            'vertical'=>\PHPExcel_Style_Alignment::VERTICAL_CENTER
                        )
                    )
                );
                $objActSheet->setCellValue($fieldCells[$key].$i,$value);
            }
            $i++;
            $j++;
        }
        $id = session('code');
        $dateDir = './Public/download/'.date('Ymd');
        if(!is_dir($dateDir))   mkdir($dateDir);
        $excelFileName = date('YmdHis').rand(10,99);
        $url = $dateDir."/repWork_".$excelFileName."{$id}.xls";
        try
        {
            $objWriter->save($url);
            $url = substr($url, 1);
            $host = $this->get_local_ip().$_SERVER['SERVER_PORT'];
                    //gethostbyname('');
            $res = __ROOT__.$url;
        }
        catch(Exception $e)
        {
            $res = false;
        }
        if($res){
            $result['status'] = true;
            $result['message'] = '成功。';
            $result['fileUrl'] = $res;
            $this->write_log('导出数据',$this->logContent);
            $this->ajaxReturn($result);
        }else{
            $result['status'] = false;
            $result['message'] = '可能原因：服务器权限不足。';
            $result['fileUrl'] = $res;
            $this->ajaxReturn($result);
        }
    }
}