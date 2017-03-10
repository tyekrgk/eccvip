<?php 
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 留言板主控制器
*/
class MessageController extends BaseController{
	
	public function index(){
		/*
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}*/
		$t=I("get.t",0,"intval");
		$uid=I("session.uid",0,"intval");
		$where=array("toid=".$uid." and type>0");//收件箱
		$M=M('message');
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->t=$t;// 赋值分页输出
		$this->display();
	}

	public function fa(){
		/*
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}*/
		$t=I("get.t",0,"intval");
		$uid=I("session.uid",0,"intval");
		$where=array("uid=".$uid." and type<2");//发件箱
		$M=M('message');
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->t=$t;// 赋值分页输出
		$this->display();
	}

	public function leave(){
		/*
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}*/
		$this->display();
	}

	public function leavesave(){
		$D=D("Message");
		$data=$D->addleave();
		$status=0;
		if($data==1){
			$data="留言成功!";
			$status=1;
		}
		if($data==2){
			$data="留言失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function view(){
		$uid=I("session.uid",0,"intval");
		$id=I("get.id",0,"intval");
		$M=M("message");
		$message=$M->where("id=".$id." and (uid=".$uid." or toid=".$uid." or type=3)")->find();
		$data=array('view'=>1);
		if($message['status']==0 && $message['type']==0) $data=array();
		if(count($data)) M('message')->where('id='.$id)->save($data);
		if(!$message){
			$this->show(alertstr("记录不存在",$status,U("index.php/Message/index")),"utf-8");
			exit;
		}
		$this->message=$message;
		$this->display();
	}
}
 ?>