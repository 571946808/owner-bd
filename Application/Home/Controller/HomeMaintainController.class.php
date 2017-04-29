<?php    
namespace Home\Controller;

use Think\Controller;

class HomeMaintainController extends Controller{

    public function homeMaintain(){
        $ownername = $_POST['ownername'];
        $telphone = $_POST['telphone'];
        $address = $_POST['address'];
        $ordertime = $_POST['time'];
        $description = $_POST['description'];
        $userid = $_SESSION['user_id'];

        $repair = D('repair');
        $data['linkman'] = $ownername;
        $data['phone'] = $telphone;
        $data['address'] = $address;
        $data['ordertime'] = $ordertime;
        $data['description'] = $description;
        $data['userid'] = $userid;

        $data['creatTime'] = $data['ordertime'] = date('Y-m-d H:i:s'); 
        $data['ordertime'] = $data['ordertime'] = date('Y-m-d H:i:s');
        $data['state'] = '家庭维修';
        if($repair->create($data)){
            $id = $repair->add();
            if($id){
                $result = array(
                    'code'=> '0',
                    'ext'=> '提交成功！'
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
}