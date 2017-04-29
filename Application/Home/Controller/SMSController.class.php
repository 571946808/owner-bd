<?php
namespace Home\Controller;

use Think\Controller;

class SMSController extends Controller
{
    public function index()
    {
        echo '风吹乱了我的秀发，连老天都嫉妒我的俊美';
    }

    // 获取短信验证码
    public function getSMSCode(){

       /* $picCode = $_POST['picCode'];
        if(!$this->checkPicCode($picCode)){
            $result = array(
                'code' => '1',
                'ext' => '验证码错误，请重新输入'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
            return;9    
        }*/

        // create curl resource 
        $ch = curl_init(); 

        // set url
        $url = 'https://sms.yunpian.com/v1/sms/send.json'; 
        curl_setopt($ch, CURLOPT_URL, $url); 

        // set param
        $mobile = $_POST['mobile'];

        $_SESSION['mobile'] = $mobile; //设置密码页判断smscode和login表,手机号是否注册

        $code = $this->createSMSCode();
        $paramArr = array(
            'apikey' => 'b519e83e1c1468add1c0531fa195ce95',
            'mobile' => $mobile,
            'text' => '【小太阳】您的验证码是'.$code
        );
        $param = '';
        foreach ($paramArr as $key => $value) {
            $param .= urlencode($key).'='.urlencode($value).'&';
        }
        $param = substr($param, 0, strlen($param)-1);

        curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); //不验证证书下同
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false); 

        //return the transfer as a string 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 

        // $output contains the output string 
        $output = curl_exec($ch); 

        // close curl resource to free up system resources 
        curl_close($ch); 
        //$outputJson = json_decode($output);
        $outputArr = json_decode($output, true);
        //echo $outputJson->code;
        //echo $outputArr['code'];

        if($outputArr['code'] == '0'){
            $data['mobile'] = $mobile;
            $data['code'] = $code;

            $smscode = D('smscode');
            $smscodeObj = $smscode->where("mobile='$mobile'")->find();
            if($smscodeObj){
                $data['update_at'] = date('Y-m-d H:i:s');
                $success = $smscode->where("mobile='$mobile'")->save($data);
                if($success !== false){
                    $result = array(
                        'code' => '0',
                        'ext' => '修改成功',
                        'obj' => $smscodeObj
                    );
                }
                echo json_encode($result,JSON_UNESCAPED_UNICODE);
            }else{
                $data['create_at'] = date('Y-m-d H:i:s');
                $data['update_at'] = $data['create_at'];
                if($smscode->create($data)){
                    $id = $smscode->add();
                    if($id){
                        $smscode_temp = $smscode->where("id='$id'")->find();
                        $result = array(
                            'code'=> '0',
                            'ext'=> '创建成功',
                            'obj'=>$smscode_temp
                        );
                        echo json_encode($result,JSON_UNESCAPED_UNICODE);
                    }
                }
            }
            
        }
    }

    // 生成短信验证码
    public function createSMSCode($length = 4){
        $min = pow(10 , ($length - 1));
        $max = pow(10, $length) - 1;
        return rand($min, $max);
    }

    // 验证短信验证码是否有效
    public function checkSMSCode(){
        $mobile = $_POST['mobile'];
        $code = $_POST['code'];
        $nowTimeStr = date('Y-m-d H:i:s');

        $smscode = D('smscode');
        $smscodeObj = $smscode->where("mobile='$mobile'")->find();
        if($smscodeObj){
            $smsCodeTimeStr = $smscodeObj['update_at'];
            $recordCode = $smscodeObj['code'];
            $flag = $this->checkTime($nowTimeStr, $smsCodeTimeStr);
            if(!$flag){
                $result = array(
                    'code' => '1',
                    'ext' => '验证码过期，请刷新后重新获取'
                );
                echo json_encode($result,JSON_UNESCAPED_UNICODE);
                return;
            }

            if($code != $recordCode){
                $result = array(
                    'code' => '2',
                    'ext' => '验证码错误，请重新输入'
                );
                echo json_encode($result,JSON_UNESCAPED_UNICODE);
                return;
            }

            $result = array(
                'code' => '0',
                'ext' => '验证通过'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }

    // 验证验证码时间是否过期
    public function checkTime($nowTimeStr,$smsCodeTimeStr){
        //$nowTimeStr = '2016-10-15 14:39:59';
        //$smsCodeTimeStr = '2016-10-15 14:30:00';
        $nowTime = strtotime($nowTimeStr);
        $smsCodeTime = strtotime($smsCodeTimeStr);
        $period = floor(($nowTime-$smsCodeTime)/60); //60s
        if($period>=0 && $period<=20){
            return true;
        }else{
            return false;
        }
    }

    public function checkPicCode($picCode){
        $verify = new \Think\Verify();
        if($picCode==NULL)
        {
            $result = array(
                'code' => '1',
                'ext' => '验证码错误，请重新输入'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else
        {
            if($verify->check($picCode, 2333)){
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
}