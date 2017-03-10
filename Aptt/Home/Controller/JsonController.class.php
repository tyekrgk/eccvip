<?php 
namespace Home\Controller;
use Think\Controller;

/**
* JSON 返回
*/
class JsonController extends Controller{
	
	public function index(){
		# code...
	}

	public function newname(){
		$newname=newname();
		$this->show($newname,'utf-8');
        $this->display();
	}
	public function checkname(){
		$u=I("post.u","");
		if(M("member")->field('id')->where(array("username"=>$u))->find()){
			$data="pass";
		}else{
			$data="nopass";
		}
		$this->show($data,'utf-8');
	}

	public function checkregname(){
		$u=I("post.u","");
		if(preg_match("/[^\(a-zA-Z)\d]/",$u)>0){
			$data="no1";
		}else{
			if(strlen($u)>10 || strlen($u)<6){
				$data="no";
			}else{
				if(M("member")->field('id')->where(array("username"=>$u))->find()){
					$data="pass";
				}else{
					$data="nopass";
				}
			}
		}
		$this->show($data,'utf-8');
	}
	function cheuser(){
		$uid=I('session.uid',0,'intval');
		$username=I('post.username',"");
		$status=0;
		if($username){
			$r=M('member')->field('id,nick')->where(array('username'=>$username))->find();
			if($r){
				if($r['id']==$uid){
					$data="您不可以给自己转帐";
				}else{
					$status=1;
					$data=$r['nick'];
				}
				
			}else{
				$data="会员不存在";
			}
		}else{
			$data="请输入能量编号";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
}
?>