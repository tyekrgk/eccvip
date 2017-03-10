<?php 
namespace Home\Model;
use Think\Model;

/**
* CT交易市场
*/
class BtmarketModel extends Model{
	Protected $autoCheckFields = false;

	public function dobuysave(){
		$rules = array(
			array('number','number','请输入正确的购买数量'), //
			array('p','require','请输入您的二级密码！'), //
		);
		$F=F("data");
		if($F['txstatus']) return  "当前未开放系统匹配!";
		$M=M("btmarket");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I('session.uid',0,'intval');
			$number=I('post.number',0,'intval');
			$p=I('post.p',"","md5");
			if($number<0) return "请输入正确的购买数量";
			if($number<$F['btmin']||$number%$F['btbase']) return "购买数量必须是".$F['btbase']."的倍数,且必须大于等于".$F['btmin'];
			$r=M("market")->field('id')->where("status=0 and uid<>".$uid." and coin=".$number)->find();
			if($r){
				$date=time()+$F['btover'];
				$data=array("status"=>1,"buyid"=>$uid,"lockdate"=>$date);
				if(M('market')->where(array("id=".$r['id'],"status"=>0))->save($data)){
					return 1;
				}else{
					return 2;
				}
			}
			$u=M('member')->field('id,bt')->where("id=".$uid." and upd2='".$p."'")->find();
			if(!$u) return "您输入的二级密码不正确";
			$sn=creatsortsn("CT",8,'sn',"market");
			$data=array("type"=>1,"sn"=>$sn,'coin'=>$number,"rcoin"=>$number,"buyid"=>$uid,"addtime"=>time(),"lockdate"=>time()+$F['btover'],'status'=>1);
			if(M('market')->data($data)->add()){
				return 1;
			}else{
				return 2;
			}
		}
	}

	public function dosellsave(){
		$rules = array(
			array('number','number','请输入正确的出售数量'), //
			array('p','require','请输入您的二级密码！'), //
		);
		$F=F("data");
		$M=M("btmarket");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I('session.uid',0,'intval');
			$number=I('post.number',0,'intval');
			$p=I('post.p',"","md5");
			if($number<0) return "请输入正确的出售数量";
			if($number<$F['btmin']||$number%$F['btbase']) return "购买数量必须是".$F['btbase']."的倍数,且必须大于等于".$F['btmin'];
			$u=M('member')->field('id,bt')->where("id=".$uid." and upd2='".$p."'")->find();
			if(!$u) return "您输入的二级密码不正确";
			if($number*(1+$F['btout']/100)>$u['bt']) return "您的CT帐户余额不足";
			$sn=creatsortsn("CT",8,'sn',"market");
			$data=array("sn"=>$sn,'coin'=>$number,"rcoin"=>$number,"uid"=>$uid,"addtime"=>time(),'status'=>0);
			if(M('market')->data($data)->add()){
				M('member')->where("id=".$uid)->SetDec("bt",$number*(1+$F['btout']/100));
				history(array('uid'=>$uid,"bt"=>(-1*$number),"shui"=>(-1*$number*$F['btout']/100),"type"=>999,'info'=>"CT交易市场挂单卖出,额外扣除税5%(".($number*$F['btout']/100).")"));
				updatebtmarket($number);	//更新挂单量
				return 1;
			}else{
				return 2;
			}
		}
	}

	public function lockdata(){
		$uid=I("session.uid",0,"intval");
		$M=M("member")->field("star")->where("id=".$uid)->find();
		$star=$M["star"];
		if($star>3){
			$F=F("data");
			$id=I("get.id",0,"intval");
			$date=time()+$F['btover'];
			$data=array("status"=>1,"buyid"=>$uid,"lockdate"=>$date);
			if(M('market')->where(array("id=".$id,"status"=>0))->save($data)){
				return 1;
			}else{
				return 2;
			}
		}else{
			return "您的信用等级过低,不能进行交易";
		}

	}

}

?>