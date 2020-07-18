<?php
namespace Home\Controller;

class AjaxController extends HomeCommonController
{
	public function checkUsername(){
    }
	public function checkEmail(){
    }
	public function regsave(){
		$result['error'] = '';
		$result['tip'] = '';
		if (!IS_AJAX) {
            //exit(0);
			$result['error'] = '非法注册！';
			$this->ajaxReturn($result);
        }
        $password = I('password', '');

        $verify = I('vcode', '', 'htmlspecialchars,trim');
        if (C('CFG_VERIFY_REGISTER') == 1 && !check_verify($verify)) {
            //$this->error('验证码不正确');
			$result['error'] = '验证码不正确！';
			$this->ajaxReturn($result);
        }
        //M验证
        $validate = array(
            array('email', 'require', '电子邮箱必须填写！'),
            array('email', 'email', '邮箱格式不符合要求。'),
            //array('groupid','require','请选择会员组！'),
            array('password', 'require', '密码必须填写！'),
            array('rpassword', 'require', '确认密码必须填写！'),
            array('password', 'rpassword', '两次密码不一致', 0, 'confirm'),
            array('email', '', '邮箱已经存在！', 0, 'unique', 1), //使用这个是否存在，auto就不能自动完成
        );

        $db = M('member');
        if (!$db->validate($validate)->create()) {
            //$this->error($db->getError());
			$result['error'] = $db->getError();
			$this->ajaxReturn($result);
        }

        if (strlen($password) < 6 || strlen($password) > 20) {
            //$this->error('密码必须是6-20位的字符！', '', array('input' => 'password'));
			$result['error'] = '密码必须是6-20位的字符！';
			$this->ajaxReturn($result);
        }

        $username     = I('username', '', 'htmlspecialchars,trim');
        $notallowname = explode(',', C('CFG_MEMBER_NOTALLOW'));
        if (in_array($username, $notallowname)) {
            //$this->error('此昵称系统禁用，请重新更换一个！');
			$result['error'] = '此用户名系统禁用，请重新更换一个！';
			$this->ajaxReturn($result);
        }

        //判断后台是否开始邮件验证
        $data['groupid'] = 1; //新手上路
        /*
        $mGroup = M('membergroup')->Field('id')->find();
        if ($mGroup) {
        $data['groupid'] = $mGroup['id'];
        }
         */

        $email            = I('email', '', 'htmlspecialchars,trim');
        $data['email']    = $email;
        $data['username'] = $username;
        //代替自动完成
        $data['regtime']  = time();
        $passwordinfo     = I('password', '', 'get_password');
        $data['password'] = $passwordinfo['password'];
        $data['encrypt']  = $passwordinfo['encrypt'];
        $regtime          = date('Y年m月d日', time());
        $nextday          = date('Y年m月d日 H:i', strtotime("+2 day"));

        if ($id = $db->add($data)) {
			
			//记录积分操作
			$log['uid'] = $id;
			$log['scoreinfo'] = '+'.C('REGISTER_SCORE');
			$log['type'] = 1;
			$log['addtime'] = time();
			$log['title'] = $data['title'];
			$log['descrip'] = '注册会员，积分+'.C('REGISTER_SCORE');
			M('member_slog')->add($log);
			M('member')->where(array('id' => $id))->setInc('score',C('REGISTER_SCORE'));  //增加积分
			
            $msg              = '注册会员成功<br/>';
            $active['expire'] = strtotime("+2 day"); //二天后时间截,相当于time() + 2 * 24 * 60 * 60
            $active['code']   = get_randomstr(11);
            $active['userid'] = $id;
            $active['id']     = M('active')->add($active);

            $url = rtrim(C('CFG_WEBURL'), '/') . "/index.php?m=" . MODULE_NAME . "&c=Public&a=activate&va={$active['id']}&vc={$active['code']}";
            //$url = preg_replace("#http:\/\/#i", '', $url);
            //$url = 'http://'.preg_replace("#\/\/#i", '/', $url);

            $webname = C('CFG_WEBNAME');
            $weburl  = C('CFG_WEBURL');
            $weburl2 = str_replace('http://www.', '', $weburl);
            $webqq   = C('cfg_qq');
            $webmail = C('cfg_email');

            $subject = "[{$webname}]请激活你的帐号，完成注册";
            $message = <<<str
<p>您于 {$regtime} 注册{$webname}帐号 <a href="mailto:{$email}">{$email}</a> ，点击以下链接，即可激活该帐号：</p>
<p><a href="{$url}" target="_blank">{$url}</a></p>
<p>(如果您无法点击此链接，请将它复制到浏览器地址栏后访问)</p>
<p>为了保障您帐号的安全性，请在 48小时内完成激活，此链接将在您激活过一次后失效！</p>
<p>此邮件由系统发送，请勿直接回复。</p>
str;
            if (C('CFG_MEMBER_VERIFYEMAIL')) {
                if (send_mail($email, $subject, $message) == true) {
                    $msg .= '验证邮件已发送，请尽快查收邮件，激活该帐号';
                } else {

                    $msg .= '验证邮件发送失败，请写管理员联系';
                }
            }

            //$this->success($msg, U(MODULE_NAME . '/Public/login'));
			$result['error'] = '';
			$result['tip'] = '注册成功！';
			$this->ajaxReturn($result);
        } else {
            //$this->error('注册失败');
			$result['error'] = '注册失败！';
			$this->ajaxReturn($result);
        }
    }
	public function isLogin(){
		//dump($_COOKIE);
		if (!IS_AJAX) {
            exit();
        }
		
        $uid        = intval(get_cookie('uid'));
        $email      = get_cookie('email');
        $username   = get_cookie('username');
        $logintime  = get_cookie('logintime');
        $loginip    = get_cookie('loginip');
        $verifytime = intval(get_cookie('verifytime')); //上次登录时间

        $furl = '';

        $username = empty($username) ? $email : $username;

        if ($uid <= 0 || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            del_cookie(array('name' => 'uid'));
            del_cookie(array('name' => 'username'));
            del_cookie(array('name' => 'verifytime'));
            del_cookie(array('name' => 'logintime'));
            //$this->error('请登录', ''); //支持ajax,$this->error(info,url,array);
			$this->ajaxReturn(0);
        }

		$user = M('member')->where(array('id' => $uid, 'email' => $email))->find();
		if (!$user) {
			del_cookie(array('name' => 'uid'));
			del_cookie(array('name' => 'username'));
			del_cookie(array('name' => 'verifytime'));
			del_cookie(array('name' => 'logintime'));
			//$this->error('请登录!', '');
			$this->ajaxReturn(0);
		}
		if (date('Y-m-d', $user['logintime']) != date('Y-m-d', time())) {
		
		//记录积分操作
		/*$log['uid'] = $uid;
		$log['scoreinfo'] = '+'.C('LOGIN_SCORE');
		$log['type'] = 1;
		$log['addtime'] = time();
		$log['descrip'] = '自动登录成功，积分+'.C('LOGIN_SCORE');
		M('member_slog')->add($log);
		M('member')->where(array('id' => $uid))->setInc('score',C('LOGIN_SCORE'));  //增加积分*/
		
		set_cookie(array('name' => 'verifytime', 'value' => time())); //本次状态
		}

        //$this->success('已登录', $furl, array('username' => $username));
		$data['username'] = $username;
		$data['avatar'] = '';
		$data['is_collect'] = 0;
		$data['msg_num'] = 0;
		$data['userid'] = $uid;
		$data['tip'] = '登录成功！';
		$this->ajaxReturn($data);
    }
	public function checkLogin(){
		$data['error'] = '';
		$data['tip'] = '';
		if (!IS_AJAX) {
			$data['error'] = '非法提交！';
			$this->ajaxReturn($data);
        }

        $email    = I('email', '', 'htmlspecialchars,trim');
        $password = I('password', '');
		$rememberme = I('rememberme', '');
		
        $verify = I('vcode', '', 'htmlspecialchars,trim');
        if (C('CFG_VERIFY_LOGIN') == 1 && !check_verify($verify)) {
            //$this->error('验证码不正确');
			$data['error'] = '验证码不正确！';
			$this->ajaxReturn($data);
        }

        if ($email == '') {
            //$this->error('请输入帐号！', '', array('input' => 'email')); //支持ajax,$this->error(info,url,array);
			$data['error'] = '邮箱不能为空！';
			$this->ajaxReturn($data);
        }

        /*if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$data['error'] = '邮箱格式不正确！';
			$this->ajaxReturn($data);
        }*/

        if (strlen($password) < 6 || strlen($password) > 20) {
            //$this->error('密码必须是6-20位的字符！', '', array('input' => 'password'));
			$data['error'] = '密码必须是6-20位的字符！';
			$this->ajaxReturn($data);
        }

        $user = M('member')->where(array('email' => $email))->find();
		if(empty($user)){
			$user = M('member')->where(array('username' => $email))->find();
		}

        if (!$user || ($user['password'] != get_password($password, $user['encrypt']))) {
            //$this->error('账号或密码错误', '', array('input' => 'password'));
			$data['error'] = '账号或密码错误！';
			$this->ajaxReturn($data);
        }

        if ($user['islock']) {
            //$this->error('用户被锁定！', '', array('input' => ''));
			$data['error'] = '用户被锁定！';
			$this->ajaxReturn($data);
        }
		
        //更新数据库的参数
        $rs = array(
			'id' => $user['id'], //保存时会自动为此ID的更新
            'logintime'        => time(),
            'loginip'          => get_client_ip(),
            'loginnum'         => $user['loginnum'] + 1,

        );
        //更新数据库
        M('member')->save($rs);
		
		if($rememberme){
			$expire = time()+3600*24*14;
		}else{
			$expire = 0;
		}
        //保存Session
        //session(C('USER_AUTH_KEY'), $user['id']);
        //保存到cookie
        set_cookie(array('name' => 'uid', 'value' => $user['id'], 'expire' => $expire));
        set_cookie(array('name' => 'email', 'value' => $user['email'], 'expire' => $expire));
        set_cookie(array('name' => 'username', 'value' => $user['username'], 'expire' => $expire));
        set_cookie(array('name' => 'groupid', 'value' => $user['groupid'], 'expire' => $expire)); //20140801
        set_cookie(array('name' => 'logintime', 'value' => date('Y-m-d H:i:s', $user['logintime']), 'expire' => $expire));
        set_cookie(array('name' => 'loginip', 'value' => $user['loginip'], 'expire' => $expire));
        set_cookie(array('name' => 'status', 'value' => $user['status'], 'expire' => $expire)); //激活状态
        set_cookie(array('name' => 'verifytime', 'value' => time(), 'expire' => $expire)); //激活状态
		//set_cookie(array('name' => 'expiretime', 'value' => $expire, 'expire' => $expire));

        //跳转
        //$this->redirect(MODULE_NAME.'/Member/index');
        //redirect(__MODULE__);
        //$this->success('登录成功', $furl, array('input' => ''));
		$data['username'] = $user['username'];
		$data['avatar'] = $user['face'];
		$data['is_collect'] = $user['username'];
		$data['msg_num'] = $user['message'];
		$data['userid'] = $user['id'];
		//同一天内登录只加一次积分
		if (date('Y-m-d', $user['logintime']) != date('Y-m-d', time())) {
			
			//记录积分操作
			$log['uid'] = $user['id'];
			$log['scoreinfo'] = '+'.C('LOGIN_SCORE');
			$log['type'] = 1;
			$log['addtime'] = time();
			$log['descrip'] = '登录成功，积分+'.C('LOGIN_SCORE');
			M('member_slog')->add($log);
			M('member')->where(array('id' => $user['id']))->setInc('score',C('LOGIN_SCORE'));  //增加积分
			
			$data['tip'] = '登录成功！积分+'.C('LOGIN_SCORE');
		}else{
			$data['tip'] = '登录成功！';
		}
		
		$this->ajaxReturn($data);
    }
	
	public function downloadzip(){
		$id = I('id', 0, 'intval');
        $at = I('at', 0, 'intval');
		
		if (!$id) {
            //$this->error('参数错误');
			$this->ajaxReturn('0');
        }
		
		$user = get_user();
		if(!$user){
			$this->ajaxReturn('-1');
		}
		
        $downlist = M('soft')->where(array('id' => $id))->find();
		
		if($downlist['scores'] > 0 && $downlist['scores'] > $user['score']){
			$this->ajaxReturn('-2');
		}
		
		$downlink_tmp = $downlist['downlink'];
        if (empty($downlink_tmp)) {
            //$this->error('文件不存在');
			$this->ajaxReturn('0');
        }
		
		$downurl = U('Ajax/download?id='.$id.'&at='.$at);
		
		$this->ajaxReturn($downurl);
    }
	public function pdownloadzip(){
		$id = I('id', 0, 'intval');
        $at = I('at', 0, 'intval');
		
		if (!$id) {
            //$this->error('参数错误');
			$this->ajaxReturn('0');
        }
		
		$user = get_user();
		if(!$user){
			$this->ajaxReturn('-1');
		}
		
        $downlist = M('product')->where(array('id' => $id))->find();
		
		if($downlist['scores'] > 0 && $downlist['scores'] > $user['score']){
			$this->ajaxReturn('-2');
		}
		
		$downlink_tmp = $downlist['downlink'];
        if (empty($downlink_tmp)) {
            //$this->error('文件不存在');
			$this->ajaxReturn('0');
        }
		
		$downurl = U('Ajax/pdownload?id='.$id.'&at='.$at);
		
		$this->ajaxReturn($downurl);
    }
	public function pdownload(){
		$id = I('id', 0, 'intval');
        $at = I('at', 0, 'intval');
		
		if (!$id) {
            $this->error('参数错误');
        }
		
		$user = get_user();
		if(!$user){
			$this->error('您还未登录');
		}
		
        $downlist = M('product')->where(array('id' => $id))->find();
		
		if($downlist['scores'] > 0 ){
			if($downlist['scores'] > $user['score']){
				$this->error('您的积分不足');
			}else{
				//查询下载记录
				$isdown = M('download')->where(array('uid' => $user['id'],'tid' => $downlist['id']))->find();
				if(empty($isdown)){
					//记录积分操作
					$log['uid'] = $user['id'];
					$log['scoreinfo'] = '-'.$downlist['scores'];
					$log['type'] = 2;
					$log['addtime'] = time();
					$log['title'] = $downlist['title'];
					//$log['url'] = $downlist['url'];
					$log['descrip'] = '下载资源，积分-'.$downlist['scores'];
					M('member_slog')->add($log);
					M('member')->where('id='.$user['id'])->setDec('score',$downlist['scores']);  //减去相应积分
				}
			}
		}
		
		//保存下载记录
		$downinfo = array('uid'=>$user['id'],'tid'=>$downlist['id'],'mtype'=>$downlist['cid'],'addtime'=>time(),'uid_to'=>$downlist['userid'],'points'=>$downlist['scores'],'is_vip'=>0,'is_original'=>0);
		M('download')->add($downinfo);
		
		$downlink_tmp = $downlist['downlink'];
        if (empty($downlink_tmp)) {
            $this->error('文件不存在');
        }

        //下载地址:
        $downlink = array();
        foreach (explode('|||', $downlink_tmp) as $v) {
            //$temp_arr = explode('$$$', $v);
            if (!empty($v)) {
                $downlink[] = array(
                    //'url'   => $temp_arr[1],
					'url'   => $v,
                    //'title' => $temp_arr[0],
                );
            }
        }
        if (!isset($downlink[$at]['url'])) {
            //$this->error('文件不存在!');
			$this->ajaxReturn('0');
        }
		
		M('product')->where(array('id'=>$id))->setInc('downnum');
		
        $fileurl = trim($downlink[$at]['url']);

        $cfg_download_hide = C('CFG_DOWNLOAD_HIDE');

        //远程文件
        if (strpos($fileurl, ':/') || empty($cfg_download_hide)) {
            header("Location: $fileurl");
        } else {

            $filename = basename($fileurl);
            //处理中文文件

            $ext      = strtolower(substr(strrchr($filename, "."), 1)); //获取文件扩展名
            $filename = date('Ymd_his') . get_randomstr(3) . '.' . $ext;
            $this->downLocalFile($fileurl, $filename);

        }
    }

	public function download(){
		$id = I('id', 0, 'intval');
        $at = I('at', 0, 'intval');
		
		if (!$id) {
            $this->error('参数错误');
        }
		
		$user = get_user();
		if(!$user){
			$this->error('您还未登录');
		}
		
        $downlist = M('soft')->where(array('id' => $id))->find();
		
		if($downlist['scores'] > 0 ){
			if($downlist['scores'] > $user['score']){
				$this->error('您的积分不足');
			}else{
				//查询下载记录
				$isdown = M('download')->where(array('uid' => $user['id'],'tid' => $downlist['id']))->find();
				if(empty($isdown)){
					//记录积分操作
					$log['uid'] = $user['id'];
					$log['scoreinfo'] = '-'.$downlist['scores'];
					$log['type'] = 2;
					$log['addtime'] = time();
					$log['title'] = $downlist['title'];
					//$log['url'] = $downlist['url'];
					$log['descrip'] = '下载资源，积分-'.$downlist['scores'];
					M('member_slog')->add($log);
					M('member')->where('id='.$user['id'])->setDec('score',$downlist['scores']);  //减去相应积分
				}
			}
		}
		
		//保存下载记录
		$downinfo = array('uid'=>$user['id'],'tid'=>$downlist['id'],'mtype'=>$downlist['cid'],'addtime'=>time(),'uid_to'=>$downlist['userid'],'points'=>$downlist['scores'],'is_vip'=>0,'is_original'=>0);
		M('download')->add($downinfo);
		
		$downlink_tmp = $downlist['downlink'];
        if (empty($downlink_tmp)) {
            $this->error('文件不存在');
        }

        //下载地址:
        $downlink = array();
        foreach (explode('|||', $downlink_tmp) as $v) {
            //$temp_arr = explode('$$$', $v);
            if (!empty($v)) {
                $downlink[] = array(
                    //'url'   => $temp_arr[1],
					'url'   => $v,
                    //'title' => $temp_arr[0],
                );
            }
        }
        if (!isset($downlink[$at]['url'])) {
            //$this->error('文件不存在!');
			$this->ajaxReturn('0');
        }
		
		M('soft')->where(array('id'=>$id))->setInc('downnum');
		
        $fileurl = trim($downlink[$at]['url']);

        $cfg_download_hide = C('CFG_DOWNLOAD_HIDE');

        //远程文件
        if (strpos($fileurl, ':/') || empty($cfg_download_hide)) {
            header("Location: $fileurl");
        } else {

            $filename = basename($fileurl);
            //处理中文文件

            $ext      = strtolower(substr(strrchr($filename, "."), 1)); //获取文件扩展名
            $filename = date('Ymd_his') . get_randomstr(3) . '.' . $ext;
            $this->downLocalFile($fileurl, $filename);

        }
    }

    /**
     * 文件下载
     * @param $filepath 文件路径
     * @param $filename 文件名称
     */
    private function downLocalFile($filepath, $filename = '')
    {
        if (!$filename) {
            $filename = basename($filepath);
        }

        $doc_path = str_ireplace(str_replace("\\", "/", $_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_FILENAME']);
        $realpath = $doc_path . $filepath;
        if (!file_exists($realpath)) {
            header('HTTP/1.1 404 Not Found');
            echo "Error: 404 Not Found.(server file path error)<!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding -->";
            exit;
        }

        $filetype = strtolower(substr(strrchr($filename, "."), 1)); //获取文件扩展名
        $filesize = sprintf("%u", filesize($realpath));
        if (ob_get_length() !== false) {
            @ob_end_clean();
        }

        header('Pragma: public');
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header('Cache-Control: no-store, no-cache, must-revalidate');
        header('Cache-Control: pre-check=0, post-check=0, max-age=0');
        header('Content-Transfer-Encoding: binary');
        header('Content-Encoding: none');
        header('Content-type: ' . $filetype);
        if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) {
            //for IE
            header('Content-Disposition: attachment; filename="' . rawurlencode($filename) . '"');
        } else {
            header('Content-Disposition: attachment; filename="' . $filename . '"');
        }
        header('Content-length: ' . $filesize);
        readfile($realpath);
        exit;
    }
	
	public function updateInfo()
    {
        $uid = get_cookie('uid');
        if (IS_AJAX) {
            $data['nickname'] = I('nickname', '', 'htmlspecialchars,trim');
			$data['realname'] = I('nickname', '', 'htmlspecialchars,trim');
            $data['birthday'] = I('birthday', '0000-00-00');
            $data['sex']      = I('sex', 0, 'intval');
            $data['address']  = I('address', '');
            //$data['tel']      = I('tel', '');
            $data['mobile']   = I('mobile', '');
            $data['qq']       = I('qq', '');
			$data['job']       = I('job', '');
			$data['signature']       = I('signature', '');
            //$data['maxim']    = I('maxim', '');

            $data['userid']     = $uid;
            $data['updatetime'] = time();
            $type = I('type', 0, 'intval');
			
            if (empty($data['realname'])) {
                //$this->error('请输入姓名！');
				$this->ajaxReturn(0);
            }

            $result = true;
            if ($type) {
                $result = M('memberdetail')->add($data);
            } else {
                $result = M('memberdetail')->save($data);
            }

            if (false !== $result) {
                //$this->success('修改基本资料成功', U(MODULE_NAME . '/Member/person'));
				$this->ajaxReturn(1);
            } else {
                //$this->error('修改基本资料失败');
				$this->ajaxReturn(0);
            }
        }
    }
	
	public function email_check()
    {

        $uid = get_cookie('uid');
        if (empty($uid)) {
            //$this->error('请登录后尝试');
			$this->ajaxReturn('请登录后尝试');
        }

        $user    = M('member')->find($uid);
        $email   = $user['email'];
        $regtime = date('Y年m月d日', $user['regtime']);

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            //$this->error('你的邮箱格式有错误！');
			$this->ajaxReturn('你的邮箱格式有错误');
        }

        if ($user['status'] == 1) {
            //$this->error('你的帐号邮件已经激活，本操作无效！');
			$this->ajaxReturn('你的帐号邮件已经激活，本操作无效！');
        }

        $actinfo = M('active')->where(array('userid' => $uid, 'expire' => array('gt', time())))->find();
        $data    = array();
        //有记录
        if ($actinfo) {
            $data['id']     = $actinfo['id'];
            $data['expire'] = $actinfo['expire'];
            $data['code']   = $actinfo['code'];
            $data['userid'] = $uid;
        } else {

            $data['expire'] = strtotime("+2 day"); //二天后时间截,相当于time() + 2 * 24 * 60 * 60
            $data['code']   = get_randomstr(11);
            $data['userid'] = $uid;
            //M('active')->delete($uid);//清除有的记录
            $data['id'] = M('active')->add($data);

        }

        $nextday = date('Y年m月d日 H:i', $data['expire']);

        $url = rtrim(C('CFG_WEBURL'), '/') . "/index.php?m=" . MODULE_NAME . "&c=Public&a=activate&va={$data['id']}&vc={$data['code']}";
        //$url = preg_replace("#http:\/\/#i", '', $url);
        //$url = 'http://'.preg_replace("#\/\/#i", '/', $url);

        $webname = C('CFG_WEBNAME');
        $weburl  = C('CFG_WEBURL');
        $weburl2 = str_replace('http://www.', '', $weburl);
        $webqq   = C('cfg_qq');
        $webmail = C('cfg_email');

        $subject = "[{$webname}]会员邮件验证通知，完成激活";
        $message = <<<str
<p>您于 {$regtime} 注册{$webname}帐号 <a href="mailto:{$email}">{$email}</a> ，点击以下链接，即可激活该帐号：</p>
<p><a href="{$url}" target="_blank">{$url}</a></p>
<p>(如果您无法点击此链接，请将它复制到浏览器地址栏后访问)</p>
<p>为了保障您帐号的安全性，请在 48小时内完成激活，此链接将在您激活过一次后失效！</p>
<p>此邮件由系统发送，请勿直接回复。</p>
str;

        $msg = '';
        if (send_mail($email, $subject, $message) == true) {
            //$msg .= '验证邮件已发送，请尽快查收邮件，激活该帐号';
			$this->ajaxReturn('1');
        } else {
            //$msg .= '验证邮件发送失败，请写管理员联系';
			$this->ajaxReturn('验证邮件发送失败，请写管理员联系');
        }
        //$this->success($msg, U(MODULE_NAME . '/Member/index'), 10);

    }
	
}
?>