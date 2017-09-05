<?php
namespace Home\Controller;

class SatDetailController extends CommonController
{
    //模型
    protected $models = ['case'=>'Enforce\Case',
                         'pe_video_list'=>'Enforce\PeVideoList',
                         'area'=>'Enforce\AreaDep',
                         'employee'=>'Enforce\Employee',
                         'dictionary'=>'Enforce\dictionary',
                         'wsbase'=>'Enforce\WsBase',
                         'pebase'=>'Enforce\peBase'];
    protected $fieldInfo = ['uploadnum'=>array('fun'=>'emp_sat','type'=>''),
                            'unuploadnum'=>array('fun'=>'emp_sat','type'=>''),
                            'common'=>array('fun'=>'case_detail','type'=>'1'),
                            'major'=>array('fun'=>'case_detail','type'=>'2'),
                            'spot'=>array('fun'=>'case_detail','type'=>'3'),
                            'force'=>array('fun'=>'case_detail','type'=>'4'),
                            'impede'=>array('fun'=>'case_detail','type'=>'5'),
                            'otherdata'=>array('fun'=>'case_detail','type'=>'6'),
                            'unmark'=>array('fun'=>'case_detail','type'=>'0'),
                            'disuse'=>array('fun'=>'case_detail','type'=>'7'),
                            'num'=>array('fun'=>'case_detail','type'=>''),
                            'administration'=>array('fun'=>'case_detail','type'=>'1'),
                            'criminal'=>array('fun'=>'case_detail','type'=>'2'),
                            'case_num'=>array('fun'=>'case_detail','type'=>''),
                            'wsbase_num'=>array('fun'=>'ws_detail','type'=>''),
                            'wsbase_online'=>array('fun'=>'ws_detail','type'=>'')
                            ];
    public function data_list($request)
    {
        //未选择部门的不统计
        $sql = '';
        if($request['areas']){
            foreach ($request['areas'] as &$area) {
                $area = 'areacode != "'.$area.'"'; 
            }
            $sql = implode(' AND ', $request['areas']);
        }
        $fun = $this->fieldInfo[$request['field']]['fun'];
        $type = $this->fieldInfo[$request['field']]['type'];
        return $this->$fun($request,$sql,$type);
    }
    //查询工作站详情
    public function ws_detail($request,$sql,$type)
    {
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        if($sql != '') $where[] = $sql;
        $areacode = $request['areacode'] ? $request['areacode'] : '';       //查询部门
        $where[] = $this->get_manger_sql($areacode,'areacode',false);
        $db = D($this->models['wsbase']);
        if($request['field'] == 'wsbase_num'){
            $data = $db->getTableList($where,$page,$rows,'areacode asc');
        }
        if($request['field'] == 'wsbase_online'){
            $where['zxzt'] = 1;
            $data = $db->getTableList($where,$page,$rows,'areacode asc');
        }
        foreach ($data['rows'] as $key => &$value) {
            $value['zxztname'] = $value['zxzt'] == 0 ? u2g('离线') : u2g('在线');
            $value['qyztname'] = $value['qyzt'] == 0 ? u2g('停用') : u2g('启用');
        }
        return g2us($data);
    }
    //查询案件详情
    public function case_detail($request,$sql,$type)
    {
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        if($sql != '') $where[] = $sql;
        $field = $request['field'];
        if($field == 'criminal' || $field == 'administration' || $field == 'case_num'){   //案件类型
            $where['case_type'] = $type != '' ? $type : array('NEQ',0);
        }else{
            if($type != '') $where['alarm_type'] = $type;
        }
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        $areacode = $request['areacode'] ? $request['areacode'] : '';       //查询部门
        $manger_sql = $this->get_manger_sql($areacode);
        $where[] = $manger_sql;

        //if($request['case_type']) $where['case_type'] = $request['case_type'];      //案件类型
        //if($request['alarm_type']) $where['alarm_type'] = $request['alarm_type'];      //警情类型
        if($request['jybh']) $where['jybh'] = $request['jybh'];                 //警员编号
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'].' 00:00:00' : date('Y-m-d',time()-6*24*60*60).' 00:00:00';
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'].' 23:59:59' : date('Y-m-d').' 23:59:59';
        $where['start_time'][] = array('EGT',$btime);      //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        $where['del_flag'] = 0; //未删除数据
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
        $video_source = $this->get_val_item('dictionary','video_source');
        foreach ($res['rows'] as &$row) {
            $row['alarm_type_name'] = $alarm_type[$row['alarm_type']];
            $row['case_type_name'] = $case_type[$row['case_type']];
            $row['source_name'] = $video_source[$row['source']];
        }
        return g2us($res);
    }
    //查询警员详情
    public function emp_sat($request,$sql,$type)
    {
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        if($sql != '') $where[] = $sql;
        $areacode = $request['areacode'] ? $request['areacode'] : '';       //查询部门
        $allwhere = $where;
        $allwhere[] = $this->get_manger_sql($areacode,'areacode','code');
        $page = $request['page'] ? $request['page'] : 1;
        $rows = $request['rows'] ? $request['rows'] : 20;
        $manger_sql = $this->get_manger_sql($areacode,'areacode','jybh');
        $where[] = $manger_sql;
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'].' 00:00:00' : date('Y-m-d',time()-6*24*60*60).' 00:00:00';
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'].' 23:59:59' : date('Y-m-d').' 23:59:59';
        $where['start_time'][] = array('EGT',$btime);      //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        $where['start_time'][] = array('EGT',$btime); //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        $uploadEmps = array();
        $where['del_flag'] = 0; //未删除数据
        foreach ($months as $month) {
            if(!in_array('case_'.$month,$tables)) continue;
            $upload = M()->table('case_'.$month)->distinct(true)->where($where)->order('areacode ASC')->getField('jybh',true);
            $uploadEmps = array_merge((array)$upload,$uploadEmps);
        }
        // $this->ajaxReturn($uploadEmps);
        $employeedb = D($this->models['employee']);

        $allEmp = $employeedb->where($allwhere)->order('areacode ASC')->getField('code',true);
        $uploadEmps = array_unique($uploadEmps);
        $areas = D($this->models['area'])->getField('areacode,areaname');
        //上传民警
        if($request['field'] == 'uploadnum'){
            $total = count($uploadEmps);
            $selects = array_slice($uploadEmps, ($page-1)*$rows,$rows);
            $emWhere['code'] = array('in',$selects);
            $rows = $employeedb->where($emWhere)->order('areacode desc')->select();
        }
        //未上传民警
        if($request['field'] == 'unuploadnum'){
            $unuploadEmps = array_diff($allEmp,$uploadEmps);
            $total = count($unuploadEmps);
            $selects = array_slice($unuploadEmps, ($page-1)*$rows,$rows);
            $emWhere['code'] = array('in',$selects);
            $rows = $employeedb->where($emWhere)->order('areacode desc')->select();
        }
        foreach ($rows as &$value) {
            $value['areaname'] = $areas[$value['areacode']];
        }
        $data = compact('total','rows');
        return g2us($data);
    }
}