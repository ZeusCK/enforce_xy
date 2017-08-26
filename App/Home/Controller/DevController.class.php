<?php
/************************************
 *设备控制器 web  空间站 执法记录仪
 *************************************/
namespace Home\Controller;

class DevController extends CommonController
{
    //表的表名-自增主键
    protected $models = ['pebase'=>'Enforce\PeBase',            //执法仪
                         'pe_video_list'=>'Enforce\PeVideoList',
                         'area'=>'Enforce\AreaDep',
                         'employee'=>'Enforce\Employee'];          //记录信息
    protected $actions = ['employee'=>'Employee',
                          'area'=>'Area'];
    protected $logContent = '设备管理/执法仪管理';
    //执法仪配置
    public function pe_base_show()
    {
        $this->display('peBase');
    }
    //执法仪状态
    public function pe_show_status()
    {
        $this->display('peShowStatus');
    }
    public function showPeBase($value='')
    {
         $this->display();
    }
    //执法记录仪
    public function pe_base_list()
    {
        //product 生产厂家
        //cpxh 产品序号
        //jyxm 警员姓名
        //status 设备状态
        //areacode 部门代码
        $request = I('');
        unset($request['page'],$request['rows']);
        $page = I('page');
        $rows = I('rows');
        $db =  D($this->models['pebase']);
        //获取能显示的执法仪信息
        $sql = $this->get_manger_sql($request['areacode'],'areacode',false);
        $where[] = $sql.' OR areacode=""';
        if($request['jybh']) $where['jybh'] = $request['jybh'];           //警员编号
        //支持模糊搜索
        foreach ($request as $key => $value) {
            if($value != '' && $key != 'status' && $key != 'jybh' && $key != 'areacode'){
                $where[$key] = array('like','%'.$value.'%');
            }
        }
        if($request['status'] != '') $where['status'] = $request['status'];
        $data = $db->getTableList(u2gs($where),$page,$rows);
        $data['disuse'] = 0;
        $data['use'] = 0;
        $data['active'] = 0;
        $show_sat = $db->where($where)->field('count(1) as num,status')->group('status')->select();
        foreach($show_sat as $value){
            if($value['status'] == 0) $data['disuse'] = $value['num'];
            if($value['status'] == 1) $data['use'] = $value['num'];
            if($value['status'] == 2) $data['active'] = $value['num'];
        }
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
    //执法记录仪
    public function pe_base_add()
    {
        $request['product'] = I('product');     //生产厂家
        $request['cpxh']    = I('cpxh');        //产品序号  必填
        $request['jyxm']    = I('jyxm');        //警员姓名
        $request['standard']    = I('standard'); //设备规格
        $request['jybh']    = I('jybh');        //警员编号
        $employeedb = D($this->models['employee']);
        $areacode = $employeedb->where('code="'.$request['jybh'].'"')->getField('areacode');
        $areadb = D($this->models['area']);
        $areaInfo = $areadb->where('areacode="'.$areacode.'"')->find();
        $request['areacode'] = g2u($areaInfo['areacode']);
        $request['areaname'] = g2u($areaInfo['areaname']);
        $db =  D($this->models['pebase']);
        $check = $db->where('cpxh="'.u2g($request['cpxh'].'"'))->find();
        if($check){
            $result['message'] = '添加失败，该产品已经添加过，无法添加。';
            $this->ajaxReturn($result);
        }
        $result = $db->getTableAdd(u2gs($request));
        $this->write_log('添加'.$request['cpxh'].':'.$request['jyxm']);
        $this->ajaxReturn($result);
    }
    //执法记录仪
    public function pe_base_edit()
    {
        $where['id'] = I('id');            //产品序号  不可更改
        $request = I('');
        $db =  D($this->models['pebase']);
        $result = $db->getTableEdit($where,u2gs($request));
        $this->ajaxReturn($result);
    }

    //执法记录仪
    public function pe_base_remove()
    {
        $cpxh = I('cpxh');                  //产品序号
        $request['cpxh'] = array('in',u2g($cpxh));
        $db =  D($this->models['pebase']);
        $result = $db->getTableDel($request);
        $this->write_log('删除执法记录仪');
        $this->ajaxReturn($result);
    }
    //传值  添加执法仪时能够选择的警员
    /*public function assignInfo()
    {
        $action = A($this->actions['employee']);
        $emps = $action->get_manger_emp();
        $this->assign('emps',g2us($emps));
    }*/
    /**
     * 获取执法记录仪使用状态  七天内统计
     * @param  array $cpxhs 执法记录仪序号
     * @return int       0:停用 1:使用率底 2:活跃
     */
    public function get_pe_base_status($cpxhs)
    {
        //now 2017-6-8    2017-6-9 00:00:00 2017-6-2 00:00:00
        $nextday = date('Y-m-d',strtotime('+1 day',time()));
        $weekago = date('Y-m-d',strtotime('-6 day',time()));
        $where['start_time'] = array(array('EGT',$weekago),array('LT',$nextday));
        $days = $this->get_twoMonthsDates($weekago,$nextday,'Y-m-d H:i:s');
        $mediadb = D($this->models['pe_video_list']);
        $infos = $mediadb->field("cpxh,DATE_FORMAT(start_time,'%Y-%m-%d') as date,count(wjbh) as num")
                        ->where($where)->group('cpxh,date')->select();
        $initInfo = array();
        $result   = array();
        foreach ($cpxhs as $value) {        //['cpxh'=>['day1','day2','day3']]
            $initInfo[$value] = [];
            $result[$value] = 0;
        }
        foreach ($infos as $info) {
            if($info['num'] > 0){
                $initInfo[$info['cpxh']][] = $info['date'];
            }
        }
        foreach ($initInfo as $key => $days) {
            $total = count($days);
            //大于4天活跃 大于 0 天 使用率低 0 天 停用
            $result[$key] = $total;
        }
        return  $result;
    }
}