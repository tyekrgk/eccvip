<?php 
namespace Home\Model;
use Think\Model;

/**
* 激活会员模块
*/
class RuleModel extends Model{
	Protected $autoCheckFields = false;
	public function updateuser($id){
		$M = M("member");
		$user=$M->field("id,username,rid,score,fid,line,aid,utype,dan")->where(array("id"=>$id,"status"=>0))->find();
		if($user){
			$F=F("data");//coinset
			$bonus=F("bonus");//会员等级
			$od=2;
			$r=$M->query("select max(od) as maxod from __PREFIX__member");
			if($r) $od=$r[0]["maxod"]+1;
			$address=getaddress(array(0=>$user['rid']));
			if($user['fid']){
				$r=$M->query("select id from __PREFIX__member where fid=".$user['fid']." and line=".$user['line']." and status=1");//找出该放置区域会员是否已激活
				if(!$r){
					$address=array(0=>$user['fid'],1=>$user['line']);
				}
			}//
			$data=array("status"=>1,"od"=>$od,"fid"=>$address[0],"line"=>$address[1],"actdate"=>date("Y-m-d H:i:s"),"actweek"=>date("W"),"actmonth"=>date("n"));
			if($M->where("id=".$id)->save($data)){
				$utype=$user['utype'];
				$dan=$bonus[$utype]["dan"];//需要多少单
				$money=$bonus[$utype]["money"];//需要多少钱
				$coin = money2coin($money);//转换成需要多少coin
				//$gt1=$money/2;
				//M("member")->where('id='.$id)->SetInc("gu",$dan);
				//M("member")->where('id='.$id)->SetInc("gt1",$gt1);
				//history(array("uid"=>$id,"type"=>810,"gt1"=>$gt1,"gu"=>$dan,"info"=>"注册新账户赠送"));
				//更新推荐人数据
				M()->execute("update __PREFIX__member set renum=renum+1,wsum=wsum+".$coin.",resum=resum+".$coin.",reyu=reyu+".$coin." where id=".$user['rid']);
				//$M->where("id=".$user['rid'])->setInc("renum");
				//$M->where("id=".$user['rid'])->setInc("wsum",$money);
				$ids=getfids_fen($id);
				array_push($ids[0],999999);
				array_push($ids[1],999999);
				$M->execute("update __PREFIX__member set ldansum=ldansum+".$dan.",lyu=lyu+".$coin.",lsum=lsum+".$coin.",areasum=areasum+".$coin.",areayu=areayu+".$coin." where id in (".join(',',$ids[0]).")");		//更新各区总单数
				$M->execute("update __PREFIX__member set rdansum=rdansum+".$dan.",ryu=ryu+".$coin.",rsum=rsum+".$coin.",areasum=areasum+".$coin.",areayu=areayu+".$coin." where id in (".join(',',$ids[1]).")");
				$fidmerge=$ids[2];
				spong($fidmerge,$user["username"]);		//发放对碰奖
				//fatjj($id,$money);		//发放直推奖
				//fajdj($id,$utype,$user["username"]);	//见点奖
				//fagbdj($id,$money,$key="激活");
				//fajdj($id,$user["username"]);
				//fabdj($id);
    			M('invest_plan')->add(array('uid'=>$id,'start'=>date('Y-m-d'),'period'=>$F['stimes'],'investamount'=>$coin,'rate'=>$bonus[$utype]["kup"],'randrate'=>$bonus[$utype]["fudong"]));//添加投资计划
				return 1;
			}else{
				return 2;
			}
		}else{
			return "请勿非法操作";
		}
	}
}

 ?>