<?php 
namespace Web\Model;
use Think\Model;

/**
* 推广模块
*/
class PromoteModel extends Model{
	Protected $autoCheckFields = false;
	/**
	 * 推广注册会员
	 */
	public function prosave(){
			$rules = array(
			array('nick','require','昵称不可以为空！'), //
			array('tel','require','手机号码不可以为空！'), //
			array('tel','number','手机号码只能为数字！'), //
			array('tel','11','手机号码长度不符！',3,'length'), // 验证电话号码长度
			//array('tel','','手机号码已经存在！',0,'unique',1), //
			array('username','require','登入编号不可以为空！'), //
			array('username','','登入编号已经存在！',0,'unique',1), // 
			array('rname','require','介绍人编号不可以为空！'),
			array('upd1','require','登录密码不可以为空！'), //    
			array('upd2','require','二级密码不可以为空！'), //
			array('upd1','6,20','登录密码长度只能为6-20个字符！',3,'length'), //
			array('upd2','6,20','二级密码长度只能为6-20个字符',3,'length'), //
			//array('code','require','种子币不可以为空！'), //
		);
		$uid=I("session.uid",0,"intval");
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$data['username']=I("post.username","");
			$reusername=I("post.reusername","");
			$rname=I("post.rname","");
			$rrname=I("post.rrname","");
			$data['upd1']=I("post.upd1","","md5");
			$data['upd2']=I("post.upd2","","md5");
			$reupd1=I("post.reupd1","","md5");
			$reupd2=I("post.reupd2","","md5");
			$data['nick']=I("post.nick","");
			$data['tel']=I("post.tel","");
			//$code=I("post.code","");
			//$code2=I("post.code2","");
			if(!fun_text1(6,20,$data['username'])){
				return "登入编号只能使用大小写字母和数字的组合,且长度属于6~20个字符";
			}
			if($rname!=$rrname) return "两次输入的介绍人编号不一致";
			if($data['upd1']!=$reupd1) return "两次输入的登录密码不一致";
			if($data['upd2']!=$reupd2) return "两次输入的二级密码不一致";
			$rr=$M->field('id')->where(array("username"=>$rname,"status"=>1))->select();
			if(!$rr) return "介绍人编号不存在或未激活";
			if($code!=$code2) return "两次输入的二级密码不一致";
			/*
			$r=M("keylist")->where(array('sn'=>$code))->find();
			if(!$r){
				return "种子币不存在";
			}
			if($r['status']) return "种子币已被使用";
			if($r['type']){
				if(!$r['fa']) return "种子币有误,请重新输入";
			}else{
				if($r['uid']!=$uid) return "请勿非法操作";
			}
			*/
			//$o=M("member")->field("max(od) as maxod")->where("status=1")->select();
			//$od=$o[0]['maxod']+1;
			$data["regdate"]=date("Y-m-d H:i:s");
			$data['fid']=0;
			$data['rid']=$rr[0]['id'];
			$data['regweek']=date("W");
			$data['regmonth']=date("n");
			$data['aid']=0;
			$data['money']=0;
			//$data['od']=$od;
			if($M->data($data)->add()){
				$c=M("member")->field('id')->where(array("username"=>$data['username']))->find();
				//M("keylist")->where('id='.$r['id'])->save(array("actuid"=>$c['id'],"actdate"=>time(),'status'=>1));
				//M('member')->where("id=".$data['rid'])->setInc("renum",1);
				//falist($c['id']);
				$tel=array();
				array_push($tel,$data['tel']);
				sendsms($tel,"亲爱的伙伴，恭喜你成功加入31社区！请关注微信：shequ31");
				return 1;
			}else{
				return 2;
			}
		}
	}
}
 ?>