<?php 
namespace Admin\Controller;
use Think\Controller;

/**
* 
*/
class BaseController extends Controller{
	/**
		 * 自动运行
		 */	
	Public function _initialize(){
		$error=inject_check();		//注入过滤
		if($error){
			$this->show(alertstr($error,0,U(C("FILE_IN")."/Login/index")),"utf-8");
		}
		$adminid=I("session.adminid",0);
	    $adminusername=I("session.adminusername","");
	    $key=I("session.kjsdflks","");
	    $admininfo=M("admin")->where(array("id"=>$adminid,"username"=>$adminusername,"password"=>$key))->find();
	    if($admininfo){

	    }else{
	        $this->redirect(C("FILE_IN")."/Login/index","页面跳转中...");
	    }
	    $access = \Org\Util\Rbac::AccessDecision();
        if(!$access){
           $this->error('你没有权限');
        }
		if(!F("data")){
			$M=M("coin");
			$data=$M->where(array('id'=>1))->find();
			F("data",$data);
		}
		$F=F("data");
		if(!F("bonus")){
			$M=M("bonus");
			$r=$M->select();
			$data=array();
			foreach($r as $v){
				$data[$v['id']]=$v;
			}
			F("bonus",$data);
		}
		$bonus=F("bonus");
		$this->coinset=$F;
		$this->bonus=$bonus;
		$this->admininfo=$admininfo;
	}
}
?>