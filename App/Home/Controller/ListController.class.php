<?php

namespace Home\Controller;

use Common\Lib\Category;

class ListController extends HomeCommonController
{
    public function index()
    {
        $cid   = I('cid', 0, 'intval');
        $ename = I('e', '', 'htmlspecialchars,trim');
        $tagname = I('tagname', '', 'htmlspecialchars,trim');

        $cate = get_category();

        if (!empty($ename)) { //ename不为空
            $self = Category::getSelfByEName($cate, $ename); //当前栏目信息
        } else {
            //$cid来判断

            $self = Category::getSelf($cate, $cid); //当前栏目信息
        }

        if (empty($self)) {
            $this->error('栏目不存在');
        }

        $cid         = $self['id']; //当使用ename获取的时候，就要重新给$cid赋值，不然0
        $_GET['cid'] = $cid; //栏目ID
        $self['url'] = get_url($self);
        $pid = $self['pid'];

        //访问权限
        $groupid = intval(get_cookie('groupid'));
        $groupid = empty($groupid) ? 1 : $groupid; //1为游客
        //判断访问权限
        $access = M('categoryAccess')->where(array('catid' => $cid, 'flag' => 0, 'action' => 'visit'))->getField('roleid', true);
        //权限存在，则判断
        if (!empty($access) && !in_array($groupid, $access)) {
            $this->error('您没有访问该信息的权限！');
        }

        if ($tagname) {
            $title = $tagname.'_标签';
        } else {
            $title = empty($self['seotitle']) ? $self['name'] : $self['seotitle'];
        }

        $this->assign('cate', $self);
        $this->assign('flag_son', Category::hasChild($cate, $cid)); //是否包含子类
        $this->assign('title', $title);
        $this->assign('keywords', $self['keywords']);
        $this->assign('description', $self['description']);
        $this->assign('cid', $cid);
        $this->assign('pid', $pid);

        // $patterns = array('/^List_/', '/'.C('TMPL_TEMPLATE_SUFFIX').'$/');
        $patterns      = array('/' . C('TMPL_TEMPLATE_SUFFIX') . '$/');
        $replacements  = array('');
        $template_list = preg_replace($patterns, $replacements, $self['template_list']);

        if (empty($template_list)) {
            $this->error('模板不存在');
        }

        switch ($self['tablename']) {
            case 'article':
                //热门标签
                $cids = array();
                $cate_topic = M('category')->where("modelid=1")->Field('id')->select();
                foreach ($cate_topic as $c) {
                    $cids[] = $c['id'];
                }

                $map['tag_status'] = 1;
                $map['typeid'] = array('in',$cids);
                $tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
                $this->assign('tags', $tags);
                //$this->display($template_list);

                if ($tagname) {
                    $where = array('tag' => array('LIKE', '%' . $tagname . '%'));
                    $where['status'] = 1;
                    $count = D2('ArcView', 'article')->where($where)->count();

                    $ename = I('e', '', 'htmlspecialchars,trim');
                    if (!empty($ename) && C('URL_ROUTER_ON') == true) {
                        $param['p'] = I('p', 1, 'intval');
                        $param_action = '/'.$ename;
                    } else {
                        $param = array();
                        $param_action = '';
                    }
                    //设置显示的页数
                    //$thisPage = new \Common\Lib\Page($count, 20);
                    $thisPage = new \Common\Lib\Page($count, 15, $param, $param_action);
                    $thisPage->rollPage = 3;
                    $thisPage->setConfig('prev', "上一页");
                    $thisPage->setConfig('next', "下一页");
                    $thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
                    $limit = $thisPage->firstRow . ',' . $thisPage->listRows;
                    $page  = $thisPage->show();

                    $vlist = array();
                    $vlist = D2('ArcView', 'article')->nofield('content')->where($where)->order('id desc')->limit($limit)->select();
                    foreach ($vlist as $k => $v) {
                        if (isset($v['flag'])) {
                            $_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
                            $_jumpurl  = $v['jumpurl'];
                        } else {
                            $_jumpflag = false;
                            $_jumpurl  = '';
                        }
                        $vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], $_jumpflag, $_jumpurl);
                        $type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);
                        $vlist[$k]['curl'] = get_url($type);
                        $vlist[$k]['comment'] = get_comment($v['id'], $v['modelid']);
                    }

                    $this->assign('vlist', $vlist);
                    $this->assign('tagname', $tagname);
                    $this->assign('page1', $page);
                    $this->display('article_tag');
                } else {
                    $this->display($template_list);
                }
                return;
                break;
            case 'product':
            if ($self['property']) {
                $map['id'] = array('in',$self['property']);
                $proplist = M('property')->where($map)->order('listorder ASC')->select();

                $pstr = '';
                if ($proplist) {
                    $m = 0;
                    for ($h=1;$h<count($proplist)+1;$h++) {
                        $propid = intval($_GET['q'.$h]);
                        if ($propid > 0) {
                            if ($m == 0) {
                                $where['_string'] .= 'FIND_IN_SET('.$propid.',prop_value)';
                            } else {
                                $where['_string'] .= ' AND FIND_IN_SET('.$propid.',prop_value)';
                            }
                            $propv = M('PropertyValue')->where("id=$propid")->find();
                            $pstr .= $propv['vname'];
                            $m++;
                        }
                    }
                    if (!empty($pstr)) {
                        $pstr = '_'.$pstr;
                    }
                }

                $ids = Category::getChildsId(get_category(), $cid, true);

                $where['status'] = 1;
                $where['cid'] = array('IN',$ids);

                $pagesize = 20;
                $pageroll = 3;
                $count = D2('ArcView', 'product')->where($where)->count();

                $ename = I('e', '', 'htmlspecialchars,trim');
                if (!empty($ename) && C('URL_ROUTER_ON') == true) {
                    $param['p'] = I('p', 1, 'intval');

                    for ($h=1;$h<count($proplist)+1;$h++) {
                        $q = I('q'.$h, 0, 'intval');
                        if ($q) {
                            $param['q'.$h] = $q;
                        }
                    }

                    $param_action = '/'.$ename;
                } else {
                    $param = array();
                    $param_action = '';
                }

                $thisPage = new \Common\Lib\Page($count, $pagesize, $param, $param_action);

                //设置显示的页数
                $thisPage->rollPage = $pageroll;
                $thisPage->setConfig('prev', "上一页");
                $thisPage->setConfig('next', "下一页");
                $thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
                $limit = $thisPage->firstRow. ',' .$thisPage->listRows;
                $page = $thisPage->show();

                $order = isset($_GET['order'])?$_GET['order']:0;
                switch ($order) {
                        case '1':
                            $order = 'id DESC';
                        break;
                        case '2':
                            $order = 'click DESC';
                        break;
                        default:
                            $order = 'id DESC';
                    }

                $vlist = D2('ArcView', 'product')->nofield('content')->where($where)->order($order)->limit($limit)->select();

                if (!empty($vlist)) {
                    foreach ($vlist as $k => $v) {
                        if (isset($v['flag'])) {
                            $_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
                            $_jumpurl  = $v['jumpurl'];
                        } else {
                            $_jumpflag = false;
                            $_jumpurl  = '';
                        }
                        $vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], $_jumpflag, $_jumpurl);
                        $type = Category::getSelf(get_category(0), $v['cid']);
                        $vlist[$k]['curl'] = get_url($type);
                        $vlist[$k]['comment'] = get_comment($v['id'], $v['modelid']);
                    }
                }
                //dump($vlist);
                $this->assign('ptitle', $pstr);
                $this->assign('proplist', $proplist);
                $this->assign('vlist', $vlist);
                $this->assign('page1', $page);
            }
                $this->display($template_list);

                return;
                break;
            case 'picture':
                $this->display($template_list);
                return;
                break;
            case 'soft':
                if ($self['property']) {
                    $map['id'] = array('in',$self['property']);
                    $proplist = M('property')->where($map)->order('listorder ASC')->select();

                    $pstr = '';
                    if ($proplist) {
                        $m = 0;
                        for ($h=1;$h<count($proplist)+1;$h++) {
                            $propid = intval($_GET['q'.$h]);
                            if ($propid > 0) {
                                if ($m == 0) {
                                    $where['_string'] .= 'FIND_IN_SET('.$propid.',prop_value)';
                                } else {
                                    $where['_string'] .= ' AND FIND_IN_SET('.$propid.',prop_value)';
                                }
                                $propv = M('PropertyValue')->where("id=$propid")->find();
                                $pstr .= $propv['vname'];
                                $m++;
                            }
                        }
                        if (!empty($pstr)) {
                            $pstr = '_'.$pstr;
                        }
                    }

                    $ids = Category::getChildsId(get_category(), $cid, true);

                    $where['status'] = 1;
                    $where['cid'] = array('IN',$ids);

                    $pagesize = 20;
                    $pageroll = 3;
                    $count = D2('ArcView', 'soft')->where($where)->count();

                    $ename = I('e', '', 'htmlspecialchars,trim');
                    if (!empty($ename) && C('URL_ROUTER_ON') == true) {
                        $param['p'] = I('p', 1, 'intval');

                        for ($h=1;$h<count($proplist)+1;$h++) {
                            $q = I('q'.$h, 0, 'intval');
                            if ($q) {
                                $param['q'.$h] = $q;
                            }
                        }

                        $param_action = '/'.$ename;
                    } else {
                        $param = array();
                        $param_action = '';
                    }

                    $thisPage = new \Common\Lib\Page($count, $pagesize, $param, $param_action);

                    //设置显示的页数
                    $thisPage->rollPage = $pageroll;
                    $thisPage->setConfig('prev', "上一页");
                    $thisPage->setConfig('next', "下一页");
                    $thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
                    $limit = $thisPage->firstRow. ',' .$thisPage->listRows;
                    $page = $thisPage->show();

                    $order = isset($_GET['order'])?$_GET['order']:0;
                    switch ($order) {
                        case '1':
                            $order = 'id DESC';
                        break;
                        case '2':
                            $order = 'click DESC';
                        break;
                        default:
                            $order = 'id DESC';
                    }

                    $vlist = D2('ArcView', 'soft')->nofield('content')->where($where)->order($order)->limit($limit)->select();

                    if (!empty($vlist)) {
                        foreach ($vlist as $k => $v) {
                            if (isset($v['flag'])) {
                                $_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
                                $_jumpurl  = $v['jumpurl'];
                            } else {
                                $_jumpflag = false;
                                $_jumpurl  = '';
                            }
                            $vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], $_jumpflag, $_jumpurl);
                            $type = Category::getSelf(get_category(0), $v['cid']);
                            $vlist[$k]['curl'] = get_url($type);
                            $vlist[$k]['comment'] = get_comment($v['id'], $v['modelid']);
                        }
                    }
                    //dump($vlist);
                    $this->assign('ptitle', $pstr);
                    $this->assign('proplist', $proplist);
                    $this->assign('vlist', $vlist);
                    $this->assign('page1', $page);
                }
                $this->display($template_list);
                return;
                break;
            case 'page':
                {
                    $cate            = M('Category')->Field('content')->find($cid);
                    $self['content'] = $cate['content'];
                    $this->assign('cate', $self);
                    $this->display($template_list);
                }
                return;
                break;
            case 'phrase':
                $this->display($template_list);
                return;
                break;
            case 'topic':
                //热门标签
                $cids = array();
                $cate_topic = M('category')->where("modelid=7")->Field('id')->select();
                foreach ($cate_topic as $c) {
                    $cids[] = $c['id'];
                }

                $map['tag_status'] = 1;
                $map['typeid'] = array('in',$cids);
                $tags = M('tag')->where($map)->order('tag_click DESC')->limit(18)->select();
                $this->assign('tags', $tags);

                if ($tagname) {
                    $where = array('tag' => array('LIKE', '%' . $tagname . '%'));
                    $where['status'] = 1;
                    $count = D2('ArcView', 'topic')->where($where)->count();

                    $ename = I('e', '', 'htmlspecialchars,trim');
                    if (!empty($ename) && C('URL_ROUTER_ON') == true) {
                        $param['p'] = I('p', 1, 'intval');
                        $param_action = '/'.$ename;
                    } else {
                        $param = array();
                        $param_action = '';
                    }
                    //设置显示的页数
                    //$thisPage = new \Common\Lib\Page($count, 20);
                    $thisPage = new \Common\Lib\Page($count, 15, $param, $param_action);
                    $thisPage->rollPage = 3;
                    $thisPage->setConfig('prev', "上一页");
                    $thisPage->setConfig('next', "下一页");
                    $thisPage->setConfig('theme', ' %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
                    $limit = $thisPage->firstRow . ',' . $thisPage->listRows;
                    $page  = $thisPage->show();

                    $vlist = array();
                    $vlist = D2('ArcView', 'topic')->nofield('content')->where($where)->order('id desc')->limit($limit)->select();
                    foreach ($vlist as $k => $v) {
                        if (isset($v['flag'])) {
                            $_jumpflag = ($v['flag'] & B_JUMP) == B_JUMP ? true : false;
                            $_jumpurl  = $v['jumpurl'];
                        } else {
                            $_jumpflag = false;
                            $_jumpurl  = '';
                        }
                        $vlist[$k]['url'] = get_content_url($v['id'], $v['cid'], $v['ename'], $_jumpflag, $_jumpurl);
                        $type = \Common\Lib\Category::getSelf(get_category(0), $v['cid']);
                        $vlist[$k]['curl'] = get_url($type);
                        $vlist[$k]['comment'] = get_comment($v['id'], $v['modelid']);
                    }
                    $this->assign('vlist', $vlist);
                    $this->assign('tagname', $tagname);
                    $this->assign('page1', $page);
                    $this->display('topic_tag');
                } else {
                    $this->display($template_list);
                }
                return;
                break;
            default:
                //$this->error('参数错误');
                $userOther = A(ucfirst($self['tablename']));
                $userOther->lists();
                return;
                break;
        }

        $this->display();
    }

    public function map()
    {
        $this->assign('title', '网站地图');
        $this->assign('keywords', '网站地图');
        $this->assign('description', '网站地图');
        $this->display();
    }
}
