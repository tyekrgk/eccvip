<?php  
namespace Admin\Controller;
use Admin\Controller\BaseController;
/**
* 
*/
class OperatController extends BaseController{
	
	public function index(){
		$User = M('operat'); // 实例化User对象
		$count= $User->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $User->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display(); // 输出模板
	}
}
?>