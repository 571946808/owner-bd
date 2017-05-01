<?php    
namespace Home\Controller;

use Think\Controller;

class RegisterController extends Controller{
    //手机验证
    public function mobileVerify()
    {
        $mobile = $_POST['mobileInput'];
        $login = D('login');
        $data = $login->where("telephone='$mobile'")->find();
        if(!$data){
            $result = array(
                    'code' => '0',
                    "ext" => "手机未注册"
                );
            echo json_encode($result);
            }else{
            $result = array(
                    'code' => '1',
                    "errMsg" => "这个手机号已被使用，请重新输入或直接登录"
                );
            echo json_encode($result);
        }
    }

    public function register(){
        $mobile = $_POST['mobileInput'];
        $password = $_POST['passwordInput'];
        $password2 = $_POST['passwordaginInput'];
        if($password!=$password2){
            $result = array(
                    //'code' => '0'
                    'errMsg' => '两次密码输入不一致'
                );
            echo json_encode($result);
            return;
        }
        $login = D('login');
        $data['telephone'] = $mobile;
        $data['password'] = $password;
        $data['create_time'] = $data['update_time'] = date('Y-m-d H:i:s'); 
        $data['state'] = 0;
        if($login->create($data)){
            $id = $login->add();
            if($id){
                $_SESSION['user_id']=$id;
                $result = array(
                    'code'=> '0',
                    'ext'=> '新用户注册成功'
                );
                echo json_encode($result);
            }
        }else{
              $result = array(
                  'code'=> '1',
                  'errMsg'=> '注册失败'
              );
              echo json_encode($result);
        }
    }
}