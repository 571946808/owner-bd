<?php
namespace Home\Controller;

use Think\Controller;

class CheckCodeController extends Controller
{
    // 获取验证码，刷新验证码
    public function getPicCode(){
        $config = array(
            'fontSize'=>30,    // 验证码字体大小
            'length'=>4,     // 验证码位数
            'useNoise'=>false, // 关闭验证码杂点
            'expire'=>600
        );
        $Verify = new \Think\Verify($config);
        $Verify->entry(2333);//2333是验证码标志
    }

    // 验证验证码是否正确
    public function checkPicCode(){
        
        $code = $_POST['code'];
        $verify = new \Think\Verify();
        if($verify->check($code, 2333)){
            $result = array(
                'code' => '0',
                'ext' => '验证通过'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result = array(
                'code' => '1',
                'ext' => '验证码错误，请重新输入'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        };
    }

}