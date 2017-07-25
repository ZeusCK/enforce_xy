<?php
namespace Home\Controller;

class DictionaryController extends CommonController
{
    //使用的模型
    protected $models = ['dictionary'=>'Enforce\Dictionary'];
    //定义日志模块
    protected $logContent = '系统管理/字典管理';

    public function index()
    {
        $this->display('dictionary');
    }

    public function type_list()
    {
        $page = I('page');
        $rows = I('rows');
        $db = D($this->models['dictionary']);
        $where['item'] = '';
        $where['value'] = '';
        $result = $db->getTableList($where,$page,$rows);
        $this->ajaxReturn(g2us($result));
    }

    public function data_list()
    {
        $page = I('page');
        $rows = I('rows');
        $db = D($this->models['dictionary']);
        $where['item'] = array('NEQ','');
        $where['type'] = I('type');
        $result = $db->getTableList($where,$page,$rows);
        $this->ajaxReturn(g2us($result));
    }

    public function data_add()
    {
        $request = I();
        $result = $db->getTableAdd(u2gs($request));
        $this->ajaxReturn($result);
    }

    public function data_edit()
    {
        $request = I();
        $result = $db->getTableEdit(['id'=>$request['id']],u2gs($request));
        $this->ajaxReturn($result);
    }

    public function data_remove()
    {
        $request = I();
        $action = I('action');
        if($action == 1){       //删除类型 1 类型删除 2 记录删除
            $where['type'] = array('in',$request['type']);
        }else{
            $where['id'] = array('in',$request['id']);
        }
        $result = $db->getTableDel($where);
        $this->ajaxReturn($result);
    }
}