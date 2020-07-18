<?php
namespace Home\Controller;

class OauthController extends HomeCommonController {
	
	public function login($type = null){
		empty($type) && $this->error('参数错误');
		session('login_http_referer',$_SERVER["HTTP_REFERER"]);
		$sns  = \Common\Lib\ThinkOauth::getInstance($type);
		//$this->redirect($sns->getRequestCodeURL());
		/*dump($sns->getRequestCodeURL());
		exit;*/
		header("Location:".$sns->getRequestCodeURL());
	}

	public function callback($type = null, $code = null){
		(empty($type)) && $this->error(lang('parameter error'));
		if(empty($code)){
			$this->redirect(__ROOT__."/");
		}	
		$sns  = \Common\Lib\ThinkOauth::getInstance($type);
		$extend = null;
		if($type == 'tencent'){
			$extend = array('openid' => I("openid"), 'openkey' => I("openkey"));
		}
		$token = $sns->getAccessToken($code , $extend);
		//获取当前登录用户信息
		if(is_array($token)){
			$user_info = controller('Token')->$type($token);
			$oauth_bang_s=session('oauth_bang');
			if(!empty($oauth_bang_s)){
				$this->_bang_handle($user_info, $type, $token);
			}else{
				$this->_login_handle($user_info, $type, $token);
			}
		}else{
			$this->success(lang('login failed'),$this->_get_login_redirect());
		}
	}
	
	function bang($type=""){
		if(session('hid')){
			empty($type) && $this->error(lang('parameter error'));
			$sns  = \Common\Lib\ThinkOauth::getInstance($type);
			session('oauth_bang',1);
			$this->redirect($sns->getRequestCodeURL());
		}else{
			$this->error(lang('not logged'));
		}
		
		
	}
	
	private function _get_login_redirect(){
		$login_http_referer_s=session('login_http_referer');
		return empty($login_http_referer_s)?__ROOT__."/":$login_http_referer_s;
	}
	
	//绑定第三方账号
	private function _bang_handle($user_info, $type, $token){
		$current_uid=session('hid');
		$type=strtolower($type);
		$find_oauth_user = M('OauthUser')->where(array("oauth_from"=>$type,"openid"=>$token['openid']))->find();
		$need_bang=true;
		if($find_oauth_user){
			if($find_oauth_user['uid']==$current_uid){
				$this->error(lang('bound already'),U('Center/bang'));exit;
			}else{
				$this->error(lang('bound other account'),U('Center/bang'));exit;
			}
		}
		
		if($need_bang){
			if($current_uid){
				//第三方用户表中创建数据
				$new_oauth_user_data = array(
						'oauth_from' => $type,
						'name' => $user_info['name'],
						'head_img' => $user_info['head'],
						'create_time' =>date("Y-m-d H:i:s"),
						'uid' => $current_uid,
						'last_login_time' => date("Y-m-d H:i:s"),
						'last_login_ip' => request()->ip(),
						'login_times' => 1,
						'user_status' => 1,
						'access_token' => $token['access_token'],
						'expires_date' => (int)(time()+$token['expires_in']),
						'openid' => $token['openid'],
				);
				$new_oauth_user_id=M('OauthUser')->insertGetId($new_oauth_user_data);
				if($new_oauth_user_id){
					$this->success(lang('bind success'),U('Center/bang'));
				}else{
					$this->error(lang('bind failed'),U('Center/bang'));
				}
			}else{
				$this->error(lang('bind failed'),U('Center/bang'));
			}
		}
	}
	
	//登陆
	private function _login_handle($user_info, $type, $token){
		$type=strtolower($type);
		$find_oauth_user = M('OauthUser')->where(array("oauth_from"=>$type,"openid"=>$token['openid']))->find();
		$need_register=true;
		if($find_oauth_user){
			$find_user = M("member_list")->where(array("member_list_id"=>$find_oauth_user['uid']))->find();
			if($find_user){
				$need_register=false;
				if($find_user['member_list_open']==0){
					$this->error(lang('user disabled'),$this->_get_login_redirect());
				}
				//更新字段
				$data = array(
					'last_login_time' => time(),
					'last_login_ip' => request()->ip(),
				);
				M("member_list")->where(array('member_list_id'=>$find_user["member_list_id"]))->update($data);
				session('hid',$find_user['member_list_id']);
				session('user',$find_user);
				
				//根据需要决定是否同步后台登录状态
				$admin=M('admin')->where('member_id',$find_user["member_list_id"])->find();
				if($admin){
					session('aid',$admin['admin_id']);
					//记录对应会员ID
					session('member_id',$admin['member_id']);				
					session('admin_username',$admin['admin_username']);
					session('admin_realname',$admin['admin_realname']);
					session('admin_avatar',$admin['admin_avatar']);
					session('admin_last_change_pwd_time', $admin ['admin_changepwd']);
				}
				
				$this->redirect($this->_get_login_redirect());
			}else{
				$need_register=true;
			}
		}
		
		if($need_register){
			//本地用户中创建对应一条数据
			$new_user_data = array(
					'member_list_username' => $user_info['name'],
					'member_list_nickname' => $user_info['name'],
					'member_list_headpic' => $user_info['head'],
					'member_list_addtime' => time(),
					'member_list_groupid'=>1,
					'member_list_sex'=>3,
					'member_list_open'=>1,
					'member_list_from'=>$type,
					'last_login_time' => time(),
					'last_login_ip' => request()->ip(),
					'user_status'=>1,//第三方默认已激活
			);
			$users_model=M("member_list");
			$new_user_id = M("member_list")->insertGetId($new_user_data);
			$new_user_data=M("member_list")->find($new_user_id);
			if($new_user_id){
				//第三方用户表中创建数据
				$new_oauth_user_data = array(
					'oauth_from' => $type,
					'name' => $user_info['name'],
					'head_img' => $user_info['head'],
					'create_time' =>time(),
					'uid' => $new_user_id,
					'last_login_time' => time(),
					'last_login_ip' => request()->ip(),
					'login_times' => 1,
					'user_status' => 1,
					'access_token' => $token['access_token'],
					'expires_date' => (int)(time()+$token['expires_in']),
					'openid' => $token['openid'],
				);
				$new_oauth_user_id=M("OauthUser")->insertGetId($new_oauth_user_data);
				if($new_oauth_user_id){
					session('hid',$new_user_id);
					session('user',$new_user_data);
					$this->redirect($this->_get_login_redirect());
				}else{
					$users_model->where(array("member_list_id"=>$new_user_id))->delete();
					$this->error(lang('login failed'),$this->_get_login_redirect());
				}
			}else{
				$this->error(lang('login failed'),$this->_get_login_redirect());
			}
			
		}
	}
}
?>