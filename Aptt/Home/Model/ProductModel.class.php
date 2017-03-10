<?php 
namespace Home\Model;
use Think\Model;

/**
* 会员模块
*/
class ProductModel extends Model{
	Protected $autoCheckFields = false;
	/**
	 * 添加商品到购物车
	 */
	public function doaddcart(){
		$rules = array(
			array('id','require','商品编号不可以为空！'), //    
			array('nb','require','请输入正确的数量！'), //
			array('nb','number','商品数量只能为数字！'), //
		);
		$M=M("product");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I("session.uid",0,"intval");
			$id=I("post.id",0,'intval');
			$number=I("post.nb",0,'intval');
			$r=$M->field("id,proname,img,money")->where("id=".$id)->find();
			if($number<=0) return "请输入正确的数量！";
			if(!$r) return "商品不存在";
			$r['number']=$number;
			$r['total']=$number*$r['money'];
			cart_add($r);	//添加到购物车中
			return 1;
		}
	}
	
	public function dochangenumber(){
		$rules = array(
			array('id','require','商品编号不可以为空！'), //    
			array('nb','require','请输入正确的数量！'), //
			array('nb','number','商品数量只能为数字！'), //
		);
		$M=M("product");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I("session.uid",0,"intval");
			$id=I("post.id",0,'intval');
			$number=I("post.nb",0,'intval');
			cart_change($id,$number);	//添加到购物车中
			return 1;
		}
	}

	public function doaddresssave(){
		$rules = array(
			array('username','require','请输入收货人地址！'), //
			array('tel','require','请输入联系方式！'), //
			array('tel','number','联系方式只能为数字！'), //
			array('address','require','请输入收货地址！'), //
		);
		$M=M("address");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I("session.uid",0,"intval");
			$id=I("post.id",0,'intval');
			$username=I("post.username","");
			$tel=I("post.tel","");
			$address=I("post.address","");
			$status=I("post.status",0,"intval");
			$data=array("username"=>$username,"tel"=>$tel,"address"=>$address,"status"=>$status);
			if($status) $M->where("uid=".$uid)->save(array("status"=>0));
			if($id){
				$r=$M->where(array("uid"=>$uid,"id"=>$id))->find();
				if($r){
					$M->where("id=".$id)->save($data);
				}else{
					return "请勿非法操作";
				}
			}else{
				$r=M("address")->field("id")->where("uid=".$uid)->select();
				if(count($r)>=5) return "您最多可以保存5个收货地址";
				$data['uid']=$uid;
				$M->data($data)->add();
			}
			return 1;
		}
	}

	public function doaddressdel(){
		$uid=I("session.uid",0,"intval");
		$id=I("post.id",0,'intval');
		$M=M("address");
		$r=$M->where(array("uid"=>$uid,"id"=>$id))->find();
		if($r){
			if($M->where("id=".$id)->delete()){
				return 1;
			}else{
				return 2;
			}
		}else{
			return "请勿非法操作";
		}
	}

	public function doordersave(){
		$uid=I("session.uid",0,'intval');
		$aid=I("post.address",0,'intval');
		$cart=I("session.cart");
		if(!$aid) return "请选择一个地址";
		if($cart['number']==0) return "您的购物车里没有商品";
		$addr=M("address")->where(array("uid"=>$uid,"id"=>$aid))->find();
		if(!$addr) return "请选择正确的地址";
		$sn=creatsortsn("RD",$number=10,$ky="ordersn",$table="orders");
		$data=array("uid"=>$uid,"ordersn"=>$sn,"total"=>$cart['total'],"number"=>$cart['number'],"address"=>$aid,"date"=>time(),"padr"=>$addr['address'],"ptel"=>$addr['tel'],"pun"=>$addr['username']);
		if(M("orders")->data($data)->add()){
			cart_empty();
			$r=M("orders")->field("id")->where(array("ordersn"=>$sn))->find();
			foreach($cart['list'] as $v){
				$pdata=array("orderid"=>$r['id'],"pid"=>$v['id'],"proname"=>$v['proname'],"money"=>$v['money'],"total"=>$v['total'],"number"=>$v['number'],"img"=>$v['img']);
				M("orderlist")->data($pdata)->add();
			}
			return 1;
		}else{
			return 2;
		}
	}

	public function doorderpay(){
		$uid=I("session.uid",0,'intval');
		$id=I("post.id",0,'intval');
		$r=M("orders")->field("id,total,status,ordersn")->where(array('uid'=>$uid,'id'=>$id))->find();
		if(!$r) return "订单不存在";
		if($r['status']>0) return "请不要重复付款";
		$total=$r['total'];
		$u=M("member")->field("ly")->where("id=".$uid)->find();
		if($total>$u['ly']) return "CF帐户余额不足";
		if(M("member")->where("id=".$uid)->SetDec("ly",$total)){
			history(array("uid"=>$uid,"type"=>817,"ly"=>-1*$total,"info"=>"订单编号:".$r['ordersn']));
			M("orders")->where("id=".$id)->save(array("status"=>1));
		}else{
			return 2;
		}
		return 1;
	}

	public function doorderconfirm(){
		$uid=I("session.uid",0,'intval');
		$id=I("post.id",0,'intval');
		$r=M("orders")->field("id,total,status,ordersn")->where(array('uid'=>$uid,'id'=>$id))->find();
		if(!$r) return "订单不存在";
		if($r['status']!=2) return "请勿非法操作";
		if(M("orders")->where("id=".$id)->save(array("status"=>3))){
			return 1;
		}else{
			return 0;
		}
	}
}
 ?>