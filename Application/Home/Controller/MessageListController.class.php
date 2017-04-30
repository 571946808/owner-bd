<?php
namespace Home\Controller;

use Think\Controller;

class MessageListController extends Controller{

    public function getList(){
        $messageList = M('messagelist');
        $service = $messageList->order('creatTime desc')->getField('id,message,creatTime');

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

    public function getListLimt(){
        $messageList = M('messagelist');
        $service = $messageList->order('creatTime desc')->limit(3)->getField('id,message,creatTime');

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