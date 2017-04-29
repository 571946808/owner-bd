<?php
namespace Home\Controller;
use Think\Controller;

class SubmitDetailController extends Controller{

    //家庭维修显示
    public function repairShow(){
        $repair = M('repair');
        $id = $_POST['id'];
        $repairArr = $repair->where("id='$id'")->getfield('id,createTime,description,pic,verifiedstate,repairName,repairPhone');
        //$pic = $repairArr->pic;     
        //$repairArr['pic'] = explode(",",$repairArr['pic']);
        //$strarr = explode(",",$u);

        if($repairArr){
            $result = array(
                'code' => '0',
                'ext' => 'success',
                'obj' => $repairArr,
                //'pic' =>$pic
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result =array(
                'code'    => '1',
                'errMsg' => '显示错误'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
  
    }

    //公共报修列表显示
    public function serviceShow(){
        $service = M('service');
        $id = $_POST['id'];
        $serviceArr = $service->where("id='$id'")->getField('id,createTime,description,pic,verifiedstate');
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
                'errMsg' => '显示错误'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }

    public function delete()
    {
        $id = $_POST['id'];
        $type = $_POST['type'];
        if($type == "维修"){
            $repair = M('repair');
            $success = $repair->where("id='$id'")->delete();
        }else{
            $service = M('service');
            $success = $service->where("id='$id'")->delete();
        }        
        if($success){
            $result = array(
                'code'=> '0',
                'ext'=> 'success'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else {
            $result = array(
                'code'=> '1',
                'ext'=> 'fail'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
    }
}