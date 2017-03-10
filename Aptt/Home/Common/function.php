<?php 
function chestatus($status){
	$permitio="index.index,pass.index,pass.save,money.remittance,money.remittancesave,money.online,money.onlineche,money.bt1,member.agent,member.agentlist,member.agentactive,user.index,user.question,user.questionsave,user.answer,user.password,user.passwordsave,user.save,news.index,news.view,message.*,index.logout,member.active,index.perm,btmarket.*";	//未激活可访问页面
	$perm=explode(",",$permitio);
	$arr=array();
	foreach($perm as $v){
		$arr[]=explode(".",$v);
	}
	if($status){
		$key = 0;
	}else{
		$cc=strtolower(CONTROLLER_NAME);
    	$aa=strtolower(ACTION_NAME);
    	$key=1;
    	foreach($arr as $v){
    		if($v[0]==$cc){
    			if($v[1]=="*"){
    				$key=0;
    			}else{
    				if($v[1]==$aa)$key=0;
    			}
    		}
    	}
	}
	return $key;
}

/**
 * 购物车信息
 * @return [type] [description]
 */
function cart_list(){
	$cart=I("session.cart","");
	if(!$cart){
		$arr=array();
		$arr['list']=array();
		$arr['number']=0;
		$arr['total']=0.00;
		$cart=$arr;
		session("cart",$arr);
	}
	return $cart;
}

/**
 * 添加单个商品到购物车
 * @param  [type] $product [商品数组信息,包含:id,name,price,sn]
 * @return [type]          [description]
 */
function cart_add($product){
	$ky=0;
	$k=0;
	cart_list();
	$arr=I("session.cart");
	foreach($arr['list'] as $v){
		if($v['id']==$product['id']){
			$arr['number']+=$product['number'];
			$arr['total']+=$product['total'];
			$arr['list'][$k]['number']+=$product['number'];
			$arr['list'][$k]['total']+=$product['total'];
			$ky=1;
		}
		$k++;
	}
	if(!$ky){
		$arr['number']+=$product['number'];
		$arr['total']+=$product['total'];
		array_push($arr['list'],$product);
	}
	session("cart",$arr);
}

/**
 * 删除购物车中一个商品信息
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
function cart_del($key){
	$arr=I("session.cart");
	$ret=array();
	$ret['number']=$arr['number'];
	$ret['total']=$arr['total'];
	$ret['list']=array();
	foreach ($arr['list'] as $v){
		if($v['id']==$key){
			$ret['number']-=$v['number'];
			$ret['total']-=$v['number']*$v['money'];
		}else{
			array_push($ret['list'], $v);
		}
	}
	session("cart",$ret);
}

/**
 * 清空购物车
 * @return [type] [description]
 */
function cart_empty(){
	session("cart",null);
}

/**
 * 修改商品数量
 */
function cart_change($id,$number){
	$k=0;
	$key=1;
	$arr=I("session.cart");
	foreach($arr['list'] as $v){
		if($v['id']==$id){
			if($number>0){
				$old_total=$v['total'];
				$old_number=$v['number'];
				$arr['list'][$k]['number']=$number;
				$arr['list'][$k]['total']=$arr['list'][$k]['number']*$arr['list'][$k]['money'];
				$new_total=$arr['list'][$k]['total'];
				$new_number=$number;
				$arr['number']=$arr['number']-$old_number+$new_number;
				$arr['total']=$arr['total']-$old_total+$new_total;
			//p($_SESSION['cart']);
			//die;
			}else{
				cart_del($id);
				$key=0;
			}
		}
		$k++;
	}
	if($key)session("cart",$arr);
}
 ?>