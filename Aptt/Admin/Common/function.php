<?php 
/**
 * 添加操作记录
 */
function addhistory($user,$type,$content){
	$data=array('user'=>$user,'type'=>$type,'content'=>$content);
	M('history')->add($data);
}

/**
 * 获取理财记录数量
 */
function getinfogu($id=0){
    $key=0;
    $c=M("financial")->field("ifnull(sum(number),0) as number")->where("doneday<days and uid=".$id)->select();
    if($c) $key=$c[0]['number'];
    return $key;
}

/**
 * 获取理财记录数量
 */
function getinfoallgu($id=0){
    $key=0;
    $c=M("financial")->field("ifnull(sum(number),0) as number")->where("uid=".$id)->select();
    if($c) $key=$c[0]['number'];
    return $key;
}


function Agent($list){
    $rs=array();
    $M=M();
    foreach($list as $v){
        
    }
}
//处理方法
function rmdirr($dirname) {
    if (!file_exists($dirname)) {
        return false;
    }
    if (is_file($dirname) || is_link($dirname)) {
        return unlink($dirname);
    }
    $dir = dir($dirname);
    if ($dir) {
        while (false !== $entry = $dir->read()) {
            if ($entry == '.' || $entry == '..') {
                continue;
            }
            //递归
            rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
        }
    }
}

//公共函数
//获取文件修改时间
function getfiletime($file, $DataDir) {
    $a = filemtime($DataDir . $file);
    $time = date("Y-m-d H:i:s", $a);
    return $time;
}

//获取文件的大小
function getfilesize($file, $DataDir) {
    $perms = stat($DataDir . $file);
    $size = $perms['size'];
    // 单位自动转换函数
    $kb = 1024;         // Kilobyte
    $mb = 1024 * $kb;   // Megabyte
    $gb = 1024 * $mb;   // Gigabyte
    $tb = 1024 * $gb;   // Terabyte

    if ($size < $kb) {
        return $size . " B";
    } else if ($size < $mb) {
        return round($size / $kb, 2) . " KB";
    } else if ($size < $gb) {
        return round($size / $mb, 2) . " MB";
    } else if ($size < $tb) {
        return round($size / $gb, 2) . " GB";
    } else {
        return round($size / $tb, 2) . " TB";
    }
}
/**
 * 第一序列导航
 */
function fidlist($fid=0){
    $s='<select name="fid" id="fid">
        <option value="0" '.($fid==0?"selected='selected'":"").'>无</option>
    ';
    $r=M("menu")->where("fid=0")->order("sort asc,id asc")->select();
    foreach($r as $v){
        $s.='<option value="'.$v['id'].'" '.($v['id']==$fid?"selected='selected'":"").'>'.$v['title'].'</option>';
    }
    $s.='</select>';
    return $s;
}
/**
 * 导航类型
 */
function menutype($id=0){
    $s='
    <select name="type" id="type">
    <option value="0"'.($id==0?" selected":"").'>URL</option>
    <option value="1"'.($id==1?" selected":"").'>单页</option>
    <option value="2"'.($id==2?" selected":"").'>新闻列表</option>
    </select>
    ';
    return $s;
}
/**
 * 父导航名称
 */
function getmenufid($id=0){
    $title="无";
    $r=M("menu")->field("title")->where(array("id"=>$id))->find();
    if($r)$title=$r["title"];
    return $title;
}

/**
 * 导航类别
 */
function getmenutype($type=0){
    $arr=array(0=>"URL",1=>"单页",2=>"新闻类别");
    return $arr[$type];
}

function didtype($id){
    $type=0;
    $url="#";
    $did=0;
    if($id){
        $r=M("menu")->where("id=".$id)->find();
        if($r){
            $type=$r["type"];
            $url=$r["url"];
            $did=$r["did"];
        }
    }
    $k1="<tr id='typelist'><td width='10%' class='tableleft'>URL</td><td><input type='text' name='url' value='".$url."'/> 外部链接要加上http://</td></tr>";
    $k2="<tr id='typelist'><td width='10%' class='tableleft'>选择单页</td><td><select name='did'>";
        $r=M("indexview")->order("id desc")->select();
        foreach($r as $v){
            $k2.="<option value='".$v['id']."' ".($type==1&&$v['id']==$did?"selected='selected'":"").">".$v['title']."</option>";
        }
    $k2.="</select></td></tr>";
    $k3="<tr id='typelist'><td width='10%' class='tableleft'>新闻类别</td><td><select name='did'>";
        $r=M("indexnewstype")->order("id asc")->select();
        foreach($r as $v){
            $k3.="<option value='".$v['id']."' ".($type==2&&$v['id']==$did?"selected='selected'":"").">".$v['title']."</option>";
        }
    $k3.="</select></td></tr>";
    $k4=$k1;
    if($type==1) $k4=$k2;
    if($type==2) $k4=$k3;
    return array(0=>$k1,1=>$k2,2=>$k3,3=>$k4);
}
/**
 * 仅获取单页导航信息
 */
function getonly($id=0,$name="key"){
    $M=M("menu")->where("type=1")->select();
    $s="<select name='".$name."'>";
    foreach($M as $v){
        $s.="<option value='".$v['id']."' ".($v["id"]==$id?"selected='selected'":"").">".$v["title"]."</option>";
    }
    $s.="</select>";
    return $s;
}
/**
 * 快速奖LIST
 */
function getksjlist(){
    $F=F("data");
    $M=M("member")->field("actweek")->where("id=1")->find();
    $beginweek=$M['actweek'];
    $data=array();
    for($i=date("W");$i>=$beginweek;$i--){
        $ret=array("uid"=>$i);
        $hi=M("history")->field("uid,gu,coin,status,key1")->where("type=205 and uid=".$i)->find();
        if($hi){
            $ret["done"]=$hi;
        }else{
            $ret["done"]=array("uid"=>$i,"gu"=>0,"coin"=>0,"status"=>0,"key"=>0);
        }    
        $r=M()->query("select distinct rid from __PREFIX__member where rid>0 and status=1 and actweek='".$i."'");
        $cou=0;
        $renum=0;
        foreach($r as $v){
            $rr=M("member")->where("rid=".$v["rid"]." and status=1 and actweek=".$i)->count();
            if($rr>=$F['ksjt']) {
                $cou++;
                $renum+=$rr;
            }
        }
        $ret["nodone"]=array("uid"=>$i,"gu"=>$cou,"coin"=>$renum*$F["ksj"],"status"=>0,"key1"=>1);
        
        $data[]=$ret;
    }
    return $data;
}
/**
 * 获取第$w周可以拿到奖金的id
 */
function getksjids($w){
    $ret=array();
    $F=F("data");
    $r=M()->query("select distinct rid from __PREFIX__member where rid>0 and  actweek='".$w."'");
    foreach($r as $v){
        $namelist=array();
        $rr=M("member")->field("username")->where("rid=".$v["rid"]." and actweek='".$w."'")->select();
        if(count($rr)>=$F['ksjt']){
            foreach($rr as $k){
                $namelist[]=$k["username"];
            }
            $status=0;
            $coin=$F["ksj"]*count($rr);
            $rs=M("history")->field("id,coin")->where(array('uid'=>$v['rid'],'type'=>10,"key1"=>$w))->find();
            if($rs){
                $status=1;
                $coin=$rs["coin"];
            }
            $ret[]=array("id"=>$v['rid'],"renum"=>count($rr),"status"=>$status,"coin"=>$coin,"namelist"=>$namelist);
        }
    }
    return $ret;
}

 ?>