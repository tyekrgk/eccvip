<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
* 消息管理
*/
class MessageController extends BaseController{
	
	public function index(){
		$M=M(Message);
		$where=array("type"=>0);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function view(){
		$id=I("get.id",0,"intval");
		$M=M("message");
		$message=$M->where(array("id"=>$id))->find();
		$this->message=$message;
		$this->display();
	}

	public function viewsave(){
		$hcontent=I("post.hcontent","");
		$id=I("get.id",0,"intval");
		$data["hcontent"]=$hcontent;
		$data["status"]=1;
		$data['hdate']=date("Y-m-d H:i:s");
		if(M("message")->where("id=".$id)->save($data)){
			$edata='操作成功';
			$type=1;
		}else{
			$type=0;
			$edata="修改失败";
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}

	public function leave(){
		$this->display();
	}

	public function leavesave(){
		$uid=I("session.uid",0,"intval");
		$M=M("message");
		$username=I("post.date","");
		$data['type']=I("post.type",0,"intval");
		$data['title']=I("post.title","");
		$data['content']=I("post.content","");
		$data['toid']=0;
		$data['date']=date("Y-m-d H:i:s");
		$error=0;
		$type=0;
		if($data['type']==1){
			$rr=M("member")->field('id')->where(array("username"=>$username))->find();
			if($rr){
				//if($rr['id']==$uid) return "不可以给自己留言";
				$data['toid']=$rr['id'];
			}else{
				$edata="收件人不存在";
				$error=1;
			}
			$data['type']=1;
		}
		if(!$error){
			if($M->data($data)->add()){
				$edata="留言成功";
				$type=1;
			}else{
				$edata="留言失败";
			}
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}

	public function falist(){
		$M=M(Message);
		$where=array("type=1 and uid=0");
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function faview(){
		$id=I("get.id",0,"intval");
		$M=M("message");
		$message=$M->where(array("id"=>$id))->find();
		$this->message=$message;
		$this->display();
	}
	public function delete(){
		$id=I("get.id",0,"intval");
		$M=M("message");
		$type=0;
		if($M->where("id=".$id)->delete()){
			$edata="删除信息成功!";
			$type=1;
		}else{
			$edata="删除信息失败!";
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
}

 ?>