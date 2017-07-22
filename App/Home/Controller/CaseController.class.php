<?php
namespace Home\Controller;

class CaseController extends CommonController
{
    //模型
    protected $models = ['case'=>'Enforce\Case',
                         'pe_video_list'=>'Enforce\PeVideoList',
                         'area'=>'Enforce\AreaDep',
                         'employee'=>'Enforce\Employee'];
    protected $actions = ['media'=>'Media',
                          'area'=>'Area'];
    protected $pe_type = ['未知','一般警情(6个月)','重大警情(永久)','阻碍民警执法妨碍公务(永久)',
                          '行政强制执行(永久)','当场盘问检查(6个月)','无效数据(7天)','其他(6个月)'];
    protected $case_type = ['未知','行政案件','刑侦案件'];
    //日志模块
    protected $logContent = '案件管理/数据管理';
    //播放页面
    public function play_case()
    {
        $this->display();
    }
    //案件列表
    public function show_case()
    {
        $this->assignInfo();
        $this->display();
    }
    //案件统计
    public function sat_case()
    {
        $this->assignInfo();
        $this->display();
    }
    public function assignInfo()
    {
        $action = A($this->actions['area']);
         //如果没有
        $areaTree = $action->tree_list();
        $rootId = !empty($areaTree) ? $areaTree[0]['id'] : '';
        $rootName = !empty($areaTree) ? g2u($areaTree[0]['text']) : '系统根部门';
        $this->assign('areaid',$rootId);
        $this->assign('areaname',$rootName);
    }
    //添加案件
    public function add_case()
    {
        $request = array();
        $request['pe_name'] = I('pe_name');         //案事件名称
        $request['pe_code'] = I('pe_code');         //警情编号
        $request['areaid'] = I('areaid');           //出警部门ID
        $request['pe_type'] = I('pe_type');         //警情类型      1一般警情-6 2重大警情-f 3阻碍民警执法妨碍公务-f
                                                    //              4行政强制执行-f 5当场盘问检查-6 6无效数据-7d 7其他-6
        $request['pe_address'] = I('pe_address');   //出警地址
        $request['pe_btime'] = I('pe_btime');       //出警开始时间
        $request['pe_etime'] = I('pe_etime');       //出警结束时间
        $request['jybh'] = I('jybh');               //警员编号          用于统计案件
        $request['jyxm'] = I('jyxm');               //警员姓名
        $request['cpbh'] = I('cpbh');               //设备编号
        $request['case_name'] = I('case_name');     //案件名称
        $request['case_code'] = I('case_code');     //案件编号
        $request['case_type'] = I('case_type');     //案件类型      1行政案件 2刑侦案件
        $request['video_title'] = I('video_title'); //视频标题
        $request['scsj'] = I('scsj');               //上传时间
        $request['cjsj'] = I('cjsj');               //采集时间
        $request['wjbh'] = I('wjbh');               //文件编号
        $request['mark'] = I('mark');               //备注
        $request['uniqid'] = uniqid();              //唯一ID
        $request['edit_code'] = session('code');    //编辑人           一般与出警人编号一样
        $request['create_time'] = date('Y-m-d H:i:s');  //创建时间
        //更新媒体表
        $pevideodb = D($this->models['pe_video_list']);
        $where[] = $this->where_key_or(explode(',', I('wjbh')),'wjbh');
        $data['mark'] = I('pe_name').' '.I('mark');
        $pevideodb->getTableEdit($where,u2gs($data));
        //新增数据
        $db = D($this->models['case']);
        $result = $db->getTableAdd(u2gs($request));
        $this->write_log('添加案件:'.$request['video_title']);
        $this->ajaxReturn($result);
    }
    //修改案件
    public function edit_case()
    {
        $request = I();
        $where['uniqid'] = I('uniqid');
        unset($request['uniqid']);
        $result = $db->getTableEdit($where,u2gs($request));
        $this->write_log('修改案件'.I('video_title'));
        $this->ajaxReturn($result);
    }
    //删除案件，删除后相关媒体变为未编辑状态
    public function remove_case()
    {
        $request['uniqid'] = I('uniqid');
        $casedb = D($this->models['case']);
        $mediadb = D($this->models['pe_video_list']);
        $caseWhere[] = $this->where_key_or(explode(',',$request),'uniqid');
        $wjbh = $casedb->where($caseWhere)->getField('wjbh',true);
        $wjbh = implode(',', $wjbh);
        $mediaWhere = $this->where_key_or(explode(',',$wjbh),'wjbh');
        $data['mark'] = '';
        $mediadb->where($mediaWhere)->save($data);
        $res = $casedb->getTableDel($caseWhere);
        $this->write_log('删除案件'.I('uniqid'));
        $this->ajaxReturn(g2us($res));
    }
    //统计案件
    public function case_sat()
    {
        $satType = I('satType',1);  //1为按周 2为按月
        $moodarea = I('areaid','');
        //需要查询的部门
        $areaAc = A($this->actions['area']);
        $areas = $areaAc->show_sat_area($moodarea);
        $searchAreas = $areas['areaids'];   //搜索数据
        $showAreas = $areas['userAreas'];   //显示数据
        //准备初始化的显示数据
        $showWhere[] = $this->where_key_or($showAreas,'areaid');
        $areadb = D($this->models['area']);
        //判断查询区域是否在自己的所属区域
        $initInfos = $areadb->field('areaid,areaname,fatherareaid as _parentId')->where($showWhere)->select();
        //按周统计
        if($satType == 0){
            $btime = date('Y-m-d H:i:s',time()-7*24*60*60);
        }else{
            $btime = date('Y-m-d H:i:s',time()-30*24*60*60);
        }
        $searchWhere['pe_btime'] = array('EGT',$btime);
        $satInfo = array();
        //总数 一般 重大 妨碍 强制 现场 作废 无用 其他 警员总数 工作警员 百分比 行政 刑事
        $initShow = array('num'=>0,'common'=>0,'major'=>0,'impede'=>0,
                          'force'=>0,'spot'=>0,'disuse'=>0,'other'=>0,
                          'empnum'=>0,'workemp'=>0,'administration'=>0,'criminal'=>0);
        $empdb = D($this->models['employee']);
        $casedb = D($this->models['case']);
        $where[] = $this->where_key_or($searchAreas,'areaid');
        if(!in_array($initInfo['areaid'],$searchAreas) && in_array(session('areaid'),$showAreas)){
            $where = ' OR code="'.session('code').'"';
        }
        $searchWhere[] = $where;
        $empsInfo = $empdb->field('count(empid) as num,areaid')->where($where)->group('areaid')->select(array('index'=>'areaid'));
        $casesInfo = $casedb->field('count(uniqid) as num,areaid')->where($where)->group('areaid')->select(array('index'=>'areaid'));
        foreach ($initInfos as $initInfo) {
            $initInfo = array_merge($initInfo,$initShow);
            $satInfo[$initInfo['areaid']] = $initInfo;
            $satInfo[$initInfo['areaid']]['empnum'] = $empsInfo[$initInfo['areaid']]['num'] ? $empsInfo[$initInfo['areaid']]['num'] : 0;
            $satInfo[$initInfo['areaid']]['workemp'] = $casesInfo[$initInfo['areaid']]['num'] ? $casesInfo[$initInfo['areaid']]['num'] : 0;
        }
        $res = $casedb->field('count(uniqid) as num,areaid,pe_type,case_type')->where($where)->group('areaid,pe_type,case_type')->select();
        $action = A($this->actions['media']);
        $fields = array('num'=>'num');
        $markField = 'areaid';
        $paresFields = array('pe_type'=>array('field'=>'num',
                                           'info'=>array('common'=>0,'major'=>1,'impede'=>2,'force'=>3,'spot'=>4,'disuse'=>5,'other'=>6)),
                             'case_type'=>array('field'=>'num',
                                                'info'=>array('administration'=>0,'criminal'=>1))
                        );
        $satInfo = $action->pares_data($satInfo,$res,$fields,$markField,$paresFields);
        $parent = array(0);             //父级部门ID
        if($moodarea != ''){
            $parent = (array)$areadb->where('areaid='.$moodarea)->getField('fatherareaid');
        }
        //倒叙排序 确保上级菜单 在最后执行
        $satInfo = $action->ksort_sat_data($satInfo,'_parentId',array_keys($initShow),$parent[0]);
        foreach ($satInfo as &$value) {
            $value['percent'] = $value['empnum'] == 0 ? 0 : round($value['workemp']/$value['empnum'],2);
        }
        $result['total'] = count($showAreas);
        $result['rows'] = array_values($satInfo);
        $this->saveExcel($result); //监测是否为导出
        $this->ajaxReturn(g2us($result));
    }
    //案件查询
    public function case_list()
    {
        $request = I();
        $page = I('page');
        $rows = I('rows');
        $areaid = $request['areaid'];                      //查询部门
        $casedb = D($this->models['case']);
        $action = A($this->actions['media']);
        $jybh = $request['jybh'];           //出警人
        $emps = $action->emps_s_info($areaid);
        $allowCodes = $emps['allowCodes'];
        if($jybh != ''){
            $jybh = explode(',', $jybh);
            $allowCodes = array_intersect($jybh,$allowCodes);
        }
        if(empty($allowCodes)){
            $res = array();
            $res['error'] = '没有警员可查看！';
            $this->ajaxReturn($res);
        }
        $where[] = $this->where_key_or($allowCodes,'jybh');
        if($request['case_code']) $where['case_code'] = array('like','%'.$request['case_code'].'%');    //案件编号
        if($request['case_name']) $where['case_name'] = array('like','%'.$request['case_name'].'%');    //案件名称
        if($request['pe_code']) $where['pe_code'] = array('like','%'.$request['pe_code'].'%');    //警情编号
        if($request['pe_name']) $where['pe_name'] = array('like','%'.$request['pe_name'].'%');    //警情名称
        if($request['case_type']) $where['case_type'] = $request['case_type'];      //案件类型
        if($request['pe_type']) $where['pe_type'] = $request['pe_type'];            //警情类型
        $where['cjsj'][] = array('EGT',$request['cjsj']['btime'] ? $request['cjsj']['btime'] : date('Y-m-d H:i:s',time()-7*24*60*60));
        $where['cjsj'][] = array('ELT',$request['cjsj']['etime'] ? $request['cjsj']['etime'] : date('Y-m-d H:i:s'));
        $res = $casedb->getTableList($where,$page,$rows,'create_time desc');
        $areadb = D($this->models['area']);
        $areas = $areadb->getField('areaid,areaname');
        foreach ($res['rows'] as &$row) {
            $row['areaname'] = array_key_exists($row['areaid'],$areas) ? $areas[$row['areaid']] : u2g('未知');
            $row['pe_type_name'] = u2g($this->pe_type[$row['pe_type']]);
            $row['case_type_name'] = u2g($this->case_type[$row['case_type']]);
        }
        $this->saveExcel($res); //监测是否为导出
        $this->ajaxReturn(g2us($res));
    }
    //播放信息
    public function play_case_info()
    {
        $request['uniqid'] = I('uniqid');
        $casedb = D($this->models['case']);
        $mediadb = D($this->models['pe_video_list']);
        $caseWhere['uniqid'] = $request['uniqid'];
        $caseInfo = $casedb->where($caseWhere)->find();
        $wjbh = $caseInfo['wjbh'];
        $mediaWhere[] = $this->where_key_or(explode(',',$wjbh),'wjbh');
        $data = $mediadb->where($mediaWhere)->select();
        $res = array();
        $res['total'] = count($data);
        $res['rows'] = $data;
        $res['info'] = $caseInfo;
        $this->ajaxReturn(g2us($res));
    }
}