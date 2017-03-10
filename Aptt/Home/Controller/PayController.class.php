<?php 
namespace Home\Controller;
use Think\Controller;
/**
* 第三方支付
*/
class PayController extends Controller{
	Public function _initialize(){
		$uid=I("session.uid",0,"intval");
	    $username=I("session.username","");
	    $key=I("session.iuhivwszv","");
		if(!F("data")){
			$M=M("coin");
			$data=$M->where(array('id'=>1))->find();
			F("data",$data);
		}
		$F=F("data");
		M("market")->where("status=1 and buyid>0 and lockdate<'".date("Y-m-d H:i:s",time())."'")->save(array("status"=>0,"buyid"=>0,"lockdate"=>null,"buytime"=>null));
		deletemarket();
		$uinfo=M('member')->field("id,username,isagent,coin,score,rebuy,status,nick,allin,star,regdate,actdate")->where("id=".$uid)->find(); 
		$web=M("web")->where("id=1")->find();
		if($web["status"]) $this->redirect("index.php/Close/index","页面跳转中...");
		$this->web=$web;
		$this->uinfo=$uinfo;
		$this->coinset=$F;
	}
	public function index(){
		$this->display();
	}

	public function onlineredirect(){
		import("Common.Org.MbPay");	
		$F=F("data");
		$uid=I("session.uid",0,"intval");
		$money=I("post.money",0);
		if($F['mer_status']){
			$this->show(alertstr("在线支付已关闭，您可以使用汇款充值进行充值",0,U('index.php/index/index')),"utf-8");
			exit;
		}
		if($money<1){
			$this->show(alertstr("你输入的金额有误",0,U('index.php/Money/online')),"utf-8");
			exit;
		}
		$sn=creatsn("PN");
		$data['sn']=$sn;
		$data['uid']=$uid;
		$data['money']=$money;
		$data['type']=1;
		$data['date']=date("Y-m-d H:i:s");
		if(!M('remittance')->data($data)->add()){
			$this->show(alertstr("生成订单失败!",0,U('index.php/Money/online')),"utf-8");
			exit;
		}

		$data = "";
		// 商户APINMAE，WEB渠道一般支付
		$data['apiName'] = "WEB_PAY_B2C";
		// 商户API版本
		$data['apiVersion'] = "1.0.0.0";
		// 商户在Mo宝支付的平台号
		$data['platformID'] = $F["mer_code"];
		// Mo宝支付分配给商户的账号
		$data['merchNo'] = $F["mer_code1"];
		$mbp_key = $F["mer_key"];
		//$mobaopay_gateway = "https://trade.mobaopay.com/cgi-bin/netpayment/pay_gate.cgi";
		$mobaopay_gateway = "http://pay.kksau88.top";
		// 商户通知地址
		$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') ? 'https://' : 'http://';
			  $url .= str_ireplace('localhost', '127.0.0.1', $_SERVER['HTTP_HOST']);
			//支付结果成功返回的商户URL
		$Merchanturl = $url.U(C("FILE_IN").'/Pay/payreturn');
		$data['merchUrl'] = $Merchanturl;
		// 银行代码，不传输此参数则跳转Mo宝收银台
		$data['bankCode'] = "Mobaopay";
		
		//商户订单号
		$data['orderNo'] = $sn;
		// 商户订单日期
		$data['tradeDate'] = date("Ymd");;
		// 商户交易金额
		$data['amt'] = $money;
		// 商户参数
		$data['merchParam'] = "在线充值";
		// 商户交易摘要
		$data['tradeSummary'] = "在线充值";
		
		// 对含有中文的参数进行UTF-8编码
		// 将中文转换为UTF-8
		if(!preg_match("/[\xe0-\xef][\x80-\xbf]{2}/", $data['merchUrl']))
		{
	  	$data['merchUrl'] = iconv("GBK","UTF-8", $data['merchUrl']);
		}
		
		if(!preg_match("/[\xe0-\xef][\x80-\xbf]{2}/", $data['merchParam']))
		{

	  	$data['merchParam'] = iconv("GBK","UTF-8", $data['merchParam']);
		}

		if(!preg_match("/[\xe0-\xef][\x80-\xbf]{2}/", $data['tradeSummary']))
		{
	  	$data['tradeSummary'] = iconv("GBK","UTF-8", $data['tradeSummary']);
		}
		
		// 初始化
		$cMbPay = new MbPay($mbp_key, $mobaopay_gateway);
		// 准备待签名数据
		$str_to_sign = $cMbPay->prepareSign($data);
		// 数据签名
		$sign = $cMbPay->sign($str_to_sign);
		$data['signMsg'] = $sign;
		// 生成表单数据
		$sHtmlText=$cMbPay->buildForm($data, $mobaopay_gateway);
		$this->sHtmlText=$sHtmlText;
		$this->display();
	}

	public function payreturn(){
		import("Common.Org.MbPay");	
		$F=F('data');

		//----------------------------------------------------
		//  接收数据
		//  Receive the data
		//----------------------------------------------------
		$data = "";
		// 商户APINMAE，WEB渠道一般支付
		$data['apiName'] = "WEB_PAY_B2C";
		// 商户API版本
		$data['apiVersion'] = "1.0.0.0";
		// 商户在Mo宝支付的平台号
		$data['platformID'] = $F["mer_code"];
		// Mo宝支付分配给商户的账号
		$data['merchNo'] = $F["mer_code1"];
		$mbp_key = $F["mer_key"];
		$mobaopay_gateway = "https://trade.mobaopay.com/cgi-bin/netpayment/pay_gate.cgi";
		$data['apiName'] = $_REQUEST["apiName"];
		// 通知时间
		$data['notifyTime'] = $_REQUEST["notifyTime"];
		// 支付金额(单位元，显示用)
		$data['tradeAmt'] = $_REQUEST["tradeAmt"];
		// 商户号
		$data['merchNo'] = $_REQUEST["merchNo"];
		// 商户参数，支付平台返回商户上传的参数，可以为空
		$data['merchParam'] = $_REQUEST["merchParam"];
		// 商户订单号
		$data['orderNo'] = $_REQUEST["orderNo"];
		// 商户订单日期
		$data['tradeDate'] = $_REQUEST["tradeDate"];
		// Mo宝支付订单号
		$data['accNo'] = $_REQUEST["accNo"];
		// Mo宝支付账务日期
		$data['accDate'] = $_REQUEST["accDate"];
		// 订单状态，0-未支付，1-支付成功，2-失败，4-部分退款，5-退款，9-退款处理中
		$data['orderStatus'] = $_REQUEST["orderStatus"];
		// 签名数据
		$data['signMsg'] = $_REQUEST["signMsg"];


		$cMbPay = new MbPay($mbp_key, $mobaopay_gateway);
		// 准备准备验签数据
		$str_to_sign = $cMbPay->prepareSign($data);
		// 验证签名
		$resultVerify = $cMbPay->verify($str_to_sign, $data['signMsg']);
		//var_dump($data);
		//p($_request);
		//echo "<br>";
		if ($resultVerify) 
		{
			if ('1' == $_REQUEST["notifyType"] && 0) {
				$url = "notify.php";
				Header("Location: $url");
				return true;
			}

			if($data['orderStatus']=='1'){
				//################################################# 
			    //交易成功，此处可增加商户逻辑
			    //################################################# 
				$r=M('remittance')->field('id,uid,money,status,sn')->where("type=1 and sn='".$data['orderNo']."'")->find();
				if($r){
					if($r['money']==$data['tradeAmt']){
						if($r['status']==0){
							if(M('remittance')->where("id=".$r['id'])->save(array("status"=>1,"info"=>$data['accNo'],'dodate'=>date("Y-m-d H:i:s")))){
								//$data=array();
								//for($i=0;$i<$r['number'];$i++){
								//	$sn=randsn();
								//	$data[]=array("uid"=>$r['uid'],'sn'=>$sn,'type'=>0,'paysn'=>$r['sn']);
								//}
								if(M("member")->where("id=".$r['uid'])->SetInc("bt",$r['money'])){
									$data= "支付成功";
									$status=1;
								}else{
									$data= "充值失败,请联系系统管理员";
								}
							}else{
								
								$data= "充值失败,请联系系统管理员";
							}
						}else{
							$data= "支付成功";
						}
					}else{
						$data= "支付失败";
					}
				}else{

					$data= "支付失败";
				}

			}else{
				$data= "支付失败";
			}
		}
		else
		{
			// 签名验证失败
			$data="支付失败";
		}
		$this->show($data,"utf-8");
	}
}
 ?>