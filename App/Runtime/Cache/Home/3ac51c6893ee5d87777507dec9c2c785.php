<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0035)http://j.hbxuwe.cn/a/jianzhujienen/ -->
<html class="js cssanimations"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="order by dede58.com/">
  <title><?php echo ($title); ?> - 紫塞先锋</title>
    <meta name="keywords" content="<?php echo ($keywords); ?>" />
    <meta name="description" content="<?php echo ($description); ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/Public/Home/sucai/list/amazeui.min.css">
<link rel="stylesheet" href="/Public/Home/sucai/list/app.css">
<link rel="stylesheet" href="/Public/Home/sucai/list/index.css">
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/Public/Home/sucai/zzb/jquery.min.js"></script>
<!--<![endif]-->
<script src="/Public/Home/sucai/zzb/amazeui.min.js"></script>
<link rel="stylesheet" href="/Public/Home/sucai/list/index.css">
</head>

<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a
        href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]--> 
<!-- 代码区 -->
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

<div class="n_cont c">
 <div class="jz c">
    <div class="ny_nav" id="my_sticky" style="top: 0px; bottom: auto;">
        <div class="wjssbt c"> <?php if($pid > 0): echo ($cate["name"]); ?>            <?php else: ?>
            <?php
 $type = Common\Lib\Category::getSelf(get_category(0), $cid); $type['url'] = get_url($type); echo ($cate["name"]); endif; ?></div>
      
      <ul class="wjsndh c">
        	<?php if($flag_son): $_typeid = intval($cid); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li class="c <?php if(($cid) == $catlist['id']): ?>tabactive<?php endif; ?>" ><a href="<?php echo ($catlist["url"]); ?>"><?php echo ($catlist["name"]); ?><span> &gt; </span></a></li><?php endforeach;?>
            <?php else: ?>
            <?php if($cate['pid'] > 0): $_typeid = intval($cate['pid']); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1){ $_typeid = I('cid', 0, 'intval'); } $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li class="c <?php if(($cid) == $catlist['id']): ?>tabactive<?php endif; ?>" ><a href="<?php echo ($catlist["url"]); ?>"><?php echo ($catlist["name"]); ?><span> &gt; </span></a></li><?php endforeach; endif; endif; ?>
      </ul>
      <img src="/Public/Home/sucai/list/fqfm_051.jpg">
    </div>
    <script>
            $(window).bind('scroll', function () {
                var div_h = $('.ny_nav').height(); // div的高度
                var foot_h = $(".foot").offset().top - $(window).scrollTop(); // foot到顶部的距离
                var con_h = $('.ny_zqw_chb').offset().top - $(window).scrollTop(); // con到顶部的距离
                if(con_h <= 0){
                    $('#my_sticky').addClass('ny_nav_chb');
                    if(foot_h - div_h <= 0){
                        $('#my_sticky').css({
                            'top':'auto',
                            'bottom':$(window).height() - foot_h
                        })
                    }else{
                        $('#my_sticky').css({
                            'top':'0',
                            'bottom':'auto'
                        })
                    }
                }else{
                    $('#my_sticky').removeClass('ny_nav_chb');
                }
            });
        </script>
    <div class="ny_zqw ny_zqw_chb">
      <div class="nw_top"> <span class="top_tzbt l"><?php echo ($cate["name"]); ?> </span> <span class="top_mbx r">您的位置：    <?php
 $_sname = ""; $_typeid = -1; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid == 0 && $_sname == '') { $_sname = isset($title) ? $title : ''; } echo get_position($_typeid, $_sname, "", 0, "&nbsp;&gt;&nbsp;"); ?>&nbsp;&gt; </span> </div>
      <!--内页正文-->
      <div class="bjbld">
        <div class="xqbt"><?php echo ($content["title"]); ?></div>
        <div class="xqbtnm">
          <div class="xqbrq"> <span class="rqds l"><?php echo (date('Y-m-d H:i:s',$content["publishtime"])); ?></span> <span class="ckrs l"><b style="font-weight:100;"><script src="/Public/Home/sucai/list/count.php" type="text/javascript" language="javascript"></script></b></span> <a href="/" class="ybfh r">返回</a> </div>
        </div>
        <div class="xqxq">
      
<div style="text-align: left"><?php echo ($content["content"]); ?><br>
<br>
　　附件：　<a href="http://j.hbxuwe.cn/_data/2018/01/04/a09b5471_a2a0_4700_a47b_be56bab1da0a/file/%E9%83%A8%E5%8A%9E%E5%85%AC%E5%8E%85%E5%85%B3%E4%BA%8E%E8%BF%9B%E4%B8%80%E6%AD%A5%E6%8E%A8%E8%BF%9B%E5%8B%98%E5%AF%9F%E8%AE%BE%E8%AE%A1%E8%B5%84%E8%B4%A8%E8%B5%84%E6%A0%BC%E7%94%B5%E5%AD%90%E5%8C%96%E7%AE%A1%E7%90%86%E5%B7%A5%E4%BD%9C%E7%9A%84%E9%80%9A%E7%9F%A5.pdf">《住房城乡建设部办公厅关于进一步推进勘察设计资质资格电子化管理工作的通知》（建办市〔2017〕67号）</a><br>
<br>
<br>
<br>

        </div>
        <div class="xypxq"> 
        <div class="sypa l"><b>上一篇：</b><?php
 if(empty($content['id']) || empty($content['cid']) || empty($cate['tablename']) ) { echo 'Parameter error'; } else { $_vo= D2('ArcView',$cate['tablename'])->where(array($cate['tablename'].'.status' => 1, 'cid' => $content['cid'], 'id' => array('gt',$content['id'])))->order('id ASC')->find(); if ($_vo) { $_jumpflag = ($_vo['flag'] & B_JUMP) == B_JUMP? true : false; $_vo['url'] = get_content_url($_vo['id'], $_vo['cid'], $_vo['ename'], $_jumpflag, $_vo['jumpurl']); if(0) $_vo['title'] = str2sub($_vo['title'], 0, 0); echo '<a href="'. $_vo['url'] .'"" title="'.$_vo['title'].'" >'. $_vo['title'] .'</a>'; } else { echo "最后一篇"; } } ?></div> <div class="xypa r" id='left'><b>下一篇：</b> <?php
 if(empty($content['id']) || empty($content['cid']) || empty($cate['tablename']) ) { echo 'Parameter error'; } else { $_vo= D2('ArcView', $cate['tablename'])->where(array($cate['tablename'].'.status' => 1, 'cid' => $content['cid'], 'id' => array('lt',$content['id'])))->order('id desc')->find(); if ($_vo) { $_jumpflag = ($_vo['flag'] & B_JUMP) == B_JUMP? true : false; $_vo['url'] = get_content_url($_vo['id'], $_vo['cid'], $_vo['ename'], $_jumpflag, $_vo['jumpurl']); if(0) $_vo['title'] = str2sub($_vo['title'], 0, 0); echo '<a href="'. $_vo['url'] .'"" title="'.$_vo['title'].'">'. $_vo['title'] .'</a>'; } else { echo "第一篇"; } } ?></div> 
        </div>
          <div style="" title="分享" class="cli-share j-sharebox auto-1390289261253-parent" id="auto-id-Wgv0KyQS2q5GtCJz">
                    
                    <div data-bd-bind="1591772493996" class="bdsharebuttonbox bdshare-button-style1-16" style="display: inline-block;">
                      <span class="l">分享到：</span>  
                      <!-- <a data-cmd="more" class="bds_more " href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"></a> -->
                        <a title="分享到微信" data-cmd="weixin" class="bds_weixin" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"></a>
                        <!-- <a title="分享到QQ好友" data-cmd="sqq" class="bds_sqq" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"></a> -->
                        <a title="分享到QQ空间" data-cmd="qzone" class="bds_qzone" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"></a>
                        <a title="分享到新浪微博" data-cmd="tsina" class="bds_tsina" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"></a>
                        <a title="分享到腾讯微博" data-cmd="tqq" class="bds_tqq" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"></a>
                        <!-- <a title="分享到人人网" data-cmd="renren" class="bds_renren" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"> -->
                        <!-- </a><a title="分享到开心网" data-cmd="kaixin001" class="bds_kaixin001" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"> -->
                    <!-- </a><a title="分享到豆瓣网" data-cmd="douban" class="bds_douban" href="http://zs.hbxuwe.cn/index.php?app=classroom&amp;mod=Album&amp;act=watch&amp;aid=293&amp;type=1#"> -->
                    </a>
                    </div>
                    <script>
                        window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"16"},"share":{},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["weixin","sqq","qzone","tsina","tqq","renren","kaixin001","douban"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
                    </script>
      </div>
                        
                </div>

      <!--内页正文--> 
    </div>
  </div>
</div>
  
<script language="JavaScript" src="/Public/Home/sucai/list/api.js"></script> 

   <div align="center"><div class="foot">
  <div align="center"><div class="footjz">
<div div="" style="LINE-HEIGHT: 60%"><br></div>
    <div align="center"><div class="egwm"> <img src="/Public/Home/sucai/list/ewm.jpg" class="ewmtpw" alt="二维码">
      <div class="lxfsa"> <span class="ytbts">紫塞先锋网</span> <span class="ytbta">电话：0314-2050747</span> <span class="ytbta">传真：0314-2050747</span> <span class="ytbta">邮箱：cdycb@126.com</span> <span class="ytbta">地址：河北省承德市政府行政中心 </span> </div>
    </div></div>
    <br>
    <div class="dbxx">Copyright © 2002-2019 紫塞先锋党建网 版权所有     备案号：冀ICP备1325325253 &nbsp;&nbsp;</div>
  </div>
</div></div></div>
<script src="/Public/Home/sucai/js/common_version1.js" type="text/javascript"></script>
<script src="/Public/Home/sucai/js/other/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<div class="mmsg-box mmsg-box-info" id="msg-box" style="margin-top: -23.5px; margin-left: -96.5px;">
    <div class="mmsg-content">
        <i class="mmsg-icon"></i>
        <p id="msg-box-content"></p>
    </div>
    <div class="mmsg-background"></div>
</div>
<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https'){
   bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
  }
  else{
  bp.src = 'http://push.zhanzhang.baidu.com/push.js';
  }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>

</body></html>