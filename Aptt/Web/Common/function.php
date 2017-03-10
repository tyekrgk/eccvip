<?php 
/**
 * 生成菜单
 */
function getmenu($data,$key=0,$fid=0){
	$arr = array();
    foreach($data as $v){
    	if($v["id"]==$key){
        	$v['cur']="cur";
        }else{
        	$v["cur"]="";
        }
        if($v['fid'] == $fid){
            $v['child'] = getmenu($data,$key,$v['id']);
            $arr[] = $v;    
        }

    }
    return $arr;
}
/**
 * 生成菜单URL
 */
function dourl($id){
	$URL="javascript:void(0)";
	$M=M("menu")->where("id=".$id)->find();
	if($M["type"]==0) $URL=$M["url"];
	if($M["type"]==1) $URL=U(C("FILE_IN")."/View/index",array("mid"=>$id,"id"=>$M["did"]));
	if($M["type"]==2) $URL=U(C("FILE_IN")."/News/index",array("mid"=>$id,"tid"=>$M["did"]));
	return $URL;
}

function webecho($ch="",$us="",$ko=""){
    $str=$ch;
    if(LANG_SET=='en-us')$str=$us;
    if(LANG_SET=='ko')$str=$ko;
    return $str;
}


 ?>