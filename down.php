<?php
	header("Content-type:text/html;charset=utf-8");
	$file_name='';
	if(!empty($_GET['v'])){
		$file_name=$_GET['v'];
	}
	if(!empty($_GET['path'])){
		$file_sub_path=$_GET['path'];
	}
	$file_path = $file_sub_path.'/'.$file_name;
	if(!file_exists($file_path)){
		echo '不存在['.$file_path.']';
		return;
	}
	$file_size=filesize($file_path);
	$fp=fopen($file_path,"r");
	header("Content-type:application/octet-stream");
	header("Accept-Ranges:bytes");
	header("Accept-Length:".$file_size);
	header("Content-Disposition:attachment;filename=".$file_name);
	$buffer=10240;
	$count=0;
	$file='';
	while(!feof($fp)&&$count<$file_size){
		$file_con=fread($fp,$buffer);
		$count+=$buffer;
		echo $file_con;
	}
	fclose($fp);
	exit();
