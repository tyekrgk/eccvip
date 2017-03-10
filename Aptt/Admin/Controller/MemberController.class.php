<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

class MemberController extends BaseController{

	public function index(){
		$t=I('get.t',0,"intval");
		$x=I('get.x',0,"intval");
		$z=I('get.z',0,"intval");
		$p=I('get.p',1,"intval");
		$un=I('get.un');
		$b=I('get.b');
		$member = M('member'); // 实例化User对象
		if($b=='dong'){
			$status=I('get.status',0,'intval');
			$id=I('get.id',0,'intval');
			$data['ft']=$status;
			if($member->where('id='.$id)->save($data)){
				$edata="操作成功";
			}else{
				$edata="操作失败";
			}
			$this->edata=$edata;
			$this->type=1;
			$this->display('Alert:index');
			exit;
		}
		if($b=='lock'){
			$status=I('get.status',0,'intval');
			$id=I('get.id',0,'intval');
			$data['lok']=$status;
			if($member->where('id='.$id)->save($data)){
				$edata="操作成功";
			}else{
				$edata="操作失败";
			}
			$this->edata=$edata;
			$this->type=1;
			$this->display('Alert:index');
			exit;
		}
		$where=array();
		if($un){
			$where['username']=array('like','%'.$un.'%');
		}
		if($t>0){
			$where['status']=$t-1;
		}
		if($x>0){
			$where['lok']=$x-1;
		}
		if($z>0){
			$where['ft']=$z-1;
		}
		
		$count= $member->where($where)->count();// 查询满足要求的总记录数
		//$parameter="id=1&p=".$p;
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		//$show=str_replace("/p","/un/".$un."/t/".$t."/p",$show);
		$list = $member->where($where)->field("id,username,utype,dan,money,score,coin,xun,rebuy,nick,rid,qq,regdate,ft,lok,status,aid,isagent,fid,realname,tel")->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->t=$t;// 激活状态
		$this->x=$x;// 锁定
		$this->z=$z;// 冻结
		$this->p=$p;
		$this->un=$un;
		$this->display(); // 输出模板
	}

	public function edite(){
		$id=I('get.id',0,'intval');
		if($id){
			$M=M('member');
			$info=$M->field("id,username,dan,coina,coinb,coinc,money,utype,score,coin,xun,rebuy,gu,nick,rid,qq,regdate,ft,lok,status,line,fid,allin,actdate,realname,tel,idcard")->where(array('id'=>$id))->find();
			if($info){
				$this->info=$info;
			}else{
				$edata='会员不存在';
			}
		}else{
			$edata='会员不存在';
		}
		$this->t=$t;// 赋值分页输出
		$this->p=$p;
		$this->display(); // 输出模板
	}

	public function save(){
		$data=array();
		$id=I('get.id',0,'intval');
		$upd1=I('post.upd1');
		$upd2=I('post.upd2');
		$data['realname']=I('post.realname');
		$data['nick']=I('post.nick');
		$data['email']=I('post.email');
		$data['tel']=I('post.tel');
		$data['idcard']=I('post.idcard');
		$data['utype']=I('post.utype');
		if($upd1) $data['upd1']=I('post.upd1','','md5');
		if($upd2) $data['upd2']=I('post.upd2','','md5');
		$M=M('member');
		if($M->where(array('id'=>$id))->save($data)){
			$edata="修改成功";
			$type=1;
		}else{
			$edata="修改失败";
			$type=0;
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}

	public function del(){
		$id=I('get.id',0,'intval');
		$r=M("member")->field("status")->where("id=".$id)->find();
		$type=0;
		if($r['status']){
			$edata="正式会员不可以删除,您可以将该会员冻结";
		}else{
			if(M("member")->where("id=".$id)->delete()){
				$edata="删除成功";
				$type=1;
			}else{
				$edata="删除失败";
			}
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}
	public function dellist(){
		$perm=$_POST['perm'];
		$status=0;
		if(!is_array($perm)){
			$edata="请勿非法操作";
		}else{
			if(M()->execute("delete from  __PREFIX__member  where status=0 and id in(".join($perm,",").")")){
				$edata="删除成功";
				$status=1;
			}else{
				$edata="删除失败";
			}
		}
		$this->type=$status;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
	/**
	 * 报单中心列表
	 */
	public function agent(){
		$t=I('get.t',0,"intval");
		$id=I('get.id',0,"intval");
		$b=I('get.b',"");
		$username=I('get.username',"");
		$p=I('get.p',1,"intval");
		$un=I('get.un');
 		$M=M('member');
 		if($b=="addagent"){
 			$r=M("member")->where(array('username'=>$username,'isagent'=>0))->find();
 			$data="操作失败";
 			$status=0;
 			if($r){
 				if($M->where(array('username'=>$username,'isagent'=>0))->save(array('isagent'=>1))){
 					$data="成功添加报单中心";
 				}
 			}
 			$this->show(alertstr($data,$status,U(C("FILE_IN").'/Member/agent')),"utf-8");
 			exit;
 		}
 		if($b=="can"){
 			$r=M("member")->where(array('id'=>$id,'isagent'=>1))->find();
 			$data="操作失败";
 			$status=0;
 			if($r){
 				if($M->where(array('id'=>$id,'isagent'=>1))->save(array('isagent'=>0))){
 					$data="报单中心已撤消";
 				}
 			}
 			$this->show(alertstr($data,$status,U(C("FILE_IN").'/Member/agent')),"utf-8");
 			exit;
 		}
 		$where=array('isagent'=>1);
 		if($un){
			$where['username']=array('like','%'.$un.'%');
		}
 		$count= $M->where($where)->count();// 查询满足要求的总记录数
		//$parameter="id=1&p=".$p;
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		//$show=str_replace("/p","/un/".$un."/t/".$t."/p",$show);
		$list = $M->where($where)->field("id,username,nick,regdate,status,isagent,allin,coin,score,rebuy,renum,tel,qq,realname,areasum")->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->t=$t;// 赋值分页输出
		$this->p=$p;
		$this->un=$un;
		$this->display(); // 输出模板
	}

	public function activate(){
		//$uid=I("session.uid",0,"intval");
		$id=I("get.id",0,"intval");
		$F=F("data");
		$D=D("Home/Rule");
		$data=$D->updateuser($id);
		$status=0;
		
		if($data==1){
			//M("member")->where("id=".$uid)->setDec("score",$F["money"]);
			$data="会员激活成功!";
			$status=1;
		}
		if($data==2){
			$data="会员激活失败";
		}
		$this->show(alertstr($data,$status),"utf-8");
	}
	/**
	 * 申请报单中心
	 */
	public function apply(){
		$t=I('get.t',0,"intval");
		$id=I('get.id',0,"intval");
		$p=I('get.p',1,"intval");
		$un=I('get.un');
 		$M=M('history');
 		$b=I('get.b',"");
 		if($b=="pass"){
 			$r=$M->where("status=0 and type=41 and id=".$id)->find();
 			$status=0;
 			$data="审核失败";
 			if($r){
 				if(M("member")->where("id=".$r['uid'])->save(array('isagent'=>1))){
 					M("history")->where("id=".$id)->save(array("status"=>1));
 					$data="审核成功";
 					$status=1;
 				}
 			}
 			$this->show(alertstr($data,$status),"utf-8");
 			exit;
 		}
 		if($b=="nopass"){
 			$r=$M->where("status=0 and type=41 and id=".$id)->find();
 			$status=0;
 			$data="操作失败";
 			if($r){
 				if(M("history")->where("id=".$id)->save(array("status"=>2))){
 					$data="操作成功";
 					$status=1;
 				}
 			}
 			$this->show(alertstr($data,$status),"utf-8");
 			exit;
 		}
 		$where=array('type'=>41,"status"=>0);
 		if($un){
 			//$wh['username']=array('like','%'.$un.'%');
 			$r=M("member")->field("id")->where(array("username"=>$un))->select();
 			if($r) $where["uid"]=$r["id"];
			
		}
 		$count= $M->where($where)->count();// 查询满足要求的总记录数
		//$parameter="id=1&p=".$p;
		$Page = new \Think\Page($count,12);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		//$show=str_replace("/p","/un/".$un."/t/".$t."/p",$show);
		$list = $M->where($where)->order(' id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->t=$t;// 赋值分页输出
		$this->p=$p;
		$this->un=$un;
		$this->display(); // 输出模板
	}
	public function addagent(){

		$this->display();
	}

	public function indexredirect(){
		$id=I("get.id",0,"intval");
		$user=M("member")->field("username,id,upd1")->where("id=".$id)->find();
		if($user){
			session('uid',$user['id']);
			session('username',$user['username']);
			session("iuhivwszv",$user['upd1']);
			$this->redirect('index.php/Index/index');
		}
		$this->error("会员不存在,请关闭页面");
	}
	/**
	 * 会员信息导出
	 */
	public function memberoutput(){
        //导出excel
		set_time_limit(0);
		header("Content-Type:   application/vnd.ms-excel");
		header("Content-Disposition:   attachment;   filename=Member.xls");
		header("Pragma:   no-cache");
		header("Content-Type:text/html; charset=utf-8");
		header("Expires:   0");

        $M = M ('member');
		$list = $M->order('od asc')->select();

        $title   =   "会员表 导出时间:".date("Y-m-d   H:i:s");

        echo   '<table   border="1"   cellspacing="2"   cellpadding="2"   width="50%"   align="center">';
        //   输出标题
        echo   '<tr   bgcolor="#cccccc"><td   colspan="10"   align="center">'   .   $title   .   '</td></tr>';
        //   输出字段名
        echo   '<tr  align=center>';
        echo   "<td>序号</td>";
        echo   "<td>会员编号</td>";
        echo   "<td>真实姓名</td>";
        echo   "<td>银行</td>";
        echo   "<td>银行卡号</td>";
        echo   "<td>开户行地址</td>";
        echo   "<td>联系电话</td>";
        echo   "<td>QQ号</td>";
        echo   "<td>身份证号</td>";
        echo   "<td>注册时间</td>";
        echo   "<td>开通时间</td>";
        echo   "<td>总奖金</td>";
        echo   "<td>剩余奖金</td>";
        echo   "<td>剩余注册币</td>";
        echo   '</tr>';
        //   输出内容

//		dump($list);exit;

        $i = 0;
        foreach($list as $row)   {
            $i++;
            $num = strlen($i);
            if ($num == 1){
                $num = '000'.$i;
            }elseif ($num == 2){
                $num = '00'.$i;
            }elseif ($num == 3){
                $num = '0'.$i;
            }else{
            	$num = $i;
            }
            $r=M("bank")->where('uid='.$row['id'])->find();
            echo   '<tr align=center>';
            echo   '<td>'   .  chr(28).$num   .   '</td>';
            echo   "<td>"   .   $row['username'].  "</td>";
            echo   "<td>"   .   $row['realname'].  "</td>";
            echo   "<td>"   .   $r['bank'].  "</td>";
            echo   "<td>"   .   sprintf('%s',(string)chr(28).$r['bankcard'].chr(28)).  "</td>";
            echo   "<td>"   .   $r['bankaddress'].  "</td>";
            echo   "<td>"   .   $row['tel'].  "&nbsp;</td>";
            echo   "<td>"   .   $row['qq'].  "</td>";
            echo   "<td>"   .   sprintf('%s',(string)chr(28).$row['idcard'].chr(28)).  "</td>";
            echo   "<td>"   .   $row['regdate'].  "</td>";
            echo   "<td>"   .   $row['actdate'].  "</td>";
            echo   "<td>"   .   $row['allin'].  "</td>";
            echo   "<td>"   .   $row['coin'].  "</td>";
            echo   "<td>"   .   $row['score'].  "</td>";
            echo   '</tr>';
        }
        echo   '</table>';
        die;
    }
}
 ?>