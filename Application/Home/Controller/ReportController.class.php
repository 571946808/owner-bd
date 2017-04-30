<?php    
namespace Home\Controller;

use Think\Controller;

class ReportController extends Controller{

    public function gzh(){
        $comment = $_POST['comment'];
        $userid = $_SESSION['user_id'];

        $commentDB = D('comment');
        $data['comment'] = $comment;
        $data['userid'] = $userid;

        $data['creatTime'] = date('Y-m-d H:i:s'); 
        $data['status'] = '公众号';
        if($commentDB->create($data)){
            $id = $commentDB->add();
            if($id){
                $result = array(
                    'code'=> '0',
                    'ext'=> '留言成功！'
                );
                echo json_encode($result);
            }
        }else{
              $result = array(
                  'code'=> '1',
                  'errMsg'=> '留言失败'
              );
              echo json_encode($result);
        }
    }

    public function wy(){
        $comment = $_POST['comment'];
        $userid = $_SESSION['user_id'];

        $commentDB = D('comment');
        $data['comment'] = $comment;
        $data['userid'] = $userid;

        $data['creatTime'] = date('Y-m-d H:i:s'); 
        $data['status'] = '物业';
        if($commentDB->create($data)){
            $id = $commentDB->add();
            if($id){
                $result = array(
                    'code'=> '0',
                    'ext'=> '留言成功！'
                );
                echo json_encode($result);
            }
        }else{
              $result = array(
                  'code'=> '1',
                  'errMsg'=> '留言失败'
              );
              echo json_encode($result);
        }
    }
}