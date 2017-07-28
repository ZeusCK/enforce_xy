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

    public function type_list($request)
    {
        $page = $request['page'];
        $rows = $request['rows'];
        $db = D($this->models['dictionary']);
        $where['item'] = '';
        $where['value'] = '';
        $result = $db->getTableList($where,$page,$rows);
        return g2us($result);
    }

    public function data_list($request)
    {
        $page = $request['page'];
        $rows = $request['rows'];
        $db = D($this->models['dictionary']);
        $where['item'] = array('NEQ','');
        $where['type'] = $request['type'];
        $result = $db->getTableList($where,$page,$rows,'`order` asc');
        return g2us($result);
    }

    public function data_add($request)
    {
        return D($this->models['dictionary'])->getTableAdd(u2gs($request));
    }

    public function data_edit($request)
    {
        $db = D($this->models['dictionary']);
        if(isset($request['item'])){
            $dicInfo['id'] = $request['id'];
        }else{
            $dicInfo = $db->where(['id'=>$request['id']])->field('type,name')->find();
            unset($request['id']);
        }
        return $db->getTableEdit($dicInfo,u2gs($request));
    }

    public function data_remove($request)
    {
        $action = $request['action'];
        if($action == 1){       //删除类型 1 类型删除 2 记录删除
            $where['type'] = array('in',$request['type']);
        }else{
            $where['id'] = array('in',$request['id']);
        }
        return D($this->models['dictionary'])->getTableDel($where);
    }
}