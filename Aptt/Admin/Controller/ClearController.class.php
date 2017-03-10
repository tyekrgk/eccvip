<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
* 主体
*/
class ClearController extends BaseController{
	
	public function index(){

		$this->display();	
	}

	public function save(){
		$type=0;
		$F=F("data");
		// 	wrec 周推荐	wact 周激活	wee 当前周数	mrec 	mact 	mon 	msum
		if(IS_POST){
			M()->execute("delete from __PREFIX__member where id>1");
			M()->execute("update __PREFIX__member set money=".$F['money'].",BT=0,BT2=0,BT1=0,GT=0,GT1=0,GD=0,GD1=0,GD2=0,allin=0,coin=0,score=0,rebuy=0,dpdaysum=0,jdjsum=0,regdate='".date("Y-m-d H:i:s",time()-24*3600-358)."',actdate='".date("Y-m-d H:i:s",time()-24*3600)."',renum=0,lsum=0,rsum=0,lyu=0,ryu=0,wrec=0,wee=".date("W").",mrec=0,mact=0,mon=".date("m").",msum=0,regweek=".date("W").",regmonth=".date("m").",actweek=".date('W').",actmonth=".date("m").",qdstatus=0,resum=0,wsum=0,reyu=0,areasum=0,areayu=0,zsj=0,realname=null,q=0,q1=null,q2=null,q3=null,a1=null,a2=null,a3=null,realname='系统帐号',kgu=0,coina=0,coinb=0,coinc=0,ldansum=0,rdansum=0,qianbao=null,qianbaoc=null where id=1");
			M()->execute("alter table __PREFIX__member AUTO_INCREMENT=2");
			M()->execute("update __PREFIX__gtmarket set number=".$F['gddi'].",donumber=0,key1=0,key2=0,status=2");
			M()->execute("update __PREFIX__gtmarket set status=1 where id=1");
			M()->execute("update dd_coin set bthistory=0,btgua=0,btdeal=0 where id=1");
			$tables=explode(",","history,market,cash,bank,financial,message,remittance,btmarket,invest_plan,myzr,myzc");
			foreach($tables as $v){//清空表数据
				M()->execute("TRUNCATE __PREFIX__".$v);
				M()->execute("alter table __PREFIX__".$v." AUTO_INCREMENT=1");
			}
			$edata="操作成功";
			$type=1;
		}else{
			$edata="请勿非法提交数据!";
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
}


 ?>