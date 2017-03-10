<?php
namespace Home\Controller;
use Home\Controller\BaseController;

/**
 * 虚拟币主控制器
 */
class CoinController extends BaseController{

    public function myzr($coin = NULL)
    {
        if(!chepass()){	//二级密码验证
            $mm=MODULE_NAME;
            $cc=CONTROLLER_NAME;
            $aa=ACTION_NAME;
            $this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
        }
        $uid=I("session.uid",0,"intval");
        $user=M("member")->field("username,qianbao")->where("id=".$uid)->find();
        $username='fenh_'.$user["username"];
        $qianbao=$user["qianbao"];
        
        if(!$qianbao){
            $dj_username = $this->coinset['qb_uname'];
            $dj_password = $this->coinset['qb_pwd'];
            $dj_address = $this->coinset['qb_addr'];
            $dj_port = $this->coinset['qb_port'];
            $CoinClient = CoinClient($dj_username, $dj_password, $dj_address, $dj_port, 5, array(), 1);
            $json = $CoinClient->getinfo();
            if (!isset($json['version']) || !$json['version']) {
                $this->error('钱包链接失败！');
            }

            $qianbao_addr = $CoinClient->getaddressesbyaccount($username);

            if (!is_array($qianbao_addr)) {
                $qianbao_ad = $CoinClient->getnewaddress($username);

                if (!$qianbao_ad) {
                    $this->error('生成钱包地址出错1！');
                }
                else {
                    $qianbao = $qianbao_ad;
                }
            }
            else {
                $qianbao = $qianbao_addr[0];
            }

            if (!$qianbao) {
                $this->error('生成钱包地址出错2！');
            }

            $rs = M("member")->where(array('id' => $uid))->save(array('qianbao' => $qianbao));

            if (!$rs) {
                $this->error('钱包地址添加出错3！');
            }
        }
    
        $this->assign('qianbao', $qianbao);
        $where['userid'] = $uid;
        $Moble = M('Myzr');
        $count = $Moble->where($where)->count();
        $Page = new \Think\Page($count, 15);
        $show = $Page->show();
        $list = $Moble->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list);
		$this->assign('page', $show);
        $this->display();
    }
    
    public function myzc($coin = NULL)
    {
        if(!chepass()){	//二级密码验证
            $mm=MODULE_NAME;
            $cc=CONTROLLER_NAME;
            $aa=ACTION_NAME;
            $this->redirect("index.php/Pass/index",array("mm"=>$mm,"cc"=>$cc,"aa"=>$aa),0,"页面跳转中...");
        }
        $uid=I("session.uid",0,"intval");
    
        $where['userid'] = $uid;
        $Moble = M('Myzc');
        $count = $Moble->where($where)->count();
        $Page = new \Think\Page($count, 10);
        $show = $Page->show();
        $list = $Moble->where($where)->order('id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display();
    }
    
    public function upmyzc($num, $p = '', $gacode = '')
    {
        $num = abs($num);
    
        if (!check($num, 'currency')) {
            $this->error('数量格式错误！','',true);
        }
    
        $uid=I("session.uid",0,"intval");
        $r=M('member')->field('ga,coina,qianbaoc')->where(array('id'=>$uid/* ,'upd2'=>md5($p) */))->find();
        /* if(!$r){
            $this->error('您输入的二级密码有误！','',true);
        } */
        $addr = $r['qianbaoc'];
        if (!check($addr, 'dw')) {
            $this->error('钱包地址格式错误！','',true);
        }
        $checkcode = checkga($r['ga'], $gacode, 2);
        if($checkcode!=1){
            $this->error('谷歌验证码错误！','',true);
        }
    
        $conf = $this->coinset;
        $coin = $conf['pfx'];
    
        if (!$conf) {
            $this->error('币种错误！','',true);
        }
    
        $myzc_min = ($conf['coinatxmin'] ? abs($conf['coinatxmin']) : 0.0001);
        $myzc_max = ($conf['coinatxmax'] ? abs($conf['coinatxmax']) : 10000000);
    
        if ($num < $myzc_min) {
            $this->error('转出数量超过系统最小限制！','',true);
        }
    
        if ($myzc_max < $num) {
            $this->error('转出数量超过系统最大限制！','',true);
        }
    
        if ($r['coina'] < $num) {
            $this->error('可用余额不足','',true);
        }
    
        if($conf['coinatxshui'] > 0){
            $fee = round(($num / 100) * $conf['coinatxshui'], 8);//手续费
            $mum = round($num - $fee, 8);//实例到账数量
        }else{
            $fee = 0;
            $mum = $num;
        }

        if ($mum < 0) {
            $this->error('转出手续费错误！','',true);
        }

        if ($fee < 0) {
            $this->error('转出手续费设置错误！','',true);
        }
    
        $dj_username = $conf['qb_uname'];
        $dj_password = $conf['qb_pwd'];
        $dj_address = $conf['qb_addr'];
        $dj_port = $conf['qb_port'];
        $CoinClient = CoinClient($dj_username, $dj_password, $dj_address, $dj_port, 5, array(), 1);
        $json = $CoinClient->getinfo();
        if (!isset($json['version']) || !$json['version']) {
            $this->error('钱包链接失败！','',true);
        }

        $valid_res = $CoinClient->validateaddress($addr);

        if (!$valid_res['isvalid']) {
            $this->error($addr . '不是一个有效的钱包地址！','',true);
        }

        //$auto_status = ($conf['zc_zd'] && ($num < $conf['zc_zd']) ? 1 : 0);
        $auto_status = 1;//先默认自动转出，后期修改

        if ($json['balance'] < $num) {
            $this->error('钱包余额不足','',true);
        }

        $mo = M();
        $mo->execute('set autocommit=0');
        $mo->execute('lock tables  dd_member write  , dd_myzc write ,dd_myzr write, dd_history write');
        $rs = array();
        $rs[] = $mo->table('dd_member')->where(array('userid' => $uid))->setDec('coina', $num);
        $rs[] = $mo->table('dd_myzc')->add(array('userid' => $uid, 'username' => $addr, 'coinname' => $coin, 'num' => $num, 'fee' => $fee, 'mum' => $mum, 'addtime' => time(), 'status' => $auto_status));
        history(array("uid"=>$uid,"type"=>1002,"src"=>1,"key1"=>20,"key2"=>1,"info"=>"提现ECF",'coina'=>-1*$num,'allin'=>-1*$num));//添加提现日志
        /* if ($fee && $auto_status) {
            $rs[] = $mo->table('dd_myzc_fee')->add(array('userid' => $fee_user['userid'], 'username' => $conf['zc_user'], 'coinname' => $coin, 'num' => $num, 'fee' => $fee, 'mum' => $mum, 'type' => 2, 'addtime' => time(), 'status' => 1));

            if ($mo->table('movesay_user_coin')->where(array($qbdz => $conf['zc_user']))->find()) {
                $rs[] = $r = $mo->table('movesay_user_coin')->where(array($qbdz => $conf['zc_user']))->setInc($coin, $fee);
                debug(array('res' => $r, 'lastsql' => $mo->table('movesay_user_coin')->getLastSql()), '新增费用');
            }
            else {
                $rs[] = $r = $mo->table('movesay_user_coin')->add(array($qbdz => $conf['zc_user'], $coin => $fee));
            }
        } */

        if (check_arr($rs)) {
            if ($auto_status) {
                $mo->execute('commit');
                $mo->execute('unlock tables');
                $sendrs = $CoinClient->sendtoaddress($addr, floatval($mum));

                if ($sendrs) {
                    $flag = 1;
                    $arr = json_decode($sendrs, true);
                    if (isset($arr['status']) && ($arr['status'] == 0)) {
                        $flag = 0;
                    }
                }
                else {
                    $flag = 0;
                }

                if (!$flag) {
                    $this->error('钱包服务器转出币失败,请手动转出');
                }
                else {
                    $this->success('转出成功!');
                }
            }

            if ($auto_status) {
                $mo->execute('commit');
                $mo->execute('unlock tables');
                //session('myzc_verify', null);
                $this->success('转出成功!');
            }
            else {
                $mo->execute('commit');
                $mo->execute('unlock tables');
                //session('myzc_verify', null);
                $this->success('转出申请成功,请等待审核！');
            }
        }
        else {
            $mo->execute('rollback');
            $this->error('转出失败!');
        }
    }
    
    
    public function acca(){
        $uid=I('session.uid',0,'intval');
        $M=M('history');
        $where="(type in (1000,1001,1002,1003,1004,805,101,103) or (type=1 and key1=20)) and coina<>0 and uid=".$uid;
        $count= $M->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $show=doshow($show,C("FILE_IN"));
        $list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $this->list=$list;// 赋值数据集
        $this->page=$show;// 赋值分页输出
        $this->display();
    }
    
    public function accazhuan(){
        $uid=I('session.uid',0,'intval');
        /* $ids = getrel($uid,'fid',1024);//上线领导
        $ids = getsubrel($uid,'fid',1024,$ids);//下线会员
        $ulist = M('member')->field('username')->where('id in ('.join(',', $ids).')')->select();
        $this->ulist=$ulist; */
        $this->display();
    }
    
    public function accasave(){
        $D=D("Money");
        $data=$D->coinsave();
        $status=0;
        if($data==1){
            $data="可用ECF帐户转帐成功!";
            $status=1;
        }
        if($data==2){
            $data="可用ECF帐户转帐失败!";
        }
        $this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($data)))),"utf-8");
    }
    
    public function accb(){
        $uid=I('session.uid',0,'intval');
        $M=M('history');
        $where="(type in (1003,101,103) or (type=1 and key1=21)) and coinb<>0 and uid=".$uid;
        $count= $M->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $show=doshow($show,C("FILE_IN"));
        $list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $this->list=$list;// 赋值数据集
        $this->page=$show;// 赋值分页输出
        $this->display();
    }
    
    public function accc(){
        $uid=I('session.uid',0,'intval');
        $M=M('history');
        $where="(type in (1003,1004,101,103) or (type=1 and key1=22)) and coinc<>0 and uid=".$uid;
        $count= $M->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $show=doshow($show,C("FILE_IN"));
        $list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $this->list=$list;// 赋值数据集
        $this->page=$show;// 赋值分页输出
        $this->display();
    }
    
    public function kuang(){
        $uid=I('session.uid',0,'intval');
        $M=M('history');
        $where="type = 1003 and uid=".$uid;
        $count= $M->where($where)->count();// 查询满足要求的总记录数
        $Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show = $Page->show();// 分页显示输出
        $show=doshow($show,C("FILE_IN"));
        $list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $this->list=$list;// 赋值数据集
        $this->page=$show;// 赋值分页输出
        $this->display();
    }
    
    private function jsonresult($info,$status){
        $this->show(urldecode(json_encode(array('error'=>$status,'info'=>urlencode($info)))),"utf-8");
    }
}
?>