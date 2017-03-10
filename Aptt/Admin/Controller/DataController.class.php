<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
class DataController extends BaseController {

    public function index() {
        $DataDir = "diansoftdatabak/";
        mkdir($DataDir);
		$action=I("get.action","");
        if ($action) {
            import("Common.Org.MySQLReback");
            $config = array(
                'host' => C('DB_HOST'),
                'port' => C('DB_PORT'),
                'userName' => C('DB_USER'),
                'userPassword' => C('DB_PWD'),
                'dbprefix' => C('DB_PREFIX'),
                'charset' => 'UTF8',
                'path' => $DataDir,
                'isCompress' => 0, //是否开启gzip压缩
                'isDownload' => 0
            );
            $mr = new MySQLReback($config);
            $mr->setDBName(C('DB_NAME'));
			
            if ($action == 'backup') {
				
                $datalist=$this->MyScandir('diansoftdatabak/');
                if(count($datalist)>6){
                    $edata="系统最多只能保留5个备份";
                    $this->edata=$edata;
                    $this->type=0;
                    $this->display('Alert:index');
                    exit;
                }
                $mr->backup();
                //echo "<script>document.location.href='" . U(C("FILE_IN")."/Data/index") . "'</script>";
                $this->edata='数据库备份成功！';
                $this->type=1;
                $this->display('Alert:index');
                exit();
            } elseif ($action == 'RL') {
                $mr->recover(I('GET.file'));
                //echo "<script>document.location.href='" . U(C("FILE_IN")."/Data/index") . "'</script>";
                $this->edata='数据库还原成功！';
                $this->type=0;
                $this->display('Alert:index');
                exit();
            } elseif ($action == 'Del') {
                if (@unlink($DataDir . I('GET.file'))) {
                     $this->edata='删除成功！';
                     $this->type=1;
                     $this->display('Alert:index');
                     exit();
                    //echo "<script>document.location.href='" . U(C("FILE_IN")."/Data/index") . "'</script>";
                } else {
                    $this->edata='删除失败！'.I('GET.file');
                    $this->type=0;
                    $this->display('Alert:index');
                    exit();
                }
            }
            if ($action == 'download') {

                function DownloadFile($fileName) {
                    ob_end_clean();
                    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
                    header('Content-Description: File Transfer');
                    header('Content-Type: application/octet-stream');
                    header('Content-Length: ' . filesize($fileName));
                    header('Content-Disposition: attachment; filename=' . basename($fileName));
                    readfile($fileName);
                }
                DownloadFile($DataDir . I('GET.file'));
                exit();
            }
        }
        $lists = $this->MyScandir('diansoftdatabak/');
        //p($lists);
       // die;
        $this->assign("datadir",$DataDir);
        $this->assign("lists", $lists);
        $this->display();
    }

    private function MyScandir($FilePath = './', $Order = 0) {
        $FilePath = opendir($FilePath);
        while (false !== ($filename = readdir($FilePath))) {
            $FileAndFolderAyy[] = $filename;
        }
        $Order == 0 ? sort($FileAndFolderAyy) : rsort($FileAndFolderAyy);
        return $FileAndFolderAyy;
    }

}

?>