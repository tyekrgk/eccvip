<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
* 网站单页
*/
class IndexnewsController extends BaseController{
	
	public function index(){
		$rem=M("indexnews");
		$count= $rem->count();// 查询满足要求的总记录数
		$Page = new \Think\Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show = $Page->show();// 分页显示输出
		$show=doshow($show,C("FILE_IN"));
		$list = $rem->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$this->list=$list;// 赋值数据集
		$this->page=$show;// 赋值分页输出
		$this->display();
	}
	/**
	 * 添加编辑,以hidden-ID控制
	 */
	public function edit(){
		$id=I("get.id",0,"intval");
		$new=array("title"=>"","content"=>"","type"=>0,"id"=>0);
		if($id){
			$new=M("indexnews")->field("title,content,type,id")->where("id=".$id)->find();
		}
		$this->new=$new;
		$this->display();
	}

	/**
	 * 保存数据
	 */
	public function save(){
		$id=I("get.id",0,"intval");
		$data['title']=I("post.title","");
		$data['type']=I("post.type",0,"intval");
		$data['content']=$_POST['webtext'];
		$data["date"]=date("Y-m-d H:i:s");
		$status=0;
		if(!$data['title']){
			$edata="标题不可以为空";
		}else{
			if($id){
				if(M("indexnews")->where("id=".$id)->save($data)){
					$edata="修改成功";
					$status=1;
				}else{
					$edata="修改失败";
				}
			}else{
				if(M("indexnews")->data($data)->add()){
					$edata="添加成功";
					$status=1;
				}else{
					$edata="添加失败";
				}
			}
		}
		$this->type=$status;
		$this->edata=$edata;
		$this->display('Alert:index');
	}

	public function delete(){
		$id=I("get.id",0,"intval");
		$type=0;
		if(M("indexnews")->where("id=".$id)->delete()){
			$edata="操作成功";
			$type=1;
		}else{
			$edata="操作失败";
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}


	public function types(){
		$data=array();
		$data['id']=0;
		$data['bank']="";
		$data['status']=0;
		$data['re']=1;
		$data['sort']=9;
		$id=I('GET.id',0,'intval');
		$M=M("indexnewstype");
		if($id){
			$d=$M->where('id='.$id)->find();
			if($d) $data=$d;
		}
		$datalist=$M->order("id asc")->select();
		$this->data=$data;
		$this->datalist=$datalist;
		$this->display();
	}

	public function typesave(){
		$data=I("post.");
		if(!$data['title']){
			$edata="类别名称不可以为空";
			$this->edata=$edata;
			$this->type=0;
			$this->display('Alert:index');
			exit;
		}
		$data['sort']=I("sort",9,"intval");
		$id=I("id",0,"intval");
		$da=array("title"=>$data['title']);
		$M=M("indexnewstype");
		$type=0;
		if($id){
			if($M->where('id='.$id)->save($data)){
				//$type=1;
				$edata="修改成功";
			}else{
				
				$edata="修改失败";
			}
		}else{
			if($M->add($data)){
				//$type=1;
				$edata="添加成功";
			}else{
				$edata="添加失败";
			}
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->url=U(C("FILE_IN")."/Indexnews/types");
		$this->display('Alert:index');
	}

	function typedelete(){
		$id=I("id",0,"intval");
		$M=M("indexnewstype");
		if($M->where('id='.$id)->find()){
				if($M->where('id='.$id)->delete()){
					$type=1;
					$edata="删除成功";
				}else{
					$type=0;
					$edata="删除失败";
				}
		}else{
			$type=0;
			$edata="删除失败";
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->display('Alert:index');
	}
}
 ?>