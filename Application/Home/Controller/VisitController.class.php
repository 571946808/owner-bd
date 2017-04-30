<?php    
namespace Home\Controller;

use Think\Controller;

class VisitController extends Controller{

    public function visit(){
        $ownername = $_POST['ownername'];
        $telphone = $_POST['telphone'];
        $timestart = $_POST['timestart'];
        $endtime = $_POST['timeend'];
        $description = $_POST['description'];
        $userid = $_SESSION['user_id'];

        $visit = D('visit');
        $data['visitor'] = $ownername;
        $data['phone'] = $telphone;
        $data['timestart'] = $timestart;
        $data['timeend'] = $endtime;
        $data['description'] = $description;
        $data['userid'] = $userid;
        $data['code'] = $this->randCode();

        // $data['creatTime'] = $data['ordertime'] = date('Y-m-d H:i:s'); 
        // $data['ordertime'] = $data['ordertime'] = date('Y-m-d H:i:s');
        if($visit->create($data)){
            $id = $visit->add();
            if($id){
                $result = array(
                    'code'=> '0',
                    'ext'=> '授权成功！'
                );
                echo json_encode($result);
            }
        }else{
              $result = array(
                  'code'=> '1',
                  'errMsg'=> '提交失败'
              );
              echo json_encode($result);
        }
    }

    function randCode($length = 20, $type = 0) {
        $arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){}[]|");
        if ($type == 0) {
            array_pop($arr);
            $string = implode("", $arr);
        } elseif ($type == "-1") {
            $string = implode("", $arr);
        } else {
            $string = $arr[$type];
        }
        $count = strlen($string) - 1;
        $code = '';
        for ($i = 0; $i < $length; $i++) {
            $code .= $string[rand(0, $count)];
        }
        return $code;
    }

    public function visitList(){
        $visit = M('visit');
        $userid = $_SESSION['user_id'];
        $service = $visit->where("userid='$userid'")->getField('visitor,phone,timestart,timeend,description,code');

        if($service){
            $result = array(
                'code'=> '0',
                'obj' => $service
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
              $result = array(
                  'code'=> '1',
                  'errMsg'=> '查询失败'
              );
              echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }
}