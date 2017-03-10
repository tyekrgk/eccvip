<?PHP

function p($array){
	var_dump($array);
}

function doshow($str,$filename='index.php'){
    $cc=strtolower(CONTROLLER_NAME);
    $root=__ROOT__;
    if($root){
        $root=str_replace("/","",$root);
        $show=str_replace($root,$root."/".$filename,strtolower($str));
    }else{
        $show=str_replace($cc,$filename."/".$cc,strtolower($str));
    }
    return $show;
}
function lecho($cn,$en){
    return LANG_SET=='en-us'?$en:$cn;
}

function cheleftarea($fid,$rid,$line){
    $data=1;
    if($fid==$rid){
        if($line==0) $data=0;
    }else{
        $r=M("member")->field("fid,line")->where('id='.$fid)->find();
        if($r['fid']==$rid){
            if($r['line']==0){
                $data=0;
            }else{
                $data=1;
            }
        }else{
            if($r['fid']){
                $data=cheleftarea($r['fid'],$rid,$line);
            }else{
                $data=1;
            }
        }
    }
    return $data;
}
function redoutype($id=0){
    $uid=I("session.uid",0,'intval');
    $sid=$id?$id:$uid;
    $r=M('member')->field("dan,utype")->where("id=".$sid)->find();
    $dan=$r["dan"];
    $utype=$r["utype"];
    $key=1;
    $bonus=F('bonus');
    $F=F('data');
    if($dan>=$bonus[2]["money"]/$F['money']) $key=2;
    if($dan>=$bonus[3]["money"]/$F['money']) $key=3;
    if($dan>=$bonus[4]["money"]/$F['money']) $key=4;
    if($dan>=$bonus[5]["money"]/$F['money']) $key=5;
    if($dan>=$bonus[6]["money"]/$F['money']) $key=6;
    if($key>$utype) M("member")->where("id=".$sid)->save(array('utype'=>$key));

}
/**
 * 确认级别
 */
function cheutype($dan){
    $utype=$r["utype"];
    $key=1;
    $bonus=F('bonus');
    $F=F('data');
    if($dan>=$bonus[2]["money"]/$F['money']) $key=2;
    if($dan>=$bonus[3]["money"]/$F['money']) $key=3;
    if($dan>=$bonus[4]["money"]/$F['money']) $key=4;
    if($dan>=$bonus[5]["money"]/$F['money']) $key=5;
    if($dan>=$bonus[6]["money"]/$F['money']) $key=6;
    return $key;
}

function updatebtmarket($number,$type=0){
    if($type){
        M('coin')->execute("update __PREFIX__coin set bthistory=bthistory+".$number.",btdeal=btdeal+".$number." where id=1");
    }else{
        M('coin')->execute("update __PREFIX__coin set btgua=btgua+".$number." where id=1");
    }
    $data=M('coin')->where('id=1')->find();
    F("data",$data);
}


function updategdmarket($number,$price,$key=0){
    if($key==0)M("coin")->where("id=1")->SetInc("gdhistory",$number);
    M("highcharts")->where("date='".date("Y-m-d")."'")->save(array("price"=>$price));
}
/**
 * 奖金列表
 */
function prize($key){
    $arr=array(
        1=>"系统直充",997=>"系统充值",
        101=>"组织佣金",102=>"推荐佣金",103=>"领导佣金",104=>"交易佣金",105=>"见点奖",
        106=>"房奖",107=>"分红奖",108=>"直推贡献奖",109=>"终身成就奖",110=>"财富快车奖",111=>"报单奖",
        402=>"AD卖出",
        801=>"升级帐户",802=>"CT1转出",803=>"CT1转入",804=>"CT2转AT1",805=>"激活帐户",
        806=>"CT转出",807=>"CT转入",808=>"CT转CT1",809=>"AT转帐",810=>"注册赠送",
        811=>"升级赠送",812=>"新开采AC币",813=>"AD拆分配送",814=>"矿机金币转帐",815=>"AD1转帐",
        816=>"AT1转CF",817=>"CF支付订单",
        /**
         * @author hyq
         */
        1000=>"ECF转出",1001=>"ECF转入",1002=>"ECF提现",1003=>"ECF产出",1004=>"ECF复投"
        );
    return $arr[$key];
}
/**
 * 无限极分类
 * @param  [type] $data [description]
 * @param  string $pid  [description]
 * @return [type]       [description]
 */
function category($data,$pid='0'){
    $arr = array();
    foreach($data as $v){
        if($v['pid'] == $pid){
            $v['child'] = category($data,$v['id']);
            $arr[] = $v;    
        }
        
    }
    return $arr;
}
/**
 * 当一个价格出售完后更新gtmarket状态
 */
function redogtmarket(){
    $r=M('gtmarket')->where('status>=1')->order('id asc')->limit(2)->select();
    if(!$r) return 0;
    M("gtmarket")->execute("update __PREFIX__gtmarket set status=status-1 where id=".$r[0]['id']);
    if(count($r)==2) M("gtmarket")->execute("update __PREFIX__gtmarket set status=status-1 where id=".$r[1]['id']);
}

function category1($data,$pid='0'){
    $arr = array();
    foreach($data as $v){
        if($v['fid'] == $pid){
            $v['child'] = category1($data,$v['id']);
            $arr[] = $v;    
        }
        
    }
    return $arr;
}
/**
 * 获取新闻类别
 */
function getnewstype($type){
    $r=M("indexnewstype")->field("title")->where("id=".$type)->find();
    $value="无";
    if($r) $value=$r['title'];
    return $value;
}
/**
 * 查询是否在伞下
 */
function chelinetop($sid,$id){
    if($sid==$id) return 1;
    $fid=$sid;
    $r=M("member")->field("fid")->where("id=".$fid)->find();
    if($r){
        if($r["fid"]){
            if($r["fid"]==$id){
                $key=1;
            }else{
                $key=chelinetop($r["fid"],$id);
            }
        }else{
            $key=0;
        }
    }else{
        $key=0;
    }
    return $key;
}

/**
 * 查询是否在推荐团队
 */
function cheridtop($sid,$id){
    if($sid==$id) return 1;
    $rid=$sid;
    $r=M("member")->field("rid")->where("id=".$rid)->find();
    if($r){
        if($r["rid"]){
            if($r["rid"]==$id){
                $key=1;
            }else{
                $key=cheridtop($r["rid"],$id);
            }
        }else{
            $key=0;
        }
    }else{
        $key=0;
    }
    return $key;
}

/**
 * 输入过滤
 */
function inject_check($sql_str=0) {
            //合并$_POST 和 $_GET
    $get=array();
    $post=array();
            foreach ($_GET as $get_key => $get_var){
                $get[strtolower($get_key)] = $get_var;
            }
            /* 过滤所有POST过来的变量 */
            foreach ($_POST as $post_key => $post_var){
              $post[strtolower($post_key)] = $post_var;
            }
        //需要过滤的数据
        if ($sql_str == 0){
            $GetPost = 'select|insert|update|delete|union|into|load_file|outfile';
        }else{
            $GetPost = 'select|insert|update|delete|\'|\/\*|\*|\.\.\/|\.\/|union|into|load_file|outfile|\(|\)|\<|\>|and|chr|char';
        }
        foreach ($post as $post_key => $sql_str){
            $check = eregi($GetPost,$sql_str);// 进行过滤
            if ($check){
                return '输入内容不合法，请重新输入！';
            }
        }
        foreach ($get as $post_key => $sql_str){
            $check = eregi($GetPost,$sql_str);// 进行过滤
            if ($check){
                return '输入内容不合法，请重新输入！';
            }
        }
        return 0;
    }

function chepass(){
    $mm=MODULE_NAME;
    $cc=CONTROLLER_NAME;
    $aa=ACTION_NAME;
    $path=$mm."-".$cc."-".$aa;
    $value=I("session.".$path,0,"intval");
    return $value;
}

function newstypelist($id=0,$name="type"){
    $s="<select name='".$name."'>";
    $r=M("indexnewstype")->order("id asc")->select();
    foreach($r as $v){
        $s.="<option value='".$v['id']."' ".($id==$v['id']?"selected":"").">".$v['title']."</option>";
    }
    $s.="</select>";
    return $s;
}

function bonuslist($id=0,$name="utype"){
    $bonus=F("bonus");
    $F=F("data");
    $s="<select name='".$name."' id='utype' class='form-control'>";
    foreach($bonus as $v){
        $s.="<option value='".$v['id']."' ".($id==$v['id']?"selected":"").">".$v['title']." [<!--投资额:$".$v['money']." -->ECF:".money2coin($v['money'])."]</option>";
    }
    $s.="</select>";
    return $s;
}
/**
 * 无限极分类
 * @param  [type]  $cate  [description]
 * @param  integer $pid   [description]
 * @param  integer $level [description]
 * @param  string  $html  [description]
 * @return [type]         [description]
 */
function sortOut($cate,$pid=0,$level=0,$html='--'){
    $tree = array();
    foreach($cate as $v){
        if($v['pid'] == $pid){
            $v['level'] = $level + 1;
            $v['html'] = str_repeat($html, $level);
            $tree[] = $v;
            $tree = array_merge($tree, sortOut($cate,$v['id'],$level+1,$html));
        }
    }
    return $tree;
}
/**
 * 输出星级
 */
function showstar($val,$id=0){
    $value=$val;
    if($id){
        $M=M("member")->field("star")->where("id=".$id)->find();
        if($M) $value=$M["star"];
    }
    $startshow="<span style='color:red'>";
    for($i=0;$i<$value;$i++){
        $startshow.="★";
    }
    return $startshow."</span>";
}

/**
 * 星级选择列表
 */
function starlist($value,$name="star"){
    $starstr="<select name='".$name."'>";
    for($i=5;$i>0;$i--){
        $kstr="";
        for($k=$i;$k>0;$k--){
            $kstr.="★";
        }
        if($value==$i){
            $starstr.="<option value='$i' selected='selected'>$kstr</option>";
        }else{
            $starstr.="<option value='$i'>$kstr</option>";  
        }
    }
    $starstr.="</select>";
    return $starstr;
}

function rdata($status=0,$url='',$content=''){
	if(!url) $url="history.back()";
	if($status==0){
		if(!$content)$content="操作成功";
	}else{
		if(!$content)$content="操作失败";
	}
	$data='{"url":"'.$url.'","status":'.$status.',"content":"'.$content.'"}';
	return $data;
}

function cheft($id){
    $key=1;
    $r=M("member")->field("ft")->where("id=".$id)->find();
    if($r['ft']) $key=0;
    return $key;
}
/**
 * 日期统计封装
 */
function formatdate($per){
    $page=I("get.p",1,"intval");
    $d=M("member")->field("regdate")->where("id=1")->find();
    $bd=$d["regdate"];
    $arr=explode(" ",$bd);
    $b1=explode("-",$arr[0]);
    $b2=explode("-",date("Y-m-d"));
    $bdate=mktime(0,0,0,$b1[1],$b1[2],$b1[0]);
    $ndate=mktime(0,0,0,$b2[1],$b2[2],$b2[0]);
    $total=($ndate-$bdate)/(24*3600);
    $allpage=floor($total/$per);
    if($allpage==0) $allpage=1;
    if($page>$allpage)$page=$allpage;
    $begindate=$ndate-24*3600*($page-1)*$per;
    $ret=array();
    $ret["total"]=$total;
    $n=$begindate;
    for($i=0;$i<$per&&$n>=$bdate;$i++){
        $ret["list"][]=date("Y-m-d",$begindate-24*3600*$i);
        $n=$begindate-24*3600*($i+1);
    }
    return $ret;
}
/**
 * TODO 基础分页的相同代码封装，使前台的代码更少
 * @param $m 模型，引用传递
 * @param $where 查询条件
 * @param int $pagesize 每页查询条数
 * @return \Think\Page
 */
function getpage(&$m,$where,$pagesize=2){
    $m1=clone $m;//浅复制一个模型
    $count = $m->where($where)->count();//连惯操作后会对join等操作进行重置
    $m=$m1;//为保持在为定的连惯操作，浅复制一个模型
    $p=new Think\Page($count,$pagesize);
    $p->lastSuffix=false;
    $p->setConfig('header','<li class="rows">共<b>%TOTAL_ROW%</b>条记录  每页<b>%LIST_ROW%</b>条  第<b>%NOW_PAGE%</b>页/共<b>%TOTAL_PAGE%</b>页</li>');
    $p->setConfig('prev','上一页');
    $p->setConfig('next','下一页');
    $p->setConfig('last','末页');
    $p->setConfig('first','首页');
    $p->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');

    $p->parameter=I('get.');

    $m->limit($p->firstRow,$p->listRows);

    return $p;
}

/**
 * 查询记录来源对象
 */
function gethistorysrc($uid,$toid,$src){
    if($src == 0) return "系统";
    if($src == 1){
       $where = 'id='.$uid;
    }else{
       $where = 'id='.$toid;
    }
    return gettableinfo($where);
}
/**
 * 查询表中单个信息,如查询会员编号,则直接返回编号
 */
function gettableinfo($where,$field='username',$table='member'){
    if(!$where) return "";
    $info=M($table)->field($field)->where($where)->find();
    if($info){
        return $info[$field];
    } else{
        return "";
    }
}
/**
 * 查询表中数个信息,返回一维数组
 */
function gettableinfolist($where,$field='username',$table='member'){
    if(!$where) return "";
    $info=M($table)->field($field)->where($where)->find();
    if($info){
        return $info;
    } else{
        return "";
    }
}
/**
 * 生成新的会员帐号
 */
function newname(){
    $coin=M('coin')->field("pfx,number")->where("id=1")->find();
    $pfx=$coin['pfx'];
    $number=$coin['number'];
    $key=explode(",","1,2,3,4,5,6,7,8,9");
    $str=$pfx;
    for($i=0;$i<$number;$i++){
        $rand=rand(0,8);
        $str.=$key[$rand];
    }
    if(M('member')->where("username='".$str."'")->find()) $str=newname();
    return $str;
}

/**
 * 生成充值编号
 */
function creatsn($sn=""){
    $sn.=date("ymd").time();
    return $sn;
}
/**
 * 生成短编号
 */
function creatsortsn($sn="",$number=10,$ky="sn",$table="pan"){
    $key=explode(",","1,2,3,4,5,6,7,8,9");
    if($sn) $key[]=0;
    $str=$sn;
    for($i=0;$i<$number;$i++){
        $rand=rand(0,count($key)-1);
        $str.=$key[$rand];
    }
    if(M($table)->where($ky."='".$str."'")->find()) $str=creatsortsn();
    return $str;
}
/**
 * 獎金分配
 */
function fenpei($money,$key=0){
    $F=F("data");
    $rebuy=numberformat($money*$F['rebuy']/100);
	$shui=numberformat($money*$F['shui']/100);
    if($key) $shui=0;
    $coin=$money-$rebuy-$shui;
    return array('allin'=>$money,'coin'=>$coin,'rebuy'=>$rebuy,'shui'=>$shui);
}
/**
 * 獎金分配  $key=>0 动态 $key=>1 静态
 * @author hyq
 */
function fenpeiext($coin,$key=0){
    $F=F("data");
    $conf = array();
    if($key){
        $conf['coina'] = $F['stcoina'];
        $conf['coinb'] = $F['stcoinb'];
        $conf['coinc'] = $F['stcoinc'];
    }else{
        $conf['coina'] = $F['dcoina'];
        $conf['coinb'] = $F['dcoinb'];
        $conf['coinc'] = $F['dcoinc'];
    }
    $c=numberformat($coin);
    $coina=numberformat($c*$conf['coina']/100);
    $coinb=numberformat($c*$conf['coinb']/100);
    //$coinc=numberformat($coin*$F['dcoinc']/100);
    $coinc=$c-$coina-$coinb;
        
    return array('allin'=>$c,'coina'=>$coina,'coinb'=>$coinb,'coinc'=>$coinc);
}

/**
 * 格式化数字位数
 */
function numberformat($number,$key=3){
    return number_format($number, $key, '.', '');   
}
/**
 * 按层数取出上级,fields=>字段,key->递归关键字,c=>层数
 */
 //id,"id",'fid'....
 //推荐人,父结点
function getids($sid,$fields,$key,$c=3,$ret=array()){ 
    if(count($ret)==$c) return $ret;
    //$r=q("select ".$key." from member where id=".$sid);
    $r=M("member")->field($key)->where("id=".$sid)->select();
    if($r){
        if($r[0][$key]){
            $arr=array($key=>$r[0][$key]);
            //$rx=q("select ".$fields." from member where id=".$r[0][$key]);
            $rx=M("member")->field($fields)->where("id=".$r[0][$key])->select();
            $ar=explode(",",$fields);
            foreach($ar as $v){
                $arr[$v]=$rx[0][$v];
            }
            array_push($ret,$arr);
            $ret=getids($r[0][$key],$fields,$key,$c,$ret);
        }
    }
    return $ret;
}

/**
 * 取出所有上级,区分左右
 */
function getfids_fen($sid,$ret=array(array(),array(),array())){ //取出所有上级(双轨)
    $r=M('member')->field("line,fid,lsum,rsum")->where('id='.$sid)->find();
    $line=$r['line'];
    $fid=$r['fid'];
    if($fid){
        if($line==1) array_push($ret[1],$fid);
        if($line==0) array_push($ret[0],$fid);
        array_push($ret[2],$fid);
        $ret=getfids_fen($fid,$ret);
    }
    return $ret;
}

/**
 * 获取小公排位置
 */
function getaddress($sids=array()){
    $sidss=array();
    $key=0;
    for ($i=0;$i<count($sids);$i++){
        //$r=q("select id,line from member where fid=".$sids[$i]." and status=1 order by line asc");
        $r=M("member")->field("id,line")->where(array('status'=>1,'fid'=>$sids[$i]))->order("line asc")->select();
        if($r){
            if(count($r)==1){
                $address=array(0=>$sids[$i],1=>1);
                if($r[0]['line']) $address=array(0=>$sids[$i],1=>0);
                return $address;
                $key=1;     
            }else{
                array_push($sidss,$r[0]["id"]);
                array_push($sidss,$r[1]["id"]);
            }
        }else{
            $address=array(0=>$sids[$i],1=>0);
            return $address;
            $key=1; 
        }
    }
    if ($key==0){
        $address=getaddress($sidss);
    }
    return $address;
}


/**
 * 小区下会员
 */
function getjihuoids($ids=array(),$ret=array()){
    global $myutype,$coinset;
    $arr=array();
    if(count($ids)){
        $r=M()->query("select id,username,qq,nick,regdate,actdate,status,utype,rid,money,fid,realname from __PREFIX__member where fid in(".join(",",$ids).")");
        if($r){
            foreach($r as $v){
                array_push($arr,$v['id']);
                $ret[$v['id']]=$v;
            }
            $k++;
            $ret=getjihuoids($arr,$ret);
        }
    }
    return $ret;
}
/**
 * 小区下会员分页
 */
function redojihuoids($ids,$p=1,$psize=15){
    $ret=array();
    $pcount=ceil(count($ids)/$psize);
    if($p<1) $p=1;
    if($p>$pcount)$p=$pcount;
    $beginid=($p-1)*$psize;
    $endid=$beginid+$psize-1;
    if($endid>count($ids)-1) $endid=count($ids)-1;
    $ids_value=array_values($ids);
    for($i=$beginid;$i<=$endid;$i++){
        $ret[]=$ids_value[$i];
    }
    return $ret;
}
/**
 * data [uid]->会员ID,[type]->奖金类型,[allin]->奖金总额(会员收入为正,支出为负),[coin]->奖金币收入
 * [score]->电子币,[xun]->循环币,[gp]->富融币,[rebuy]->财富币,[*+sum]->各币种余额,[info]->详细信息
 * [date]->时间 ,[da]->日期,[status]->状态,[key]->保留字段,[en+*]->英文版 
 * 各字段请参考history表
 */
function history($data){
    //$r=q("select coin,score,xun,gp,gu,rebuy from member where id=".$data['uid']);
    $v=M("member")->field("bt,bt1,bt2,gt,gt1,gd,gd1,gd2,ly,dan,rebuy,coina,coinb,coinc")->where("id=".$data['uid'])->find();
    if($v){
        $data['sbt']=$v["bt"];
        $data['sbt1']=$v["bt1"];
        $data['sbt2']=$v["bt2"];
        $data['sgt']=$v["gt"];
        $data['sgt1']=$v["gt1"];
        $data['sly']=$v["ly"];
        $data['sgd']=$v["gd"];
        $data['sgd1']=$v["gd1"];
        $data['sgd2']=$v["gd2"];
        $data['sdan']=$v["dan"];
        $data['rebuysum']=$v["dan"];
        
        $data['scoina']=$v["coina"];
        $data['scoinb']=$v["coinb"];
        $data['scoinc']=$v["coinc"];
    }
    if(!$data['date']) $data['date']=date('Y-m-d H:i:s');
    if(!$data['da']) $data['da']=date('Y-m-d');
    if(!$data['ti']) $data['ti']=time();
    //qsave($data,"history");
    M("history")->data($data)->add();
}

/**
 * 从淘宝IP库获取IP地址信息
 */
function get_ip_data($ipin){
    $ip=file_get_contents("http://ip.taobao.com/service/getIpInfo.php?ip=".$ipin);
    $ip = json_decode($ip);
    if($ip->code){
        return false;
    }
    $data = (array) $ip->data;
    return $data;
}

function teamarray($id,$key=0,$c=3,$s=""){
    if($c==0) return $s;
    $bonus=F("bonus");
    $uid=I("session.uid",0,"intval");
    $id=$id?$id:$uid;
    $where=array();
    $where["id"]=$id;
    if($key) $where['status']=1;
    $v=M("member")->field("username,lsum,rsum,lyu,ryu,status,utype")->where($where)->find();
    $c--;
    $bg="#FFA217";
    $fg="white";
    if($v["status"]==0){
        $bg="#ccc";
        $fg="#333";
    }
    $s.="
        <div class='team'>
            <div class='box'>
                <table class='table table-bordered' id='table'>
                    <tr style='background:".$bg.";color:".$fg."'><td colspan='3'>会员:<a href='?a=team&id=".$id."' style='color:".$fg."'>".$v['username']."</a></td></tr>
                    <tr style='background:".$bg.";color:".$fg.";'><td colspan='3'>".$bonus[$v['utype']]['title'].($v["status"]?" [<span style='color:green'>已激活</span>]":" [<span style='color:red'>未激活</span>]")."</td></tr>
                    <tr><td>".$v['lsum']."</td><td>总</td><td>".$v['rsum']."</td></tr>
                    <tr><td>".$v['lyu']."</td><td>余</td><td>".$v['ryu']."</td></tr>
                </table>
            </div>
            ";
    if($c>0) $s.="<div class='mc'></div>";
    $whe=array("fid"=>$id);
    if($key) $whe['status']=1;
    $r=M("member")->field("id,line")->where($whe)->order("line asc")->select();
    if($r){
        if(count($r)==2){
            $L=teamarray($r[0]['id'],$key,$c);
            $R=teamarray($r[1]['id'],$key,$c);
        }else{
            $L="";
            $R="";
            if($r[0]['line']){
                $R=teamarray($r[0]['id'],$key,$c);
                $L="
                    <div class='team'>
                    <div class='box'>
                        <table class='table-bordered' id='table' width='100' align='center'>
                            <tr style=''><td colspan='3'>[<a href='".U("index.php/Member/reg",array("fname"=>$v['username'],"line"=>0))."'>注册帐户</a>]</td></tr>
                            
                            <tr><td></td><td></td><td></td></tr>
                            <tr><td></td><td></td><td></td></tr>
                        </table>
                    </div>
                    <div class='clear'></div>
                    </div>
                ";
                
            }else{
                $L=teamarray($r[0]['id'],$key,$c);
                $R="
                    <div class='team'>
                    <div class='box'>
                        <table class='table-bordered' id='table' width='100' align='center'>
                            <tr style=''><td colspan='3'>[<a href='".U("index.php/Member/reg",array("fname"=>$v['username'],"line"=>1))."'>注册帐户</a>]</td></tr>
                            
                            <tr><td></td><td></td><td></td></tr>
                            <tr><td></td><td></td><td></td></tr>
                        </table>
                    </div>
                    <div class='clear'></div>
                    </div>
                ";
                
            }
        }
    }else{
        $L="
        <div class='team'>
            <div class='box'>
                <table class='table-bordered' id='table' width='100' align='center'>
                    <tr style=''><td colspan='3'>[<a href='".U("index.php/Member/reg",array("fname"=>$v['username'],"line"=>0))."'>注册帐户</a>]</td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                </table>
            </div>
        <div class='clear'></div>
        </div>
        ";
        $R="
        <div class='team'>
            <div class='box'>
                <table class='table-bordered' id='table' widtd='100' align='center'>
                    <tr style=''><td colspan='3'>[<a href='".U("index.php/Member/reg",array("fname"=>$v['username'],"line"=>1))."'>注册帐户</a>]</td></tr>
                    <tr><td></td><td></td><td></td></tr>
                    <tr><td></td><td></td><td></td></tr>
                </table>
            </div>
            <div class='clear'></div>
        </div>
        ";
        
    }
    if($v['status']&&$c>0) {
        $s.="
            <div class='L'>
                ".$L."
            </div>
            <div class='R'>
                ".$R."
            </div>
            <div class='clear'></div>
        </div>
        ";
    }else{
        $s.="
            <div class='L'>
                
            </div>
            <div class='R'>
                
            </div>
            <div class='clear'></div>
        </div>
        ";
    }
    return $s;
}
/**
 * 组织图谱横向展示（临时使用）
 * @param unknown $id
 * @param number $key
 * @param number $c
 * @param string $s
 * @return string
 */
function teamarray2($id,$key=0,$c=3,$s=""){
    if($c==0) return $s;
    $uid=I("session.uid",0,"intval");
    $id=$id?$id:$uid;
    $where=array();
    $where["id"]=$id;
    if($key) $where['status']=1;
    $v=M("member")->field("username,lsum,rsum,lyu,ryu,status,utype,ldansum,rdansum")->where($where)->find();
    $L='';
    $R='';
    $left=false;
    $set = getline($id, 2, '1');
    if(count($set)>1) $left=true;
    foreach ($set as $val) {
        $L.=genteamstr($val['data'], $val['pos'], $val['parent'], $val['line']);
    }
    $right=false;
    $set1 = getline($id, 2, '0');
    if(count($set1)>1) $right=true;
    foreach ($set1 as $val) {
        $R.=genteamstr($val['data'], $val['pos'], $val['parent'], $val['line']);
    }
    $coinset = F('data');
    $bonus = F("bonus");
    $s.="<div class='rootnode'>会员：".$v['username']."&nbsp;级别：".($bonus[$v['utype']]['title'])."&nbsp;状态：".($v["status"]?" [<span style='color:green'>已激活</span>]":" [<span style='color:red'>未激活</span>]")."&nbsp;";
    $s.="左区业绩：".numberformat($v['ldansum']*$coinset['money']/10000,1)."万&nbsp;右区业绩：".numberformat($v['rdansum']*$coinset['money']/10000,1)."万";
    $s.="</div>";
    $s.="<div class='team'>";
    $s.="<div class='blockL'>";
    $s.=$L;
    if($left){
        $s.="<div class='relsingle' style='left: 50%; top: 50%;'></div>
									<div class='relcommon'
										style='border-right: 1px solid #000; left: 40%; top: 10%;'></div>";
    }
    $s.="</div>";
    $s.="<div class='blockM'><div class='rline'></div></div>";
    $s.="<div class='blockR'>";
    $s.=$R;
    if($right){
        $s.="<div class='relsingle' style='left: 40%; top: 50%;'></div>
									<div class='relcommon'
										style='border-left: 1px solid #000; left: 50%; top: 10%;'></div>";
    }
    $s.="</div>";
    $s.="</div>";
    return $s;
}
/**
 * 获取放置人（临时使用）
 * @param unknown $id
 * @param unknown $c
 * @param string $notin
 * @param string $preline
 * @param array $set
 * @return unknown
 */
function getline($id,$c,$notin='',$preline='', $set = []){
    if($c==0) return $set;
    $whe=array("fid"=>$id);
    $r=M("member")->where("fid=".$id.($notin!==''?" and line<>".$notin:""))->order("line asc")->select();
    $u = M('member')->field('username')->where('id='.$id)->find();
    $username = $u['username'];
    $c--;
    if($r){
        if(count($r)==2){
            array_push($set, array('pos'=>$preline.'0','line'=>0,'data'=>$r[0]));
            array_push($set, array('pos'=>$preline.'1','line'=>1,'data'=>$r[1]));
        }else{
            if($notin!==''){
                if($notin==='0'){
                    array_push($set, array('pos'=>$preline.'1','line'=>1,'data'=>$r[0]));
                }else{
                    array_push($set, array('pos'=>$preline.'0','line'=>0,'data'=>$r[0]));
                }
            }
            else if($r[0]['line']){
                array_push($set, array('pos'=>$preline.'0','parent'=>$username,'line'=>0,'data'=>null));
                array_push($set, array('pos'=>$preline.'1','line'=>1,'data'=>$r[0]));
            }
            else{
                array_push($set, array('pos'=>$preline.'0','line'=>0,'data'=>$r[0]));
                array_push($set, array('pos'=>$preline.'1','parent'=>$username,'line'=>1,'data'=>null));
            }
        }
        foreach ($r as $v){
            $set = array_merge($set,getline($v['id'], $c,'',($preline.$v['line'])));
        }
    }else{
        if($notin==='0'){
            array_push($set, array('pos'=>$preline.'1','parent'=>$username,'line'=>1,'data'=>null));
        }else if($notin==='1'){
            array_push($set, array('pos'=>$preline.'0','parent'=>$username,'line'=>0,'data'=>null));
        }else{
            array_push($set, array('pos'=>$preline.'0','parent'=>$username,'line'=>0,'data'=>null));
            array_push($set, array('pos'=>$preline.'1','parent'=>$username,'line'=>1,'data'=>null));
        }
    }
    return $set;
}
/**
 * 生成组织图（临时使用）
 * @param unknown $v
 * @param unknown $pos
 * @param unknown $parent
 * @param unknown $line
 * @return string
 */
function genteamstr($v,$pos,$parent,$line){
    if($pos==='0')
        $p="top: 37%;right: 0px;";
    else if($pos==='1')
        $p="top: 37%;left: 0px;";
    else if($pos==='00')
        $p="top: 0px;left: 0px;";
    else if($pos==='01')
        $p="bottom: 0px;left: 0px;";
    else if($pos==='10')
        $p="bottom: 0px;right: 0px;";
    else if($pos==='11')
        $p="top: 0px;right: 0px;";
    $bonus = F("bonus");
    $coinset = F("data");
    if($v){
        $bg="#428BCA";
        $fg="white";
        if($v["status"]==0){
            $bg="#ccc";
            $fg="#333";
        }
        return "<div class='zonemember' style='".$p."'>
				<table>
					<tbody>
						<tr style='background:".$bg.";color:".$fg."'>
							<td colspan='3'>会员:<a href='?a=team&id=".$v['id']."' style='color:".$fg."'>".$v['username']."</a></td>
						</tr>
						<tr style='background:".$bg.";color:".$fg.";'>
							<td colspan='3'>".$bonus[$v['utype']]['title'].($v["status"]?" [<span style='color:green'>已激活</span>]":" [<span style='color:red'>未激活</span>]")."</td>
						</tr>
					    <tr>
							<td style='width: 40%;'>".numberformat($v['ldansum']*$coinset['money']/10000,1)."万</td>
							<td style='width: 20%;'>总</td>
							<td style='width: 40%;'>".numberformat($v['rdansum']*$coinset['money']/10000,1)."万</td>
						</tr>
						<!--<tr>
							<td>".$v['lyu']."</td>
							<td>余</td>
							<td>".$v['ryu']."</td>
						</tr>-->
					</tbody>
				</table>
			</div>";
    }else{
        return "<div class='zonemember' style='".$p."'>
				<table>
					<tbody>
						<tr>
							<td colspan='3'>[<a href='".U("index.php/Member/reg",array("fname"=>$parent,"line"=>$line))."'>注册帐户</a>]</a></td>
						</tr>
						<tr>
							<td colspan='3'>&nbsp;</td>
						</tr>
						<tr>
							<td style='width: 40%;'>&nbsp;</td>
							<td style='width: 20%;'>总</td>
							<td style='width: 40%;'>&nbsp;</td>
						</tr>
						<!--<tr>
							<td>&nbsp;</td>
							<td>余</td>
							<td>&nbsp;</td>
						</tr>-->
					</tbody>
				</table>
			</div>";
    }
    
}

function alertstr($str,$type=0,$url=""){
    $open="";
    if($url) $open="location.href='".$url."';";
    $s='
    <script type="text/javascript">
            alert("'.$str.'");
            '.$open.'
            if('.$type.'==1){
                window.parent.document.getElementById("hidden_frame").url="#";
                window.parent.location.href=document.referrer;
            }
            if('.$type.'==2)history.go(-1);
    </script>
    ';
    return $s;
}
function getrecommand(){
    $bonus=F('bonus');
    $uid=I("session.uid",0,'intval');
    $id=I('get.id',$uid,'intval');
    $un=I('post.un',"");
    if($un){
        $v=M('member')->field('id')->where(array('username'=>$un))->select();
        if($v){
            $id=$v[0]['id'];
        }else{
            return 1;
        }
    }
    $M=M('member')->field('id,username,nick,utype,status')->where(array('id'=>$id))->select();
    $username=$M[0]['username'];
    $nick=$M[0]['nick'];
    $utype=$M[0]['utype'];
    $status=$M[0]['status'];
    $str=jsson($id);
    $s='{"t":"'.$username.' 昵称('.$nick.')  状态('.($status?"<font style='color:green'>已激活</font>":"<font style='color:red'>未激活</font>").')","id":'.$id.',"c":['.$str.']}';
    return $s;
}
/**
 * 生成推荐图谱数据
 */
function jsson($sid,$lv=1,$ret=''){
    if($lv>6)return $ret;
    $bonus=F('bonus');
    $s='';
    $r=M("member")->field("id,username,status,renum,rid,utype,nick")->where(array('rid'=>$sid))->select();
    if($r){
        for($i=0;$i<count($r);$i++){
            $title=$r[$i]['username'];
            $utype=$r[$i]['utype'];
            $status=$r[$i]['status'];
            $nick=$str = preg_replace( "@<script(.*?)</script>@is", "", $r[$i]['nick'] ); 
            $s.=($i==0?'':',')."{\"t\":\"$title 昵称(".$nick.") 状态(".($status?"<font style='color:green'>已激活</font>":"<font style='color:red'>未激活</font>").")\",\"id\":".$r[$i]['id'].",\"c\":[";
            $s.=jsson($r[$i]['id'],$lv+1,$ret);
            $s.="]}";
        }
        $ret.=$s;
        $s='';
    }
    return $ret;
}
/**
 * 截取
 */
function sort_str($name,$length=16,$charset = 'UTF8') {
    if(!function_exists('mb_substr')) {
        exit('需要开启 mb_string 支持');
    }
    $result = '';
    $strlen = mb_strlen($name, $charset);
    return mb_substr($name, 0, $length, $charset)."..."; 
    
} 

function cut_str($name,$s=16,$charset = 'UTF8') {
    if(!function_exists('mb_substr')) {
        exit('需要开启 mb_string 支持');
    }
    $result = '';
    $strlen = mb_strlen($name, $charset);
    return mb_substr($name, 0, $s, $charset)."..."; 
    
} 
/**
 *字符串换星号
 *
 **/
function star_str($name,$charset = 'UTF8') {
    if(!function_exists('mb_substr')) {
        exit('需要开启 mb_string 支持');
    }
    $result = '';
    $strlen = mb_strlen($name, $charset);
    if($strlen>2) { 
        return mb_substr($name, 0, 1, $charset).str_repeat('*',$strlen-2).mb_substr($name, -1, 1, $charset);    
    } else {
        return mb_substr($name, 0, 1, $charset).str_repeat('*',$strlen-1);  
    }
} 

function telcut($str){
    return substr($str,0,3)."****".substr($str,7,4);    
}
function QQcut($str){
    $arr=str_split($str);
    $k="";
    for($i=0;$i<count($arr);$i++){
        if($i>=3){
            $k.="*";    
        }else{
            $k.=$arr[$i];
        }
    }
    return $k;
}
function emailcut($email){
    $ak=explode('@',$email);
    $arr=str_split($ak[0]);
    $k="";
    for($i=0;$i<count($arr);$i++){
        if($i>=3){
            $k.="*";    
        }else{
            $k.=$arr[$i];
        }
    }
    return $k."@".$ak[1];
}
/**
 * 删除过期交易单
 */
function deletemarket(){
    $market=F('market');
    if(!$market)F("market",array("status"=>0));
    if(!$market['status']){
        $F=F('data');
        F('market',array("status"=>1));
        $M=M("market")->where("status=0 and addtime<'".date("Y-m-d H:i:s",time()-$F['epgua'])."'")->select();
        if(is_array($M) && !empty($M)){ 
            foreach($M as $v){
                if(M('member')->where('id='.$v['uid'])->setInc('coin',$v['coin'])){
                    M("market")->where("id=".$v['id'])->save(array("status"=>4));
                }
            }
        }
        F('market',array("status"=>0));
    }
}


/**
 * 只取rid或fid,推荐人或接点人
 */
function getrel($sid,$key="rid",$c=100,$ret=array()){
    if(count($ret)>=$c) return $ret;
    $r=M("member")->query("select ".$key." from __PREFIX__member where id=$sid");
    if($r){
        if($r[0][$key]){
            array_push($ret,$r[0][$key]);
            $ret=getrel($r[0][$key],$key,$c,$ret);
        }
    }
    return $ret;
}

/**
 * 往下获取 rid或fid,推荐人或接点人
 */
function getsubrel($sid,$key="rid",$c=100,$ret=array()){
    if(count($ret)>=$c) return $ret;
    $r=M("member")->query("select id from __PREFIX__member where ".$key."=$sid");
    if($r){
        foreach ($r as $v){
            array_push($ret,$v['id']);
            $ret=getsubrel($v['id'],$key,$c,$ret);
        }
    }
    return $ret;
}
/**
 * 获取放置区域（左区、右区）是否存在某个会员等级，存在返回具体等级，不存在返回0
 * @param number $sid
 * @param number $maxtype
 * @param number $line
 * @return number
 */
function getsubzone($sid,$maxtype,$line=-1,$currtype=0){
    $r=M("member")->query("select id,utype from __PREFIX__member where fid=".$sid.($line!=-1?" and line=".$line:""));
    if($r){
        foreach ($r as $v){
            if($v['utype']>=$maxtype)
                return $v['utype'];
            if($v['utype']>$currtype){
                $currtype = $v['utype'];
            }
            $currtype = getsubzone($v['id'], $maxtype, -1, $currtype);
        }
    }
    return $currtype;
}

/**
 * 对碰奖      修改完成
 * modify by hyq 20190930
 */
function spong($ids,$fname){
    $F=F("data");
    $bonus=F("bonus");
    $i=0;
    foreach($ids as $v){
        $id=$v;
        if($id<999999){
            $info=M("member")->field("lyu,ryu,dpdaysum,utype,username")->where("id=".$id)->find();
            $lyu=$info['lyu'];
            $ryu=$info['ryu'];
            $utype=$info['utype'];
            $dpdaysum=$info['dpdaysum'];
            $ffname=$info['username'];
            if($lyu>0&&$ryu>0){
                $coin=$lyu;
                if($lyu>$ryu) $coin=$ryu;//左右对碰，小的出来
                $money=$coin*$bonus[$utype]['dpj']*$F['coinprice']/100;//对碰奖金
                $ft="";
                if($money+$dpdaysum>=$bonus[$utype]["dpjtop"]) {
                    $money=$bonus[$utype]["dpjtop"]-$dpdaysum;
                    $ft="(达到封顶),";
                }
                $tc = money2coin($money);//转换对应的coin
                if($money>0&&cheft($id)){
                    if(M('invest_plan')->where('uid='.$id.' and period>0')->find()){//如果投资计划过期，则不能获取对应奖
                        $fenpei = fenpeiext($tc);
                        M("member")->execute("update __PREFIX__member set dpdaysum=dpdaysum+".$money.",allin=allin+".$fenpei['allin'].",coina=coina+".$fenpei['coina'].",coinb=coinb+".$fenpei['coinb'].",coinc=coinc+".$fenpei['coinc']." where id=".$id);
                        history(array('allin'=>$fenpei['allin'],'coina'=>$fenpei['coina'],'coinb'=>$fenpei['coinb'],'coinc'=>$fenpei['coinc'],'uid'=>$id,'type'=>101,'info'=>$ft.'来源编号:'.$fname));
                    }
                    faldj($id,$tc,$ffname);//发放领导奖
                }
                M("member")->execute("update __PREFIX__member set lyu=lyu-".$coin.",ryu=ryu-".$coin." where id=".$id);//对碰完，减掉左右奖金
            }
        }
        $i++;
    }
}

/**
 * 层碰奖      修改完成
 */
function cpong($ids,$fname){
    $F=F("data");
    for($i=0;$i<count($ids);$i++){
        $id=$ids[$i];
        if($id<999999){
            $info=M("member")->field("lyu,ryu")->where("id=".$id)->find();
            $lyu=$info['lyu'];
            $ryu=$info['ryu'];
            if($lyu>0&&$ryu>0){
                $dan=$lyu;
                if($lyu>$ryu) $dan=$ryu;
                $money=$dan*$F['cpj'];
                if(cheft($id)){
                    if($i<$F['cpjc']){
                        $r=M('history')->where("type=101 and key1=".$i." and uid=".$id)->find();
                        if(!$r){
                            M("member")->execute("update __PREFIX__member set dpdaysum=dpdaysum+".$money.",allin=allin+".$money.",coin=coin+".$money." where id=".$id);
                            history(array('allin'=>$money,'coin'=>$money,'uid'=>$id,'type'=>101,'info'=>'来源编号:'.$fname.",第".($i+1)."层","key1"=>$i));
                        }
                    }
                }
                M("member")->execute("update __PREFIX__member set lyu=lyu-".$dan.",ryu=ryu-".$dan." where id=".$id);
            }
        }
    }
}

/**
 * 推荐奖      修改完成
 */
function fatjj($id,$inmoney,$key=""){
    $r=M("member")->field("username")->where("id=".$id)->find();
    $fname=$r['username'];
    $ids=getids($id,"ft","rid",3);
    $i=0;
    $F=F("data");
    foreach($ids as $v) {
        $rid=$v['rid'];
        $ft=$v["ft"];
        $i++;
        $money=$inmoney*$F["tjj".$i]/100;
        if($money&&$ft==0){
            $fenpei=fenpei($money);
            M("member")->execute("update __PREFIX__member set allin=allin+".$money.",bt=bt+".$fenpei['coin'].",bt2=bt2+".$fenpei['shui'].",rebuy=rebuy+".$fenpei['rebuy']." where id=".$rid);
            history(array('allin'=>$money,'bt'=>$fenpei['coin'],'bt2'=>$fenpei['shui'],'rebuy'=>$fenpei['rebuy'],'uid'=>$rid,'type'=>102,'info'=>'来源编号:'.$fname.$key));
        }
    }
}

/**
 * 股权推荐奖      修改完成
 */
function fagtjj($id,$coin){
    $r=M("member")->field("rid,username")->where("id=".$id)->find();
    if($r["rid"]){
        $fname=$r["username"];
        $rid=$r["rid"];
        if($rid){
            $F=F("data");
            $money=$coin*$F["gtjj"]/100;
            if(cheft($rid)){
                M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money." where id=".$rid);
                history(array('allin'=>$money,'coin'=>$money,'uid'=>$rid,'type'=>106,'info'=>'来源编号:'.$fname));
            }
        }
    }
}

/**
 * 报单奖      修改完成
 */
function fagbdj($id,$coin,$key="激活"){
    $r=M("member")->field("aid,username")->where("id=".$id)->find();
    if($r["aid"]){
        $au=M("member")->field("utype")->where("id=".$r['aid'])->find();
        $fname=$r["username"];
        $aid=$r["aid"];
        if($aid){
            $F=F("data");
            $bonus=F("bonus");
            $money=$coin*$bonus[$au['utype']]["bdj"]/100;
            if(cheft($aid)){
               $fenpei=fenpei($money);
                M("member")->execute("update __PREFIX__member set allin=allin+".$money.",bt=bt+".$fenpei['coin'].",bt2=bt2+".$fenpei['shui'].",rebuy=rebuy+".$fenpei['rebuy']." where id=".$aid);
                history(array('allin'=>$money,'bt'=>$fenpei['coin'],'bt2'=>$fenpei['shui'],'rebuy'=>$fenpei['rebuy'],'uid'=>$aid,'type'=>111,'info'=>'来源编号:'.$fname.$key));
            }
        }
    }
}

/**
 * 领导奖 
 * modify by hyq 20190930
 */
function faldj($id,$incoin=0,$fname=""){
    $bonus=F("bonus");
    $ids=getids($id,"ft,utype","rid",getmaxlevelinfo('ldjd'));//$bonus[4]['ldjd'] 最大代数，递归找出可以拿到领导奖的推荐人
    $i=0;
    foreach($ids as $v){
        $id=$v["rid"];
        $ft=$v["ft"];
        $utype=$v["utype"];
        /* 规则：左区和右区必须各推一个大于或等于自己投资额（会员等级）的会员方可正常获取自己对应等级的领导奖金，如若未完成按最小投资额（左右区对比出最小）结算领导奖金 */
        $leftmax = getsubzone($id, $utype, 0);
        $rightmax = getsubzone($id, $utype, 1);
        $utype = min($utype,$leftmax,$rightmax);
        /* 规则：end */
        if($utype>0){
            $coin=$bonus[$utype]['ldj']*$incoin/100;//根据领导会员等级可获对应的coin
            if($bonus[$utype]['ldjd']>$i&&$ft==0&&$coin>0){//可以拿到领导奖的代数范围内 $bonus[$utype]['ldjd'] > $i
                if(M('invest_plan')->where('uid='.$id.' and period>0')->find()){//如果投资计划过期，则不能获取对应奖
                    $fenpei=fenpeiext($coin);
                    M("member")->execute("update __PREFIX__member set allin=allin+".$fenpei['allin'].",coina=coina+".$fenpei['coina'].",coinb=coinb+".$fenpei['coinb'].",coinc=coinc+".$fenpei['coinc']." where id=".$id);
                    history(array('allin'=>$fenpei['allin'],'coina'=>$fenpei['coina'],'coinb'=>$fenpei['coinb'],'coinc'=>$fenpei['coinc'],'uid'=>$id,'type'=>103,'info'=>'来源编号:'.$fname));
                }
            }
        }
        $i++;
    }
}
/**
 * 获取最大等级会员信息
 * @param string $field
 */
function getmaxlevelinfo($field='id'){
    $bonus=F("bonus");
    $i=0;
    foreach ($bonus as $k=>$v){
        if($k>$i){
            $i=$k;
        }
    }
    return $bonus[$i][$field];
}

/**
 * 交易佣金
 */
function fajyj($id,$inmoney=0,$fname=""){
    $bonus=F("bonus");
    $ids=getids($id,"ft,utype","rid",$bonus[6]['jyjd']);
    $i=0;
    foreach($ids as $v){
        $id=$v["rid"];
        $ft=$v["ft"];
        $utype=$v["utype"];
        $money=$bonus[$utype]['jyj']*$inmoney/100;
        if($bonus[$utype]['jyjd']>$i&&$ft==0&&$money>0){
            $fenpei=fenpei($money);
            M("member")->execute("update __PREFIX__member set allin=allin+".$money.",bt=bt+".$fenpei['coin'].",bt2=bt2+".$fenpei['shui'].",rebuy=rebuy+".$fenpei['rebuy']." where id=".$id);
            history(array('allin'=>$money,'bt'=>$fenpei['coin'],'bt2'=>$fenpei['shui'],'rebuy'=>$fenpei['rebuy'],'uid'=>$id,'type'=>104,'info'=>'来源编号:'.$fname));
        }
        $i++;
    }
}
/**
 * 见点奖
 */
function fajdj($id,$futype,$fname="",$key=""){
    $bonus=F("bonus");
    $ids=getids($id,"ft,utype","fid",$bonus[6]['jdjc']);
    $i=0;
    foreach($ids as $v){
        $id=$v["fid"];
        $ft=$v["ft"];
        $utype=$v["utype"];
        $cutype=$v["utype"];
        if($utype>$futype) $utype=$futype;
        $money=$bonus[$utype]['jdj']*$bonus[$utype]['money']/100;
        $r=M("history")->field("ifnull(sum(allin),0) as allin")->where("type=105 and info like '%".$fname."%' and  uid=".$id)->select();
        $moneyed=$r[0]['allin'];
        $domoney=$money-$moneyed;
        if($bonus[$cutype]['jdjc']>$i && $ft==0 && $domoney>0){
            $fenpei=fenpei($domoney);
            M("member")->execute("update __PREFIX__member set allin=allin+".$domoney.",bt=bt+".$fenpei['coin'].",bt2=bt2+".$fenpei['shui'].",rebuy=rebuy+".$fenpei['rebuy']." where id=".$id);
            history(array('allin'=>$domoney,'bt'=>$fenpei['coin'],'bt2'=>$fenpei['shui'],'rebuy'=>$fenpei['rebuy'],'uid'=>$id,'type'=>105,'info'=>'来源编号:'.$fname.$key));
        }
        $i++;
    }
}

/**
 * 报单奖
 */
function fabdj($id){
    $r=M("member")->field("aid,username")->where("id=".$id)->find();
    $aid=$r["aid"];
    $F=F("data");
    $swj=explode(",", $F['swj']);
    $fname=$r["username"];
    if($aid){
        $money=$swj[0];
        if($money>0 && $aid){
            M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money." where id=".$aid);
            history(array('allin'=>$money,'coin'=>$money,'uid'=>$aid,'type'=>104,'info'=>'来源编号:'.$fname));
        }
    }
    $ids=getrel($aid,"rid",count($swj)-1);
    $i=1;
    foreach($ids as $v){
        $id=$v;
        $money=$swj[$i];
        $rr=M("member")->field("isagent")->where("id=".$id)->find();
        if($money>0 && cheft($id) && $rr['isagent']){
            M("member")->execute("update __PREFIX__member set allin=allin+".$money.",coin=coin+".$money." where id=".$id);
            history(array('allin'=>$money,'coin'=>$money,'uid'=>$id,'type'=>104,'info'=>'来源编号:'.$fname));
        }
        $i++;
    }
}

function addtime($time = NULL, $type = NULL)
{
    if (empty($time)) {
        return '---';
    }

    if (($time < 2545545) && (1893430861 < $time)) {
        return '---';
    }

    if (empty($type)) {
        $type = 'Y-m-d H:i:s';
    }

    return date($type, $time);
}

function NumToStr($num)
{
    if (!$num) {
        return $num;
    }

    if ($num == 0) {
        return 0;
    }

    $num = round($num, 8);
    $min = 0.0001;

    if ($num <= $min) {
        $times = 0;

        while ($num <= $min) {
            $num *= 10;
            $times++;

            if (10 < $times) {
                break;
            }
        }

        $arr = explode('.', $num);
        $arr[1] = str_repeat('0', $times) . $arr[1];
        return $arr[0] . '.' . $arr[1] . '';
    }

    return ($num * 1) . '';
}

function check_arr($rs)
{
    foreach ($rs as $v) {
        if (!$v) {
            return false;
        }
    }

    return true;
}

function CoinClient($username, $password, $ip, $port, $timeout = 3, $headers = array(), $suppress_errors = false)
{
    return new \Common\Ext\CoinClient($username, $password, $ip, $port, $timeout, $headers, $suppress_errors);
}

/**
 * 金额转coin
 * @param number $money
 * @return number
 */
function money2coin($money = 0){
    $coinprice = F('data')['coinprice'];
    return round($money/$coinprice, 3);//保留两位小数
}
/**
 * coin转金额
 * @param number $coin
 * @return number
 */
function coin2money($coin = 0){
    $coinprice = F('data')['coinprice'];
    return round($coin*$coinprice, 3);//保留两位小数
}
function check($data, $rule = NULL, $ext = NULL)
{
    $data = trim(str_replace(PHP_EOL, '', $data));

    if (empty($data)) {
        return false;
    }

    $validate['require'] = '/.+/';
    $validate['url'] = '/^http(s?):\\/\\/(?:[A-za-z0-9-]+\\.)+[A-za-z]{2,4}(?:[\\/\\?#][\\/=\\?%\\-&~`@[\\]\':+!\\.#\\w]*)?$/';
    $validate['currency'] = '/^\\d+(\\.\\d+)?$/';
    $validate['number'] = '/^\\d+$/';
    $validate['zip'] = '/^\\d{6}$/';
    $validate['cny'] = '/^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$/';
    $validate['integer'] = '/^[\\+]?\\d+$/';
    $validate['double'] = '/^[\\+]?\\d+(\\.\\d+)?$/';
    $validate['english'] = '/^[A-Za-z]+$/';
    $validate['idcard'] = '/^([0-9]{15}|[0-9]{17}[0-9a-zA-Z])$/';
    $validate['passport'] = '/^(1[45][0-9]{7}|G[0-9]{8}|P[0-9]{7}|S[0-9]{7,8}|D[0-9]+)$/';
    $validate['truename'] = '/^[\\x{4e00}-\\x{9fa5}]{2,4}$/u';
    $validate['username'] = '/^[a-zA-Z]{1}[0-9a-zA-Z_]{5,15}$/';
    $validate['email'] = '/^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$/';
    $validate['moble'] = '/^[0-9]+$/';//暂时不做限制，因为存在国际号码
    $validate['password'] = '/^[a-zA-Z0-9_\\@\\#\\$\\%\\^\\&\\*\\(\\)\\!\\,\\.\\?\\-\\+\\|\\=]{6,16}$/';
    $validate['xnb'] = '/^[a-zA-Z]$/';

    if (isset($validate[strtolower($rule)])) {
        $rule = $validate[strtolower($rule)];
        return preg_match($rule, $data);
    }

    $Ap = '\\x{4e00}-\\x{9fff}' . '0-9a-zA-Z\\@\\#\\$\\%\\^\\&\\*\\(\\)\\!\\,\\.\\?\\-\\+\\|\\=';
    $Cp = '\\x{4e00}-\\x{9fff}';
    $Dp = '0-9';
    $Wp = 'a-zA-Z';
    $Np = 'a-z';
    $Tp = '@#$%^&*()-+=';
    $_p = '_';
    $pattern = '/^[';
    $OArr = str_split(strtolower($rule));
    in_array('a', $OArr) && ($pattern .= $Ap);
    in_array('c', $OArr) && ($pattern .= $Cp);
    in_array('d', $OArr) && ($pattern .= $Dp);
    in_array('w', $OArr) && ($pattern .= $Wp);
    in_array('n', $OArr) && ($pattern .= $Np);
    in_array('t', $OArr) && ($pattern .= $Tp);
    in_array('_', $OArr) && ($pattern .= $_p);
    isset($ext) && ($pattern .= $ext);
    $pattern .= ']+$/u';
    return preg_match($pattern, $data);
}

/**
 * 谷歌认证
 * @param string $ga
 * @param string $gacode
 * @param number $check 1登录2交易
 * @return number
 */
function checkga($ga,$gacode,$check=1){
    if($ga){
        $arr = explode('|', $ga);
        if($arr[$check]){
            if(!$gacode)
                return -1;
            $client = new \Common\Ext\GoogleAuthenticator();
            if(!$client->verifyCode($arr[0], $gacode, 1)){
                return -2;
            }
        }
    }
    return 1;
}
?>