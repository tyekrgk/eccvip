<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
class MenuController extends BaseController {
    public function index(){
    	$M=M("menu")->order("sort asc,id asc")->select();
    	$menu=category1($M);
    	$this->data=$menu;
        $this->display();
    }

    public function edit(){
    	$id=I("get.id",0,"intval");
    	$data=array("id"=>0,"fid"=>0,"status"=>0,"sort"=>99,"title"=>"","url"=>"#","did"=>0,"type"=>0);
    	if($id){
    		$r=M("menu")->where("id=".$id)->find();
    		if($r){
    			$data=$r;
    		}
    	}
    	$this->data=$data;
    	$this->display();
    }

    function save(){
    	$id=I("post.id",0,"intval");
    	$data["title"]=I("post.title","");
    	$data["fid"]=I("post.fid",0,"intval");
    	$data["sort"]=I("post.sort",0,"intval");
    	$data["type"]=I("post.type",0,"intval");
    	$data["did"]=I("post.did",0,"intval");
    	$data["url"]=I("post.url","#");
    	if(!$data["title"]) $this->show(alertstr("标题不可以为空!",0,U(C("FILE_IN")."/Menu/edit",array("id"=>$id))),"utf-8");
    	if($id){
			if(M("menu")->where("id=".$id)->save($data)){
				$edata="修改成功";
				$status=1;
			}else{
				$edata="修改失败";
			}
		}else{
			if(M("menu")->data($data)->add()){
				$edata="添加成功";
				$status=1;
			}else{
				$edata="添加失败";
			}
		}
		$this->show(alertstr($edata,0,U(C("FILE_IN")."/Menu/index")),"utf-8");
    }

    public function delete(){
    	$id=I("get.id",0,"intval");
    	$M=M("menu")->where("id=".$id)->find();
    	$status=0;
    	if($M){
    		if($M["fid"])M("menu")->where("fid=".$M["fid"])->delete();
    		M("menu")->where("id=".$id)->delete();
    		$edata="删除成功";
    		$status=1;
    	}else{
    		$edata="操作失败";
    	}
    	$this->type=$status;
		$this->edata=$edata;
		$this->display('Alert:index');
    }
}