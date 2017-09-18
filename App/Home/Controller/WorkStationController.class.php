<?php
/************************************
 *设备控制器 web  空间站 工作站
 *************************************/
namespace Home\Controller;

class WorkStationController extends CommonController
{
    //表的表名-自增主键
    protected $models = ['wsbase'=>'Enforce\WsBase',    //工作站
                        'area'=>'Enforce\AreaDep'];
    protected $actions = ['employee'=>'Employee','area'=>'Area'];
    protected $views = ['ws_base'=>'wsBase'];
    protected $logContent = '设备管理/工作站管理';
    public function ws_base_show()
    {
        $this->display($this->views['ws_base']);
    }
    //工作站
    public function ws_base_list()
    {
        $request = u2g(I(''));
        $page = I('page');
        $rows = I('rows');
        $db =  D($this->models['wsbase']);
        //支持模糊搜索
        foreach ($request as $key => $value) {
            if($value != '' && $key!='zxzt' && $key!='qyzt' && $key != 'areaid' && $key != 'areacode'){
                $where[$key] = array('like','%'.$value.'%');
            }
        }
        if($request['zxzt'] != '') $where['zxzt'] = I('zxzt');
        if($request['qyzt'] != '') $where['qyzt'] = I('qyzt');
        if(session('user')){
            $where[] = $this->get_manger_sql($request['areacode'],'areacode',false). ' OR areacode=""';
        }
        $where = u2gs($where);
        $data = $db->getTableList($where,$page,$rows,'areacode asc');
        $show_sat = $db->where($where)->field('count(1) as num,zxzt')->group('zxzt')->select();
        foreach ($data['rows'] as &$value) {
            $value['zxztname'] = $value['zxzt'] == 0 ? u2g('离线') : u2g('在线');
            $value['qyztname'] = $value['qyzt'] == 0 ? u2g('停用') : u2g('启用');
        }
        $data['offline'] = 0;
        $data['online'] = 0;
        foreach ($show_sat as $val) {
            if($val['zxzt'] == 0) $data['offline'] = $val['num'];
            if($val['zxzt'] == 1) $data['online'] = $val['num'];
        }
        $this->saveExcel($data,'工作站'); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
    //工作站
    public function ws_base_add()
    {
        //dh  负责人电话
        //hzr 负责人
        //gzz_ip 工作站IP  必填
        //qyzt 启用状态 0:未启用，1：启用
        $request = I();
        $db =  D($this->models['wsbase']);
        if($db->where(array('gzz_ip'=>$request['gzz_ip']))->find()){
            $this->ajaxReturn(array('status'=>false,'message'=>'该工作站已存在'));
        }
        // $request['create_user'] = session('user');
        $request['create_time'] = date('Y-m-d H:i:s');
        $request = u2gs($request);
        $result = $db->getTableAdd($request);
        if($result['status']){
            //同步
            $syncData[] = $request;
            $this->sync('ws_base',$syncData,'add');
        }
        $this->write_log('添加'.$request['gzz_ip'].':'.g2u($request['areaname']));
        $this->ajaxReturn($result);
    }
    //工作站
    public function ws_base_edit()
    {
        //dh 负责人电话
        //fzr 负责人
        //dz 地址
        //gzz_ip 工作站IP  必填
        //qyzt 启用状态 0:未启用，1：启用
        $request = I();
        $db =  D($this->models['wsbase']);
        $where['id'] = $request['id'];
        unset($request['id']);
        $info = $db->where($where)->find();
        $request = u2gs($request);
        $result = $db->getTableEdit($where,$request);
        if($result['status']){
            if($request['gzz_ip']){
                $request['old_gzz_ip'] = $info['gzz_ip'];
            }else{
                $request['gzz_ip'] = $info['gzz_ip'];
            }
            $syncData[] = $request;
            $this->sync('ws_base',$syncData,'edit');
        }
        $this->write_log('修改'.$request['gzz_ip'].':'.g2u($request['areaname']));
        $this->ajaxReturn($result);
    }
    //工作站
    public function ws_base_remove()
    {
        $gzz_ip = I('gzz_ip');
        $request['gzz_ip'] = array('in',u2g($gzz_ip));
        $db =  D($this->models['wsbase']);
        $result = $db->getTableDel($request);
        if($result['status']){
           $info = explode(',', $request['gzz_ip']);
           foreach ($info as $value) {
               $syncData[] = array('gzz_ip'=>$value);
           }
           $this->sync('server_machine',$syncData,'del');
        }
        $this->write_log('删除工作站:'.$gzz_ip);
        $this->ajaxReturn($result);
    }
    //工作站状态统计
    public function ws_status_statistics()
    {
        $db =  D($this->models['wsbase']);
        $query[] = $this->get_manger_sql($request['areacode'],'areacode',false). ' OR areacode=""';
        $data = $db->where($query)->field('count(id) as num,zxzt')->group('zxzt');
        $this->ajaxReturn($data);
    }
    //工作站在线，离线统计
    public function ws_sat($request)
    {
        $db =  D($this->models['wsbase']);
        //确定查看部门
        $areadb = D($this->models['area']);
        $areacode = session('areacode') ? session('areacode') : C('DEFAULT_AREACODE');
        $areaInfo =  $areadb->where('areacode="'.$areacode.'"')->getField('areaid,areaname');
        reset($areaInfo);
        $areas = $areadb->where('fatherareaid="'.key($areaInfo).'"')->getField('areacode,areaname');
        $areas[$areacode] = current($areaInfo);
        $where[] = $this->get_manger_sql('','areacode',false);
        $where['areacode'] = array('neq','');
        $show_sat = $db->where($where)->field('count(1) as num,zxzt')->group('zxzt')->select();
        $where['zxzt'] = 0;
        //统计离线
        foreach ($areas as $areacode => $areaname) {
            $where['areacode'] = array('like',$areacode.'%');
            $total = $db->where($where)->count();
            if($total != 0){
                $result[] = array('areaname'=>g2u($areaname),'total'=>$total);
                $orderTotal[] = $total;
            }
        }
        array_multisort($orderTotal,SORT_DESC,$result);
        $data['total'] = count($result);
        $data['rows'] = $data['total'] == 0 ? array() : $result;
        $data['offline'] = 0;
        $data['online'] = 0;
        foreach ($show_sat as $val) {
            if($val['zxzt'] == 0) $data['offline'] = $val['num'];
            if($val['zxzt'] == 1) $data['online'] = $val['num'];
        }
        return $data;
        /*$query[] = $this->where_key_or(explode(',',session('userarea')),'areacode').'OR areacode = ""';
        $result = $db->where($query)->field('count(id) as value,zxzt as name')->group('zxzt')->select();
        $initData = array(1=>array('value'=>0,'name'=>'在线'),0=>array('value'=>0,'name'=>'离线'));
        foreach ($result as $value) {
            $initData[$value['name']]['value']  = $value['value'];
        }
        $this->ajaxReturn(array_values($initData));*/
    }
    //导入excel
    public function import_excel()
    {
        $func = A('Function');
        $db = D($this->models['wsbase']);
        $where[] = $this->get_manger_sql('','areacode',false);
        $area_code_name = D($this->models['area'])->where($where)->getField('areacode,areaname');
        $area_name_code = array_flip($area_code_name);
        $code_arr = array_keys($area_code_name);
        $res = $func->save_upload($_FILES['file'],array('xls','xlsx'));
        $key_code = array();
        $name_code = array('工作站IP'=>'gzz_ip',
                           '单位'=>'areaname',
                           '负责人'=>'fzr',
                           '负责人电话'=>'dh',
                           '启用状态'=>'qyzt');
        $allow = 0; //允许导入
        $deny = 0;  //禁止导入
        $success = 0;   //成功导入
        $fail = 0;      //失败导入
        if($res){
            $data = $func->read_excel($res);
            $header = array_shift($data);
            foreach ($header as $key => $value) {
                if(array_key_exists($value,$name_code)){
                    $key_code[$key] = $name_code[$value];
                }
            }
            $allData = array();
            foreach ($data as $value) {
                $saveData= array();
                $syncUpdateData = array();
                $syncAddData = array();
                foreach ($value as $k => $val) {
                    $val = $val === null ? '' : $val = trim(u2g($val));
                    if(!array_key_exists($k,$key_code)) continue;
                    if($key_code[$k] == 'areaname'){
                        if(!in_array($val,$area_code_name)){
                            $deny++;
                            continue;
                        }else{
                            $saveData['areacode'] = $area_name_code[$val];
                            $allow++;
                        }
                    }
                    $saveData[$key_code[$k]] = $val;
                }
                $empInfo = $db->where('gzz_ip="'.$saveData['gzz_ip'].'"')->find();
                if($empInfo){
                    $res = $db->where('gzz_ip="'.$saveData['gzz_ip'].'"')->save($saveData);
                    $syncUpdateData[] = $saveData;
                }else{
                    $res = $db->add($saveData);
                    $syncAddData[] = $saveData;
                }
                $res ? $success++ : $fail++;
            }
            $result['message'] = '允许导入：'.$allow.'<br>'.'禁止导入：'.$deny.'<br>'.'成功导入：'.$success.'<br>'.'导入失败：'.$fail.'<br>';
                $this->write_log($result['message']);
            $this->sync('server_machine',$syncUpdateData,'edit');
            $this->sync('server_machine',$syncAddData,'add');
        }else{
             $result['message'] = '文件上传失败，可能原因文件类型不对，服务器权限不足，文件超过2M';
        }
        exit(json_encode($result));
    }
}