<?php

namespace Common\Model;

use Think\Model\ViewModel;

//视图模型
class ForumReplyViewModel extends ViewModel
{

    protected $viewFields = array(
        'forum_reply' => array('*',
            '_type' => 'LEFT',
        ),
        'model'   => array(
            'name'      => 'modelname',
            'tablename' => 'tablename',
            '_on'       => 'forum_reply.modelid = model.id', //_on 对应上面LEFT关联条件
            '_type'     => 'LEFT',
        ),
        'member'  => array(
            'face'     => 'face',
            'username' => 'username',
			'regtime' => 'regtime',
			'logintime' => 'logintime',
			'email' => 'email',
			'score' => 'score',
			'loginip' => 'loginip',
			'groupid' => 'groupid',
			'islock' => 'islock',
			'signed' => 'signed',
            '_on'      => 'forum_reply.userid = member.id', //_on 对应上面LEFT关联条件
        ),

    );
}
