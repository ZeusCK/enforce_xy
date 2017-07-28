<?php
/**************************
 *媒体控制器
 **************************/
namespace Home\Controller;

class MediaController extends CommonController
{
    protected $models = ['pe_video_list'=>'Enforce\PeVideoList',    //媒体信息
                         'apply_video_list'=>'Enforce\ApplyVideoList', //调阅信息
                         'area'=>'Enforce\AreaDep',                 //部门
                         'employee'=>'Enforce\Employee'];           //警员
    protected $actions = ['area'=>'Area',
                          'role'=>'Role',
                          'employee'=>'Employee'];
    protected $views = ['play_video'=>'playVideo'];
    protected $logContent = '数据管理/媒体数据';
    //拆包
    public function pack_pop($request)
    {
        //wjbh  拆包的文件编号 多文件,隔开
        $data['video_id'] = '';
        $where[] = $this->where_key_or(explode(',',$request['wjbh']),'wjbh');
        return D($this->models['pe_video_list'])->getTableEdit($where,$data);
    }
    //合包
    public function pack_merage($request)
    {
        //wjbh 合包文件 多文件,隔开
        //video_id 合包案件
        $where[] = $this->where_key_or(explode(',',$request['wjbh']),'wjbh');
        return D(C('MODEL.pe_video_list'))->getTableEdit($where,$request);
    }
    //显示可以合包文件
    public function show_unpack($request)
    {
        //areaid  部门ID
        //page   页数
        //rows   条数
        $action = A($this->actions['employee']);
        $where[] = $action->get_manger_sql($request['areaid']);
        $where['video_id'] = '';
        return D($this->models['pe_video_list'])->getTableList($where,$request['page'],$request['rows'],'start_time desc');
    }

















    //单文件播放页面
    public function play_video()
    {
        $wjbh = I('wjbh');
        $db = D($this->models['pe_video_list']);
        $where['wjbh'] = u2g($wjbh);
        $videoInfo = $db->where($where)->find();
        $video_type = array(1=>'酒驾',2=>'事故',3=>'毒驾',4=>'违法',9=>'其他');
        $fileType = array(0=>'未知',1=>'视频',2=>'音频',3=>'图片');
        $bzlx = array(0=>'未标注',1=>'典型视频');
        $videoInfo['video_type_name'] = array_key_exists($videoInfo['video_type'],$video_type) ?
                                        $video_type[$videoInfo['video_type']] : '未知';
        $videoInfo['bzlx_name'] = $videoInfo['bzlx'] == 1 ? '典型案例' : '-';
        $videoInfo['wjlx_name'] = array_key_exists($videoInfo['wjlx'],$fileType) ? $fileType[$videoInfo['wjlx']] : '未知';
        $videoInfo['video_type_name'] = u2g($videoInfo['video_type_name']);
        $videoInfo['bzlx_name'] = u2g($videoInfo['bzlx_name']);
        $videoInfo['wjlx_name'] = u2g($videoInfo['wjlx_name']);
        $this->assign('video_type',$video_type);
        $this->assign('videoInfo',g2us($videoInfo));
        $this->assign('fileType',$fileType);
        $this->assign('bzlx',$bzlx);
        $this->display('play_video');
    }
    public function show_sat()
    {
        $this->assignInfo();
        $pages = array('work_sat'=>'work_sat',  //工作量统计
                       'lay_sat'=>'lay_sat',    //执法统计
                       'assessmeny_sat'=>'assessmeny_sat',  //考核统计
                       'unusual_sat'=>'unusual_sat');       //异常统计
        $page = I('satType','work_sat');
        $this->display($pages[$page]);
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
    //执法查询
    public function law_query()
    {
        $this->assignInfo();
        $this->display('law_query');
    }
    //典型案列
    public function typical_case()
    {
        $this->assignInfo();
        $this->display('typical_case');
    }
    //数据比对
    public function data_com()
    {
        $this->assignInfo();
        $this->display('data_com');
    }
    /**
     * 统计数据，根据权限排除不是自己能管理的警员
     * @param  array $where  筛选条件
     * @param  string $field  搜索字段
     * @param  string $group  分组
     * @param  int $areaid 部门ID
     * @param  string $order 排序
     * @param  string $jybh 多个用,号隔开   123,1236,12311
     * @return array   没有符合条件的警员  error 其他返回数据 无法保证一定有数据
     */
    public function media_info_sta($where,$field='',$group,$areaid='',$order,$jybh='')
    {
        $empsinfo = $this->emps_s_info($areaid);
        if($empsinfo['total'] < 1){
            $res['error'] = '没有警员信息可查看';
            $this->ajaxReturn($res);
        }
        $total = $empsinfo['total'];
        $allowCodes = $empsinfo['allowCodes'];
        if($jybh != ''){
            $jybh = explode(',', $jybh);
            $allowCodes = array_intersect($jybh,$allowCodes);
        }
        if(empty($allowCodes)){
            $data['error'] = '没有警员信息可查看';
            return $data;
        }
        $db = D($this->models['pe_video_list']);
        //检索文件是不要用in  没有索引是全文检索  速度会很慢
        if(!empty($where)){
            $where = array_merge($where,(array)$this->where_key_or($allowCodes,'jybh'));
        }
        if($field != '')  $db = $db->field($field);
        $data = $db->where($where)->group($group)->order($order)->select();
        return $data;
    }
    /**
     * 允许的警员信息进行缓存，根据部门ID,登录用户进行缓存
     * @param  int $areaid 部门ID
     * @return array
     */
    public function emps_s_info($areaid='')
    {
        if(!S(session('user').'search_area'.$areaid)){
            $action = A($this->actions['employee']);
            $emps = $action->get_manger_emp($areaid);
            $allowCodes = array_keys($emps);
            //根据登录用户，检索区域，保存缓存5分钟
            S(session('user').'search_area'.$areaid,$allowCodes,5*60);
        }else{
            $allowCodes = S(session('user').'search_area'.$areaid);
        }
        $res['total'] = count($allowCodes);
        $res['allowCodes'] = $allowCodes;
        return $res;
    }
     /**
     * 显示数据，根据权限排除不是自己能管理的警员
     * @param  array $where  筛选条件
     * @param  int $page 页数
     * @param  int $rows 条数
     * @param  int $areaid 部门ID
     * @param  string $order 排序
     * @param  string $jybh 多个用,号隔开   123,1236,12311
     * @return array   没有符合条件的警员  error 其他返回数据 无法保证一定有数据
     */
    public function media_info_list($where,$page,$rows,$areaid='',$order,$jybh='',$isApply=false)
    {
        $empsinfo = $this->emps_s_info($areaid);
        if($empsinfo['total'] <1){
            $res['error'] = u2g('没有可统计的警员');
            return $res;
        }
        $total = $empsinfo['total'];
        $allowCodes = $empsinfo['allowCodes'];
        if($jybh != ''){
            //echo 1;
            $jybh = explode(',', $jybh);
            $allowCodes = array_intersect($jybh,$allowCodes);
        }
        if(empty($allowCodes)){
            $data['error'] = u2g('没有警员信息可查看');
            return $data;
        }
        if($isApply){
            $db = D($this->models['apply_video_list']);
        }else{
            $db = D($this->models['pe_video_list']);
        }
        if(!empty($where)){
            $where = array_merge($where,(array)$this->where_key_or($allowCodes,'jybh'));
        }else{
            $where[] = $this->where_key_or($allowCodes,'jybh');
        }
        $data = $db->where($where)->order($order)->page($page,$rows)->select();
        $count = $db->where($where)->count('jybh');
        $res['rows'] = $data ? $data : array();
        $res['total'] = $count;
        return $res;
    }
    //民警统计
    public function emps_sta($jybhs,$where,$field='',$group,$order)
    {
        $db = D($this->models['pe_video_list']);
        if($field != '')  $db = $db->field($field);
        $where = array_merge($where,(array)$this->where_key_or($jybhs,'jybh'));
        //删除无意义的where语句
        foreach ($where as $key => &$value) {
            if($value == '' || empty($value)){
                unset($where[$key]);
            }
        }
        $data = $db->where(u2gs($where))->group($group)->order($order)->select();
        return $data;
    }
    /**
     * 部门统计
     * @param  array $areaids 统计的部门
     * @param  array $where   查询条件
     * @param  string $field   查询内容
     * @param  string $group   分组
     * @param  string $order   排序
     * @param  boolean $iscode    是否加上登录用户code
     * @return array         查询结果
     */
    public function areas_sta($areaids,$where,$field='',$group,$order,$iscode=false)
    {
        $db = D($this->models['pe_video_list']);
        if($field != '')  $db = $db->field($field);
        $keyWhere[] = $this->where_key_or($areaids,'areaid');
        if($iscode) $keyWhere[0] .= ' OR jybh="'.session('code').'"';
        $where = array_merge($where,$keyWhere);
        //删除无意义的where语句
        foreach ($where as $key => &$value) {
            if($value == '' || empty($value)){
                unset($where[$key]);
            }
        }
        $data = $db->where(u2gs($where))->group($group)->order($order)->select();
        return $data;
    }
    /**
     * 分析数据
     * @param  array $init  初始化的数据
     * @param  array $data       需要处理的数据
     * @param  array $fields     处理的字段  保存信息=>处理字段 ['nomark'=>'num','wjcd'=>'wjcd']
     * @param  array $mark      标识字段     'jybh'
     * @param  array $paress 需要分析的字段 ['wflx'=>['field'=>'num','info'=>['video'=>1]]]  field,info 为必须字段
     * @param  array $doOne  仅仅处理一次的字段 ['areaname']
     * @return array             整合之后的数据
     */
    public function pares_data($init,$data,$fields,$mark = '',$paress,$doOne)
    {
        if(empty($data) || empty($init) || $mark == '') return $init;
        foreach ($data as $info) {
            if(!empty($doOne)){
                foreach ($doOne as $k => $value) {
                    $init[$info[$mark]][$k] = $info[$value];
                }
                unset($k);
            }
            if(!empty($fields)){
                foreach ($fields as $key => $field) {
                    $init[$info[$mark]][$key] = $init[$info[$mark]][$key] + $info[$field];
                }
                unset($key);
            }
            if(!empty($paress)){
                foreach ($paress as $ke => $pares) {
                    $field = $pares['field'];
                    foreach ($pares['info'] as $key => $value) {
                        if($info[$ke] == $value){
                            $init[$info[$mark]][$key] = $init[$info[$mark]][$key] + $info[$field];
                        }
                    }
                }
            }
        }
        return $init;
    }
    /**
     * 民警工作量统计
     * @return
     */
    public function work_emp_sat()
    {
        $request['btime'] = I('btime',date('Y-m-d H:i:s',time()-7*24*60*60));
        $request['etime'] = I('etime',date('Y-m-d H:i:s',time()));
        $request['unusual'] = I('unusual',3);       //异常数据请求
        $areaid = I('areaid','');    //部门ID
        $page = I('page',1);
        $rows = I('rows',20);
        $jybh = I('jybh','');       //支持多民警查询  用,隔开
        $where['start_time'][] = array('EGT',$request['btime']);
        $where['start_time'][] = array('ELT',$request['etime']);
        $ismarkWhere = $where;
        $nomarkWhere = $where;
        //未编辑
        $nomarkWhere['mark'][] = array('EQ','无');
        $nomarkWhere['mark'][] = array('EQ','');
        $nomarkWhere['mark'][] = array('exp','is null');
        $nomarkWhere['mark'][] = array('or');
        //编辑
        $ismarkWhere['mark'][] = array('NEQ','无');
        $ismarkWhere['mark'][] = array('NEQ','');
        $ismarkWhere['mark'][] = array('exp','is not null');
        //异常数据请求
        if($this->unusual_where($request['unusual'])){
            $nomarkWhere[] = $this->unusual_where($request['unusual']);
            $ismarkWhere[] = $this->unusual_where($request['unusual']);
        }
        //选择字段
        $field = 'jybh,wjlx,FORMAT((sum(wjcd))/3600,1) as wjcd,count(wjbh) as num,areaname';
        $empsinfo = $this->emps_s_info($areaid);

        if($empsinfo['total'] <1){
            $res['error'] = '没有可统计的警员';
            $this->ajaxReturn($res);
        }
        $total = $empsinfo['total'];
        $allowCodes = $empsinfo['allowCodes'];

        if($jybh != ''){
            $jybhs = explode(',',$jybh);
            $allowCodes = array_intersect($allowCodes,$jybhs);
        }

        //需要检索的数据
        $satEmps = array_slice($allowCodes,($page-1)*$rows,$rows);
        if(empty($satEmps)){
            $res['error'] = '没有可统计的警员';
            $this->ajaxReturn($res);
        }
        $dataw = $this->emps_sta($satEmps,$nomarkWhere,$field,'wjlx,jybh', 'num desc');
        $datay = $this->emps_sta($satEmps,$ismarkWhere,$field,'wjlx,jybh', 'num desc');
        //初始化信息 总数，视频，图片，音频，未知，未编辑，已编辑,文件长度
        $initInfo = array('num'=>0,'video'=>0,'picture'=>0,'vioce'=>0,
                          'unkonwn'=>0,'nomark'=>0,'ismark'=>0,'wjcd'=>0,'name'=>'','areaname'=>'');
        $empInfo = D($this->models['employee'])->getField('code,name,areaid');
        $areaInfo = D($this->models['area'])->getField('areaid,areaname');
        foreach ($satEmps as $emp) {
            //添加警员
            $initInfo['name'] = $empInfo[$emp]['name'];
            $initInfo['areaname'] = $areaInfo[$empInfo[$emp]['areaid']];
            $satInfo[$emp] = $initInfo;
        }
        $fields = array('num'=>'num','nomark'=>'num','wjcd'=>'wjcd');
        $markField = 'jybh';
        $paresFields = array('wjlx'=>array('field'=>'num',
                                           'info'=>array('video'=>1,
                                                         'vioce'=>2,
                                                         'picture'=>3,
                                                         'unkonwn'=>0)));
        $satInfo = $this->pares_data($satInfo,$dataw,$fields,$markField,$paresFields);
        unset($fields['nomark']);
        $fields['ismark'] = 'num';
        $satInfo = $this->pares_data($satInfo,$datay,$fields,$markField,$paresFields);
        $res['total'] = $total;
        $res['rows'] = array_values($satInfo);
        $this->saveExcel($res); //监测是否为导出
        $this->ajaxReturn(g2us($res));
    }

    /**
     * 按部门统计
     * @return
     */
    public function area_sat()
    {
        //准备显示数据
        $where = array();
        $mooDarea = I('areaid','');
        $request['unusual'] = I('unusual',3);       //异常数据请求
        //显示的树
        $action = A($this->actions['area']);
        $currentUserAreas = $action->all_user_area();
        $userAreas = array();
        foreach ($currentUserAreas as $currentUserArea) {
            $userAreas[] = $currentUserArea['areaid'];
        }
        $areaids = array();
        if(session('userarea') != ''){
            $areaids = explode(',',session('userarea'));
        }
        $areadb = D($this->models['area']);
        $parent = array(0);             //父级部门ID
        if($mooDarea != ''){
            $parent = (array)$areadb->where('areaid='.$mooDarea)->getField('fatherareaid');
            $show = $action->carea($mooDarea);
            //需要查询的数据
            $areaids = array_intersect($show,$areaids);
            //页面需要显示的数据
            $userAreas = array_intersect($show,$userAreas);
        }
        //准备初始化的显示数据
        $showWhere[] = $this->where_key_or($userAreas,'areaid');
        //判断查询区域是否在自己的所属区域
        $initInfos = $areadb->field('areaid,areaname,fatherareaid as _parentId')->where($showWhere)->select();
        $satInfo = array();
        $initShow = array('num'=>0,'video'=>0,'picture'=>0,'vioce'=>0,
                          'unkonwn'=>0,'nomark'=>0,'ismark'=>0,'wjcd'=>0,'name'=>'');
        foreach ($initInfos as $initInfo) {
            $initInfo = array_merge($initInfo,$initShow);
            $satInfo[$initInfo['areaid']] = $initInfo;
        }
        //准备查询数据
        $where = array();
        $request['btime'] = I('btime',date('Y-m-d H:i:s',time()-7*24*60*60));
        $request['etime'] = I('etime',date('Y-m-d H:i:s',time()));
        $request['unusual'] = I('unusual',false);       //异常数据请求
        $where['start_time'][] = array('EGT',$request['btime']);
        $where['start_time'][] = array('ELT',$request['etime']);
        $field = 'areaid,wjlx,FORMAT((sum(wjcd))/3600,1) as wjcd,count(wjbh) as num';
        $ismarkWhere = $where;
        $nomarkWhere = $where;
        //未编辑
        $nomarkWhere['mark'][] = array('EQ','无');
        $nomarkWhere['mark'][] = array('EQ','');
        $nomarkWhere['mark'][] = array('exp','is null');
        $nomarkWhere['mark'][] = array('or');
        //编辑
        $ismarkWhere['mark'][] = array('NEQ','无');
        $ismarkWhere['mark'][] = array('NEQ','');
        $ismarkWhere['mark'][] = array('exp','is not null');
        //异常数据请求
        if($this->unusual_where($request['unusual'])){
            $nomarkWhere[] = $this->unusual_where($request['unusual']);
            $ismarkWhere[] = $this->unusual_where($request['unusual']);
        }
        $iscode =  in_array(session('areaid'), $userAreas) ? true : false;
        $dataw = $this->areas_sta($areaids,$nomarkWhere,$field,'wjlx,areaid', 'num desc',$iscode);
        $datay = $this->areas_sta($areaids,$ismarkWhere,$field,'wjlx,areaid', 'num desc',$iscode);
        $fields = array('num'=>'num','nomark'=>'num','wjcd'=>'wjcd');
        $markField = 'areaid';
        $paresFields = array('wjlx'=>array('field'=>'num',
                                           'info'=>array('video'=>1,
                                                         'vioce'=>2,
                                                         'picture'=>3,
                                                         'unkonwn'=>0)));
        $satInfo = $this->pares_data($satInfo,$dataw,$fields,$markField,$paresFields);
        unset($fields['nomark']);
        $fields['ismark'] = 'num';
        $satInfo = $this->pares_data($satInfo,$datay,$fields,$markField,$paresFields);
        //倒叙排序 确保上级菜单 在最后执行
        $satInfo = $this->ksort_sat_data($satInfo,'_parentId',array_keys($initShow),$parent[0]);
        $res['total'] = count($userAreas);
        $res['rows'] = array_values($satInfo);
        $this->saveExcel($res); //监测是否为导出
        $this->ajaxReturn(g2us($res));
    }
    //数据比对
    public function  data_comparison()
    {
        //G('begin');
        $satType = I('satType',0);    //比对类型  0按周1按月
        $mooDarea = I('areaid','');
        $areadb = D($this->models['area']);
        $areaids = array();
        if(session('userarea') != ''){
            $areaids = explode(',',session('userarea'));        //需要查询的数据
        }
        //用于联级处理的数据
        $action = A($this->actions['area']);
        $currentUserAreas = $action->all_user_area();
        $userAreas = array();
        foreach ($currentUserAreas as $currentUserArea) {
            $userAreas[] = $currentUserArea['areaid'];
        }
        $initInfos = $areadb->field('areaid,areaname,fatherareaid as _parentId')->where($showWhere)->select();
        $satInfo = array();
        //初始化联级数据
        foreach ($initInfos as $initInfo) {
            $initInfo['num'] = 0;
            $satInfo[$initInfo['areaid']] = $initInfo;
        }
        //显示部门的父部门
        $showpareaid = session('areaid');
        //准备显示数据和查询数据
        if($mooDarea != ''){
            $show = $action->carea($mooDarea);
            //需要查询的数据
            $areaids = array_intersect($show,$areaids);     //修正需要查询的数据
            //用于做联级使用的数据
            $userAreas = array_intersect($show,$userAreas);
            //如果自身所属部门在显示部门内
            if(!in_array(session('areaid'),$show)){
                $showpareaid = $mooDarea;
            }
        }
        //$this->ajaxReturn($showAreas);
        $empdb = D($this->models['employee']);
        $where = array();
        //选出显示下级部门
        $where['fatherareaid'] = $showpareaid;
        $showAreas = $areadb->where($where)->getField('areaid',true);

        $showAreas = array_intersect($showAreas,$areaids);
        //为空的时候  视为自身为最低部门
        /*if(empty($showAreas)){
            $showAreas[] = $showpareaid;
        }*/
        $showWhere[] = $this->where_key_or($showAreas,'areaid');
        //准备初始化的显示数据
        $initAreas = $areadb->where($showWhere)->getField('areaid,areaname');
        $initData = array();
        foreach ($initAreas as $areaid => $areaname) {
            $initData[$areaid]['num'] = 0;                  //y轴
            $initData[$areaid]['areaname'] = $areaname;         //x轴
        }
        $iscode =  in_array(session('areaid'), $showAreas) ? true : false;
        $empWhere[] = $this->where_key_or($areaids,'areaid');
        $empnum = $empdb->where($empWhere)->count('empid');
        if(!in_array(session('areaid'),$areaids) && in_array(session('areaid'),$showAreas)){
            $empnum = $empnum + 1;
        }
        $time = 60*60;
        //按周统计
        if($satType == 0){
            $btime = date('Y-m-d H:i:s',time()-7*24*60*60);
        }else{
            $btime = date('Y-m-d H:i:s',time()-30*24*60*60);
        }
        $etime = date('Y-m-d H:i:s',time());
        $where['start_time'][] = array('EGT',$btime);
        $where['start_time'][] = array('ELT',$etime);
        $field = 'sum(wjcd) as num,areaid,areaname';
        $group = 'areaid';
        /*****************************************
         * 部门显示
         * ****************************************/
        //统计之后的数据
        $data = $this->areas_sta($areaids,$where,$field,$group,'num desc',$iscode);
        // $this->ajaxReturn(g2us($data));
        $fields = array('num'=>'num');
        $markField = 'areaid';
        $paresFields = array();
        $satInfo = $this->pares_data($satInfo,$data,$fields,$markField,$paresFields);
        //倒叙排序 确保上级菜单 在最后执行
        $initShow = array('num');
        $satInfo = $this->ksort_sat_data($satInfo,'_parentId',$initShow);
        foreach ($initData as $areaid => $data) {
            if($empnum > 0){
                //求平均值
                $initData[$areaid]['num'] =  round(($satInfo[$areaid]['num']/$time)/$empnum,1);
            }else{
                $initData[$areaid]['num'] = 0;
            }
            $initData[$areaid]['areaname'] = $satInfo[$areaid]['areaname'];
        }
        $initData = g2us($initData);
        $res = array();
        foreach ($initData as $value) {
            $res[$value['areaname']] = $value['num'];
        }
        /*******************************************
         * 警员显示
         ******************************************/
        $empInitData = array();
        $showEmps  = $empdb->where('areaid='.$showpareaid)->getField('code,name');     //属于本部门的警员

        foreach ((array)$showEmps as $code=>$name) {
            $empInitData[g2u($name).'('.$code.')'] = 0;
        }
        $field = 'sum(wjcd) as num,jybh,jyxm';
        $group = 'jybh';
        $empdata = $this->emps_sta(array_keys($showEmps),$where,$field,$group,'num desc');
        foreach ($empdata as $value) {
            $empInitData[g2u($value['jyxm']).'('.$value['jybh'].')'] = round($value['num']/$time,1);
        }
        //$this->ajaxReturn($empInitData);
        $res = array_merge($res,(array)$empInitData);
        arsort($res);
        //G('end');
        //error_log(G('begin','end',6).'s'."\r\n",3,'cache.log');
        $this->ajaxReturn($res);
    }
    /**
     * 异常数据where条件定义
     * @param  integer $type 请求类型 1异常数据 2 正常数据 3 无限制要求
     * @param  integer $sccs 上传时长
     * @return where语句
     */
    public function unusual_where($type = 1,$sccs = 3)
    {
        if($type == 1){
            $where = 'ABS(timestampdiff(day,start_time,scsj)) > '.$sccs;
        }
        if($type == 2){
            $where = 'ABS(timestampdiff(day,start_time,scsj)) <= '.$sccs;
        }
        if($type == 3){
            $where = false;
        }
        return $where;
    }
    //媒体数据显示
    public function media_list()
    {
        $isApply = I('isApply',false);      //是否为调阅数据库
        $request['start_time'] = I('start_time');
        $request['scsj'] = I('scsj');
        $request['start_time']['btime'] = $request['start_time']['btime'] ?  $request['start_time']['btime']  : '';//开始时间
        $request['start_time']['etime'] = $request['start_time']['etime'] ?  $request['start_time']['etime']  : '';              //结束时间
        $request['scsj']['btime'] = $request['scsj']['btime'] ? $request['scsj']['btime'] : '';   //开始时间
        $request['scsj']['etime'] = $request['scsj']['etime'] ? $request['scsj']['etime'] : '';              //结束时间
        $areaid = I('areaid','');       //部门ID
        $jybh = I('jybh','');           //警员编号
        $request['wjlx'] = I('wjlx','');            //文件类型
        $request['bzlx'] = I('bzlx','');            //标注类型
        $request['mark'] = I('mark','');        //备注
        $request['unusual'] = I('unusual',3);   //异常数据请求
        $page = I('page');
        $rows = I('rows');
        $request['video_type'] = I('video_type','');    //视频类型
        //如果没有带搜索类型说明是页面初始化
        if(!$request['search_type']){
            $request['start_time']['btime'] = date('Y-m-d H:i:s',time()-7*24*60*60);
            $request['start_time']['etime'] = date('Y-m-d H:i:s');
        }
        //异常数据请求
        $where = array();
        if($this->unusual_where($request['unusual'])){
            $where[] = $this->unusual_where($request['unusual']);
        }
        if($request['video_type'] != '') $where['video_type'] = $request['video_type'];
        if($request['wjlx'] != '') $where['wjlx'] = $request['wjlx'];
        if($request['bzlx'] != '') $where['bzlx'] = $request['bzlx'];
        if($request['mark'] != '') $where['mark'] = array('like','%'.u2g($request['mark']).'%');
        if($request['start_time']['btime']) $where['start_time'][] = array('EGT',$request['start_time']['btime']);
        if($request['start_time']['etime']) $where['start_time'][] = array('ELT',$request['start_time']['etime']);
        if($request['start_time']['btime']) $where['scsj'][] = array('EGT',$request['scsj']['btime']);
        if($request['scsj']['etime']) $where['scsj'][] = array('ELT',$request['scsj']['etime']);
        $data = $this->media_info_list($where,$page,$rows,$areaid,'mark asc,start_time desc',$jybh,$isApply);
        $video_type = array(1=>'酒驾',2=>'事故',3=>'毒驾',4=>'违法',9=>'其他');
        $fileType = array(0=>'未知',1=>'视频',2=>'音频',3=>'图片');
        foreach ($data['rows'] as &$value) {
            $value['video_type_name'] = array_key_exists($value['video_type'],$video_type) ? $video_type[$value['video_type']] : '未知';
            $value['bzlx_name'] = $value['bzlx'] == 1 ? '典型案例' : '-';
            $value['wjlx_name'] = array_key_exists($value['wjlx'],$fileType) ? $fileType[$value['wjlx']] : '未知';
            $value['video_type_name'] = u2g($value['video_type_name']);
            $value['bzlx_name'] = u2g($value['bzlx_name']);
            $value['wjlx_name'] = u2g($value['wjlx_name']);
        }
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
    //数据更新
    public function media_update()
    {
        $request = I();
        $wjbhs = explode(',',$request['wjbh']);
        $this->write_log('更新文件'.$request['wjbh']);
        unset($request['wjbh']);
        $where[] = $this->where_key_or($wjbhs,'wjbh');
        $db = D($this->models['pe_video_list']);
        $result = $db->getTableEdit($where,u2gs($request));
        $this->ajaxReturn($result);
    }
    //数据更新
    public function media_remove()
    {
        $request = I();
        $wjbhs = explode(',',$request['wjbh']);
        $where[] = $this->where_key_or($wjbhs,'wjbh');
        $db = D($this->models['pe_video_list']);
        $result = $db->getTableDel($request);
        $this->write_log('删除文件'.$request['wjbh']);
        $this->ajaxReturn($result);
    }
    /**
     * 按照需求上下级进行数据叠加
     * @param  array $data   [id]=>['id'=>id,'num'=>num,'pid'=>pid]
     * @param  string $pidFiled pid字段
     * @param  array $fields 需要叠加的字段
     * @param  array $root 根菜单节点
     * @return array         格式化之后的数据
     */
    public function ksort_sat_data($data,$pidFiled,$fields,$root)
    {
        krsort($data);
        foreach ($data as $key => $value) {
            $checkArr[$value[$pidFiled]][] = $key;
        }
        foreach ($data as $key => $value) {
            if(isset($root)){
                if($data[$key]['_parentId'] == $root)  unset($data[$key]['_parentId']);
            }
            if(empty($checkArr[$key])) continue;
            foreach ($checkArr[$key] as $val) {
                foreach ($fields as $field) {
                    $data[$key][$field] = $data[$key][$field] + $data[$val][$field];
                }
            }
        }
        return $data;
    }
    //视频操作日志
    public function video_action()
    {
        $action = I('action');      //1下载 //2播放
        $wjbh = I('wjbh');
        if($action == 1) $action = '下载';
        if($action == 2) $action = '播放';
        if($action == 3) $action = '打印';
        $this->write_log($action.$wjbh);
        exit;
    }
    //执法统计
    public function law_sat()
    {
        session_write_close();
        $btime = date('Y-m-d H:i:s',time()-6*24*60*60);
        $etime = date('Y-m-d H:i:s');
        $where['start_time'][] = array('EGT',$btime);
        $where['start_time'][] = array('ELT',$etime);
        $dates = $this->get_twoMonthsDates($btime,$etime,'Y-m-d');
        $initData = array();
        foreach ($dates as $value) {
            $initData[$value] = 0;
        }
        $data = $this->media_info_sta($where, "count(wjbh) as num,DATE_FORMAT(start_time,'%Y-%m-%d') as day", 'day');
        foreach ($data as $value) {
            $initData[$value['day']] = (int)$value['num'];
        }
        $this->ajaxReturn($initData);
    }
    //异常数据统计
    public function unusual_sat()
    {
        session_write_close();
        $btime = date('Y-m-d H:i:s',time()-7*24*60*60);
        $etime = date('Y-m-d H:i:s');
        $where['start_time'][] = array('EGT',$btime);
        $where['start_time'][] = array('ELT',$etime);
        $uploadwhere = $nomarkWhere = $ismarkWhere = $where;
        //未编辑
        $nomarkWhere['mark'][] = array('EQ','无');
        $nomarkWhere['mark'][] = array('EQ','');
        $nomarkWhere['mark'][] = array('exp','is null');
        $nomarkWhere['mark'][] = array('or');
        //上传超时
        $uploadwhere[] = $this->unusual_where();

        $dates = $this->get_twoMonthsDates($btime,$etime,'Y-m-d');
        $initData = array();
        foreach ($dates as $value) {
            $initData[$value]['nomark'] = 0;
            $initData[$value]['uploadmark'] = 0;
        }
        $idata = $this->media_info_sta($uploadwhere, "count(wjbh) as num,DATE_FORMAT(start_time,'%Y-%m-%d') as day", 'day');
        $udata = $this->media_info_sta($nomarkWhere, "count(wjbh) as num,DATE_FORMAT(start_time,'%Y-%m-%d') as day", 'day');
        foreach ($idata as $value) {
            $initData[$value['day']]['uploadmark'] = (int)$value['num'];
        }
        foreach ($udata as $value) {
            $initData[$value['day']]['nomark'] = (int)$value['num'];
        }
        $this->ajaxReturn($initData);
    }
    //首页数据显示
    public function show_media_list()
    {
        session_write_close();
        $res['total'] = 0;
        $res['rows']  = array();
        $where = array();
        $data = $this->media_info_list($where,1,10,'','start_time desc');
        $video_type = array(1=>'酒驾',2=>'事故',3=>'毒驾',4=>'违法',9=>'其他');
        $fileType = array(0=>'未知',1=>'视频',2=>'音频',3=>'图片');
        foreach ($data['rows'] as &$value) {
            $value['video_type_name'] = array_key_exists($value['video_type'],$video_type) ? $video_type[$value['video_type']] : '未知';
            $value['bzlx_name'] = $value['bzlx'] == 1 ? '典型案例' : '-';
            $value['wjlx_name'] = array_key_exists($value['wjlx'],$fileType) ? $fileType[$value['wjlx']] : '未知';
            $value['video_type_name'] = u2g($value['video_type_name']);
            $value['bzlx_name'] = u2g($value['bzlx_name']);
            $value['wjlx_name'] = u2g($value['wjlx_name']);
        }
        $this->saveExcel($data); //监测是否为导出
        $this->ajaxReturn(g2us($data));
    }
}