<?php
return array(
    //'配置项'=>'配置值';
    //'SHOW_PAGE_TRACE' => 'true',
    'URL_MODEL' => 1,
    'URL_CASE_INSENSITIVE'=>false, //URL访问不再区分大小写
    //连接数据库
    'DB_TYPE'   => 'mysql', // 设置数据库类型
    'DB_HOST'   => 'localhost', // 设置主机 192.168.0.241
    'DB_NAME'   => 'enforce_xz', // 设置数据库
    'DB_USER'   => 'root', // 设置用户名
    'DB_PWD'    => '123456', // 设置密码
    'DB_PORT'   => 3306, // 设置端口
    'DB_PREFIX' => '', // 设置前缀
    'DB_CHARSET'=> 'latin1', // 取消默认编码UTF8
    'DB_PARAMS' => array(\PDO::ATTR_CASE => \PDO::CASE_NATURAL),
    'LOAD_EXT_CONFIG' => 'model',      //模型配置
    //额外添加配置信息
    //地图相关 南京 118.78 32.04
    'MAP_LNG'   => '32.04',  //地图经度
    'MAP_LAT'   => '118.78',  //地图维度
    'ENFORCE_VERSION'=>'1.0.0.13',    //版本控制解决程序更新后会有缓存问题
    'SYNC_DB_HOST'=>'localhost',     //同步主机  暂时没有用
    'SYNC_DB_NAME'=>'enforce_xz'     //同步数据库 
);