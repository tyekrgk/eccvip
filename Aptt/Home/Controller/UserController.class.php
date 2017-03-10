<?php 
namespace Home\Controller;
use Home\Controller\BaseController;

/**
* 
*/
class UserController extends BaseController{
	
	public function index(){
		/*
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}*/
		$uid=I("session.uid",0);
		$M=M("member");
		$user=$M->field("bank")->where("id=".$uid)->find();
		$bankstr="<select name='bank' id='bank' class='form-control'>";
		$r=M('banklist')->order('re asc,sort asc,id asc')->select();
		foreach($r as $k){
			$bankstr.="<option value='".$k['bank']."' ".($k['bank']==$user['bank']?"selected=selected":"").">".$k['bank'].($k['re']?"":"[优先支付]")."</option>";
		}
		$bankstr.="</select>";
		$this->bank=$bankstr;
		$this->display();
	}

	public function save(){
		$D=D("User");
		$data=$D->usersave();
		$status=0;
		if($data==1){
			$data="修改成功!";
			$status=1;
		}
		if($data==2){
			$data="修改失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
		//$this->display();
	}
	/**
	 * 修改密码
	 */
	public function password(){
		/*
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}*/
		$this->display();
	}

	public function passwordsave(){
		$D=D("User");
		$data=$D->passd();
		$status=0;
		if($data==1){
			$data="修改成功!";
			$status=1;
		}
		if($data==2){
			$data="修改失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
		//$this->display();
	}
	/**
	 * 真实姓名
	 */
	public function realname(){
		$uid=I("session.uid",0);
		$v=M("member")->field('realname')->where("id=".$uid)->find();
		$realname=$v['realname'];
		if($realname){
			$this->show(alertstr("请勿非法操作",2),"utf-8");
			$this->display("Member:index");
			exit;
		}
		$this->display();
	}

	public function realnamesave(){
		$D=D("User");
		$data=$D->realname();
		$status=0;
		if($data==1){
			$data="绑定成功!";
			$status=2;
		}
		if($data==2){
			$data="绑定失败";
		}
		$this->show(alertstr($data,$status,U('index.php/User/bank')),"utf-8");
		//$this->display();
	}
	/**
	 * 银行信息
	 */
	public function bank(){
		$this->redirect("index.php/User/onebank","页面跳转中...");
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$id=I("get.id",0,"intval");
		$M=M('member')->field('realname')->where("id=".$uid)->find();
		$realname=$M['realname'];
		if(!$realname) $this->redirect("index.php/User/realname");
		$data=array();
		$data['id']=0;
		$data['bank']="";
		$data['bankuser']="";
		$data['bankcard']="";
		$data['bankaddress']="";
		$data['status']="";
		if($id){
			$r=M("bank")->field("id,bank,bankuser,bankcard,bankaddress,status")->where(array('id'=>$id,"uid"=>$uid))->find();
			if($r)$data=$r;
		}
		$bankstr="<select name='bank'>";
		$r=M('banklist')->order('re asc,sort asc,id asc')->select();
		foreach($r as $k){
			$bankstr.="<option value='".$k['bank']."' ".($k['bank']==$data['bank']?"selected=selected":"").">".$k['bank'].($k['re']?"":"[优先支付]")."</option>";
		}
		$bankstr.="</select>";
		$banklist=M('bank')->where('uid='.$uid)->order('id desc')->select();
		$this->banklist=$banklist;
		$this->bankstr=$bankstr;
		$this->bank=$data;
		$this->realname=$realname;
		$this->display();
	}

	public function banksave(){
		$D=D("User");
		$data=$D->banksave();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}

		$this->show(alertstr($data,$status),"utf-8");
		//$this->display();
	}
	/**
	 * 密码保护
	 */
	public function question(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$question=I("session.question",0,"intval");
		$b=I("get.b","");
		$r=M("member")->field('q')->where('id='.$uid)->find();
		$q=$r["q"];
		$status=0;
		if($b=="do"){
			$D=D("User");
			$data=$D->answer();
			if($data==1){
				session("question",1);
			}else{
				$this->show(alertstr($data,2),"utf-8");
				exit;
			}
		}else{
			if($q)$this->redirect("index.php/User/answer");
		}
		$this->display();
	}
	public function answer(){
		$uid=I("session.uid",0,"intval");
		$M=M("member");
		$v=$M->field("q,q1,q2,q3")->where("id=".$uid)->find();
		$this->q=$v;
		$this->display();
	}

	public function questionsave(){
		$D=D("User");
		$data=$D->qusave();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}

		$this->show(alertstr($data,$status,U('index.php/User/index')),"utf-8");
	}
	public function promote(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$r=M("member")->field("username")->where("id=".$uid)->find();
		$this->uid=base64_encode($r["username"]);
		$this->display();
	}

	public function onebank(){
		if(!chepass()){	//二级密码验证
			$mm=MODULE_NAME;
		    $cc=CONTROLLER_NAME;
		    $aa=ACTION_NAME;
			$this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
		}
		$uid=I("session.uid",0,"intval");
		$r=M("bank")->where(array("uid"=>$uid))->find();
		$id=0;
		if($r) $id=$r["id"];
		$M=M('member')->field('realname')->where("id=".$uid)->find();
		$realname=$M['realname'];
		$data=array();
		$data['id']=0;
		$data['bank']="";
		$data['bankuser']="";
		$data['bankcard']="";
		$data['bankaddress']="";
		$data['status']="";
		if($id){
			$r=M("bank")->field("id,bank,bankuser,bankcard,bankaddress,status")->where(array('id'=>$id,"uid"=>$uid))->find();
			if($r)$data=$r;
		}
		$bankstr="<select name='bank'>";
		$r=M('banklist')->order('re asc,sort asc,id asc')->select();
		foreach($r as $k){
			$bankstr.="<option value='".$k['bank']."' ".($k['bank']==$data['bank']?"selected=selected":"").">".$k['bank'].($k['re']?"":"[优先支付]")."</option>";
		}
		$bankstr.="</select>";
		$banklist=M('bank')->where('uid='.$uid)->order('id desc')->select();
		$this->banklist=$banklist;
		$this->bankstr=$bankstr;
		$this->bank=$data;
		$this->realname=$realname;
		$this->display();
	}
	public function onebanksave(){
		$D=D("User");
		$data=$D->onebank();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}

		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 会员升级
	 */
	public function update(){
		$uid=I("session.uid",0,"intval");
		$r=M("history")->where("type=203 and uid=".$uid)->order("id desc")->select();
		$this->list=$r;
		$this->display();
	}
	public function updatesave(){
		$D=D("User");
		$data=$D->doupdate();
		$status=0;
		if($data==1){
			$data="操作成功!";
			$status=1;
		}
		if($data==2){
			$data="操作失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	/**
	 * 会员复投
	 */
	public function futou(){
	    $uid=I("session.uid",0,"intval");
	    $this->display();
	}
	/**
	 * 复投操作
	 */
	public function futousave(){
	    $D=D("User");
	    $data=$D->dofutou();
	    $status=0;
	    if($data==1){
	        $data="操作成功!";
	        $status=1;
	    }
	    if($data==2){
	        $data="操作失败";
	    }
	    $this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
	}
	
	public function updatesave_bak(){
		$bonus=F("bonus");
		$uid=I("session.uid",0,"intval");
		$uputype=I("post.utype",0,"intval");
		$r=M("member")->field("utype,score,rid")->where("id=".$uid)->find();
		$utype=$r["utype"];
		$score=$r["score"];
		$rid=$r["rid"];
		$cha=$bonus[$uputype]["money"]-$bonus[$utype]["money"];
		$status=0;
		if($utype<$uputype){
			if($cha<$score){
				M()->execute("update __PREFIX__member set reutype=utype,utype=".$uputype.",score=score-".$cha." where id=".$uid);
				M()->execute("update __PREFIX__member set wsum=wsum+".$money.",resum=resum+".$money.",reyu=reyu+".$money." where id=".$rid);
				history(array("uid"=>$uid,"type"=>203,"score"=>$cha,"key1"=>$utype,"key2"=>$uputype));
				$data="升级成功";
				$status=1;
			}else{
				$data="对不起，您的电子币余额不足，请充值电子币再升级!";
			}
		}else{
			$data="请选择正确的升级级别!";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}

	public function agent(){
		$uid=I("session.uid",0,"intval");
		$M=M("history");
		$where=array("uid"=>$uid,"type"=>41);
		$count= $M->where($where)->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $M->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}

	public function agentsave(){
		$D=D("User");
		$data=$D->doagentsave();
		$status=0;
		if($data==1){
			$data="申请提交成功!";
			$status=1;
		}
		if($data==2){
			$data="申请提交失败";
		}
		$this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
		//$this->display();
	}
	
	public function ga()
	{
	    $uid=I("session.uid",0,"intval");
	    if (empty($_POST)) {
	        $user = M('member')->where(array('id' => $uid))->find();
	        $is_ga = ($user['ga'] ? 1 : 0);
	        $this->assign('is_ga', $is_ga);
	
	        if (!$is_ga) {
	            $ga = new \Common\Ext\GoogleAuthenticator();
	            $secret = $ga->createSecret();
	            session('secret', $secret);
	            $this->assign('Asecret', $secret);
	            $qrCodeUrl = $ga->getQRCodeGoogleUrl($user['username'] . '%20-%20' . $_SERVER['HTTP_HOST'], $secret);
	            $this->assign('qrCodeUrl', $qrCodeUrl);
	            $this->display();
	        }
	        else {
	            $arr = explode('|', $user['ga']);
	            $this->assign('ga_login', $arr[1]);
	            $this->assign('ga_transfer', $arr[2]);
	            $this->display();
	        }
	    }
	    else {
	        $delete = '';
	        $gacode = trim(I('ga'));
	        $type = trim(I('type'));
	        $ga_login = (I('ga_login') == false ? 0 : 1);
	        $ga_transfer = (I('ga_transfer') == false ? 0 : 1);
	
	        if (!$gacode) {
	            $this->error('请输入验证码!');
	        }
	
	        if ($type == 'add') {
	            $secret = session('secret');
	
	            if (!$secret) {
	                $this->error('验证码已经失效,请刷新网页!');
	            }
	        }
	        else {
	            if (($type == 'upd') || ($type == 'del')) {
	                $user = M('member')->where('id = ' . $uid)->find();
	
	                if (!$user['ga']) {
	                    $this->error('还未设置谷歌验证码!');
	                }
	
	                $arr = explode('|', $user['ga']);
	                $secret = $arr[0];
	                $delete = ($type == 'del' ? 1 : 0);
	            }
	            else {
	                $this->error('操作未定义');
	            }
	        }
	
	        $ga = new \Common\Ext\GoogleAuthenticator();
	
	        if ($ga->verifyCode($secret, $gacode, 1)) {
	            $ga_val = ($delete == '' ? $secret . '|' . $ga_login . '|' . $ga_transfer : '');
	            M('member')->save(array('id' => $uid, 'ga' => $ga_val));
	            $this->success('操作成功');
	        }
	        else {
	            $this->error('验证失败');
	        }
	    }
	}
}

 ?>