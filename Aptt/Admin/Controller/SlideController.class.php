<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
class SlideController extends BaseController{
	
	public function index(){
		$data=array();
		$data['id']=0;
		$data['title']="";
		$data['img']=1;
		$id=I('GET.id',0,'intval');
		$M=M("slide");
		if($id){
			$d=$M->where('id='.$id)->find();
			if($d) $data=$d;
		}
		$datalist=$M->order("id asc")->select();
		$this->data=$data;
		$this->list=$datalist;
		$this->display();
	}

	public function save(){
		$data["title"]=I("post.title","");
		$id=I("post.id",0);
		$up=0;
		$error=0; 
		$status=1;
		if($_FILES['img']['tmp_name']){
			$up=1;
			$upload = new \Think\Upload();// 实例化上传类    
			$upload->maxSize   =     3145728 ;// 设置附件上传大小    
			$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型    
			$upload->savePath  =     '/Public/uploads/'; // 设置附件上传目录         
			$info   =   $upload->uploadOne($_FILES['img']);    // 上传单个文件
			if(!$info) {      
				$error=$upload->getError()."---".$upload->savePath;    // 上传错误提示错误信息  
			}else{
				$logo=$info['savepath'].$info['savename'];   // 上传成功 获取上传文件信息 
				if($pa=M('slide')->where('id=1')->getField('img')){
					unlink(__ROOT__."/Uploads".$pa);
				}
			}
		}
		if($up && !$error){
			$data['img']=$logo;
		}
		if(!$error){
			if($id){
				$save=M('slide')->data($data)->where(array('id'=>$id))->save();
			}else{
				$save=M('slide')->data($data)->add();
			}
		}
		$edata='操作成功';
		if($error){
			$edata=$error;
			$status=0;
		}else{
			if(!$save){
				$edata='操作失败';
				$status=0;
			}else{
				//addhistory('admin','修改','修改内容:[网站设置]->[修改设置]');
			}
		}
		$this->edata=$edata;
		$this->type=$status;
		$this->url=U(C("FILE_IN")."/Slide/index");
		$this->display('Alert:index');
	}

	public function delete(){
		$id=I("get.id",0,"intval");
		$M=M("slide")->where("id=".$id)->find();
		$status=0;
		if($M){
			unlink(__ROOT__."/Uploads".$M["img"]);
			M("slide")->where("id=".$id)->delete();
			$edata="操作成功";
			$status=1;
		}else{
			$edata="删除失败";
		}
		$this->edata=$edata;
		$this->type=$status;
		$this->display('Alert:index');
	}
}
?>