<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

class CollController extends BaseController{

	public function index(){
		$data=array();
		$data['id']=0;
		$data['bank']="";
		$data['status']=0;
		$data['bankuser']="";
		$data['bankcard']="";
		$data['bankaddress']="";
		$id=I('GET.id',0,'intval');
		$M=M("coll");
		if($id){
			$d=$M->where('id='.$id)->find();
			if($d) $data=$d;
		}
		$datalist=$M->order("id asc")->select();
		$this->data=$data;
		$this->datalist=$datalist;
		$this->display();
	}

	public function save(){
		$data=I("post.");
		if(!$data['bank']){
			$edata="银行名称不可以为空";
			$this->edata=$edata;
			$this->type=0;
			$this->display('Alert:index');
			exit;
		}
		$id=I("id",0,"intval");
		unset($data["id"]);
		$M=M("coll");
		if($id){
			if($M->where('id='.$id)->save($data)){
				$type=1;
				$edata="修改成功";
			}else{
				$type=0;
				$edata="修改失败";
			}
		}else{
			if($M->add($data)){
				$type=1;
				$edata="添加成功";
			}else{
				$type=0;
				$edata="添加失败";
			}
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}

	function delete(){
		$id=I("id",0,"intval");
		$M=M("coll");
		if($M->where('id='.$id)->find()){
				if($M->where('id='.$id)->delete()){
					$type=1;
					$edata="删除成功";
				}else{
					$type=0;
					$edata="删除失败";
				}
		}else{
			$type=0;
			$edata="删除失败";
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}

}
 ?>