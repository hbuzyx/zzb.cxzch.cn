<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0019)http://j.hbxuwe.cn/ -->
<html class="js cssanimations"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="order by dede58.com/">
      <title>紫塞先锋 - 紫塞先锋</title>
        <meta name="keywords" content="紫塞先锋" />
        <meta name="description" content="紫塞先锋" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/Public/Home/sucai/zzb/amazeui.min.css">
<link rel="stylesheet" href="/Public/Home/sucai/zzb/app.css">
<link rel="stylesheet" href="/Public/Home/sucai/zzb/index.css">
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/Public/Home/sucai/zzb/jquery.min.js"></script>
<!--<![endif]-->
<script src="/Public/Home/sucai/zzb/amazeui.min.js"></script>

</head>
<body>
    <!--<div id="site_nav">
            <div  class="sn_container clearfix">
                <ul class="tg_tools fr">
                    <li class="no-hover" style="display: none">
                        <a id="msg_notify" class="msg_notify" href="<?php echo U('Member/message');?>"></a>
                    </li>
                    <li class="box_color nav_home hide haslogin">
                        <span><a href="<?php echo U('Member/index');?>">个人中心</a></span><b class="icon"></b>
                        <ul>
                            <li><a href="<?php echo U('Member/index');?>"><span>我的主页</span></a></li>
                            <li><a href="<?php echo U('Member/person');?>"><span>个人设置</span></a></li>
                            <li><a href="<?php echo U('Member/index');?>"><span>我的签到</span></a></li>
                            <li><a href="<?php echo U('Public/logout');?>"><span>退出登录</span></a></li>
                        </ul>
                    </li>
                    <li class="tg-line"></li>
                    <li class="box_color">
                        <span>帮助中心</span><b class="icon"></b>
                        <ul>
                        	<?php
 $_typeid = intval(1); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li><a href="<?php echo ($catlist["url"]); ?>"><span><?php echo ($catlist["name"]); ?></span></a></li><?php endforeach;?>
                        </ul>
                    </li>
                    <li class="tg-line"></li>
                    <li class="box_color">
                        <span><a href="<?php echo U('Tag/lists');?>">标签库</a></span>
                    </li>
                </ul>
                <ul class="tg_tools fl" id="login_area" style="display: block;">
                    <li class="tg_tools_home no-hover"><i class="icon-more"></i><span><a href="http://zzb.cxzch.cn/">小楠首页</a></span></li>
                    <li class="no-hover hide haslogin"><span><a href="<?php echo U('Member/index');?>"><font class="sn_login username" id="head_username"></font></a></span></li>
                    <li class="tg-line icon"></li>
                    <li class="no-hover hide haslogin"><span><a href="<?php echo U('Public/logout');?>">退出</a></span></li>

                    <li class="no-hover nologin"><span><a href="<?php echo U('Public/register');?>">注册</a></span></li>
                    <li class="tg-line icon"></li>
                    <li class="box_color nav_home" id="nav_login"><span><a href="<?php echo U('Public/login');?>" class="sn_login">登录</a></span></li>
                </ul>
            </div>
        </div>
<div id="header">
    <div class="tg_tools_home">
        <div class="bbs_enter">
           <a class="bbs-banner"  href="Member/pay.html" target="_blank"><img src="/Public/Home/sucai/images/other/banner.jpg" alt="充值"></a>
        </div>
        <div class="logo">
            <a class="logo-bd" href="http://zzb.cxzch.cn/"><img src="/Public/Home/sucai/images/logo.png" alt="紫塞先锋logo"></a>
        </div>
        <form action="/index.php?s=/Search-index.html" method="get" id="form_search" onsubmit="return searchSub()">
            <div id="search">
                <div class="search_area">
                    <input type="submit" value="搜 索" class="btn_search">
                    <div class="search_select">
                        <span class="icon-search"></span>
                    </div>
                    <input type="text" value='请输入搜索内容'  class="search_input"  autocomplete="off" id="search_input" data-default="请输入搜索内容" onblur="checkInputBlur($(this))" onfocus="checkInputFocus($(this))" />
                    <input type="hidden" name="modelid" value="5" />
                    <input type="hidden" name="keyword" />
                </div>
                <div class="search_box hide" id="search_box"></div>
                <div class="search_keywords" >
                    <span>热门搜索：</span>
                    <?php if(is_array($searchkey)): $i = 0; $__LIST__ = $searchkey;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a href="<?php echo U('Search/index');?>?modelid=5&keyword=<?php echo ($vo["keyword"]); ?>"><?php echo ($vo["keyword"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="nav" class="nav">
    <div class='nav_main clearfix'>
        <a href="http://zzb.cxzch.cn/" title="紫塞先锋" class="menu <?php if($cid == ''): ?>current<?php endif; ?>" >首 页</a>
        <?php
 $_typeid = 0; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $_navlist = get_category(1); if($_typeid == 0) { $_navlist = Common\Lib\Category::toLayer($_navlist); }else { $_navlist = Common\Lib\Category::toLayer($_navlist, 'child', $_typeid); } foreach($_navlist as $autoindex => $navlist): $navlist['url'] = get_url($navlist); ?><a href="<?php echo ($navlist["url"]); ?>" title="<?php echo ($navlist["name"]); ?>" class="menu <?php if($cid == $navlist['id'] or $pid == $navlist['id']): ?>current<?php endif; ?>" ><?php echo ($navlist["name"]); ?></a><?php endforeach;?>
        <span class="icon_hot"></span>
    </div>
</div>-->
<div class="head" style="position:relative">
  <div class="wap_logo">
    <a href="http://j.hbxuwe.cn/"><img src="/Public/Home/sucai/zzb/logo.png"/></a>
  </div>
  <div class="banner">
    <!-- <div class="banner_top"></div> -->
    <div
      data-am-widget="slider"
      class="am-slider am-slider-a2 am-no-layout"
      data-am-slider='{"directionNav":false,"slideshowSpeed": 5000,"animationSpeed": 1000,"animation": "fade","slideshow:":false}'
    >
<!--
      data-am-slider='{"slideshow:":false}'
    >
-->
      <ul class="am-slides">
        <li
          class="am-active-slide"
          data-thumb-alt=""
          style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;"
        >
          <div
            class="ddsgg"
            style="background: url(/uploads/img1/banner1.png);background-size: 100% 100%;"
          ></div>
        </li>
        <li
          class="am-active-slide"
          data-thumb-alt=""
          style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 2;"
        >
          <div
            class="ddsgg"
            style="background: url(/uploads/img1/banner2.png);background-size: 100% 100%;"
          ></div>
        </li>



</ul>
      <ol class="am-control-nav am-control-paging">
        <li><a href="http://j.hbxuwe.cn/#" class="">1</a><i></i></li>
      </ol>
<div style="background: url(/uploads/img1/tc.png);width: 100%; height: 238px; margin-right: -100%; top: 0px; position: absolute;; z-index: 9;"></div>
    </div>
  </div>
</div>


<div class="nav" id="nav">
  <div class="jz">
    <ul class="nav_main">
      <li class="yiji_li"><a class="wh_wbd" href="http://zzb.cxzch.cn/">首页</a></li>
      <?php
 $_typeid = 0; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $_navlist = get_category(1); if($_typeid == 0) { $_navlist = Common\Lib\Category::toLayer($_navlist); }else { $_navlist = Common\Lib\Category::toLayer($_navlist, 'child', $_typeid); } foreach($_navlist as $autoindex => $navlist): $navlist['url'] = get_url($navlist); ?><li
          class="yiji_li"
          style="<?php if($navlist["id"] == 50 or $navlist["id"] == 8 or $navlist["id"] == 42): ?>display:none;<?php endif; ?>"
        >
          <a class="wh_wbd " href="<?php echo ($navlist["url"]); ?>"><?php echo ($navlist["name"]); ?></a>
          <ul class="nav_c">
            <?php if(is_array($navlist["child"])): $i = 0; $__LIST__ = array_slice($navlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li class="erji_li c"> <a href="<?php echo ($v["ename"]); ?>"><?php echo ($v["name"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
          </ul>
        </li><?php endforeach;?>
    </ul>
  </div>
</div>
<nav
  data-am-widget="menu"
  class="am-menu  am-menu-dropdown1 am-no-layout"
  data-am-menu-collapse=""
>
  <a href="javascript: void(0)" class="am-menu-toggle">
    <img src="/Public/Home/sucai/zzb/ddh.png" alt="Menu Toggle" />
  </a>
  <ul class="am-menu-nav am-avg-sm-1 am-collapse" style="height: 0px;">
    <?php
 $_typeid = 0; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $_navlist = get_category(1); if($_typeid == 0) { $_navlist = Common\Lib\Category::toLayer($_navlist); }else { $_navlist = Common\Lib\Category::toLayer($_navlist, 'child', $_typeid); } foreach($_navlist as $autoindex => $navlist): $navlist['url'] = get_url($navlist); ?><li class="am-parent" style="">
        <a href="<?php echo ($navlist["url"]); ?>" class=""><?php echo ($navlist["name"]); ?></a>
        <ul class="am-menu-sub am-collapse  am-avg-sm-2 ">
          <?php if(is_array($navlist["child"])): $i = 0; $__LIST__ = array_slice($navlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li class=""> <a href="<?php echo ($v["ename"]); ?>"><?php echo ($v["name"]); ?></a> </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
      </li><?php endforeach;?>
  </ul>
</nav>

<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a
        href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->

<!-- 代码区 -->

<!--<div class="sbanner"><ul class="am-slides"><li>
        <div class="ddsgg" style="background: url(/skin/img/banner.jpg) no-repeat center;"> </div>
      </li></ul></div>
 <div class="sbanner">
 <div class="banner_top"></div>
 <div data-am-widget="slider" class="am-slider am-slider-a2" data-am-slider='{"directionNav":false,"slideshowSpeed": 3000,"animationSpeed": 1000,"animation": "fade"}' >
  <ul class="am-slides">

   <li>
        <div class="ddsgg" style="background: url(/uploads/191027/1-19102H20101619.jpg) no-repeat center;">

        </div>
      </li>
<li>
        <div class="ddsgg" style="background: url(/uploads/191027/1-19102H20032134.jpg) no-repeat center;">

        </div>
      </li>

    </li>

  </ul>
  </div>
</div>
-->


<div class="hot">
  <div class="jz">
	  <div class="hot_gz l"> 先锋头条 <span><?php echo date('Y-m-d', time()); ?></span> </div>
    <div class="hot_news l"> <a href="http://j.hbxuwe.cn/a/tongzhigonggao/xingyedongtai/60.html" class="h_bt">王东峰主持召开“不忘初心、牢记使命”主题教育座谈会就加强党的建设特别是政治建设征求意见建议</a> <a href="http://j.hbxuwe.cn/a/tongzhigonggao/xingyedongtai/60.html" class="h_nr">座谈会上，来自省党建研究会、省委党史研究室、省社会科学院、省委宣传部、省委政研室、省委党校（河北行政学院）、河北大学马克思主义学院、河北经贸大学马克...</a>
 </div>
  </div>
</div>
<div class="cont">
  <div class="jz">
    <div class="c_bka">
      <div data-am-widget="slider" class="am-slider am-slider-c3 c_bkat am-no-layout" data-am-slider="{&quot;controlNav&quot;:false}" style="float:left;" >
        <ul class="am-slides">

           <?php
 $_typeid = 53; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (4 > 0) { $where['_string'] = $_tablename.'.flag & 4 = 4 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "5"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li style="width: 536px; margin-right: 0px; float: left; display: block;" class="am-active-slide"> <a href="<?php echo ($list["url"]); ?>">
            <img src="<?php echo ($list["litpic"]); ?>" alt="王东峰主持召开“不忘初心、牢记使命”主题教育座谈会就加强" draggable="false" style="width:100%;">
            <div class="am-slider-desc" style="background-color:rgba(113,0,6,.8);"><?php echo ($list["title"]); ?></div> </a> 
             </li><?php endforeach;?>

  		</ul>
      </div>
      <div class="c_ycxw r">
        <div data-am-widget="tabs" class="am-tabs am-tabs-default am-no-layout">
          <ul class="am-tabs-nav am-cf">

            <li  class="am-active"> <a onclick="return false" href="/shizhengyaowen.html">时政要闻</a> </li>


            <li class=""> <a onclick="return false" href="/dangjiandongtai.html">党建动态</a> </li><li class=""> <a onclick="return false" href="/tongzhigonggao.html">通知公告</a> </li>
          </ul>
          <div class="am-tabs-bd " style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"> <div data-tab-panel-0="" class="am-tab-panel am-active am-in">
              <ul class="cyc_cnw">
          <?php
 $_typeid = 53; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (0 > 0) { $where['_string'] = $_tablename.'.flag & 0 = 0 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "6"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li> <a href="<?php echo ($list["url"]); ?>" class="sjbzn l"><?php echo ($list["title"]); ?></a> <span class="r"><?php echo (date('m-d',$list["publishtime"])); ?></span> </li><?php endforeach;?>
              </ul>
              <a href="/shizhengyaowen.html">
              <div class="am-tab-panel_more c"> <span>&gt;&gt;</span></div>
              </a> </div><div data-tab-panel-1="" class="am-tab-panel">
              <ul class="cyc_cnw">
                <?php
 $_typeid = 54; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (0 > 0) { $where['_string'] = $_tablename.'.flag & 0 = 0 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "6"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li> <a href="<?php echo ($list["url"]); ?>" class="sjbzn l"><?php echo ($list["title"]); ?></a> <span class="r"><?php echo (date('m-d',$list["publishtime"])); ?></span> </li><?php endforeach;?>
              </ul>
              <a href="/dangjiandongtai.html">
              <div class="am-tab-panel_more c"> <span>&gt;&gt;</span></div>
              </a> </div>
            <div data-tab-panel-2="" class="am-tab-panel ">
              <ul class="cyc_cnw">
                 <?php
 $_typeid = 55; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (0 > 0) { $where['_string'] = $_tablename.'.flag & 0 = 0 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "6"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li> <a href="<?php echo ($list["url"]); ?>" class="sjbzn l"><?php echo ($list["title"]); ?></a> <span class="r"><?php echo (date('y-m-d',$list["publishtime"])); ?></span> </li><?php endforeach;?>
              </ul>
              <a href="/tongzhigonggao.html">
              <div class="am-tab-panel_more c"> <span>&gt;&gt;</span></div>
              </a> </div> </div>
        </div>
      </div>
    </div>

	<!------------------------------------------------>
	<div class="boxon">
		<div class="pics">
			<a href="http://j.hbxuwe.cn/plus/list.php?tid=76"><img src="/Public/Home/sucai/zzb/a.jpg"></a>
			<a href="http://j.hbxuwe.cn/plus/list.php?tid=77"><img src="/Public/Home/sucai/zzb/b.jpg"></a>

		</div>
       <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "4"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (1) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 1); } if (0 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><div class="con">

		<dl>
				<dt><?php echo ($catlist["name"]); ?><!-- 基层党建工作 --></dt>
				<dd>
                  <a class="more" href="<?php echo ($catlist["url"]); ?>"></a>

					  <?php if(is_array($catlist["child"])): $i = 0; $__LIST__ = array_slice($catlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><a class="ddson" href="<?php echo ($v["ename"]); ?>" target="_blank"><?php echo ($v["name"]); ?></a>
					<span>|</span><?php endforeach; endif; else: echo "" ;endif; ?>


					<!-- <a href="" target="_blank">城市基层</a>
					<span>|</span>
					<a href="" target="_blank">非公有制经济组织</a>
					<span>|</span>
					<a href="" target="_blank">其他领域</a> -->
				</dd>
			</dl>
			<ul>
              	<?php
 $_typeid = $catlist["id"]; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (0 > 0) { $where['_string'] = $_tablename.'.flag & 0 = 0 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "7"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li><span><?php echo (date('y-m-d',$list["publishtime"])); ?></span><a href="<?php echo ($list["url"]); ?>"><?php echo ($list["title"]); ?></a></li><?php endforeach;?>


			</ul>

		</div><?php endforeach;?>
    </div>
  </div>
	<!------------------------------------------------>

     <!---------------->

  <div class="c_bke">
    <div class="jz">
       <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "1"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (5) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 5); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><div class="c_bkebt"> <div class="zwbtz l"  style="background-color: #710006;line-height: 46px; color: white;font-size: 16px;padding-left:20px;padding-right:20px;font-weight:normal;"><?php echo ($catlist["name"]); ?></div>
      <div align="right" style="line-height:46px;"><span class="zwbtz r">



					  <?php if(is_array($catlist["child"])): $i = 0; $__LIST__ = array_slice($catlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><a class="ddson" href="<?php echo ($v["ename"]); ?>" target="_blank"><?php echo ($v["name"]); ?></a>

				<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><?php endforeach; endif; else: echo "" ;endif; ?>



      <a href="<?php echo ($catlist["url"]); ?>" target="_blank">&nbsp;&nbsp;</a>
      </span></div>

      </div>
      <ul class="myzs">
        	<?php
 $_typeid = $catlist["id"]; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (1 > 0) { $where['_string'] = $_tablename.'.flag & 1 = 1 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "7"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li>
        <a href="<?php echo ($list["url"]); ?>"><img src="<?php echo ($list["litpic"]); ?>" width="100%" alt="<?php echo ($list["title"]); ?>"></a>
        </li><?php endforeach;?>





      </ul>
      <!--<ul class="myzs sszzd">
        <li>
        <a href="http://j.hbxuwe.cn/a/mingyuanzhanshi/jicengfaxian/jiemuliebiao/2019/1222/184.html"><img src="/Public/Home/sucai/zzb/1-1P30GH4520-L.jpg" alt="2019年第四期"></a>
        </li>
<li style="margin-right: 0">
        <a href="http://j.hbxuwe.cn/a/mingyuanzhanshi/jicengfaxian/jiemuliebiao/2019/1222/185.html"><img src="/Public/Home/sucai/zzb/1-1P30GH4520-L.jpg" alt="2019年第五期"></a>
        </li>
<li>
        <a href="http://j.hbxuwe.cn/a/mingyuanzhanshi/168.html"><img src="/Public/Home/sucai/zzb/1-1ZG51144343H.jpg" alt="展示四"></a>
        </li>
<li style="margin-right: 0">
        <a href="http://j.hbxuwe.cn/a/mingyuanzhanshi/167.html"><img src="/Public/Home/sucai/zzb/1-1ZG51144343H.jpg" alt="展示三"></a>
        </li>
<li>
        <a href="http://j.hbxuwe.cn/a/mingyuanzhanshi/166.html"><img src="/Public/Home/sucai/zzb/1-1ZG51144343H.jpg" alt="展示二"></a>
        </li>
<li style="margin-right: 0">
        <a href="http://j.hbxuwe.cn/a/mingyuanzhanshi/165.html"><img src="/Public/Home/sucai/zzb/1-1ZG51144343H.jpg" alt="展示一"></a>
        </li>

      </ul>--><?php endforeach;?>
    </div>
  </div>

  <!---------------->
  <div class="jz">
  	<!----------------------两列--------------------------->	<br>
	<div class="boxon">

       <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "4,2"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (1) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 1); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><div class="con">

		<dl>
				<dt><?php echo ($catlist["name"]); ?><!-- 基层党建工作 --></dt>
				<dd>
                  <a class="more" href="<?php echo ($catlist["url"]); ?>"></a>

					  <?php if(is_array($catlist["child"])): $i = 0; $__LIST__ = array_slice($catlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><a class="ddson" href="<?php echo ($v["ename"]); ?>" target="_blank"><?php echo ($v["name"]); ?></a>
					<span>|</span><?php endforeach; endif; else: echo "" ;endif; ?>


					<!-- <a href="" target="_blank">城市基层</a>
					<span>|</span>
					<a href="" target="_blank">非公有制经济组织</a>
					<span>|</span>
					<a href="" target="_blank">其他领域</a> -->
				</dd>
			</dl>
			<ul>
              	<?php
 $_typeid = $catlist["id"]; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (0 > 0) { $where['_string'] = $_tablename.'.flag & 0 = 0 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "7"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li><span><?php echo (date('y-m-d',$list["publishtime"])); ?></span><a href="<?php echo ($list["url"]); ?>"><?php echo ($list["title"]); ?></a></li><?php endforeach;?>


			</ul>

		</div><?php endforeach;?>
    </div>
</div>
	<!---------------------两列--------------------------->
  <!---------------->
  <div class="c_bke">
      <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "1"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (4) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 4); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><div class="jz">
      <div class="c_bkebt"> <div class="zwbtz l" style="background-color: #710006;line-height: 46px; color: white;font-size:16px;font-weight: normal;padding-left:20px;padding-right:20px;"><?php echo ($catlist["name"]); ?></div>
      <div align="right"><span class="zwbtz r" style="line-height: 46px;">

      <a class="more" href="<?php echo ($catlist["url"]); ?>"></a>

					   <?php if(is_array($catlist["child"])): $i = 0; $__LIST__ = array_slice($catlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><a class="ddson" href="<?php echo ($v["ename"]); ?>" target="_blank"><?php echo ($v["name"]); ?></a>
					<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span><?php endforeach; endif; else: echo "" ;endif; ?>

      <a class="ddson" href="<?php echo ($catlist["url"]); ?>" target="_blank">&nbsp;&nbsp;</a>
      </span></div>

      </div>
      <ul class="myzs">
       	<?php
 $_typeid = $catlist["id"]; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (1 > 0) { $where['_string'] = $_tablename.'.flag & 1 = 1 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "7"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li>
        <a href="<?php echo ($list["url"]); ?>"><img src="<?php echo ($list["litpic"]); ?>" width="100%" alt="<?php echo ($list["title"]); ?>"></a>
        </li><?php endforeach;?>

      </ul>

    </div><?php endforeach;?>
  </div>
  <!---------------->
  <br>
	<!----------------------两列--------------------------->
 <div class="jz">
<div class="boxon">

		  <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "6,2"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (1) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 1); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><div class="con">

		<dl>
				<dt><?php echo ($catlist["name"]); ?><!-- 基层党建工作 --></dt>
				<dd>
                  <a class="more" href="<?php echo ($catlist["url"]); ?>"></a>

					  <?php if(is_array($catlist["child"])): $i = 0; $__LIST__ = array_slice($catlist["child"],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><a class="ddson" href="<?php echo ($v["ename"]); ?>" target="_blank"><?php echo ($v["name"]); ?></a>
					<span>|</span><?php endforeach; endif; else: echo "" ;endif; ?>


					<!-- <a href="" target="_blank">城市基层</a>
					<span>|</span>
					<a href="" target="_blank">非公有制经济组织</a>
					<span>|</span>
					<a href="" target="_blank">其他领域</a> -->
				</dd>
			</dl>
			<ul>
              	<?php
 $_typeid = $catlist["id"]; $_keyword = ""; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $_selfcate = Common\Lib\Category::getSelf(get_category(), $_typeid); $_tablename = strtolower($_selfcate['tablename']); $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array($_tablename.'.status' => 1, $_tablename .'.cid'=> array('IN',$ids)); }else { $_tablename = 'article'; $where = array($_tablename.'.status' => 1); } if ($_keyword != '') { $where[$_tablename.'.title'] = array('like','%'.$_keyword.'%'); } if (0 > 0) { $where['_string'] = $_tablename.'.flag & 0 = 0 '; } if (!empty($_tablename) && $_tablename != 'page') { if (0 > 0) { $count = D2('ArcView',"$_tablename")->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('first',"首页"); $thisPage->setConfig('prev',"上一页"); $thisPage->setConfig('next',"下一页"); $thisPage->setConfig('last',"末页"); $thisPage->setConfig('theme'," %HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "7"; } $_list = D2('ArcView',"$_tablename")->nofield('content,pictureurls')->where($where)->order("id DESC")->limit($limit)->select(); if (empty($_list)) { $_list = array(); } }else { $_list = array(); } foreach($_list as $autoindex => $list): $_jumpflag = ($list['flag'] & B_JUMP) == B_JUMP? true : false; $list['url'] = get_content_url($list['id'], $list['cid'], $list['ename'], $_jumpflag, $list['jumpurl']); $type = Common\Lib\Category::getSelf(get_category(0), $list['cid']); $list['curl'] = get_url($type); $list['comment'] = get_comment($list['id'],$list['modelid']); if(0) $list['title'] = str2sub($list['title'], 0, 0); if(0) $list['description'] = str2sub($list['description'], 0, 0); if(isset($list['pictureurls'])) $list['pictureurls'] = get_picture_array($list['pictureurls']); ?><li><span><?php echo (date('y-m-d',$list["publishtime"])); ?></span><a href="<?php echo ($list["url"]); ?>"><?php echo ($list["title"]); ?></a></li><?php endforeach;?>


			</ul>

		</div><?php endforeach;?>
	</div>
	<!---------------------两列--------------------------->

 </div>

  <div class="c_bke c_kxkx">
    <div class="jz">
      <div class="c_bkebt"> <span class="zwbtz l" style="line-height:46px;">友情链接</span> <span class="ywfb l"></span> </div>
      <ul class="lsjl">
        <li>
        <a href="http://j.hbxuwe.cn/plus/view.php?aid=181"><img src="/Public/Home/sucai/zzb/1-1ZG5114925202.jpg" alt="共产党员网"></a>
        </li>
<li>
        <a href="http://j.hbxuwe.cn/plus/view.php?aid=180"><img src="/Public/Home/sucai/zzb/1-1ZG5114IK17.jpg" alt="中国共产党新闻网"></a>
        </li>
<li>
        <a href="http://j.hbxuwe.cn/plus/view.php?aid=175"><img src="/Public/Home/sucai/zzb/1-1ZG5114IK17.jpg" alt="中国共产党新闻网"></a>
        </li>
<li style="margin-right: 0">
        <a href="http://j.hbxuwe.cn/plus/view.php?aid=174"><img src="/Public/Home/sucai/zzb/1-1ZG5114925202.jpg" alt="共产党员网"></a>
        </li>

      </ul>

      <ul class="selectlink">
	  <li>
		<select onchange="if(this.value) window.open(this.value);" style="padding: 3px 10px;width:100%;text-align:center;text-align-last: center;">
			<option value="">中央部门网站</option>
			<option value="/plus/view.php?aid=183">中国政府网</option>

		</select>
		</li><li>
		<select onchange="if(this.value) window.open(this.value);" style="padding: 3px 10px;width:100%;text-align:center;text-align-last: center;">
			<option value="">省级部门网站</option>
			<option value="/plus/view.php?aid=182">河北省政府</option>

		</select>
		</li><li>
		<select onchange="if(this.value) window.open(this.value);" style="padding: 3px 10px;width:100%;text-align:center;text-align-last: center;">
			<option value="">市级部门网站</option>

		</select>
		</li><li>
		<select onchange="if(this.value) window.open(this.value);" style="padding: 3px 10px;width:100%;text-align:center;text-align-last: center;">
			<option value="">新闻媒体网站</option>

		</select>
		</li>
      </ul>
    </div>
  </div>
</div>
<div align="center"><div class="foot">
  <div align="center"><div class="footjz">
<div div="" style="LINE-HEIGHT: 60%"><br></div>
    <div align="center"><div class="egwm"> <img src="/Public/Home/sucai/zzb/ewm.jpg" class="ewmtpw" alt="二维码">
      <div class="lxfsa"> <span class="ytbts">紫塞先锋网</span> <span class="ytbta">电话：0314-2050747</span> <span class="ytbta">传真：0314-2050747</span> <span class="ytbta">邮箱：cdycb@126.com</span> <span class="ytbta">地址：河北省承德市政府行政中心 </span> </div>
    </div></div>
    <br>
    <div class="dbxx">Copyright © 2002-2019 紫塞先锋党建网 版权所有     备案号：冀ICP备1325325253 &nbsp;&nbsp;</div>
  </div>
</div></div></div>

<div class="bottom_tools" style="bottom: 40px;">
    <div class="float_ico"><a target="_blank" href="http://zzb.cxzch.cn/search.html" title="站内搜索"><img src="/Public/Home/sucai/zzb/1.png"></a></div>
    <div class="float_ico qr_tool"><img src="/Public/Home/sucai/zzb/2.png"></div>
	 <div class="float_ico"><a target="_blank" href="http://tp.hcxyw.cn" title="在线投票"><img src="/Public/Home/sucai/zzb/5.png"></a></div>
	 <div class="float_ico"><a target="_blank" href="http://zzb.cxzch.cn/kaoshi.php" title="在线考试"><img src="/Public/Home/sucai/zzb/6.png"></a></div>
    <div class="float_ico" id="scrollUp" style="display: none;"><a href="javascript:;" title="飞回顶部"><img src="/Public/Home/sucai/zzb/4.png"></a></div>
    <img class="qr_img" src="/Public/Home/sucai/zzb/ewm.jpg" alt="" style="display: none;">
</div>
<style>

.bottom_tools {
    position: fixed;
    z-index: 999;
    right: 20px;
    bottom: 40px;
}

.bottom_tools > * {
    font: 0/0 a;
    display: block;
    margin-top: 5px;
    color: transparent;
    border: 0;
    background-color: transparent;
    text-shadow: none
}

.qr_img {
    position: absolute;
    top: -22px;
    left: -120px;
    display: none;
    max-width: 173px;
}

#scrollUp {
    width: 45px;
    height: 45px;
    background-position: -54px -53px;
    display: none;
}

#scrollUp:hover {
    background-position: -100px -53px
}

#feedback {
    width: 45px;
    height: 45px;
    background-position: -102px 0
}

#feedback:hover {
    background-position: -146px -46px
}

.qr_tool {
    /*width: 45px;
    height: 45px;
    background-position: -148px 0;*/
    cursor: pointer;
}

.qr_tool:hover {
   /* width: 45px;
    height: 45px;
    background-position: -192px -46px;*/
}

</style>
<script>
	$(function(){

		var $bottomTools = $('.bottom_tools');
		var $qrTools = $('.qr_tool');
		var qrImg = $('.qr_img');

		$(window).scroll(function () {
			var scrollHeight = $(document).height();
			var scrollTop = $(window).scrollTop();
			var $windowHeight = $(window).innerHeight();
			scrollTop > 50 ? $("#scrollUp").fadeIn(200).css("display","block") : $("#scrollUp").fadeOut(200);
			$bottomTools.css("bottom", scrollHeight - scrollTop > $windowHeight ? 40 : $windowHeight + scrollTop + 40 - scrollHeight);
		});

		$('#scrollUp').click(function (e) {
			e.preventDefault();
			$('html,body').animate({ scrollTop:0});
		});

		$qrTools.hover(function () {
			qrImg.fadeIn();
		}, function(){
			 qrImg.fadeOut();
		});

	});
</script>

</body></html>