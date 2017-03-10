<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
* 公告主控制器	
*/
class NewsController extends BaseController{
	/**
	 * 列表
	 */
	public function index(){
		$rem=M("news");
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
		$new=array("title"=>"","content"=>"","id"=>0);
		if($id){
			$new=M("news")->field("title,content,id")->where("id=".$id)->find();
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
		$data['content']=$_POST['webtext'];
		$data["date"]=date("Y-m-d H:i:s");
		$status=0;
		if(!$data['title']){
			$edata="标题不可以为空";
		}else{
			if($id){
				if(M("news")->where("id=".$id)->save($data)){
					$edata="修改成功";
					$status=1;
				}else{
					$edata="修改失败";
				}
			}else{
				if(M("news")->data($data)->add()){
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
		if(M("news")->where("id=".$id)->delete()){
			$edata="操作成功";
			$type=1;
		}else{
			$edata="操作失败";
		}
		$this->type=$type;
		$this->edata=$edata;
		$this->display('Alert:index');
	}
}
 ?>