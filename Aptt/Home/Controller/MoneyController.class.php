<?php 
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 财务主控制器
*/
class MoneyController extends BaseController{
	/**
	 * 奖金列表
	 */
	public function index(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$data=array();
		$ret=array();
		$M = M('history'); // 实例化member对象
		$where="type>100 and type<200 and uid=".$uid;
		$count= count($M->query("select distinct(da) as sdate from __PREFIX__history where ".$where));// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$date = $M->field("distinct(da) as sdate")->where($where)->order("da desc")->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		foreach($date as $v){
			$r=M()->query("select type,ifnull(sum(allin),0) as allin,ifnull(sum(coin),0) as coin,ifnull(sum(shui),0) as shui,ifnull(sum(rebuy),0) as rebuy from __PREFIX__history where 1=1 and type>100 and type<200  and da='".$v['sdate']."' and uid=".$uid." group by type");
			$total=array(101=>0,102=>0,103=>0,104=>0,105=>0,106=>0,107=>0,108=>0,109=>0,110=>0,111=>0,'allin'=>0,'coin'=>0,'rebuy'=>0,'gp'=>0,'shui'=>0);
			foreach($r as $k){
				$type=$k['type'];
				$allin=$k['allin'];
				$coin=$k['coin'];
				$rebuy=$k['rebuy'];
				$shui=$k['shui'];
				$total[$type]+=$allin;
				$total['allin']+=$allin;
				$total['coin']+=$coin;
				$total['shui']+=$shui;
				$total['rebuy']+=$rebuy;
			}
			$ret=array("date"=>$v["sdate"],101=>$total[101],102=>$total[102],103=>$total[103],104=>$total[104],105=>$total[105],106=>$total[106],107=>$total[107],108=>$total[108],109=>$total[109],110=>$total[110],111=>$total[111],"allin"=>$total["allin"],"coin"=>$total['coin'],"rebuy"=>$total["rebuy"],"glf"=>$total["shui"]);
			array_push($data,$ret);
		}
		$this->list=$data;
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function degtail(){

		$uid=I("session.uid",0,"intval");
		$date=I("get.date","");
		$M = M('history'); // 实例化member对象
		$where="da='".$date."' and type>100 and type<200 and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order("id asc")->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	/**
	 * 提现
	 */
	public function cash(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$user=M("member")->field("realname")->where("id=".$uid)->find();
		$realname=$user["realname"];
		$r=M("bank")->where('uid='.$uid)->order('id desc')->select();
		$bank="<select name='bankid'>";
		foreach($r as $k){
			$bank.="<option value='".$k['id']."'>".$k['bank']." ".$realname." ".$k["bankcard"]."</option>";
		}
		$bank.="</select>";
		$rem=M("cash");
		$where=array("uid"=>$uid);
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->banklist=$bank;
		$this->display();
	}

	public function cashsave(){
		$D=D("Money");
		$data=$D->cashsave();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败!";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}

	public function cashcancel(){
		$D=D("Money");
		$data=$D->cashcan();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败!";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 转帐
	 */
	public function transfer(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$rem=M("history");
		$where="(uid=".$uid." or key1=".$uid.") and type=3";
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->uid=$uid;// 
		$this->display();
	}
	public function transfersave(){
		$D=D("Money");
		$data=$D->trasave();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败!";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 转换
	 */
	public function conversion(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$rem=M("history");
		$where=array("uid"=>$uid,"type"=>2);
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function conversionsave(){
		$D=D("Money");
		$data=$D->consave();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败!";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 汇款
	 */
	public function remittance(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$user=M("member")->field("username")->where("id=".$uid)->find();
		$username=$user["username"];
		$M=M("coll");
		$coll=$M->where("status=0")->order("id asc")->select();
		$i=0;
		$collstr="";
		foreach($coll as $v){
			$i++;
			$collstr.="<span style='font-weight:bold'>付款方式".$i."</span><br>银行:".$v["bank"]." 开户行地址:".$v["bankaddress"]."<br>开户名:".$v["bankuser"]." 帐号:".$v["bankcard"]."<br>";
		}
		$rem=M("remittance");
		$where=array("uid"=>$uid,"type"=>0);
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->collstr=$collstr;
		$this->username=$username;
		$this->display();
	}
	public function remittancesave(){
		$D=D("Money");
		$data=$D->remsave();
		$status=0;
		if($data==1){
			$data="充值信息提交成功!";
			$status=1;
		}
		if($data==2){
			$data="充值信息提交失败!";
		}
		$this->show(alertstr($data,$status),"utf-8");
		
	}
	/**
	 * 在线充值
	 */
	public function online(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$user=M("member")->field("username")->where("id=".$uid)->find();
		$username=$user["username"];
		$rem=M("remittance");
		$where=array("uid"=>$uid,"type"=>1);	//type: 0汇款 1第三方在线支付
		$count= $rem->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->collstr=$collstr;
		$this->username=$username;
		$this->display();
	}
	/**
	 * 确认支付 
	 */
	public function onlineche(){
		$F=F("data");
		$money=I("post.money",0);
		if($F['mer_status']){
			$this->show(alertstr("在线支付已关闭，您可以使用汇款充值进行充值",0,U('index.php/Money/remittance')),"utf-8");
			exit;
		}
		if($money<1){
			$this->show(alertstr("你输入的金额有误",0,U('index.php/Money/online')),"utf-8");
			exit;
		}
		$this->money=$money;
		$this->display();
	}

	public function jiang(){
		$uid=I("session.uid",0,"intval");
		$F=F('data');
		$bonus=F('bonus');
		$r=M("history")->field("id")->where("type=109 and uid=".$uid)->find();
		$k=0;
		if($r)$k=1;
		$r=M("member")->field("resum,utype")->where("id=".$uid)->find();
		$key=floor($r["resum"]/$bonus[$r["utype"]]["money"]);
    	$zsj=0;
        if($key>=$F['zsmoney1']) $zsj=$F["zsj1"];
        if($key>=$F['zsmoney2']) $zsj=$F["zsj2"];
        if($key>=$F['zsmoney3']) $zsj=$F["zsj3"];
        if($key>=$F['zsmoney4']) $zsj=$F["zsj4"];
        if($key>=$F['zsmoney5']) $zsj=$F["zsj5"];
        if($key>=$F['zsmoney6']) $zsj=$F["zsj6"];
        $this->key=$key;	//倍数
        $this->zsj=$zsj;	//奖金比例
		$this->k=$k;
		$this->display();
	}
	/**
	 * 发放直推贡献奖
	 */
	public function fazt(){
		$F=F("data");
		$uid=I("session.uid",0,"intval");
		$r=M("member")->field("reyu")->where("id=".$uid)->find();
		$data="恭喜您奖金领取成功，请进入奖金明细查询，谢谢！";
		$status=0;
		if($r["reyu"]<$F["remoney"]){
			$data="对不起，您的直推业绩不足，无法领取奖金，请继续努力，谢谢!";
		}else{
			$money=$F["rej"];
			M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money.",reyu=reyu-".$F["remoney"]." where id=".$uid);
    		history(array('allin'=>$money,'coin'=>$money,'uid'=>$uid,'type'=>108,'info'=>'来源:'.prize(108)));
			$status=1;
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 发放终身成就奖s
	 */
	public function fazs(){
		$F=F("data");
		$bonus=F("bonus");
		$uid=I("session.uid",0,"intval");
		$r=M("member")->field("resum,utype")->where("id=".$uid)->find();
		$data="恭喜您奖金领取成功，请进入奖金明细查询，谢谢！";
		$status=0;
		$r=M("member")->where("uid=".$uid." and type=109")->find();
		if($r){
			$data="终身成就奖已领取，您无法再次领取奖金，谢谢！";
		}else{
			$key=floor($r["resum"]/$bonus[$r["utype"]]["money"]);
	    	$zsj=0;
	        if($key>=$F['zsmoney1']) $zsj=$F["zsj1"];
	        if($key>=$F['zsmoney2']) $zsj=$F["zsj2"];
	        if($key>=$F['zsmoney3']) $zsj=$F["zsj3"];
	        if($key>=$F['zsmoney4']) $zsj=$F["zsj4"];
	        if($key>=$F['zsmoney5']) $zsj=$F["zsj5"];
	        if($key>=$F['zsmoney6']) $zsj=$F["zsj6"];
	        if($zsj){
	            $money=$bonus[$r["utype"]]["money"]*$zsj/100;
	            M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money.",zsj=1 where id=".$uid);
	            history(array('allin'=>$money,'coin'=>$money,'uid'=>$uid,'type'=>109,'info'=>'来源:'.prize(109)));
	        	$status=1;
	        }else{
	        	$data="恭喜您奖金领取成功，请进入奖金明细查询，谢谢！";
	        }
	    }
		$this->show(alertstr($data,$status),"utf-8");
	}

	public function bonus(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$data=array();
		$ret=array();
		$M = M('history'); // 实例化member对象
		$where="((type>100 and type<200) or type=1003) and uid=".$uid;
		$count= count($M->query("select distinct(da) as sdate from __PREFIX__history where ".$where));// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$date = $M->field("distinct(da) as sdate")->where($where)->order("da desc")->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		foreach($date as $v){
			$r=M()->query("select type,ifnull(sum(allin),0) AS allin,ifnull(sum(coina),0) as coina,ifnull(sum(coinb),0) as coinb,ifnull(sum(coinc),0) as coinc from __PREFIX__history where ".$where." and da='".$v['sdate']."' group by type");
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
		$this->display();
	}

	public function bt(){
		$uid=I('session.uid',0,'intval');
		$M=M('history');
		//$where="(type=802 and uid=".$uid.") or (type=803 and toid=".$uid.")";
		$where="((type>100 and type<200) or (type>805 and type<810) or (type=1 and key1=1)) and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function btzhuan(){
		$this->display();
	}

	public function btsave(){
		$D=D("Money");
		$data=$D->dobtsave();
		$status=0;
		if($data==1){
			$data="CT帐户转帐成功!";
			$status=1;
		}
		if($data==2){
			$data="CT帐户转帐失败!";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function bt1(){
		$uid=I('session.uid',0,'intval');
		$M=M('history');
		//$where="(type=802 and uid=".$uid.") or (type=803 and toid=".$uid.")";
		$where="(type=801 or type=802 or type=803 or type=804 or type=805 or type=997 or type=808 or (type=1 and key1=2)) and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function bt1zhuan(){
		$this->display();
	}
	public function bt1save(){
		$D=D("Money");
		$data=$D->dobt1save();
		$status=0;
		if($data==1){
			$data="CT1帐户转帐成功!";
			$status=1;
		}
		if($data==2){
			$data="CT1帐户转帐失败!";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	public function bt2(){
		$uid=I('session.uid',0,'intval');
		$M=M('history');
		//$where="(type=802 and uid=".$uid.") or (type=803 and toid=".$uid.")";
		$where="((type>100 and type<200) or type=804 or (type=1 and key1=3)) and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function bt2zhuan(){
		$this->display();
	}
	public function bt2save(){
		$D=D("Money");
		$data=$D->dobt2save();
		$status=0;
		if($data==1){
			$data="CT2帐户转换成功!";
			$status=1;
		}
		if($data==2){
			$data="CT2帐户转换失败!";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	public function gtzhuan(){
		$this->display();
	}
	public function gt(){
		$uid=I('session.uid',0,'intval');
		$M=M('history');
		//$where="(type=802 and uid=".$uid.") or (type=803 and toid=".$uid.")";
		$where="(type=402 or (type=1 and key1=5)) and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function gt1(){
		$uid=I('session.uid',0,'intval');
		$M=M('history');
		//$where="(type=802 and uid=".$uid.") or (type=803 and toid=".$uid.")";
		$where="((type>808 and type<812) or (type=1 and key1=5) or type=816) and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function gtsave(){
		$D=D("Money");
		$data=$D->dogtsave();
		$status=0;
		if($data==1){
			$data="AT帐户转帐成功!";
			$status=1;
		}
		if($data==2){
			$data="AT帐户转帐失败!";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}

	public function kuang(){
		$uid=I('session.uid',0,'intval');
		$M=M('history');
		//$where="(type=802 and uid=".$uid.") or (type=803 and toid=".$uid.")";
		$where="((type>811 and type<815) or (type=1 and key1=6)) and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function ly(){
		$uid=I('session.uid',0,'intval');
		$M=M('history');
		//$where="(type=802 and uid=".$uid.") or (type=803 and toid=".$uid.")";
		$where="(type=809 or type=816 or type=817 or (type=1 and key1=9)) and uid=".$uid;
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function gt1zhuan(){
		$this->display();
	}
	public function gt1save(){
		$D=D("Money");
		$data=$D->dogt1save();
		$status=0;
		if($data==1){
			$data="AT1帐户转帐成功!";
			$status=1;
		}
		if($data==2){
			$data="AT1帐户转帐失败!";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
}
 ?>