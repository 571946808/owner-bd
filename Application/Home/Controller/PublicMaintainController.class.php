<?php    
namespace Home\Controller;

use Think\Controller;

class PublicMaintainController extends Controller{

    public function publicMaintain(){
        $ownername = $_POST['ownername'];
        $telphone = $_POST['telphone'];
        $address = $_POST['address'];
        $description = $_POST['description'];
        $userid = $_SESSION['user_id'];

        $repair = D('repair');
        $data['linkman'] = $ownername;
        $data['phone'] = $telphone;
        $data['address'] = $address;
        $data['description'] = $description;
        $data['userid'] = $userid;

        $data['creatTime'] = $data['ordertime'] = date('Y-m-d H:i:s'); 
        $data['state'] = '公共设施报修';
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