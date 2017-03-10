<?php 
namespace Home\Model;
use Think\Model;

/**
* MessageModel
*/
class MessageModel extends Model{
	
	Protected $autoCheckFields = false;
	public function addleave(){
		$rules = array(
			array('title','require','标题不可以为空！'), //    
			array('content','require','内容不可以为空！'), //
		);
		$uid=I("session.uid",0,"intval");
		$M=M("message");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$username=I("post.username","");
			$data['type']=I("post.type",0,"intval");
			$data['title']=I("post.title","");
			$data['content']=I("post.content","");
			$data['uid']=$uid;
			$data['toid']=0;
			$data['date']=date("Y-m-d H:i:s");
			if($data['type']==1){
				$rr=M("member")->field('id')->where(array("username"=>$username))->find();
				if($rr){
					if($rr['id']==$uid) return "不可以给自己留言";
					$data['toid']=$rr['id'];
				}else{
					return "收件人不存在";
				}
			}
			if($M->data($data)->add()){
				return 1;
			}else{
				return 2;
			}
		}
	}
}

 ?>