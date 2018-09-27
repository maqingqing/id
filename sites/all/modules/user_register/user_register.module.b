<?php

//define('DRUPAL_ROOT',getcwd());
require_once DRUPAL_ROOT . '/includes/password.inc';
//require_once DRUPAL_ROOT . '/modules/user/user.module'

function user_register_menu(){
	$items[]=array();
	$items['u/register']=array(
	'title' => 'User Register',
        'access callback' => true ,
	'page callback' => 'register',
	);

	return $items;
}
/**
*新用户注册
*/
function register(){

	$name=$_POST['ID'];
	$pass=$_POST['pwd'];
	
	if(!valid_email_address($name)){
		 //drupal_json_output(array('code'=>'1006'));//1006 用户名为空或者格式不正确
		echo "OpenthosID格式错误或者为空!";
	}

	else{	
		if($pass==""){
	
		//	drupal_json_output(array('code'=>'1007'));//1007 密码为空
			echo "密码为空！";
		}
		else{
        		$account=user_load_by_name($name);
			if($account){
			//	drupal_json_output(array('code'=>'1003'));//1003用户名存在
				echo "注册ID已存在！";
			}
			else{
			$edit=array(
				'name'=>$name,
				'pass'=>$pass,		
				'mail'=>$name,
				'init'=>$name,
				'status'=>1
			);
		
			if(user_save(null, $edit)){

				// drupal_json_output(array('code'=>'1004'));//1004注册成功
				echo "注册成功！";
			}

			else{
	 		//	drupal_json_output(array('code'=>'1005'));//1005注册失败
				echo "注册失败！";
			}
	
        		}
		}
	}
}
