<?php
namespace Home\Controller;
Header('Content-Type: text/html; charset=utf-8');
class TokenController
{
    //登录成功，获取腾讯QQ用户信息
    public function qq($token)
    {
        $qq = \Common\Lib\ThinkOauth::getInstance('Qq', $token);

        $data = $qq->call('user/get_user_info'); //调用接口 
        if (empty($data['ret'])) {
			$userInfo['type'] = 'QQ';
			$userInfo['name'] = $data['nickname'];
			$userInfo['nick'] = $data['nickname'];
			$userInfo['head'] = $data['figureurl_2'];
			return $userInfo;
        } else {
            E(lang('get qq info failed')."：{$data['msg']}");
        }
    }

    //登录成功，获取新浪微博用户信息
    public function sina($token)
    {
        $sina = \Common\Lib\ThinkOauth::getInstance('sina', $token);
        $data = $sina->call('users/show', "uid={$sina->openid()}");
        if (empty($data['error_code'])) {
            $userInfo['type'] = 'SINA';
            $userInfo['name'] = $data['name'];
            $userInfo['nick'] = $data['screen_name'];
            $userInfo['head'] = $data['avatar_large'];
            return $userInfo;
        } else {
            E(lang('get sina weibo info failed')."：{$data['error']}");
        }
    }
}