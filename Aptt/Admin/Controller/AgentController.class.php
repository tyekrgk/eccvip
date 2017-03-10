<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * Agent
 */
 class AgentController extends BaseController{
 	
 	public function index(){
 		$t=I('get.t',0,"intval");
		$p=I('get.p',1,"intval");
		$un=I('get.un');
 		$M=M('history');
 		$where=array('type'=>3);
 		if($un){
			$where['username']=array('like','%'.$un.'%');
		}
		if($t>0){
			$where['status']=$t-1;
		}
 		$count= $M->where($where)->count();// 查询满足要求的总记录数
		//$parameter="id=1&p=".$p;
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		//$show=str_replace("/p","/un/".$un."/t/".$t."/p",$show);
		$list = $M->where($where)->field("id,status,isagent,renum,tel,qq")->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		//$list=Agent($list);
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->t=$t;// 赋值分页输出
		$this->p=$p;
		$this->un=$un;
		$this->display(); // 输出模板
 	}
 } 

 ?>