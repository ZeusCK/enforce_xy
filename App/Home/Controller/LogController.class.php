<?php
//显示
namespace Home\Controller;

class LogController extends CommonController
{
    protected $models = ['peLogList'=>'Enforce\PeLogList',      //记录仪日志
                         'wsLog'=>'Enforce\WsLog',              //工作站日志
                         'sysLog'=>'Enforce\SysLog',             //系统日志
                         'wsbase'=>'Enforce\WsBase',            //工作站
                         'employee'=>'Enforce\Employee',            //执法仪
                         ];
    protected $actions = ['employee'=>'Employee'];
    protected $views = ['pelog'=>'peLog',
                        'wslog'=>'wsLog',
                        'syslog'=>'sysLog'];
    protected $logContent = '日志管理/日志';
    //页面显示
    public function log_show()
    {
        $logType = I('logType');
        $this->display($this->views[$logType]);
    }
    //执法仪日志
    public function pe_log_list()
    {
        //获取能显示的执法仪信息
        $db = D($this->models['peLogList']);
        $request['btime'] = I('btime',date('Y-m-d H:i:s',time()-6*24*60*60));
        $request['etime'] = I('etime',date('Y-m-d H:i:s',time()));
        $page = I('page');
        $rows = I('rows');
        $where['rzsj'][] = array('EGT',$request['btime']);
        $where['rzsj'][] = array('ELT',$request['etime']);
        
        $data = $db->getTableList($where,$page,$rows,'rzsj desc');
        // $peActions = ['其它','关机','开机','拍照','录像','录音','结束录像'];
        /*foreach ($data['rows'] as &$value) {
            $value['action'] = $value['comment'];
        }*/
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
    //工作站日志
    public function ws_log_list()
    {
        $db = D($this->models['wsLog']);
        $request['btime'] = I('btime',date('Y-m-d H:i:s',time()-7*24*60*60));
        $request['etime'] = I('etime',date('Y-m-d H:i:s',time()));
        $page = I('page');
        $rows = I('rows');
        $where['rzsj'][] = array('EGT',$request['btime']);
        $where['rzsj'][] = array('ELT',$request['etime']);
        $data = $db->getTableList($where,$page,$rows,'rzsj desc');
        // $wsActions = ['其他','开机','关机','接入记录仪','移除记录仪','采集文件'];
        /*foreach ($data['rows'] as &$value) {
            // $wsAction = array_key_exists($value['comment'],$wsActions) ? $wsActions[$value['comment']] : '未知';
            $value['action'] = $value['comment'];
        }*/
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
    //系统日志
    public function sys_log_list()
    {
        $db = D($this->models['sysLog']);
        $request['btime'] = I('btime',date('Y-m-d H:i:s',time()-7*24*60*60));
        $request['etime'] = I('etime',date('Y-m-d H:i:s',time()));
        $page = I('page');
        $rows = I('rows');
        $where['dte'][] = array('EGT',$request['btime']);
        $where['dte'][] = array('ELT',$request['etime']);
        $where[] = $this->get_manger_sql(I('areacode'),'areacode',false);
        $data = $db->getTableList($where,$page,$rows,'dte desc');
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
}
