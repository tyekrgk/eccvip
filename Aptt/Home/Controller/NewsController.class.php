<?php 
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 新闻控制器
*/
class NewsController extends BaseController{
	
	public function index(){
		$M=M("news");
		$count= $M->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function view(){
		$id=I("get.id",0,"intval");
		$info=M("news")->where("id=".$id)->find();
		if($info){
			$this->info=$info;
			$this->display();
		}else{
			$this->show(alertstr("记录不存在",0,U("index.php/News/index")),"utf-8");
		}
	}
}
 ?>