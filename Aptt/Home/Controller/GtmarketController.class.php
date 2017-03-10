<?php 	
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 交易市场
*/
class GtmarketController extends BaseController{
	/**
	 * 交易主界面
	 */
	public function index(){
		$uid=I('session.uid',0,'intval');
		$days=I('get.days',10,'intval')-1;
		$F=F('data');
		if($F['eplock']){
			$this->show(alertstr("AD交易市场未开启,请关注系统公告",0,U("index.php/Index/index")),"utf-8");
		}
		$price=$F['gdprice'];
		$datelist=array();
		$value=array();
		$r=M('highcharts')->where("type=0 and date<'".(time()-$days*24*3600)."'")->order('id desc')->limit(1)->select();
		if($r) $price=$r[0]['price'];
		for($i=$days;$i>=0;$i--){
			$date=date("Y-m-d",time()-$i*24*3600);
			array_push($datelist, "'".$date."'");
			$r=M('highcharts')->field('price')->where("date='".$date."'")->find();
			if($r) $price=$r['price'];
			array_push($value,$price);
		}
		$sid=0;
		$rs=M('gtmarket')->where("status=1")->order('status asc,id asc')->find();
		if($rs)$sid=$rs['id'];
		$r=array();
		if($sid)$r=M('gtmarket')->field('price,number,donumber,status')->where('type=0 and id>='.$sid.' and id<='.($sid+2))->order('id asc')->limit(3)->select();
		$list[]=$r[0];
		$this->list=$list;
		$this->lc=$rs;
		$this->days=$days+1;
		$this->date=join(",",$datelist);
        $this->value=join(",",$value);
		$this->display();
	}

	public function gt1save(){
		$D=D("gtmarket");
		$data=$D->dogt1save();
		$status=0;
		if($data==1){
			$data="购买AC币成功!";
			$status=1;
		}
		if($data==2){
			$data="购买AC币失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	public function gt2save(){
		$D=D("gtmarket");
		$data=$D->dogt2save();
		$status=0;
		if($data==1){
			$data="卖出AC币成功!";
			$status=1;
		}
		if($data==2){
			$data="卖出AC币失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	function gd1(){
		$uid=I('session.uid',0,'intval');
		$list=M('history')->where('type=401 and uid='.$uid)->order('id desc')->select();
		$rs=M('gtmarket')->where("status>0")->order('status asc,id asc')->limit(2)->select();
		$this->lc=$rs;
		$this->list=$list;
		$this->display();
	}
	function gd2(){
		$uid=I('session.uid',0,'intval');
		$list=M('history')->where('type=402 and uid='.$uid)->order('id desc')->select();
		$rs=M('gtmarket')->where("status>0")->order('status asc,id asc')->limit(2)->select();
		$this->lc=$rs;
		$this->list=$list;
		$this->display();
	}
	public function gd1view(){
		$uid=I('session.uid',0,'intval');
		$id=I("get.id",0,'intval');
		$r=M('history')->where('type=401 and id='.$id.' and uid='.$uid)->find();
		$data="记录不存在";
		$status=0;
		if(!$r){
			$this->show(alertstr($data,$status,$_SERVER['HTTP_REFERER']),"utf-8");
			exit;
		}
		$list=M("history")->where("type=815 and key1=".$id)->select();
		$this->v=$r;
		$this->list=$list;
		$this->display();
	}
	public function gdsave(){
		$D=D("gtmarket");
		$data=$D->dogdsave();
		$status=0;
		if($data==1){
			$data="矿机AC币转入成功!";
			$status=1;
		}
		if($data==2){
			$data="卖出AC币失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function gd1togd2(){
		$D=D("gtmarket");
		$data=$D->dogd1togd2();
		$status=0;
		if($data==1){
			$data="AD1转帐成功!";
			$status=1;
		}
		if($data==2){
			$data="AD1转帐失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

}

 ?>