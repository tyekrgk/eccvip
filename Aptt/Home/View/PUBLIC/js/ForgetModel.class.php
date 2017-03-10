<?php 
namespace Home\Model;
use Think\Model;

/**
* 会员模块
*/
class ForgetModel extends Model{
	Protected $autoCheckFields = false;
	/**
	 * 找回密码
	 */
	public function answer(){
		$rules=array(
			array("a1","require","请输入答案1"),
			array("a2","require","请输入答案2"),
			array("a3","require","请输入答案3"),
			array("username","require","请勿非法操作"),
			);
		$username=I("post.username","");
		$M=M("member");
		$a1=I("post.a1","");
		$a2=I("post.a2","");
		$a3=I("post.a3","");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$v=$M->field("q,a1,a2,a3")->where(array("username"=>$username))->find();
			if(!$v['q']) return "请勿非法操作";
			if($a1!=$v['a1']) return "答案1有误,请查证后再填写";
			if($a2!=$v['a2']) return "答案2有误,请查证后再填写";
			if($a3!=$v['a3']) return "答案3有误,请查证后再填写";
			return 1;
		}
	}

}