<?php
/************************************
 *同步控制器
 *************************************/
namespace Home\Controller;

class SyncController
{
    protected $table = '';      //同步表
    protected $data = array();  //同步数据
    protected $key = '';        //关键字段
    protected $op = array(
        'add'=>1,
        'edit'=>3,
        'del'=>2,
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
    public function sync($op)
    {
        foreach ($this->data as &$value) {
            $value['status'] = $this->op[$op];
            $value['update_time'] = $this->msectime();
        }
        D($this->table)->addAll($data);
    }
    /**获取Unix毫秒时间戳
     * @return float Unix毫秒时间戳
     */
    function msectime()
    {
        list($msec, $sec) = explode(' ', microtime());
        return (int)$sec.str_pad((int)($msec*1000),3,"0",STR_PAD_LEFT);
    }

}