<?php 
namespace Web\Controller;
use Web\Controller\BaseController;
/**
* 单页控制器
*/
class NewsController extends BaseController{
	
	public function index(){
		$mid=I("get.mid",0,"intval");
		$tid=I("get.tid",0,"intval");
		$M=M("indexnews");
		$where="type=".$tid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->mid=$mid;
		$this->tid=$tid;
		$this->display();
	}
	public function view(){
		$id=I("get.id",0,"intval");
		$mid=I("get.mid",0,"intval");
		$did=I("get.tid",0,"intval");
		$info=M("indexnews")->where("id=".$id)->find();
		if($info){
			$this->ltitle=$info["title"];
			$this->content=$info["content"];
			$this->display();
		}else{
			$this->show(alertstr("记录不存在",0,U("index.php/News/index",array("mid"=>$mid,"tid"=>$did))),"utf-8");
		}
	}
}

 ?>