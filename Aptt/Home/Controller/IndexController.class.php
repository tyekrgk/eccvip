<?php
namespace Home\Controller;
use Home\Controller\BaseController;
class IndexController extends BaseController {
    public function index(){
        //$this->show('这里只是测试','utf-8');
        $uid=I("session.uid",0,"intval");
        $news=M("news")->order("id desc")->limit(6)->select();
        $message=M("message")->where("uid=".$uid." and type=1")->order("id desc")->limit(6)->select();
        $c=0;
        $datelist=array();
        $value=array();
        $days=15;
        $r=M('highcharts')->where("type=0 and date<'".date('Y-m-d',strtotime('-'.$days.' day'))."'")->order('id desc')->limit(1)->select();
        $F=F('data');
        //$price=$F['gdprice'];
        $price = 2;
        if($r) $price=$r[0]['price'];
        for($i=$days;$i>=0;$i--){//找出近16天的价格趋势
            $date=date("Y-m-d",time()-$i*24*3600);
            array_push($datelist, "'".$date."'");
            $r=M('highcharts')->field('price')->where("date='".$date."'")->find();
            if($r) $price=$r['price'];
            array_push($value,$price);
        }
        $r = $this->iplan;
        $kuang = array('status'=>0,'yesterday'=>0,'output'=>0,'resdays'=>0);//矿机产量
        if($r){
            $kuang['status'] = $r['period'];
            $yr = M('history')->where(array('type'=>1003,'uid'=>$uid,'da'=>date('Y-m-d',strtotime('-1 day'))))->find();//昨天产量
            if($yr){
                $kuang['yesterday'] = $yr['allin'];
            }
            $kuang['output'] = $r['period']<=0||$r['investamount']<=0?0:numberformat(($r['investamount']+$r['investamount']*$r['rate']/100)/$r['period']);//日产量能力
            $kuang['resdays'] = $r['period']-$r['periodnow'];//剩余时间
        }
        $this->kuang=$kuang;
        $this->date=join(",",$datelist);
        $this->value=join(",",$value);
        $this->c=$c;
        $this->list=$news;
        $this->message=$message;
        $this->display();
    }
    /**
     * 签到
     */
    public function qiandao(){
        $uid=I("session.uid",0,"intval");
        $r=M("history")->field("id")->where("uid=".$uid." and type=103 and da='".date("Y-m-d")."'")->find();
        $status=0;
        if($r){
            $data="您今天已签到!";
        }else{
            $money=faqdj();
            $data="恭喜您签到成功，获得奖金".$money."$ ，请进入奖金明细查收！";
        }
        $this->show(alertstr($data,$status,U("index.php/Index/index")),"utf-8");
    }
    public function logout(){
    	session('uid',null);
		session('username',null);
		session("iuhivwszv",null);
		$this->show(alertstr("成功退出系统...",0,U("index.php/Login/index")),"utf-8");
		//$this->redirect("index.php/Login/index","成功退出...");
    }

    public function perm(){
        $this->show(alertstr("您的帐号未激活,不能使用此功能,请尽快激活帐号!",0,U("index.php/Index/index")),"utf-8");
    }
}