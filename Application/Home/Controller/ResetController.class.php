<?php
namespace Home\Controller;

use Think\Controller;

class ResetController extends Controller{

    public function reset(){
        $password = $_POST['password'];
        $id = $_SESSION['user_id'];
        $login = D('login');

        $data = $login->where("id='$id'")->setField('password',$password);

        if($data){
            
            $result = array(
                'code' => '0',
                'ext' => '修改成功！'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result = array(
                'code' => '1',
                'errMsg' => '修改失败！'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }

}