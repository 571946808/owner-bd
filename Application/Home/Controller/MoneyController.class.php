<?php    
namespace Home\Controller;

use Think\Controller;

class MoneyController extends Controller{

    public function moneyList(){
        $userid = $_SESSION['user_id'];

        $money = D('money');
        $status = 1;
        $service = $money->where("userid='$userid' and status='$status'")->getField('type,creatTime,money');

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

    public function moneyDetail(){
        $userid = $_SESSION['user_id'];
        $type = $_POST['type'];
        switch ($type) {
            case '1':
                $typeFlag = '物业费';
                break;
            case '2':
                $typeFlag = '水费';
                break;
            case '3':
                $typeFlag = '车位费';
                break;
            case '4':
                $typeFlag = '门禁卡';
                break;
            case '5':
                $typeFlag = '电梯卡';
                break;
            case '6':
                $typeFlag = '蓝牙卡';
                break;            
            default:
                $typeFlag = '物业费';
                break;
        }

        $money = D('money');
        $status = 0;
        $data['userid'] = $userid;
        $data['status'] = $status;
        $data['type'] = $typeFlag;
        $service = $money->where($data)->getField('id,type,creatTime,money,project,description');

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

    public function fankui(){
        $id = $_POST['id'];
        $send = $_POST['send'];

        $money = D('money');

        $data = $money->where("id='$id'")->setField('message',$send);

        if($data){
            $result = array(
                'code'=> '0',
                'ext'=> '保存成功！'
            );
            echo json_encode($result);
        }else{
              $result = array(
                  'code'=> '1',
                  'errMsg'=> '提交失败'
              );
              echo json_encode($result);
        }
    }
}