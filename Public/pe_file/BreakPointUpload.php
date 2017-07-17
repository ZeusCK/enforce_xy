<?php

class BreakPointUpload{
    private $file;      //上传文件数组
    private $filename;  //文件名
    private $error;     //上传文件错误
    private $config = array();  //保存文件数组
    private $res = array();         //返回结果数组
    //前端file的name值
    public function __construct($inputname)
    {
        $this->file = $_FILES[$inputname];
        $this->filename = $_POST['filename'];
        $this->config['filepath'] = './pedata/'.$_POST['cpxh'].'/'.date('Ymd');
        $this->config['jybh'] = $_POST['jybh'];
        $this->config['cpxh'] = $_POST['cpxh'];
        $this->config['md5'] = $_POST['md5'];
        $this->config['areaid'] = $_POST['areaid'];
        $this->config['areaname'] = $_POST['areaname'];
        $this->config['pos'] = $_POST['pos'];
        $this->config['end'] = $_POST['end'] ? $_POST['end'] : false;
        $this->error();
    }
    private function file_type(){
        //文件类型
        $this->config['fileType'] = trim(strrchr($this->filename, '.'),'.');
    }
    private function file_name(){
        $this->config['filename'] = $this->config['md5'].'.'.$this->config['fileType'];
    }
    private function error(){
        $errorCode = $this->file['error'];
        switch ($errorCode) {
            case 1:
                $this->error = '上传的文件超过了 php.ini 中 upload_max_filesize 选项限制的值！';
                break;
            case 2:
                $this->error = '上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值！';
                break;
            case 3:
                $this->error = '文件只有部分被上传！';
                break;
            case 4:
                $this->error = '没有文件被上传！';
                break;
            case 6:
                $this->error = '找不到临时文件夹！';
                break;
            case 7:
                $this->error = '文件写入失败！';
                break;
            default:
                $this->error = '未知上传错误！';
        }
    }
    private function get_upload_info(){
        if(file_exists($this->config['filepath'].'/'.$config['md5'])){
            $fp = fopen($this->config['filepath'].'/'.$config['md5'], 'r');
            $pos = -1;
            if(fseek($fp, $pos, SEEK_END)==0){    //fseek成功返回0，失败返回-1
                $eof = fgets($fp,-1);
            }
            fclose($this->config['filepath'].'/'.$config['md5']);
            return $eof;
        }else{
            return false;
        }
    }
    private function write_md5($content){
        file_put_contents($this->config['filepath'].'/'.$this->config['md5'], $content,FILE_APPEND);
    }
    public function save_file(){
        if($this->error){
            $this->res['status'] = false;
            $this->res['error'] = $this->error;
            return $this->res;
        }
        if(!is_dir($this->config['filepath'])) mkdir($this->config['filepath'],0777,true);      //目录,权限,多级目录

        if(file_exists($this->config['filepath'].'/'.$this->config['filename'])){
            $content = file_get_contents($this->file['tmp_name']);
            if (!file_put_contents($this->config['filepath'].'/'.$this->config['filename'], $content,FILE_APPEND)) {
                $this->res['status'] = false;
                $this->res['error'] = '上传失败';
            }else{
                $this->write_md5($this->config['pos']);
                $this->res['status'] = true;
            }
        }else{
            if(!move_uploaded_file($this->file['tmp_name'],$this->config['filepath'].'/'.$this->config['filename'])){
                $this->res['status'] = false;
                $this->res['error'] = '上传失败';
            }else{
                $this->write_md5($this->config['pos']);
                $this->res['status'] = true;
            }
        }
        return $this->res;
    }

    public function insert_voideo()
    {
        $pdo = new PDO('mysql:host=localhost;dbname=enforce','root','123456');
        //1视频2音频3图片9其他0未知
        $wjlxType = ['jpg'=>3,'gif'=>3,'png'=>3,'jpeg'=>3,'mov'=>1,'mp4'=>1,'rmvb'=>1,'mp3'=>2,'wma'=>2,'wav'=>2];
        //本机ip
        $ip = $this->get_local_ip();
        $port = $_SERVER['SERVER_PORT'];
        //准备插入数据
        $bfwz = 'http://'.$ip.$port.'/pe_file'.substr($this->config['filepath'].'/'.$this->config['filename'], 1);
        $areaid = $this->config['areaid'];
        $areaid = $this->config['areaid'];
        $areaname = $this->config['areaname'];
        $jybh = $this->config['jybh'];
        $jyxm = $this->config['jyxm'];
        $cpxh = $this->config['cpxh'];
        $bzlx = 2;          //上传视频
        $wjlx = array_key_exists($this->config['type'],$wjlxType) ? $wjlxType[$this->config['type']] : 9;
        $wjbh = $this->config['cpxh'].'@'.$this->config['filename'];
    }
    //获取本机ip地址
    public function get_local_ip()
    {
        return DIRECTORY_SEPARATOR === '/' ? $_SERVER['SERVER_ADDR'] : gethostbyname(gethostname());
    }
}

//$breakpoint = new BreakPointUpload('upload');
//$res = $breakpoint->save_file();