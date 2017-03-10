<?php 
namespace Home\Controller;
use Think\Controller;

/**
* 关闭网站
*/
class CloseController extends Controller{
	public function index(){
		$r=M("web")->field("webtext")->where("id=1")->find();
		$this->webtext=$r["webtext"];
		$this->display();
	}
}
 ?>