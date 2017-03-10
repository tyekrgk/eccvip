<?php
namespace Web\Controller;
use Web\Controller\BaseController;
class ContactController extends BaseController {
    public function index(){
        
        $this->display();
    }

    public function save(){
    	$data="你的信息已提交,谢谢您的";
    	$this->show(urldecode(json_encode(array('error'=>1,'info'=>urlencode($data)))),"utf-8");
    }
}