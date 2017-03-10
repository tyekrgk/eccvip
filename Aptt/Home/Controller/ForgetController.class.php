<?php 
namespace Home\Controller;
use Think\Controller;

/**
* 找回密码
*/
class ForgetController extends Controller{
	
	public function index(){
		$this->display();
	}

	public function cheusername(){
		$status=0;
		$data="";
		if(IS_POST){
			$username=I("post.username","");
			if($username){
				$r=M("member")->field("q1,q2,q3")->where("username='".$username."' and q=1")->find();
				if($r){
					$this->info=$r;
				}else{
					$data="您输入的帐号不存在或未添加密保问题";
				}
			}else{
				$data="会员不存在";
			}
		}else{
			$data="请勿非法操作";
		}
		if($data){
			 $this->show(alertstr($data,1,U('index.php/Forget/index')),"utf-8");
			 exit;
		}
		$this->username=$username;
		$this->display();
	}

	public function next(){
		if (IS_POST){
			$D=D("Forget");
			$data=$D->answer();
			if($data==1){
				$username=I("post.username","");
				$key=explode(",","1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n");
			    $str="";
			    for($i=0;$i<6;$i++){
			        $rand=rand(0,22);
			        $str.=$key[$rand];
			    }
			    M("member")->data(array("upd1"=>md5($str),"upd2"=>md5($str)))->where(array("username"=>$username))->save();
			    $this->show(alertstr("密码重置成功",0,U('index.php/Forget/showinfo',array("username"=>$username,"up"=>$str))),"utf-8");
			}else{
				$this->show(alertstr($data,2),"utf-8");
			}
		}else{
			$this->show(alertstr("请勿非法操作",0,U('index.php/Forget/index')),"utf-8");
		}
	}
	
	public function showinfo(){
		$username=I("get.username","");
		$up=I("get.up","");
		$this->username=$username;
		$this->up=$up;
		$this->display();
	}
}

 ?>