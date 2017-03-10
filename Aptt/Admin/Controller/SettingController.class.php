<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
class SettingController extends BaseController{
	
	public function index(){
		$M=M('web');
		$web=$M->where(array('id'=>1))->find();
		$this->web=$web;
		$this->display();
	}

	public function save(){
		$data=I("post.");
		$up=0;
		$error=0; 
		if($_FILES['logo']['tmp_name']){
			$up=1;
			$upload = new \Think\Upload();// 实例化上传类    
			$upload->maxSize   =     3145728 ;// 设置附件上传大小    
			$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型    
			$upload->savePath  =     '/Public/uploads/'; // 设置附件上传目录         
			$info   =   $upload->uploadOne($_FILES['logo']);    // 上传单个文件
			if(!$info) {      
				$error=$upload->getError()."---".$upload->savePath;    // 上传错误提示错误信息  
			}else{
				$logo=$info['savepath'].$info['savename'];   // 上传成功 获取上传文件信息 
				if($pa=M('web')->where('id=1')->getField('logo')){
					unlink(__ROOT__."/Uploads".$pa);
				}
			}
		}
		if($up && !$error){
			$data['logo']=$logo;
		}
		if(!$error){
			$save=M('web')->data($data)->where(array('id'=>1))->save();
		}
		$edata='操作成功';
		if($error){
			$edata=$error;
		}else{
			if(!$save){
				$edata='操作失败';
			}else{
				addhistory('admin','修改','修改内容:[网站设置]->[修改设置]');
			}
		}
		$this->edata=$edata;
		$this->type=1;
		$this->display('Alert:index');
	}

	public function message(){
		$M=M('web');
		$web=$M->where(array('id'=>1))->find();
		$this->web=$web;
		$this->display();
	}

	public function messagesave(){
		$data=I("post.");
		M("web")->where("id=1")->save($data);
		$edata="信息修改成功";
		$this->edata=$edata;
		$this->type=1;
		$this->display('Alert:index');
	}
}
?>