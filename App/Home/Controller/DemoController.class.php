<?php
namespace Home\Controller;

class DemoController extends CommonController
{
    public function index()
    {
        $this->display();
    }
    public function other()
    {
        $this->display();
    }
    public function dos()
    {
        echo implode(',', range(56,90));
    }
    public function test()
    {
        $dbc = 'Rolereg';
        $db = D($dbc);
        $where['roleid'] = session('roleid');
        $data = $db->where($where)->select();

        $l_arr = [0=>'roleid',1=>'proleid'];
        $info['role'] = $this->getChData($data,$dbc,$l_arr);
        $info['roleJson'] = json_encode($info['role']);
        dump($info);
        exit;
    }
    public function test_page()
    {
        $page = I('page');
        $this->display($page);
    }
    public function test_slice()
    {
        $arr = range(1,1000);
        dump(array_slice($arr, 10,10));
    }
    public function testDemo()
    {
        $info[15] = ['id'=>15,'num'=>33,'pid'=>0];
        $info[16] = ['id'=>16,'num'=>33,'pid'=>15];
        $info[20] = ['id'=>20,'num'=>33,'pid'=>15];
        $info[17] = ['id'=>17,'num'=>33,'pid'=>16];
        $info[18] = ['id'=>18,'num'=>33,'pid'=>17];
        $info[19] = ['id'=>19,'num'=>33,'pid'=>17];
        krsort($info);
        foreach ($info as $key => $value) {
            $checkArr[$value['pid']][] = $key;
        }
        foreach ($info as $key => $value) {
            if(empty($checkArr[$key])) continue;

            foreach ($checkArr[$key] as $val) {
                $info[$key]['num'] = $info[$key]['num']+$info[$val]['num'];
            }
            echo $key."<br>";
            dump($checkArr[$key]);
            echo '-----'."<br>";
            /*if(in_array($value['pid'], $checkArr[$key])){

            }
            if($key==$value['pid']){
                $info[$key]['num'] = $info[$key]['num'] + $value['num'];
            }*/
        }
        dump($info);
    }
    public function mmm()
    {
        $db = D('Enforce\AreaDep');
        $ndb = D('Enforce\Employee');
        //print_r($db->getField('areaid',true));
        $data['userarea'] = implode(',', $db->getField('areaid',true));
        $ndb->where('code="admin"')->save($data);
        echo 1;
    }
    public function file_upload()
    {
        $file = $_FILES['mof'];

        $type = trim(strrchr($_POST['test'], '.'),'.');

        // print_r($_POST['test']);exit;
        if(!is_dir('./upload')) mkdir('./upload');
        if($file['error']==0){
            if(!file_exists('./upload/upload.'.$type)){
                if(!move_uploaded_file($file['tmp_name'],'./upload/upload.'.$type)){
                    echo 'failed';
                }
            }else{
                $content = file_get_contents($file['tmp_name']);
                if (!file_put_contents('./upload/upload.'.$type, $content,FILE_APPEND)) {
                    echo 'failed';
                }
            }
        }else{
            echo 'failed';
        }
    }
    public function t()
    {
        $co = range(1,1000000);
        $test1 = [];
        $test2 = [];
        G('begin');
        foreach ($co as $value) {
            $test1[$value] = '1';
        }
        G('end');
        echo G('begin','end',8).'s'."<br>";
        G('begin');
        array_walk($co,function($v,$k){
            $test2[$v] = '1';
        });
        G('end');
        echo G('begin','end',8).'s'."<br>";
    }
    public function test_get_query_table()
    {
        dump($this->get_dbTables());
        $time = range(201701,201709);
        foreach ($time as $value) {
            $totalArr[$value] = rand(0,200);
        }
        $page=2;
        $rows=100;
        dump($totalArr);
        dump($page);
        dump($rows);
        $res = $this->get_query_table($totalArr,$page,$rows);
        dump($res);
    }
    public function ala()
    {
        $areacodes = ['36023656','3602365636','36023678','3602367837'];
        $searchArr = array();
        foreach ($areacodes as $key => $value) {
            if(isset($minLength)){
                if($minLength < strlen($value)) continue;
                if($minLength > strlen($value)) $searchArr = array();
                if($minLength == strlen($value)) $searchArr[] = $value;
            }else{
                $minLength = strlen($value);
                $searchArr[] = $value;
            }
        }
        dump($searchArr);
        $checkAreacode = array_diff($areacodes,$searchArr);
        dump($checkAreacode);
        foreach ($checkAreacode as $key => $value) {
            foreach ($searchArr as $val) {
                if(strpos($value,$val) === 0) unset($checkAreacode[$key]);
            }
        }
        dump($checkAreacode);
        dump(array_merge($checkAreacode,$searchArr));
    }
}