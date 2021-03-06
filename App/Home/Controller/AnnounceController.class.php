<?php
/**************************
 *ajax请求
 **************************/
namespace Home\Controller;

class AnnounceController extends CommonController
{
    protected $models = ['sys_notice'=>'Enforce\SysNotice'];
    protected $actions = ['employee'=>'Employee',
                          'area'=>'Area'];
    protected $logContent = '系统管理\公告管理';
    //公告管理
    public function index()
    {
        $this->display('announce');
    }
    //显示
    public function announce_list($request)
    {
        //title 标题
        //create_time 创建时间
        //areacode 部门代码
        $where[] = $this->get_manger_sql($request['areacode'],'areacode',false);
        if($request['title']) $where['title'] = array('like','%'.u2g($request['title']).'%');
        $where['start_time'][] = array('EGT',$request['start_time']['btime'] ? $request['start_time']['btime'].' 00:00:00' : date('Y-m-d',time()-6*24*60*60).' 00:00:00');      //开始时间
        $where['start_time'][] = array('ELT',$request['start_time']['etime'] ? $request['start_time']['etime'].' 23:59:59' : date('Y-m-d').' 23:59:59');
        $db = D($this->models['sys_notice']);
        $data = $db->getTableList($where,$request['page'],$request['rows'],'start_time desc');
        $this->saveExcel($data,'公安详情');
        return g2us($data);
    }
    //增加
    public function announce_add($request)
    {
        //title  公告标题     不能为空
        //content 公告内容
        //start_time 开始日期   不能为空
        //end_time  结束日期  默认一周 不能为空
        $request['start_time'] = $request['start_time'].' 00:00:00';
        $request['end_time'] = $request['end_time'].' 23:59:59';
        $request['areacode'] = session('userarea'); //创建单位
        $request['areaname'] = session('areaname');
        $request['create_time'] = date('Y-m-d H:i:s');  //创建时间
        $request['creater_name'] = session('user');
        $request['creater_id'] = session('code');
        $db = D($this->models['sys_notice']);
        $request = u2gs($request);
        $result = $db->getTableAdd($request);
        if($result['status']){
            $this->write_log('新增公告:'.g2u($request['title']));
            $syncData[] = $request;
            $this->sync('sys_notice', $syncData, 'add');
        }
        return $result;
    }
    //编辑
    public function announce_edit($request)
    {
        //title  公告标题     不能为空
        //content 公告内容
        //start_time 开始日期   不能为空
        //end_time  结束日期  默认一周 不能为空
        $where['id'] = $request['id'];
        $info = D($this->models['sys_notice'])->where($where)->find();
        $request = u2gs($request);
        $result = D($this->models['sys_notice'])->getTableEdit($where,$request);
        if($result['status']){
            $this->write_log('修改公告:'.g2u($info['title']));
            $syncData[] = $request;
            $this->sync('sys_notice', $syncData, 'edit');
        }
        return $result;
    }
    //删除
    public function announce_remove($request)
    {
        $where['id'] = array('in',$request['id']);
        $info = D($this->models['sys_notice'])->where($where)->select();
        $result = D($this->models['sys_notice'])->getTableDel($where);
        if($result['status']){
            $this->write_log('删除公告:'.g2u(implode(',',array_column($info,'title'))));
            $syncData = $info;
            $this->sync('sys_notice', $syncData, 'del');
        }
        return $result;

    }
    //公告广播  符合条件的公告
    public function announce_broadcast($request)
    {
        $db = D($this->models['sys_notice']);
        $where['start_time'] = array('ELT',date('Y-m-d H:i:s'));    //开始时间小于当前时间
        $where['end_time'] = array('EGT',date('Y-m-d H:i:s'));      //结束时间大于当前时间
        $data = $db->where($where)->order('create_time desc')->select();
        foreach ($data as $key => $value) {
            if(strpos(session('userarea'),$value['areacode']) !== 0) unset($data[$key]);
        }
        $data = array_values($data);
        $total = count($data);
        $rows = array_slice($data,($page-1)*$rows,$rows);
        $res['total'] = $total;
        $res['rows'] = g2us($rows);
        return $res;
    }
}