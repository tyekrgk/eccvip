<?php 	
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 交易市场
*/
class BtmarketController extends BaseController{
	/**
	 * 交易主界面
	 */
	public function index(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$M=M('market');
		$where=array("status"=>0);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function buysave(){
		$D=D("Btmarket");
		$data=$D->dobuysave();
		$status=0;
		if($data==1){
			$data="订单提交成功,请您尽快付款!";
			$status=1;
		}
		if($data==2){
			$data="订单提交失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	/**
	 * 挂单保存
	 */
	public function sellsave(){
		$D=D("Btmarket");
		$data=$D->dosellsave();
		$status=0;
		if($data==1){
			$data="挂单成功!";
			$status=1;
		}
		if($data==2){
			$data="挂单失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function lock(){
		$D=D("btmarket");
		$data=$D->lockdata();
		$status=0;
		if($data==1){
			$data="记录锁定成功,请您尽快付款!";
			$status=1;
		}
		if($data==2){
			$data="记录锁定失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function buylist(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$M=M('market');
		$where=array("status>0 and buyid=".$uid);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('lockdate desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->status=array(1=>'已锁定',2=>'已付款',3=>'已确认');
		$this->display();
	}
	/**
	 * 确认支付
	 */
	public function btpay(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=0;
		if(M("market")->where("id=".$id." and status=1 and buyid=".$uid)->select()){
			if(M("market")->where("id=".$id." and status=1 and buyid=".$uid)->save(array("status"=>2,"buytime"=>time()))){
				$data="确认支付成功,请等待卖家确认收款";
				$status=1;
			}else{
				$data="确认支付失败";
			}
		}else{
			$data="记录不存在或已超时";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	/**
	 * 取消记录
	 */
	public function btcancel(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=0;	
		$r=M("market")->field('id,type')->where("id=".$id." and status=1 and buyid=".$uid)->find();
		if($r){
			if($r['type']){
				M("market")->where("id=".$id." and status=1 and buyid=".$uid)->delete();
				$data="取消成功";
				$status=1;
			}else{
				if(M("market")->where("id=".$id." and status=1 and buyid=".$uid)->save(array("status"=>0,"buyid"=>0,"lockdate"=>null,"buytime"=>null))){
					$data="取消成功";
					$status=1;
				}else{
					$data="取消失败";
				}
			}
		}else{
			$data="记录不存在或已超时";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function buyview(){
		$uid=I("session.uid",0,'intval');
		$id=I("get.id",0,"intval");
		$data=M('market')->where("id=".$id." and buyid=".$uid)->find();
		if(!$data){
			$this->show(alertstr("记录不存在",2),"utf-8");
			exit;
		}
		$coll=M("coll")->where("status=0")->order("id asc")->select();
		$i=0;
		$collstr="";
		foreach($coll as $v){
			$i++;
			$collstr.="<span style='font-weight:bold'>付款方式".$i."</span><br>银行:".$v["bank"]." 开户行地址:".$v["bankaddress"]."<br>开户名:".$v["bankuser"]." 帐号:".$v["bankcard"]."<br>";
		}
		$this->data=$data;
		$this->collstr=$collstr;
		$this->status=array(1=>'已锁定',2=>'已付款',3=>'已确认');
		$this->display();
	}
	/**
	 * 挂单记录
	 */
	public function gualist(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$M=M('market');
		$where=array("(status<3 or status=4) and uid=".$uid);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->status=array(0=>'等待中',1=>'已锁定',2=>'已付款',3=>'已确认',4=>'已取消');
		$this->display();
	}

	public function guaview(){
		$uid=I("session.uid",0,'intval');
		$id=I("get.id",0,"intval");
		$data=M('market')->where("id=".$id." and uid=".$uid)->find();
		if(!$data){
			$this->show(alertstr("记录不存在",2),"utf-8");
			exit;
		}
		$this->data=$data;
		$this->status=array(0=>'等待中',1=>'已锁定',2=>'已付款',3=>'已确认',4=>'已取消');
		$this->display();
	}
	public function guaconfirm(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=1;	//1 提交到IFRAME,父页面刷新,2当前页面刷新
		$F=F("data");
		if(M("market")->where("id=".$id." and status=2 and uid=".$uid)->select()){
			if(M("market")->where("id=".$id." and status=2 and uid=".$uid)->save(array("status"=>3))){
				$v=M("market")->field("rcoin,buyid")->where("id=".$id)->find();
				$rcoin=$v["rcoin"];
				$buyid=$v["buyid"];
				M("member")->where("id=".$buyid)->setInc("bt1",$rcoin*(1+$F['btin']/100));
				history(array('uid'=>$uid,"bt1"=>$rcoin*(1+$F['btin']/100),"type"=>997,'info'=>"CT交易市场购买成功,奖励5%(".($rcoin*(1+$F['btin']/100)).")"));
				updatebtmarket($rcoin,1);	//更新挂单量
				$data="确认收款成功,交易完成";
			}else{
				$data="确认收款失败";
			}
		}else{
			$data="记录不存在或已超时";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	

	public function guacancel(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=1;	//1 提交到IFRAME,父页面刷新,2当前页面刷新
		$F=F("data");
		if(M("market")->where("id=".$id." and status=0 and uid=".$uid)->select()){
			if(M("market")->where("id=".$id." and status=0 and uid=".$uid)->save(array("status"=>4))){
				$v=M("market")->field("coin")->where("id=".$id)->find();
				$coin=$v["coin"];
				M("member")->where("id=".$uid)->setInc("bt",$coin*(1+$F['btout']/100));
				history(array('uid'=>$uid,"bt"=>$coin,"shui"=>$coin*$F['btout']/100,"type"=>998,'info'=>"CT交易市场挂单取消,返回手续费5%(".($coinset*$F['btout']/100).")"));
				$data="取消挂单成功";
			}else{
				$data="取消挂单失败";
			}
		}else{
			$data="记录不存在或已超时";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	/**
	 * 卖家撤销,买家强制降星
	 */
	public function btunlock(){
		$id=I("post.id",0,'intval');
		$uid=I("session.uid",0,"intval");
		$F=F("data");
		$r=M("market")->where("status=1 and id=".$id." and lockdate<'".time()."' and uid=".$uid)->find();
		$status=0;
		if($r){
			M("market")->where("id=".$id)->save(array("buyid"=>0,"lockdate"=>"","buytime"=>"","status"=>0));
			M("member")->where("id=".$r['buyid'])->SetDec("star");
			$data="撤销锁定成功,您的订单已重新回到交易市场";
			$status=1;
		}else{
			$data="请勿非法操作";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function complain(){
		$id=I("post.id",0,'intval');
		$uid=I("session.uid",0,"intval");
		$F=F("data");
		$r=M("market")->where("status=2 and complain=0 and id=".$id."  and uid=".$uid)->find();
		$status=0;
		if($r){
			M("market")->where("id=".$id)->save(array("complain"=>1));
			$data="订单投诉成功,请等待管理员介入";
			$status=1;
		}else{
			$data="请勿非法操作";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function deallist(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$M=M('market');
		$where=array("status=3 and uid=".$uid);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->status=array(0=>'等待中',1=>'已锁定',2=>'已付款',3=>'已确认',4=>'已取消');
		$this->display();
	}
}

 ?>