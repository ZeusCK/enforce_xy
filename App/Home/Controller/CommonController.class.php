<?php
namespace Home\Controller;

use Think\Controller;
use Think\Model;

class CommonController extends Controller {
   /**
    * 日志模块
    * @var string
    */
    protected $logContent;
	/**
	 * 格式化easyui-tree数据格式
	 * @param  array $ids   父级菜单id
	 * @param  array $datas 修要处理的菜单
	 * @param  array $l_arr 保存菜单的一些信息  0-自身id  1-保存内容 2-父ID 3-排序
	 * @param  array $L_attributes 额外需要保存的信息 ['iconcls']//直接处理  ['iconCls'=>'iconcls']//根据键名处理
     * @param  array $check_arr 需要被勾选的数组
     * @param  array $icons 需要添加的图标 icon-remove 0-父图标 1-子图标
     * @param  array/string $noclose  无需折叠的数组  当noclose为all时全都不折叠
	 * @return array
	 */
    public function formatTree($ids,$datas,$l_arr,$L_attributes,$check_arr,$icons,$noclose)
    {
    	$formatTree = array();
        foreach ($ids as $id) {
            $odrData = array();
            foreach ($datas as $key=>$data) {
                if($id == $data[$l_arr[2]]){
                    $odrData[] = (int)$data[$l_arr[3]];
                    $nextIds[] = $data[$l_arr[0]];
                    $doTree['id'] = $data[$l_arr[0]];
                    if(!empty($check_arr)){
                        if(in_array($doTree['id'],$check_arr)){
                            $doTree['checked'] = true;
                        }
                    }
                    $doTree['text'] = $data[$l_arr[1]];
                    foreach ($L_attributes as $k=>$L_attribute) {
                        if(!is_numeric($k)){
                            $doTree[$k] = $data[$L_attribute];
                        }else{
                            $doTree[$L_attribute] = $data[$L_attribute];
                        }
                    }
                    //删除已经符合条件的数据减少下一次循环的次数
                    unset($datas[$key]);
                    $children = $this->formatTree($nextIds,$datas,$l_arr,$L_attributes,$check_arr,$icons,$noclose);
                    $nextIds = '';
                    if(!empty($children)){
                        if(is_array($noclose)){
                            if(!in_array($doTree['id'],$noclose))  $doTree['state'] = 'closed';
                        }elseif($noclose != 'all'){
                            $doTree['state'] = 'closed';
                        }
                        $doTree['children'] = $children;
                        !empty($icons) ? $doTree['iconCls'] = $icons[0] : '';
                    }else{
                        !empty($icons) ? $doTree['iconCls'] = $icons[1] : '';
                    }
                    $formatTree[] = $doTree;
                    //对于生成的菜单在进行排序
                    array_multisort($odrData,SORT_ASC,$formatTree);
                    $doTree = '';
                }
            }
        }
        return  $formatTree;
    }
    /**
     * 获取所有子联级
     * @param  array $finfos 根元素
     * @param  string $dbc     模型
     * @param  array $l_arr  0-id  1-fid
     * @return array         所有子集
     */
    public function getChData($finfos,$dbc,$l_arr)
    {
    	if(empty($finfos)) return false;

        //if(!S('chcache')) S('chcache',array());

        $db = D($dbc);
    	$infos = array();
    	foreach ($finfos as $key => $finfo) {
            if(($return = S('chcache.'.$dbc.'.'.$finfo[$l_arr[0]])) && !S('update'.$dbc)){
                //error_log('读取缓存'.'chcache.'.$dbc.'.'.$finfo[$l_arr[0]]."\r\n",3,'cache.log');
                return $return;
            }
    		$id = $finfo[$l_arr[0]];
    		$where[$l_arr[1]] = $id;
    		$infoc = $db->where($where)->select();
    		$info = array();
    		if(!empty($infoc)){
    			$info = $this->getChData($infoc,$dbc,$l_arr);
    		}
            //error_log('写入缓存'.'chcache.'.$dbc.'.'.$finfo[$l_arr[0]]."\r\n",3,'cache.log');
            $infos = array_merge($info,$infos,$infoc);
            S('chcache.'.$dbc.'.'.$finfo[$l_arr[0]],$infos);
    	}
        $cache = array();
    	return $infos;
    }
    /**
     * 获取父级数据
     * @param  array $finfos 所有子集
     * @param  string $dbc     模型
     * @param  array $l_arr  0-id  1-fid
     * @return array 父级数据
     */
    public function getParentData($finfos,$dbc,$l_arr)
    {
        if(empty($finfos)) return false;

        $db = D($dbc);
        $datas = array();
        if(!isset($allId)) static $allId = array();
        //需要查询的上级集合
        $pids = array();
        foreach ($finfos as $value) {
            if(!in_array($value[$l_arr[1]],$pids) && $value[$l_arr[1]] != 0){
                $pids[] = $value[$l_arr[1]];
            }
            $allId[] = $value[$l_arr[0]];
        }
        foreach ($finfos as $value) {
            if(false != $k = array_search($value[$l_arr[0]],$pids) ) unset($pids[$k]);
        }
        $where[] = $this->where_key_or($pids,$l_arr[0]);
        $datas = $db->where($where)->select();
        foreach ($datas as $key=>$value) {
            if(!in_array($value[$l_arr[0]],$allId)){
                $allId[] = $value[$l_arr[0]];
            }else{
                unset($datas[$key]);
            }
        }
        if(!empty($datas)) $datac = $this->getParentData($datas,$dbc,$l_arr);
        if(isset($datac) && $datac) $datas = array_merge($datas,$datac);
        return $datas;
    }
    /**
     * 获取父级数据
     * @param  array $finfos 所有子集
     * @param  string $dbc     模型
     * @param  array $l_arr  0-id  1-fid
     * @return array 父级数据
     */
    public function get_up_data($finfos,$dbc,$l_arr)
    {
        if(empty($finfos)) return false;

        $db = D($dbc);
        $datas = array();
        static $pids = array();
        foreach ($finfos as $value) {
            if(!in_array($value[$l_arr[0]],$pids)){
                $pids[] = $value[$l_arr[0]];
            }
        }
        foreach ($finfos as $finfo) {
            if(!in_array($finfo[$l_arr[1]],$pids)){
                $where[$l_arr[0]] = $finfo[$l_arr[1]];
                $data = $db->where($where)->find();
                if($data!='' && !in_array($data[$l_arr[0]],$pids)){
                    $datas[] = $data;
                }
                $pids[] = $finfo[$l_arr[1]];
            }
        }
        $datac = $this->getParentData($datas,$dbc,$l_arr);
        if($datac){
            $datas = array_merge($datas,$datac);
        }
        return $datas;
    }
    /**
     * 获取数据库中的所有表名
     * @param  array $config 数据库的配置信息
     * @return array        数据库一维数组
     */
    public function get_dbTables($config)
    {

        $tables = array();
        if(empty($config)){
            $initdb = M();
        }else{
            $initdb = M('','',$config);
        }
        try {
            $tablesArr = $initdb->query('show tables');
            $tables = array();
            foreach ($tablesArr as  $table) {
                $tables[] = array_pop($table);
            }
            return $tables;
        } catch (Exception $e) {
            return $tables;
        }
    }
    /**
     * 添加其他信息到树
     * @param array $easyuiTree 已经生成好的树
     * @param array $otherData  其他的数据信息
     * @param array $checkFiled  需要验证添加的字段  0-checkid  1-id 2-name
     * @param  array $attributes 额外需要保存的信息 ['iconcls']//直接处理  ['iconCls'=>'iconcls']//根据键名处理
     * @param string $idField  验证的字段
     * @param string $icon       加载的图标
     */
    public function add_other_info($easyuiTree,$otherData,$checkFiled,$icon,$attributes,$idField = 'id')
    {
        foreach ($easyuiTree as &$node) {
            $children = array();
            foreach ($otherData as $key=>$info) {
                //如果符合验证
                $data = array();
                if($node[$idField] == $info[$checkFiled[0]]){
                    $data['id'] = $info[$checkFiled[1]];   //id
                    $data['text'] = $info[$checkFiled[2]]; //内容
                    $data['iconCls'] = $icon;                   //图标
                    if(!empty($attributes)){
                        foreach ($attributes as $k => $attribute) {
                            if(!is_numeric($k)){
                                $data[$k] = $info[$attribute];
                            }else{
                                $data[$attribute] = $info[$attribute];
                            }
                        }
                    }
                    $children[] = $data;
                    unset($otherData[$key]);        //符合条件的删除，减少下一次的循环
                }
            }
            if($node['children']){      //如果有子节点
                //递归调用
                $childrens = $this->add_other_info($node['children'],$otherData,$checkFiled,$icon,$attributes,$idField);
                //合并数据
                if(!empty($children)){
                    $node['children'] = array_merge($children,$childrens);
                }else{
                    $node['children'] = $childrens;
                }
            }else{              //没有子节点 删除直接添加人员
                if(!empty($children)){
                    $node['children'] = $children;
                }
            }
        }
        return  $easyuiTree;
    }
    /**
     * 写日志
     * @param  string $action 操作事件 详细内容
     * @return viod
     */
    public function write_log($action)
    {
        $data['dte'] = date('Y-m-d H:i:s');
        $data['name'] = u2g(session('user'));
        $data['key'] = date('YmdHis').'_'.session('code').'_'.session('userarea');
        $data['code'] = session('code');
        $data['areacode'] = session('userarea');
        $data['areaname'] = u2g(session('areaname'));
        $module = !$this->logContent ? '未知模块' : $this->logContent;
        $data['module'] = u2g($module);
        $ip = get_client_ip();
        $data['ip'] = $ip;
        $data['cmt'] = u2g($action);
        $db = D('Enforce\SysLog');
        $db->add($data);
        $syncData[] = $data;
        $this->sync('sys_log',$syncData,'add');
    }
    /**
     * where条件拼接
     * @param  array $data  拼接数组
     * @param  string $field 字段
     * @return array        TP where
     */
    public function where_key_or($data,$field)
    {
        $count = count($data);
        if($count == 0)  return $field.'='.'""';
        if($count == 1)  return $field.'='."'".array_pop($data)."'";        //修复bug之前用的是$data[0] 防止索引 非0出现
        foreach ($data as &$value) {
            $value = $field.'='."'".$value."'";
        }
        return implode(' OR ',$data);
    }
    /**
     * 根据数据生成excel保存到服务器 返回保存地址
     * @param  array $rows  数据
     * @param  string $title  标题
     * @return string        文件地址
     */
    public function saveExcel($datas,$title='repWork')
    {

        $dir = './Public/download';     //需要删除的目录
        if(!is_dir($dir))   mkdir($dir);
        $this->del_dir($dir);

        if(!I('export'))  return false;

        $fields = I('fields');               //field name
        if($datas['total'] && $datas['total'] > 0){
            //表格查询处理
            if(array_key_exists('rows', $datas)){
                $rows = g2us($datas['rows']);
            }
            $columnTotal = count($fields);
            //生成需要设置的列
            $first = 'A';
            for ($i=0; $i < $columnTotal; $i++) {
                $abcArr[] = $first;
                $first++;
            }
            //导出Excel表格
            Vendor('PHPExcel.PHPExcel');
            /*Vendor('PHPExcel.PHPExcel.Writer.Excel5');
            Vendor('PHPExcel.PHPExcel.Style.Alignment');
            Vendor('PHPExcel.PHPExcel.Cell.DataType');*/
            /* 实例化类 */
            $objPHPExcel = new \PHPExcel();
            /* 设置输出的excel文件为2005兼容格式 */
            $objWriter = new \PHPExcel_Writer_Excel5($objPHPExcel);
            /* 设置当前的sheet */
            $objPHPExcel->setActiveSheetIndex(0);
            $objActSheet = $objPHPExcel->getActiveSheet();
            $cellActive = $objActSheet->mergeCells('A1:'.end($abcArr).'1')->getStyle('A1');
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
            $objActSheet->setCellValue('A1',$title.'       统计时间'.date('n月j日'));
            /*设置宽度*/
            foreach ($abcArr as $abc) {
                $objPHPExcel->getActiveSheet()->getColumnDimension($abc)->setWidth(15);
            }
            /* sheet标题 */
            $sheetTitle = 'title1';
            $objActSheet->setTitle($sheetTitle);
            $excelFileName = date('YmdHis').rand(10,99);
            //第一行字体及颜色
            $objStyle1 = $objActSheet->getStyle('1');
            $objFont1 = $objStyle1->getFont();
            $objFont1->setName('黑体');
            $objFont1->setSize(12);
            $col = $fields;
            $cols = array_values($col);
            $colks = array_keys($col);
            $cola = array();
            //设置投行标题
            foreach ($abcArr as $key => $abc) {
                $objActSheet->setCellValue($abc.'2',$cols[$key]);
                $cola[$abc] = $colks[$key];
            }
            //填充数据
            $data = $rows;
            $i = 3;
            foreach($data as $value)
            {
                /* excel文件内容 */
                $j = 'A';
                foreach ($value as $key=>$val) {
                    $objActSheet->setCellValueExplicit($j.$i,$value[$cola[$j]], \PHPExcel_Cell_DataType::TYPE_STRING);
                    $j++;
                }
                $i++;
            }
            $id = session('code');
            $dateDir = './Public/download/'.date('Ymd').'/'.date('His').$id;
            if(!is_dir('./Public/download/'.date('Ymd')))   mkdir('./Public/download/'.date('Ymd'));
            if(!is_dir($dateDir))   mkdir($dateDir);
            if(DIRECTORY_SEPARATOR === '/'){
                $url = $dateDir."/".$title.".xls";
            }else{
                $url = $dateDir."/".u2g($title).".xls";
            }
            try
            {
                $objWriter->save($url);
                $res = __ROOT__.substr($dateDir, 1)."/".$title.".xls";
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
        }else{
            $result['status'] = false;
            $result['message'] = '获取数据失败，或者没有数据。';
            $result['fileUrl'] = '';
            $this->ajaxReturn($result);
        }
    }
    /**
     * 删除目录
     * @param  string $dir 目标目录
     * @return void
     */
    public function del_dir($dir)
    {
        $date = date('Ymd');
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if($file == '..' || $file == '.') continue;
                    if($date > date('Ymd',strtotime($file))){
                        if(is_dir($dir.'/'.$file)){
                            $cdir = $dir.'/'.$file;
                            $this->del_dir($cdir);
                            rmdir($cdir);
                        }else{
                            unlink($dir.'/'.$file);
                        }
                    }
                }
                closedir($dh);
            }
        }
    }
    //获取本机ip地址
    public function get_local_ip()
    {
        return $_SERVER['SERVER_ADDR'];
        // DIRECTORY_SEPARATOR === '/' ? $_SERVER['SERVER_ADDR'] : gethostbyname(gethostname());
    }
    /**
     * 获取基础信息
     * @param  string $module 模型
     * @param  string $type   需要的类型
     * @return array         value=>item
     */
    public function get_val_item($module,$type = '')
    {
        $mo = D(C('Model.'.$module));
        return $mo->get_val_item($type);
    }
    /**
     * 获取两个日期之间的所有月份 包含自身
     * @param  Date $smallDate 较小的日期
     * @param  Date $bigDate   较大的日期
     * @param  string $format  生成日期的格式
     * @param  string $interval 间隔
     * @return array
     */
    public function get_twoDates($smallDate,$bigDate,$format,$interval)
    {
        $time1 = strtotime($smallDate); // 自动为00:00:00 时分秒 两个时间之间的年和月份
        $time2 = strtotime($bigDate);
        $datearr = array();
        $datearr[] = date($format,$time1);
        $datearr[] = date($format,$time2);
        while( ($time1 = strtotime($interval, $time1)) <= $time2){
              $datearr[] = date($format,$time1); // 取得递增月;
        }
        return array_unique($datearr);
    }
    /**
     * 获取需要查询的数据表
     * @param  array   $totalArr 所有符合条件的记录 每张表的记录
     * @param  integer $page     第几页
     * @param  integer $rows     记录数
     * @return array            查询的记录表及记录条数
     */
    public function get_query_table($totalArr=array(),$page=1,$rows=20)
    {
        $needTotal = $page*$rows;  //需要的记录数
        $queryArray = array();
        $total = 0;
        krsort($totalArr);
        foreach ($totalArr as $key => $value) {
            $lastTotal = $total;
            $total = $total + $value;
            if($value == 0 || $total <= ($needTotal-$rows)) continue;       //如果该表没有满足条件的记录 或者 <= 上一页条目数 直接跳过
            $start = ($needTotal-$rows) - $lastTotal;
            $start = $start < 0 ? 0 : $start;           //开始统计
            $rows = ($needTotal - $lastTotal) > $rows ? $rows : $needTotal - $lastTotal;            //需要统计的数量
            $queryArray[$key] = array($start,$rows);
            if($total >= $needTotal) break;     //如果目前统计的总数 >= 需要的总数，直接结束循环
        }
        return $queryArray;
    }
    /**
     * 根据部门编号,警员编号获取查询条件
     * @param  int $areacode 部门编号
     * @param  string $codeField 有关部门字段
     * @param  string/false $jybhField 有关警员字段 或者不进行关联
     * @return string         筛选之后的sql语句
     */
    public function get_manger_sql($areacode='',$codeField='areacode',$jybhField='jybh')
    {
        //如果实际管理的部门是 all 基础sql不做限制  否则开始限制
        $baseSql = '';
        $mangerArea = session('mangerArea');
        if(is_array($mangerArea)){
            if(!empty($mangerArea)){
                foreach ($mangerArea as $key=>&$value) {
                    $value = $codeField.' like "'.$value.'%"';
                }
                $baseSql .= implode(' OR ',$mangerArea);
            }else{
                $baseSql .= $codeField. '= ""';
            }
        }
        //如果没有查询部门,或者查询部门是自身单位的上级,那么加上警员
        //如果是警员直接加上警员编号
        if(($areacode != '' || strpos(session('userarea'),$areacode === 0)) && ($baseSql != $codeField. '= ""')){
            $areacodeSql = $codeField.' like "'.$areacode.'%"';
            $baseSql = $baseSql == '' ? $areacodeSql : '('.$baseSql.') AND '.$areacodeSql;
        }else{
            if($baseSql == '') $baseSql = '1 ';
            if($jybhField){
                $jybhSql = $jybhField.' = "'.session('code').'" AND '.$codeField.' = "'.session('userarea').'"';
                $baseSql = $baseSql == '' ? $jybhSql : $baseSql.' OR ('.$jybhSql.')';
            }
        }
        return $baseSql;
    }
    /**
     * 根据部门编号,部门类型确定实际管理的部门
     * @param  string $areacode 部门编号
     * @param  string $dept_role_id 部门角色
     * @return array           实际管理的部门
     */
    public function real_manger_area($areacode = '',$dept_role_id = 0)
    {
        $deptroledb = D('Enforce\DeptRole');
        $where['dept_role_id'] = $dept_role_id;   //自身所管辖的部门
        $areacodes = $deptroledb->where($where)->getField('dept_list');
        $areacodes = explode(',',$areacodes);
        //排除自己已经监管的部门
        foreach ($areacodes as $key => $value) {
            if(strpos($value,$areacode) === 0) unset($areacodes[$key]);
        }
        if(empty($areacodes)) return array($areacode);
        $searchArr = $this->parseAreacode($areacodes);

        if($areacode != '') $searchArr[] = $areacode;
        $searchArr = array_unique($searchArr);
        foreach ($searchArr as $key => $value) {
            if($value == '') unset($searchArr[$key]);
        }
        return $searchArr;
    }
    /**
     * 同步表
     * @param  string $table 同步表
     * @param  array $data  同步数据
     * @param  string $op    操作类型
     * @return void
     */
    public function sync($table,$data,$op)
    {
        /*try {*/
            $database = C('SYNC_DB_NAME');
            $syncTables = array('employee'=>$database.'.sync_employee',
                                'case'=>$database.'.sync_case',
                                'case_video'=>$database.'.sync_case_video',
                                'sys_notice'=>$database.'.sync_notice',
                                'sys_log'=>$database.'.sync_sys_log',
                                'pe_base'=>$database.'.sync_pe_base',
                                'ws_base'=>$database.'.sync_ws_base',
                                'server_machine'=>$database.'.sync_server_machine',
                                'area_dep'=>$database.'.sync_area_dep',
                                'dept_role'=>$database.'.sync_dept_role',
                                'role'=>$database.'.sync_role',
                                );
            $syncFields = array(
                'employee'=>array('code'=>'','old_code'=>''),
                'pe_base'=>array('cpxh'=>'','old_cpxh'=>''),
                'ws_base'=>array('gzz_ip'=>'','old_gzz_ip'=>''),
                'server_machine'=>array('server_ip'=>'','old_server_ip'=>''),
                'case'=>array('tab_name'=>'','case_key'=>''),
                'case_video'=>array('tab_name'=>'','wjbh'=>''),
                'sys_notice'=>array('title'=>''),
                'sys_log'=>array('key'=>''),
                'area_dep'=>array('areacode'=>'','old_areacode'=>''),
                'dept_role'=>array('dept_role_id'=>''),
                'role'=>array('roleid'=>''),
                );
            $ops = array('add'=>1,'del'=>2,'edit'=>3);
            foreach ($data as &$value) {
                $value = array_intersect_key($value,$syncFields[$table]);
                $value['status'] = $ops[$op];
                $value['update_time'] = $this->msectime();
            }
            if(!empty($data)) D($syncTables[$table])->addAll($data);
        /*} catch (Exception $e) {

        }*/

    }
    /**获取Unix毫秒时间戳
     * @return float Unix毫秒时间戳
     */
    function msectime()
    {
        list($msec, $sec) = explode(' ', microtime());
        return (int)$sec.str_pad((int)($msec*1000),3,"0",STR_PAD_LEFT);
    }
    /**
     * 解析最小部门代码
     * ['1215','121516','121416','12141617']  返回 ['1215','121416']
     * @param  array $areacodes 部门代码
     * @return array            解析出最顶级的部门代码
     */
    public function parseAreacode($areacodes)
    {
        $minLength = strlen(reset($areacodes));
        $searchArr = array(current($areacodes));
        foreach ($areacodes as $key => $value) {
            if($minLength < strlen($value)) continue;
            if($minLength > strlen($value)){
                $minLength = strlen($value);
                $searchArr = array();
                $searchArr[] = $value;
            }
            if($minLength == strlen($value)) $searchArr[] = $value;
        }
        $searchArr = array_unique($searchArr);
        $checkAreacode = array_diff($areacodes,$searchArr);
        foreach ($checkAreacode as $key => $value) {
            foreach ($searchArr as $val) {
                if(strpos($value,$val) === 0) unset($checkAreacode[$key]);
            }
        }
        if(!empty($checkAreacode)) $searchArr = array_merge($searchArr,$this->parseAreacode($checkAreacode));
        return $searchArr;
    }
}