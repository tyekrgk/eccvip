<?php 
namespace Home\Model;
use Think\Model;

/**
* 会员模块
*/
class UserModel extends Model{
	Protected $autoCheckFields = false;
	/**
	 * 注册会员
	 */
	public function usersave(){
		$rules = array(
			array('nick','require','昵称不可以为空！'), //    
			array('idcard','require','证件号码不可以为空！'), //
			array('bankuser','require','开户名不可以为空！'), //
			array('tel','require','手机号码不可以为空！'), //
			array('tel','number','手机号码只能为数字！'), //
			array('tel','11','手机号码长度不符！',3,'length'), // 验证电话号码长度
			array('bankcard','require','银行卡号不可以为空！'), //
			array('bankaddress','require','开户分行不可以为空！'), //
		);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$id=I("session.uid",0,"intval");
			$data['nick']=I("post.nick","");
			$data['tel']=I("post.tel","");
			$data['idcard']=I("post.idcard","");
			$data['bankuser']=I("post.bankuser","");
			$data['bank']=I("post.bank","");
			$data['bankcard']=I("post.bankcard","");
			$data['bankaddress']=I("post.bankaddress","");
			$data['epay']=I("post.epay","");
			$data['bit']=I("post.bt","");
			$data['country']=I("post.country","");
			$data['sex']=I("post.sex",0,'intval');
			$data['email']=I("post.email","");
			$data['email']=I("post.email","");
			$data['qianbaoc']=I("post.qianbaoc","");
			if($M->where(array('id'=>$id))->save($data)){
				return 1;
			}else{
				return 2;
			}
		}
	}
	/**
	 * 修改登录,二级密码
	 */
	public function passd(){
		
		$M=M("member");
		$id=I("session.uid",0,"intval");
		$type=I("post.type",0,"intval");
		$op=I("post.op","","md5");
		$p=I("post.p","","md5");
		$rp=I("post.rp","","md5");
		if(!$_POST['op']) return "请输入原密码";
		if(!$_POST['p']) return "请输入新密码";
		if(!$_POST['rp']) return "请确认一次新密码！";
		$rr=$M->field('upd1,upd2')->where(array("id"=>$id))->find();
		if($type==0){
			if($op!=$rr['upd1']) return "您输入的原一级密码有误";
			$data['upd1']=$p;
		}else{
			if($op!=$rr['upd2']) return "您输入的原二级密码有误";
			$data['upd2']=$p;
		}
		if($M->where(array('id'=>$id))->save($data)){
			return 1;
		}else{
			return 2;
		}
	}
	/**
	 * 绪定真实姓名
	 */
	public function realname(){
		$rules = array(
			array('realname','require','姓名不可以为空！'), //    
			array('realname','2,5','姓名长度不符！',3,'length'), // 
		);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$id=I("session.uid",0,"intval");
			$data['realname']=I("post.realname","");
			$rr=$M->field('realname')->where(array("id"=>$id))->find();
			$realname=$rr['realname'];
			if($realname) return "请勿非法操作";
			if($M->where(array('id'=>$id))->save($data)){
				return 1;
			}else{
				return 2;
			}
		}
	}

	public function banksave(){
		$rules = array(
			array('bankcard','require','姓名不可以为空！'), //    
		);
		$M=M("bank");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I("session.uid",0,"intval");
			$id=I("get.id",0,"intval");
			$v=M("member")->field('realname')->where('id='.$uid)->find();
			$realname=$v['realname'];
			if(!$realname) return "请勿非法操作";
			$data['uid']=$uid;
			$data['bankcard']=I("post.bankcard","");
			$data['bankaddress']=I("post.bankaddress","");
			$data['bank']=I("post.bank","");
			if($id){
				if($M->where(array('id'=>$id))->save($data)){
					return 1;
				}else{
					return 2;
				}
			}else{
				if($M->data($data)->add()){
					return 1;
				}else{
					return 2;
				}
			}
		}
	}

	public function qusave(){
		$rules=array(
			array("a1","require","请输入答案1"),
			array("a2","require","请输入答案2"),
			array("a3","require","请输入答案3"),
			);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I("session.uid",0,"intval");
			$question=I("session.question",0,"intval");
			$r=$M->field('q')->where('id='.$uid)->find();
			$q=$r["q"];
			$data['q1']=I("post.q1","");
			$data['q2']=I("post.q2","");
			$data['q3']=I("post.q3","");
			$data['a1']=I("post.a1","");
			$data['a2']=I("post.a2","");
			$data['a3']=I("post.a3","");
			if($data['q1']==$data['q2'] || $data['q1']==$data['q3'] || $data['q2']==$data['q3']) return "不可以选择相同的问题";
			if($q){
				if($question){
					session("question",null);
					if($M->where(array('id'=>$uid))->save($data)){
						return 1;
					}else{
						return 2;
					}
				}else{
					return "请勿非法操作";
				}
			}else{
				$data['q']=1;
				if($M->where(array('id'=>$uid))->save($data)){
					return 1;
				}else{
					return 2;
				}
			}
		}
	}

	public function answer(){
		$rules=array(
			array("a1","require","请输入答案1"),
			array("a2","require","请输入答案2"),
			array("a3","require","请输入答案3"),
			);
		$uid=I("session.uid",0,"intval");
		$M=M("member");
		$a1=I("post.a1","");
		$a2=I("post.a2","");
		$a3=I("post.a3","");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$v=$M->field("q,a1,a2,a3")->where("id=".$uid)->find();
			if(!$v['q']) return "请勿非法操作";
			if($a1!=$v['a1']) return "答案1有误,请查证后再填写";
			if($a2!=$v['a2']) return "答案2有误,请查证后再填写";
			if($a3!=$v['a3']) return "答案3有误,请查证后再填写";
			return 1;
		}
	}

	public function onebank(){
		$rules = array(
			array('bankcard','require','姓名不可以为空！'), // 
		);
		$M=M("bank");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I("session.uid",0,"intval");
			$r=M("bank")->where("uid=".$uid)->find();
			if($r) return "收款信息绑定后不可以再次修改";
			$id=I("get.id",0,"intval");
			//$realname=I("post.realname","");
			//if(!$realname) return "真实姓名不可以为空！";
			//$v=M("member")->field('realname')->where('id='.$uid)->find();
			//$realname=$v['realname'];
			//if(!$realname) return "请勿非法操作";
			$data['uid']=$uid;
			$data['bankcard']=I("post.bankcard","");
			$data['bankaddress']=I("post.bankaddress","");
			$data['bank']=I("post.bank","");
			if($id){
				if($M->where(array('id'=>$id))->save($data)){
					return 1;
				}else{
					return 2;
				}
			}else{
				if($M->data($data)->add()){
					//M("member")->where("id=".$uid)->save(array("realname"=>$realname));
					return 1;
				}else{
					return 2;
				}
			}
		}
	}

	/**
	 * 用户升级
	 * @author hyq
	 * @return string|number
	 */
	public function doupdate(){
		$rules = array(
			array('utype',array(2,6),'请输入正确的单数！',0,'between'), //升级等级范围
		);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();    
		}else{
			$bonus=F("bonus");
			$uid=I('session.uid',0,'intval');
			$utype=I('post.utype',0,"intval");
			$F=F('data');
			$r=M('history')->where(array('type'=>801,"uid"=>$uid))->count();
			if($r>=2) return "您的升级次数已用完,升级失败";
			$u=M('member')->field('dan,coina,coinc,username,utype')->where(array('id'=>$uid))->find();
			if($u['utype']>=$utype) return "请勿非法操作";
			$plan=M('invest_plan')->where('uid='.$uid)->find();
			if(!$plan) return "投资计划不存在";
			if($plan['period']==0) return "计划已过期,请去复投界面操作";
			$dan=$bonus[$utype]['dan']-$bonus[$u['utype']]['dan'];//升级用户还缺多少单
			$money=$bonus[$utype]['money']-$bonus[$u['utype']]['money'];//升级用户还缺多少钱
			//if($dan+$u['dan']>50) return "请输入正确的单数！";
			$coin = money2coin($money);//转换成虚拟币
			if($coin>$u['coina']) return "您的可用ECF帐户余额不足!";//复投账户优先扣除
			$ids=getfids_fen($uid);
			array_push($ids[0],999999);
			array_push($ids[1],999999);
			$M->execute("update __PREFIX__member set coina=coina-".$coin.",dan=dan+".$dan.",utype=".$utype." where id=".$uid);		//更新各区总单数
			$M->execute("update __PREFIX__member set ldansum=ldansum+".$dan.",lsum=lsum+".$coin.",lyu=lyu+".$coin.",areasum=areasum+".$coin.",areayu=areayu+".$coin." where id in (".join(',',$ids[0]).")");		//更新各区总单数
			$M->execute("update __PREFIX__member set rdansum=rdansum+".$dan.",rsum=rsum+".$coin.",ryu=ryu+".$coin.",areasum=areasum+".$coin.",areayu=areayu+".$coin." where id in (".join(',',$ids[1]).")");
			//更新投资计划
			M("invest_plan")->execute("update __PREFIX__invest_plan set investamount=investamount+".$coin.",rate=".$bonus[$utype]['kup'].",randrate=".$bonus[$utype]['fudong']." where id=".$plan['id']);
			$fidmerge=$ids[2];
			//redoutype();
			//history(array("uid"=>$uid,"type"=>811,"gt1"=>$gt1,"gu"=>$dan,"info"=>"升级账户赠送"));
			spong($fidmerge,$u["username"]."升级");		//发放对碰奖
			//fatjj($uid,$money,"升级");		//发放直推奖
			//fajdj($uid,$utype,$u["username"],"升级");	//见点奖
			//fagbdj($uid,$money,$key="升级");
			history(array('type'=>801,'uid'=>$uid,'info'=>"升级帐户",'dan'=>$dan,'coina'=>-1*$coin));
			return 1;
		}
	}
	
	/**
	 * 用户复投
	 * @author hyq
	 * @return string|number
	 */
	public function dofutou(){
	    $rules = array(
	        array('utype',array(2,6),'请输入正确的单数！',0,'between'), //复投等级范围
	    );
	    $M=M("member");
	    if(!$M->validate($rules)->create()){
	        return $M->getError();
	    }else{
	        $bonus=F("bonus");
	        $uid=I('session.uid',0,'intval');
	        $utype=I('post.utype',0,"intval");
	        $F=F('data');
	        $u=M('member')->field('dan,coina,coinc,username,utype')->where(array('id'=>$uid))->find();
	        if($u['utype']>$utype) return "请勿非法操作";
	        $plan=M('invest_plan')->where('uid='.$uid)->find();
	        if(!$plan) return "投资计划不存在";
	        $dan=$bonus[$utype]['dan'];//复投用户还缺多少单
	        $money=$bonus[$utype]['money'];//复投用户还缺多少钱
	        //if($dan+$u['dan']>50) return "请输入正确的单数！";
	        $coin = money2coin($money);//转换成虚拟币
	        if($coin>$u['coina']+$u['coinc']) return "您的帐户余额不足!";//复投账户优先扣除
	        $ids=getfids_fen($uid);
	        array_push($ids[0],999999);
	        array_push($ids[1],999999);
			$paycoin = array('coina'=>0,'coinc'=>$coin);//需要从账户扣除的虚拟币，优先扣除复投账户
			if($coin > $u['coinc']){
			    $paycoin['coinc'] = $u['coinc'];
			    $paycoin['coina'] = $coin - $u['coinc'];
			}
	        $M->execute("update __PREFIX__member set coina=coina-".$paycoin['coina'].",coinc=coinc-".$paycoin['coinc'].",dan=dan+".$dan.",utype=".$utype." where id=".$uid);		//更新各区总单数
	        $M->execute("update __PREFIX__member set ldansum=ldansum+".$dan.",lsum=lsum+".$coin.",lyu=lyu+".$coin.",areasum=areasum+".$coin.",areayu=areayu+".$coin." where id in (".join(',',$ids[0]).")");		//更新各区总单数
	        $M->execute("update __PREFIX__member set rdansum=rdansum+".$dan.",rsum=rsum+".$coin.",ryu=ryu+".$coin.",areasum=areasum+".$coin.",areayu=areayu+".$coin." where id in (".join(',',$ids[1]).")");
	        //更新投资计划
	        M("invest_plan")->execute("update __PREFIX__invest_plan set start='".date('Y-m-d')."',period=".F('data')['stimes'].",periodnow=0,investamount=".$coin.",rate=".$bonus[$utype]['kup'].",randrate=".$bonus[$utype]['fudong'].",lastoptdate=null where id=".$plan['id']);
	        $fidmerge=$ids[2];
	        //redoutype();
	        //history(array("uid"=>$uid,"type"=>811,"gt1"=>$gt1,"gu"=>$dan,"info"=>"升级账户赠送"));
	        spong($fidmerge,$u["username"]."复投");		//发放对碰奖
	        //fatjj($uid,$money,"升级");		//发放直推奖
	        //fajdj($uid,$utype,$u["username"],"升级");	//见点奖
	        //fagbdj($uid,$money,$key="升级");
	        history(array('type'=>1004,'uid'=>$uid,'info'=>"复投帐户",'dan'=>$dan,'coina'=>-1*$paycoin['coina'],'coinc'=>-1*$paycoin['coinc']));
	        return 1;
	    }
	}

	public function doagentsave(){
		$uid=I("session.uid",0,'intval');
		$F=F("data");
		$u=M("member")->field("renum,areasum,isagent")->where("id=".$uid)->find();
		if(!$u) return "请勿非法操作";
		if($u['isagent']) return "您已经是报单中心,不可以重复申请";
		if($F['bdt1']>$u['renum'] || $F['ndt2']>$u['areasum']) return "您的推荐人数或小区业绩不足,申请失败";
		$h=M("history")->field("id")->where("type=41 and status=0")->select();
		if($h) return "您已提交申请,请耐心等待管理员审核";
		history(array("type"=>41,"uid"=>$uid,"key1"=>$u['renum'],"key2"=>$u['areasum']));
		return 1;
	}
}
 ?>