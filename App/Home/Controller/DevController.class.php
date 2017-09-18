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
        $status_type = $this->get_val_item('dictionary','pe_status');
        if($request['status']) $where['status'] = $request['status'];
        $data = $db->getTableList(u2gs($where),$page,$rows);
        foreach ($data['rows'] as &$val) {
            $val['status_name'] = $status_type[$val['status']];
        }
        $data['disuse'] = 0;
        $data['use'] = 0;
        $data['active'] = 0;
        $show_sat = $db->where($where)->field('count(1) as num,status')->group('status')->select();
        foreach($show_sat as $value){
            if($value['status'] == 0) $data['disuse'] = $value['num'];
            if($value['status'] == 1) $data['use'] = $value['num'];
            if($value['status'] == 2) $data['active'] = $value['num'];
        }
        $this->saveExcel($data,'执法记录仪'); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
    //执法记录仪
    public function pe_base_add()
    {
        $request    = I('');        //警员编号
        unset($request['id']);
        $request['create_user'] = session('user');  //创建人
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
        $request = u2gs($request);
        $request['create_time'] = date('Y-m-d H:i:s');
        $result = $db->getTableAdd($request);
        if($result['status']){
            //同步
            $syncData[] = $request;
            $this->sync('pe_base',$syncData,'add');
        }
        $this->write_log('添加'.$request['cpxh'].':'.g2u($request['jyxm']));
        $this->ajaxReturn($result);
    }
    //执法记录仪
    public function pe_base_edit()
    {
        $where['id'] = I('id');            //产品序号  不可更改
        $request = I('');
        $db =  D($this->models['pebase']);
        $info = $db->where($where)->find();
        $request = u2gs($request);
        $result = $db->getTableEdit($where,$request);
        if($result['status']){
            if($request['cpxh']){
                $request['old_cpxh'] = $info['cpxh'];
            }else{
                $request['cpxh'] = $info['cpxh'];
            }
            $syncData[] = $request;
            $this->sync('pe_base',$syncData,'edit');
        }
        $this->ajaxReturn($result);
    }

    //执法记录仪
    public function pe_base_remove()
    {
        $cpxh = I('cpxh');                  //产品序号
        $request['cpxh'] = array('in',u2g($cpxh));
        $db =  D($this->models['pebase']);
        $result = $db->getTableDel($request);
        if($result['status']){
           $info = explode(',', $request['cpxh']);
           foreach ($info as $value) {
               $syncData[] = array('cpxh'=>$value);
           }
           $this->sync('pe_base',$syncData,'del');
        }
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
    public function import_excel()
    {
        $func = A('Function');
        $db = D($this->models['pebase']);
        $where[] = $this->get_manger_sql('','areacode',false);
        $area_code_name = D($this->models['area'])->where($where)->getField('areacode,areaname');
        $enableType = array_flip($this->get_val_item('dictionary','enable'));
        $area_name_code = array_flip($area_code_name);
        $code_arr = array_keys($area_code_name);
        try {
            $res = $func->save_upload($_FILES['file'],array('xls','xlsx'));
        } catch (Exception $e) {
            $res = false;
        }
        $key_code = array();
        $name_code = array('产品序号'=>'cpxh',
                           '单位'=>'areaname',
                           '警员姓名'=>'jyxm',
                           '警员编号'=>'jybh',
                           '生产厂家'=>'product',
                           '设备规格'=>'standard',
                           );
        $allow = 0; //允许导入
        $deny = 0;  //禁止导入
        $success = 0;   //成功导入
        $fail = 0;      //失败导入
        if($res){
            $data = $func->read_excel($res);
            $header = array_shift($data);
            foreach ($header as $key => $value) {
                if(array_key_exists($value,$name_code)){
                    $key_code[$key] = $name_code[$value];
                }
            }
            $allData = array();
            foreach ($data as $value) {
                $saveData= array();
                foreach ($value as $k => $val) {
                    $val = $val === null ? '' : $val = trim(u2g($val));
                    if(!array_key_exists($k,$key_code)) continue;
                    if($key_code[$k] == 'areaname'){
                        if(!in_array($val,$area_code_name)){
                            $deny++;
                            continue;
                        }else{
                            $saveData['areacode'] = $area_name_code[$val];
                            $allow++;
                        }
                    }
                    $saveData[$key_code[$k]] = $val;
                }
                $empInfo = $db->where('cpxh="'.$saveData['cpxh'].'"')->find();
                if($empInfo){
                    $res = $db->where('cpxh="'.$saveData['cpxh'].'"')->save($saveData);
                }else{
                    $res = $db->add($saveData);
                }
                $res ? $success++ : $fail++;
                $result['message'] = '允许导入：'.$allow.'<br>'.'禁止导入：'.$deny.'<br>'.'成功导入：'.$success.'<br>'.'导入失败：'.$fail.'<br>';
                $this->write_log($result['message']);
            }
        }else{
            $result['message'] = '文件上传失败，可能原因文件类型不对，服务器权限不足，文件超过2M';
        }
        exit(json_encode($result));
    }
}