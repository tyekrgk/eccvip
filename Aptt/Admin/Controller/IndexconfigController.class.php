<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
class IndexconfigController extends BaseController{
	
	public function index(){
		$M=M('indexconfig');
		$web=$M->where(array('id'=>1))->find();
		$this->web=$web;
		$this->display();
	}

	public function save(){
		$data=I("post.");
		if($_FILES['img1']['tmp_name']||$_FILES['img2']['tmp_name']){
			$files_array=array();
			if($_FILES['img1']['tmp_name'])$files_array[]=$_FILES['img1'];
			if($_FILES['img2']['tmp_name'])$files_array[]=$_FILES['img2'];
			$up=1;
			$upload = new \Think\Upload();// 实例化上传类    
			$upload->maxSize   =     3145728 ;// 设置附件上传大小    
			$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型    
			$upload->savePath  =     '/Public/uploads/'; // 设置附件上传目录         
			//$info   =   $upload->uploadOne($_FILES['logo']);    // 上传单个文件         
			$info   =   $upload->upload($files_array);    // 上传多个文件
			if(!$info) {      
				$error=$upload->getError()."---".$upload->savePath;    // 上传错误提示错误信息  
			}else{
				if($_FILES['img1']['tmp_name'] && $_FILES['img2']['tmp_name']){
					$data['img1']=$info[0]['savepath'].$info[0]['savename'];
					$data['img2']=$info[1]['savepath'].$info[1]['savename'];
				}else{
					$key='img1';
					if($_FILES['img2']['tmp_name']) $key="img2";
					$img=$info[0]['savepath'].$info[0]['savename'];   // 上传成功 获取上传文件信息 
					if($pa=M('indexconfig')->where('id=1')->getField($key)){
						unlink(__ROOT__."/Uploads".$pa);
					}
					$data[$key]=$img;
				}	
			}
		}

		//$data['u1']=$_POST['u1'];
		//$data['u2']=$_POST['u2'];
		//$data['u3']=$_POST['u3'];
		//$data['u4']=$_POST['u4'];
		$save=M('indexconfig')->data($data)->where(array('id'=>1))->save();
		$edata='操作成功';
		$this->edata=$edata;
		$this->type=1;
		$this->display('Alert:index');
	}

}
?>