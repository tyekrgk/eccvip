<?php 
namespace Web\Controller;
use Web\Controller\BaseController;

/**
* 推广链接
*/
class PromoteController extends BaseController{
	
	public function index(){
		$rname=I("get.id","");
		$rand=rand(111111,999999);
		$r=M("member")->field("id,username")->where(array("id"=>1))->find();
		$rrname=$r['username'];
		$r=M("member")->field("id,username")->where(array("username"=>base64_decode($rname),'status'=>1))->find();
		if($r)$rrname=$r['username'];
		$this->rand=$rand;
		$this->rname=$rrname;
		$this->display();
	}

	public function save(){
		$username=I("post.username","");
		$upd1=I("post.upd1","");
		$upd2=I("post.upd2","");
		$D=D("Promote");
		$data=$D->prosave();
		$status=0;
		if($data==1){
			$data="注册成功!请记好您的登录帐号[".$username."],登录密码[".$upd1."],二级密码[".$upd2."]";
			//$status=1;
		}
		if($data==2){
			$data="注册失败";
		}
		$this->show(alertstr($data,$status,U(C("FILE_IN")."/Index/index")),"utf-8");
		//$this->display();
	}
}

 ?>