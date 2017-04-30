<?php    
namespace Home\Controller;

use Think\Controller;

class NeighborController extends Controller{

    public function send(){
        $send = $_POST['send'];
        $userid = $_SESSION['user_id'];

        $neighbor = D('neighbor');
        $data['message'] = $send;
        $data['ordertime'] = $ordertime;
        $data['userid'] = $userid;
        $data['creatTime'] = date('Y-m-d H:i:s'); 

        if($neighbor->create($data)){
            $id = $neighbor->add();
            if($id){
                $result = array(
                    'code'=> '0',
                    'ext'=> '发布成功！'
                );
                echo json_encode($result);
            }
        }else{
              $result = array(
                  'code'=> '1',
                  'errMsg'=> '发布失败'
              );
              echo json_encode($result);
        }
    }

    public function get(){
        $neighbor = M('neighbor');
        $service = $neighbor->getField('id,userid,creatTime,message');
        // ->where('stats.userid = profile.id')
        
        // $service = $neighbor->join('sun_login on sun_neighbor.userid = sun_login.id')->field('sun_login.telephone as userid, sun_neighbor.creatTime as creatTime, sun_neighbor.message as message');

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
}