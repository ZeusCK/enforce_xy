<?php
/************************************
 *设备控制器 web 服务器
 *************************************/
namespace Home\Controller;

class ServerController extends CommonController
{
    //表的表名-自增主键
    protected $models = ['server'=>'Enforce\ServerMachine'];           //服务器
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
}