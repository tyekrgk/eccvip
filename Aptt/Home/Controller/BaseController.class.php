<?php 
namespace Home\Controller;
use Think\Controller;

/**
* 
*/
class BaseController extends Controller{
	
	Public function _initialize(){
		$uid=I("session.uid",0,"intval");
	    $username=I("session.username","");
	    $key=I("session.iuhivwszv","");
	    $error=inject_check();		//注入过滤
		if($error){
			$this->show(alertstr($error,0,U("index.php/Login/index")),"utf-8");
		}
	    $admininfo=M("member")->where(array("id"=>$uid,"username"=>$username,"upd1"=>$key))->find();
	    if($admininfo){

	    }else{
	        $this->redirect("index.php/Login/index","页面跳转中...");
	    }

		if(!F("data")){
			$M=M("coin");
			$data=$M->where(array('id'=>1))->find();
			F("data",$data);
		}
		$F=F("data");
	    $r=M('gtmarket')->where('status=1')->find();
		$keyprice=$r['price'];
		/* 不使用这套逻辑
		$k=M("highcharts")->where(array("date"=>date("Y-m-d")))->find();
		if(!$k){
			$price=1;
			$kk=M("gtmarket")->where("status=1")->find();
			if($kk) $price=$kk["price"];
			M("highcharts")->data(array("date"=>date("Y-m-d"),"price"=>$price))->add();
		} */
		$plan=M('invest_plan')->where('uid='.$uid)->find();
		
		if(!F("bonus")){
			$M=M("bonus");
			$r=$M->select();
			$data=array();
			foreach($r as $v){
				$data[$v['id']]=$v;
			}
			F("bonus",$data);
		}
		$bonus=F("bonus");
		//M("market")->where("status=1 and buyid>0 and lockdate<'".date("Y-m-d H:i:s",time())."'")->save(array("status"=>0,"buyid"=>0,"lockdate"=>null,"buytime"=>null));
		//deletemarket();
		$uinfo=M('member')->field("id,username,drsum,ly,bt,bt1,bt2,q,gt,gt1,gd,gd1,gd2,utype,dan,isagent,status,nick,allin,star,regdate,actdate,realname,nick,sex,idcard,email,tel,bank,bankuser,bankcard,bankaddress,epay,bit,country,kgu,gu,pro,areasum,renum,coina,coinb,coinc,qianbaoc,ga")->where("id=".$uid)->find(); 
		if(chestatus($uinfo['status'])) $this->redirect("index.php/Index/perm","页面跳转中...");
		$web=M("web")->where("id=1")->find();
		if($web["status"]) $this->redirect("index.php/Close/index","页面跳转中...");
		$this->web=$web;
		$this->uinfo=$uinfo;
		$this->coinset=$F;
		$this->bonus=$bonus;
		$this->iplan=$plan;
		$this->gdprice=$keyprice;
	}

	function showalert($edata,$key=0){
	    $this->edata=$edata;
	    $this->key=$key;
	    $this->display("Alert:index");
	    exit;
	}
}
?>