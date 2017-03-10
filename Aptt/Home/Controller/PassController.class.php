<?php 
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 验证二级密码
*/
class PassController extends BaseController{
	
	public function index(){
		$mm=I("get.mm","");
		$cc=I("get.cc","");
		$aa=I("get.aa","");
		$this->mm=$mm;
		$this->cc=$cc;
		$this->aa=$aa;
		$this->display();
	}

	public function save(){
		$uid=I("session.uid",0,"intval");
		$mm=I("get.mm","");
		$cc=I("get.cc","");
		$aa=I("get.aa","");
		$upd2=I("post.upd2","","md5");
		$path=$mm."-".$cc."-".$aa;
		$r=M("member")->field("id")->where(array('id'=>$uid,'upd2'=>$upd2))->find();
		if($r){
			//$_session["pass"][$path]=1;
			session($path,1);
			$this->redirect("index.php/".$cc."/".$aa."","页面跳转中...");
		}else{
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
	}
}

 ?>