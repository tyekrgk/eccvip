<?php 
namespace Home\Model;
use Think\Model;

/**
* 财务模型
*/
class MoneyModel extends Model{
	Protected $autoCheckFields = false;
	/**
	 * 汇款
	 */
	public function remsave(){
		$rules = array(
			array('money','require','请填写充值金额！'), // 
			array('money','number','充值金额只能为数字！'), //
			array('info','require','请填写备注信息！'), //
		);
		$F=F("data");
		$M=M("remittance");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I("session.uid",0,"intval");
			$data['money']=I("post.money",0);
			$data['info']=I("post.info","");
			$data['sn']=creatsn();
			$data['uid']=$uid;
			$data['inmoney']=$data['money']*$F['incoin'];
			$data['date']=date("Y-m-d H:i:s");
			if($data["money"]<=0) return "请填写正确的充值金额";
			if($M->field("id")->where(array("uid"=>$uid,"status"=>0,"type"=>0))->select()) return "您还有未审核的充值信息,不可以再次提交";
			if($M->data($data)->add()){
				return 1;
			}else{
				return 2;
			}
		}
	}
	/**
	 * 转换
	 */
	public function consave(){
		$rules = array(
			array('coin','require','请填写充值金额！'), // 
			array('coin','number','转换金额只能为数字！'), //
		);
		$M=M("history");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F("data");
			if($F['huanstatus']) return "转换功能未开放";
			$uid=I("session.uid",0,"intval");
			$data['coin']=I("post.coin",0);
			if($data["coin"]<=0||$F["huanbase"]>$data["coin"]) return "请填写正确的转换金额";
			$u=M("member")->field("coin,score")->where("id=".$uid)->find();
			if($data["coin"]>$u["coin"]) return "奖金币不足";
			$data['shui']=$data['coin']*$F['huanshui']/100;
			$data['score']=$data["coin"]-$data['shui'];
			$data['type']=2;
			$data['uid']=$uid;
			$data['info']="转换成功";
			if(M("member")->where("id=".$uid)->setInc("score",$data['score'])){
				M("member")->where("id=".$uid)->setDec("coin",$data['coin']);
				history($data);
				return 1;
			}else{
				return 2;
			}
		}
	}
	/**
	 * 转帐
	 */
	public function trasave(){
		$rules = array(
			array('score','require','请填写转帐金额！'), // 
			array('score','number','转帐金额只能为数字！'), //
		);
		$M=M("history");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F("data");
			if($F['huanstatus']) return "转帐功能未开放";
			$uid=I("session.uid",0,"intval");
			$username=I("post.username","");
			$score=I("post.score",0);
			if($score<=0||$F["zhbase"]>$score) return "请填写正确的转帐金额";
			$u=M("member")->field("coin,score")->where("id=".$uid)->find();
			if($score>$u["score"]) return "电子币不足";
			if(!$username) return "请填写转到的会员编号";
			$v=M("member")->field("id")->where(array("username"=>$username))->find();
			if($v){
				if($uid==$v["id"]){
					return "你不能给自己转帐";
				}else{
					$data["key1"]=$v["id"];
				}
			}else{
				return "会员编号不存在";
			}
			$data['shui']=$score*$F['zhshui']/100;
			$data['score']=$score-$data['shui'];
			$data['type']=3;
			$data['uid']=$uid;
			$data['info']="转帐成功";
			if(M("member")->where("id=".$uid)->setdec("score",$score)){
				M("member")->where("id=".$data["key1"])->setInc("score",$data['score']);
				history($data);
				return 1;
			}else{
				return 2;
			}
		}
	}
	/**
	 * 提现
	 */
	public function cashsave(){
		$rules = array(
			array('money','require','请填写充值金额！'), // 
			array('money','number','提现金额只能为数字！'), //
		);
		$M=M("cash");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F("data");
			if($F['txstatus']) return "提现功能未开放";
			$uid=I("session.uid",0,"intval");
			$username=I("post.username","");
			$bankid=I("post.bankid",0,"intval");
			$bank=M("bank")->where(array("id"=>$bankid,"uid"=>$uid))->find();
			if(!$bank) return "您选择的提现银行信息有误";
			$data['money']=I("post.money",0);
			if($data["money"]<=0||$F["txbase"]>$data["money"]) return "请填写正确的提现金额";
			if($data["money"]%$F["txbase"]>0) return "请按".$F["txbase"]."的倍数提现";
			$u=M("member")->field("coin,score,realname")->where("id=".$uid)->find();
			if($data["money"]>$u["coin"]) return "奖金币不足";
			$data['shui']=$data['money']*$F['txshui']/100;
			$data['outmoney']=($data['money']-$data['shui'])*$F['outcoin'];
			$data['uid']=$uid;
			$data['date']=date("Y-m-d H:i:s");
			$data['bank']=$bank["bank"];
			$data['bankuser']=$u['realname'];
			$data['bankaddress']=$bank["bankaddress"];
			$data['bankcard']=$bank["bankcard"];
			$data['content']="会员提现";
			if(M("member")->where("id=".$uid)->setdec("coin",$data['money'])){
				M("cash")->data($data)->add();
				return 1;
			}else{
				return 2;
			}
		}
	}

	public function cashcan(){
		$uid=I("session.uid",0,"intval");
		$id=I("get.id",0,"intval");
		$r=M("cash")->where(array("id"=>$id,"uid"=>$uid,"status"=>0))->find();
		if(!$r){
			return "你要操作的记录不存在或不能操作";
		}else{
			if(M("member")->where(array("id"=>$uid))->setInc("coin",$r["money"])){
				M("cash")->where(array("id"=>$id))->save(array("status"=>3));
				return 1;
			}else{
				return 2;
			}
		}
	}

	public function dobtsave(){
		$rules = array(
			array('p','require','请输入二级密码！'), // 
			//array('username','require','请输入转入人编号！'), // 
			array('money','number','金额只能为数字！'), //
		);
		$M=M('member');
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$type=I('post.type',0,"intval");
			$F=F('data');
			$uid=I("session.uid",0,'intval');
			$username=I("post.username","");
			$money=I("post.money",0);
			$content=I("post.content","");
			$p=I('post.p',"","md5");
			$shui=$money*$F['bt0shui']/100;
			$realmoney=$money-$shui;
			$r=M('member')->field('id,bt')->where(array('id'=>$uid,'upd2'=>$p))->find();
			if(!$r) return "您输入的二级密码有误";
			if($money<0 || $money>$r['bt']) return "请输入正确的金额";
			if($money%$F['bt0base']) return "您只能按".$F['bt0base']."的倍数进行转帐";
			if($F['bt0min']>$money) return "最小转帐金额为".$F['bt0min'];
			if($type){
				M('member')->where('id='.$uid)->SetDec("bt",$money);
				M('member')->where('id='.$uid)->SetInc("bt1",$realmoney);
				history(array('uid'=>$uid,'bt'=>-1*$money,'bt1'=>$realmoney,'shui'=>$shui,'type'=>808,"info"=>$content));
				return 1;
			}else{
				$r=M('member')->field('id,nick')->where(array('username'=>$username))->find();
				if($r){
					if($r['id']==$uid) return "您不可以给自己转帐";
					$toid=$r['id'];
					M('member')->where('id='.$uid)->SetDec("bt",$money);
					M('member')->where('id='.$toid)->SetInc("bt",$realmoney);
					history(array('uid'=>$uid,'toid'=>$toid,'bt'=>-1*$money,'shui'=>$shui,'type'=>806,"info"=>$content));
					history(array('uid'=>$toid,'toid'=>$uid,'bt'=>$realmoney,'shui'=>$shui,'type'=>807,"info"=>$content));
					return 1;
				}else{
					return "您输入的能量编号不存在";
				}
			}
		}
	}

	public function dobt1save(){
		$rules = array(
			array('p','require','请输入二级密码！'), // 
			array('username','require','请输入转入人编号！'), // 
			array('money','number','金额只能为数字！'), //
		);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F('data');
			$uid=I("session.uid",0,'intval');
			$username=I("post.username","");
			$money=I("post.money",0);
			$content=I("post.content","");
			$p=I('post.p',"","md5");
			$shui=$money*$F['bt1shui']/100;
			$realmoney=$money-$shui;
			$r=M('member')->field('id,bt1')->where(array('id'=>$uid,'upd2'=>$p))->find();
			if(!$r) return "您输入的二级密码有误";
			if($money<0 || $money>$r['bt1']) return "请输入正确的金额";
			if($money%$F['bt1base']) return "您只能按".$F['bt1base']."的倍数进行转帐";
			if($F['bt1min']>$money) return "最小转帐金额为".$F['bt1min'];
			$r=M('member')->field('id,nick')->where(array('username'=>$username))->find();
			if($r){
				if($r['id']==$uid) return "您不可以给自己转帐";
				$toid=$r['id'];
				M('member')->where('id='.$uid)->SetDec("bt1",$money);
				M('member')->where('id='.$toid)->SetInc("bt1",$realmoney);
				history(array('uid'=>$uid,'toid'=>$toid,'bt1'=>-1*$money,'shui'=>$shui,'type'=>802,"info"=>$content));
				history(array('uid'=>$toid,'toid'=>$uid,'bt1'=>$realmoney,'shui'=>$shui,'type'=>803,"info"=>$content));
				return 1;
			}else{
				return "您输入的能量编号不存在";
			}
			
		}
	}
	public function dobt2save(){
		$rules = array( 
			array('money','number','金额只能为数字！'), //
		);
		$M=M("member");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F('data');
			$uid=I("session.uid",0,'intval');
			$money=I("post.money",0);
			$content=I("post.content","");
			$shui=$money*$F['bt2shui']/100;
			$realmoney=$money-$shui;
			$r=M('member')->field('id,bt2')->where(array('id'=>$uid))->find();
			if(!$r) return "您输入的二级密码有误";
			if($money<0 || $money>$r['bt2']) return "请输入正确的金额";
			if($money%$F['bt2base']) return "您只能按".$F['bt2base']."的倍数进行转换";
			if($F['bt2min']>$money) return "最小转帐金额为".$F['bt2min'];
			M('member')->where('id='.$uid)->SetDec("bt2",$money);
			M('member')->where('id='.$uid)->SetInc("bt1",$realmoney);
			history(array('uid'=>$uid,'bt2'=>-1*$money,'bt1'=>$realmoney,'shui'=>$shui,'type'=>804,"info"=>$content));
			return 1;
		}
	}

	public function dogtsave(){
		$rules = array(
			array('p','require','请输入二级密码！'), //  
			array('money','number','金额只能为数字！'), //
		);
		$M=M('member');
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F('data');
			$uid=I("session.uid",0,'intval');
			$money=I("post.money",0);
			$content=I("post.content","");
			$shui=$money*$F['gdshui']/100;
			$realmoney=$money-$shui;
			$btmoney=$realmoney*$F['gdgt']/100;
			$gtmoney=$realmoney*$F['gdgt1']/100;
			$lymoney=$realmoney*$F['gdgt2']/100;
			$r=M('member')->field('id,gt')->where(array('id'=>$uid))->find();
			if(!$r) return "您输入的二级密码有误";
			if($money<0 || $money>$r['gt']) return "请输入正确的金额";
			if($money%$F['gtbase']) return "您只能按".$F['gtbase']."的倍数进行转帐";
			if($F['gtmin']>$money) return "最小转帐金额为".$F['gtmin'];
			M()->execute("update __PREFIX__member set gt=gt-".$money.",bt=bt+".$btmoney.",gt1=gt1+".$gtmoney.",ly=ly+".$lymoney." where id=".$uid);
			history(array('uid'=>$uid,'gt'=>-1*$money,'bt'=>$btmoney,'gt1'=>$gtmoney,'ly'=>$lymoney,'shui'=>$shui,'type'=>809,"info"=>$content));
			return 1;
		}
	}

	public function dogt1save(){
		$rules = array(
			array('p','require','请输入二级密码！'), //  
			array('money','number','金额只能为数字！'), //
		);
		$M=M('member');
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F('data');
			$uid=I("session.uid",0,'intval');
			$money=I("post.money",0);
			$content=I("post.content","");
			$shui=$money*$F['gt1shui']/100;
			$realmoney=$money-$shui;
			$r=M('member')->field('id,gt1')->where(array('id'=>$uid))->find();
			if(!$r) return "您输入的二级密码有误";
			if($money<0 || $money>$r['gt1']) return "请输入正确的金额";
			if($money%$F['gt1base']) return "您只能按".$F['gt1base']."的倍数进行转帐";
			if($F['gt1min']>$money) return "最小转帐金额为".$F['gt1min'];
			M()->execute("update __PREFIX__member set gt1=gt1-".$money.",ly=ly+".$realmoney." where id=".$uid);
			history(array('uid'=>$uid,'gt1'=>-1*$money,'ly'=>$realmoney,'shui'=>$shui,'type'=>816,"info"=>"AT1转LY"));
			return 1;
		}
	}
	
	/**
	 * 虚拟币转账
	 * @author hyq
	 * @return string|number
	 */
	public function coinsave(){
	    $rules = array(
	        //array('p','require','请输入二级密码！'),
	        array('username','require','请输入转入人编号！'),
	        array('money','number','金额只能为数字！'),
	    );
	    $M=M('member');
	    if(!$M->validate($rules)->create()){
	        return $M->getError();
	    }else{
	        $cointype=I("post.cointype","");//币种
	        if(!$cointype) return "币种类型不能为空";
	        $F=F('data');
	        $uid=I("session.uid",0,'intval');
	        $username=I("post.username","");
	        /* 规则：只能给自己的上线领导或者自己的下线会员转账 */
	        $ids = getrel($uid,'fid',1024);//上线领导
	        $ids = getsubrel($uid,'fid',1024,$ids);//下线会员
	        $to = M('member')->field('id,username')->where("id in (".join(",", $ids).") and username='".$username."'")->find();
	        if(!$to) return "该用户超出转账范围";
	        /* 规则：end */
	        $money=I("post.money",0);
	        $content=I("post.content","");
	        //$p=I('post.p',"","md5");
	        $gacode=I('post.gacode',"");
	        $shui=$money*$F[$cointype.'shui']/100;
	        $realmoney=$money-$shui;
	        $r=M('member')->field('ga,id,'.$cointype)->where(array('id'=>$uid/* ,'upd2'=>$p */))->find();
	        /* if(!$r) return "您输入的二级密码有误"; */
	        $checkcode = checkga($r['ga'], $gacode, 2);
	        if($checkcode!=1) return "谷歌验证码错误";
	        if($money<0 || $money>$r[$cointype]) return "请输入正确的金额";
	        if($money%$F[$cointype.'base']) return "您只能按".$F[$cointype.'base']."的倍数进行转帐";
	        if($F[$cointype.'min']>$money) return "最小转帐金额为".$F[$cointype.'min'];
	        
	        //转账
            //$r=M('member')->field('id,nick')->where(array('username'=>$username))->find();
            if($to){
                if($to['id']==$uid) return "您不可以给自己转帐";
                $toid=$to['id'];
                M('member')->where('id='.$uid)->SetDec($cointype,$money);
                M('member')->where('id='.$toid)->SetInc($cointype,$realmoney);
                history(array('uid'=>$uid,'toid'=>$toid,'src'=>1,$cointype=>-1*$money,'allin'=>-1*$money,'shui'=>$shui,'type'=>1000,"info"=>$content));
                history(array('uid'=>$toid,'toid'=>$uid,'src'=>2,$cointype=>$realmoney,'allin'=>$realmoney,'shui'=>$shui,'type'=>1001,"info"=>$content));
                return 1;
            }else{
                return "您输入的能量编号不存在";
            }
	        
	    }
	}
}	

 ?>