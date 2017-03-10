<?php
namespace Home\Controller;
use Think\Controller;

class QueueController extends Controller
{
	
	public function qianbao()
	{
	    if(!F("data")){
	        $M=M("coin");
	        $data=$M->where(array('id'=>1))->find();
	        F("data",$data);
	    }
	    $coinset = F('data');

		$dj_username = $coinset['qb_uname'];
        $dj_password = $coinset['qb_pwd'];
        $dj_address = $coinset['qb_addr'];
        $dj_port = $coinset['qb_port'];
		echo 'start ' . $coinset['pfx'] . "\n";
		$CoinClient = CoinClient($dj_username, $dj_password, $dj_address, $dj_port, 5, array(), 1);
		$json = $CoinClient->getinfo();
		if (!isset($json['version']) || !$json['version']) {
			echo '###ERR#####***** ' . $coinset['pfx'] . " connect fail***** ####ERR####>\n";
			return;
		}

		echo 'Cmplx ' . $coinset['pfx'] . ' start,connect ' . (empty($CoinClient) ? 'fail' : 'ok') . " :\n";
		$listtransactions = $CoinClient->listtransactions('*', 100, 0);
		echo 'listtransactions:' . count($listtransactions) . "\n";
		krsort($listtransactions);

		foreach ($listtransactions as $trans) {
			if (!$trans['account']) {
				echo "empty account continue\n";
				continue;
			}

			if (!($user = M('Member')->where(array('username' => str_replace('fenh_', '', $trans['account'])))->find())) {
				echo "no account find continue\n";
				continue;
			}

			if (M('Myzr')->where(array('txid' => $trans['txid'], 'status' => '1'))->find()) {
				echo "txid had found continue\n";
				continue;
			}

			echo "all check ok \n";

			if ($trans['category'] == 'receive') {
				print_r($trans);
				echo "start receive do:\n";
				$sfee = 0;
				$true_amount = $trans['amount'];
                
				$zr_dz = 3;//TODO 转入确认次数
				if ($trans['confirmations'] < $zr_dz) {
					echo $trans['account'] . ' confirmations ' . $trans['confirmations'] . ' not elengh ' . $zr_dz . " continue \n";
					echo "confirmations <  c_zr_dz continue\n";

					if ($res = M('myzr')->where(array('txid' => $trans['txid']))->find()) {
						M('myzr')->save(array('id' => $res['id'], 'addtime' => time(), 'status' => intval($trans['confirmations'] - $zr_dz)));
					}
					else {
						M('myzr')->add(array('userid' => $user['id'], 'username' => $trans['address'], 'coinname' => $coinset['pfx'], 'fee' => $sfee, 'txid' => $trans['txid'], 'num' => $true_amount, 'mum' => $trans['amount'], 'addtime' => time(), 'status' => intval($trans['confirmations'] - $zr_dz)));
					}

					continue;
				}
				else {
					echo "confirmations full\n";
				}

				$mo = M();
				$mo->execute('set autocommit=0');
				$mo->execute('lock tables dd_member write , dd_myzr write, dd_history write');
				$rs = array();
				$rs[] = $mo->table('dd_member')->where(array('id' => $user['id']))->setInc('coina', $trans['amount']);//入账

				if ($res = $mo->table('dd_myzr')->where(array('txid' => $trans['txid']))->find()) {
					echo 'dd_myzr find and set status 1';
					$rs[] = $mo->table('dd_myzr')->save(array('id' => $res['id'], 'addtime' => time(), 'status' => 1));
				}
				else {
					echo "dd_myzr not find and add a new dd_myzr\n";
					$rs[] = $mo->table('dd_myzr')->add(array('userid' => $user['id'], 'username' => $trans['address'], 'coinname' => $coinset['pfx'], 'fee' => $sfee, 'txid' => $trans['txid'], 'num' => $true_amount, 'mum' => $trans['amount'], 'addtime' => time(), 'status' => 1));
				}
				history(array("uid"=>$user['id'],"type"=>1,"src"=>1,"key1"=>20,"key2"=>0,"info"=>"成功增加ECF",'coina'=>$trans['amount'],'allin'=>$trans['amount']));

				if (check_arr($rs)) {
					$mo->execute('commit');
					echo $trans['amount'] . ' receive ok ' . $coinset['pfx'] . ' ' . $trans['amount'];
					$mo->execute('unlock tables');
					echo "commit ok\n";
				}
				else {
					echo $trans['amount'] . 'receive fail ' . $coinset['pfx'] . ' ' . $trans['amount'];
					echo var_export($rs, true);
					$mo->execute('rollback');
					$mo->execute('unlock tables');
					print_r($rs);
					echo "rollback ok\n";
				}
			}
		}

		if ($trans['category'] == 'send') {
			echo "start send do:\n";

			if (3 <= $trans['confirmations']) {
				$myzc = M('Myzc')->where(array('txid' => $trans['txid']))->find();

				if ($myzc) {
					if ($myzc['status'] == 0) {
						M('Myzc')->where(array('txid' => $trans['txid']))->save(array('status' => 1));
						echo $trans['amount'] . '成功转出' . $coinset['pfx'] . ' 币确定';
					}
				}
			}
		}
	}
	
	/**
	 * 静态分红
	 */
	public function fenh(){
	    $fenhuser = M('invest_plan')
	           ->join('dd_member on dd_member.id = dd_invest_plan.uid')
	           ->field('uid,start,period,periodnow,lastoptdate,investamount,rate,randrate,utype')
	           ->where('dd_member.status = 1 and dd_invest_plan.period > dd_invest_plan.periodnow')
	           ->select();//查出需要分红的用户
	    if($fenhuser){
	        $i = 0;
	        foreach ($fenhuser as $u) {
	            $uid = $u['uid'];
	            $start = $u['start'];
	            $period = $u['period'];
	            $periodnow = $u['periodnow'];
	            $lastoptdate = $u['lastoptdate'];
	            $nowstr = date('Y-m-d');
	            $amount = $u['investamount'];//投资额
	            $rate = $u['rate'];//利率
	            if($lastoptdate && strtotime($lastoptdate) >= strtotime($nowstr)){//今天已经执行过了
	                echo "today has been operating\n";
	                continue;
	            }
	            if(!(strtotime('+'.$periodnow.' day',strtotime($start)) == strtotime($nowstr))){//数据错误，公式：开始时间 + 已分红周期(天) = 今天时间
	                echo "today cannot operating, before did not perform a task\n";
	                continue;
	            }
	            if($amount <= 0 || $period <= 0){
	                echo "investplan data error\n";
	                continue;
	            }
	            if($rate > 0){
    	            $rate = rand($rate*100, $rate*100+$u['randrate']*100)/100;//利率+浮动利率
	            }
	            $coin = numberformat(($amount+$amount*$rate/100)/$period);//今天能获得的金额
	            echo 'amount='.$amount.';coin='.$coin.';rate='.$rate.';randrate='.$u['randrate'].";\n";
	            $fenpei = fenpeiext($coin,1);//奖金分配
	            $mo = M();
	            $mo->execute('set autocommit=0');
	            $mo->execute('lock tables dd_member write , dd_invest_plan write, dd_history write');
	            $flag = true;
	            $rs = array();
	            $rs[] = $mo->execute('update dd_member set allin=allin+'.$fenpei['allin'].',coina=coina+'.$fenpei['coina'].',coinb=coinb+'.$fenpei['coinb'].',coinc=coinc+'.$fenpei['coinc'].' where id='.$uid);//入账
	            if($res = $mo->table('dd_invest_plan')->where('uid='.$uid)->find()){
	                if($res['periodnow'] + 1 == $res['period']){
                        $rs[] = $mo->table('dd_invest_plan')->where('uid='.$uid)->save(array('period'=>0,'periodnow'=>0,'lastoptdate'=>$nowstr));//放置计划(计划结束)
	                }else if($res['periodnow'] + 1 < $res['period']){
                        $rs[] = $mo->table('dd_invest_plan')->where('uid='.$uid)->save(array('periodnow'=>$res['periodnow'] + 1,'lastoptdate'=>$nowstr));//更新计划
	                }else{
	                    $flag = false;//发生异常
	                }
	            }else{
	                $flag = false;
	            }
	            if (check_arr($rs) && $flag) {
	                //记录分红日志
    	            history(array("uid"=>$uid,"type"=>1003,"info"=>$nowstr."产出",'coina'=>$fenpei['coina'],'coinb'=>$fenpei['coinb'],'coinc'=>$fenpei['coinc'],'allin'=>$fenpei['allin']));
	                $mo->execute('commit');
	                $mo->execute('unlock tables');
	                echo "commit ok\n";
	            }
	            else {
	                $mo->execute('rollback');
	                $mo->execute('unlock tables');
	                echo "rollback ok\n";
	            }
	            $i++;
	        }
	        echo "fenh-records:".$i."\n";
	    }
	}
	
	public function dayset(){
	    $bool = M('member')->execute("update __PREFIX__member set dpdaysum=0");
	    if($bool){
	        echo "dpdaysum reset success!\n";
	    }else{
	        echo "dpdaysum reset failed!\n";
	    }
	}
	
	public function closewebsite(){
	   $bool = M('web')->where("id=1")->save(array("status"=>1));
	   if($bool){
	       echo "close website success!\n";
	   }else{
	       echo "close website failed!\n";
	   }
	}
	
	public function openwebsite(){
	    $bool = M('web')->where("id=1")->save(array("status"=>0));
	    if($bool){
	        echo "open website success!\n";
	    }else{
	        echo "open website failed!\n";
	    }
	}
	
}

?>
