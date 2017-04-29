<?php
namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller{
    //登录页
    public function index()
    {
        echo '业主端后台';
        
    }

    public function login(){
        $telephone = $_POST['telephone'];
        $password = $_POST['password'];
        $login = D('login');
        //$map['telephone'] = $telephone;
        //$map['password'] = $password;
        //$data = $login->where($map)->find();
        $data = $login->where("telephone='$telephone' AND password='$password'")->find();
        if($data){
            $_SESSION['user_id']=$data['id'];
//            $_SESSION['telephone']=$data['telephone'];
            $result = array(
                'code' => '0',
                'ext' => '登录成功',
                'id' => $_SESSION['user_id']
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result = array(
                'code' => '1',
                'errMsg' => '用户名不存在或者密码错误'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }

    //首页
    public function  mange(){
        echo '这里是业主端首页';
    }
}