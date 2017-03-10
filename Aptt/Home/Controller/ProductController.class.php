<?php 	
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 在线商品
*/
class ProductController extends BaseController{
	/**
	 * 主界面
	 */
	public function index(){
		$F=F("data");
		if($F['epstatus']){
			$this->show(alertstr("AC商城正常开发中，近期上线。。。。",0,U("index.php/Index/index")),"utf-8");
		}
		$pt=M("ptype")->order("sort asc,id asc")->select();
		array_unshift($pt,array("id"=>0,"title"=>"全部商品","sort"=>0,"fid"=>0));
		$ptype=I("get.ptype",0,'intval');
		$M=M("product");
		$where=array();
		if($ptype) $where["ptype"]=$ptype;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->pt=$pt;// 赋值分页输出
		$this->ptype=$ptype;// 赋值分页输出
		$this->display();
	}

	public function view(){
		$F=F("data");
		if($F['epstatus']){
			$this->show(alertstr("AC商城正常开发中，近期上线。。。。",0,U("index.php/Index/index")),"utf-8");
		}
		$id=I("get.id",0,'intval');
		if($id<=0) $this->redirect("index.php/product/index","商品不存在!");
		$data=M("product")->where("id=".$id)->find();
		if(!$data) $this->redirect("index.php/product/index","商品不存在!");
		//session("cart",NULL);
		//$cart=I("session.cart");
		//p($cart);
		//die;
		$this->data=$data;
		$this->display();
	}

	public function cart(){
		$cart=cart_list();
		$this->cart=$cart;
		$this->list=$cart['list'];
		$this->display();
	}


	public function orders(){
		$uid=I("session.uid",0,'intval');
		$t=I("get.t",0,'intval');
		$M=M("orders");
		$where=array("uid"=>$uid);
		if($t) $where['status']=$t-1;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,5);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->t=$t;// 赋值分页输出
		$this->status=array(0=>"待付款",1=>"已付款",2=>"已发货",3=>"已完成");
		$this->display();
	}

	public function orderview(){
		$uid=I("session.uid",0,'intval');
		$id=I("get.id",0,'intval');
		$r=M("orders")->where(array("uid"=>$uid,"id"=>$id))->find();
		if(!$r){
			$this->show(alertstr("订单不存在",0,U("index.php/product/orders")),"utf-8");
			exit;
		}
		$list=M("orderlist")->where("orderid=".$r['id'])->select();
		$this->cart=$r;
		$this->list=$list;
		$this->status=array(0=>"待付款",1=>"已付款,等待发货...",2=>"已发货",3=>"已完成");
		$this->display();
	}

	public function orderpay(){
		$uid=I("session.uid",0,'intval');
		$id=I("get.id",0,'intval');
		$r=M("orders")->where(array("uid"=>$uid,"id"=>$id))->find();
		if(!$r){
			$this->show(alertstr("订单不存在",0,U("index.php/product/orders")),"utf-8");
			exit;
		}
		$list=M("orderlist")->where("orderid=".$r['id'])->select();
		$this->cart=$r;
		$this->list=$list;
		$this->status=array(0=>"待付款",1=>"已付款,等待发货...",2=>"已发货",3=>"已完成");
		$this->display();
	}

	public function orderpaysave(){
		$D=D("product");
		$data=$D->doorderpay();
		$status=0;
		if($data==1){
			$data="付款成功";
			$status=1;
		}
		if($data==2){
			$data="付款失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function orderconfirm(){
		$D=D("product");
		$data=$D->doorderconfirm();
		$status=0;
		if($data==1){
			$data="确认收货成功";
			$status=1;
		}
		if($data==2){
			$data="确认收货失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function clearorder(){
		# code...
	}

	public function addcart(){
		$D=D("product");
		$data=$D->doaddcart();
		$status=0;
		if($data==1){
			$data="商品已经加入购物车";
			$status=1;
		}
		if($data==2){
			$data="商品加入购物车失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function changenumber(){
		$D=D("Product");
		$data=$D->dochangenumber();
		$status=0;
		if($data==1){
			$data="修改成功";
			$status=1;
		}
		if($data==2){
			$data="修改失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function address(){
		$uid=I("session.uid",0,'intval');
		$id=I("get.id",0,'intval');
		$M=M("address");
		$data=array("id"=>0,"username"=>"","tel"=>"","address"=>"","status"=>0);
		if($id){
			$r=$M->where(array("id"=>$id,"uid"=>$uid))->find();
			if($r) $data=$r;
		}
		$where="uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->data=$data;// 赋值分页输出
		$this->display();
	}

	public function addresssave(){
		$D=D("Product");
		$data=$D->doaddresssave();
		$status=0;
		if($data==1){
			$data="操作成功";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function addressdel(){
		$D=D("Product");
		$data=$D->doaddressdel();
		$status=0;
		if($data==1){
			$data="操作成功";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function step1(){
		$uid=I("session.uid",0,'intval');
		$cart=cart_list();
		$r=M("address")->where("uid=".$uid)->select();
		$this->address=$r;
		$this->cart=$cart;
		$this->list=$cart['list'];
		$this->display();
	}

	public function ordersave(){
		$D=D("Product");
		$data=$D->doordersave();
		$status=0;
		if($data==1){
			$data="生成订单成功";
			$status=1;
		}
		if($data==2){
			$data="生成订单失败";
		}
		//$this->display();
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
}