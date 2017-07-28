<?php
/**************************
 *ajax请求
 **************************/
namespace Home\Controller;

class AjaxController extends CommonController
{
    //统一ajax接口地址
    //实现后端程序的规范化,方法一律使用return
    public function index()
    {
        session('[pause]');         //关闭session写入，防止页面请求时缓慢
        $request = I('');
        $url = $_REQUEST['tpUrl'];           //请求地址
        $type = isset($_REQUEST['reType']) ? $_REQUEST['reType'] : '';    //返回的格式 JSON,JSONP,XML,EVAL
        list($controller,$method) = explode('/', $url); //控制器,方法
        unset($request['tpUrl'],$request['rand'],$request['reType']);   //删除无用项
        $action = A(ucwords($controller));  //实例化控制器
        $result = $action->$method($request);   //调用方法
        $this->ajaxReturn($result,$type);
    }
}