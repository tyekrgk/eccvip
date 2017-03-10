<?php
namespace Web\Controller;
use Web\Controller\BaseController;
class IndexController extends BaseController {
    public function index(){
        $slide=M("slide")->where('type=1')->order("id asc")->limit(6)->select();
        $com=M("slide")->where('type=2')->order("id asc")->select();
        $inc=M("indexconfig")->where("id=1")->find();
        $lang=1;
        if(LANG_SET=='en-us')$lang=2;
        if(LANG_SET=='ko')$lang=3;
        $this->slide=$slide;
        $this->com=$com;
        $this->lang=$lang;
        $this->inc=$inc;
        $this->display();
    }
}