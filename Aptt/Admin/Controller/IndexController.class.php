<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
class IndexController extends BaseController {
    public function index(){
        $date=date("Y-m-d");
        //今日统计
        $regcount=0;
        $reg=M("member")->where("regdate like '".$date."%' and status=1")->count();
        if($reg)$regcount=$reg;
        $actcount=0;
        $act=M("member")->where("actdate like '".$date."%'")->count();
        if($reg)$actcount=$act;
        $txsum=0;
        $tx=M("myzc")->field("ifnull(SUM(num),0) as allmoney")->where("addtime > ".strtotime(date('Y-m-d'))." and status=1")->select();
        if($tx)$txsum=numberformat($tx[0]["allmoney"]);
        $rmsum=0;
        $rm=M("myzr")->field("ifnull(SUM(num),0) as allmoney")->where("addtime > ".strtotime(date('Y-m-d'))." and status=1")->select();
        if($rm)$rmsum=numberformat($rm[0]["allmoney"]);

        //历史统计
        $hregcount=0;
        $hreg=M("member")->count();
        if($hreg)$hregcount=$hreg;
        $actcount=0;
        $hact=M("member")->where("status=1")->count();
        if($hact)$hactcount=$hact;
        $htxsum=0;
        $htx=M("myzc")->field("ifnull(SUM(num),0) as allmoney")->where("status=1")->select();
        if($htx)$htxsum=numberformat($htx[0]["allmoney"]);
        $hrmsum=0;
        $hrm=M("myzr")->field("ifnull(SUM(num),0) as allmoney")->where("status=1")->select();
        if($hrm)$hrmsum=numberformat($hrm[0]["allmoney"]);


        $reclist=M("member")->field("username,renum,qq")->where("status=1")->order("renum desc")->limit(10)->select();
        $allinlist=M("member")->field("username,allin,qq")->where("status=1")->order("allin desc")->limit(10)->select();
        $this->reclist=$reclist;
        $this->allinlist=$allinlist;
        $this->regcount=$regcount;
        $this->actcount=$actcount;
        $this->hregcount=$hregcount;
        $this->hactcount=$hactcount;
        $this->txsum=$txsum;
        $this->rmsum=$rmsum;
        $this->htxsum=$htxsum;
        $this->hrmsum=$hrmsum;
        $this->display();
    }

    public function updatecache(){
     
        if (file_exists(RUNTIME_FILE)) {
             unlink(RUNTIME_FILE); //删除RUNTIME_FILE;
         }
        $cachedir = RUNTIME_PATH . "/Cache/";   //Cache文件的路径；
        if ($dh = opendir($cachedir)) {     //打开Cache文件夹；
            while (($file = readdir($dh)) !== false) {    //遍历Cache目录，
                unlink($cachedir . $file);                //删除遍历到的每一个文件；
            }
             closedir($dh);
         }
         $cachedir = RUNTIME_PATH . "/Data/";   //Data文件的路径；
        if ($dh = opendir($cachedir)) {     //打开Data文件夹；
            while (($file = readdir($dh)) !== false) {    //遍历Data目录，
                unlink($cachedir . $file);                //删除遍历到的每一个文件；
            }
             closedir($dh);
         }
         /*
         $tempdir = RUNTIME_PATH . "/Temp/";   //Cache文件的路径；
        if ($dh = opendir($tempdir)) {     //打开Cache文件夹；
            while (($file = readdir($dh)) !== false) {    //遍历Cache目录，
                unlink($tempdir . $file);                 //删除遍历到的每一个文件；
            }
             closedir($dh);
         }
         */
         $this->show(alertstr("缓存更新成功!",1),"utf-8");     
    }

    /**
     * 退出登录
     */
    public function logout(){
        session_unset();
        session_destroy();
        $this->redirect(C("FILE_IN")."/Login/index","页面跳转中...");
        //$this->display();
    }
  
    
}              