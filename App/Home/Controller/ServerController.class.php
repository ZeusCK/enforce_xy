<?php
/************************************
 *设备控制器 web 服务器
 *************************************/
namespace Home\Controller;

class ServerController extends CommonController
{
    //表的表名-自增主键
    protected $models = ['server'=>'Enforce\ServerMachine', //服务器
                        'area'=>'Enforce\AreaDep'];
    protected $actions = ['employee'=>'Employee','area'=>'Area'];
    protected $logContent = '设备管理/服务器管理';
    public function server_show()
    {
        $this->display('server');
    }

    //服务器
    public function server_list($request)
    {
        //status 在线状态
        //server_ip 服务器ip
        //areacode 部门编号
        $request = u2gs($request);
        if(session('user')){
            $areaSql = $this->get_manger_sql($request['areacode'],'areacode',false).' OR areacode=""';
            $where[] = $areaSql;
        }
        if($request['status'] != '') $where['status'] = $request['status'];
        if($request['server_ip'] != '') $where['server_ip'] = array('like','%'.$request['server_ip'].'%');

        $db =  D($this->models['server']);
        $show_sat = $db->where($where)->field('count(1) as num,status')->group('status')->select();
        $data = $db->getTableList($where,$page,$rows,'areacode asc');
        $statusType = $this->get_val_item('dictionary', 'status');
        foreach ($data['rows'] as &$value) {
            $value['status_name'] = $statusType[$value['status']];
            $value['config_name'] = $statusType[$value['status']];
        }
        $data['offline'] = $data['online'] = 0;
        foreach ($show_sat as $val) {
            if($val['status'] == 0) $data['offline'] = $val['num'];
            if($val['status'] == 1) $data['online'] = $val['num'];

        }
        $this->saveExcel($data,'服务器');
        return g2us($data);
    }
    //服务器
    public function server_add($request)
    {
        //server_ip  服务器ip  必填
        //server_port 服务器端口
        //trademark  服务器品牌
        //config 服务器配置
        //account 帐号
        //password 密码
        //db_user 数据库用户
        //db_pwd  数据库密码
        //phone   联系电话
        //remark  备注
        $request['create_time'] = date('Y-m-d H:i:s');
        $request['create_user'] = session('user');
        $db =  D($this->models['server']);
        if($db->where(array('server_ip'=>$request['server_ip']))->find()){
            return  array('status'=>false,'message'=>'该服务器已存在');
        }
        $request['create_user'] = session('user');
        $request['create_time'] = date('Y-m-d H:i:s');
        $request = u2gs($request);
        $result = $db->getTableAdd($request);
        if($result['status']){
            //同步
            $syncData[] = $request;
            $this->sync('server_machine',$syncData,'add');
        }
        $this->write_log('添加'.$request['server_ip']);
        return $result;
    }
    //服务器
    public function server_edit($request)
    {
        //server_ip  服务器ip  不可更改
        //server_port 服务器端口
        //trademark  服务器品牌
        //config 服务器配置
        //account 帐号
        //password 密码
        //db_user 数据库用户
        //db_pwd  数据库密码
        //phone   联系电话
        //remark  备注
        $db =  D($this->models['server']);
        $where['id'] = $request['id'];
        unset($request['id']);
        $info = $db->where($where)->find();
        $request = u2gs($request);
        $result = $db->getTableEdit($where,$request);
        if($result['status']){
            if($request['server_ip']){
                $request['old_server_ip'] = $info['server_ip'];
            }else{
                $request['server_ip'] = $info['server_ip'];
            }
            $syncData[] = $request;
            $this->sync('server_machine',$syncData,'edit');
        }
        $this->write_log('修改'.$info['server_ip']);
        return $result;
    }
    //服务器
    public function server_remove($request)
    {
        $server_ip = $request['server_ip'];
        $where['server_ip'] = array('in',u2g($server_ip));
        $db =  D($this->models['server']);
        $result = $db->getTableDel($where);
        if($result['status']){
           $info = explode(',', $where['server_ip']);
           foreach ($info as $value) {
               $syncData[] = array('server_ip'=>$value);
           }
           $this->sync('server_machine',$syncData,'del');
        }
        $this->write_log('删除服务器:'.$server_ip);
        return $result;
    }
    //服务器在线，离线统计
    public function server_sat()
    {
        $db =  D($this->models['server']);
        //确定查看部门
        $areadb = D($this->models['area']);
        $areacode = session('userarea') ? session('userarea') : C('DEFAULT_AREACODE');
        $areaInfo =  $areadb->where('areacode="'.$areacode.'"')->getField('areaid,areaname');
        reset($areaInfo);
        $areas = $areadb->where('fatherareaid="'.key($areaInfo).'"')->getField('areacode,areaname');
        $areas[$areacode] = current($areaInfo);
        $where[] = $this->get_manger_sql('','areacode',false);
        $where['areacode'] = array('neq','');
        $show_sat = $db->where($where)->field('count(1) as num,status')->group('status')->select();
        $where['status'] = 0;
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
            if($val['status'] == 0) $data['offline'] = $val['num'];
            if($val['status'] == 1) $data['online'] = $val['num'];
        }
        return $data;
    }
    //导入警员的excel
    public function import_excel()
    {
        $func = A('Function');
        $db = D($this->models['server']);
        $where[] = $this->get_manger_sql('','areacode',false);
        $area_code_name = D($this->models['area'])->where($where)->getField('areacode,areaname');
        $enableType = array_flip($this->get_val_item('dictionary','enable'));
        $area_name_code = array_flip($area_code_name);
        $code_arr = array_keys($area_code_name);
        $res = $func->save_upload($_FILES['file'],array('xls','xlsx'));
        $key_code = array();
        $name_code = array('服务器IP'=>'server_ip',
                           '单位'=>'areaname',
                           '端口号'=>'server_port',
                           '品牌'=>'trademark',
                           '配置'=>'config',
                           '帐号'=>'account',
                           '密码'=>'password',
                           '数据库账号'=>'db_user',
                           '数据库密码'=>'db_pwd',
                           '联系电话'=>'phone',
                           '备注'=>'remark',
                           );
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
                    if($key_code[$k] == 'qyzt'){
                        $saveData[$key_code[$k]] = $enableType[$val];
                        continue;
                    }
                    $saveData[$key_code[$k]] = $val;
                }
                $empInfo = $db->where('server_ip="'.$saveData['server_ip'].'"')->find();
                if($empInfo){
                    $res = $db->where('server_ip="'.$saveData['server_ip'].'"')->save($saveData);
                    $syncUpdateData[] = $saveData;
                }else{
                    $saveData['create_time'] = date('Y-m-d H:i:s');
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