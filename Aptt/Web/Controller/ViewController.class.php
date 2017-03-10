<?php 
namespace Web\Controller;
use Web\Controller\BaseController;
/**
* 单页控制器
*/
class ViewController extends BaseController{
	
	public function index(){
		$id=I("get.id",0,"");
		$data=array("title"=>"无","content"=>"无");
		$M=M("indexview")->where("id=".$id)->find();
		if($M) $data=$M;
		$this->data=$data;
		$this->display();
	}
}

 ?>