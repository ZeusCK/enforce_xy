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
                         'employee'=>'Enforce\Employee',            //警员
                         'pebase'=>'Enforce\PeBase',                //执法记录仪
                         'ftpdir'=>'Enforce\FtpDir'];               //ftp
    protected $actions = ['area'=>'Area',
                          'role'=>'Role',
                          'employee'=>'Employee'];
    protected $views = ['play_video'=>'playVideo'];
    protected $logContent = '数据管理/媒体数据';
    //拆包
    public function pack_pop($request)
    {
        //wjbh  拆包的文件编号 多文件,隔开
        $wjbhInfo = $request['wjbhInfo'];
        $video_data['case_key'] = '';
        foreach ($wjbhInfo as $wjbh => $start_time) {
            $video_where['wjbh'] = $wjbh;
            $table = 'case_video_'.date('Ym',strtotime($start_time));
            $result = M()->table($table)->where($video_where)->save($video_data);
            $syncData[] = array('tab_name'=>$table,'wjbh'=>$wjbh);
        }
        //同步
        $this->sync('case_video',$syncData,'edit');
        if($result){
            $res['status'] = true;
            $res['message'] = '移出视频成功';
            $this->write_log('移出视频'.implode(',',array_keys($wjbhInfo)));
        }else{
            $res['status'] = false;
            $res['message'] = '移出视频失败';
        }
        return $res;
    }
    //合包
    public function pack_merage($request)
    {
        //wjbh 合包文件 多文件,隔开
        //case_key 合包案件
        $wjbhInfo = $request['wjbhInfo'];
        $video_data['case_key'] = $request['case_key'];
        foreach ($wjbhInfo as $wjbh => $start_time) {
            $video_where['wjbh'] = $wjbh;
            $table = 'case_video_'.date('Ym',strtotime($start_time));
            $result = M()->table($table)->where($video_where)->save($video_data);
            $syncData[] = array('tab_name'=>$table,'wjbh'=>$wjbh);
        }
        //同步
        $this->sync('case_video',$syncData,'edit');
        if($result){
            $res['status'] = true;
            $res['message'] = '合并视频成功';
            $this->write_log('合并视频'.implode(',',array_keys($wjbhInfo)));
        }else{
            $res['status'] = false;
            $res['message'] = '合并视频失败';
        }
        return $res;
    }
    //显示可以合包文件
    public function show_unpack($request)
    {
        //areaid  部门ID
        //page   页数
        //rows   条数
        $page = $request['page'];
        $rows = $request['rows'];
        $where[] = $this->get_manger_sql();
        $where['case_key'] = '';
        $btime = $request['start_time']['btime'] ? $request['start_time']['btime'] : date('Y-m-d H:i:s',time()-6*24*60*60);
        $etime = $request['start_time']['etime'] ? $request['start_time']['etime'] : date('Y-m-d H:i:s');
        $where['start_time'][] = array('EGT',$btime);      //开始时间
        $where['start_time'][] = array('ELT',$etime); //结束时间
        $months = $this->get_twoDates($btime, $etime, 'Ym', '+1 month');
        $total = array();
        $tables = $this->get_dbTables();
        foreach ($months as $month) {
            if(!in_array('case_video_'.$month,$tables)) continue;
            $total[$month] = M()->table('case_video_'.$month)->where($where)->count();
        }
        $tables = $this->get_query_table($total,$page,$rows);
        $res = array();
        $res['total'] = array_sum($total);
        $res['rows'] = array();
        foreach ($tables as $table => $start_limit) {
            $data = M()->table('case_video_'.$table)->where($where)->limit(implode(',',$start_limit))->select();
            $res['rows'] = array_merge($res['rows'],(array)$data);
        }
        $this->saveExcel($res); //监测是否为导出
        return g2us($res);
    }
    //删除视频
    public function media_remove($request)
    {
        //wjbh  文件编号
        //start_time 文件开始时间
        $start_time = $request['start_time'];
        $table = 'case_video_'.date('Ym',strtotime($start_time));
        $result = M()->table($table)->where($request)->delete();
        $syncData[] = array('tab_name'=>$table,'wjbh'=>$request['wjbh']);
        //同步
        $this->sync('case_video',$syncData,'edit');
        if($result){
            $res['status'] = true;
            $res['message'] = '删除视频成功';
            $this->write_log('删除'.$request['wjbh']);
        }else{
            $res['status'] = false;
            $res['message'] = '删除视频失败';
        }
        return $res;
    }
    //为了确保数据的完整准确 不要 session_write_close()
    public function break_point_upload()
    {
        $request = I('');
        $type = trim(strrchr($request['name'], '.'),'.');

        $rootPath = explode(str_replace('/','',__ROOT__),__FILE__)[0];   //保存路径
        $tempPath = $rootPath.'temp/';
        if(!is_dir($tempPath)) mkdir($tempPath);

        //$this->del_dir($tempPath);      //删除超时文件
        $savePath = $tempPath.date('Ymd').'/';
        if(!isset($request['chunks'])){
            $request['chunks'] = 1;
            $request['chunk'] = 0;
        }
        //文件暂存pe_file目录  做超时删除
        $result = $this->break_point_save($request,$savePath,$type);
        if($request['chunk'] == $request['chunks']-1){
            //将文件保存完后 移动到指定目录
            $source = $request['source'];   //视频来源
            $case_key = $request['case_key'];   //所属案件
            $start_time = $request['start_time'];  //入库
            //根据案件发生时间ftp_dir 找到足够到的ftp目录
            $web_path = D($this->models['ftpdir'])->where('enable = 1 AND is_ftp_dir = 1')->getField('web_path');
            $where['jybh'] = session('code');
            $cpxh = D($this->models['pebase'])->where($where)->getField('cpxh');
            $cpxh = $cpxh ? $caxh : 'cpxhpe';
            $wjbh = $cpxh.'_'.session('code').'_'.date('YmdHis').'.'.$type;
            $web_path = $web_path ? $web_path :'/pe_file/';
            if(!is_dir($rootPath.$web_path)) mkdir($rootPath.$web_path);
            if(!is_dir($rootPath.$web_path.'pedata/')) mkdir($rootPath.$web_path.'pedata/');
            if(!is_dir($rootPath.$web_path.'pedata/'.$cpxh)) mkdir($rootPath.$web_path.'pedata/'.$cpxh);
            if(!is_dir($rootPath.$web_path.'pedata/'.$cpxh.'/'.date('Ymd'))) mkdir($rootPath.$web_path.'pedata/'.$cpxh.'/'.date('Ymd'));
            copy($savePath.md5($request['name']).'.'.$type,$rootPath.$web_path.'pedata/'.$cpxh.'/'.date('Ymd').'/'.$wjbh);  //复制文件
            unlink($savePath.md5($request['name']).'.'.$type);
            //补充数据
            $data['wjbh'] = $wjbh;
            $data['start_time'] = $data['scsj'] = $data['update_time'] = date('Y-m-d H:i:s');
            $data['wjlx'] = $this->get_wjlx($type);
            $data['case_key'] = $case_key;
            $data['jybh'] = session('code');
            $data['jyxm'] = u2g(session('user'));
            $data['areacode'] = session('areacode');
            $data['areaname'] = u2g(session('areaname'));
            $data['cpxh'] = $cpxh;
            $data['ccfwq_ip'] = $this->get_local_ip();
            $data['bfwz'] = 'http://'.$data['ccfwq_ip'].':'.$_SERVER['SERVER_PORT'].$web_path.'pedata/'.$cpxh.'/'.date('Ymd').'/'.$data['wjbh'];
            $data['source'] = $source;
            $table = 'case_video_'.date('Ym',strtotime($start_time));
            $res = M()->table($table)->add($data);
            $syncData[] = array('wjbh'=>$data['wjbh'],'tab_name'=>$table);
            $this->sync('case_video',$syncData,'add');
        }
        $this->ajaxReturn($result);
    }
    //保存文件
    public function break_point_save($request,$savePath,$type)
    {
        $result = array('chunk'=>'','chunks'=>'','message'=>'');
        $name = md5($request['name']);
        if(!is_dir($savePath)) mkdir($savePath);
        $file = $_FILES['file'];
        $result = array_intersect_key($request,$result);
        if($file['error']==0){      //上传成功
            if(!file_exists($savePath.$name.'.'.$type)){
                if(!move_uploaded_file($file['tmp_name'],$savePath.$name.'.'.$type)){
                    $result['status'] = false;
                }else{
                    $result['status'] = true;
                }
            }else{
                $content = file_get_contents($file['tmp_name']);
                if (!file_put_contents($savePath.$name.'.'.$type, $content,FILE_APPEND)) {
                    $result['status'] = false;
                }else{
                    $result['status'] = true;
                }
            }
        }else{
            $result['status'] = false;
        }
        return $result;
    }
    /**
     * 获取文件类型
     * @param  string $type 文件后缀
     * @return int  0 未知 1 视频 2 音频 3 图片
     */
    public function get_wjlx($type)
    {
        $type = strtolower($type);
        $types = array(
            //视频
            'mp4'=>1,'mov'=>1,'rmvb'=>1,'avi'=>1,'flv'=>1,'mpeg'=>1,
            //音频
            'mav'=>2,'mp3'=>2,'wma'=>2,
            //图片
            'jpg'=>3,'bmp'=>3,'jpeg'=>3,'gif'=>3,'png'=>3,
            );
        return array_key_exists($type, $types) ? $types[$type] : 0;
    }
}