<?php
/************************************
 *设备控制器 web  空间站 工作站
 *************************************/
namespace Home\Controller;

class FourGenController extends CommonController
{
    protected $models = ['gpsinfo'=>'Enforce\GpsInfo',      //4g信息
                         'employee'=>'Enforce\Employee'     //警员
                        ];
    protected $actions = ['media'=>'Media'];
    //实时查看
    public function actualTime()
    {
        $this->display('actualTime');
    }
    //历史记录
    public function historyTime()
    {
        $this->display('historyTime');
    }
    public function get_gpsInfo()
    {
        $action = A($this->actions['media']);
        $emp_gps_info = array();
        //获取允许查看的警员
        $emps = $action->emps_s_info();
        if($emps['total'] == 0){
            $this->ajaxReturn($emp_gps_info);
        }
        $gpsdb = D($this->models['gpsinfo']);
        $where[] = $this->where_key_or($emps['allowCodes'],'g.jybh');
        $where['gps_time'] = array('GT',date('Y-m-d').' 00:00:00');
        $temtable = $gpsdb->table('enforce.gps_info as g')->field('jybh,max(gps_time) as update_time')->where($where)->group('jybh')->select(false);
        $where[] = 'gps_time = update_time';
        $where[] = 'g.jybh = t.jybh';
        $emp_gps_info = $gpsdb->table('enforce.gps_info as g,('.$temtable.') as t')->field('g.*')->where($where)->group('jybh')->select();
        $res = array();
        $res['total'] = count($emp_gps_info);
        $res['rows'] = $emp_gps_info;
        $this->ajaxReturn(g2us($res));
    }
}