<?php
namespace Home\Controller;
use Think\Controller;

class RepairController extends Controller{
    public function index(){
        if(!isset($_SESSION['user_id']) || !$_SESSION['user_id']){
            $url = 'http://localhost/owner-bd/index.php/Home/Index/login';
            header("location: $url");
        }else{
//            // 家庭维修
//            $repair = M('repair');
//            $user_id = $_SESSION['user_id'];
//            $repairArr = $repair->where("user_id='$user_id'")->getField('id,description,createTime,verifiedstate');
//            $this->assign('repairArr',$repairArr);
//
//            //公共报修
//            $service = M('service');
//            $user_id = $_SESSION['user_id'];
//            $serviceArr = $service->where("user_id='$user_id'")->getField('id,description,createTime,verifiedstate');
//            $this->assign('serviceArr',$serviceArr);
//
//            $this->display();
            echo '这里我的提交页';

        }
    }

    //全部提交列表显示
    public function allList(){
        if(isset($_SESSION['user_id'])){
        //家庭维修数据获取
            $repair = M('repair');
            $user_id = $_SESSION['user_id'];
            $repairArr = $repair->where("user_id='$user_id'")->getField('id,description,createTime,verifiedstate');

            // 公共报修数据获取
            $service = M('service');
            $user_id = $_SESSION['user_id'];
            $serviceArr = $service->where("user_id='$user_id'")->getField('id,description,createTime,verifiedstate');

        //repair表添加type字段
            foreach($repairArr as $item=>$value){
                $value['type'] = '家庭维修';
                $GLOBALS['item'] = $item;
                $array["$item"] = $value;
            }
//            echo json_encode($array,JSON_UNESCAPED_UNICODE);

            //service表添加type字段
            foreach ($serviceArr as $item=>$value){
                $value['type'] = '公共报修';
                $item = $GLOBALS['item'] + 1;
                $array["$item"] = $value;
            }
//            echo json_encode($array,JSON_UNESCAPED_UNICODE);

            $result = array(
                'code'=>'0',
                'ext'=>'success',
                'obj'=> $array
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result = array(
                'code'=>'1',
                'errMsg'=>'用户未登录，请先登录'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }

    }

    //家庭维修列表显示
    public function repairList(){
        $repair = M('repair');
        $user_id = $_SESSION['user_id'];
        $repairArr = $repair->where("user_id='$user_id'")->getField('id,description,createTime,verifiedstate');
        if($repairArr){
            $result = array(
                'code' => '0',
                'ext' => 'success',
                'obj' => $repairArr
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result =array(
                'code'    => '1',
                'errMsg' => '用户无维修信息'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }

        
    }

    //公共报修列表显示
    public function serviceList(){
        $service = M('service');
        $user_id = $_SESSION['user_id'];
        $serviceArr = $service->where("user_id='$user_id'")->getField('id,description,createTime,verifiedstate');
        if($serviceArr){
            $result = array(
                'code' => '0',
                'ext' => 'success',
                'obj' => $serviceArr
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result =array(
                'code'    => '1',
                'errMsg' => '用户无报修信息'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }

}