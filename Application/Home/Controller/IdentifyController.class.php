<?php
namespace Home\Controller;
use Think\Controller;

class  IdentifyController extends Controller{
    public function index(){
        if(isset($_SESSION['user_id'])){
            $identify = D('message');
            $identifyArr = $identify->order('date asc,id asc')->select();
            $this->assign('identifyArr',$identifyArr);
            $this->display();
        }else{
            $url = 'http://localhost/owner-bd/index.php/Home/Index/login';
            header("location: $url");
        }
    }

    public function messageAdd(){
        $ownername = $_POST['ownername'];
        $city = $_POST['city'];
        $residence_name = $_POST['residence_name'];
        $unit = $_POST['unit'];
        $house_num = $_POST['house_num'];
        $id_num = $_POST['id_num'];
        if(!$ownername || !$city || !$residence_name || !$unit || !$house_num || !$id_num){
            $result = array(
                'code' => '2',
                'ext' => '参数不足',
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
            return;
        }

        $message = D('message');
        $data['ownername']=$ownername;
        $data['city']=$city;
        $data['residence_name']=$residence_name;
        $data['unit']=$unit;
        $data['house_num']=$house_num;
        $data['id_num']=$id_num;
        $data['date']=date('Y-m-d H:i:s');
        $user_id=$_SESSION['user_id'];
        $data['user_id']=$user_id;

        if($message->create($data)){
            $res = $message->add();
            if($res){
                $result = array(
                    'code' => '0',
                    'ext' => 'success',
                );
                echo json_encode($result);
            }else{
                $result = array(
                    'code'=>'1',
                    'errMsg'=>'认证失败'
                );
                echo json_encode($result);
            }
        }
    }

    public function messageEdit(){
        $id = $_POST['id'];
        $ownername = $_POST['ownername'];
        $city = $_POST['city'];
        $residence_name = $_POST['residence_name'];
        $unit = $_POST['unit'];
        $house_num = $_POST['house_num'];
        $id_num = $_POST['id_num'];
        $message = D('message');
        $data['ownername'] = $ownername;
        $data['city'] = $city;
        $data['residence_name'] = $residence_name;
        $data['unit'] = $unit;
        $data['house_num'] = $house_num;
        $data['id_num'] = $id_num;
        $data['date'] = date('Y-m-d H:i:s');
        $success = $message->where("id='$id'")->save($data);
        if($success){
            $message_temp = $message->where("id='$id'")->find();
            $result = array(
                'code'=>'0',
                'ext'=>'success',
                'obj'=>$message_temp
            );
            echo json_encode($result);
        }else{
            $result = array(
                'code'=>'1',
                'errMsg'=>'修改失败'
            );
            echo json_encode($result);
        }
    }

    public function messageList(){
        if(isset($_SESSION['user_id'])) {
            $message = D('message');
            $user_id =  $_SESSION['user_id'];
//            $telephone = $_POST["telephone"];
            $resultArr = $message->where("user_id='$user_id'")->getField('id,residence_name,unit');
//            $resultArr = $message->where("user_id='$user_id'")->select();
            if ($resultArr) {
                $result = array(
                    'code' => '0',
                    'ext' => 'success',
                    'obj' => $resultArr
                );
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
            } else {
                $result = array(
                    'code' => '1',
                    'errMsg' => '暂无认证信息'
                );
                echo json_encode($result, JSON_UNESCAPED_UNICODE);
            }
        }else{
            $result = array(
                'code'=> '2',
                'errMsg'=>'请先登录'
            );
            echo json_encode($result, JSON_UNESCAPED_UNICODE);
        }
    }

    public  function messageSkip(){
        $id = $_POST['id'];
        $message = D('message');
        $resultArr = $message->where("id='$id'")->select();
        echo json_encode($resultArr,JSON_UNESCAPED_UNICODE);
    }

    public function messagePage($pageSize,$pageNum){
        $message = D('message');
        $total = $message ->count();
        $totalPage = $total%$pageSize ? (int)($total/$pageSize)+1 : (int)($total/$pageSize);
        $list = $message->page($pageNum.','.$pageSize)->select();
        if($list){
            $resultArr = array(
                'totalPage'=> $totalPage,
                'pageNum'=> $pageNum,
                'messageList'=> $list
            );
            $result = array(
                'code'=> '0',
                'ext'=> 'success',
                'obj'=> $resultArr
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }
}

