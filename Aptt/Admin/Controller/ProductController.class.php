<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;
/**
* 
*/
class ProductController extends BaseController{
	
	public function index(){
		$M=M("product");
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		//$parameter="id=1&p=".$p;
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$pt=M("ptype")->select();
		$pdata=array(0=>"无");
		foreach($pt as $v){
			$pdata[$v['id']]=$v["title"];
		}
		$datalist=$M->order("id asc")->select();
		$this->pdata=$pdata;
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();

	}

	public function product(){
		$id=I("get.id",0,'intval');
		$pt=M("ptype")->select();
		$data=array("id"=>0,"proname"=>"","img"=>"","date"=>"","discription"=>"","content"=>"","money"=>"");
		if($id) $data=M("product")->field("id,proname,img,date,discription,content,money,ptype")->where("id=".$id)->find();
		array_unshift($pt,array("id"=>0,"title"=>"无","sort"=>0,"fid"=>0));
		$this->data=$data;
		$this->pt=$pt;
		$this->display();
	}

	public function save(){
		$id=I("get.id",0,"intval");
		$D=D("product");
		$data=$D->dosave();
		$status=0;
		if($data==1){
			$data=$id?"修改成功!":"添加成功";
			$status=1;
		}
		if($data==2){
			$data=$id?"修改失败!":"添加失败";
		}
		$this->edata=$data;
		$this->type=$status;
		$this->url=U(C("FILE_IN")."/product/index");
		$this->display('Alert:index');
	}

	public function del(){
		$id=I("get.id",0,"intval");
		$r=M("product")->where("id=".$id)->find();
		$status=0;
		if($r){
			if(M("product")->where("id=".$id)->delete()){
				unlink(__ROOT__."/Uploads".$r["img"]);
				$data="商品删除成功";
				$status=1;
			}else{
				$data="商品删除失败!";
			}
		}else{
			$data="商品不存在!";
		}
		$this->edata=$data;
		$this->type=$status;
		//$this->url=U(C("FILE_IN")."/product/index");
		$this->display('Alert:index');
	}

	public function ptype(){
		$data=array();
		$data['id']=0;
		$data['title']="";
		$data['sort']=999;
		$id=I('GET.id',0,'intval');
		$M=M("ptype");
		if($id){
			$d=$M->where('id='.$id)->order("sort asc,id asc")->find();
			if($d) $data=$d;
		}
		$datalist=$M->select();
		$this->data=$data;
		$this->list=$datalist;
		$this->display();
	}

	public function ptypesave(){
		$id=I("post.id",0,'intval');
		$title=I("post.title","");
		$sort=I("post.sort",999,'intval');
		$status=0;
		if($title){
			$da=array("title"=>$title,"sort"=>$sort);
			if($id){
				M("ptype")->where("id=".$id)->save($da);
			}else{
				M("ptype")->data($da)->add();
			}
			$data="操作成功";
			$status=1;
		}else{
			$data="请输入商品类别";
		}
		$this->edata=$data;
		$this->type=$status;
		//$this->url=U(C("FILE_IN")."/product/index");
		$this->display('Alert:index');
	}
	public function ptypedel(){
		$id=I("get.id",0,"intval");
		$status=0;
		if(M("product")->where("ptype=".$id)->select()){
			$data="此类别存在商品,不可删除";
		}else{
			M("ptype")->where("id=".$id)->delete();
			$data="操作成功";
			$status=1;
		}
		$this->edata=$data;
		$this->type=$status;
		//$this->url=U(C("FILE_IN")."/product/index");
		$this->display('Alert:index');
	}

	public function orderlist(){
		$t=I("get.t",0,'intval');
		$M=M("orders");
		$where=array();
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
		$id=I("get.id",0,'intval');
		$r=M("orders")->where(array("id"=>$id))->find();
		if(!$r){
			$this->show(alertstr("订单不存在",0,U("admin.php/product/orderlist")),"utf-8");
			exit;
		}
		$list=M("orderlist")->where("orderid=".$r['id'])->select();
		$this->cart=$r;
		$this->list=$list;
		$this->status=array(0=>"待付款",1=>"已付款,等待发货...",2=>"已发货",3=>"已完成");
		$this->display();
	}

	public function fillin(){
		$id=I("post.id",0,'intval');
		$content=I("post.content","");
		$status=0;
		if(!$content){
			$data="请填写发货详情";
		}else{
			$r=M("orders")->where("id=".$id)->find();
			if(!$r){
				$data="订单不存在";
			}else{
				M("orders")->where("id=".$id)->save(array("content"=>$content));
				$data="操作成功";
				$staatus=1;
			}
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function fahuo(){
		$id=I("post.id",0,'intval');
		$status=0;
		$r=M("orders")->where("id=".$id)->find();
		if(!$r){
			$data="订单不存在";
		}else{
			if($r['status']==1){
				if($r['content']){
					M("orders")->where("id=".$id)->save(array("status"=>2));
					$data="操作成功";
					$staatus=1;
				}else{
					$data="填写发货详情后才可以确认发货";
				}
				
			}else{
				$data="请勿非法操作";
			}
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	public function orderdone(){
		$id=I("post.id",0,'intval');
		$status=0;
		$r=M("orders")->where("id=".$id)->find();
		if(!$r){
			$data="订单不存在";
		}else{
			if($r['status']==2){
				M("orders")->where("id=".$id)->save(array("status"=>3));
				$data="操作成功";
				$staatus=1;
			}else{
				$data="请勿非法操作";
			}
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
}
 ?>