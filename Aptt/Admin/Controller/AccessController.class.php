<?php
namespace Admin\Controller;
class AccessController extends BaseController{

	/**
	 * 会员列表
	 * @return [type] 
	 */
	public function index(){
		$data = M('admin')->field('a.*,b.role_id')->join('as a left join dd_role_user as b on a.id = b.user_id')->select();
		foreach ($data as $key => &$value) {
			$value['role'] = M('role')->where(array('id'=>$value['role_id']))->getField('name');
		}
		//p($data);
		//die;
		$this->assign('data',$data);
        $this->display();                                 
	}

	/**
	 * 添加编辑会员
	 */
	public function add_user(){
		$user_id = I('get.user_id');
		$role_id = I('get.role_id');
		if(!empty($user_id)){
			$data = M('admin')->where(array('id'=>$user_id))->find();
			$this->assign('data',$data);
		}
		$role = M('role')->select();
		$this->assign('role_id',$role_id);
		$this->assign('role',$role);
		$this->display();
	}

	/**
	 * 添加动作
	 * @return [type] [description]
	 */
	public function do_user(){
		$user_id = I('post.user_id');
		$role_id = I('post.role_id');
		$type=0;
		if(empty($user_id)){
			$data = array(
				'username' => I('post.username'),
				'password' => I('post.password',"","md5"),
				'time'   => time()
			);
			$status = M('admin')->add($data);
			$data = array(
				'role_id' => $role_id,
				'user_id' => $status
				);
			$status = M('role_user')->add($data);
			if($status){
				$edata="添加成功";
				$type=1;
				}else{
					$edata="添加失败";
				}
		}else{
			$data = array(
				'username' => I('post.username'),
				'time'   => time()
			);
			if($_POST["password"])$data['password'] = I('post.password',"","md5");
			$status = M('admin')->where(array('id'=>$user_id))->setField($data);
			M('role_user')->where(array('user_id'=>$user_id))->delete();
			$data = array(
				'role_id' => $role_id,
				'user_id' => $user_id,
				);
			$status = M('role_user')->add($data);
			if($status){
				$edata="修改成功";
				$type=1;
			}else{
				$edata="修改失败";
			}
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->url=U(C("FILE_IN")."/Access/index");
		$this->display('Alert:index');
	}


	/**
	 * 删除会员
	 * @return [type] [description]
	 */
	public function del_user(){
		$id = I('get.id');
		$type=0;
		if($id>1){
			$status = M('admin')->where(array('id'=>$id))->delete();
			if($status){
				$status = M('role_user')->where(array('user_id'=>$id))->delete();
				if($status){
				$edata="删除成功";
				$type=1;
				}else{
					$edata="删除失败";
				}
			}else{
				$edata="删除失败";
			}
		}else{
			$edata="超级管理员不可以删除";
		}
		$this->edata=$edata;
		$this->type=$type;
		//$this->url=U(C("FILE_IN")."/Access/role");
		$this->display('Alert:index');
	}

   /**
    * 节点列表
    * @return [type] [description]
    */
	public function node(){
		$data = M('node')->select();
		$info = category($data);
		$this->assign('data',$info);
		$this->display();
	}

	/**
	 * 添加编辑节点
	 */
	public function add_node(){
		$pid = I('get.pid','0');
		$level = I('get.level','1');
		switch ($level) {
			case '1':
				$view = '模块';
				break;
			case '2':
				$view = '控制器';
				break;
			case '3':
				$view = '方法';
				break;
			default:
				$view = '模块';
				break;
		}
		$this->assign('view',$view);
		$this->assign('pid',$pid);
		$this->assign('level',$level);
		$this->display();
	}

	/**
	 * 添加动作
	 * @return [type] [description]
	 */
	public function do_node(){
		$data = array(
			'name'  => I('post.name',''),
			'title' => I('post.title',''),
			'sort'  => I('post.sort',''),
			'level' => I('post.level',''),
			'pid'   => I('post.pid',''),
			'status'=> '1'
			);
		$status = M('node')->add($data);
		$type=0;
		if($status){
			$edata="添加成功";
			$type=1;
		}else{
			$edata="添加失败";
		}
		$this->edata=$edata;
		$this->type=$type;
		$this->url=U(C("FILE_IN")."/Access/node");
		$this->display('Alert:index');
	}


	/**
	 * 删除节点
	 * @return [type] [description]
	 */
	public function del_node(){
		$id = I('get.id');
		$status = M('node')->where(array('id'=>$id))->delete();
		$type=0;
		if($status){
			$edata="删除成功";
			$type=1;
		}else{
			$edata="删除失败";
		}
		$this->edata=$edata;
		$this->type=$type;
		//$this->url=U(C("FILE_IN")."/Access/node");
		$this->display('Alert:index');
	}

    /**
     * 角色列表
     * @return [type] [description]
     */
	public function role(){
		$data = M('role')->select();
		$this->assign('data',$data);
		$this->display();
	}

	/**
	 * 添加编辑角色
	 */
	public function add_role(){
		if(IS_POST){
			$data = array(
				'name' => I('post.name'),
				'status' => '1',
				'remark' => I('post.remark')
				);
			$status = M('role')->add($data);
			$type=0;
			if($status){
			$edata="添加成功";
			$type=1;
			}else{
				$edata="添加失败";
			}
			$this->edata=$edata;
			$this->type=$type;
			$this->url=U(C("FILE_IN")."/Access/role");
			$this->display('Alert:index');
			exit;
		}else{
			$this->display();
		}
		
	}

	/**
	 * 删除角色
	 * @return [type] [description]
	 */
	public function del_role(){
		$id = I('get.id');
		$status = M('role')->where(array('id'=>$id))->delete();
		$type=0;
		if($status){
		$edata="删除成功";
		$type=1;
		}else{
			$edata="删除失败";
		}
		$this->edata=$edata;
		$this->type=$type;
		//$this->url=U(C("FILE_IN")."/Access/role");
		$this->display('Alert:index');
	}

	/**
	 * [access description]
	 * @return [type] [description]
	 */
	public function access(){
		if(IS_POST){
			$node_id = I('post.');
			$role_id = $node_id['id'];
			$status = M('access')->where(array('role_id'=>$role_id))->delete();
			$data = array();
			foreach ($node_id['access'] as $key => $value) {
				$data[] = array(
					'role_id' => $role_id,
					'node_id' => $value,
					);
			}
			$status = M('access')->addAll($data);
			$type=0;
			if($status){
				$edata="操作成功";
				$type=1;
			}else{
				$edata="操作失败";
			}
			$this->edata=$edata;
			$this->type=$type;
			$this->url=U(C("FILE_IN")."/Access/role");
			$this->display('Alert:index');
		}else{
			$id = I('get.id');
			$data = M('node')->select();
			$ids  = M('access')->where(array('role_id'=>$id))->getField('node_id',true);
			$this->assign('ids',$ids);
			$info = category($data);
			$this->assign('id',$id);
			$this->assign('data',$info);
			$this->display();
		}

	}

	public function password(){
		$this->display();
	}
	public function psave(){
		$uid=I("session.adminid",0,"intval");
		$password=I("post.password","","md5");
		$type=0;
		if(M("admin")->data(array("password"=>$password))->where("id=".$uid)->save()){
			$edata="操作成功";
			$type=1;
		}else{
			$edata="操作失败";
		}
			$this->edata=$edata;
			$this->type=$type;
			//$this->url=U(C("FILE_IN")."/Access/password");
			$this->display('Alert:index');
	
	}
}	

?>