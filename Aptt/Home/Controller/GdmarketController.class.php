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
		$M=M('gtmarket');
		$where=array("status"=>0);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	/**
	 * 交易挂单
	 */
	public function gua(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$M=M('member');
		$v=$M->field('coin,realname')->where('id='.$uid)->find();
		$coin=$v['coin'];
		$realname=$v['realname'];
		$F=F("data");
		$r=M("bank")->where('uid='.$uid)->order('id desc')->select();
		$se="<select name='bank'>
		<option value=''>--请选择--</option>
		";
		foreach($r as $k){
			$se.="<option value='".$k["id"]."'>提现银行:".$k["bank"]." 开户姓名:".$realname." 银行帐号:".$k["bankcard"]."</option>";
		}
		$se.="</select>";
		$M=M('market');
		$where=array("uid"=>$uid);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->coin=$coin;
		$this->F=$F;
		$this->banklist=$se;
		$this->realcoin=$F['epbase']*(100-$F['epshui'])/100;
		$this->display();
	}
	/**
	 * 挂单保存
	 */
	public function guasave(){
		$D=D("Market");
		$data=$D->guasave();
		$status=0;
		if($data==1){
			$data="挂单成功!";
			$status=1;
		}
		if($data==2){
			$data="挂单失败";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}

	public function lock(){
		$F=F("data");
		$D=D("Market");
		$data=$D->lockdata();
		$status=0;
		if($data==1){
			$data="记录锁定成功,请在".$F['eplock']."秒内进行支付确认,超时自动回到交易市场!";
			$status=1;
		}
		if($data==2){
			$data="记录锁定失败";
		}
		$this->show(alertstr($data,$status,U("index.php/Market/buylist")),"utf-8");
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
		$this->display();
	}
	/**
	 * 确认支付
	 */
	public function lockpay(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=1;
		if(M("market")->where("id=".$id." and status=1 and buyid=".$uid." and lockdate>'".date("Y-m-d H:i:s")."'")->select()){
			if(M("market")->where("id=".$id." and status=1 and buyid=".$uid." and lockdate>'".date("Y-m-d H:i:s")."'")->save(array("status"=>2))){
				$data="确认支付成功,请等待卖家确认收款";
			}else{
				$data="确认支付失败";
			}
		}else{
			$data="记录不存在或已超时";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 取消记录
	 */
	public function lockcancel(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=1;
		if(M("market")->where("id=".$id." and status=1 and buyid=".$uid." and lockdate>'".date("Y-m-d H:i:s")."'")->select()){
			if(M("market")->where("id=".$id." and status=1 and buyid=".$uid." and lockdate>'".date("Y-m-d H:i:s")."'")->save(array("status"=>0,"buyid"=>0,"lockdate"=>null,"buytime"=>null))){
				$data="取消成功";
			}else{
				$data="取消失败";
			}
		}else{
			$data="记录不存在或已超时";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}

	public function collection(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=1;	//1 提交到IFRAME,父页面刷新,2当前页面刷新
		if(M("market")->where("id=".$id." and status=2 and uid=".$uid)->select()){
			if(M("market")->where("id=".$id." and status=2 and uid=".$uid)->save(array("status"=>3))){
				$v=M("market")->field("rcoin,buyid")->where("id=".$id)->find();
				$rcoin=$v["rcoin"];
				$buyid=$v["buyid"];
				M("member")->where("id=".$buyid)->setInc("score",$rcoin);
				$data="确认收款成功,交易完成";
			}else{
				$data="确认收款失败";
			}

		}else{
			$data="记录不存在或已超时";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}

	public function cancel(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$status=1;	//1 提交到IFRAME,父页面刷新,2当前页面刷新
		if(M("market")->where("id=".$id." and status=0 and uid=".$uid)->select()){
			if(M("market")->where("id=".$id." and status=0 and uid=".$uid)->save(array("status"=>4))){
				$v=M("market")->field("coin")->where("id=".$id)->find();
				$coin=$v["coin"];
				M("member")->where("id=".$uid)->setInc("coin",$coin);
				$data="取消挂单成功";
			}else{
				$data="取消挂单失败";
			}
		}else{
			$data="记录不存在或已超时";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
}

 ?>