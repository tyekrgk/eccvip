<?php 
namespace Home\Model;
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
			array('username','require','会员编号不可以为空！'), //
			array('username','','帐号名称已经存在！',0,'unique',1), // 
			array('rname','require','推荐人编号不可以为空！'),
			array('upd1','require','登录密码不可以为空！'), //    
			array('upd2','require','二级密码不可以为空！'), //
			array('upd1','6,20','登录密码长度只能为6-20个字符！',3,'length'), //
			array('upd2','6,20','二级密码长度只能为6-20个字符',3,'length'), //
			array('nick','require','昵称不可以为空！'), //    
			array('qq','require','QQ号码不可以为空！'), //
			array('qq','number','QQ号码只能为数字！'), //
			array('tel','require','手机号码不可以为空！'), //
			array('tel','number','手机号码只能为数字！'), //
			array('tel','11','手机号码长度不符！',3,'length'), // 验证电话号码长度
		);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$data['username']=I("post.username","");
			$data['aname']=I("post.aname","");
			$data['rname']=I("post.rname","");
			$data['upd1']=I("post.upd1","","md5");
			$data['upd2']=I("post.upd2","","md5");
			$data['nick']=I("post.nick","");
			$data['utype']=I("post.utype",0);
			$data['qq']=I("post.qq","");
			$data['tel']=I("post.tel","");
			//$minbonus=M("bonus")->field("min(id) as minid")->select();
			//$maxbonus=M("bonus")->field("max(id) as maxid")->select();
			//if($data["utype"]>$maxbonus[0]["maxid"] || $data["utype"]<$minbonus[0]["minid"]) return "请勿非法操作";
			$rr=$M->field('id')->where(array("username"=>$data['rname'],"status"=>1))->select();
			if(!$rr) return "推荐人编号不存在或未激活";
			if($data['aname']){
				$aa=$M->field('id')->where(array("username"=>$data['aname'],"status"=>1,"isagent"=>1))->select();
				if($aa){
					$aid=$aa[0]['id'];
				}else{
					return "您填写的报单中心不存在";
				}
			}else{
				$aid=1;
			}
			$aid=0;
			$F=F("data");
			$data["regdate"]=date("Y-m-d H:i:s");
			unset($data['rname']);
			unset($data['fname']);
			unset($data['aname']);
			$data['rid']=$rr[0]['id'];
			$data['regweek']=date("W");
			$data['regmonth']=date("n");
			$data['aid']=$aid;
			$data['money']=$F["money"];
			if($M->data($data)->add()){
				return 1;
			}else{
				return 2;
			}
		}
	}
}
 ?>