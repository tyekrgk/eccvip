<?php 
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 会员列表
*/
class MemberController extends BaseController{
	
	public function index(){
		$this->display();
	}
	
	public function reg(){
		$fname=I("get.fname","");
		$line=I("get.line",0,"intval");
		$rand=rand(111111,999999);
		$r=M("member")->field("id")->where(array("username"=>$fname))->select();
		if(!$r)$fname="";
		$newname=newname();
		$this->rand=$rand;
		$this->newname=$newname;
		$this->fname=$fname;
		$this->line=$line;
		$this->display();
	}
	function team(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,'intval');
		$id=I("get.id",0,'intval');
		$un=I("post.un","");
		if($un){
			$r=M("member")->field("id")->where(array("username"=>$un))->find();
			if($r){
				$key=chelinetop($r["id"],$uid);
			}else{
				$key=0;
			}
			if($key){
				$id=$r["id"];
			}else{
				$this->show(alertstr("查询失败,会员不存在或不在伞下",0,U("index.php/Member/team")),"utf-8");
			}
		}
		$st=1;
		if(!$id || $uid==$id) $st=0;
		$keyid=$uid;
		if($id) $keyid=$id;
		//$teamstr=teamarray($id);
		$teamstr2=teamarray2($id);
		//$this->teamstr=$teamstr;
		$this->teamstr2=$teamstr2;
		$this->st=$st;
		$this->un=$un;
		$this->display();
	}

	function save(){
		//showalert("测试中断");
		$username=I("post.username","");
		$upd1=I("post.p1","");
		$upd2=I("post.p2","");
		$D=D("Member");
		$data=$D->regsave();
		$status=0;
		if($data==1){
			$data="注册成功!请牢记您的帐号和密码:".$username.",".$upd1.",".$upd2;
			$status=1;
		}
		if($data==2){
			$data="注册失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	public function zhitui(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$r=M("member")->where("status=1 and rid=".$uid." and actweek=".date('W'))->count();
		$weekc=0;
		if($r)$weekc=$r;	//周推荐人数

		$M = M('member'); // 实例化member对象
		$where=array("rid"=>$uid);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->field("username,nick,qq,nick,status,tel,regdate,utype")->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->weekc=$weekc;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display(); // 输出模板
	}
	/**
	 * 推荐图谱
	 */
	public function recommand(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,'intval');
	    $id=I('get.id',0,'intval');
	    $id=$id?$id:$uid;
	    $un=I('post.un',"");
	    if($un){
	        $v=M('member')->field('id')->where(array('username'=>$un))->select();
	        if($v){
	            $id=$v[0]['id'];
	        }else{
	            $id=1;
	        }
	    }
	    $st=0;
	    if($id>$uid) $st=1;
		$idsstr=getrecommand();
		if($idsstr==1){
			$this->show(alertstr("您要查找的会员不存在",2),"utf-8");
			$this->display();
			exit;
		}
		$this->idsstr=$idsstr;
		$this->un=$un;
		$this->st=$st;
		$this->uid=$uid;
		$this->display();
	}

	public function active(){
		$uid=I("session.uid",0,"intval");
		$u=M("member")->field("score")->where("id=".$uid)->find();
		$score=$u["score"];
		$F=F("data");
		$status=0;
		if($F["money"]>$score){
			$data="电子币不足,激活失败";
		}else{
			$D=D("Rule");
			$data=$D->updateuser($uid);
			$status=0;
			if($data==1){
				M("member")->where("id=".$uid)->setDec("score",$F["money"]);
				$data="会员激活成功!";
				$status=1;
			}
			if($data==2){
				$data="会员激活失败";
			}
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 理财帐户
	 */
	public function financial(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$M=M("financial");
		$where=array("uid"=>$uid);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order(' id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display(); // 输出模板
	}

	public function financialsave(){
		$uid=I("session.uid",0,"intval");
		$number=I("post.number",0,"intval");
		$F=F("data");
		$D=D("Member");
		$data=$D->finsave();
		$status=0;
		$M=M("member")->field("username")->where("id=".$uid)->find();
		if($data==1){
			$money=$F["price"]*$number;
			M("member")->where("id=".$uid)->setDec("score",$money);
			//fatjj($uid,"理财帐户");
			fagtjj($uid,$money);	//股权推荐奖
			fagbdj($uid,$money);	//报单奖
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}

	public function finantx(){
		$uid=I("session.uid",0,"intval");
		$F=F("data");
		$D=D("Member");
		$data=$D->fintx();
		$status=0;
		if($data==1){
			$data="已经功提现到奖金币!";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 报单中心
	 */
	public function agent_bak(){
		/*
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}*/
		$uid=I("session.uid",0,"intval");
		$id=I("get.id",0,"intval");
		$p=I("get.p",1,"intval");
		$b=I("get.b","");
		$M=M("member");
		if($b=='del'){
			if($M->field("id")->where("status=0  and id=".$id)->find()){
				if($M->where("status=0 and id=".$id)->delete()){
					$data="删除会员成功!";
				}else{
					$data="删除会员失败!";
				}
			}else{
				$data="您只能删除属于您的报单中心的未激活的会员!";
			}
			$this->show(alertstr($data,1),"utf-8"); 
			exit;
		}
		$ids=getjihuoids(array(0=>$uid));
		krsort($ids);
		$count=count($ids);// 查询满足要求的总记录数
		$ps=12;
		$Page = new \Think\Page($count,$ps);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list =redojihuoids($ids,$p,$ps);// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display(); // 输出模板
	}

	public function agent(){
		$uid=I("session.uid",0,"intval");
		$id=I("get.id",0,"intval");
		$p=I("get.p",1,"intval");
		$b=I("get.b","");
		$M=M("member");
		if($b=='del'){
			if($id==$uid){
				$data="您不可以删除自己的帐号";
			}else{
				if($M->field("id")->where("(rid=".$uid." or aid=".$uid.") and status=0 and id=".$id)->find()){
					if($M->where("status=0 and id=".$id)->delete()){
						$data="删除会员成功!";
					}else{
						$data="删除会员失败!";
					}
				}else{
					$data="您只能删除属于您的报单中心或直接推荐的未激活的会员!";
				}
			}
			$this->show(urldecode(json_encode(array('error'=>1,'info'=>urlencode($data)))),"utf-8");
			exit;
		}
		$M=M('member');
		$where="status=0 and (rid=".$uid." or aid=".$uid." or id=".$uid.")";
		$count=$M->where($where)->count();
		$ps=15;
		$Page = new \Think\Page($count,$ps);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
        $list = $M->field("id,username,regdate,realname,dan,status,nick,utype,aid")->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function agentlist(){
		$uid=I("session.uid",0,"intval");
		$M=M('member');
		$where="rid=".$uid;
		$count=$M->where($where)->count();
		$ps=15;
		$Page = new \Think\Page($count,$ps);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
        $list = $M->field("id,username,regdate,actdate,realname,dan,status,nick,rid,fid,utype")->where($where)->order('id asc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	public function agentview(){
		$uid=I("session.uid",0,'intval');
		$id=I("get.id",0,"intval");
		$data=M('member')->where("id=".$id." and rid=".$uid)->find();
		if(!$data){
			$this->show(alertstr("记录不存在",2),"utf-8");
			exit;
		}
		$this->data=$data;
		$this->display();
	}

	public function agentactive(){
		$id=I("post.id",0,"intval");
		$uid=I("session.uid",0,"intval");
		$u=M("member")->field("coina")->where("id=".$uid)->find();
		$au=M("member")->field("username,dan,utype")->where("id=".$id)->find();//被激活的用户
		//$mem=M("member")->field("utype")->where("id=".$id)->find();
		$score=$u["coina"];//推荐人的coina账户
		$F=F("data");
		$bonus=F("bonus");
		$coin=money2coin($bonus[$au['utype']]["money"]);//需要的coin
		$status=0;
		if($coin>$score){
			$data="可用ECF帐户余额不足,激活失败";
		}else{
			$D=D("Rule");
			$data=$D->updateuser($id);
			if($data==1){
				M("member")->where("id=".$uid)->setDec("coina",$coin);
				history(array("type"=>805,"uid"=>$uid,"coina"=>(-1*$coin),"allin"=>(-1*$coin),"info"=>"激活能量:".$au['username']));
				$data="激活成功!";
				$status=1;
			}
			if($data==2){
				$data="激活失败";
			}
		}
		$this->show(urldecode(json_encode(array('error'=>1,'info'=>urlencode($data)))),"utf-8");
	}
	/**
	 * 申请报单中心
	 */
	public function apply(){
		$uid=I("session.uid",0,"intval");
		$r=M("member")->field("isagent")->where("id=".$uid)->find();
		//if($r["isagent"]) $this->redirect("index.php/Member/agent","页面跳转中...");
		$r=M("history")->field("id")->where("status=0 and uid=".$uid." and type=10")->find();
		$k=0;
		if($r) $k=1;
		$this->k=$k;
		$this->display();
	}

	public function applysave(){
		$D=D("Member");
		$data=$D->apply($id);
		$status=0;
		if($data==1){
			$data="您的申请已提交,请耐心等待管理员审核!";
			$status=1;
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
}
 ?>