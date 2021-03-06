<?php
namespace Home\Model;

use Think\Model;

class BaseModel extends Model
{
    public function getList($page=1,$rows=20)
    {
        $rows = $this->page($page,$rows)->select();
        $total = $this->count();
        $total = $total ? $total : 0;
        $rows = empty($rows) ? array() : $rows;
        return compact('total','rows');
    }
    public function getAdd($add,$success='添加成功',$fail='添加失败')
    {
        if($id = $this->add($add)){
            $return['message'] = $success;
            $return['status']  = true;
            $return['add_id'] = $id;
        }else{
            $return['message'] = $fail;
            $return['status']  = false;
        }
        return $return;
    }
    public function getEdit($data,$success='更新成功',$fail='更新失败')
    {
        //判断更新失败
        if($this->save($data)){
            $return['message'] = $success;
            $return['status']  = true;
        }else{
            
            $return['message'] = $fail;
            $return['status']  = false;
       }
       return $return;
    }
    public function getDel($success='删除成功',$fail='删除失败')
    {

        if($this->delete())
        {
            $return['message'] = $success;
            $return['status']  = true;
        }
        else
        {
            $return['message'] = $fail;
            $return['status']  = false;
        }
       return $return;
    }
    public function getTableList($where=null,$page,$rows,$order=null,$field=null,$join=null)
    {
        //判断条件为空
        if(empty($where))
        {
            $info  = $this->page($page,$rows)->order($order)->field($field)->join($join)->select();
            $count = $this->join($join)->count();
        }
        else
        {
            $count = $this->where($where)->join($join)->count();
            $info  = $this->where($where)->field($field)->join($join)->page($page,$rows)->order($order)->select();
        }
        //判断结果不为空
        if(!empty($info))
        {
            $data['total'] = $count;
            $data['rows']  = $info;
        }
        else
        {
            $data['total'] = 0;
            $data['rows']  = array();
        }
        //用于语句调试
        //$data['sql'] = $this->getLastSql();
        return $data;
    }

    //添加并返回结果
    public function getTableAdd($data)
    {
        $result = $this->add($data);
        //判断添加失败
        if(!$result)
        {
            $return['message'] = '添加失败';
            $return['status']  = false;
        }
        else
        {
           $return['message'] = '添加成功';
           $return['status']  = true;
           $return['add_id'] = $result;
       }
       return $return;
    }

    //编辑并返回结果
    public function getTableEdit($where,$data)
    {
        $result = $this->where($where)->save($data);
        //判断更新失败
        if(!$result){
            $return['message'] = '更新失败!';
            $return['status']  = false;
        }else{
            $return['message'] = '更新成功!';
            $return['status']  = true;
       }
       return $return;
    }

    //删除并返回结果
    public function getTableDel($where)
    {
        $result = $this->where($where)->delete();
         //判断删除失败
        if(!$result)
        {
            $return['message'] = '删除失败!';
            $return['status']  = false;
        }
        else
        {
            $return['message'] = '删除成功!';
            $return['status']  = true;
        }
       return $return;
    }

    // 判断数据库中是否已经存在
    public function checkExistence($content)
    {
        return $this->where($content)->find();
    }
}