<?php
	header('Content-type: text/html; charset=utf-8');
    $url     = '../downfile/';
    $version = '1.0.11';
    $data    =
    [
        [
            'title' => 'VLC视频播放器',
            'url'   => $url.'vlc.exe',
            'nme'   => 'vlc.exe'
        ]
    ];

    function downfile($path)
    {
    	//$path = 'D:\phpStudy\WWW\tmp\V1.0.11.rar';
			$mm_type="application/octet-stream"; // modify accordingly to the file type of $path, but in most cases no need to do so
			$filesize = filesize($path);
			header("Pragma: public");
			header("Expires: 0");
			header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
			header("Cache-Control: public");
			header("Content-Description: File Transfer");
			header("Content-Type: " . $mm_type);
			header("Content-Length: " .$filesize );
			header('Content-Disposition: attachment; filename="'.basename($path).'"');
			header("Content-Transfer-Encoding: binary\n");
			$chunksize = 1 * (1024 * 1024); // how many bytes per chunk
			if ($filesize > $chunksize) {
			 $handle = fopen($path, 'rb');
			 $buffer = '';
			 while (!feof($handle)) {
			$buffer = fread($handle, $chunksize);
			echo $buffer;
			ob_flush();
			flush();
			 }
			 fclose($handle);
			} else {
			 readfile($path);
			}
			exit();
    }
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cach" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />

  <title>执法记录仪数据管理平台</title>
  <style>
  	html, body, * {
	  	font-family: "Microsoft YaHei" ! important;
		margin:0;
		padding:0;


    }
	.header{
		background: #0063ca;
		height:4em;
		line-height: 4em;
		color: #fff;
	}
	dl{
		width: 1005px;
		margin: 0 auto;
	}
	dl dd{
		float: left;
	    line-height: 5.0em;
	    margin-left: 15px;
	}
	dl dt{
		font-size: 1.8em;
		float: left;
		text-indent: 20px;
		text-shadow:1px 1px 2px blue;
	}
	.describe{
		margin: 20px auto 10px auto;
		color: #666;
		padding:0 20px;
		min-width: 300px;
		max-width: 1000px;

		line-height: 1.8em;

	}
	.about_download{

  		min-width:500px;
  		max-width: 1000px;
  		margin: 0 auto;
  		clear: both;
  		overflow: hidden;
  	}
  	.about_download ul{ margin-left: 12px;}
	.about_download li{
		margin-left:20px;
		float: left;
		list-style: none;
	}
	.about_download li a{
		display: block;
		text-decoration: none;
		color: #333;
		background: #3dbb2b url('./Public/images/xz.png') no-repeat 7px center;
		height: 52px;
		line-height: 52px;
		border-radius:3px;
		border:1px solid #228b22;
		color: #fff;
		padding: 0 8px;
		margin-top: 10px;
		width: 180px;
		text-indent: 28px;
		text-shadow:1px 1px 1px #333;

	}
	.install{
		min-width: 500px;
		max-width: 1000px;
		overflow: hidden;
		clear: both;
		margin:0 auto;
		padding-top: 20px;
		line-height: 2.0em;

	}
	.install_c{ margin-left: 20px;color: #666;}

  </style>
</head>
	<div id="content" >
		<div class=" header" >
			<dl>
				<dt>执法记录仪数据管理平台</dt>
				<dd>标准版 DH-V <?php echo $version?></dd>
			</dl>
		</div>
		<div class="describe" >全新的界面框架，更人性化的数据显示、查询、比对、筛选操作功能，功能强化。</div>
		<div class="about_download"><ul>
		<?php
		    foreach ($data as $val)
		    {
		    	echo('<li>
						<a href="down.php?v='.$val['nme'].'&path=../downfile">'.$val['title'].'</a>
		    		</li>');
		    }
		?>
		</ul></div>
		<div class="install"  >
			<div class="install_c">
				<p style="font-weight: bold;">提示信息：</p>
				<p>1）安装火狐后更好的体验视音频；</p>
                <p>2）平台将会有更好的体验；</p>
			</div>
		</div>
	</div>
</body>
</html>