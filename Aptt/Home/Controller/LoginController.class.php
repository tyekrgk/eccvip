<?php 
namespace Home\Controller;
use Think\Controller;

/**
*  登录模块
*/
class LoginController extends Controller{
	Public function _initialize(){
		$error=inject_check();		//注入过滤
		if($error){
			$this->show(alertstr($error,0,U("index.php/Login/index")),"utf-8");
		}
		$web=M("web")->where("id=1")->find();
		if($web["status"]) $this->redirect("index.php/Close/index","页面跳转中...");
		$this->web=$web;
	}

	public function index(){
		$this->display();
	}

	public function login(){
		$status=0;
		$errurl=U("index.php/Login/index");
		if(!IS_POST){
			$this->show(alertstr('请勿非法提交!',$status,$errurl),"utf-8");
		}

		/*  去掉验证码验证
		$code=I('post.code','','htmlspecialchars'); 
		$verify = new \Think\Verify(); 
		$cheverify=$verify -> check($code);
		if(!$cheverify){
			$this->show(alertstr('验证码错误!',$status,$errurl),"utf-8");
			return;
		}
		*/
		
		$username=I('username');
		$password=I('password','','md5');
		$gacode=I('gacode','');//谷歌验证码
		$user=M('member')->field("username,id,upd1,lok,ft,ga")->where(array('username'=>$username))->find();
		if(!$user || $user["upd1"] != $password){
			$this->show(alertstr('帐号或密码错误',$status,$errurl),"utf-8");
			return;
		}
		// $checkcode = checkga($user['ga'], $gacode);
		// if($checkcode!=1){
  //           $this->show(alertstr('谷歌验证码错误!',$status,$errurl),"utf-8");
  //           return;
		// }
		if($user["lok"] || $user["ft"]){
			$this->show(alertstr('帐号已锁定',$status,$errurl),"utf-8");
			return;
		}
    	M()->execute("update __PREFIX__member set lastip=loginip,lastdate=logindate,loginip='".get_client_ip()."',logindate='".date("Y-m-d H:i:s")."'");
    	session('uid',$user['id']);
    	session('username',$user['username']);
    	session("iuhivwszv",$user['upd1']);
    	$this->redirect('index.php/Index/index');
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

 ?>