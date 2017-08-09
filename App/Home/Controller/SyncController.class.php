<?php
/************************************
 *同步控制器
 *************************************/
namespace Home\Controller;
use Think\Controller;

class SyncController extends Controller
{
    protected $table = '';      //同步表
    protected $data = array();  //同步数据
    protected $key = '';        //关键字段
    protected $op = array(
        'add'=>'add',
        'edit'=>'edit',
        'del'=>'del',
    );         //行为
    public function table($table='')     //需要同步的表
    {
        $this->table = $table;

        return $this;
    }
    public function data($data)         //保存数据
    {
        $this->data = $data;
        return $this;
    }
    public function key($key)       //设置关键字段
    {
        $this->key = $key;
        return $this;
    }
    public function sync($op='add')     //操作
    {
        $this->$op();
    }
    public function add()
    {
        D($this->table)->addAll($this->data);
    }
    public function edit()
    {
    }
    public function remove()
    {
        
    }
}