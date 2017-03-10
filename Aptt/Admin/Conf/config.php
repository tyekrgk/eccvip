<?php
return array(
	//'配置项'=>'配置值'
	'TMPL_PARSE_STRING' => array(
		'__PUBLIC__' => __ROOT__ . '/Aptt/Admin/View/PUBLIC'
	),
	'RBAC_SUPERADMIN'	=> 'admin', 		//超级管理员帐号
    'ADMIN_AUTH_KEY'	=> 'superadmin', 	//超级管理员识别
	'USER_AUTH_ON'      => true,			//是否开启权限认证
	'USER_AUTH_KEY'		=> 'id',			//会员识别号,存储于SESSION中的键
	'USER_AUTH_TYPE'    => '1',//2为即时验证模式，别的数字为登陆验证
	'NOT_AUTH_MODULE'=>'Login,Index',				//无须认证的控制器
    'NOT_AUTH_ACTION'=>'save,viewsave,leavesave,remsave,congsave,psave',				//无须认证的方法
	'RBAC_ROLE_TABLE'   => 'dd_role',
	'RBAC_USER_TABLE'   => 'dd_role_user',
	'RBAC_ACCESS_TABLE' => 'dd_access',
	'RBAC_NODE_TABLE'   => 'dd_node',
	'FILE_IN'   => 'admin.php',		//自定义入口文件
);
?>