<?php
namespace Home\Controller;
use Think\Controller;

class FindPswController extends Controller{
    public function index(){
        if(isset($_SESSION['user_id'])){
            $url = 'http://localhost/owner-bd/index.php/Home/Index/mange';
            header("location: $url");
        }else{
            $this->display();
        }
    }

//    public function forgetPsw(){
//        $telephone = $_POST['telephone'];
//        $findPsw = D('login');
//        $user_id = $_SESSION['user_id'];
//        $data = $findPsw->where("id='$user_id' and telephone='$telephone'")->find();
//        if($data){
//           $result = array(
//               'code'=> '0',
//               'ext'=> '手机号正确'
//           );
//            echo json_encode($result);
//        }else{
//            $result = array(
//                'code'=>'1',
//                'errMsg'=>'不是该用户注册手机号'
//            );
//            echo json_encode($result);
//        }
//
//    }


    public function findPsw(){
        $password = $_POST['password'];
        $confirmPsw = $_POST['confirmPsw'];
        $login = D('login');
//        $user_id = $_SESSION['user_id'];
        $telephone = $_SESSION['mobile'];
//        $data = $login->where("id = '$user_id' and telephone = '$telephone'")->find();
        $data = $login->where("telephone = '$telephone'")->find();
        if($data){
            if($password==$confirmPsw){
                $data['password'] = $password;
//                $login->where("id='$user_id'")->save($data);
                $login->save($data);
                $result = array(
                    'code' => '0',
                    'ext'  => '新密码设置成功'
                );
                echo json_encode($result,JSON_UNESCAPED_UNICODE);
            }else{
                $result = array(
                    'code'=>'2',
                    'errMsg'=>'密码不一致，请重新输入'
                );
                echo json_encode($result,JSON_UNESCAPED_UNICODE);
            }
        }else{
            $result = array(
                'code' => '1',
                'errMsg'=>'该用户未注册，请先注册！'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }

}
?>