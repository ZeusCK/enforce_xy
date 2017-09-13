<?php
namespace Home\Controller;

class FunctionController extends CommonController {
    /**
     * 单张图片下载
     * @param string $imgUrl  图片地址(服务器地址，http地址)
     * @return 输出图片
     */
    public function downImage()
    {
        $imgUrl = I('imgUrl');
        //判断图片地址是否带有http地址，有的话下载后传图片
        $index = strstr($imgUrl, 'http');
        $img = basename($imgUrl);
        if($index){
            $tempPath = './Public/download/Temp/'.date('Ymd').'/';
            if(!file_exists($tempPath)){
                mkdir($tempPath);
            }
            $content = file_get_contents($imgUrl);
            file_put_contents($tempPath.$img, $content);
            $imgUrl = $tempPath.$img;
        }
        if($imgUrl != ''){
            header ( "Cache-Control: max-age=0" );
            header ( "Content-Description: File Transfer" );
            header ( 'Content-disposition: attachment; filename=' . basename ( $imgUrl ) ); // 文件名
            #header ( "Content-Type: application/zip" ); // zip格式的
            #header ( "Content-Transfer-Encoding: binary" ); // 告诉浏览器，这是二进制文件
            header ( 'Content-Length: ' . filesize ( $imgUrl ) ); // 告诉浏览器，文件大小
            readfile ( $imgUrl );//输出文件;
        }else{
            exit('没有图片下载，或者服务器获取图片失败！');
        }
    }
    //下载大文件专用   以时间换空间
    public function downfile()
    {
        header("Content-type:text/html;charset=utf-8");
        $filePath = I('filePath','');
        $filePathArr = explode('/', $filePath);
        $filePathArr = array_slice($filePathArr, 3);
        $filePath = implode('/', $filePathArr);
        $file_name = basename($filePath);
        $file_path = C('FILE_PATH').$filePath;
        if(!file_exists($file_path)){
            exit('不存在['.$file_path.']');
        }
        $file_size = filesize($file_path);
        $fp= fopen($file_path,"r");
        header("Content-type:application/octet-stream");
        header("Accept-Ranges:bytes");
        header("Accept-Length:".$file_size);
        header("Content-Disposition:attachment;filename=".$file_name);
        //1M 读取
        $buffer = 10240;
        $count = 0;
        $file = '';
        while(!feof($fp) && $count < $file_size){
            $file_con = fread($fp,$buffer);
            $count += $buffer;
            echo $file_con;
        }
        fclose($fp);
        exit();
    }
    //删除日期目录
    public function del_dir($dir)
    {
        $date = date('Ymd');
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if($file == '..' || $file == '.') continue;
                    if($date > date('Ymd',strtotime($file))){
                        if(is_dir($dir.'/'.$file)){
                            $cdir = $dir.'/'.$file;
                            $this->del_dir($cdir);
                            echo $cdir."2<br>";
                            rmdir($cdir);
                        }else{
                            echo $dir.'/'.$file."1<br>";
                            unlink($dir.'/'.$file);
                        }
                    }
                }
                closedir($dh);
            }
        }
    }
    //前端获取字典数据
    //type  字典类型
    public function dic_val_item($request)
    {
        $data = $this->get_val_item('dictionary',$request['type']);
        $res = array();
        foreach ($data as $key => $value) {
            $re['value'] = $key;
            $re['item'] = $value;
            $res[] =$re;
        }
        return g2us($res);
    }
    /**
     * 将excel数据读入数组中
     * @param  string $filepath excel文件路径
     * @param  boolean $header 是否有标题头
     * @return array           数组
     */
    public function read_excel($filepath,$header=true)
    {
        if(!$filepath) return array();
        //导入Excel表格
        Vendor('PHPExcel.PHPExcel');
        $objreader = \PHPExcel_IOFactory::createReaderForFile($filepath);
        //载入阅读器 ******类变更为PHPExcel
        $phpexcel = $objreader->load($filepath);
        //获取表名
        $content = $phpexcel->getSheetNames();
        //获取目前表  ******类变更为Worksheet
        $objWorksheet = $phpexcel->getActiveSheet();
        //获取最高列
        $hcolumn = $objWorksheet->getHighestColumn();
        //获取最高行
        $hrow = $objWorksheet->getHighestRow();
        $allData = array();
        $startRow = $header ? 2 : 1;
        for ($j = $startRow; $j <= $hrow; $j++) {
            $oneRowData = array();
            for ($k = 'A'; $k <= $hcolumn; $k++) {
                $cell = $objWorksheet->getCell($k.$j)->getValue();
                if ($cell instanceof \PHPExcel_RichText) $cell = $cell->__toString(); //富文本转换字符串
                $oneRowData[] = $cell;
            }
            $allData[] = $oneRowData;
        }
        return $allData;
    }
    /**
     * 保存上传文件
     * @param  array  $file     文件数组 $_FILES
     * @param  array  $exts     文件保存类型
     * @param  boolean $is_remove_overtime_file 是否删除超时文件
     * @return string/boolean           文件保存位置/false
     */
    public function save_upload($file,$exts,$is_remove_overtime_file=true)
    {
        $rootPath = explode(str_replace('/','',__ROOT__),__FILE__)[0].'temp/';
        $upload = new \Think\Upload(); //实例化上传类
        $upload->maxSize = 3145728; //设置附件上传大小
        $upload->exts = $exts; //设置附件上传类型
        $upload->subName = array('date','Ymd');
        $upload->replace = true; //设置是否覆盖上传文件
        $upload->rootPath = $rootPath; //设置上传文件位置
        if($is_remove_overtime_file)  $this->del_dir($rootPath);    //删除上传超时文件
        // 上传文件
        if(!is_dir($rootPath)) mkdir($rootPath);
        //if(!is_dir($rootPath.date('Ymd'))) mkdir($rootPath.date('Ymd'));
        $result = $upload->uploadOne($file);
        ob_clean();     //清除报警缓存
        return $result ? $rootPath.$result['savepath'].$result['savename'] : false;  //$upload->getError();
    }

}
