<?php 
namespace Home\Model;
use Think\Model;

/**
* 财务模型
*/
class GtmarketModel extends Model{
	Protected $autoCheckFields = false;

	public function dogt1save(){
		$rules = array(
			array('number','number','请填写正确的购买数量'), //
			array('p','require','请填写备注信息！'), //
		);
		$F=F("data");
		$bonus=F("bonus");
		$M=M("gtmarket");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I('session.uid',0,'intval');
			$price=I('post.price',0,'float');
			$number=I('post.number',0,'intval');
			$p=I('post.p',"","md5");
			$u=M('member')->field("gt1,pro,utype")->where("upd2='".$p."' and id=".$uid)->find();
			if(!$u) return "您输入的二级密码有误";
			$r=M('gtmarket')->where('status=1')->find();
			$keyprice=$r['price'];
			$keynumber=$r['number'];
			$donumber=$r['donumber'];
			$allmoney=$number*$price;
			if($pro>=$bonus[$u['utype']]['money']*5) return "您已出局,请升级您的帐户";
			if($price!=$keyprice) return "请输入正确的价格".$price."!=".$keyprice;
			if($number<$F['gdmin'] || $number%$F['gdbase']) return "您只能按".$F['gdbase']."的倍数进行购买";
			//if($F['gdup']>$keynumber) return "当前价格未挂满,不可以购买";
			if($number>$keynumber-$donumber) return "可购买数量不足";
			if($allmoney>$u['gt1']) return "您的AT1帐户余额不足";
			if(M('gtmarket')->where('number-donumber>='.$number.' and number>donumber and price='.$price)->SetInc('donumber',$number)){
				//M('gtmarket')->where('price='.$price)->SetInc('donumber',$number);
				if($keynumber>=$F['gdup']&&$number==$keynumber-$donumber) redogtmarket();
				updategdmarket($number,$price,1);
				M('member')->where('id='.$uid)->SetDec('gt1',$allmoney);
				M('member')->where('id='.$uid)->SetInc('gd1',$number);
				$sn=creatsortsn('B',8,'entype','history');
				history(array('type'=>401,'entype'=>$sn,'uid'=>$uid,'gd1'=>$number,'gt1'=>(-1*$allmoney),"info"=>'购买AC币','price'=>$price));
				return 1;
			}else{
				return "购买失败";
			}
		}
	}

	public function dogt2save(){
		$rules = array(
			array('number','number','请填写正确的卖出数量'), //
			array('p','require','请填写备注信息！'), //
		);
		$F=F("data");
		$bonus=F("bonus");
		$M=M("gtmarket");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I('session.uid',0,'intval');
			$price=I('post.price',0);
			$number=I('post.number',0,'intval');
			$p=I('post.p',"","md5");
			$u=M('member')->field("gd2,username,pro,utype")->where("upd2='".$p."' and id=".$uid)->find();
			if(!$u) return "您输入的二级密码有误";
			$rs=M('gtmarket')->field('price')->where("status>0")->order('status asc,id asc')->limit(3)->select();
			if(count($rs)==3){
				if($price==$rs[0]['price'] || $price==$rs[1]['price'] || $price==$rs[2]['price']){}else{return "请选择正确的价格";}
			}
			if(count($rs)==2){
				if($price==$rs[0]['price'] || $price==$rs[1]['price']){}else{return "请选择正确的价格";}
			}
			if(count($rs)==1){
				if($price==$rs[0]['price']){}else{return "请选择正确的价格";}
			}
			$allmoney=$price*$number;
			if($u['pro']>=$bonus[$u['utype']]['money']*5) return "您已出局或可出售数量不足,请升级您的帐户";
			if(count($rs)==0) return "请等待系统拆分";
			if($number<$F['gdmin'] || $number<0 || $number%$F['gdbase']) return "您只能按".$F['gdbase']."的倍数卖出AC币";
			$pr=M("gtmarket")->where("price=".$price)->find();
			if($pr['number']>=$F['gdup']) return "当前价格已挂满,请选择未挂满的价格卖出";
			if($number>$u['gd2']) return "您的AD2帐户余额不足";
			if(M("gtmarket")->where("".$F['gdup']."-number>=".$number." and price=".$price)->SetInc("number",$number)){
				M('member')->where('id='.$uid)->SetDec('gd2',$number);
				$allmoney=$price*$number;
				if($u['pro']+$allmoney>=$bonus[$u['utype']]['money']*5){
					$allmoney=$bonus[$u['utype']]['money']*5-$u['pro'];
					M()->execute("update dd_member set gd1=0,gd2=0,gu=0,gd=0 where id=".$uid);
					M('history')->where("type=401 and uid=".$uid)->delete();
				}
				fajyj($uid,$allmoney,$u['username']);
				M('member')->execute("update __PREFIX__member set gt=gt+".$allmoney.",pro=pro+".$allmoney." where id=".$uid);
				history(array("uid"=>$uid,'type'=>402,'gd2'=>-1*$number,"gt"=>$allmoney,"info"=>'卖出AC币','price'=>$price));
				updategdmarket($number,$price);
				return 1;
			}else{
				return "卖出失败";
			}
		}
	}

	public function dogdsave(){
		$rules = array(
			array('number','number','请填写正确的转帐数量'), // 
			array('p','require','请填写备注信息！'), //
		);
		$F=F("data");
		$M=M("gtmarket");
		if(!$M->validate($rules)->create()){
			return $M->getError();
		}else{
			$uid=I('session.uid',0,'intval');
			$number=I('post.number',0,'intval');
			$p=I('post.p',"","md5");
			$u=M('member')->field("gd")->where("upd2='".$p."' and id=".$uid)->find();
			if(!$u) return "您输入的二级密码有误";
			if($number<$F['kuangmin'] || $number%$F['kuangbase']) return "您只能按".$F['kuangbase']."的倍数进行转帐";
			if($number>$u['gd']) return "您的AD帐户余额不足";
			if(M('member')->where('id='.$uid)->SetDec('gd',$number)){
				M('member')->execute("update __PREFIX__member set gd2=gd2+".$number." where id=".$uid);
				history(array('uid'=>$uid,'type'=>814,'gd'=>-1*$number,"gd2"=>$number,'矿机AC币转帐'));
				return 1;
			}else{
				return "转帐失败";
			}
		}
	}

	public function dogd1togd2(){
		$uid=I("session.uid",0,'intval');
		$id=I("post.id",0,'intval');
		$F=F("data");
		$v=M("history")->where("type=401 and uid=".$uid." and id=".$id)->find();
		$days=floor((time()-$v['ti'])/(24*3600*$F['gddong']));
        if($days>$F['gdc']) $days=$F['gdc'];
        $key=$days-$v['key2'];
        if($key<0) $key=0;
        $max=$v['gd1']*$v['price']*$F['gdmax'];
        $r=M("gtmarket")->field("price")->where("status=1")->find();
        $price=$r["price"];
        if($key>0){
        	$number=$key*$v['gd1']*pow(2,$v['cai'])*$F['gdm']/100;
        	if($number+$v['key3']>$max) $number=$max-$v['key3'];
        	M("history")->execute("update __PREFIX__history set key2=key2+".$key.",key3=key3+".$number." where id=".$id);
        	M("member")->where("id=".$uid)->SetDec("gd1",$number);
        	M("member")->where("id=".$uid)->SetInc("gd2",$number);
        	history(array("uid"=>$uid,"type"=>815,"gd1"=>-1*$number,"gd2"=>$number,"info"=>"AD1转帐","key1"=>$id,"price"=>$price));
        	return 1;
        }else{
        	return 2;
        }
	}
}