<?php 
namespace Home\Model;
use Think\Model;

/**
* 
*/
class MarketModel extends Model{
	Protected $autoCheckFields = false;

	public function guasave(){
		$rules=array(
			array("coin","number","请输入正确的金额"),
			array("bank","require","请选择收款银行"),
			array("contact","require","请填写您的联系方式"),
			array("bank","number","请选择收款银行"),
			);
		$M=M("market");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$F=F("data");	
			$uid=I("session.uid",0,"intval");
			$bank=I("post.bank",0,"intval");
			$contact=I("post.contact","");
			$coin=I("post.coin",0,"intval");
			$bankinfo=M("bank")->where(array("id"=>$bank,"uid"=>$uid))->find();
			if(!$bankinfo) return "请选择正确的收款银行";
			$member=M("member")->field("realname,coin,star")->where("id=".$uid)->find();
			if($member['star']<4) return "您的信用等级过低,不能进行交易";
			if($coin>$member['coin']) return "奖金币不足";
			if($coin<$F['epbase']||$coin>$F['epmax']) return "请输入正确的金额";
			$data['sn']=creatsn();
			$data['coin']=$coin;
			$data['uid']=$uid;
			$data['shui']=$coin*$F['epshui']/100;
			$data['rcoin']=$coin-$data['shui'];
			$data['bank']=$bankinfo['bank'];
			$data['bankuser']=$member['realname'];
			$data['bankcard']=$bankinfo['bankcard'];
			$data['bankaddress']=$bankinfo['bankaddress'];
			$data['contact']=$contact;
			$rr=M("member")->where("id=".$uid)->setDec("coin",$coin);
			if(rr){
				if(M('market')->data($data)->add()){
					return 1;
				}else{
					M("member")->where("id=".$uid)->setInc("coin",$coin);
					return 2;
				}
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
			$date=date("Y-m-d H:i:s",time()+$F['eplock']);
			$data=array("status"=>1,"buyid"=>$uid,"lockdate"=>$date,"buytime"=>date("Y-m-d H:i:s"));
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