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
        $areaSql = $this->get_manger_sql($request['areacode'],'areacode',false).' OR areacode=""';
        $where[] = $areaSql;
        if($request['status'] != '') $where['status'] = $request['status'];
        if($request['server_ip'] != '') $where['server_ip'] = array('like','%'.$request['server_ip'].'%');

        $db =  D($this->models['server']);
        $show_sat = $db->where($where)->field('count(1) as num,status')->group('status')->select();
        $data = $db->getTableList($where,$page,$rows,'areacode asc');
        $statusType = $this->get_val_item('dictionary', 'status');
        foreach ($data['rows'] as &$value) {
            $value['status_name'] = $statusType[$value['status']];
        }
        $data['offline'] = $data['online'] = 0;
        foreach ($show_sat as $val) {
            if($val['status'] == 0) $data['offline'] = $val['num'];
            if($val['status'] == 1) $data['online'] = $val['num'];
        }
        $this->saveExcel($data);
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
        $result = $db->getTableAdd(u2gs($request));
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
        $result = $db->getTableEdit($where,u2gs($request));
        return $result;
    }
    //服务器
    public function server_remove($request)
    {
        $server_ip = $request['server_ip'];
        $where['server_ip'] = array('in',u2g($server_ip));
        $db =  D($this->models['server']);
        $result = $db->getTableDel($where);
        $this->write_log('删除服务器:'.$server_ip);
        return $result;
    }
    //服务器在线，离线统计
    public function server_sat()
    {
        $db =  D($this->models['server']);
        $query[] = $this->where_key_or(explode(',',session('userarea')),'areaid').'OR areaid = 0';
        $result = $db->where($query)->field('count(id) as value,status as name')->group('status')->select();
        $initData = array(1=>array('value'=>0,'name'=>'在线'),0=>array('value'=>0,'name'=>'离线'));
        foreach ($result as $value) {
            $initData[$value['name']]['value']  = $value['value'];
        }
        $this->ajaxReturn(array_values($initData));
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
                           '所属部门'=>'areaname',
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
                }else{
                    $res = $db->add($saveData);
                }
                $res ? $success++ : $fail++;
                $result['message'] = '允许导入：'.$allow.'<br>'.'禁止导入：'.$deny.'<br>'.'成功导入：'.$success.'<br>'.'导入失败：'.$fail.'<br>';
                $this->write_log($result['message']);
            }
        }else{
            $result['message'] = '文件上传失败，可能原因文件类型不对，服务器权限不足';
        }
        exit(json_encode($result));
    }
}