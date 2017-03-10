<?php 
namespace Home\Model;
use Think\Model;

/**
* 会员模块
*/
class MemberModel extends Model{
	Protected $autoCheckFields = false;
	/**
	 * 注册会员
	 */
	public function regsave(){
		$rules = array(
			array('username','require','能量编号不可以为空！'), //
			array('username','','帐号名称已经存在！',0,'unique',1), //
			array('utype','number','单数只能为数字！'), //
			array('utype',array(1,6),'请选择正确的单数！',0,'between'), //
			array('rname','require','推荐人编号不可以为空！'),
			array('aname','require','报单中心不可以为空！'),
			array('fname','require','管理人编号不可以为空！'),
			array('line',array(0,1),'位置值的范围不正确！',0,'in'), // 
			array('p1','require','登录密码不可以为空！'), //    
			array('p2','require','二级密码不可以为空！'), //
			array('p1','6,20','登录密码长度只能为6-20个字符！',3,'length'), //
			array('p2','6,20','二级密码长度只能为6-20个字符',3,'length'), //
			array('realname','require','姓名不可以为空！'), //
			array('idcard','require','证件号码不可以为空！'), //
			array('nick','require','昵称不可以为空！'), //    
			array('email','require','Email不可以为空！'), //
			array('tel','require','手机号码不可以为空！'), //
			array('tel','number','手机号码只能为数字！'), //
			array('tel','11','手机号码长度不符！',3,'length'), // 验证电话号码长度
		);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$bonus=F("bonus");
			$data['username']=I("post.username","");
			$data['utype']=I("post.utype",1,"intval");
			$data['rname']=I("post.rname","");
			$data['aname']=I("post.aname","");
			$data['fname']=I("post.fname","");
			$data['realname']=I("post.realname","");
			$data['idcard']=I("post.idcard","");
			$data['dan']=$bonus[$data['utype']];
			$data['line']=I("post.line",0,"intval");
			$data['upd1']=I("post.p1","","md5");
			$data['upd2']=I("post.p2","","md5");
			$data['nick']=I("post.nick","");
			$data['qq']=I("post.qq","");
			$data['tel']=I("post.tel","");
			$data['email']=I("post.email","");
			$data['country']=I("post.country","");
			/* 规则：默认注册的用户为报单中心 */
			$data['isagent']=1;//开启报单模式
			if($data['aname']===""){//注册用户的报单中心为当前登录用户
			    $uid = I("session.uid",0,'intval');
			    $curruser = $M->field('id')->where(array("id"=>$uid,"status"=>1,"isagent"=>1))->find();
			    if($curruser) $aid = $curruser['id'];
			}
			/* 规则：end */
			if(preg_match("/[^\(a-zA-Z)\d]/",$data['username'])>0) return "能量编号必须是字母与数字的组合";
			if(strlen($data['username'])>10 || strlen($data['username'])<6) return "能量编号长度必须为6~10个字符";
			//if($data['dan']<0 || $data['dan'>50]) return "注册单数只能处于1~50单之间";
			//$data['utype']=cheutype($data['dan']);
			//$minbonus=M("bonus")->field("min(id) as minid")->select();
			//$maxbonus=M("bonus")->field("max(id) as maxid")->select();
			//if($data["utype"]>$maxbonus[0]["maxid"] || $data["utype"]<$minbonus[0]["minid"]) return "请勿非法操作";
			$rr=$M->field('id,renum')->where(array("username"=>$data['rname'],"status"=>1))->select();
			if(!$rr) return "推荐人编号不存在或未激活";
			$ff=$M->field('id')->where(array("username"=>$data['fname'],"status"=>1))->select();
			if(!$ff) return "管理人编号不存在或未激活";
			if($data['line']==1 && 0){
				if($data['rname']!=$data['fname']) return "右区位置必须是接点人推荐的会员才可以注册";
				if(!($M->field('id')->where(array("fid"=>$ff[0]["id"],"line"=>0,"status"=>1))->select())) return "必须注册左区位置并激活才可以注册右区位置";
			}
			$cheea=cheleftarea($ff[0]["id"],$rr[0]["id"],$data['line']);
			if($rr['0']['renum']==0){
				if($cheea) return "推荐的第一个会员必须注册在推荐人的左区";
			}
			if($M->field('id')->where(array("fid"=>$ff[0]["id"],"line"=>$data['line']))->select()) return "选择的点位已经有能量占用";
			if(!$aid){
    			if($data['aname']){
    				$aa=$M->field('id')->where(array("username"=>$data['aname'],"status"=>1,"isagent"=>1))->select();
    				if($aa){
    					$aid=$aa[0]['id'];
    				}else{
    					return "您填写的报单中心不存在";
    				}
    			}else{
    				$aa=M("member")->field("aid")->where("id=".$rr[0]['id'])->find();
    				if($aa){
    					$aid=$aa["aid"];
    				}else{
    					$aid=1;
    				}
    			}
			}
			//$aid=0;
			$F=F("data");
			$data["regdate"]=date("Y-m-d H:i:s");
			unset($data['rname']);
			unset($data['fname']);
			unset($data['aname']);
			$data['fid']=$ff[0]['id'];
			$data['rid']=$rr[0]['id'];
			$data['regweek']=date("W");
			$data['regmonth']=date("n");
			$data['aid']=$aid;
			//$data['money']=$F["money"];
			if($M->data($data)->add()){
				return 1;
			}else{
				return 2;
			}
		}
	}

	public function finsave(){
		$rules = array(
			array('number','require','请输入一个数值！'),
			array('number','number','数量只能为数字！'), //
		);
		$M=M("financial");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F("data");
			$uid=I("session.uid",0,"intval");
			$number=I("post.number",0,"intval");
			if($number<1 || $number>$F['maxnumber']) return "请输入正确的数值！";
			$user=M("member")->field("score")->where("id=".$uid)->find();
			if($F["price"]*$number>$user['score']) return "电子币不足";
			$r=M("financial")->field("ifnull(sum(number),0) as number")->where("doneday<days and uid=".$uid)->select();
			$buynumber=$r[0]["number"];
			if($number+$buynumber>$F['maxnumber']) return "最大可持有量为".$F['maxnumber'];
			$sn=creatsn("KN");
			$time=mktime(0,0,0,date("m"),date("d"),date("Y"));
			$data=array("sn"=>$sn,"uid"=>$uid,"price"=>$F["price"],"number"=>$number,"money"=>$F["fhj"],"days"=>$F['fhjday'],"date"=>date("Y-m-d H:i:s"),"keytime"=>$time);
			if(M("financial")->data($data)->add()){
				return 1;
			}else{
				return 2;
			}
		}
	}

	public function fintx(){
		$id=I("get.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$r=M("financial")->where("id=".$id." and uid=".$uid)->find();
		$F=F("data");
		if($r){
			$days=$r["days"];
			$keytime=$r["keytime"];
			if($days<1 || $days>5) return "请勿非法操作";
			$txtime=$keytime+3600*24*$F["guday".$days];
			if($txtime>time()) return "您下次提现的时间还没到";
			$money=$F["gumoney".$days];
			if($money){
				M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money." where id=".$uid);
				M()->execute("update __PREFIX__financial set yu=yu+".$money.",days=days+1 where id=".$id);
            	history(array('allin'=>$money,'coin'=>$money,'uid'=>$uid,'type'=>110,'info'=>'来源股权编号:'.$r['sn']));
				return 1;
			}
		}else{
			return "请勿非法操作";
		}
	}

	public function apply(){
		$F=F("data");
		$uid=I("session.uid",0,"intval");
		$r=M("member")->field("isagent,utype,lsum,rsum")->where("id=".$uid)->find();
		$c=M("financial")->field("ifnull(sum(number),0) as number")->where("uid=".$uid)->select();
		$gu=$c[0]['number'];
		if($r["isagent"]) return "请勿非法操作";
		if($F['bdt']>=$r['lsum']+$r['rsum']) return "小区业绩不足,不可以申请报单中心!";
		$r=M("history")->field("id")->where("status=0 and uid=".$uid." and type=10")->find();
		if($r) return "您已提交申请,请勿再次提交";
		history(array('uid'=>$uid,'type'=>10,'info'=>'申请报单中心'));
		return 1;
	}
}
 ?>