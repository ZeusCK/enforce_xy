<?php
    header("Content-type:text/html;charset=utf-8");
    $file_name='';
    if(!empty($_GET['filePath'])){
        $file_name = $_GET['filePath'];
    }
    //去除http和IP地址
    $filePathArr = explode('/', $file_name);
    $filePathArr = array_slice($filePathArr,3);        
    $file_name = implode('/', $filePathArr);
    // +---------------------------------------------------------------------------------------
    // |如果用apache alias模块 down.php  位于pe_file下  文件地址 /pe_file/pedata/20170614/a.mov  
    // |使用上级目录进行拆分 得到相对于down.php 的相对路径  ./pedata/20170614/a.mov
    // +---------------------------------------------------------------------------------------
    // |如果分服务器  down.php  位于网站根目录下  文件地址 /pe_file/pedata/20170614/a.mov
    // |使用上级目录进行拆分 得到相对于down.php 的相对路径  ./pe_file/pedata/20170614/a.mov
    // +---------------------------------------------------------------------------------------
    // | tip 网站根目录 不能出现在文件地址中
    // +---------------------------------------------------------------------------------------
    $path = __FILE__;
    $path = str_replace('down.php', '', $path);
    $fileArr = explode(basename($path),$file_name);
    $file_path = './'.array_pop($fileArr);
    if(!file_exists($file_path)){               
        exit('不存在['.$file_path.']');
    }
    $file_size = filesize($file_path);
    $fp = fopen($file_path,"r");
    header("Content-type:application/octet-stream");
    header("Accept-Ranges:bytes");
    header("Accept-Length:".$file_size);
    header("Content-Disposition:attachment;filename=".basename($file_name));
    $buffer = 10240;
    $count = 0;
    while(!feof($fp) && $count < $file_size){
        $file_con = fread($fp,$buffer);
        $count += $buffer;
        echo $file_con;
    }
    fclose($fp);
    exit();
