<?php 
namespace Web\Controller;
use Think\Controller;

/**
* 自动加载
*/
class BaseController extends Controller{
	
	Public function _initialize(){
		$mid=I("get.mid",0,"intval");
		$key=$mid;
		$r=M("menu")->field("fid,title")->where("id=".$mid)->find();
		if($r["fid"]) $key=$r["fid"];
		$ltitle=$r["title"];
		$M=M("menu")->order("sort asc,id asc")->select();
		$menu=getmenu($M,$key);
		$web=M("web")->where("id=1")->find();
		$index=M("indexconfig")->where("id=1")->find();
		$this->index=$index;
		$this->web=$web;
		$this->menu=$menu;
		$this->ltitle=$ltitle;
	}
}
 ?>