<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
* 财务主控制器
*/
class MoneyController extends BaseController{
	/**
	 * 报表
	 */
	public function index(){
		$F=F("data");
		$per=12;
		$info=formatdate($per);
		$Page = new \Think\Page($info['total'],$per);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$ret=array();
		$M=M("member");
		foreach($info['list'] as $v){
			$regcount=$M->where("regdate like '".$v."%'")->count();
			if(!$regcount) $regcount=0;
			$actcount=$M->where("actdate like '".$v."%'")->count();
			if(!$actcount) $actcount=0;
			$income=$actcount*$F["money"];
			$r=M("history")->field("ifnull(sum(allin),0) as allin")->where("type>100 and type<200 and da='".$v."'")->select();
			$output=$r[0]["allin"];
			$profit=$income-$output;
			$bo=100*$output/$income;
			if($income==0) $bo=100;
			if($income==0&&$output==0)$bo=0;
			$ret[]=array("date"=>$v,"regcount"=>$regcount,"actcount"=>$actcount,"income"=>$income,"output"=>$output,"profit"=>$profit,"bo"=>$bo);
		}
		$this->list=$ret;
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	/**
	 * 奖金明细
	 */
	public function lists(){
		$data=array();
		$ret=array();
		$M = M('history'); // 实例化member对象
		$where="((type>100 and type<200) or type=1003)";
		$un=I('get.un',"");
		if($un){
			$wh=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$wh=$v["id"];
			$where.=" and uid=".$wh;
		}
		$count= count($M->query("select distinct(da) as sdate from __PREFIX__history where ".$where));// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$date = $M->field("distinct(da) as sdate")->where($where)->order("da desc")->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		foreach($date as $v){
			$r=M()->query("select type,ifnull(sum(allin),0) as allin,ifnull(sum(coina),0) as coina,ifnull(sum(coinb),0) as coinb,ifnull(sum(coinc),0) as coinc from __PREFIX__history where 1=1 and ".$where." and da='".$v['sdate']."' group by type");
			$total=array(101=>0,102=>0,103=>0,104=>0,105=>0,106=>0,107=>0,108=>0,109=>0,110=>0,111=>0,1003=>0,'allin'=>0);
			foreach($r as $k){
				$type=$k['type'];
				$allin=$k['allin'];
				$total[$type]+=$allin;
				$total['allin']+=$allin;
			}
			$ret=array("date"=>$v["sdate"],101=>$total[101],102=>$total[102],103=>$total[103],104=>$total[104],105=>$total[105],106=>$total[106],107=>$total[107],108=>$total[108],109=>$total[109],110=>$total[110],111=>$total[111],1003=>$total[1003],"allin"=>$total["allin"]);
			array_push($data,$ret);
		}
		$this->list=$data;
		$this->page=$show;// 赋值分页输出
		$this->un=$un;
		$this->display();
	}

	public function member(){
		$date=I("get.date","");
		$data=array();
		$ret=array();
		$M = M('history'); // 实例化member对象
		$where="((type>100 and type<200) or type=1003) and da='".$date."'";
		$un=I('get.un',"");
		if($un){
			$wh=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$wh=$v["id"];
			$where.=" and uid=".$wh;
		}
		$count= count($M->query("select distinct(uid) as uid from __PREFIX__history where ".$where));// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->field("distinct(uid) as uid")->where($where)->order("da desc")->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		foreach($list as $v){
			$r=M()->query("select type,ifnull(sum(allin),0) as allin,ifnull(sum(coina),0) as coina,ifnull(sum(coinb),0) as coinb,ifnull(sum(coinc),0) as coinc from __PREFIX__history where 1=1 and ".$where." and uid=".$v['uid']." group by type");
			$total=array(101=>0,102=>0,103=>0,104=>0,105=>0,106=>0,107=>0,108=>0,109=>0,110=>0,111=>0,1003=>0,'allin'=>0);
			foreach($r as $k){
				$type=$k['type'];
				$allin=$k['allin'];
				$total[$type]+=$allin;
				$total['allin']+=$allin;
			}
			$ret=array("uid"=>$v['uid'],"date"=>$date,101=>$total[101],102=>$total[102],103=>$total[103],104=>$total[104],105=>$total[105],106=>$total[106],107=>$total[107],108=>$total[108],109=>$total[109],110=>$total[110],111=>$total[111],1003=>$total[1003],"allin"=>$total["allin"]);
			array_push($data,$ret);
		}
		$this->list=$data;
		$this->page=$show;// 赋值分页输出
		$this->un=$un;
		$this->display();
	}
	/**
	 * 奖金明细
	 */
	public function degtail(){
		$uid=I("get.uid",0,"intval");
		$date=I("get.date","");
		$M = M('history'); // 实例化member对象
		$where="da='".$date."' and ((type>100 and type<200) or type=1003)";
		$un=I('get.un',"");
		if($un){
			$wh=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$wh=$v["id"];
			$where.=" and uid=".$wh;
		}
		if($uid)$where.=" and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order("id asc")->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->un=$un;
		$this->display();
	}
	/**
	 * 汇款充值
	 */
	public function remittance(){
		$un=I("get.un","");
		$sn=I("get.sn","");
		$rem=M("remittance");
		$where=array("type"=>0);
		if($sn)$where["sn"]=$sn;
		if($un){
			$where["uid"]=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$where["uid"]=$v["id"];
		}
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->sn=$sn;
		$this->un=$un;
		$this->display();
	}
	/**
	 * b参数:do->审核通过,no->审核不通过
	 */
	public function remsave(){
		$b=I("get.b","");
		$id=I("get.id",0,"intval");
		$error=0;
		$reminfo=M("remittance")->where(array("id"=>$id,"status"=>0))->find();
		if(!$reminfo){
			$edata="记录不存在或已操作";
			$error=1;
		}
		$type=0;
		if(!$error){
			if($b=="do"){
				if(M("member")->where(array("id"=>$reminfo['uid']))->setInc("score",$reminfo["money"])){
					M("remittance")->where(array("id"=>$id))->save(array("status"=>1));
					$edata="审核成功";
					$type=1;
				}else{
					$edata="审核失败";
				}
			}
			if($b=="no"){
				if(M("remittance")->where(array("id"=>$id))->save(array("status"=>2))){
					$edata="操作成功";
					$type=1;
				}else{
					$edata="操作失败";
				}
			}
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
	/**
	 * 汇款充值
	 */
	public function online(){
		$un=I("get.un","");
		$sn=I("get.sn","");
		$rem=M("remittance");
		$where=array("type"=>1);
		if($sn)$where["sn"]=$sn;
		if($un){
			$where["uid"]=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$where["uid"]=$v["id"];
		}
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->sn=$sn;
		$this->un=$un;
		$this->display();
	}

	public function onlinedel(){
		$id=I("get.id",0,"intval");
		$type=0;
		$edata="删除失败";
		if(M("remittance")->where("id=".$id)->delete()){
			$type=1;
			$edata="删除成功";
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
	/**
	 * 系统充值
	 */
	public function cong(){
		$un=I("get.un","");
		$sn=I("get.sn","");
		$rem=M("history");
		$where=array("type"=>1);
		if($sn)$where["sn"]=$sn;
		if($un){
			$where["uid"]=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$where["uid"]=$v["id"];
		}
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->sn=$sn;
		$this->un=$un;
		$this->mbonus=array(20=>"可用ECF",21=>"消费ECF",22=>"复投ECF");
		$this->bonu=array(20=>"coina",21=>"coinb",22=>"coinc");
		$this->display();
	}

	public function congsave(){
		$bc=array(20=>"可用ECF",21=>"消费ECF",22=>"复投ECF");
		$bn=array(20=>"coina",21=>"coinb",22=>"coinc");
		$username=I("post.username","");
		$money=I("post.money",0);
		$type=I("post.type",0,"intval");
		$key1=I("post.key1",0,"intval");
		$error=0;
		$user=M("member")->field("id")->where(array("username"=>$username))->find();
		if(!$user){
			$edata="会员不存在";
			$error=1;
		}else{
			$uid=$user['id'];
		}
		if($money<=0) {
			$edata="请正确填写充值金额";
			$error=1;
		}
		$status=0;
		$str="增加";
		$realmoney=$money;
		if($type){
			$str="减少";
			$realmoney=-1*$money;
		}
		if(!$error){
			$data=array("uid"=>$uid,"type"=>1,"key1"=>$key1,"key2"=>$type,"info"=>"成功".$str."ECF",$bn[$key1]=>$money);
			if($type){
				if(M("member")->where(array("id"=>$uid))->setDec($bn[$key1],$money)){
					$edata="会员[".$username."]减少[".$bc[$key1]."]".$money."成功!";
					$status=1;
					history($data);
				}else{
					$edata="操作失败";
				}
			}else{
				if(M("member")->where(array("id"=>$uid))->setInc($bn[$key1],$money)){
					$edata="会员[".$username."]增加[".$bc[$key1]."]".$money."成功!";
					$status=1;
					history($data);
				}else{
					$edata="操作失败";
				}
			}
		}
		//$this->type=$status;
		$this->type=$status;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
	/**
	 * 会员提现
	 */
	public function cash(){
		$un=I("get.un","");
		$mm=I("get.mm",-1,"intval");
		$rem=M("cash");
		$where="status<3";
		if($mm>-1) $where="status=".$mm;
		if($un){
			$id=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v) $id=$v["id"];
			$where.=" and uid=".$id;
		}
		
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出;
		$this->un=$un;
		$this->mm=$mm;
		$this->display();
	}
	/**
	 * 提现审核
	 */
	public function cashdo(){
		$id=I("get.id",0,"intval");
		$r=M("cash")->where("id=".$id)->find();
		$status=0;
		if(M("cash")->where(array("id"=>$id,"status"=>0))->save(array("status"=>1))){
			$edata="审核成功";
			$status=1;
		}else{
			$edata="审核失败";
		}
		$this->type=$status;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
	/**
	 * 提现批量审核
	 */
	public function allcash(){
		$perm=$_POST['perm'];
		$status=0;
		if(!is_array($perm)){
			$edata="请勿非法操作";
		}else{
			if(M()->execute("update __PREFIX__cash set status=1 where id in(".join($perm,",").")")){
				$edata="审核成功";
				$status=1;
			}else{
				$edata="审核失败";
			}
		}
		$this->type=$status;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
	/**
	 * 提现退回
	 */
	public function cashcancel(){
		$id=I("get.id",0,"intval");
		$r=M("cash")->where("id=".$id)->find();
		$status=0;
		$user=M("cash")->where("id=".$id)->find();
		if(M("cash")->where(array("id"=>$id,"status"=>0))->save(array("status"=>2))){
			M("member")->where("id=".$user["uid"])->setInc("coin",$user["money"]);
			$edata="退回成功";
			$status=1;
		}else{
			$edata="退回失败";
		}
		$this->type=$status;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
	/**
	 * 会员转帐
	 */
	public function transfer(){
		$un=I("get.un","");
		$rem=M("history");
		$where="type=3";
		if($un){
			$id=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v) $id=$v["id"];
			$where.=" and (uid=".$id." or key1=".$id.")";
		}
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function conversion(){
		$un=I("get.un","");
		$rem=M("history");
		$where="type=2";
		if($un){
			$id=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v) $id=$v["id"];
			$where.=" and uid=".$id;
		}
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	/**
	 * 发红利奖
	 */
	public function fahlj(){
		$F=F("data");
		$bonus=F("bonus");
		if(IS_POST){
			$status=0;
			if($F['fhjau']){
				$r=M()->execute("call fafhj()");
				$data="发放完成!";
				$status=1;
			}else{
				$data="当前发放方式为自动发放,如要手动执行,请调整为手动后再进行发放";
			}
			$this->show(alertstr($data,$status),"utf-8");
			exit;
		}
		$fanum=M("financial")->field("ifnull(sum(number*price*money/100),0) as number")->where("doneday<days")->select();
		$rem=M("history");
		$where="type=201";
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$date="未执行..";
		if($list) $date=$list[0]['da'];
		$this->fanum=$fanum[0]["number"];
		$this->date=$date;
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	/**
	 * 发组织奖
	 */
	public function fazzj(){
		$F=F("data");
		if(IS_POST){
			$status=0;
			if($F['zzau']){
				M()->execute("update __PREFIX__financial set total=total+".$F['zzj'].",yu=yu+".$F['zzj']." where total<".$F['zzjtop']);
				M()->execute("update __PREFIX__financial set yu=yu+total-".$F["zzjtop"].",total=".$F['zzjtop']." where total>".$F['zzjtop']);
				$r=M()->execute("call fazzj(".$F['hltx'].")");
				$data="发放完成!";
				$status=1;
			}else{
				$data="当前发放方式为自动发放,如要手动执行,请调整为手动后再进行发放";
			}
			$this->show(alertstr($data,$status),"utf-8");
			exit;
		}
		$tanum=M("financial")->where("total<".$F['zzjtop'])->count();
		$ttotal=$tanum*$F['zzj'];
		$fanum=M("financial")->where("yu>=".$F['hltx']."-".$F['zzj'])->count();
		$total=$fanum*$F['hltx'];
		$rem=M("history");
		$where="type=202";
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$date="未执行..";
		if($list) $date=$list[0]['da'];
		$this->tanum=$tanum;
		$this->ttotal=$ttotal;
		$this->fanum=$fanum;
		$this->total=$total;
		$this->date=$date;
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function fahkj(){
		$F=F("data");
		if(IS_POST){
			$status=0;
			if($F['zrjau']){
				$r=M()->execute("call fazrj");
				$data="发放完成!";
				$status=1;
			}else{
				$data="当前发放方式为自动发放,如要手动执行,请调整为手动后再进行发放";
			}
			$this->show(alertstr($data,$status),"utf-8");
			exit;
		}
		$fanum=M("member")->where("wsum>0")->count();
		if(!$fanum) $fanum=0;
		$to=M("member")->field("ifnull(sum(wsum),0) as wsum")->where("wsum>0")->select();
		$total=$to[0]["wsum"];
		$rem=M("history");
		$where="type=202";
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$date="未执行..";
		if($list) $date=$list[0]['da'];
		$this->date=$date;
		$this->fanum=$fanum;
		$this->total=$total;
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	
	public function market(){
		$t=I('get.t',0,"intval");
		$p=I('get.p',1,"intval");
		$un=I('get.un',"");
		$sn=I('get.sn',"");
		$id=I("get.id",0,"intval");
		$b=I("get.b","");
		$M=M('market');
		if($b){
			if($b=="do"){
				$status=1;	//1 提交到IFRAME,父页面刷新,2当前页面刷新
				if(M("market")->where("id=".$id." and status=2")->select()){
					if(M("market")->where("id=".$id." and status=2 ")->save(array("status"=>3))){
						$v=M("market")->field("rcoin,buyid")->where("id=".$id)->find();
						$rcoin=$v["rcoin"];
						$buyid=$v["buyid"];
						M("member")->where("id=".$buyid)->setInc("score",$rcoin);
						$data="确认收款成功,交易完成";
					}else{
						$data="确认收款失败";
					}
				}else{
					$data="记录不存在或已超时";
				}
				$this->show(alertstr($data,$status),"utf-8");
			}
			if($b=="fan"){
				$status=1;
				if(M("market")->where("id=".$id." and (status=1 or status=2) and lockdate>'".date("Y-m-d H:i:s")."'")->select()){
					if(M("market")->where("id=".$id." and (status=1 or status=2) and lockdate>'".date("Y-m-d H:i:s")."'")->save(array("status"=>0,"buyid"=>0,"lockdate"=>null,"buytime"=>null))){
						$data="确认支付成功,请等待卖家确认收款";
					}else{
						$data="确认支付失败";
					}
				}else{
					$data="记录不存在或已超时";
				}
				$this->show(alertstr($data,$status),"utf-8");
			}
			if($b=="fu"){
				$status=1;
				if(M("market")->where("id=".$id." and status=1 and lockdate>'".date("Y-m-d H:i:s")."'")->select()){
					if(M("market")->where("id=".$id." and status=1 and lockdate>'".date("Y-m-d H:i:s")."'")->save(array("status"=>2))){
						$data="确认支付成功,请等待卖家确认收款";
					}else{
						$data="确认支付失败";
					}
				}else{
					$data="记录不存在或已超时";
				}
				$this->show(alertstr($data,$status),"utf-8");
			}
			if($b=="can"){
				$status=1;	//1 提交到IFRAME,父页面刷新,2当前页面刷新
				if(M("market")->where("id=".$id." and status=0 ")->select()){
					if(M("market")->where("id=".$id." and status=0 ")->save(array("status"=>4))){
						$v=M("market")->field("coin,uid")->where("id=".$id)->find();
						$coin=$v["coin"];
						M("member")->where("id=".$v["uid"])->setInc("coin",$coin);
						$data="取消挂单成功";
					}else{
						$data="取消挂单失败";
					}
				}else{
					$data="记录不存在或已超时";
				}
				$this->show(alertstr($data,$status),"utf-8");
			}
		}
		$where=array();
		if($un){
			$where["uid"]=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$where["uid"]=$v["id"];
		}
		if($sn){
			$where['sn']=$sn;
		}
		if($t>0){
			$where['status']=$t-1;
		}
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->p=$p;
		$this->t=$t;
		$this->un=$un;
		$this->sn=$sn;
		$this->display();
	}

	public function rfhlist(){
		$id=I("get.id",0,"intval");
		$M=M("history");
		$r=$M->field("date")->where("type=201 and id=".$id)->find();
		$where=array("type"=>107,'date'=>$r['date']);
		if($un){
			$where["uid"]=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$where["uid"]=$v["id"];
		}
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->p=$p;
		$this->un=$un;
		$this->display();
	}

	public function zrjlist(){
		$id=I("get.id",0,"intval");
		$M=M("history");
		$r=$M->field("date")->where("type=202 and id=".$id)->find();
		$where=array("type"=>105,'date'=>$r['date']);
		if($un){
			$where["uid"]=0;
			$v=M("member")->field("id")->where(array("username"=>$un))->find();
			if($v)$where["uid"]=$v["id"];
		}
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->p=$p;
		$this->un=$un;
		$this->display();
	}
	/**
	 * 快速奖
	 */
	public function faksj(){
		$list=getksjlist();
		$this->list=$list;
		$this->display();
	}

	public function doksj(){
		$cid=I("get.id",0,"intval");
		$status=0;
		if($cid>0){
			$r=M("history")->field("id")->where("uid=".$cid." and type=205")->find();
			if(!$r){
				history(array('gu'=>0,'coin'=>0,'uid'=>$cid,'type'=>205,'info'=>'第'.$cid.'周'));
				$r=M("history")->field("id")->where("uid=".$cid." and type=205")->find();
				$hisid=$r["id"];
			}else{
				$hisid=$r["id"];
			}
			$ids=getksjids($cid);
			$F=F("data");
			
			foreach ($ids as $v){
				$id=$v['id'];
				$renum=$v['renum'];
				$status=$v['status'];
				$money=$F["ksj"]*$renum;
				if(!$status){
					M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money." where id=".$id);
					M()->execute("update __PREFIX__history set gu=gu+1,coin=coin+".$money." where id=".$hisid);
	        		history(array('allin'=>$money,"key2"=>$renum,'coin'=>$money,'uid'=>$id,'type'=>10,"key1"=>$cid,'info'=>'来源:快速奖'));
				}
			}
			$data="发放完成";
			$status=1;
		}else{
			$data="请勿非法操作";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}


	public function ksjsingle(){
		$cid=I("get.cid",0,"intval");
		$id=I("get.id",0,"intval");
		$renum=I("get.renum",0,"intval");
		$status=0;
		if($cid>0){
			$r=M("history")->field("id")->where("uid=".$cid." and type=205")->find();
			if(!$r){
				history(array('gu'=>0,'coin'=>0,'uid'=>$cid,'type'=>205,'info'=>'第'.$cid.'周'));
				$r=M("history")->field("id")->where("uid=".$cid." and type=205")->find();
				$hisid=$r["id"];
			}else{
				$hisid=$r["id"];
			}

			if(M("history")->field("id")->where("uid=".$id." and type=10 and key1=".$cid)->find()){
				$data="不能重复发放奖金";
			}else{
				$F=F("data");
				if($renum>=$F['ksjt']){
					$money=$F["ksj"]*$renum;
					M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money." where id=".$id);
					M()->execute("update __PREFIX__history set gu=gu+1,coin=coin+".$money." where id=".$hisid);
	        		history(array('allin'=>$money,"key2"=>$renum,'coin'=>$money,'uid'=>$id,'type'=>10,"key1"=>$cid,'info'=>'来源:快速奖'));
					$data="奖金发放成功";
					$status=1;
				}else{
					$data="请勿非法操作";
				}
			}
		}else{
			$data="请勿非法操作";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	public function ksjdetail(){
		$cid=I("get.id",0,"intval");
		$ids=getksjids($cid);
		$this->list=$ids;// 赋值数据集
		$this->cid=$cid;
		$this->display();
	}
	/**
	 * 会员激活时产生的奖金
	 */
	public function fajiang(){
		$un=I("get.un","");
		$where="info like '%".$un."%'";
		$list=M("history")->where($where)->select();
		$this->list=$list;
		$this->un=$un;
		$this->display();
	}

	public function gd(){
		$rs=M('gtmarket')->field("id")->where("status=1")->find();
		$sid=$rs['id'];
		$r=M('gtmarket')->field('id,price,number,donumber,status')->where('type=0 and id>='.($sid-1).' and id<='.($sid+1))->order('id asc')->limit(3)->select();
		$list=$r;
		$this->list=$list;
		$this->display();
	}

	public function gdsave(){
		$id=I("post.id",0,"intval");
		$ky=I("post.ky","");
		$va=I("post.va",0,"intval");
		$r=M("gtmarket")->field("id")->where("id=".$id)->find();
		$status=0;
		if($r){
			if(M('gtmarket')->where("id=".$id)->save(array($ky=>$va))){
				$data="数据已保存";
				$status=1;
			}else{
				$data="操作失败";
			}
		}else{
			$data="操作失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function fakuang(){
		$F=F("data");
		if(IS_POST){
			$status=0;
			if($F['kau']){
				$r=M()->execute("call fakuang");
				$data="发放完成!";
				$status=1;
			}else{
				$data="当前发放方式为自动发放,如要手动执行,请调整为手动后再进行发放";
			}
			$this->show(alertstr($data,$status),"utf-8");
			exit;
		}
		$fanum=M("member")->where("status=1 and gu>0 and ft=0")->count();
		if(!$fanum) $fanum=0;
		$to=M("member")->field("ifnull(sum(gu),0) as gu")->where("status=1 and gu>0 and ft=0")->select();
		$total=$to[0]["gu"];
		$rem=M("history");
		$where="type=201";
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$date="未执行..";
		if($list) $date=$list[0]['da'];
		$this->date=$date;
		$this->fanum=$fanum;
		$this->total=$total;
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function kuangcai(){
		$r=M("member")->field("sum(gd) as gd,sum(gd1) as gd1")->where("status=1  and ft=0 and (gd>0 or gd1>0)")->select();
		$allgd=$r[0]["gd"];
		$allgd1=$r[0]["gd1"];
		$r=M("gtmarket")->where("status>0")->select();
		$c=count($r);
		$list = M("history")->where("type=202")->order('id desc')->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$date="未执行..";
		if($list) $date=$list[0]['da'];
		$this->list=$list;
		$this->date=$date;
		$this->c=$c;
		$this->allgd=$allgd;
		$this->allgd1=$allgd1;
		$this->display();
	}

	public function caisave(){
		ini_set("max_execution_time", 3600);
		$F=F("data");
		$r=M('gtmarket')->where("status=1")->select();
		$status=0;
		if(!$r){
			$r=M("member")->field("sum(gd) as gd,sum(gd1) as gd1,sum(gd2) as gd2")->where("status=1  and ft=0 and (gd>0 or gd1>0 or gd2>0)")->select();
			$allgd=$r[0]["gd"];
			$allgd1=$r[0]["gd1"];
			$allgd2=$r[0]["gd2"];
			history(array('uid'=>0,"type"=>202,"gd1"=>$allgd1,"gd2"=>$allgd2,"info"=>"拆分配送"));
			//M()->execute("INSERT INTO __PREFIX___history (uid,type,gd,gd1,info,date,da) values(0,202,".$allgd.",".$allgd1.",'发放开采AC币','".date("Y-m-d H:i:s")."','".date("Y-m-d")."'");
			//M()->execute("call gdcai(2)");
			M()->execute("update __PREFIX__gtmarket set status=2,donumber=0,number=0");
			M()->execute("update __PREFIX__member set gd1=gd1*2 where (gd>0 or gd1>0 or gd2>0) and status=1 and ft=0");
			//M()->execute("update __PREFIX__member set kgu=kgu*2 where gd>0 and status=1 and ft=0");
			M()->execute("update __PREFIX__history set cai=cai+1 where type=401 and cai<".($F['gdc']+1));
			M("gtmarket")->where('id=1')->save(array('status'=>1));
			updategdmarket(0,1,1);
			$status=1;
			$data="拆分成功";
		}else{
			$data="交易市场未出售完成或价格未上涨到2元,不可以执行拆分";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
}

 ?>