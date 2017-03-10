<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;
/**
* 
*/
class CoinController extends BaseController{
	
	public function index(){
		$M=M('coin');
		$coin=$M->where('id=1')->find();
		$M=M('bonus');
		$bonus=$M->select();
		$this->kk=1;		//启用奖金列表
		$this->bonus=$bonus;
		$this->coin=$coin;
		$this->display();

	}

	public function save(){
		$M=M('coin');
		$da=$M->where('id=1')->find();
		$fields=array_keys($da);
		$data=array();
		foreach($fields as $v){
			if($v!='id'&&$v!='status'){
				$va=I('POST.'.$v);
				$data[$v]=$va;
			}
		}
		//p($_POST);
		//p($data);
		//die;
		unset($data['id']);
		$M->where("id=1")->save($data);
		//更新价格走势数据，供走势图使用
		$hc = M('highcharts');
		if($rs = $hc->where("date='".date('Y-m-d')."'")->find()){
		    $hc->save(array('id'=>$rs['id'],'price'=>$data['coinprice']));
		}else{
		    $hc->add(array('type'=>0,'date'=>date('Y-m-d'),'price'=>$data['coinprice']));
		}
		
		$coin=$M->where("id=1")->find();
		F("data",$coin);
		$k=1;
		if($k){
			$M=M('bonus');
			$ids=$M->field('id')->select();
			$data=$M->where('id='.$ids[0]['id'])->find();
			unset($data['id']);
			$fields=array_keys($data);
			foreach($ids as $v){
				$id=$v['id'];
				$data=array();
				foreach($fields as $v){
					$va=I('POST.'.$v.'_'.$id);
					$data[$v]=$va;
				}
				$M->where("id=".$id)->save($data);
			}
			$bonus=$M->select();
			$data=array();
			foreach($bonus as $v){
				$data[$v['id']]=$v;
			}
			F("bonus",$data);
		}
		//addhistory('admin','修改','修改内容:[网站设置]->[奖金设置]');
		$edata='操作成功';
		$this->type=0;
		$this->edata=$edata;
		$this->display('Alert:index');
	}

}
 ?>