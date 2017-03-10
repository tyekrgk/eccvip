<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

class CloseController extends BaseController{
	
	public function index(){
		$M=M('web');
		$webtext=$M->getfield('webtext');
		$this->webtext=$webtext;
		$this->display();
	}
	public function save(){
		$webtext=I('post.webtext');
		$data['webtext']=$_POST['webtext'];
		if(M('web')->where('id=1')->save($data)){
			$type=1;
			$edata='操作成功';
			addhistory('admin','修改','修改内容:[网站设置]->[网站关闭内容]');
		}else{
			$type=0;
			$edata='操作失败';
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}
}

 ?>