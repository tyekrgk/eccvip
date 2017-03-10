<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller{
	Public function _initialize(){
		$error=inject_check();		//注入过滤
		if($error){
			$this->show(alertstr($error,0,U(C("FILE_IN")."/Login/index")),"utf-8");
		}
	}
	/**
	 * 入口函数
	 */
	public function index(){
		$this->display();
	}   

	/**
	 * 登录验证
	 * @return [type]
	 */
	public function login(){
		if(!IS_POST)  $this->error('请勿非法提交!');
		$code=I('post.verifycode','','htmlspecialchars'); 
		/*
		$verify = new \Think\Verify(); 
		$cheverify=$verify -> check($code, $id);
		if(!$cheverify){
			//$this->error('验证码错误!');	
			$this->show(alertstr("验证码错误!",0,U(C("FILE_IN")."/Login/index")),"utf-8");
			exit;
		}
		*/
		$username=I('username');
		$password=I('password','','md5');
		$user=M('admin')->where(array('username'=>$username))->find();
		if(!$user || $user["password"] != $password){
			//$this->error('帐号或密码错误');
			$this->show(alertstr("帐号或密码错误",0,U(C("FILE_IN")."/Login/index")),"utf-8");
			exit;
		}
		if($user["lock"]){
			//$this->error('帐号已锁定');
			$this->show(alertstr("帐号已锁定",0,U(C("FILE_IN")."/Login/index")),"utf-8");
			exit;
		}
		$data=array(
			'id'=>$user["id"],
			'time'=>time(),
			'ip'=>get_client_ip()
		);
		M('admin')->save($data);
		session('adminid',$user['id']);
		session('adminusername',$user['username']);
		session('kjsdflks',$user['password']);
		if($username == C('RBAC_SUPERADMIN')){
            session(C('ADMIN_AUTH_KEY'),$user["id"]);
        }else{
            \Org\Util\Rbac::saveAccessList($user["id"]);
        }
		/**
		*if($_SESSION['username']==C('RBAC_SUPERADMIN')){
		*	session(C('ADMIN_AUTH_KEY'),true);
		*}
		*import('ORG.Util.RBAC');
		*RBAC::saveAccessList();
		*p($_SESSION);
		*$this->display();
		*die;
		**/
		$this->redirect(C("FILE_IN").'/Index/index');
	}
	
	/**
     * 验证码生成
     * @return [type]
     */
	public function verify(){
		 $config = array(
            'imageH'    => 30,               // 验证码图片高度
            'imageW'    => 110, 
            'fontSize'  => 16,
            'length'    => 4,               // 验证码位数
            'useNoise'	=> true,			//混淆曲线 
            'useCurve'	=> false,			//杂点
            'codeSet' 	=> '0123456789',
        );
		$Verify = new \Think\Verify($config);
		$Verify->entry();
	}
                 
}

