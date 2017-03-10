<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
* 主体
*/
class BtController extends BaseController{

	public function index(){
		$M=M('market');
		$where="type=0 and status<4";
		$un=I('get.un',"");
		if($un){
			$wh=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$wh=$v["id"];
			if($wh) $where.=" and (uid=".$wh." or buyid=".$wh.")";
		}
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->status=array(0=>"等待中..",1=>'已锁定',2=>'已付款',3=>'已确认');
		$this->display();
	}

	public function sys(){
		$M=M('market');
		$where="type=1 and status<4";
		$un=I('get.un',"");
		if($un){
			$wh=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$wh=$v["id"];
			if($wh) $where.=" and (uid=".$wh." or buyid=".$wh.")";
		}
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->status=array(0=>"等待中..",1=>'已锁定',2=>'已付款',3=>'已确认');
		$this->display();
	}

	public function syssave(){
		$id=I("get.id",0,'intval');
		$type=0;
		$r=M('market')->where("type=1 and status=2 and id=".$id)->find();
		if($r){
			$rcoin=$r["rcoin"];
			$buyid=$r["buyid"];
			M("member")->where("id=".$buyid)->setInc("bt1",$rcoin);
			history(array('uid'=>$buyid,"bt1"=>$rcoin,"type"=>997,'info'=>"CT交易市场购买成功"));
			M('market')->where("type=1 and status=2 and id=".$id)->save(array('status'=>3));
			updatebtmarket($rcoin,1);	//更新挂单量
			$edata="确认收款成功,交易完成";
		}else{
			$edata="操作失败";
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}
	public function sysdel(){
		$id=I("get.id",0,'intval');
		$type=0;
		if(M('market')->where("type=1 and status<3 and id=".$id)->delete()){
			$edata="操作成功";
			$type=1;
		}else{
			$edata="操作失败";
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}

	public function btover(){
		$F=F("data");
		$M=M('market');
		$where="type=0 and status=2 and buytime<'".(time()-$F['btconfirmover'])."' and complain=0";
		$un=I('get.un',"");
		if($un){
			$wh=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$wh=$v["id"];
			if($wh) $where.=" and (uid=".$wh." or buyid=".$wh.")";
		}
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->status=array(0=>"等待中..",1=>'已锁定',2=>'已付款',3=>'已确认');
		$this->display();
	}

	public function overconfirm(){
		$id=I("get.id",0,'intval');
		$r=M("market")->where("id=".$id)->find();
		$this->v=$r;
		$this->status=array(0=>"等待中..",1=>'已锁定',2=>'已付款',3=>'已确认');
		$this->display();
	}
	public function complain(){
		$F=F("data");
		$M=M('market');
		$where="type=0 and status=2 and complain=1";
		$un=I('get.un',"");
		if($un){
			$wh=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$wh=$v["id"];
			if($wh) $where.=" and (uid=".$wh." or buyid=".$wh.")";
		}
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->status=array(0=>"等待中..",1=>'已锁定',2=>'已付款',3=>'已确认');
		$this->display();
	}

	 public function oversave(){
	 	$id=I("post.id",0,'intval');
	 	$r=M("market")->where("status<3 and id=".$id)->find();
	 	$status=1;
	 	if($r){
	 		$d1=I("post.d1",0,'intval');
	 		$d2=I("post.d2",0,'intval');
	 		$d3=I("post.d3",0,'intval');
	 		if($d1){
	 			M("market")->where("id=".$id." and status=2")->save(array("status"=>3,"complain"=>0));
				$rcoin=$r["rcoin"];
				$buyid=$r["buyid"];
				M("member")->where("id=".$buyid)->setInc("bt1",$rcoin);
				history(array('uid'=>$buyid,"bt1"=>$rcoin,"type"=>997,'info'=>"CT交易市场购买成功"));
				updatebtmarket($rcoin,1);	//更新挂单量
	 		}else{
	 			M("market")->where("id=".$id)->save(array("buyid"=>0,"lockdate"=>"","buytime"=>"","status"=>0,"complain"=>0));
				
	 		}
	 		if($d2) M("member")->where("id=".$r['uid'])->SetDec("star");
	 		if($d3) M("member")->where("id=".$r['buyid'])->SetDec("star");
	 		$data="操作成功";
	 	}else{
	 		$data="请勿非法操作";
	 	}
	 	$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	 }
}