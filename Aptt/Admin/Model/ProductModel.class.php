<?php 
namespace Admin\Model;
use Think\Model;

/**
* 
*/
class ProductModel extends Model{
	Protected $autoCheckFields = false;

	public function dosave(){
		$data["proname"]=I("post.proname","");
		$data["money"]=I("post.money",0);
		$data["ptype"]=I("post.ptype",0);
		$data["discription"]=I("post.discription","");
		$data["content"]=$_POST['cont'];
		$data["date"]=date("Y-m-d H:i:s");
		$id=I("get.id",0,"intval");
		if($data["money"]<0) return "请输入正确的价格";
		if(!$data["proname"]) return "请输入商品名称";
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
				$error=$upload->getError();    // 上传错误提示错误信息  
			}else{
				$logo=$info['savepath'].$info['savename'];   // 上传成功 获取上传文件信息 
				if($pa=M('product')->where('id='.$id)->getField('img')){
					unlink(__ROOT__."/Uploads".$pa);
				}
			}
		}
		if($up && !$error){
			$data['img']=$logo;
		}
		if(!$error){
			if($id){
				$save=M('product')->data($data)->where(array('id'=>$id))->save();
			}else{
				$save=M('product')->data($data)->add();
			}
			return 1;
		}
	}

}