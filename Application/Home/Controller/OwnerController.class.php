<?php
namespace Home\Controller;

use Think\Controller;

class OwnerController extends Controller
{
    public function index()
    {
        echo '风吹乱了我的秀发，连老天都嫉妒我的俊美';
    }

    // 增加业主
    public function add(){
    	if(!$_POST['username'] || !$_POST['password'] || !$_POST['email'] || !$_POST['nickname']){
    		$result = array(
    			'code' => '0',
    			'ext' => '参数不足' 
    		);
    		echo json_encode($result,JSON_UNESCAPED_UNICODE);
    		return;
    	}
    	$data['username'] = $_POST['username'];
    	$data['password'] = md5($_POST['password']);
    	$data['email'] = $_POST['email'];
    	$data['nickname'] = $_POST['nickname'];
    	$data['create_at'] = date('Y-m-d H:i:s');
    	$data['update_at'] = date('Y-m-d H:i:s');

    	$owner = D('owner');
    	if($owner->create($data)){
    	    $id = $owner->add();
    	    if($id){
    	        $owner_temp = $owner->where("id='$id'")->find();
    	        $result = array(
    	            'code'=> '0',
    	            'ext'=> 'success',
    	            'obj'=>$owner_temp
    	        );
    	        echo json_encode($result,JSON_UNESCAPED_UNICODE);
    	    }
    	}

    }

    // 修改业主
    public function edit(){
    	if(!$_POST['id'] || !$_POST['username'] || !$_POST['password'] || !$_POST['email'] || !$_POST['nickname']){
    		$result = array(
    			'code' => '0',
    			'ext' => '参数不足' 
    		);
    		echo json_encode($result,JSON_UNESCAPED_UNICODE);
    		return;
    	}
    	$id = $_POST['id'];
    	$data['username'] = $_POST['username'];
    	$data['password'] = md5($_POST['password']);
    	$data['email'] = $_POST['email'];
    	$data['nickname'] = $_POST['nickname'];
    	$data['update_at'] = date('Y-m-d H:i:s');

    	$owner = D('owner');
    	$success = $owner->where("id='$id'")->save($data);
    	if($success){
    	    $owner_temp = $owner->where("id='$id'")->find();
    	    $result = array(
    	        'code'=> '0',
    	        'ext'=> 'success',
    	        'obj'=>$owner_temp
    	    );
    	    echo json_encode($result,JSON_UNESCAPED_UNICODE);
    	}else {
    	    $result = array(
    	        'code'=> '1',
    	        'ext'=> '用户不存在'
    	    );
    	    echo json_encode($result,JSON_UNESCAPED_UNICODE);
    	}
    }

    // 删除业主
    public function delete(){
        $ownerId = $_POST['ownerId'];
        $data['state'] = 1;

        $owner = D('owner');
        $success = $owner->where("id='$ownerId'")->save($data);
        if($success){
            $result = array(
                'code'=> '0',
                'ext'=> 'success'
            );
            echo json_encode($result);
        }else {
            $result = array(
                'code'=> '1',
                'ext'=> 'fail'
            );
            echo json_encode($result);
        }
    }

    // 业主列表
    public function listAll(){
    	$owner = D('owner');
    	$resultArr = $owner->where('state=0')->order('update_at desc,id desc')->select();
        echo json_encode($resultArr,JSON_UNESCAPED_UNICODE);
    }

    // 根据id查找业主
    public function findById(){
        $ownerId = $_POST['ownerId'];
        $owner = D('owner');
        $ownerObj = $owner->where("id='$ownerId'")->find();
        if($ownerObj){
            $result = array(
                'code'=> '0',
                'ext'=> 'success',
                'obj'=> $ownerObj
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }else{
            $result = array(
                'code'=> '1',
                'ext'=> '没有找到记录'
            );
            echo json_encode($result,JSON_UNESCAPED_UNICODE);
        }
        
    }

    // 根据用户名查找业主
    public function findByOwername($ownername){

    }

}