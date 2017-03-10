<?php
return array(
	//数据库配置信息
	'DB_TYPE'   => 'mysql', // 数据库类型
	'DB_HOST'   => 'localhost', // 服务器地址
	'DB_NAME'   => 'ecfvip', // 数据库名
	'DB_USER'   => 'root', // 会员编号
	'DB_PWD'    => 'root', // 密码
	'DB_PORT'   => 3306, // 端口
	'DB_PREFIX' => 'dd_', // 数据库表前缀 
	'DB_CHARSET'=> 'utf8', // 字符集
	//'配置项'=>'配置值'
	'DEFAULT_MODULE'     => 'Index', //默认模块   
	'URL_MODEL'          => '2', //URL模式    
	'SHOW_PAGE_TRACE'   => true, //开启日记追踪
	'SESSION_AUTO_START' => true, //是否开启session
	// 默认JSONP格式返回的处理方法
	'DEFAULT_JSONP_HANDLER' =>  'myJsonpReturn',
	//多语言
	'LANG_SWITCH_ON' => true,   // 开启语言包功能
    'LANG_AUTO_DETECT' => true, // 自动侦测语言 开启多语言功能后有效
    'DEFAULT_LANG' => 'zh-cn', // 默认语言
    'LANG_LIST'        => 'zh-cn,en-us,ko', // 允许切换的语言列表 用逗号分隔
    'VAR_LANGUAGE'     => 'l', // 默认语言切换变量
);
