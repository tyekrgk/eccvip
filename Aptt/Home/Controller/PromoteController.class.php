<?php 
namespace Home\Controller;
use Think\Controller;

/**
* 推广链接
*/
class PromoteController extends Controller{
	
	Public function _initialize(){
		$error=inject_check();		//注入过滤
		if($error){
			$this->show(alertstr($error,0,U("index.php/Login/index")),"utf-8");
		}
		$uid=I("session.uid",0,"intval");
	    $username=I("session.username","");
	    $key=I("session.iuhivwszv","");
		if(!F("data")){
			$M=M("coin");
			$data=$M->where(array('id'=>1))->find();
			F("data",$data);
		}
		$F=F("data");
		M("market")->where("status=1 and buyid>0 and lockdate<'".date("Y-m-d H:i:s",time())."'")->save(array("status"=>0,"buyid"=>0,"lockdate"=>null,"buytime"=>null));
		deletemarket();
		$uinfo=M('member')->field("id,username,isagent,coin,score,rebuy,status,nick,allin,star,regdate,actdate")->where("id=".$uid)->find(); 
		$web=M("web")->where("id=1")->find();
		if($web["status"]) $this->redirect("index.php/Close/index","页面跳转中...");
		$this->web=$web;
		$this->uinfo=$uinfo;
		$this->coinset=$F;
	}
	public function index(){
		$rname=I("get.id","");
		$line=I("get.line",0,"intval");
		$coin=F("data");
		$rand=rand(111111,999999);
		$r=M("member")->field("id,username")->where(array("id"=>1))->find();
		$rrname=$r['username'];
		$r=M("member")->field("id,username")->where(array("username"=>base64_decode($rname)))->find();
		if($r)$rrname=$r['username'];
		$newname=newname();
		$this->money=$coin['money'];
		$this->rand=$rand;
		$this->newname=$newname;
		$this->rname=$rrname;
		$this->key=$rname;
		$this->display();
	}
	public function save(){
		$rname=I("get.id","");
		$username=I("post.username","");
		$upd1=I("post.upd1","");
		$upd2=I("post.upd2","");
		$D=D("Member");
		$data=$D->regsave();
		$status=0;
		$url=U("index.php/Promote/index",array("id"=>$rname));
		if($data==1){
			$data="注册成功!请牢记您的帐号和密码:".$username.",".$upd1.",".$upd2;
			//$status=1;
			$url=U("index.php/Login/index");
		}
		if($data==2){
			$data="注册失败";
		}
		$this->show(alertstr($data,$status,$url),"utf-8");
		//$this->display();
	}
}

 ?>