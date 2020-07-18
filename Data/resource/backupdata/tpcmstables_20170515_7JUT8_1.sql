# -----------------------------------------------------------
# Description:备份的数据表[结构] my_abc,my_abc_detail,my_access,my_active,my_admin,my_announce,my_area,my_article,my_attachment,my_attachmentindex,my_block,my_category,my_category_access,my_collect,my_comment,my_config,my_copyfrom,my_download,my_forum,my_forum_reply,my_guestbook,my_itemgroup,my_iteminfo,my_link,my_member,my_member_slog,my_memberdetail,my_membergroup,my_menu,my_meta,my_model,my_node,my_oauth_user,my_order_month,my_orderaction,my_orderdetail,my_orderinfo,my_pay,my_pay_month,my_picture,my_points,my_product,my_property,my_property_value,my_role,my_role_user,my_search,my_soft,my_special,my_tag,my_temp,my_topic,my_union
# Description:备份的数据表[数据] my_abc,my_abc_detail,my_access,my_active,my_admin,my_announce,my_area,my_article,my_attachment,my_attachmentindex,my_block,my_category,my_category_access,my_collect,my_comment,my_config,my_copyfrom,my_download,my_forum,my_forum_reply,my_guestbook,my_itemgroup,my_iteminfo,my_link,my_member,my_member_slog,my_memberdetail,my_membergroup,my_menu,my_meta,my_model,my_node,my_oauth_user,my_order_month,my_orderaction,my_orderdetail,my_orderinfo,my_pay,my_pay_month,my_picture,my_points,my_product,my_property,my_property_value,my_role,my_role_user,my_search,my_soft,my_special,my_tag,my_temp,my_topic,my_union
# Time: 2017-05-15 17:31:00
# -----------------------------------------------------------
# SQLFile Label：#1
# -----------------------------------------------------------


# 表的结构 my_abc 
DROP TABLE IF EXISTS `my_abc`;
CREATE TABLE `my_abc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `remark` varchar(50) DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `num` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '调用数',
  `items` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_abc_detail 
DROP TABLE IF EXISTS `my_abc_detail`;
CREATE TABLE `my_abc_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(200) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(5) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 表的结构 my_access 
DROP TABLE IF EXISTS `my_access`;
CREATE TABLE `my_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_active 
DROP TABLE IF EXISTS `my_active`;
CREATE TABLE `my_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `code` varchar(11) NOT NULL DEFAULT '' COMMENT '激活码',
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ;

# 表的结构 my_admin 
DROP TABLE IF EXISTS `my_admin`;
CREATE TABLE `my_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `realname` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `usertype` tinyint(4) NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(30) NOT NULL COMMENT '登录IP',
  `loginnum` int(10) NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表' ;

# 表的结构 my_announce 
DROP TABLE IF EXISTS `my_announce`;
CREATE TABLE `my_announce` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_area 
DROP TABLE IF EXISTS `my_area`;
CREATE TABLE `my_area` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `sname` varchar(10) NOT NULL DEFAULT '' COMMENT '简称',
  `ename` varchar(50) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_article 
DROP TABLE IF EXISTS `my_article`;
CREATE TABLE `my_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(30) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=535 DEFAULT CHARSET=utf8 ;

# 表的结构 my_attachment 
DROP TABLE IF EXISTS `my_attachment`;
CREATE TABLE `my_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '原文件名',
  `filepath` varchar(200) NOT NULL DEFAULT '',
  `filetype` smallint(6) NOT NULL DEFAULT '1',
  `filesize` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `haslitpic` tinyint(1) NOT NULL DEFAULT '1',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 ;

# 表的结构 my_attachmentindex 
DROP TABLE IF EXISTS `my_attachmentindex`;
CREATE TABLE `my_attachmentindex` (
  `attid` int(10) unsigned NOT NULL DEFAULT '0',
  `arcid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(20) NOT NULL DEFAULT '',
  KEY `attid` (`attid`),
  KEY `arcid` (`arcid`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_block 
DROP TABLE IF EXISTS `my_block`;
CREATE TABLE `my_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '说明',
  `content` text COMMENT '内容',
  `blocktype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_category 
DROP TABLE IF EXISTS `my_category`;
CREATE TABLE `my_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目分类名称',
  `ename` varchar(200) NOT NULL DEFAULT '' COMMENT '别名',
  `catpic` varchar(150) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属模型',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别',
  `seotitle` varchar(50) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '关键字',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '显示',
  `sort` smallint(6) NOT NULL DEFAULT '100' COMMENT '排序',
  `property` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='栏目分类表' ;

# 表的结构 my_category_access 
DROP TABLE IF EXISTS `my_category_access`;
CREATE TABLE `my_category_access` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  KEY `catid` (`catid`),
  KEY `roleid` (`roleid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_collect 
DROP TABLE IF EXISTS `my_collect`;
CREATE TABLE `my_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(50) NOT NULL,
  `listurl` varchar(50) NOT NULL DEFAULT '',
  `listpreg` mediumtext NOT NULL,
  `listapreg` mediumtext,
  `titlepreg` mediumtext NOT NULL,
  `keypreg` mediumtext,
  `contentpreg` mediumtext NOT NULL,
  `picpage` varchar(50) DEFAULT NULL,
  `picpreg` mediumtext,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `listpage` mediumtext NOT NULL,
  `posttime` int(10) NOT NULL DEFAULT '0',
  `page` varchar(50) DEFAULT '',
  `ext` char(10) DEFAULT '',
  `firstpage` int(10) DEFAULT '1',
  `lastpage` int(10) DEFAULT '1',
  `type` smallint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ;

# 表的结构 my_comment 
DROP TABLE IF EXISTS `my_comment`;
CREATE TABLE `my_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(30) DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  KEY `modelid` (`modelid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ;

# 表的结构 my_config 
DROP TABLE IF EXISTS `my_config`;
CREATE TABLE `my_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '说明',
  `tvalue` varchar(150) NOT NULL DEFAULT '' COMMENT '参数类型',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分组',
  `value` text,
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `typeid` (`typeid`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ;

# 表的结构 my_copyfrom 
DROP TABLE IF EXISTS `my_copyfrom`;
CREATE TABLE `my_copyfrom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(30) NOT NULL DEFAULT '',
  `siteurl` varchar(200) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_download 
DROP TABLE IF EXISTS `my_download`;
CREATE TABLE `my_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `mtype` tinyint(1) NOT NULL,
  `addtime` int(10) NOT NULL,
  `uid_to` int(11) DEFAULT '0',
  `points` int(6) DEFAULT '0',
  `is_vip` tinyint(1) DEFAULT '0',
  `is_original` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 表的结构 my_forum 
DROP TABLE IF EXISTS `my_forum`;
CREATE TABLE `my_forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(30) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  `order_content` int(10) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 表的结构 my_forum_reply 
DROP TABLE IF EXISTS `my_forum_reply`;
CREATE TABLE `my_forum_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `support` int(10) DEFAULT '0',
  `against` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  KEY `modelid` (`modelid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ;

# 表的结构 my_guestbook 
DROP TABLE IF EXISTS `my_guestbook`;
CREATE TABLE `my_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(30) DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `homepage` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `replytime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `content` text,
  `reply` text,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

# 表的结构 my_itemgroup 
DROP TABLE IF EXISTS `my_itemgroup`;
CREATE TABLE `my_itemgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `remark` varchar(20) DEFAULT '',
  `status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ;

# 表的结构 my_iteminfo 
DROP TABLE IF EXISTS `my_iteminfo`;
CREATE TABLE `my_iteminfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `group` varchar(20) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ;

# 表的结构 my_link 
DROP TABLE IF EXISTS `my_link`;
CREATE TABLE `my_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `ischeck` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页|内页',
  `posttime` int(10) unsigned NOT NULL,
  `sort` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;

# 表的结构 my_member 
DROP TABLE IF EXISTS `my_member`;
CREATE TABLE `my_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `username` varchar(20) DEFAULT '',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `face` varchar(60) NOT NULL DEFAULT '' COMMENT '头像',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned DEFAULT '0',
  `loginip` varchar(20) DEFAULT '',
  `loginnum` mediumint(8) unsigned DEFAULT '0',
  `groupid` smallint(6) unsigned DEFAULT '0',
  `message` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `islock` tinyint(1) DEFAULT '0',
  `signed` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ;

# 表的结构 my_member_slog 
DROP TABLE IF EXISTS `my_member_slog`;
CREATE TABLE `my_member_slog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '积分加减类型：0 不变，1 增加，2 减少',
  `title` varchar(200) DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `scoreinfo` varchar(20) NOT NULL DEFAULT '',
  `addtime` int(10) NOT NULL,
  `descrip` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ;

# 表的结构 my_memberdetail 
DROP TABLE IF EXISTS `my_memberdetail`;
CREATE TABLE `my_memberdetail` (
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(30) DEFAULT '',
  `realname` varchar(30) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1980-01-01',
  `province` int(10) unsigned NOT NULL DEFAULT '0',
  `area` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(12) NOT NULL DEFAULT '',
  `tel` varchar(15) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `animal` int(10) unsigned NOT NULL DEFAULT '0',
  `star` int(10) unsigned NOT NULL DEFAULT '0',
  `blood` int(10) unsigned NOT NULL DEFAULT '0',
  `marital` int(10) unsigned NOT NULL DEFAULT '0',
  `education` int(10) unsigned NOT NULL DEFAULT '0',
  `vocation` int(10) unsigned NOT NULL DEFAULT '0',
  `income` int(10) unsigned NOT NULL DEFAULT '0',
  `maxim` varchar(100) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `job` varchar(50) DEFAULT '',
  `signature` varchar(255) DEFAULT '',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_membergroup 
DROP TABLE IF EXISTS `my_membergroup`;
CREATE TABLE `my_membergroup` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `rank` int(10) NOT NULL DEFAULT '0',
  `rankend` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `sort` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;

# 表的结构 my_menu 
DROP TABLE IF EXISTS `my_menu`;
CREATE TABLE `my_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(20) DEFAULT '',
  `parameter` varchar(100) DEFAULT '',
  `quick` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '显示',
  `sort` smallint(6) NOT NULL DEFAULT '100',
  `css` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ;

# 表的结构 my_meta 
DROP TABLE IF EXISTS `my_meta`;
CREATE TABLE `my_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'key',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ;

# 表的结构 my_model 
DROP TABLE IF EXISTS `my_model`;
CREATE TABLE `my_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `tablename` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ;

# 表的结构 my_node 
DROP TABLE IF EXISTS `my_node`;
CREATE TABLE `my_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 ;

# 表的结构 my_oauth_user 
DROP TABLE IF EXISTS `my_oauth_user`;
CREATE TABLE `my_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `oauth_from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `user_status` tinyint(2) NOT NULL DEFAULT '1',
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表' ;

# 表的结构 my_order_month 
DROP TABLE IF EXISTS `my_order_month`;
CREATE TABLE `my_order_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_num` varchar(30) DEFAULT NULL,
  `trade_num` varchar(100) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `month` int(6) NOT NULL,
  `addtime` int(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 ;

# 表的结构 my_orderaction 
DROP TABLE IF EXISTS `my_orderaction`;
CREATE TABLE `my_orderaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `orderid` varchar(30) NOT NULL,
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `distribution_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `aid` int(10) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  `publishtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_orderdetail 
DROP TABLE IF EXISTS `my_orderdetail`;
CREATE TABLE `my_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(30) DEFAULT NULL COMMENT '订单ID',
  `productid` int(11) DEFAULT NULL,
  `userid` int(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `num` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_orderinfo 
DROP TABLE IF EXISTS `my_orderinfo`;
CREATE TABLE `my_orderinfo` (
  `orderid` varchar(30) NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `payid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `expressprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '邮费/运费',
  `prdouctprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '产品总价格',
  `totalprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总价格',
  `consignee` varchar(30) DEFAULT NULL COMMENT '收件人',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zip` int(10) NOT NULL DEFAULT '0',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `distribution_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `ip` char(15) NOT NULL DEFAULT '',
  `stime` int(10) NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `distribution_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  PRIMARY KEY (`orderid`),
  KEY `stime` (`stime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_pay 
DROP TABLE IF EXISTS `my_pay`;
CREATE TABLE `my_pay` (
  `out_trade_no` varchar(100) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL,
  `symbol` tinyint(1) DEFAULT '0',
  `points` int(8) NOT NULL,
  `jinbi` int(8) NOT NULL DEFAULT '0' COMMENT '火币',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`out_trade_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_pay_month 
DROP TABLE IF EXISTS `my_pay_month`;
CREATE TABLE `my_pay_month` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `month` int(5) NOT NULL,
  `money` decimal(10,1) NOT NULL,
  `is_show` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;

# 表的结构 my_picture 
DROP TABLE IF EXISTS `my_picture`;
CREATE TABLE `my_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `author` varchar(30) DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `copyfrom` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `template` varchar(30) NOT NULL DEFAULT '' COMMENT '模板',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_points 
DROP TABLE IF EXISTS `my_points`;
CREATE TABLE `my_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT '0',
  `uid` int(11) NOT NULL,
  `to_uid` int(11) DEFAULT '0',
  `to_money` decimal(10,1) DEFAULT '0.0',
  `mtype` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `money` int(6) NOT NULL,
  `symbol` tinyint(1) DEFAULT '0',
  `title` varchar(200) DEFAULT NULL,
  `addtime` int(10) NOT NULL,
  `fuhao` tinyint(1) NOT NULL,
  `is_vip` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_product 
DROP TABLE IF EXISTS `my_product`;
CREATE TABLE `my_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `brand` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌',
  `units` varchar(50) NOT NULL DEFAULT '' COMMENT '单位',
  `specification` varchar(50) NOT NULL DEFAULT '' COMMENT '规格',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `tag` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

# 表的结构 my_property 
DROP TABLE IF EXISTS `my_property`;
CREATE TABLE `my_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `units` char(10) DEFAULT NULL,
  `listorder` smallint(4) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) DEFAULT '0',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='分类属性' ;

# 表的结构 my_property_value 
DROP TABLE IF EXISTS `my_property_value`;
CREATE TABLE `my_property_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prop_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vname` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`prop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='分类属性' ;

# 表的结构 my_role 
DROP TABLE IF EXISTS `my_role`;
CREATE TABLE `my_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_role_user 
DROP TABLE IF EXISTS `my_role_user`;
CREATE TABLE `my_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_search 
DROP TABLE IF EXISTS `my_search`;
CREATE TABLE `my_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NOT NULL DEFAULT '0',
  `keyword` varchar(20) NOT NULL,
  `sort` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `num` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `userid` int(10) NOT NULL DEFAULT '0',
  `ipaddr` varchar(50) DEFAULT '',
  `referer` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `tag_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 ;

# 表的结构 my_soft 
DROP TABLE IF EXISTS `my_soft`;
CREATE TABLE `my_soft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictureurls` text,
  `content` text COMMENT '内容',
  `updatelog` text COMMENT '更新日志',
  `downlink` text COMMENT '下载地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '版本号',
  `softtype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '软件类型',
  `copytype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权形式',
  `language` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语言',
  `os` varchar(100) NOT NULL DEFAULT '' COMMENT '运行环境',
  `filesize` varchar(10) NOT NULL DEFAULT '' COMMENT '文件大小',
  `officialurl` varchar(100) NOT NULL DEFAULT '' COMMENT '官方网站',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `tag` varchar(80) DEFAULT '',
  `demo` varchar(200) DEFAULT '',
  `downnum` smallint(6) DEFAULT '0',
  `scores` mediumint(8) DEFAULT '0',
  `prop_value` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ;

# 表的结构 my_special 
DROP TABLE IF EXISTS `my_special`;
CREATE TABLE `my_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `filename` varchar(60) DEFAULT '',
  `template` varchar(60) NOT NULL DEFAULT '',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `tag` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 my_tag 
DROP TABLE IF EXISTS `my_tag`;
CREATE TABLE `my_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(30) DEFAULT '',
  `typeid` int(11) NOT NULL DEFAULT '0',
  `tag_name` varchar(20) NOT NULL,
  `tag_sort` int(10) NOT NULL,
  `tag_status` tinyint(1) NOT NULL,
  `tag_click` int(10) NOT NULL DEFAULT '0',
  `posttime` int(10) NOT NULL DEFAULT '0',
  `num` int(10) DEFAULT '0',
  PRIMARY KEY (`tag_id`),
  KEY `tag_status` (`tag_status`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 ;

# 表的结构 my_temp 
DROP TABLE IF EXISTS `my_temp`;
CREATE TABLE `my_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `author` varchar(30) DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `copyfrom` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `template` varchar(30) NOT NULL DEFAULT '' COMMENT '模板',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 my_topic 
DROP TABLE IF EXISTS `my_topic`;
CREATE TABLE `my_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(30) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `ding` int(10) DEFAULT '0',
  `cai` int(10) DEFAULT '0',
  `tag` varchar(80) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=537 DEFAULT CHARSET=utf8 ;

# 表的结构 my_union 
DROP TABLE IF EXISTS `my_union`;
CREATE TABLE `my_union` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` text NOT NULL,
  `publishtime` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;



# 转存表中的数据：my_abc 
INSERT INTO `my_abc` VALUES ('1','首页幻灯','首页','722','257','<loop><li><a href=\"{$url}\"><img src=\"{$content}\" width=\"{$width}\" height=\"{$height}\" /></a></li></loop>','2','2','3');


# 转存表中的数据：my_abc_detail 
INSERT INTO `my_abc_detail` VALUES ('3','仿拉勾网模板下载','/uploads/abc1/20161007/57f731b802383.jpg','http://www.sucaihuo.com/jingtai-13.html','1475817845','1546233840','1','1','1');
INSERT INTO `my_abc_detail` VALUES ('4','Discuz!X3.2精仿磨房旅游户外模板下载','/uploads/abc1/20161007/57f73209e610a.jpg','http://www.sucaihuo.com/discuz-15.html','1475817945','1478496345','1','1','1');
INSERT INTO `my_abc_detail` VALUES ('5','Discuz!仿穷游网旅游门户模版','/uploads/abc1/20161007/57f7381a683b7.jpg','http://www.sucaihuo.com/discuz-16.html','1475819517','1543557060','1','1','1');


# 转存表中的数据：my_access 
INSERT INTO `my_access` VALUES ('1','11','3','');
INSERT INTO `my_access` VALUES ('1','10','3','');
INSERT INTO `my_access` VALUES ('1','9','3','');
INSERT INTO `my_access` VALUES ('1','8','3','');
INSERT INTO `my_access` VALUES ('1','6','3','');
INSERT INTO `my_access` VALUES ('1','5','3','');
INSERT INTO `my_access` VALUES ('1','4','3','');
INSERT INTO `my_access` VALUES ('1','3','3','');
INSERT INTO `my_access` VALUES ('1','2','2','');
INSERT INTO `my_access` VALUES ('1','1','1','');
INSERT INTO `my_access` VALUES ('1','12','3','');
INSERT INTO `my_access` VALUES ('1','17','2','');
INSERT INTO `my_access` VALUES ('1','18','3','');
INSERT INTO `my_access` VALUES ('1','55','3','');
INSERT INTO `my_access` VALUES ('1','19','2','');
INSERT INTO `my_access` VALUES ('1','20','3','');
INSERT INTO `my_access` VALUES ('1','21','3','');
INSERT INTO `my_access` VALUES ('1','22','3','');
INSERT INTO `my_access` VALUES ('1','23','3','');
INSERT INTO `my_access` VALUES ('1','24','3','');
INSERT INTO `my_access` VALUES ('1','25','2','');
INSERT INTO `my_access` VALUES ('1','26','3','');
INSERT INTO `my_access` VALUES ('1','27','3','');
INSERT INTO `my_access` VALUES ('1','28','3','');
INSERT INTO `my_access` VALUES ('1','29','3','');
INSERT INTO `my_access` VALUES ('1','30','3','');
INSERT INTO `my_access` VALUES ('1','31','2','');
INSERT INTO `my_access` VALUES ('1','32','3','');
INSERT INTO `my_access` VALUES ('1','33','3','');
INSERT INTO `my_access` VALUES ('1','34','3','');
INSERT INTO `my_access` VALUES ('1','35','3','');
INSERT INTO `my_access` VALUES ('1','36','2','');
INSERT INTO `my_access` VALUES ('1','37','3','');
INSERT INTO `my_access` VALUES ('1','38','3','');
INSERT INTO `my_access` VALUES ('1','39','3','');
INSERT INTO `my_access` VALUES ('1','40','3','');
INSERT INTO `my_access` VALUES ('1','41','2','');
INSERT INTO `my_access` VALUES ('1','42','3','');
INSERT INTO `my_access` VALUES ('1','43','3','');
INSERT INTO `my_access` VALUES ('1','44','3','');
INSERT INTO `my_access` VALUES ('1','45','3','');
INSERT INTO `my_access` VALUES ('1','46','2','');
INSERT INTO `my_access` VALUES ('1','47','3','');
INSERT INTO `my_access` VALUES ('1','48','3','');
INSERT INTO `my_access` VALUES ('1','49','3','');
INSERT INTO `my_access` VALUES ('1','50','3','');
INSERT INTO `my_access` VALUES ('1','51','2','');
INSERT INTO `my_access` VALUES ('1','52','3','');
INSERT INTO `my_access` VALUES ('1','53','3','');
INSERT INTO `my_access` VALUES ('1','54','3','');


# 转存表中的数据：my_active 
INSERT INTO `my_active` VALUES ('1','1','0','AbTXDUKtIPy','1472908893','','0');
INSERT INTO `my_active` VALUES ('2','2','0','pQvARhdJdyy','1474776333','','0');
INSERT INTO `my_active` VALUES ('3','3','0','XDjnGY86zQP','1474805042','','0');
INSERT INTO `my_active` VALUES ('4','1','0','2w3uZv1VgsI','1475416620','','0');
INSERT INTO `my_active` VALUES ('5','4','0','rnVq9Hrb4uk','1475662951','','0');
INSERT INTO `my_active` VALUES ('6','5','0','4B1tmW26s3p','1475752822','','0');
INSERT INTO `my_active` VALUES ('7','6','0','DwCaGpRwW1q','1475753686','','0');
INSERT INTO `my_active` VALUES ('8','7','0','N4p3VdqleaL','1475840149','','0');
INSERT INTO `my_active` VALUES ('9','8','0','5vjZKLdDWm1','1475891350','','0');
INSERT INTO `my_active` VALUES ('10','9','0','6vec1fmfA87','1476079472','','0');
INSERT INTO `my_active` VALUES ('11','10','0','mbsw7Qex6Fi','1476131695','','0');
INSERT INTO `my_active` VALUES ('12','11','0','v27f67lQZar','1476158474','','0');
INSERT INTO `my_active` VALUES ('13','12','0','g4DD1gcVv8s','1476292537','','0');
INSERT INTO `my_active` VALUES ('14','13','0','F7p6V54YJQL','1476419268','','0');
INSERT INTO `my_active` VALUES ('15','14','0','YquWbVXAMmV','1476511823','','0');
INSERT INTO `my_active` VALUES ('16','15','0','NhRKDU8wd6l','1476515692','','0');
INSERT INTO `my_active` VALUES ('17','16','0','48WqfNhlHWN','1476537703','','0');
INSERT INTO `my_active` VALUES ('18','17','0','uWwdkBsjJ92','1476670405','','0');
INSERT INTO `my_active` VALUES ('19','18','0','ERlVJm5dgr3','1476841993','','0');
INSERT INTO `my_active` VALUES ('20','19','0','FuraQVTl3KI','1476842552','','0');
INSERT INTO `my_active` VALUES ('21','20','0','PBXRlk6wMDU','1476936847','','0');
INSERT INTO `my_active` VALUES ('22','21','0','4kUQ9cVzSaY','1477020616','','0');
INSERT INTO `my_active` VALUES ('23','22','0','DAhn46FdmIr','1477036593','','0');


# 转存表中的数据：my_admin 
INSERT INTO `my_admin` VALUES ('1','admin','e0850b8d70623f380ae28e5a195352bb','LlKIIx','','','9','1494840566','0.0.0.0','98','0');


# 转存表中的数据：my_announce 


# 转存表中的数据：my_area 
INSERT INTO `my_area` VALUES ('1','北京市','北京','','0','0');
INSERT INTO `my_area` VALUES ('2','上海市','上海','','0','0');
INSERT INTO `my_area` VALUES ('3','天津市','天津','','0','0');
INSERT INTO `my_area` VALUES ('4','重庆市','重庆','','0','0');
INSERT INTO `my_area` VALUES ('5','广东省','广东','','0','0');
INSERT INTO `my_area` VALUES ('6','福建省','福建','','0','0');
INSERT INTO `my_area` VALUES ('7','浙江省','浙江','','0','0');
INSERT INTO `my_area` VALUES ('8','江苏省','江苏','','0','0');
INSERT INTO `my_area` VALUES ('9','山东省','山东','','0','0');
INSERT INTO `my_area` VALUES ('10','辽宁省','辽宁','','0','0');
INSERT INTO `my_area` VALUES ('11','江西省','江西','','0','0');
INSERT INTO `my_area` VALUES ('12','四川省','四川','','0','0');
INSERT INTO `my_area` VALUES ('13','陕西省','陕西','','0','0');
INSERT INTO `my_area` VALUES ('14','湖北省','湖北','','0','0');
INSERT INTO `my_area` VALUES ('15','河南省','河南','','0','0');
INSERT INTO `my_area` VALUES ('16','河北省','河北','','0','0');
INSERT INTO `my_area` VALUES ('17','山西省','山西','','0','0');
INSERT INTO `my_area` VALUES ('18','内蒙古','内蒙古','','0','0');
INSERT INTO `my_area` VALUES ('19','吉林省','吉林','','0','0');
INSERT INTO `my_area` VALUES ('20','黑龙江','黑龙江','','0','0');
INSERT INTO `my_area` VALUES ('21','安徽省','安徽','','0','0');
INSERT INTO `my_area` VALUES ('22','湖南省','湖南','','0','0');
INSERT INTO `my_area` VALUES ('23','广西','广西','','0','0');
INSERT INTO `my_area` VALUES ('24','海南省','海南','','0','0');
INSERT INTO `my_area` VALUES ('25','云南省','云南','','0','0');
INSERT INTO `my_area` VALUES ('26','贵州省','贵州','','0','0');
INSERT INTO `my_area` VALUES ('27','西藏','西藏','','0','0');
INSERT INTO `my_area` VALUES ('28','甘肃省','甘肃','','0','0');
INSERT INTO `my_area` VALUES ('29','宁夏区','宁夏区','','0','0');
INSERT INTO `my_area` VALUES ('30','青海省','青海','','0','0');
INSERT INTO `my_area` VALUES ('31','新疆','新疆','','0','0');
INSERT INTO `my_area` VALUES ('32','香港','香港','','0','0');
INSERT INTO `my_area` VALUES ('33','澳门','澳门','','0','0');
INSERT INTO `my_area` VALUES ('34','台湾省','台湾','','0','0');
INSERT INTO `my_area` VALUES ('60','海外','海外','','0','0');
INSERT INTO `my_area` VALUES ('101','东城区','东城区','','1','0');
INSERT INTO `my_area` VALUES ('102','西城区','西城区','','1','0');
INSERT INTO `my_area` VALUES ('103','崇文区','崇文区','','1','0');
INSERT INTO `my_area` VALUES ('104','宣武区','宣武区','','1','0');
INSERT INTO `my_area` VALUES ('105','朝阳区','朝阳区','','1','0');
INSERT INTO `my_area` VALUES ('106','海淀区','海淀区','','1','0');
INSERT INTO `my_area` VALUES ('107','丰台区','丰台区','','1','0');
INSERT INTO `my_area` VALUES ('108','石景山区','石景山区','','1','0');
INSERT INTO `my_area` VALUES ('109','门头沟区','门头沟区','','1','0');
INSERT INTO `my_area` VALUES ('110','房山区','房山区','','1','0');
INSERT INTO `my_area` VALUES ('111','通州区','通区','','1','0');
INSERT INTO `my_area` VALUES ('112','顺义区','顺义区','','1','0');
INSERT INTO `my_area` VALUES ('113','昌平区','昌平区','','1','0');
INSERT INTO `my_area` VALUES ('114','大兴区','大兴区','','1','0');
INSERT INTO `my_area` VALUES ('115','平谷县','平谷县','','1','0');
INSERT INTO `my_area` VALUES ('116','怀柔县','怀柔县','','1','0');
INSERT INTO `my_area` VALUES ('117','密云县','密云县','','1','0');
INSERT INTO `my_area` VALUES ('118','延庆县','延庆县','','1','0');
INSERT INTO `my_area` VALUES ('201','黄浦区','黄浦区','','2','0');
INSERT INTO `my_area` VALUES ('202','卢湾区','卢湾区','','2','0');
INSERT INTO `my_area` VALUES ('203','徐汇区','徐汇区','','2','0');
INSERT INTO `my_area` VALUES ('204','长宁区','长宁区','','2','0');
INSERT INTO `my_area` VALUES ('205','静安区','静安区','','2','0');
INSERT INTO `my_area` VALUES ('206','普陀区','普陀区','','2','0');
INSERT INTO `my_area` VALUES ('207','闸北区','闸北区','','2','0');
INSERT INTO `my_area` VALUES ('208','虹口区','虹口区','','2','0');
INSERT INTO `my_area` VALUES ('209','杨浦区','杨浦区','','2','0');
INSERT INTO `my_area` VALUES ('210','宝山区','宝山区','','2','0');
INSERT INTO `my_area` VALUES ('211','闵行区','闵行区','','2','0');
INSERT INTO `my_area` VALUES ('212','嘉定区','嘉定区','','2','0');
INSERT INTO `my_area` VALUES ('213','浦东新区','浦东新区','','2','0');
INSERT INTO `my_area` VALUES ('214','松江区','松江区','','2','0');
INSERT INTO `my_area` VALUES ('215','金山区','金山区','','2','0');
INSERT INTO `my_area` VALUES ('216','青浦区','青浦区','','2','0');
INSERT INTO `my_area` VALUES ('217','南汇区','南汇区','','2','0');
INSERT INTO `my_area` VALUES ('218','奉贤区','奉贤区','','2','0');
INSERT INTO `my_area` VALUES ('219','崇明县','崇明县','','2','0');
INSERT INTO `my_area` VALUES ('301','和平区','和平区','','3','0');
INSERT INTO `my_area` VALUES ('302','河东区','河东区','','3','0');
INSERT INTO `my_area` VALUES ('303','河西区','河西区','','3','0');
INSERT INTO `my_area` VALUES ('304','南开区','南开区','','3','0');
INSERT INTO `my_area` VALUES ('305','河北区','河北区','','3','0');
INSERT INTO `my_area` VALUES ('306','红桥区','红桥区','','3','0');
INSERT INTO `my_area` VALUES ('307','塘沽区','塘沽区','','3','0');
INSERT INTO `my_area` VALUES ('308','汉沽区','汉沽区','','3','0');
INSERT INTO `my_area` VALUES ('309','大港区','大港区','','3','0');
INSERT INTO `my_area` VALUES ('310','东丽区','东丽区','','3','0');
INSERT INTO `my_area` VALUES ('311','西青区','西青区','','3','0');
INSERT INTO `my_area` VALUES ('312','北辰区','北辰区','','3','0');
INSERT INTO `my_area` VALUES ('313','津南区','津南区','','3','0');
INSERT INTO `my_area` VALUES ('314','武清区','武清区','','3','0');
INSERT INTO `my_area` VALUES ('315','宝坻区','宝坻区','','3','0');
INSERT INTO `my_area` VALUES ('316','静海县','静海县','','3','0');
INSERT INTO `my_area` VALUES ('317','宁河县','宁河县','','3','0');
INSERT INTO `my_area` VALUES ('318','蓟县','蓟县','','3','0');
INSERT INTO `my_area` VALUES ('401','渝中区','渝中区','','4','0');
INSERT INTO `my_area` VALUES ('402','大渡口区','大渡口区','','4','0');
INSERT INTO `my_area` VALUES ('403','江北区','江北区','','4','0');
INSERT INTO `my_area` VALUES ('404','沙坪坝区','沙坪坝区','','4','0');
INSERT INTO `my_area` VALUES ('405','九龙坡区','九龙坡区','','4','0');
INSERT INTO `my_area` VALUES ('406','南岸区','南岸区','','4','0');
INSERT INTO `my_area` VALUES ('407','北碚区','北碚区','','4','0');
INSERT INTO `my_area` VALUES ('408','万盛区','万盛区','','4','0');
INSERT INTO `my_area` VALUES ('409','双桥区','双桥区','','4','0');
INSERT INTO `my_area` VALUES ('410','渝北区','渝北区','','4','0');
INSERT INTO `my_area` VALUES ('411','巴南区','巴南区','','4','0');
INSERT INTO `my_area` VALUES ('412','万州区','万区','','4','0');
INSERT INTO `my_area` VALUES ('413','涪陵区','涪陵区','','4','0');
INSERT INTO `my_area` VALUES ('414','黔江区','黔江区','','4','0');
INSERT INTO `my_area` VALUES ('415','永川市','永川','','4','0');
INSERT INTO `my_area` VALUES ('416','合川市','合川','','4','0');
INSERT INTO `my_area` VALUES ('417','江津市','江津','','4','0');
INSERT INTO `my_area` VALUES ('418','南川市','南川','','4','0');
INSERT INTO `my_area` VALUES ('419','长寿县','长寿县','','4','0');
INSERT INTO `my_area` VALUES ('420','綦江县','綦江县','','4','0');
INSERT INTO `my_area` VALUES ('421','潼南县','潼南县','','4','0');
INSERT INTO `my_area` VALUES ('422','荣昌县','荣昌县','','4','0');
INSERT INTO `my_area` VALUES ('423','璧山县','璧山县','','4','0');
INSERT INTO `my_area` VALUES ('424','大足县','大足县','','4','0');
INSERT INTO `my_area` VALUES ('425','铜梁县','铜梁县','','4','0');
INSERT INTO `my_area` VALUES ('426','梁平县','梁平县','','4','0');
INSERT INTO `my_area` VALUES ('427','城口县','城口县','','4','0');
INSERT INTO `my_area` VALUES ('428','垫江县','垫江县','','4','0');
INSERT INTO `my_area` VALUES ('429','武隆县','武隆县','','4','0');
INSERT INTO `my_area` VALUES ('430','丰都县','丰都县','','4','0');
INSERT INTO `my_area` VALUES ('431','奉节县','奉节县','','4','0');
INSERT INTO `my_area` VALUES ('432','开县','开县','','4','0');
INSERT INTO `my_area` VALUES ('433','云阳县','云阳县','','4','0');
INSERT INTO `my_area` VALUES ('434','忠县','忠县','','4','0');
INSERT INTO `my_area` VALUES ('435','巫溪县','巫溪县','','4','0');
INSERT INTO `my_area` VALUES ('436','巫山县','巫山县','','4','0');
INSERT INTO `my_area` VALUES ('437','石柱县','石柱县','','4','0');
INSERT INTO `my_area` VALUES ('438','秀山县','秀山县','','4','0');
INSERT INTO `my_area` VALUES ('439','酉阳县','酉阳县','','4','0');
INSERT INTO `my_area` VALUES ('440','彭水县','彭水县','','4','0');
INSERT INTO `my_area` VALUES ('501','广州市','广州','','5','0');
INSERT INTO `my_area` VALUES ('502','深圳市','深圳','','5','0');
INSERT INTO `my_area` VALUES ('503','珠海市','珠海','','5','0');
INSERT INTO `my_area` VALUES ('504','汕头市','汕头','','5','0');
INSERT INTO `my_area` VALUES ('505','韶关市','韶关','','5','0');
INSERT INTO `my_area` VALUES ('506','河源市','河源','','5','0');
INSERT INTO `my_area` VALUES ('507','梅州市','梅州','','5','0');
INSERT INTO `my_area` VALUES ('508','惠州市','惠州','','5','0');
INSERT INTO `my_area` VALUES ('509','汕尾市','汕尾','','5','0');
INSERT INTO `my_area` VALUES ('510','东莞市','东莞','','5','0');
INSERT INTO `my_area` VALUES ('511','中山市','中山','','5','0');
INSERT INTO `my_area` VALUES ('512','江门市','江门','','5','0');
INSERT INTO `my_area` VALUES ('513','佛山市','佛山','','5','0');
INSERT INTO `my_area` VALUES ('514','阳江市','阳江','','5','0');
INSERT INTO `my_area` VALUES ('515','湛江市','湛江','','5','0');
INSERT INTO `my_area` VALUES ('516','茂名市','茂名','','5','0');
INSERT INTO `my_area` VALUES ('517','肇庆市','肇庆','','5','0');
INSERT INTO `my_area` VALUES ('518','清远市','清远','','5','0');
INSERT INTO `my_area` VALUES ('519','潮州市','潮州','','5','0');
INSERT INTO `my_area` VALUES ('520','揭阳市','揭阳','','5','0');
INSERT INTO `my_area` VALUES ('521','云浮市','云浮','','5','0');
INSERT INTO `my_area` VALUES ('601','福州市','福州','','6','0');
INSERT INTO `my_area` VALUES ('602','厦门市','厦门','','6','0');
INSERT INTO `my_area` VALUES ('603','三明市','三明','','6','0');
INSERT INTO `my_area` VALUES ('604','莆田市','莆田','','6','0');
INSERT INTO `my_area` VALUES ('605','泉州市','泉州','','6','0');
INSERT INTO `my_area` VALUES ('606','漳州市','漳州','','6','0');
INSERT INTO `my_area` VALUES ('607','南平市','南平','','6','0');
INSERT INTO `my_area` VALUES ('608','龙岩市','龙岩','','6','0');
INSERT INTO `my_area` VALUES ('609','宁德市','宁德','','6','0');
INSERT INTO `my_area` VALUES ('701','杭州市','杭州','','7','0');
INSERT INTO `my_area` VALUES ('702','宁波市','宁波','','7','0');
INSERT INTO `my_area` VALUES ('703','温州市','温州','','7','0');
INSERT INTO `my_area` VALUES ('704','嘉兴市','嘉兴','','7','0');
INSERT INTO `my_area` VALUES ('705','湖州市','湖州','','7','0');
INSERT INTO `my_area` VALUES ('706','绍兴市','绍兴','','7','0');
INSERT INTO `my_area` VALUES ('707','金华市','金华','','7','0');
INSERT INTO `my_area` VALUES ('708','衢州市','衢州','','7','0');
INSERT INTO `my_area` VALUES ('709','舟山市','舟山','','7','0');
INSERT INTO `my_area` VALUES ('710','台州市','台州','','7','0');
INSERT INTO `my_area` VALUES ('711','丽水市','丽水','','7','0');
INSERT INTO `my_area` VALUES ('801','南京市','南京','','8','0');
INSERT INTO `my_area` VALUES ('802','徐州市','徐州','','8','0');
INSERT INTO `my_area` VALUES ('803','连云港市','连云港','','8','0');
INSERT INTO `my_area` VALUES ('804','淮安市','淮安','','8','0');
INSERT INTO `my_area` VALUES ('805','宿迁市','宿迁','','8','0');
INSERT INTO `my_area` VALUES ('806','盐城市','盐城','','8','0');
INSERT INTO `my_area` VALUES ('807','扬州市','扬州','','8','0');
INSERT INTO `my_area` VALUES ('808','泰州市','泰州','','8','0');
INSERT INTO `my_area` VALUES ('809','南通市','南通','','8','0');
INSERT INTO `my_area` VALUES ('810','镇江市','镇江','','8','0');
INSERT INTO `my_area` VALUES ('811','常州市','常州','','8','0');
INSERT INTO `my_area` VALUES ('812','无锡市','无锡','','8','0');
INSERT INTO `my_area` VALUES ('813','苏州市','苏州','','8','0');
INSERT INTO `my_area` VALUES ('901','济南市','济南','','9','0');
INSERT INTO `my_area` VALUES ('902','青岛市','青岛','','9','0');
INSERT INTO `my_area` VALUES ('903','淄博市','淄博','','9','0');
INSERT INTO `my_area` VALUES ('904','枣庄市','枣庄','','9','0');
INSERT INTO `my_area` VALUES ('905','东营市','东营','','9','0');
INSERT INTO `my_area` VALUES ('906','潍坊市','潍坊','','9','0');
INSERT INTO `my_area` VALUES ('907','烟台市','烟台','','9','0');
INSERT INTO `my_area` VALUES ('908','威海市','威海','','9','0');
INSERT INTO `my_area` VALUES ('909','济宁市','济宁','','9','0');
INSERT INTO `my_area` VALUES ('910','泰安市','泰安','','9','0');
INSERT INTO `my_area` VALUES ('911','日照市','日照','','9','0');
INSERT INTO `my_area` VALUES ('912','莱芜市','莱芜','','9','0');
INSERT INTO `my_area` VALUES ('913','德州市','德州','','9','0');
INSERT INTO `my_area` VALUES ('914','临沂市','临沂','','9','0');
INSERT INTO `my_area` VALUES ('915','聊城市','聊城','','9','0');
INSERT INTO `my_area` VALUES ('916','滨州市','滨州','','9','0');
INSERT INTO `my_area` VALUES ('917','菏泽市','菏泽','','9','0');
INSERT INTO `my_area` VALUES ('1001','沈阳市','沈阳','','10','0');
INSERT INTO `my_area` VALUES ('1002','大连市','大连','','10','0');
INSERT INTO `my_area` VALUES ('1003','鞍山市','鞍山','','10','0');
INSERT INTO `my_area` VALUES ('1004','抚顺市','抚顺','','10','0');
INSERT INTO `my_area` VALUES ('1005','本溪市','本溪','','10','0');
INSERT INTO `my_area` VALUES ('1006','丹东市','丹东','','10','0');
INSERT INTO `my_area` VALUES ('1007','锦州市','锦州','','10','0');
INSERT INTO `my_area` VALUES ('1008','葫芦岛市','葫芦岛','','10','0');
INSERT INTO `my_area` VALUES ('1009','营口市','营口','','10','0');
INSERT INTO `my_area` VALUES ('1010','盘锦市','盘锦','','10','0');
INSERT INTO `my_area` VALUES ('1011','阜新市','阜新','','10','0');
INSERT INTO `my_area` VALUES ('1012','辽阳市','辽阳','','10','0');
INSERT INTO `my_area` VALUES ('1013','铁岭市','铁岭','','10','0');
INSERT INTO `my_area` VALUES ('1014','朝阳市','朝阳','','10','0');
INSERT INTO `my_area` VALUES ('1101','南昌市','南昌','','11','0');
INSERT INTO `my_area` VALUES ('1102','景德镇市','景德镇','','11','0');
INSERT INTO `my_area` VALUES ('1103','萍乡市','萍乡','','11','0');
INSERT INTO `my_area` VALUES ('1104','新余市','新余','','11','0');
INSERT INTO `my_area` VALUES ('1105','九江市','九江','','11','0');
INSERT INTO `my_area` VALUES ('1106','鹰潭市','鹰潭','','11','0');
INSERT INTO `my_area` VALUES ('1107','赣州市','赣州','','11','0');
INSERT INTO `my_area` VALUES ('1108','吉安市','吉安','','11','0');
INSERT INTO `my_area` VALUES ('1109','宜春市','宜春','','11','0');
INSERT INTO `my_area` VALUES ('1110','抚州市','抚州','','11','0');
INSERT INTO `my_area` VALUES ('1111','上饶市','上饶','','11','0');
INSERT INTO `my_area` VALUES ('1201','成都市','成都','','12','0');
INSERT INTO `my_area` VALUES ('1202','自贡市','自贡','','12','0');
INSERT INTO `my_area` VALUES ('1203','攀枝花市','攀枝花','','12','0');
INSERT INTO `my_area` VALUES ('1204','泸州市','泸州','','12','0');
INSERT INTO `my_area` VALUES ('1205','德阳市','德阳','','12','0');
INSERT INTO `my_area` VALUES ('1206','绵阳市','绵阳','','12','0');
INSERT INTO `my_area` VALUES ('1207','广元市','广元','','12','0');
INSERT INTO `my_area` VALUES ('1208','遂宁市','遂宁','','12','0');
INSERT INTO `my_area` VALUES ('1209','内江市','内江','','12','0');
INSERT INTO `my_area` VALUES ('1210','乐山市','乐山','','12','0');
INSERT INTO `my_area` VALUES ('1211','南充市','南充','','12','0');
INSERT INTO `my_area` VALUES ('1212','宜宾市','宜宾','','12','0');
INSERT INTO `my_area` VALUES ('1213','广安市','广安','','12','0');
INSERT INTO `my_area` VALUES ('1214','达州市','达州','','12','0');
INSERT INTO `my_area` VALUES ('1215','巴中市','巴中','','12','0');
INSERT INTO `my_area` VALUES ('1216','雅安市','雅安','','12','0');
INSERT INTO `my_area` VALUES ('1217','眉山市','眉山','','12','0');
INSERT INTO `my_area` VALUES ('1218','资阳市','资阳','','12','0');
INSERT INTO `my_area` VALUES ('1219','阿坝州','阿坝','','12','0');
INSERT INTO `my_area` VALUES ('1220','甘孜州','甘孜','','12','0');
INSERT INTO `my_area` VALUES ('1221','凉山州','凉山','','12','0');
INSERT INTO `my_area` VALUES ('3114','西安市','西安','','13','0');
INSERT INTO `my_area` VALUES ('1302','铜川市','铜川','','13','0');
INSERT INTO `my_area` VALUES ('1303','宝鸡市','宝鸡','','13','0');
INSERT INTO `my_area` VALUES ('1304','咸阳市','咸阳','','13','0');
INSERT INTO `my_area` VALUES ('1305','渭南市','渭南','','13','0');
INSERT INTO `my_area` VALUES ('1306','延安市','延安','','13','0');
INSERT INTO `my_area` VALUES ('1307','汉中市','汉中','','13','0');
INSERT INTO `my_area` VALUES ('1308','榆林市','榆林','','13','0');
INSERT INTO `my_area` VALUES ('1309','安康市','安康','','13','0');
INSERT INTO `my_area` VALUES ('1310','商洛地区','商洛地区','','13','0');
INSERT INTO `my_area` VALUES ('1401','武汉市','武汉','','14','0');
INSERT INTO `my_area` VALUES ('1402','黄石市','黄石','','14','0');
INSERT INTO `my_area` VALUES ('1403','襄樊市','襄樊','','14','0');
INSERT INTO `my_area` VALUES ('1404','十堰市','十堰','','14','0');
INSERT INTO `my_area` VALUES ('1405','荆州市','荆州','','14','0');
INSERT INTO `my_area` VALUES ('1406','宜昌市','宜昌','','14','0');
INSERT INTO `my_area` VALUES ('1407','荆门市','荆门','','14','0');
INSERT INTO `my_area` VALUES ('1408','鄂州市','鄂州','','14','0');
INSERT INTO `my_area` VALUES ('1409','孝感市','孝感','','14','0');
INSERT INTO `my_area` VALUES ('1410','黄冈市','黄冈','','14','0');
INSERT INTO `my_area` VALUES ('1411','咸宁市','咸宁','','14','0');
INSERT INTO `my_area` VALUES ('1412','随州市','随州','','14','0');
INSERT INTO `my_area` VALUES ('1413','仙桃市','仙桃','','14','0');
INSERT INTO `my_area` VALUES ('1414','天门市','天门','','14','0');
INSERT INTO `my_area` VALUES ('1415','潜江市','潜江','','14','0');
INSERT INTO `my_area` VALUES ('1416','神农架','神农架','','14','0');
INSERT INTO `my_area` VALUES ('1417','恩施州','恩施','','14','0');
INSERT INTO `my_area` VALUES ('1501','郑州市','郑州','','15','0');
INSERT INTO `my_area` VALUES ('1502','开封市','开封','','15','0');
INSERT INTO `my_area` VALUES ('1503','洛阳市','洛阳','','15','0');
INSERT INTO `my_area` VALUES ('1504','平顶山市','平顶山','','15','0');
INSERT INTO `my_area` VALUES ('1505','焦作市','焦作','','15','0');
INSERT INTO `my_area` VALUES ('1506','鹤壁市','鹤壁','','15','0');
INSERT INTO `my_area` VALUES ('1507','新乡市','新乡','','15','0');
INSERT INTO `my_area` VALUES ('1508','安阳市','安阳','','15','0');
INSERT INTO `my_area` VALUES ('1509','濮阳市','濮阳','','15','0');
INSERT INTO `my_area` VALUES ('1510','许昌市','许昌','','15','0');
INSERT INTO `my_area` VALUES ('1511','漯河市','漯河','','15','0');
INSERT INTO `my_area` VALUES ('1512','三门峡市','三门峡','','15','0');
INSERT INTO `my_area` VALUES ('1513','南阳市','南阳','','15','0');
INSERT INTO `my_area` VALUES ('1514','商丘市','商丘','','15','0');
INSERT INTO `my_area` VALUES ('1515','信阳市','信阳','','15','0');
INSERT INTO `my_area` VALUES ('1516','周口市','周口','','15','0');
INSERT INTO `my_area` VALUES ('1517','驻马店市','驻马店','','15','0');
INSERT INTO `my_area` VALUES ('1518','济源市','济源','','15','0');
INSERT INTO `my_area` VALUES ('1601','石家庄市','石家庄','','16','0');
INSERT INTO `my_area` VALUES ('1602','唐山市','唐山','','16','0');
INSERT INTO `my_area` VALUES ('1603','秦皇岛市','秦皇岛','','16','0');
INSERT INTO `my_area` VALUES ('1604','邯郸市','邯郸','','16','0');
INSERT INTO `my_area` VALUES ('1605','邢台市','邢台','','16','0');
INSERT INTO `my_area` VALUES ('1606','保定市','保定','','16','0');
INSERT INTO `my_area` VALUES ('1607','张家口市','张家口','','16','0');
INSERT INTO `my_area` VALUES ('1608','承德市','承德','','16','0');
INSERT INTO `my_area` VALUES ('1609','沧州市','沧州','','16','0');
INSERT INTO `my_area` VALUES ('1610','廊坊市','廊坊','','16','0');
INSERT INTO `my_area` VALUES ('1611','衡水市','衡水','','16','0');
INSERT INTO `my_area` VALUES ('1701','太原市','太原','','17','0');
INSERT INTO `my_area` VALUES ('1702','大同市','大同','','17','0');
INSERT INTO `my_area` VALUES ('1703','阳泉市','阳泉','','17','0');
INSERT INTO `my_area` VALUES ('1704','长治市','长治','','17','0');
INSERT INTO `my_area` VALUES ('1705','晋城市','晋城','','17','0');
INSERT INTO `my_area` VALUES ('1706','朔州市','朔州','','17','0');
INSERT INTO `my_area` VALUES ('1707','晋中市','晋中','','17','0');
INSERT INTO `my_area` VALUES ('1708','忻州市','忻州','','17','0');
INSERT INTO `my_area` VALUES ('1709','临汾市','临汾','','17','0');
INSERT INTO `my_area` VALUES ('1710','运城市','运城','','17','0');
INSERT INTO `my_area` VALUES ('1711','吕梁地区','吕梁地区','','17','0');
INSERT INTO `my_area` VALUES ('1801','呼和浩特','呼和浩特','','18','0');
INSERT INTO `my_area` VALUES ('1802','包头市','包头','','18','0');
INSERT INTO `my_area` VALUES ('1803','乌海市','乌海','','18','0');
INSERT INTO `my_area` VALUES ('1804','赤峰市','赤峰','','18','0');
INSERT INTO `my_area` VALUES ('1805','通辽市','通辽','','18','0');
INSERT INTO `my_area` VALUES ('1806','鄂尔多斯','鄂尔多斯','','18','0');
INSERT INTO `my_area` VALUES ('1807','乌兰察布','乌兰察布','','18','0');
INSERT INTO `my_area` VALUES ('1808','锡林郭勒','锡林郭勒','','18','0');
INSERT INTO `my_area` VALUES ('1809','呼伦贝尔','呼伦贝尔','','18','0');
INSERT INTO `my_area` VALUES ('1810','巴彦淖尔','巴彦淖尔','','18','0');
INSERT INTO `my_area` VALUES ('1811','阿拉善盟','阿拉善盟','','18','0');
INSERT INTO `my_area` VALUES ('1812','兴安盟','兴安盟','','18','0');
INSERT INTO `my_area` VALUES ('1901','长春市','长春','','19','0');
INSERT INTO `my_area` VALUES ('1902','吉林市','吉林','','19','0');
INSERT INTO `my_area` VALUES ('1903','四平市','四平','','19','0');
INSERT INTO `my_area` VALUES ('1904','辽源市','辽源','','19','0');
INSERT INTO `my_area` VALUES ('1905','通化市','通化','','19','0');
INSERT INTO `my_area` VALUES ('1906','白山市','白山','','19','0');
INSERT INTO `my_area` VALUES ('1907','松原市','松原','','19','0');
INSERT INTO `my_area` VALUES ('1908','白城市','白城','','19','0');
INSERT INTO `my_area` VALUES ('1909','延边州','延边','','19','0');
INSERT INTO `my_area` VALUES ('2001','哈尔滨市','哈尔滨','','20','0');
INSERT INTO `my_area` VALUES ('2002','齐齐哈尔','齐齐哈尔','','20','0');
INSERT INTO `my_area` VALUES ('2003','鹤岗市','鹤岗','','20','0');
INSERT INTO `my_area` VALUES ('2004','双鸭山市','双鸭山','','20','0');
INSERT INTO `my_area` VALUES ('2005','鸡西市','鸡西','','20','0');
INSERT INTO `my_area` VALUES ('2006','大庆市','大庆','','20','0');
INSERT INTO `my_area` VALUES ('2007','伊春市','伊春','','20','0');
INSERT INTO `my_area` VALUES ('2008','牡丹江市','牡丹江','','20','0');
INSERT INTO `my_area` VALUES ('2009','佳木斯市','佳木斯','','20','0');
INSERT INTO `my_area` VALUES ('2010','七台河市','七台河','','20','0');
INSERT INTO `my_area` VALUES ('2011','黑河市','黑河','','20','0');
INSERT INTO `my_area` VALUES ('2012','绥化市','绥化','','20','0');
INSERT INTO `my_area` VALUES ('2013','大兴安岭','大兴安岭','','20','0');
INSERT INTO `my_area` VALUES ('2101','合肥市','合肥','','21','0');
INSERT INTO `my_area` VALUES ('2102','芜湖市','芜湖','','21','0');
INSERT INTO `my_area` VALUES ('2103','蚌埠市','蚌埠','','21','0');
INSERT INTO `my_area` VALUES ('2104','淮南市','淮南','','21','0');
INSERT INTO `my_area` VALUES ('2105','马鞍山市','马鞍山','','21','0');
INSERT INTO `my_area` VALUES ('2106','淮北市','淮北','','21','0');
INSERT INTO `my_area` VALUES ('2107','铜陵市','铜陵','','21','0');
INSERT INTO `my_area` VALUES ('2108','安庆市','安庆','','21','0');
INSERT INTO `my_area` VALUES ('2109','黄山市','黄山','','21','0');
INSERT INTO `my_area` VALUES ('2110','滁州市','滁州','','21','0');
INSERT INTO `my_area` VALUES ('2111','阜阳市','阜阳','','21','0');
INSERT INTO `my_area` VALUES ('2112','宿州市','宿州','','21','0');
INSERT INTO `my_area` VALUES ('2113','巢湖市','巢湖','','21','0');
INSERT INTO `my_area` VALUES ('2114','六安市','六安','','21','0');
INSERT INTO `my_area` VALUES ('2115','亳州市','亳州','','21','0');
INSERT INTO `my_area` VALUES ('2116','宣城市','宣城','','21','0');
INSERT INTO `my_area` VALUES ('2117','池州市','池州','','21','0');
INSERT INTO `my_area` VALUES ('2201','长沙市','长沙','','22','0');
INSERT INTO `my_area` VALUES ('2202','株州市','株州','','22','0');
INSERT INTO `my_area` VALUES ('2203','湘潭市','湘潭','','22','0');
INSERT INTO `my_area` VALUES ('2204','衡阳市','衡阳','','22','0');
INSERT INTO `my_area` VALUES ('2205','邵阳市','邵阳','','22','0');
INSERT INTO `my_area` VALUES ('2206','岳阳市','岳阳','','22','0');
INSERT INTO `my_area` VALUES ('2207','常德市','常德','','22','0');
INSERT INTO `my_area` VALUES ('2208','张家界市','张家界','','22','0');
INSERT INTO `my_area` VALUES ('2209','益阳市','益阳','','22','0');
INSERT INTO `my_area` VALUES ('2210','郴州市','郴州','','22','0');
INSERT INTO `my_area` VALUES ('2211','永州市','永州','','22','0');
INSERT INTO `my_area` VALUES ('2212','怀化市','怀化','','22','0');
INSERT INTO `my_area` VALUES ('2213','娄底市','娄底','','22','0');
INSERT INTO `my_area` VALUES ('2214','湘西州','湘西','','22','0');
INSERT INTO `my_area` VALUES ('2301','南宁市','南宁','','23','0');
INSERT INTO `my_area` VALUES ('2302','柳州市','柳州','','23','0');
INSERT INTO `my_area` VALUES ('2303','桂林市','桂林','','23','0');
INSERT INTO `my_area` VALUES ('2304','梧州市','梧州','','23','0');
INSERT INTO `my_area` VALUES ('2305','北海市','北海','','23','0');
INSERT INTO `my_area` VALUES ('2306','防城港市','防城港','','23','0');
INSERT INTO `my_area` VALUES ('2307','钦州市','钦州','','23','0');
INSERT INTO `my_area` VALUES ('2308','贵港市','贵港','','23','0');
INSERT INTO `my_area` VALUES ('2309','玉林市','玉林','','23','0');
INSERT INTO `my_area` VALUES ('2310','南宁地区','南宁地区','','23','0');
INSERT INTO `my_area` VALUES ('2311','柳州地区','柳地区','','23','0');
INSERT INTO `my_area` VALUES ('2312','贺州地区','贺地区','','23','0');
INSERT INTO `my_area` VALUES ('2313','百色地区','百色地区','','23','0');
INSERT INTO `my_area` VALUES ('2314','河池地区','河池地区','','23','0');
INSERT INTO `my_area` VALUES ('2401','海口市','海口','','24','0');
INSERT INTO `my_area` VALUES ('2402','三亚市','三亚','','24','0');
INSERT INTO `my_area` VALUES ('2403','五指山市','五指山','','24','0');
INSERT INTO `my_area` VALUES ('2404','琼海市','琼海','','24','0');
INSERT INTO `my_area` VALUES ('2405','儋州市','儋州','','24','0');
INSERT INTO `my_area` VALUES ('2406','琼山市','琼山','','24','0');
INSERT INTO `my_area` VALUES ('2407','文昌市','文昌','','24','0');
INSERT INTO `my_area` VALUES ('2408','万宁市','万宁','','24','0');
INSERT INTO `my_area` VALUES ('2409','东方市','东方','','24','0');
INSERT INTO `my_area` VALUES ('2410','澄迈县','澄迈县','','24','0');
INSERT INTO `my_area` VALUES ('2411','定安县','定安县','','24','0');
INSERT INTO `my_area` VALUES ('2412','屯昌县','屯昌县','','24','0');
INSERT INTO `my_area` VALUES ('2413','临高县','临高县','','24','0');
INSERT INTO `my_area` VALUES ('2414','白沙县','白沙县','','24','0');
INSERT INTO `my_area` VALUES ('2415','昌江县','昌江县','','24','0');
INSERT INTO `my_area` VALUES ('2416','乐东县','乐东县','','24','0');
INSERT INTO `my_area` VALUES ('2417','陵水县','陵水县','','24','0');
INSERT INTO `my_area` VALUES ('2418','保亭县','保亭县','','24','0');
INSERT INTO `my_area` VALUES ('2419','琼中县','琼中县','','24','0');
INSERT INTO `my_area` VALUES ('2501','昆明市','昆明','','25','0');
INSERT INTO `my_area` VALUES ('2502','曲靖市','曲靖','','25','0');
INSERT INTO `my_area` VALUES ('2503','玉溪市','玉溪','','25','0');
INSERT INTO `my_area` VALUES ('2504','保山市','保山','','25','0');
INSERT INTO `my_area` VALUES ('2505','昭通市','昭通','','25','0');
INSERT INTO `my_area` VALUES ('2506',' 普洱市',' 普洱','','25','0');
INSERT INTO `my_area` VALUES ('2507','临沧市','临沧','','25','0');
INSERT INTO `my_area` VALUES ('2508','丽江市','丽江','','25','0');
INSERT INTO `my_area` VALUES ('2509','文山州','文山','','25','0');
INSERT INTO `my_area` VALUES ('2510','红河州','红河','','25','0');
INSERT INTO `my_area` VALUES ('2511','西双版纳','西双版纳','','25','0');
INSERT INTO `my_area` VALUES ('2512','楚雄州','楚雄','','25','0');
INSERT INTO `my_area` VALUES ('2513','大理州','大理','','25','0');
INSERT INTO `my_area` VALUES ('2514','德宏州','德宏','','25','0');
INSERT INTO `my_area` VALUES ('2515','怒江州','怒江','','25','0');
INSERT INTO `my_area` VALUES ('2516','迪庆州','迪庆','','25','0');
INSERT INTO `my_area` VALUES ('2601','贵阳市','贵阳','','26','0');
INSERT INTO `my_area` VALUES ('2602','六盘水市','六盘水','','26','0');
INSERT INTO `my_area` VALUES ('2603','遵义市','遵义','','26','0');
INSERT INTO `my_area` VALUES ('2604','安顺市','安顺','','26','0');
INSERT INTO `my_area` VALUES ('2605','铜仁地区','铜仁地区','','26','0');
INSERT INTO `my_area` VALUES ('2606','毕节地区','毕节地区','','26','0');
INSERT INTO `my_area` VALUES ('2607','黔西南州','黔西南','','26','0');
INSERT INTO `my_area` VALUES ('2608','黔东南州','黔东南','','26','0');
INSERT INTO `my_area` VALUES ('2609','黔南州','黔南','','26','0');
INSERT INTO `my_area` VALUES ('2701','拉萨市','拉萨','','27','0');
INSERT INTO `my_area` VALUES ('2702','那曲地区','那曲地区','','27','0');
INSERT INTO `my_area` VALUES ('2703','昌都地区','昌都地区','','27','0');
INSERT INTO `my_area` VALUES ('2704','山南地区','山南地区','','27','0');
INSERT INTO `my_area` VALUES ('2705','日喀则','日喀则','','27','0');
INSERT INTO `my_area` VALUES ('2706','阿里地区','阿里地区','','27','0');
INSERT INTO `my_area` VALUES ('2707','林芝地区','林芝地区','','27','0');
INSERT INTO `my_area` VALUES ('2801','兰州市','兰州','','28','0');
INSERT INTO `my_area` VALUES ('2802','金昌市','金昌','','28','0');
INSERT INTO `my_area` VALUES ('2803','白银市','白银','','28','0');
INSERT INTO `my_area` VALUES ('2804','天水市','天水','','28','0');
INSERT INTO `my_area` VALUES ('2805','嘉峪关市','嘉峪关','','28','0');
INSERT INTO `my_area` VALUES ('2806','武威市','武威','','28','0');
INSERT INTO `my_area` VALUES ('2807','定西地区','定西地区','','28','0');
INSERT INTO `my_area` VALUES ('2808','平凉地区','平凉地区','','28','0');
INSERT INTO `my_area` VALUES ('2809','庆阳地区','庆阳地区','','28','0');
INSERT INTO `my_area` VALUES ('2810','陇南地区','陇南地区','','28','0');
INSERT INTO `my_area` VALUES ('2811','张掖地区','张掖地区','','28','0');
INSERT INTO `my_area` VALUES ('2812','酒泉地区','酒泉地区','','28','0');
INSERT INTO `my_area` VALUES ('2813','甘南州','甘南','','28','0');
INSERT INTO `my_area` VALUES ('2814','临夏州','临夏','','28','0');
INSERT INTO `my_area` VALUES ('2901','银川市','银川','','29','0');
INSERT INTO `my_area` VALUES ('2902','石嘴山市','石嘴山','','29','0');
INSERT INTO `my_area` VALUES ('2903','吴忠市','吴忠','','29','0');
INSERT INTO `my_area` VALUES ('2904','固原市','固原','','29','0');
INSERT INTO `my_area` VALUES ('3001','西宁市','西宁','','30','0');
INSERT INTO `my_area` VALUES ('3002','海东地区','海东地区','','30','0');
INSERT INTO `my_area` VALUES ('3003','海北州','海北','','30','0');
INSERT INTO `my_area` VALUES ('3004','黄南州','黄南','','30','0');
INSERT INTO `my_area` VALUES ('3005','海南州','海南','','30','0');
INSERT INTO `my_area` VALUES ('3006','果洛州','果洛','','30','0');
INSERT INTO `my_area` VALUES ('3007','玉树州','玉树','','30','0');
INSERT INTO `my_area` VALUES ('3008','海西州','海西','','30','0');
INSERT INTO `my_area` VALUES ('3101','乌鲁木齐','乌鲁木齐','','31','0');
INSERT INTO `my_area` VALUES ('3102','克拉玛依','克拉玛依','','31','0');
INSERT INTO `my_area` VALUES ('3103','石河子市','石河子','','31','0');
INSERT INTO `my_area` VALUES ('3104','吐鲁番','吐鲁番','','31','0');
INSERT INTO `my_area` VALUES ('3105','哈密地区','哈密地区','','31','0');
INSERT INTO `my_area` VALUES ('3106','和田地区','和田地区','','31','0');
INSERT INTO `my_area` VALUES ('3107','阿克苏','阿克苏','','31','0');
INSERT INTO `my_area` VALUES ('3108','喀什地区','喀什地区','','31','0');
INSERT INTO `my_area` VALUES ('3109','克孜勒苏','克孜勒苏','','31','0');
INSERT INTO `my_area` VALUES ('3110','巴音郭楞','巴音郭楞','','31','0');
INSERT INTO `my_area` VALUES ('3111','昌吉州','昌吉','','31','0');
INSERT INTO `my_area` VALUES ('3112','博尔塔拉','博尔塔拉','','31','0');
INSERT INTO `my_area` VALUES ('3113','伊犁州','伊犁','','31','0');
INSERT INTO `my_area` VALUES ('3201','香港岛','香港岛','','32','0');
INSERT INTO `my_area` VALUES ('3202','九龙','九龙','','32','0');
INSERT INTO `my_area` VALUES ('3203','新界','新界','','32','0');
INSERT INTO `my_area` VALUES ('3301','澳门半岛','澳门半岛','','33','0');
INSERT INTO `my_area` VALUES ('3302','离岛','离岛','','33','0');
INSERT INTO `my_area` VALUES ('3401','台北市','台北','','34','0');
INSERT INTO `my_area` VALUES ('3402','高雄市','高雄','','34','0');
INSERT INTO `my_area` VALUES ('3403','台南市','台南','','34','0');
INSERT INTO `my_area` VALUES ('3404','台中市','台中','','34','0');
INSERT INTO `my_area` VALUES ('3405','金门县','金门县','','34','0');
INSERT INTO `my_area` VALUES ('3406','南投县','南投县','','34','0');
INSERT INTO `my_area` VALUES ('3407','基隆市','基隆','','34','0');
INSERT INTO `my_area` VALUES ('3408','新竹市','新竹','','34','0');
INSERT INTO `my_area` VALUES ('3409','嘉义市','嘉义','','34','0');
INSERT INTO `my_area` VALUES ('3410','新北市','新北','','34','0');
INSERT INTO `my_area` VALUES ('3411','宜兰县','宜兰县','','34','0');
INSERT INTO `my_area` VALUES ('3412','新竹县','新竹县','','34','0');
INSERT INTO `my_area` VALUES ('3413','桃园县','桃园县','','34','0');
INSERT INTO `my_area` VALUES ('3414','苗栗县','苗栗县','','34','0');
INSERT INTO `my_area` VALUES ('3415','彰化县','彰化县','','34','0');
INSERT INTO `my_area` VALUES ('3416','嘉义县','嘉义县','','34','0');
INSERT INTO `my_area` VALUES ('3417','云林县','云林县','','34','0');
INSERT INTO `my_area` VALUES ('3418','屏东县','屏东县','','34','0');
INSERT INTO `my_area` VALUES ('3419','台东县','台东县','','34','0');
INSERT INTO `my_area` VALUES ('3420','花莲县','花莲县','','34','0');
INSERT INTO `my_area` VALUES ('3421','澎湖县','澎湖县','','34','0');
INSERT INTO `my_area` VALUES ('6001','美国','美国','','60','0');
INSERT INTO `my_area` VALUES ('6002','英国','英国','','60','0');
INSERT INTO `my_area` VALUES ('6003','法国','法国','','60','0');
INSERT INTO `my_area` VALUES ('6004','俄罗斯','俄罗斯','','60','0');
INSERT INTO `my_area` VALUES ('6005','加拿大','加拿大','','60','0');
INSERT INTO `my_area` VALUES ('6006','巴西','巴西','','60','0');
INSERT INTO `my_area` VALUES ('6007','澳大利亚','澳大利亚','','60','0');
INSERT INTO `my_area` VALUES ('6008','印尼','印尼','','60','0');
INSERT INTO `my_area` VALUES ('6009','马来西亚','马来西亚','','60','0');
INSERT INTO `my_area` VALUES ('6010','新加坡','新加坡','','60','0');
INSERT INTO `my_area` VALUES ('6011','菲律宾','菲律宾','','60','0');
INSERT INTO `my_area` VALUES ('6012','越南','越南','','60','0');
INSERT INTO `my_area` VALUES ('6013','印度','印度','','60','0');
INSERT INTO `my_area` VALUES ('6014','日本','日本','','60','0');
INSERT INTO `my_area` VALUES ('6015','韩国','韩国','','60','0');
INSERT INTO `my_area` VALUES ('6016','泰国','泰国','','60','0');
INSERT INTO `my_area` VALUES ('6017','缅甸','缅甸','','60','0');
INSERT INTO `my_area` VALUES ('6018','其他','其他','','60','0');


# 转存表中的数据：my_article 
INSERT INTO `my_article` VALUES ('531','SEO技巧：新网站如何在短时间内获取权重和排名？','','','卢松松博客','管理员','','/uploads/img1/20161018/58063e01ca613.jpg!300X300.jpg','<p style=\"line-height: 2em; text-indent: 2em;\">新手站长做网站如何在短时间内获得权重和排名呢？如果你做的新网站是电影站或者图片站的话，那么SEO相对来说会难一点，因为大网站太多，排名不好上，种子站像BT天堂那种相对还是比较容易点，很多人去搜，比如XXX电影种子资源下载上面的，一般我们的网站只要是原创的内容，百分之90能上排名，因为基本上每天都有新电影电视剧上线，都是一些新词，早早发文章，排名会很稳定！我们今天要做的就是福利类型的站点了，下面给大家一步步的分析!</p><p style=\"line-height: 2em; text-indent: 2em; text-align: center;\"><img src=\"/uploads/img1/20161018/58063e01ca613.jpg\" alt=\"SEO技巧：新网站如何在短时间内获取权重和排名？\" width=\"300\" height=\"214\" title=\"SEO技巧：新网站如何在短时间内获取权重和排名？\"/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>一、程序和域名的挑选!</strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\">1、程序方面我这里建议用z-blog和WordPress这两款，最好是z-blog，首先z-blog管理比较方面，后台一目了然，侧栏、模板、留言，分类，插件下载这些等等，都比较简单的，wp的话就不太建议去用，因为吧!据用户反馈说这个程序后期网站内容多了，卡得厉害，还有就是后台没那么简单，如果你有经验的话，你也可以用wp程序，我感觉就是卡，唯一就是模板多一点，收费少一点，z-blog后台都是收费的，不收费的一般都是些残次品，或者是打知名度的，我也就不说啥了!</p><p style=\"line-height: 2em; text-indent: 2em;\">2、域名方面一定要是老域名，还有就是拼音的域名了，一般选择3拼的最好，因为要一个品牌词，最好的就是一些擦边或者违规平台的品牌词去注册域名，比如：兰桂坊!我之前就挑选了一个非常不错的平台，这里就不给大家说了，说说这个兰桂坊，就是一个在服务器在国外的直播平台，被举报很多次，也查了很多次，一直都没有被封的平台，里面直接上大秀，刷1000块钱的礼物，人家主播直接脱衣服!如果说你这个品牌词的话，基本上网站收录了，就会有搜索来的流量，非常不错的选择!你们可以去找找!</p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>二、网站栏目的布局!</strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\">网站布局方面要重点说一说，我这里做的是5个栏目，也算是综合性的，给大家分析一下!</p><p style=\"line-height: 2em; text-indent: 2em;\">1、影视圈，主要是用来发布一些，影视资源和一些资讯，发一些电影的网盘啥的!磁力链接啥的都可以!</p><p style=\"line-height: 2em; text-indent: 2em;\">2、美图秀，可以去一些网站收集一些图片内容发布，一些岛国妹子的套图啥的，排名老好了，我当天发的文章就带来上百流量了!</p><p style=\"line-height: 2em; text-indent: 2em;\">3、热搜榜，可以发布一些热点新闻啥的，排名就更不说了，像这样一个网站，一些新的东西排名都是很快的，我们还可以发布一些门事件啥的，流量多多啊!后期排名会更好!</p><p style=\"line-height: 2em; text-indent: 2em;\">4、账号库，无聊的时候去一些大网站，找点电影网站的会员账号发布出来，点击量也是非常高的!</p><p style=\"line-height: 2em; text-indent: 2em;\">5、福利吧，这个栏目算最重要的一个栏目了，用来发布一些小视频啊，像微博上面的那些，还有一些表情包，一些app福利软件网站啥推荐一下，反正就是一些乱七八糟的福利啥的，什么VR游戏啊，什么网络mc搞怪的啊，还可以发布一些内涵的知识，都可以!基本上，按照这样的布局网站就属于正规了，甚至到后期，如果你网站做大了，还可以转型做新闻类的站点，都是可以的!只要手里了就能有流量来，这是我的经验之谈!</p><p style=\"line-height: 2em; text-indent: 2em;\">这里说明一下，z-blog需要点技术，你可以去购买模板的时候，让人给你做出一个栏目可以添加关键词的功能!例如：</p><p style=\"line-height: 2em; text-indent: 2em; text-align: center;\"><img src=\"/uploads/img1/20161018/58063e1661676.jpg\" alt=\"SEO技巧：新网站如何在短时间内获取权重和排名？\" width=\"300\" height=\"59\" title=\"SEO技巧：新网站如何在短时间内获取权重和排名？\"/></p><p style=\"line-height: 2em; text-indent: 2em;\">这个图片一看应该都有能明白了吧!我用的这个模板是自带这个功能的，如果不行的话，就直接把栏目的名称改成关键词就行了!</p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>三、文章发表和布局!</strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\">文章发布应该是最重要的了，这里简单的说说一些小技巧!</p><p style=\"line-height: 2em; text-indent: 2em;\">1、收集发布的内容，我们可以百度一下福利吧等相关关键词，就能搜到很多同行的网站，这种网站不想我们做自媒体的网站，每写一篇文章，都会投稿到各大平台。对SEO来说，你去复制他的文章基本上就是渣渣了，在好的文章，都没啥用!但是这种福利网站就不一样了，基本上没什么人去转载他，你只需要改改内容和标题，那就是你原创，又没有竞争，排名很快的!</p><p style=\"line-height: 2em; text-indent: 2em;\">2、首先需要原创文章，先让百度给你的网站一个好感，其实原创文章也是很简单的，可以找个福利视频看看，比如网上的一些搞笑或者内涵的视频段子，比如：之前看过一个美女夹着跳弹读书的一个视频，把里面的台词打出来，在简单是说说自己感想，然后把标题修改一下，基本上收录很快的，我之前给一个学员测试的时候，手动去百度提交了一下，直接是秒收录!</p><p style=\"line-height: 2em; text-indent: 2em;\">3、网站内链的布局!在自己文章底部加上相关推荐，这个是什么样的请见本文最底部!还有一个就是标签了，这个标签页是非常重要的，z-blog发布文章的时候最下面有的输入标签的框框，我们要给自己的网站布局好标签，比如今天发布了一组美女套图，那么我们就用这个做标签，下次发类似的文章的时候还用这个标签，那么久像一个分类一样，进入这个标签就能看到类似的文章，比如我博客的贴吧推广这个标签里面就都是我写的贴吧相关的文章，我们在文章中间插入这个标签的链接，比如更多美女套图，做上锚文本，那种这个就是一个关键词，以后发布类似的文章都用这个标签，然后再类似文章里面都带上链接，相当于话题!</p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>四、站外推广技巧分享!</strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\">1、刚才说的那些福利博客基本上是都可以留言的，可以评论引流，这里我就不多说了!</p><p style=\"line-height: 2em; text-indent: 2em;\">2、其实和自媒体一样，这类网站也可以投稿，你可以去看下!还可以在热点栏目里面发布一些新闻资讯类型的去搜狐自媒体或者百度百家，都是可以做外链的，主要是引点蜘蛛过来，这种网站的用户体验是非常高的，基本上排名啥的，都不是问题!我目前的网站基本上能赶上新闻源了!</p><p style=\"line-height: 2em; text-indent: 2em;\">3、还可以跟这些网站交换一下友链，如果你品牌词选的好的话，一个星期就权重4了!换友链的时候是非常好换的!</p><p style=\"line-height: 2em; text-indent: 2em;\">4、还有一种就是推广站了，这种站其实我也不知道为的什么，我什么都没做，天天来上千流量!给大家说一个(韩流推广)你们自己去研究吧!</p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>五、热点借势营销推广!</strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\">这种应该是比较高端的裂变了，z-blog后台有一个叫做隐藏内容的插件，必须要分享后才能看到隐藏的内容，我们可以把你想隐藏的内容隐藏起来，比如下载链接!别人要看就要分享，基本上分享率高达百分之50!注明一下这个这个技巧我是看一个的博主的思路之后进行演变的，别到时来喷我就是了!</p><p style=\"line-height: 2em; text-indent: 2em;\"><span style=\"line-height: 2em; text-indent: 2em;\">可以看下上图的效果!那么如果碰到热点的时候，我们把标题的关键词布局好，例如，优衣库小视频等关键词布局到文章标题上面，内容随意都可以，在弄一张诱惑的图片，转化率就高了，可能有人会问，人家分享后不会删除啊!是的，肯定会删除，除非一些不玩微博的人，可能就不会删除了!那么其实我们来流量的地方并不是靠他分享出去之后走他的微博来流量，当然如果有大V分享出去的话，来的人就更多了!那么处了这个，其他的地方哪里能来流量呢!人家都删除了，好的!别着急，下面给大家看一张图片!</span></p><p style=\"line-height: 2em; text-indent: 2em; text-align: center;\"><img src=\"/uploads/img1/20161018/58063e3a4f64d.jpg\" alt=\"SEO技巧：新网站如何在短时间内获取权重和排名？\" width=\"300\" height=\"161\" title=\"SEO技巧：新网站如何在短时间内获取权重和排名？\"/></p><p style=\"line-height: 2em; text-indent: 2em;\">我们看一下，当别人分享博客后，百度会拍取快照，就会排名到这来来的，我记得之前陆家嘴视频的时候，我一天整了5万流量，这么会这么高的流量呢?记得当天的搜索指数的300多万的指数，而这个微博是排名在第2位的，当我们点击进入微博最新消息的时候，里面全部都是我这篇文章被人分享出去，然后被百度拍下来的快照，基本上是刷屏的节奏啊，偶尔有个大V号分享一下，就能在百度百万指数的词下首页曝光!那你们说这个流量是不是非常给力呢!</p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>六、网站的赢利点!</strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\">1、首先第一个赢利点，当然就是广告了，当我们网站做到日流量3万+的时候，就可以开始接入广告位了，z-blog的侧栏是一个非常不错的广告位，我们可以设置6-10个图片广告位，大概300左右一个位置，这里每月就有3000左右吧!这里我就不详细的讲解，玩z-blog都会懂侧栏的!</p><p style=\"line-height: 2em; text-indent: 2em;\">2、导航栏也可以用做广告位，这类的网站我们一般大多数优化用到的是首页和内页去优化了，上面说过了，我们找一个非常不错而又带高指数的品牌词去做，导航上面那么我们接广告的时候，一般是一次接3个月起，那么这个也是根据seo的规则来的，三个月改一个导航，是不会对网站有任何影响的，下面来看一张图片：</p><p style=\"line-height: 2em; text-indent: 2em; text-align: center;\"><img src=\"/uploads/img1/20161018/58063e48db95e.jpg\" alt=\"SEO技巧：新网站如何在短时间内获取权重和排名？\" width=\"300\" height=\"91\" title=\"SEO技巧：新网站如何在短时间内获取权重和排名？\"/></p><p style=\"line-height: 2em; text-indent: 2em;\">我们可以看到，这里用的模板是本站的模板，我们做的4个栏目是放到侧边的小导航上面，而主导航上面有7个位置，都是可以用来接广告的，大概1000块左右一个月，这里就是7000来块了!注意：接广告一定不要去接一些违法的广告!</p><p style=\"line-height: 2em; text-indent: 2em;\">3、网站如果备案的话，还可以接入广告联盟，比如像图+这种广告还是不错的，一般的站长都会用上，这个又不影响用户体验，非常不错的，至于一个月能有多少，就不说很清楚了，因为我也是刚接入。一天也就几十块吧!</p><p style=\"line-height: 2em; text-indent: 2em;\">4、像给人家发软文，还有文章内页的广告位等等，都是可以带来收入的，这些我就不一一讲解了!我们可以用来坐坐淘宝客什么的，比如发软文的时候，如果文章中有相关的内容，就可以把相关的淘宝客链接插入文中，也能带来一点收益的!就像前段时间，有一个妹子夹着跳弹读书的视频非常火爆，我们就可以直接在文章中接入淘宝客的链接，流量是不是非常的精准呢!</p><p style=\"line-height: 2em; text-indent: 2em;\">但还有一个主要的，我需要说一下，我为什么会做这样的一个网站呢?因为我是做VR眼镜，用的就是这种方式去推广的，因为我需要的是男性流量，这样的一个站点的流量是非常精准的吧!</p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>七、微信公众号吸粉</strong></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong><br/></strong></p><p style=\"line-height: 2em; text-indent: 2em;\">最后一个也算是重点，我们有这样一个网站，当然流量也不能浪费了，在我们发布一些影视种子或者是图片的时候，可以把压缩包加入解压密码，让人关注公众号，回复相关关键词，获取解压密码，这样就能让人关注你的公众号了!是不是互不影响呢!</p><p style=\"line-height: 2em; text-indent: 2em;\">总结：以上分享都是本人亲身的操作经验，操作起来需要一点z-blog和SEO方面的经验，百度上面也有不少教程，可以去学习一下!如果你能坚持做3个月以上的话，绝对能打造一个这样的网站，根据我以上的布局，如果哪天你想转型，比如做成新闻资讯站，也是非常容易的!拿下新闻源，也是有可能的!别的不多说，贵在坚持!</p><p><br/></p>','新手站长做网站如何在短时间内获得权重和排名呢？如果你做的新网站是电影站或者图片站的话，那么SEO相对来说会难一点，因为大网站太多，排名不好上，种子站像BT天堂那种相对还是比较容易点，很多人去搜，比如XXX电影种子资源下载上面的，一般我们的网','1476803333','1476804252','3','44','1','1','','1','0','1','0','0','SEO技巧,权重,排名');
INSERT INTO `my_article` VALUES ('532','神舟十一号与天宫二号对接成功 航天员景海涛、陈冬入驻天宫二号实验舱','','','新华网、上海报业','管理员','','/uploads/img1/20161019/5806d654c3e55.png!300X300.jpg','<p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">中国梦，航天梦到，伟大复兴梦，<span style=\"line-height: 32px; text-indent: 32px;\">素材火源码下载站发来贺电！</span>愿祖国越来越强大富有！据媒体报道，今日凌晨19日3时31分，神舟十一号载人飞船与天宫二号空间实验室成功实现自动交会对接。这是天宫二号自9月15日发射入轨以来，与神舟飞船开展的首次交会对接。</p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20161019/5806d654c3e55.png\" title=\"航天员景海涛、陈冬进入天宫二号实验舱\" alt=\"航天员景海涛、陈冬进入天宫二号实验舱\" width=\"640\" height=\"357\"/></p><p style=\"text-align: center;\"><strong>航天员景海涛、陈冬进入天宫二号实验舱</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">为了这次太空之吻，神舟十一号5次变轨追赶天宫。对接实施期间，航天员景海鹏、陈冬在神舟十一号飞船返回舱值守，按照指令发送操作，并通过天地通信系统，迅速准确地向地面报告交会对接实施情况。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">完成对接后，两名航天员从神舟十一号飞船进入天宫二号，开展空间科学实验。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">神舟十一号载人飞船发射入轨以来，两名航天员先后完成了手控指令发送、返回舱舱门开启、服装更换、医学检查等工作，与航天员中心地面支持人员进行了医监通话。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">目前，两名航天员身心状态良好，进食及睡眠一切正常，各项工作开展顺利。封面图为两名航天员进入天宫二号实验舱后，向祖国和人民敬礼。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>原标题：神舟十一号与天宫二号对接成功 航天员景海涛、陈冬入驻天宫二号实验舱</strong></p><p><br/></p>','中国梦，航天梦到，伟大复兴梦，素材火源码下载站发来贺电！愿祖国越来越强大富有！据媒体报道，今日凌晨19日3时31分，神舟十一号载人飞船与天宫二号空间实验室成功实现自动交会对接。这是天宫二号自9月15日发射入轨以来，与神舟飞船开展的首次交会对','1476842706','1476843328','3','43','1','5','','1','0','1','0','0','神舟十一号,天宫二号,景海涛,陈冬入');
INSERT INTO `my_article` VALUES ('533','湖南都市职业学院4天内竟有3名学生死亡，是巧合还是灵异事件？','','','凤凰网','管理员','','/uploads/img1/20161019/5806de1bd50b7.jpg!300X300.jpg','<p style=\"line-height: 2em; text-indent: 2em;\"><strong>摘要：湖南都市职业学院上头条了，原因竟是近几日内接连发生学生死亡案！据澎湃新闻，10月14日到17日，湖南都市职业学院三名学生死亡。三位死者中，2人系坠楼身亡，1人斗殴去世。这接连不断的死人，这不禁让人怀疑到底是巧合还是灵异事件？</strong></p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20161019/5806de1bd50b7.jpg\" title=\"湖南都市职业学院\" alt=\"湖南都市职业学院\" width=\"600\" height=\"517\"/></p><p style=\"text-align: center;\"><strong>湖南都市职业学院</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">据知情人士透露，10月14日，一名男生于宿舍楼跳楼身亡；15日，一名男生在校外KTV与他人斗殴时身亡；17日，另一名男生于宿舍楼跳楼身亡。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">学院理事长助理吴先生18日证实：第一个学生14日晚出事，事后查明该生生前两次到医院就诊查出精神分裂症；第二名学生出事时间为15日凌晨，该生与社会人员发生争执后被殴打致死；第三名学生因花钱问题，17日下午与家属在寝室发生争执后坠亡。三起学生死亡事件发生后，校方均对家属进行了安抚和积极协商，之后学校管理层召开了紧急会议。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>学生死亡事件真相还原：</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">第一名坠亡学生为10月14日晚上11点半左右坠楼，具体坠亡原因不明；第二名学生死亡时间为15日凌晨，疑因KTV与人斗殴而死。</p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20161019/5806df03eaa2c.jpg\" title=\"第一位跳楼死亡的学生\" alt=\"第一位跳楼死亡的学生\" width=\"348\" height=\"464\"/></p><p style=\"text-align: center;\"><strong>第一位跳楼死亡的学生，死因不明</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">KTV斗殴致死学生的父亲郭界群告诉澎湃新闻，儿子郭睿棋今年17岁，是湖南都市职业学院五年制大专金融系学生。14日上午，郭睿棋受浏阳籍学长张某林的邀请前往长沙市浏阳市（县级市）游玩。当日傍晚，郭睿棋一行五男一女在浏阳市内一家KTV内唱歌。其间，女子拿手机与KTV外一名男子视频，女子手机摄像头照到KTV内男子遭遇阻止，因而引发与女子视频男子对KTV内男子的不满，并电话里起争执。</p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20161019/5806df5e08737.jpg\" title=\"KTV斗殴致死学生郭睿棋\" alt=\"KTV斗殴致死学生郭睿棋\" width=\"600\" height=\"800\"/></p><p style=\"text-align: center;\"><strong>KTV斗殴致死学生郭睿棋</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">第三名死亡学生疑因花钱问题与父亲起争执后坠亡。他说，10月17日坠楼身亡的学生坠亡前，该学生的父母均在旁边。当时，学生要求父母给他买电脑，家里给他寄了5000元钱，后又给他汇款2000元，随后，父母觉得不对劲来到学校质问，引发争执。该生父亲提出让儿子请假回家休息三天，并开始为儿子整理行李。随后，情绪非常激动的儿子冲出寝室，坠楼身亡。</p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20161019/5806de7869819.jpg\" title=\"第三名死亡学生疑因花钱问题与父亲起争执后坠亡\" alt=\"第三名死亡学生疑因花钱问题与父亲起争执后坠亡\" width=\"434\" height=\"326\"/></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">郭界群说，随后，争执双方约在KTV附近面谈，见面后很快由口角升级为互殴。打斗过程中，郭睿棋颅骨开裂，另有三人重伤。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">由此看来，这三个死亡事件都是事出有因，仅仅只是个巧合而已，并不是什么灵异事件，大家大可不必惊慌。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">从这个事件可以看出，越来越突显对青年一代的政治思想教育的重要性，没有政治思想，缺乏理想信仰，就容易产生极端情绪，及纪律观念淡薄。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">小时候千宠百娇，养成了唯我独尊的习性，长大后跟人一接触、感觉无法适应。于是，跳楼、喝药、上吊等全来了，全然不顾亲人的感受。“棍棒下面出孝子”，这句老话还是有一定道理的。</p><p><br/></p>','摘要：湖南都市职业学院上头条了，原因竟是近几日内接连发生学生死亡案！据澎湃新闻，10月14日到17日，湖南都市职业学院三名学生死亡。三位死者中，2人系坠楼身亡，1人斗殴去世。这接连不断的死人，这不禁让人怀疑到底是巧合还是灵异事件？湖南都市职','1476844953','1477366017','13','45','1','5','','1','0','1','0','0','湖南都市职业学院,学生死亡,灵异事件');
INSERT INTO `my_article` VALUES ('534','fadsfsadf','','','','user1','','','<p>dfasfdadsfasf</p>','dfasfdadsfasf','1492754480','1492754480','0','44','1','0','','2','1','0','0','0','SEO技巧,权重');


# 转存表中的数据：my_attachment 
INSERT INTO `my_attachment` VALUES ('1','商品管理.png','img1/20160901/57c83c388c22e.png','1','61485','1','1472740409','1','0');
INSERT INTO `my_attachment` VALUES ('2','5393dd0f509c9.jpg','img1/20160903/57cae15020dd1.jpg','1','44918','1','1472913744','1','0');
INSERT INTO `my_attachment` VALUES ('3','57cd788d3a0b3.gif','img1/20160905/57cd7bbf41128.gif','1','1999714','1','1473084370','1','0');
INSERT INTO `my_attachment` VALUES ('4','57ce2f51336db.jpg','img1/20160906/57ce33ca94f75.jpg','1','512015','1','1473131469','1','0');
INSERT INTO `my_attachment` VALUES ('5','57cd98200e2ca.jpg','img1/20160906/57ce340760591.jpg','1','294308','1','1473131528','1','0');
INSERT INTO `my_attachment` VALUES ('6','big.jpg','img1/20160915/57dac4da0946a.jpg','1','517033','1','1473955035','1','0');
INSERT INTO `my_attachment` VALUES ('7','big.jpg','file1/20160916/57dac7cc2d711.jpg','1','517033','0','1473955788','1','0');
INSERT INTO `my_attachment` VALUES ('8','big.jpg','img1/20160917/57dcfb7a9dd0a.jpg','1','1029662','1','1474100091','1','0');
INSERT INTO `my_attachment` VALUES ('9','big.jpg','file1/20160917/57dcfb8deafd3.jpg','1','1029662','0','1474100110','1','0');
INSERT INTO `my_attachment` VALUES ('10','57df5ee75892a.jpg','img1/20160924/57e6694ea3136.jpg','1','236561','1','1474718031','1','0');
INSERT INTO `my_attachment` VALUES ('11','57df5ee6651e2.jpg','img1/20160924/57e6696a6d408.jpg','1','182423','1','1474718058','1','0');
INSERT INTO `my_attachment` VALUES ('12','57df5ee6da24a.jpg','img1/20160924/57e669a967256.jpg','1','89570','1','1474718121','1','0');
INSERT INTO `my_attachment` VALUES ('13','57df5ee7d6330.jpg','img1/20160924/57e669a9c6d3a.jpg','1','265481','1','1474718122','1','0');
INSERT INTO `my_attachment` VALUES ('14','1-3.jpg','img1/20160924/57e671d027948.jpg','1','153581','1','1474720209','1','0');
INSERT INTO `my_attachment` VALUES ('15','1-2.jpg','img1/20160924/57e671d1284dd.jpg','1','169311','1','1474720210','1','0');
INSERT INTO `my_attachment` VALUES ('16','1-1.jpg','img1/20160924/57e671d225dc5.jpg','1','188598','1','1474720210','1','0');
INSERT INTO `my_attachment` VALUES ('17','2-1.jpg','img1/20160924/57e671d2a4d04.jpg','1','27401','1','1474720210','1','0');
INSERT INTO `my_attachment` VALUES ('18','2-2.jpg','img1/20160924/57e671d34f5cf.jpg','1','57222','1','1474720211','1','0');
INSERT INTO `my_attachment` VALUES ('19','2-3.jpg','img1/20160924/57e671d373006.jpg','1','69788','1','1474720211','1','0');
INSERT INTO `my_attachment` VALUES ('20','2-4.jpg','img1/20160924/57e67226e2bca.jpg','1','399807','1','1474720295','1','0');
INSERT INTO `my_attachment` VALUES ('21','1.jpg','img1/20160925/57e6bf2acca8f.jpg','1','159491','1','1474740011','1','0');
INSERT INTO `my_attachment` VALUES ('22','3.jpg','img1/20160925/57e6bf2f0b87c.jpg','1','169251','1','1474740016','1','0');
INSERT INTO `my_attachment` VALUES ('23','4.jpg','img1/20160925/57e6bf30315c7.jpg','1','134636','1','1474740017','1','0');
INSERT INTO `my_attachment` VALUES ('24','5.jpg','img1/20160925/57e6bf31e0f2b.jpg','1','175971','1','1474740019','1','0');
INSERT INTO `my_attachment` VALUES ('25','6.jpg','img1/20160925/57e6bf3405aaa.jpg','1','146959','1','1474740021','1','0');
INSERT INTO `my_attachment` VALUES ('26','7.jpg','img1/20160925/57e6bf35459ac.jpg','1','144374','1','1474740022','1','0');
INSERT INTO `my_attachment` VALUES ('27','1.jpg','img1/20160925/57e6c1c2d9340.jpg','1','150728','1','1474740675','1','0');
INSERT INTO `my_attachment` VALUES ('28','2.jpg','img1/20160925/57e6c1c35760c.jpg','1','182605','1','1474740675','1','0');
INSERT INTO `my_attachment` VALUES ('29','3.jpg','img1/20160925/57e6c1c3b1f71.jpg','1','219334','1','1474740677','1','0');
INSERT INTO `my_attachment` VALUES ('30','4.jpg','img1/20160925/57e6c1c51ea98.jpg','1','255911','1','1474740677','1','0');
INSERT INTO `my_attachment` VALUES ('31','5.jpg','img1/20160925/57e6c1c603509.jpg','1','259361','1','1474740678','1','0');
INSERT INTO `my_attachment` VALUES ('32','6.jpg','img1/20160925/57e6c1c6eca09.jpg','1','173611','1','1474740679','1','0');
INSERT INTO `my_attachment` VALUES ('33','yun.jpg','img1/20160928/57eb33ea580fb.jpg','1','201256','1','1475032042','1','0');
INSERT INTO `my_attachment` VALUES ('34','yun.jpg','img1/20160928/57eb35256a608.jpg','1','201256','1','1475032357','1','0');
INSERT INTO `my_attachment` VALUES ('35','ico.png','img1/20160928/57eb3537c3033.png','1','21458','1','1475032375','1','0');
INSERT INTO `my_attachment` VALUES ('36','1.jpg','img1/20161001/57ef2cdf3a679.jpg','1','300189','1','1475292384','1','0');
INSERT INTO `my_attachment` VALUES ('37','1.jpg','img1/20161001/57ef2cee7c076.jpg','1','300189','1','1475292399','1','0');
INSERT INTO `my_attachment` VALUES ('38','2.jpg','img1/20161001/57ef2cf5e3062.jpg','1','243518','1','1475292407','1','0');
INSERT INTO `my_attachment` VALUES ('39','3.jpg','img1/20161001/57ef2cfe4a2b1.jpg','1','154896','1','1475292415','1','0');
INSERT INTO `my_attachment` VALUES ('40','1.jpg','img1/20161001/57ef8bdd7523e.jpg','1','300189','1','1475316702','1','0');
INSERT INTO `my_attachment` VALUES ('41','1.jpg','img1/20161001/57ef8c13e5cca.jpg','1','300189','1','1475316757','1','0');
INSERT INTO `my_attachment` VALUES ('42','1.jpg','img1/20161001/57ef8d25629b3.jpg','1','300189','1','1475317030','1','0');
INSERT INTO `my_attachment` VALUES ('43','2.jpg','img1/20161001/57ef8d3d6b10d.jpg','1','243518','1','1475317054','1','0');
INSERT INTO `my_attachment` VALUES ('44','3.jpg','img1/20161001/57ef8d5b0673a.jpg','1','154896','1','1475317083','1','0');
INSERT INTO `my_attachment` VALUES ('45','4.jpg','img1/20161001/57ef8d633477f.jpg','1','122265','1','1475317092','1','0');
INSERT INTO `my_attachment` VALUES ('46','5.jpg','img1/20161001/57ef8d69cad45.jpg','1','134945','1','1475317098','1','0');
INSERT INTO `my_attachment` VALUES ('47','6.jpg','img1/20161001/57ef8d7011fdb.jpg','1','154647','1','1475317104','1','0');
INSERT INTO `my_attachment` VALUES ('48','7.jpg','img1/20161001/57ef8d7566333.jpg','1','103931','1','1475317109','1','0');
INSERT INTO `my_attachment` VALUES ('49','8.jpg','img1/20161001/57ef8d79c4484.jpg','1','49652','1','1475317113','1','0');
INSERT INTO `my_attachment` VALUES ('50','9.jpg','img1/20161001/57ef900d75e23.jpg','1','35423','1','1475317773','1','0');
INSERT INTO `my_attachment` VALUES ('51','10.jpg','img1/20161001/57ef901427ade.jpg','1','42088','1','1475317780','1','0');
INSERT INTO `my_attachment` VALUES ('52','亮剑拼车 顺风车信息 - 亮剑站长社区 - Powered by Discuz!.png','img1/20161002/57f11d8a49ca2.png','1','1909678','1','1475419532','1','0');
INSERT INTO `my_attachment` VALUES ('53','门户-N5门户-163K新版 - Powered by Discuz!.png','img1/20161003/57f1c08655477.png','1','1574317','1','1475461256','1','0');
INSERT INTO `my_attachment` VALUES ('54','商家点评.png','img1/20161003/57f1c3fc10dff.png','1','796096','1','1475462141','1','0');
INSERT INTO `my_attachment` VALUES ('55','最新楼盘.png','img1/20161003/57f1c40e32f96.png','1','835279','1','1475462160','1','0');
INSERT INTO `my_attachment` VALUES ('56','生活信息.png','img1/20161003/57f1c41d3711e.png','1','297393','1','1475462174','1','0');
INSERT INTO `my_attachment` VALUES ('57','本地论坛.png','img1/20161003/57f1c429cb024.png','1','658951','1','1475462187','1','0');
INSERT INTO `my_attachment` VALUES ('58','新闻资讯.png','img1/20161003/57f1c4380e70d.png','1','879995','1','1475462201','1','0');
INSERT INTO `my_attachment` VALUES ('59','长途拼车.png','img1/20161003/57f1c5ef97656.png','1','335916','1','1475462641','1','0');
INSERT INTO `my_attachment` VALUES ('60','上下班拼车.png','img1/20161003/57f1c60b64840.png','1','335121','1','1475462668','1','0');
INSERT INTO `my_attachment` VALUES ('61','其他拼车.png','img1/20161003/57f1c6188bdd8.png','1','333571','1','1475462682','1','0');
INSERT INTO `my_attachment` VALUES ('62','首页.jpg','img1/20161004/57f3b3db5bd8a.jpg','1','60692','1','1475589083','1','0');
INSERT INTO `my_attachment` VALUES ('63','详情页.jpg','img1/20161004/57f3b3f274f46.jpg','1','69665','1','1475589106','1','0');
INSERT INTO `my_attachment` VALUES ('64','html5手机wap购物网站模板.jpg','img1/20161004/57f3bd0eb9fcf.jpg','1','31281','1','1475591438','1','0');
INSERT INTO `my_attachment` VALUES ('65','1c7d4262f1e9e55e4819fc85761c25b9.jpg','img1/20161004/57f3bd1dc0057.jpg','1','569993','1','1475591454','1','0');
INSERT INTO `my_attachment` VALUES ('66','3cbf4ab31e1c8b301251a41732ac02e2.jpg','img1/20161004/57f3bd3ec9e45.jpg','1','558466','1','1475591487','1','0');
INSERT INTO `my_attachment` VALUES ('67','39e6a93172c2d5500eb3ad9bfda2f8fb.jpg','img1/20161004/57f3bd51742e2.jpg','1','599797','1','1475591505','1','0');
INSERT INTO `my_attachment` VALUES ('68','70fb1fe93c0a3d9446ccacab7cd1f29a.jpg','img1/20161004/57f3bd6e18768.jpg','1','582043','1','1475591534','1','0');
INSERT INTO `my_attachment` VALUES ('69','258e27a4a908d5457e42cc81fb19700e.jpg','img1/20161004/57f3bf73268f4.jpg','1','558222','1','1475592051','1','0');
INSERT INTO `my_attachment` VALUES ('70','首页.jpg','img1/20161007/57f680d2388f6.jpg','0','0','1','1475772627','1','0');
INSERT INTO `my_attachment` VALUES ('71','仿拉勾网模板企业列表页.png','img1/20161007/57f71d03e18ea.png','0','0','1','1475812614','1','0');
INSERT INTO `my_attachment` VALUES ('72','仿拉勾网模板文章列表页.png','img1/20161007/57f71d0610cf4.png','0','0','1','1475812615','1','0');
INSERT INTO `my_attachment` VALUES ('73','仿拉勾网模板首页.png','img1/20161007/57f71d07da7a6.png','0','0','1','1475812617','1','0');
INSERT INTO `my_attachment` VALUES ('74','首页.jpg','img1/20161007/57f71e135bfd4.jpg','0','0','1','1475812884','1','0');
INSERT INTO `my_attachment` VALUES ('75','3活动页.png','img1/20161007/57f7262746ab6.png','0','0','1','1475814954','1','0');
INSERT INTO `my_attachment` VALUES ('76','1首页.png','img1/20161007/57f7262a565ca.png','0','0','1','1475814956','1','0');
INSERT INTO `my_attachment` VALUES ('77','2列表页.png','img1/20161007/57f7262c3a017.png','0','0','1','1475814959','1','0');
INSERT INTO `my_attachment` VALUES ('78','4论坛.png','img1/20161007/57f7262f3f50a.png','0','0','1','1475814961','1','0');
INSERT INTO `my_attachment` VALUES ('79','QQ截图20161007104553.jpg','abc1/20161007/57f731b802383.jpg','1','63726','0','1475817912','1','0');
INSERT INTO `my_attachment` VALUES ('80','QQ截图20161007122601.jpg','abc1/20161007/57f73209e610a.jpg','1','57061','0','1475817993','1','0');
INSERT INTO `my_attachment` VALUES ('81','景点列表页.png','img1/20161007/57f73757c641d.png','0','0','1','1475819354','1','0');
INSERT INTO `my_attachment` VALUES ('82','首页.png','img1/20161007/57f7375aeba09.png','0','0','1','1475819358','1','0');
INSERT INTO `my_attachment` VALUES ('83','论坛.png','img1/20161007/57f7375e33427.png','0','0','1','1475819360','1','0');
INSERT INTO `my_attachment` VALUES ('84','QQ截图20161007134546.jpg','abc1/20161007/57f7381a683b7.jpg','1','154964','0','1475819546','1','0');
INSERT INTO `my_attachment` VALUES ('85','dz_x3_meishi_001(1).jpg','img1/20161007/57f79a8fbed46.jpg','1','71577','1','1475844752','1','0');
INSERT INTO `my_attachment` VALUES ('86','dz_x3_meishi_002(1).jpg','img1/20161007/57f79a961670b.jpg','1','71180','1','1475844758','1','0');
INSERT INTO `my_attachment` VALUES ('87','模型管理.png','img1/20161007/57f79e679eaae.png','0','0','1','1475845736','1','0');
INSERT INTO `my_attachment` VALUES ('88','模块设置.png','img1/20161007/57f79e682b339.png','0','0','1','1475845736','1','0');
INSERT INTO `my_attachment` VALUES ('89','系统设置.png','img1/20161007/57f79e68a82fe.png','0','0','1','1475845737','1','0');
INSERT INTO `my_attachment` VALUES ('90','文件管理.png','img1/20161007/57f79e6918df4.png','0','0','1','1475845737','1','0');
INSERT INTO `my_attachment` VALUES ('91','后台首页.png','img1/20161007/57f79e6975730.png','0','0','1','1475845737','1','0');
INSERT INTO `my_attachment` VALUES ('92','常用工具.png','img1/20161007/57f79e69e575b.png','0','0','1','1475845738','1','0');
INSERT INTO `my_attachment` VALUES ('93','工作台.png','img1/20161007/57f79e6a63209.png','0','0','1','1475845738','1','0');
INSERT INTO `my_attachment` VALUES ('94','后台登录页.png','img1/20161007/57f79e6acd883.png','0','0','1','1475845739','1','0');
INSERT INTO `my_attachment` VALUES ('95','首页.png','img1/20161008/57f85ffe399d6.png','0','0','1','1475895298','1','0');
INSERT INTO `my_attachment` VALUES ('96','DZ手机模板.jpg','img1/20161008/57f8bd5803517.jpg','0','0','1','1475919192','1','0');
INSERT INTO `my_attachment` VALUES ('97','首页.png','img1/20161008/57f8bd5847ec0.png','0','0','1','1475919196','1','0');
INSERT INTO `my_attachment` VALUES ('98','文章列表页.png','img1/20161008/57f8bd5c4f3a4.png','0','0','1','1475919199','1','0');
INSERT INTO `my_attachment` VALUES ('99','作品页.png','img1/20161008/57f8bd5fa75a9.png','0','0','1','1475919202','1','0');
INSERT INTO `my_attachment` VALUES ('100','文章详情页.png','img1/20161008/57f8bd7ab3b54.png','0','0','1','1475919229','1','0');
INSERT INTO `my_attachment` VALUES ('101','首页.png','img1/20161008/57f8bd7d493d8.png','0','0','1','1475919232','1','0');
INSERT INTO `my_attachment` VALUES ('102','列表页.png','img1/20161008/57f8bd80cfbf4.png','0','0','1','1475919236','1','0');
INSERT INTO `my_attachment` VALUES ('103','首页.png','img1/20161009/57f9c1930051c.png','0','0','1','1475985812','1','0');
INSERT INTO `my_attachment` VALUES ('104','所有项目.png','img1/20161009/57f9c194b4bef.png','0','0','1','1475985813','1','0');
INSERT INTO `my_attachment` VALUES ('105','最新动态.png','img1/20161009/57f9c1955f09a.png','0','0','1','1475985815','1','0');
INSERT INTO `my_attachment` VALUES ('106','积分商城.png','img1/20161009/57f9c197c4d5b.png','0','0','1','1475985816','1','0');
INSERT INTO `my_attachment` VALUES ('107','首页.png','img1/20161009/57f9c198eaaeb.png','0','0','1','1475985819','1','0');
INSERT INTO `my_attachment` VALUES ('108','活动.png','img1/20161009/57f9c19bed194.png','0','0','1','1475985820','1','0');
INSERT INTO `my_attachment` VALUES ('109','团购.png','img1/20161009/57f9c19ce73c0.png','0','0','1','1475985822','1','0');
INSERT INTO `my_attachment` VALUES ('110','商城.png','img1/20161009/57f9c19e511e0.png','0','0','1','1475985824','1','0');
INSERT INTO `my_attachment` VALUES ('111','商家列表.png','img1/20161009/57f9c1a0328fe.png','0','0','1','1475985826','1','0');
INSERT INTO `my_attachment` VALUES ('112','首页.png','img1/20161010/57fb05ea0471a.png','0','0','1','1476068843','1','0');
INSERT INTO `my_attachment` VALUES ('113','所有项目.png','img1/20161010/57fb05ebde6f4.png','0','0','1','1476068844','1','0');
INSERT INTO `my_attachment` VALUES ('114','最新动态.png','img1/20161010/57fb05ec9b896.png','0','0','1','1476068846','1','0');
INSERT INTO `my_attachment` VALUES ('115','积分商城.png','img1/20161010/57fb05eee503e.png','0','0','1','1476068848','1','0');
INSERT INTO `my_attachment` VALUES ('116','首页.png','img1/20161010/57fb05f04d282.png','0','0','1','1476068851','1','0');
INSERT INTO `my_attachment` VALUES ('117','活动.png','img1/20161010/57fb05f327e33.png','0','0','1','1476068852','1','0');
INSERT INTO `my_attachment` VALUES ('118','团购.png','img1/20161010/57fb05f426900.png','0','0','1','1476068853','1','0');
INSERT INTO `my_attachment` VALUES ('119','商城.png','img1/20161010/57fb05f5a19ac.png','0','0','1','1476068855','1','0');
INSERT INTO `my_attachment` VALUES ('120','商家列表.png','img1/20161010/57fb05f79a853.png','0','0','1','1476068857','1','0');
INSERT INTO `my_attachment` VALUES ('121','订单与结算.jpg','img1/20161010/57fb0668aaed4.jpg','0','0','1','1476068968','1','0');
INSERT INTO `my_attachment` VALUES ('122','产品及文案.jpg','img1/20161010/57fb0668e29fd.jpg','0','0','1','1476068969','1','0');
INSERT INTO `my_attachment` VALUES ('123','登录页.jpg','img1/20161010/57fb066918ad4.jpg','0','0','1','1476068969','1','0');
INSERT INTO `my_attachment` VALUES ('124','我的公众号.jpg','img1/20161010/57fb0669331ac.jpg','0','0','1','1476068969','1','0');
INSERT INTO `my_attachment` VALUES ('125','产品详情.jpg','img1/20161010/57fb06695c8ef.jpg','0','0','1','1476068969','1','0');
INSERT INTO `my_attachment` VALUES ('126','首页.jpg','img1/20161010/57fb06698a745.jpg','0','0','1','1476068969','1','0');
INSERT INTO `my_attachment` VALUES ('127','店铺列表页.jpg','img1/20161010/57fb0669b85e9.jpg','0','0','1','1476068969','1','0');
INSERT INTO `my_attachment` VALUES ('128','详情页.jpg','img1/20161010/57fb0669e15c5.jpg','0','0','1','1476068970','1','0');
INSERT INTO `my_attachment` VALUES ('129','首页.jpg','img1/20161011/57fc588b0e48d.jpg','0','0','1','1476155531','1','0');
INSERT INTO `my_attachment` VALUES ('130','成功案例.jpg','img1/20161011/57fc588b4e670.jpg','0','0','1','1476155531','1','0');
INSERT INTO `my_attachment` VALUES ('131','榜单.png','img1/20161011/57fc588b8f9f8.png','0','0','1','1476155533','1','0');
INSERT INTO `my_attachment` VALUES ('132','资讯.png','img1/20161011/57fc588da696d.png','0','0','1','1476155534','1','0');
INSERT INTO `my_attachment` VALUES ('133','礼品.png','img1/20161011/57fc588e616ba.png','0','0','1','1476155535','1','0');
INSERT INTO `my_attachment` VALUES ('134','首页.png','img1/20161011/57fc588f765c8.png','0','0','1','1476155536','1','0');
INSERT INTO `my_attachment` VALUES ('135','小组.png','img1/20161011/57fc5890b3efa.png','0','0','1','1476155537','1','0');
INSERT INTO `my_attachment` VALUES ('136','活动.png','img1/20161011/57fc58918e153.png','0','0','1','1476155538','1','0');
INSERT INTO `my_attachment` VALUES ('137','点评.png','img1/20161011/57fc5892b7188.png','0','0','1','1476155539','1','0');
INSERT INTO `my_attachment` VALUES ('138','商城.png','img1/20161011/57fc5893c86be.png','0','0','1','1476155542','1','0');
INSERT INTO `my_attachment` VALUES ('139','后台首页.png','img1/20161011/57fd03775fb19.png','0','0','1','1476199287','1','0');
INSERT INTO `my_attachment` VALUES ('140','修改用户组.png','img1/20161011/57fd0377f0c0b.png','0','0','1','1476199288','1','0');
INSERT INTO `my_attachment` VALUES ('141','系统主界面.png','img1/20161011/57fd0378b003e.png','0','0','1','1476199289','1','0');
INSERT INTO `my_attachment` VALUES ('142','登录页面.png','img1/20161011/57fd03796d2bc.png','0','0','1','1476199290','1','0');
INSERT INTO `my_attachment` VALUES ('143','用户组列表.png','img1/20161011/57fd037a2fedc.png','0','0','1','1476199290','1','0');
INSERT INTO `my_attachment` VALUES ('144','后台首页.png','img1/20161011/57fd037ad953c.png','0','0','1','1476199291','1','0');
INSERT INTO `my_attachment` VALUES ('145','文章管理页.png','img1/20161011/57fd037b41f84.png','0','0','1','1476199291','1','0');
INSERT INTO `my_attachment` VALUES ('146','前台首页.png','img1/20161012/57fdb41cc9c8d.png','0','0','1','1476244509','1','0');
INSERT INTO `my_attachment` VALUES ('147','后台首页.png','img1/20161012/57fdb41dd5494.png','0','0','1','1476244510','1','0');
INSERT INTO `my_attachment` VALUES ('148','前台会员注册页.png','img1/20161012/57fdb41e6b830.png','0','0','1','1476244511','1','0');
INSERT INTO `my_attachment` VALUES ('149','前台文章列表页.png','img1/20161012/57fdb41f4df88.png','0','0','1','1476244512','1','0');
INSERT INTO `my_attachment` VALUES ('150','内容管理.png','img1/20161012/57fdb4202c85e.png','0','0','1','1476244512','1','0');
INSERT INTO `my_attachment` VALUES ('151','微官网管理.png','img1/20161012/57fdb420d76db.png','0','0','1','1476244513','1','0');
INSERT INTO `my_attachment` VALUES ('152','前台文章详情页.png','img1/20161012/57fdb42170d20.png','0','0','1','1476244514','1','0');
INSERT INTO `my_attachment` VALUES ('153','前台会员中心.png','img1/20161012/57fdb4226333f.png','0','0','1','1476244515','1','0');
INSERT INTO `my_attachment` VALUES ('154','前台首页.png','img1/20161012/57fdb42348695.png','0','0','1','1476244517','1','0');
INSERT INTO `my_attachment` VALUES ('155','后台首页.png','img1/20161012/57fdb4253b2db.png','0','0','1','1476244518','1','0');
INSERT INTO `my_attachment` VALUES ('156','前台会员中心.png','img1/20161012/57fdb42629e4a.png','0','0','1','1476244519','1','0');
INSERT INTO `my_attachment` VALUES ('157','新闻中心.png','img1/20161012/57fdb4274adc3.png','0','0','1','1476244520','1','0');
INSERT INTO `my_attachment` VALUES ('158','诚聘英才.png','img1/20161012/57fdb4283c5cb.png','0','0','1','1476244522','1','0');
INSERT INTO `my_attachment` VALUES ('159','首页.png','img1/20161012/57fdb42a11a4a.png','0','0','1','1476244523','1','0');
INSERT INTO `my_attachment` VALUES ('160','产品中心.png','img1/20161012/57fdb42b5484a.png','0','0','1','1476244525','1','0');
INSERT INTO `my_attachment` VALUES ('161','成功案例.png','img1/20161012/57fdb42d34cc1.png','0','0','1','1476244526','1','0');
INSERT INTO `my_attachment` VALUES ('162','关于我们.png','img1/20161012/57fdb42e4949e.png','0','0','1','1476244526','1','0');
INSERT INTO `my_attachment` VALUES ('163','首页.jpg','img1/20161013/57fefef68f66b.jpg','0','0','1','1476329207','1','0');
INSERT INTO `my_attachment` VALUES ('164','后台首页.png','img1/20161013/57fefef71971a.png','0','0','1','1476329207','1','0');
INSERT INTO `my_attachment` VALUES ('165','后台栏目管理.png','img1/20161013/57fefef799211.png','0','0','1','1476329208','1','0');
INSERT INTO `my_attachment` VALUES ('166','后台广告管理.png','img1/20161013/57fefef80b4a9.png','0','0','1','1476329208','1','0');
INSERT INTO `my_attachment` VALUES ('167','后台账户管理.png','img1/20161013/57fefef87405b.png','0','0','1','1476329209','1','0');
INSERT INTO `my_attachment` VALUES ('168','后台文章管理.png','img1/20161013/57fefef906e7a.png','0','0','1','1476329209','1','0');
INSERT INTO `my_attachment` VALUES ('169','后台系统设置.png','img1/20161013/57fefef983635.png','0','0','1','1476329209','1','0');
INSERT INTO `my_attachment` VALUES ('170','后台缓存设置.png','img1/20161013/57fefef9f3b20.png','0','0','1','1476329210','1','0');
INSERT INTO `my_attachment` VALUES ('171','资讯.png','img1/20161014/580068ddbc714.png','0','0','1','1476421857','1','0');
INSERT INTO `my_attachment` VALUES ('172','首页.png','img1/20161014/580068e138578.png','0','0','1','1476421859','1','0');
INSERT INTO `my_attachment` VALUES ('173','会员.png','img1/20161014/580068e3621cf.png','0','0','1','1476421861','1','0');
INSERT INTO `my_attachment` VALUES ('174','热门问题.png','img1/20161014/580068e5222da.png','0','0','1','1476421862','1','0');
INSERT INTO `my_attachment` VALUES ('175','微信游戏.png','img1/20161014/580068e702f59.png','0','0','1','1476421863','1','0');
INSERT INTO `my_attachment` VALUES ('176','基础功能.png','img1/20161014/580068e77424d.png','0','0','1','1476421863','1','0');
INSERT INTO `my_attachment` VALUES ('177','大转盘.png','img1/20161014/580068e7ed3c0.png','0','0','1','1476421864','1','0');
INSERT INTO `my_attachment` VALUES ('178','商品管理.png','img1/20161014/580068e878486.png','0','0','1','1476421864','1','0');
INSERT INTO `my_attachment` VALUES ('179','用户管理.png','img1/20161014/580068e8e292f.png','0','0','1','1476421865','1','0');
INSERT INTO `my_attachment` VALUES ('180','节点管理.png','img1/20161015/5801a231a0ff7.png','0','0','1','1476502066','1','0');
INSERT INTO `my_attachment` VALUES ('181','文件管理.png','img1/20161015/5801a23256878.png','0','0','1','1476502067','1','0');
INSERT INTO `my_attachment` VALUES ('182','后台首页.png','img1/20161015/5801a2330c27e.png','0','0','1','1476502067','1','0');
INSERT INTO `my_attachment` VALUES ('183','登录页.png','img1/20161015/5801a233973a2.png','0','0','1','1476502068','1','0');
INSERT INTO `my_attachment` VALUES ('184','权限管理.png','img1/20161015/5801a234345e0.png','0','0','1','1476502068','1','0');
INSERT INTO `my_attachment` VALUES ('185','资讯管理.png','img1/20161015/5801a234c3720.png','0','0','1','1476502069','1','0');
INSERT INTO `my_attachment` VALUES ('186','目录结构截图.jpg','img1/20161015/5801a2356951b.jpg','0','0','1','1476502069','1','0');
INSERT INTO `my_attachment` VALUES ('187','项目截图.jpg','img1/20161016/5802f046e2142.jpg','0','0','1','1476587591','1','0');
INSERT INTO `my_attachment` VALUES ('188','安装页面.png','img1/20161016/5802f047468e9.png','0','0','1','1476587591','1','0');
INSERT INTO `my_attachment` VALUES ('189','登录页面.png','img1/20161016/5802f047b6ddc.png','0','0','1','1476587592','1','0');
INSERT INTO `my_attachment` VALUES ('190','栏目管理.png','img1/20161016/5802f0487e381.png','0','0','1','1476587593','1','0');
INSERT INTO `my_attachment` VALUES ('191','后台首页.png','img1/20161017/5804cca50f77a.png','1','26762','1','1476709541','1','0');
INSERT INTO `my_attachment` VALUES ('192','菜单管理.png','img1/20161017/5804ccae5383c.png','1','31761','1','1476709551','1','0');
INSERT INTO `my_attachment` VALUES ('193','房产管理.png','img1/20161017/5804ccb252488.png','1','23865','1','1476709554','1','0');
INSERT INTO `my_attachment` VALUES ('194','管理站点.png','img1/20161017/5804ccb588b6b.png','1','21544','1','1476709558','1','0');
INSERT INTO `my_attachment` VALUES ('195','内容管理.png','img1/20161017/5804ccb97fa98.png','1','26695','1','1476709562','1','0');
INSERT INTO `my_attachment` VALUES ('196','首页.png','img1/20161017/5804daaf39cb1.png','1','1121961','1','1476713139','1','0');
INSERT INTO `my_attachment` VALUES ('197','任务大厅.png','img1/20161017/5804dab9c1bdd.png','1','705332','1','1476713148','1','0');
INSERT INTO `my_attachment` VALUES ('198','服务.png','img1/20161017/5804dac0becbc.png','1','863541','1','1476713155','1','0');
INSERT INTO `my_attachment` VALUES ('199','thumb.jpg','img1/20161017/5804e0b5167f7.jpg','1','36234','1','1476714677','1','0');
INSERT INTO `my_attachment` VALUES ('200','首页.gif','img1/20161017/5804f064696e5.gif','1','1210406','1','1476718704','1','0');
INSERT INTO `my_attachment` VALUES ('201','商品详情页.gif','img1/20161017/5804f0ad5ff61.gif','1','526599','1','1476718771','1','0');
INSERT INTO `my_attachment` VALUES ('202','QQ截图20161017234504.jpg','img1/20161017/5804f1aaab0c3.jpg','1','90750','1','1476719019','1','0');
INSERT INTO `my_attachment` VALUES ('203','QQ截图20161017234712.jpg','img1/20161017/5804f2348891d.jpg','1','63648','1','1476719157','1','0');
INSERT INTO `my_attachment` VALUES ('204','首页.jpg','img1/20161018/58063863532a4.jpg','1','142276','1','1476802660','1','0');
INSERT INTO `my_attachment` VALUES ('205','后台.jpg','img1/20161018/5806386761d31.jpg','1','120322','1','1476802664','1','0');
INSERT INTO `my_attachment` VALUES ('206','商品列表页.jpg','img1/20161018/5806386b6bb66.jpg','1','115556','1','1476802667','1','0');
INSERT INTO `my_attachment` VALUES ('207','1.jpg','img1/20161018/58063e01ca613.jpg','1','19422','1','1476804097','1','0');
INSERT INTO `my_attachment` VALUES ('208','2.jpg','img1/20161018/58063e1661676.jpg','1','9377','1','1476804118','1','0');
INSERT INTO `my_attachment` VALUES ('209','3.jpg','img1/20161018/58063e3a4f64d.jpg','1','16397','1','1476804154','1','0');
INSERT INTO `my_attachment` VALUES ('210','4.jpg','img1/20161018/58063e48db95e.jpg','1','12719','1','1476804168','1','0');
INSERT INTO `my_attachment` VALUES ('211','139331416.png','img1/20161019/5806d654c3e55.png','1','330945','1','1476843093','1','0');
INSERT INTO `my_attachment` VALUES ('212','f010c232-8d31-4b69-897a-73a1c0322e05_size37_w600_h517.jpg','img1/20161019/5806de1bd50b7.jpg','1','38610','1','1476845084','1','0');
INSERT INTO `my_attachment` VALUES ('213','6338bb0a-c6d8-46ee-afc1-6377f726219a_size28_w434_h326.jpg','img1/20161019/5806de7869819.jpg','1','28924','1','1476845176','1','0');
INSERT INTO `my_attachment` VALUES ('214','a55b4580-76b6-4c4a-8b44-0287a601f8de_size14_w348_h464.jpg','img1/20161019/5806df03eaa2c.jpg','1','14364','1','1476845316','1','0');
INSERT INTO `my_attachment` VALUES ('215','e6605c2f-d652-4c4a-bb6f-a59deeafd2ae_size63_w600_h800.jpg','img1/20161019/5806df5e08737.jpg','1','65288','1','1476845406','1','0');


# 转存表中的数据：my_attachmentindex 
INSERT INTO `my_attachmentindex` VALUES ('13','3','5','');
INSERT INTO `my_attachmentindex` VALUES ('12','3','5','');
INSERT INTO `my_attachmentindex` VALUES ('11','3','5','');
INSERT INTO `my_attachmentindex` VALUES ('10','3','5','');
INSERT INTO `my_attachmentindex` VALUES ('20','4','5','');
INSERT INTO `my_attachmentindex` VALUES ('19','4','5','');
INSERT INTO `my_attachmentindex` VALUES ('18','4','5','');
INSERT INTO `my_attachmentindex` VALUES ('17','4','5','');
INSERT INTO `my_attachmentindex` VALUES ('16','4','5','');
INSERT INTO `my_attachmentindex` VALUES ('15','4','5','');
INSERT INTO `my_attachmentindex` VALUES ('14','4','5','');
INSERT INTO `my_attachmentindex` VALUES ('26','5','5','');
INSERT INTO `my_attachmentindex` VALUES ('25','5','5','');
INSERT INTO `my_attachmentindex` VALUES ('24','5','5','');
INSERT INTO `my_attachmentindex` VALUES ('23','5','5','');
INSERT INTO `my_attachmentindex` VALUES ('22','5','5','');
INSERT INTO `my_attachmentindex` VALUES ('21','5','5','');
INSERT INTO `my_attachmentindex` VALUES ('32','6','5','');
INSERT INTO `my_attachmentindex` VALUES ('31','6','5','');
INSERT INTO `my_attachmentindex` VALUES ('30','6','5','');
INSERT INTO `my_attachmentindex` VALUES ('29','6','5','');
INSERT INTO `my_attachmentindex` VALUES ('28','6','5','');
INSERT INTO `my_attachmentindex` VALUES ('27','6','5','');
INSERT INTO `my_attachmentindex` VALUES ('53','9','5','');
INSERT INTO `my_attachmentindex` VALUES ('52','8','5','');
INSERT INTO `my_attachmentindex` VALUES ('36','7','5','');
INSERT INTO `my_attachmentindex` VALUES ('62','10','5','');
INSERT INTO `my_attachmentindex` VALUES ('64','11','5','');
INSERT INTO `my_attachmentindex` VALUES ('85','12','5','');
INSERT INTO `my_attachmentindex` VALUES ('73','13','5','');
INSERT INTO `my_attachmentindex` VALUES ('74','14','5','');
INSERT INTO `my_attachmentindex` VALUES ('76','15','5','');
INSERT INTO `my_attachmentindex` VALUES ('79','3','0','abc');
INSERT INTO `my_attachmentindex` VALUES ('80','4','0','abc');
INSERT INTO `my_attachmentindex` VALUES ('82','16','5','');
INSERT INTO `my_attachmentindex` VALUES ('84','5','0','abc');
INSERT INTO `my_attachmentindex` VALUES ('91','17','5','');
INSERT INTO `my_attachmentindex` VALUES ('95','18','5','');
INSERT INTO `my_attachmentindex` VALUES ('96','19','5','');
INSERT INTO `my_attachmentindex` VALUES ('97','20','5','');
INSERT INTO `my_attachmentindex` VALUES ('101','21','5','');
INSERT INTO `my_attachmentindex` VALUES ('107','23','5','');
INSERT INTO `my_attachmentindex` VALUES ('103','22','5','');
INSERT INTO `my_attachmentindex` VALUES ('126','27','5','');
INSERT INTO `my_attachmentindex` VALUES ('121','26','5','');
INSERT INTO `my_attachmentindex` VALUES ('129','28','5','');
INSERT INTO `my_attachmentindex` VALUES ('134','29','5','');
INSERT INTO `my_attachmentindex` VALUES ('139','30','5','');
INSERT INTO `my_attachmentindex` VALUES ('141','31','5','');
INSERT INTO `my_attachmentindex` VALUES ('144','32','5','');
INSERT INTO `my_attachmentindex` VALUES ('146','33','5','');
INSERT INTO `my_attachmentindex` VALUES ('154','34','5','');
INSERT INTO `my_attachmentindex` VALUES ('159','35','5','');
INSERT INTO `my_attachmentindex` VALUES ('163','36','5','');
INSERT INTO `my_attachmentindex` VALUES ('164','37','5','');
INSERT INTO `my_attachmentindex` VALUES ('172','38','5','');
INSERT INTO `my_attachmentindex` VALUES ('176','39','5','');
INSERT INTO `my_attachmentindex` VALUES ('182','40','5','');
INSERT INTO `my_attachmentindex` VALUES ('186','41','5','');
INSERT INTO `my_attachmentindex` VALUES ('187','42','5','');
INSERT INTO `my_attachmentindex` VALUES ('190','43','5','');
INSERT INTO `my_attachmentindex` VALUES ('191','44','5','');
INSERT INTO `my_attachmentindex` VALUES ('203','45','5','');
INSERT INTO `my_attachmentindex` VALUES ('199','46','5','');
INSERT INTO `my_attachmentindex` VALUES ('202','47','5','');
INSERT INTO `my_attachmentindex` VALUES ('204','48','5','');
INSERT INTO `my_attachmentindex` VALUES ('207','531','1','');
INSERT INTO `my_attachmentindex` VALUES ('208','531','1','');
INSERT INTO `my_attachmentindex` VALUES ('209','531','1','');
INSERT INTO `my_attachmentindex` VALUES ('210','531','1','');
INSERT INTO `my_attachmentindex` VALUES ('211','532','1','');
INSERT INTO `my_attachmentindex` VALUES ('215','533','1','');
INSERT INTO `my_attachmentindex` VALUES ('214','533','1','');
INSERT INTO `my_attachmentindex` VALUES ('213','533','1','');
INSERT INTO `my_attachmentindex` VALUES ('212','533','1','');


# 转存表中的数据：my_block 
INSERT INTO `my_block` VALUES ('1','Introduction','','','3');


# 转存表中的数据：my_category 
INSERT INTO `my_category` VALUES ('1','单页','page','','0','2','0','','单页','','','List_help.html','Show_article.html','','0','8','');
INSERT INTO `my_category` VALUES ('28','仿站','fangzhan','','0','2','0','仿站_扒模板','仿站，扒模板','当您提交仿站申请后我们会安排人员为您精心仿制，根据难易程度，一般会在7个工作日内完成仿制，完成后会第一时间通知您！若缺少页面或有bug等问题，请直接联系技术人员处理。','','List_page.html','Show_article.html','<p>1、人工精心仿制。7个工作日内完成仿制，完成后会第一时间通知您！</p><p>2、文件归类。图片放在images文件夹，样式css，特效js，字体fonts</p><p>3、个人中心、需要登录等页面也可仿制</p><p>4、html完美格式化。</p><p>5、0bug。软件采集后，检测并修改bug。</p><p>6、售后服务。若缺少页面或有bug等问题，请直接联系技术人员处理。</p><p><br/></p>','1','4','');
INSERT INTO `my_category` VALUES ('16','网站模板','muban','','0','5','0','织梦_destoon_wordpress_discuz_ecshop_phpcms模板下载','织梦dedecms,destoon,wordpress,discuz,ecshop,phpcms','本栏目提供织梦dedecms模板,destoon模板,wordpress主题,discuz模板,ecshop模板,phpcms模板的下载服务。','','List_soft.html','Show_soft.html','','1','1','1,35,33');
INSERT INTO `my_category` VALUES ('17','dedecms','dedecms','','16','5','0','织梦模板_dedecms模板下载','织梦模板下载,dedecms模板下载','本栏目提供织梦dedecms模板下载服务。','','List_soft.html','Show_soft.html','','1','1','1,35,33');
INSERT INTO `my_category` VALUES ('18','discuz','discuz','','16','5','0','discuz模板_DZ模板下载','discuz模板下载,DZ模板下载','本栏目提供discuz模板、DZ模板下载服务','','List_soft.html','Show_soft.html','','1','4','1,35,33');
INSERT INTO `my_category` VALUES ('23','整站源码','yuanma','','0','5','0','PHP源码_thinkphp源码_JAVA源码_ASP源码下载','PHP源码,thinkphp源码,JAVA源码,ASP源码','本栏目提供PHP源码,thinkphp源码,JAVA源码,ASP源码的下载服务','','List_soft.html','Show_soft.html','','1','2','35,36');
INSERT INTO `my_category` VALUES ('8','图集','photos','','0','4','0','公司相册','','','','List_picture.html','Show_picture.html','','0','99','');
INSERT INTO `my_category` VALUES ('9','在线留言','@guestbook/index','','0','0','1','','','','','List_article.html','Show_article.html','','0','99','');
INSERT INTO `my_category` VALUES ('10','联系我们','contact','','1','2','0','联系我们','','','','List_help.html','Show_article.html','','1','2','');
INSERT INTO `my_category` VALUES ('11','精彩专题','@special/index','','0','0','1','','','','','List_article.html','Show_article.html','','0','99','');
INSERT INTO `my_category` VALUES ('29','技术问答','wenda','','0','7','0','技术问答','技术问答','技术问答','','List_topic.html','Show_topic.html','<p style=\"text-indent: 2em; line-height: 2em;\">技术问答模块正在研发中，尽请期待……</p>','1','5','');
INSERT INTO `my_category` VALUES ('40','求助交流','qiuzhu','','29','7','0','求助交流','求助交流','求助交流','','List_topic.html','Show_topic.html','','1','1','');
INSERT INTO `my_category` VALUES ('14','关于我们','about','','1','2','0','','','','','List_help.html','Show_article.html','','1','1','');
INSERT INTO `my_category` VALUES ('15','隐私申明','privacy','','1','2','0','','','','','List_help.html','Show_article.html','','1','3','');
INSERT INTO `my_category` VALUES ('19','ecshop','ecshop','','16','5','0','ecshop商城模板下载','ecshop模板,ecshop商城模板下载','本栏目提供ecshop商城模板下载服务。','','List_soft.html','Show_soft.html','','1','5','1,35,33');
INSERT INTO `my_category` VALUES ('20','wordpress','wordpress','','16','5','0','wordpress主题_wordpress模板下载','wordpress主题下载,wordpress模板下载','本栏目提供wordpress主题、wordpress模板下载服务。','','List_soft.html','Show_soft.html','','1','3','1,35,33');
INSERT INTO `my_category` VALUES ('21','phpcms','phpcms','','16','5','0','phpcms模板下载','phpcms模板下载','本栏目提供phpcms模板下载服务。','','List_soft.html','Show_soft.html','','1','6','1,35,33');
INSERT INTO `my_category` VALUES ('22','destoon','destoon','','16','5','0','destoon模板_B2B模板下载','destoon模板下载,B2B模板下载','本栏目提供destoon B2B模板下载服务。','','List_soft.html','Show_soft.html','','1','2','1,35,33');
INSERT INTO `my_category` VALUES ('24','ThinkPHP','thinkphp','','23','5','0','thinkphp源码下载','thinkphp源码下载','本栏目提供thinkphp源码下载服务。','','List_soft.html','Show_soft.html','','1','1','35,36');
INSERT INTO `my_category` VALUES ('25','PHP','php','','23','5','0','PHP源码下载','PHP源码下载','本栏目提供PHP源码下载服务。','','List_soft.html','Show_soft.html','','1','1','35,36');
INSERT INTO `my_category` VALUES ('26','JAVA','java','','23','5','0','JAVA源码_JSP源码下载','JAVA源码下载,JSP源码下载','本栏目提供JAVA源码、JSP源码下载服务。','','List_soft.html','Show_soft.html','','1','1','35,36');
INSERT INTO `my_category` VALUES ('27','ASP','asp','','23','5','0','ASP源码_ASP.NET源码下载','ASP源码,ASP.NET源码下载','本栏目提供ASP源码和ASP.NET源码下载服务。','','List_soft.html','Show_soft.html','','1','1','35,36');
INSERT INTO `my_category` VALUES ('30','静态网页','jingtai','','16','5','0','静态PC手机网页模板','静态PC网页模板,静态手机网页模板','本栏目提供静态PC网页模板和静态手机网页模板的下载服务','','List_soft.html','Show_soft.html','','1','7','1,35,33');
INSERT INTO `my_category` VALUES ('31','教程下载','jiaocheng','','0','5','0','PHP_JAVA_C语言_ASP_JS_SEO_flash_DIVCSS教程下载','PHP教程,JAVA教程,C语言教程,ASP教程,JS教程,SEO教程,flash教程,DIVCSS','本栏目提供PHP教程、JAVA教程、C/C++语言教程、ASP/ASP.NET教程、javascript教程、SEO教程、flash教程、DIVCSS教程、Dreamweaver教程等各种计算机教程的下载。','','List_soft.html','Show_soft.html','','1','3','37');
INSERT INTO `my_category` VALUES ('32','PHP教程','phpjiaocheng','','31','5','0','PHP教程下载','PHP教程下载','本栏目提供PHP教程下载服务。','','List_soft.html','Show_soft.html','','1','1','37');
INSERT INTO `my_category` VALUES ('33','JAVA教程','javajiaocheng','','31','5','0','JAVA教程下载','JAVA教程下载','本栏目提供JAVA教程下载服务。','','List_soft.html','Show_soft.html','','1','2','37');
INSERT INTO `my_category` VALUES ('34','C/C++教程','CPP','','31','5','0','C/C++教程下载','C语言教程,C++教程','本栏目提供C语言教程,C++教程下载服务。','','List_soft.html','Show_soft.html','','1','4','37');
INSERT INTO `my_category` VALUES ('35','ASP/ASP.NET','aspjiaocheng','','31','5','0','ASP/ASP.NET教程下载','ASP教程,ASP.NET教程','本栏目提供ASP教程和ASP.NET教程下载服务。','','List_soft.html','Show_soft.html','','1','7','37');
INSERT INTO `my_category` VALUES ('36','JS教程','javascript','','31','5','0','JS教程_javascript教程下载','JS教程,javascript教程','本栏目提供JS教程，javascript教程下载服务。','','List_soft.html','Show_soft.html','','1','3','37');
INSERT INTO `my_category` VALUES ('37','SEO教程','seo','','31','5','0','seo教程下载','seo教程下载','本栏目提供seo教程下载服务。','','List_soft.html','Show_soft.html','','1','5','37');
INSERT INTO `my_category` VALUES ('38','FLASH教程','flash','','31','5','0','falsh教程下载','falsh教程下载','本栏目提供falsh教程下载服务。','','List_soft.html','Show_soft.html','','1','8','37');
INSERT INTO `my_category` VALUES ('39','DIVCSS教程','divcss','','31','5','0','div+css教程下载','div+css教程下载','本栏目提供div+css教程下载服务。','','List_soft.html','Show_soft.html','','1','6','37');
INSERT INTO `my_category` VALUES ('41','技术分享','fenxiang','','29','7','0','技术分享','技术分享','技术分享','','List_topic.html','Show_topic.html','','1','1','');
INSERT INTO `my_category` VALUES ('42','新闻资讯','news','','0','1','0','新闻资讯','新闻资讯','新闻资讯','','List_article.html','Show_article.html','','1','6','');
INSERT INTO `my_category` VALUES ('43','行业新闻','hyxw','','42','1','0','行业新闻','行业新闻','行业新闻','','List_article.html','Show_article.html','','1','2','');
INSERT INTO `my_category` VALUES ('44','技术资讯','jishu','','42','1','0','技术资讯','技术资讯','技术资讯','','List_article.html','Show_article.html','','1','1','');
INSERT INTO `my_category` VALUES ('45','社会新闻','shxw','','42','1','0','社会新闻','社会新闻','社会新闻','','List_article.html','Show_article.html','','1','3','');


# 转存表中的数据：my_category_access 


# 转存表中的数据：my_collect 
INSERT INTO `my_collect` VALUES ('4','13','明星图','http://www.mingxingtu.com','http://www.mingxingtu.com/tupian/juzhao/','/<div class=\\\"box\\\">([\\s\\S]+)<\\/div>/U','/<li.+href=\"(.*)\"/isU','/<div class=\\\"titlename\\\"><h1>(.+?)<\\/h1>/U','','/<meta.*?name=(\"|＼\')description(\"|＼\').*?content=(\"|＼\')(.*?)(\"|＼\')/i','_','/<div class=\\\"img_box\\\">([\\s\\S]+)<\\/div>/U','748','/\\/<font\\scolor=red>(.+?)<\\/font>/','1478603645','xiezhen_','.html','1','1','0');
INSERT INTO `my_collect` VALUES ('5','1','天极图片','http://pic.yesky.com','http://pic.yesky.com/c/6_2884.shtml','/class=\\\"lb_box\\\"([\\s\\S]+)class=\\\"flym\\\"/U','/<dt.+href=\"(.*)\"/isU','/<h2>(.+?)<\\/h2>/U','','/<meta.*?name=(\"|＼\')description(\"|＼\').*?content=(\"|＼\')(.*?)(\"|＼\')/i','_','/<div class=\\\"l_effect_img_mid\\\">([\\s\\S]+)<\\/div>/U','0','','1478583612','_','.shtml','1','1','0');
INSERT INTO `my_collect` VALUES ('6','1','MM131美女图片网','http://www.mm131.com','http://www.mm131.com/mingxing/','/<dl class=\\\"list-left public-box\\\">([\\s\\S]+)<dd class=\\\"page\\\">/U','/<dd.+href=\"(.*)\"/isU','/<h5>(.+?)<\\/h5>/U','/<meta.+name=\\\"keywords\\\".+content=\"([\\s\\S]+)\"/U','/<h5>(.+?)<\\/h5>/U','_','/<div class=\\\"content-pic\\\">([\\s\\S]+)<\\/div>/U','0','','1479095164','list_5_','.html','8','8','0');
INSERT INTO `my_collect` VALUES ('7','11','憨憨动漫','http://tu.hanhande.com','http://tu.hanhande.com/bz/','/<ul class=\\\"picList\\\">([\\s\\S]+)<\\/ul>/U','/<li.+<p>.+href=\"(.*)\"/isU','/<h2>(.+?)<\\/h2>/U','/<meta.+name=\\\"keywords\\\".+content=\"([\\s\\S]+)\"/U','/<meta.+name=\\\"description\\\".+content=\"([\\s\\S]+)\"/U','_','/<div class=\\\"showImg\\\">([\\s\\S]+)<a id=\\\"preArrow\\\"/U','0','','1479095201','bz_','.shtml','1','1','0');
INSERT INTO `my_collect` VALUES ('8','2','居然网','http://www.zbjuran.com','http://www.zbjuran.com/mei/mingxing/','/class=\\\"pic-list mb20 list\\\"([\\s\\S]+)class=\\\"pages\\\"/U','/<div.+class=\"name\"><a.+href=\"(.+)\"/isU','/<h2>(.+?)<\\/h2>/U','','','_','/<div class=\\\"picbox\\\".+>([\\s\\S]+)<\\/div>/U','0','','1479221158','list_16_','.html','1','1','0');
INSERT INTO `my_collect` VALUES ('9','2','吉他吧','http://www.jitaba.cn','http://www.jitaba.cn/txt/','/<div class=\\\"listl list2\\\">([\\s\\S]+)<div class=\\\"page\\\">/U','/<li>.+<h3>.+href=\"(.*)\".+<\\/h3>/isU','/<h1>(.+?)<\\/h1>/U','/<meta.+name=\\\"keywords\\\".+content=\"([\\s\\S]+)\"/U','/<div class=\\\"tabbox1\\\".+id=\\\"tabzone\\\">([\\s\\S]+)<\\/div><\\/div>/iU','_','','0','','1480602135','list_64_','.html','26','28','0');


# 转存表中的数据：my_comment 
INSERT INTO `my_comment` VALUES ('1','2','5','大气的婚庆公司婚纱摄影网站模板html整站免费下载','游客','','','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1474376762','很好很棒','0','0','0');
INSERT INTO `my_comment` VALUES ('2','2','5','大气的婚庆公司婚纱摄影网站模板html整站免费下载','游客','','','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1474378175','感人！！！\r\n','0','0','0');
INSERT INTO `my_comment` VALUES ('3','9','5','Discuz!X3.2精仿N5门户163K新版地方门户+分类信息+商家点评+楼盘展示模版分享','user1','','416148489@qq.com','183.225.96.25','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1475676248','很感动！','0','0','1');
INSERT INTO `my_comment` VALUES ('4','8','5','discuz【亮剑】拼车系统完整商业版2.2.2价值488元免费分享','93990392','','93990392@qq.com','182.131.82.117','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0','1476122039','这个怎么使用的','0','0','12');
INSERT INTO `my_comment` VALUES ('5','20','5','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','游客','','','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1482893946','真棒！！！','0','0','0');
INSERT INTO `my_comment` VALUES ('6','20','5','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','张三','','416148489@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1488807672','福建卡洛斯减肥的','0','5','1');
INSERT INTO `my_comment` VALUES ('7','20','5','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','张三','','416148489@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1488811436','繁华的撒娇开发哈斯','0','0','1');


# 转存表中的数据：my_config 
INSERT INTO `my_config` VALUES ('1','CFG_WEBNAME','网站名称','','','2','1','素材火','1');
INSERT INTO `my_config` VALUES ('2','CFG_WEBURL','网站域名','','','2','1','http://localhost:88','2');
INSERT INTO `my_config` VALUES ('3','CFG_WEBTITLE','网站标题','站点首页title(SEO)的设置','','2','1','网站模板_网站源码_PHP教程_PHP源码_thinkphp源码','4');
INSERT INTO `my_config` VALUES ('4','CFG_KEYWORDS','站点关键词','','','2','1','网站模板,网站源码,PHP教程,PHP源码,thinkphp源码','5');
INSERT INTO `my_config` VALUES ('5','CFG_DESCRIPTION','站点描述','','','3','1','素材火下载网提供精品站长资源：包括各类主流网站模板（织梦dedecms、destoon、wordpress、discuz、ecshop、phpcms等模板）等和源码（thinkphp源码、PHP源码、JAVA源码、ASP源码、商城源码）等资源的免费下载服务和仿站服务。','6');
INSERT INTO `my_config` VALUES ('6','CFG_THEMESTYLE','PC模板风格','','select','2','1','sucai','8');
INSERT INTO `my_config` VALUES ('7','CFG_COOKIE_ENCODE','cookie加密码','','','2','1','m5msJbKhM','15');
INSERT INTO `my_config` VALUES ('8','CFG_POWERBY','网站版权信息','','','3','1','Copyright©2014-2017 All Rights Reserved.','11');
INSERT INTO `my_config` VALUES ('9','CFG_STATS','CNZZ统计','','','3','1','','12');
INSERT INTO `my_config` VALUES ('45','CFG_EMAIL_ACTIVE','是否开启邮箱激活','','','4','6','1','0');
INSERT INTO `my_config` VALUES ('10','CFG_BEIAN','网站备案号','','','2','1','滇ICP备14001033号-2','14');
INSERT INTO `my_config` VALUES ('11','CFG_ADDRESS','联系地址','','','2','1','昆明市五华区','8');
INSERT INTO `my_config` VALUES ('12','CFG_PHONE','联系电话','','','2','1','0871-8888888','9');
INSERT INTO `my_config` VALUES ('13','CFG_WEBSITE_CLOSE','关闭网站','','','4','2','0','0');
INSERT INTO `my_config` VALUES ('14','CFG_WEBSITE_CLOSE_INFO','关站提示','','','3','2','站点维护中，请稍等一会...','0');
INSERT INTO `my_config` VALUES ('15','CFG_MOBILE_AUTO','手机版开启','','','4','1','1','16');
INSERT INTO `my_config` VALUES ('16','CFG_EMAIL_FROM','发件邮箱地址','','','2','3','416148489@qq.com','0');
INSERT INTO `my_config` VALUES ('17','CFG_EMAIL_FROM_NAME','发件人名称','','','2','3','站名','0');
INSERT INTO `my_config` VALUES ('18','CFG_EMAIL_HOST','STMP服务器','','','2','3','smtp.exmail.qq.com','0');
INSERT INTO `my_config` VALUES ('19','CFG_EMAIL_PORT','服务器端口','','','1','3','25','0');
INSERT INTO `my_config` VALUES ('20','CFG_EMAIL_LOGINNAME','邮箱帐号','','','2','3','416148489@qq.com','0');
INSERT INTO `my_config` VALUES ('21','CFG_EMAIL_PASSWORD','邮箱密码','','','2','3','','0');
INSERT INTO `my_config` VALUES ('22','CFG_BADWORD','禁用词语','','','3','2','艾滋病|中国共产党|111111111','0');
INSERT INTO `my_config` VALUES ('23','CFG_FEEDBACK_GUEST','允许匿名评论','','','4','2','1','0');
INSERT INTO `my_config` VALUES ('24','CFG_MEMBER_OPEN','开启会员功能','','','4','5','1','1');
INSERT INTO `my_config` VALUES ('25','CFG_MEMBER_VERIFYEMAIL',' 开启邮件验证','','','4','5','1','2');
INSERT INTO `my_config` VALUES ('26','CFG_MEMBER_NOTALLOW','禁止使用的昵称','','','3','5','www,bbs,ftp,mail,user,users,admin,administrator','8');
INSERT INTO `my_config` VALUES ('27','CFG_UPLOAD_MAXSIZE','允许上传大小','KB','','1','4','20480','0');
INSERT INTO `my_config` VALUES ('28','CFG_IMGTHUMB_SIZE','缩略图组尺寸','','','2','4','300X300','0');
INSERT INTO `my_config` VALUES ('29','CFG_IMGTHUMB_TYPE','缩略图生成方式','固定大小截取 ,原图等比例缩略','radio\r\n0|原图等比例缩略\r\n1|固定大小截取','4','4','0','0');
INSERT INTO `my_config` VALUES ('30','CFG_IMGTHUMB_WIDTH','固宽缩略图组长度','固定宽度等比缩略,如60,50','','2','4','600','0');
INSERT INTO `my_config` VALUES ('31','CFG_UPLOAD_ROOTPATH','上传根目录','','','2','4','./uploads/','0');
INSERT INTO `my_config` VALUES ('32','CFG_UPLOAD_FILE_EXT','允许附件类型','','','3','4','jpg,gif,png,jpeg,txt,doc,docx,xls,ppt,zip,rar,mp3','0');
INSERT INTO `my_config` VALUES ('33','CFG_UPLOAD_IMG_EXT','允许图片类型','带缩略图的图片','','2','4','jpg,gif,png,jpeg','0');
INSERT INTO `my_config` VALUES ('34','CFG_VERIFY_REGISTER','开启注册验证码','','','4','2','1','0');
INSERT INTO `my_config` VALUES ('35','CFG_VERIFY_LOGIN','开启登录验证码','','','4','2','0','0');
INSERT INTO `my_config` VALUES ('36','CFG_VERIFY_GUESTBOOK','开启留言板验证码','','','4','2','1','0');
INSERT INTO `my_config` VALUES ('37','CFG_VERIFY_REVIEW','开启评论验证码','','','4','2','0','0');
INSERT INTO `my_config` VALUES ('38','CFG_SQL_FILESIZE','sql文件大小','备份数据库，值不可太大，否则会导致内存溢出备份、恢复失败，合理大小在512K~10M间，建议3M一卷。单位字节,5M=5*1024*1024=5242880','','1','4','5242880','0');
INSERT INTO `my_config` VALUES ('39','CFG_DOWNLOAD_HIDE','隐藏下载地址','','','4','4','0','0');
INSERT INTO `my_config` VALUES ('40','CFG_MOBILE_THEMESTYLE','手机模板风格','','select','2','1','default','10');
INSERT INTO `my_config` VALUES ('41','CFG_DEFAULT_TPL','PC默认模版','','select','2','1','#download@2016','7');
INSERT INTO `my_config` VALUES ('42','CFG_DEFAULT_MOBILE_TPL','手机默认模板','','select','2','1','default','9');
INSERT INTO `my_config` VALUES ('43','CFG_BAIDUSTATS','百度统计','','','3','1','','13');
INSERT INTO `my_config` VALUES ('44','CFG_MWEBURL','手机站域名','','','2','1','http://localhost:88/Mobile','3');
INSERT INTO `my_config` VALUES ('46','CFG_EMAIL_TITLE','邮件标题','','','2','6','','0');
INSERT INTO `my_config` VALUES ('47','CFG_EMAIL_TPL','邮件内容','','','3','6','','0');
INSERT INTO `my_config` VALUES ('48','WESYS_NAME','公众号名称','','','2','7','','0');
INSERT INTO `my_config` VALUES ('49','WESYS_ID','公众号原始id','','','2','7','','0');
INSERT INTO `my_config` VALUES ('50','WESYS_NUMBER','微信号','','','2','7','','0');
INSERT INTO `my_config` VALUES ('51','WESYS_APPID','AppID（公众号）','','','2','7','','0');
INSERT INTO `my_config` VALUES ('52','WESYS_APPSECRET','AppSecret','','','2','7','','0');
INSERT INTO `my_config` VALUES ('53','WESYS_TYPE','微信号类型','','select\r\n0|请选择公众号类型\r\n1|普通订阅号\r\n2|普通服务号\r\n3|认证订阅号\r\n4|认证服务号','2','7','0','0');
INSERT INTO `my_config` VALUES ('54','QQ_APPID','QQ APPID','','','2','8','203564','1');
INSERT INTO `my_config` VALUES ('55','QQ_APPKEY','QQ APP KEY','<a href=\"http://connect.qq.com/\" target=\"_blank\">点击此处</a>获取QQ互联APPID','','2','8','bab1f3acc0c67b69a1f470ac5e8dc36a','2');
INSERT INTO `my_config` VALUES ('56','SINA_APPID','新浪微博APPID','','','2','8','602735229','4');
INSERT INTO `my_config` VALUES ('57','SINA_APPKEY','新浪微博 APP KEY','<a href=\"http://open.weibo.com/\" target=\"_blank\">点击此处</a>获取新浪微博互联APP','','2','8','66781cbeab9fdb9b014a387ab6e943fe','5');
INSERT INTO `my_config` VALUES ('58','STORAGE_OPEN','是否开启云存储','','radio\r\n0|关闭\r\n1|开启','2','9','0','0');
INSERT INTO `my_config` VALUES ('59','ACCESSKEY','AccessKey','','','2','9','','0');
INSERT INTO `my_config` VALUES ('60','SECRETKEY','SecretKey','','','2','9','','0');
INSERT INTO `my_config` VALUES ('61','BUCKET','存储空间(bucket)','','','2','9','','0');
INSERT INTO `my_config` VALUES ('62','DOMAIN','访问域名(domain)','','','2','9','','0');
INSERT INTO `my_config` VALUES ('63','QQ_CALLBACK','QQ回调地址','<hr>','','2','8','http://localhost:90/Oauth-login-type-qq.html','3');
INSERT INTO `my_config` VALUES ('64','SINA_CALLBACK','微博回调地址','<hr>','','2','8','http://localhost:90/Oauth-login-type-sina.html','6');
INSERT INTO `my_config` VALUES ('65','LOGIN_SCORE','登录增加积分','','','1','5','2','4');
INSERT INTO `my_config` VALUES ('66','PUBLISH_SCORE','发帖增加积分','','','1','5','2','5');
INSERT INTO `my_config` VALUES ('67','REPLY_SCORE','回复增加积分','','','1','5','1','6');
INSERT INTO `my_config` VALUES ('68','REGISTER_SCORE','注册增加积分','','','1','5','2','3');
INSERT INTO `my_config` VALUES ('69','SIGN_SCORE','签到增加积分','','','1','5','1','7');
INSERT INTO `my_config` VALUES ('70','ALIPAY_EMAIL','支付宝收款帐号','','','2','10','xuanhanfei@126.com','0');
INSERT INTO `my_config` VALUES ('71','ALIPAY_KEY','支付宝密钥','','','2','10','ggo084pb84gl43qnw82a39n9b7r1jq2m','0');
INSERT INTO `my_config` VALUES ('72','ALIPAY_PARTNER','支付宝合作者ID','支付宝申请地址：<a target=\"_blank\" href=\"https://www.alipay.com/\">立即申请</a>','','2','10','2088901006538525','0');
INSERT INTO `my_config` VALUES ('76','WECHAT_APPID','微信支付APPID','','','2','10','wx426b3015555a46be','0');
INSERT INTO `my_config` VALUES ('77','WECHAT_MCHID','微信支付MCHID','','','2','10','1900009851','0');
INSERT INTO `my_config` VALUES ('78','WECHAT_KEY','微信支付key','','','2','10','8934e7d15453e97507ef794cf7b0519d','0');
INSERT INTO `my_config` VALUES ('79','WECHAT_APPSECRET','微信支付APPSECRET','微信支付申请地址：<a target=\"_blank\" href=\"https://pay.weixin.qq.com/\">立即申请</a>','','2','10','7813490da6f1265e4901ffb80afaa36f','0');
INSERT INTO `my_config` VALUES ('80','POINTS','充值与积分倍数','填写充值与积分倍数比例，以1元为准，如填10，那么就是1元=10积分。','','1','5','10','9');
INSERT INTO `my_config` VALUES ('81','JINBI','充值与金币倍数','填写充值与金币倍数比例，以1元为准，如填10，那么就是1元=10金币。','','1','5','2','10');


# 转存表中的数据：my_copyfrom 


# 转存表中的数据：my_download 
INSERT INTO `my_download` VALUES ('1','1','19','18','1488374405','0','2','0','0');
INSERT INTO `my_download` VALUES ('2','1','19','18','1488374615','0','2','0','0');
INSERT INTO `my_download` VALUES ('3','1','20','18','1488374657','0','10','0','0');
INSERT INTO `my_download` VALUES ('4','1','20','18','1488374673','0','10','0','0');
INSERT INTO `my_download` VALUES ('5','1','47','24','1488374910','0','0','0','0');


# 转存表中的数据：my_forum 
INSERT INTO `my_forum` VALUES ('1','吉他弹唱时气息训练方法和技巧','','#f00','','管理员','','/uploads/img1/20170118/587f6ea0e0945.jpg!300X300.jpg','<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">大家都知道，气息是歌唱之本，没有好的气息基础，歌是不可能唱好的，有些同学唱到半句的时候没有声了；有的明知道唱的音不太准，可是嗓子就是不听话；有的唱起来忽强忽弱，气流不匀；有的唱到高音时力度不够等等，这些现象都与气息有关系，看气息不足和不会控制气息是两个突出的问题。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">那么，怎样解决这两个问题呢？首先应该有一个健康的身体，这是歌唱的本钱。如果说有人认为，只要闭上眼睛听一个人说话，就可以知道他的身体状况的话，那么我说如果闭上睛眼听一个人歌唱，就更可以了解他的身体状况了。但光有一个健康的身体还不够，还要去练习，针对以上两个气息上的问题，练习方法也分两种。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">解决唱歌气息不足的主要办法是进行跑步，清晨或上午最好，当然下午和晚上也可以，每天最好进行一次中长跑，一千米到三千米都可以，要根据自己的情况来定。跑步可以增大肺呼量，肺呼量增加了，气息也就深了。经常坚持跑步，气息无疑会得到很大的改善。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">另外，没事的时候，经常做一做深呼吸，然后慢慢将气吐出，也能增大肺呼量。解决气息控制不稳的主要办法是多唱、多练，因为只有多练唱，才能取得气息控制的经验。练多了、唱久了，气息控制也会逐渐稳定下来。这里需要提到的一点是及时的换气。有些同学换气少，当然气不够用，也就不可能很好地控制气息，一般拿来一首歌，应事先把换气的地方定下来，用笔标好，以免练习时忘掉。这一点，经常被大家忽略。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp;</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">除了在气口的地方换气以外，还有一个办法，叫做“偷气”，就是在没有气口的很长的句子中，找出一个恰当的地方迅速地吸“半口”﹙气来不及吸一口气﹚这种吸气如果运用得好，往往没有痕迹，所以称做“偷气”。这一技巧，大家不妨练一练。</span></p>','大家都知道，气息是歌唱之本，没有好的气息基础，歌是不可能唱好的，有些同学唱到半句的时候没有声了；有的明知道唱的音不太准，可是嗓子就是不听话；有的唱起来忽强忽弱，气流不匀；有的唱到高音时力度不够等等，这些现象都与气息有关系，看气息不足和不会控','1484723606','1484882527','29','11','1','17','','1','0','1','0','0','','1');
INSERT INTO `my_forum` VALUES ('2','怎样唱出歌曲的韵味','','','','管理员','','/uploads/img1/20170118/587f6e971495a.jpg!300X300.jpg','<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">有了科学的发声方法，是否就意味着能唱好流行歌曲呢？答案是不一定！流行歌曲十分讲究“情”，“字”，“声”的配合。“声”当然指的是好的声音；指的是正确的吐词，规范的咬字；“情”就是要唱出感情—悲伤或喜悦，失意或甜蜜，都要从你的歌声中得以表达。这就是人们平常说的“把味道唱出来”也是现在要跟你一块儿探讨的“歌曲的韵味”。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">⒈颤音</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp;颤音是利用气息与喉结的配合，使声音产生波动感，起伏感。这是抒情歌曲中最常用的技巧之一。颤音有很多种类。如周华健的颤音幅度适中，不大不小；齐秦爱用小颤；邓丽君，张学友则以大颤见长；而日本歌曲的特点是“先直后颤”，即后唱一段直音，再开始颤，幅度有小到大，频率有慢到快，这需要功夫。很多朋友不会这个技巧，不要泄气，这完全可以练出来的。关键是气息与喉头要配合好，千万不要只用喉头，发出一种类似羊叫的小抖音</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">⒉气声 &nbsp;</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">在发生时，如果气先与声出，气多声少，就会发出气声。它使歌声更柔媚，更动人心魄。邓丽君的《在水一方》第一段，林忆莲的《爱上一个不回家的人》第一段都是典型的气声唱法。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">3哭腔</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">哭腔是目前通俗歌曲演唱中最流行的技巧之一，它是在喉间和用猛然加大气息而产生的爆发力，发出一种类似痛苦的声音。张学友，周华健是哭腔的代表人物。哭腔用的好可以增加歌曲的感染力，但也不可用的太滥。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">⒋挑音</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">挑音是一位优秀歌手必须掌握的但往往又是最容易被忽列的小技巧。它是在字尾声音向下滑在忽然往上一挑而发出的。周华健再歌唱时挑音用的很讲究，很到位。有的歌手喜欢有大挑音，如叶倩文，她演唱的《真心真意过一生》，《明月心》等歌曲，几乎每句歌词的结尾都有一个幅度很大的挑音。</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">⒌噎音 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;</span><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Tahoma, Arial, sans-serif; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">噎音是一种在喉间发出的类似哽咽的声音，港台歌手唱噎音最有代表的是王杰。王杰之所以给人一种悲凉沧桑之感就是因为他的歌声中“噎音”，“哭腔”特别多。</span></p>','有了科学的发声方法，是否就意味着能唱好流行歌曲呢？答案是不一定！流行歌曲十分讲究“情”，“字”，“声”的配合。“声”当然指的是好的声音；指的是正确的吐词，规范的咬字；“情”就是要唱出感情—悲伤或喜悦，失意或甜蜜，都要从你的歌声中得以表达。这','1484723656','1484746393','175','11','1','17','','1','0','1','0','0','','1');
INSERT INTO `my_forum` VALUES ('3','街坊地块撒酒疯打飞机阿飞健康','','','','user1','','','<p>第三方监控打算将发放技术大幅净亏损大幅加空姐饿哦及开发</p>','第三方监控打算将发放技术大幅净亏损大幅加空姐饿哦及开发','1485420416','1485421533','102','12','1','0','','1','23','0','0','0','吉他谱','1');
INSERT INTO `my_forum` VALUES ('4','警方收到平均分克服艰苦撒飞机','','','','user1','','','<p>飞机卡死放假啊撒飞机开</p>','飞机卡死放假啊撒飞机开','1485706978','1485706978','0','17','1','0','','2','23','0','0','0','','1');
INSERT INTO `my_forum` VALUES ('5','降幅扩大解放了大三房','','','','user2','','','<p>机卡死垃圾发电示范</p>','机卡死垃圾发电示范','1486645685','1486645685','13','12','1','0','','1','24','0','0','0','','1');


# 转存表中的数据：my_forum_reply 
INSERT INTO `my_forum_reply` VALUES ('37','1','9','11','http://localhost:90/minyao-1.html','吉他弹唱时气息训练方法和技巧','云木马','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1487397808','<p>有道理！！！</p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('36','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味','hxch1006','504872033@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1486267582','<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p>','0','0','25','0','0');
INSERT INTO `my_forum_reply` VALUES ('19','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485325213','&lt;p&gt;付款啦是减肥的房间&lt;/p&gt;','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('20','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485352334','<p>激发思考了警方反恐</p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('21','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485356388','<p>jklf;asjfa;sfjadf<br/></p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('22','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485356430','<p><iframe class=\"ueditor_baidumap\" src=\"http://localhost:90/Data/editor/ueditor/dialogs/map/show.html#center=102.839667,24.885953&zoom=13&width=530&height=340&markers=102.839667,24.885953&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe></p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('23','3','9','12','http://localhost:90/dianjita-3.html','街坊地块撒酒疯打飞机阿飞健康(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485435383','<p>jfdakofjas;faj</p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('24','3','9','12','http://localhost:90/dianjita-3.html','街坊地块撒酒疯打飞机阿飞健康(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485748726','<p>好听，感人！！！</p><p><br/></p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('25','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485748837','<p>有道理！！！</p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('26','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485748948','<p>动感！！！</p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('27','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485784729','<p>警方卡拉激发放假啊放假</p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('28','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味(1)','','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485786375','<p>好听！！！！</p><p><br/></p>','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('29','3','9','12','http://localhost:90/dianjita-3.html','街坊地块撒酒疯打飞机阿飞健康','user2','416148489@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485848117','<p>kjfklaj;jkf;asdjfk;sa</p>','0','0','24','0','0');
INSERT INTO `my_forum_reply` VALUES ('30','2','9','11','http://localhost:90/minyao-2.html','怎样唱出歌曲的韵味','user2','416148489@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485915191','<p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-music\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://box.baidu.com/widget/flash/bdspacesong.swf?from=tiebasongwidget&url=&name=%E7%88%B1%E6%83%85%E5%BA%9F%E6%9F%B4&artist=%E5%91%A8%E6%9D%B0%E4%BC%A6&extra=%E5%91%A8%E6%9D%B0%E4%BC%A6%E7%9A%84%E5%BA%8A%E8%BE%B9%E6%95%85%E4%BA%8B&autoPlay=false&loop=true\" width=\"400\" height=\"95\" align=\"none\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>','0','0','24','0','0');
INSERT INTO `my_forum_reply` VALUES ('31','1','9','11','http://localhost:90/minyao-1.html','吉他弹唱时气息训练方法和技巧','user2','416148489@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1485915898','<p>噢噢噢噢！！</p>','0','0','24','0','0');
INSERT INTO `my_forum_reply` VALUES ('32','3','9','12','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','街坊地块撒酒疯打飞机阿飞健康','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1486047676','有道理','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('33','3','9','12','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','街坊地块撒酒疯打飞机阿飞健康','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1486047839','就开始了剑法是否健康','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('34','3','9','12','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','街坊地块撒酒疯打飞机阿飞健康','user1','123@qq.com','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','1486048127','啊啊啊啊啊啊啊','0','0','23','0','0');
INSERT INTO `my_forum_reply` VALUES ('35','3','9','12','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','街坊地块撒酒疯打飞机阿飞健康','user2','416148489@qq.com','0.0.0.0','Mozilla/5.0 (Linux; U; Android 4.1.1; zh-cn;  MI2 Build/JRO03L) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 XiaoMi/MiuiBrowser/1.0','1486103983','jkdlfjaf;df','0','0','24','0','0');


# 转存表中的数据：my_guestbook 


# 转存表中的数据：my_itemgroup 
INSERT INTO `my_itemgroup` VALUES ('1','flagtype','文档属性','0');
INSERT INTO `my_itemgroup` VALUES ('2','blocktype','自由块类别','0');
INSERT INTO `my_itemgroup` VALUES ('3','softtype','软件类型','0');
INSERT INTO `my_itemgroup` VALUES ('4','softlanguage','软件语言','0');
INSERT INTO `my_itemgroup` VALUES ('5','star','星座','0');
INSERT INTO `my_itemgroup` VALUES ('6','animal','生肖','0');
INSERT INTO `my_itemgroup` VALUES ('7','education','教育程度','0');
INSERT INTO `my_itemgroup` VALUES ('8','configgroup','配置分组','0');
INSERT INTO `my_itemgroup` VALUES ('9','configtype','配置变量类型','0');


# 转存表中的数据：my_iteminfo 
INSERT INTO `my_iteminfo` VALUES ('1','图片','flagtype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('2','头条','flagtype','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('3','推荐','flagtype','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('4','精华','flagtype','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('5','幻灯','flagtype','16','0','0');
INSERT INTO `my_iteminfo` VALUES ('6','跳转','flagtype','32','0','0');
INSERT INTO `my_iteminfo` VALUES ('7','其他','flagtype','64','0','0');
INSERT INTO `my_iteminfo` VALUES ('8','文字','blocktype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('9','图片','blocktype','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('10','丰富','blocktype','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('11','国产','softtype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('12','中文版','softlanguage','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('13','英文版','softlanguage','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('14','多语言版','softlanguage','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('15','白羊座','star','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('16','金牛座','star','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('17','双子座','star','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('18','巨蟹座','star','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('19','狮子座','star','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('20','处女座','star','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('21','天枰座','star','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('22','天蝎座','star','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('23','射手座','star','9','0','0');
INSERT INTO `my_iteminfo` VALUES ('24','摩羯座','star','10','0','0');
INSERT INTO `my_iteminfo` VALUES ('25','水瓶座','star','11','0','0');
INSERT INTO `my_iteminfo` VALUES ('26','双鱼座','star','12','0','0');
INSERT INTO `my_iteminfo` VALUES ('27','鼠','animal','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('28','牛','animal','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('29','虎','animal','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('30','兔','animal','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('31','龙','animal','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('32','蛇','animal','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('33','马','animal','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('34','羊','animal','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('35','猴','animal','9','0','0');
INSERT INTO `my_iteminfo` VALUES ('36','鸡','animal','10','0','0');
INSERT INTO `my_iteminfo` VALUES ('37','狗','animal','11','0','0');
INSERT INTO `my_iteminfo` VALUES ('38','猪','animal','12','0','0');
INSERT INTO `my_iteminfo` VALUES ('39','小学','education','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('40','初中','education','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('41','高中/中专','education','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('42','大学专科','education','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('43','大学本科','education','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('44','硕士','education','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('45','博士以上','education','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('46','站点配置','configgroup','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('47','核心配置','configgroup','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('48','邮箱配置','configgroup','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('49','上传配置','configgroup','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('50','会员配置','configgroup','5','0','0');
INSERT INTO `my_iteminfo` VALUES ('51','帐号激活信','configgroup','6','0','0');
INSERT INTO `my_iteminfo` VALUES ('52','数字','configtype','1','0','0');
INSERT INTO `my_iteminfo` VALUES ('53','字符','configtype','2','0','0');
INSERT INTO `my_iteminfo` VALUES ('54','文本','configtype','3','0','0');
INSERT INTO `my_iteminfo` VALUES ('55','布尔(真假)','configtype','4','0','0');
INSERT INTO `my_iteminfo` VALUES ('56','公众号配置','configgroup','7','0','0');
INSERT INTO `my_iteminfo` VALUES ('57','第三方登录配置','configgroup','8','0','0');
INSERT INTO `my_iteminfo` VALUES ('58','七牛云存储','configgroup','9','0','0');
INSERT INTO `my_iteminfo` VALUES ('59','支付接口','configgroup','10','0','0');
INSERT INTO `my_iteminfo` VALUES ('60','文件','configtype','5','0','0');


# 转存表中的数据：my_link 
INSERT INTO `my_link` VALUES ('4','奇客','http://www.qikenet.com/','','','0','1476072097','1');
INSERT INTO `my_link` VALUES ('5','Java笔记','http://www.88cto.com/','','','0','1476072174','1');


# 转存表中的数据：my_member 
INSERT INTO `my_member` VALUES ('1','416148489@qq.com','5b055c5033335e775e686fb08fe806a1','yAJ9AL','user1','0.00','96','/uploads/avatar/1.jpg','1472736093','1492754267','0.0.0.0','26','3','0','0','0','');
INSERT INTO `my_member` VALUES ('7','345822466@qq.com','702e5b98c42c23feac29b859485a69e1','Cz6wbm','zonekey','0.00','0','','1475667349','1475667408','58.255.228.167','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('4','zyxk_98@163.com','909ac2a0ba40a7e6750e8f66b49230f4','3hKKZU','zyxk_98','0.00','0','','1475490151','1475490197','115.190.10.162','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('5','356260587@qq.com','7d9e4711f48e8a4d859929ec3486e9ec','8H3PX2','walj2222','0.00','0','','1475580022','1475580051','121.237.187.246','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('6','2045453931@qq.com','f950d43967578a32a4d15e47cb4dccdb','KY5MYh','junxun','0.00','0','','1475580886','1475580921','36.35.28.177','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('8','737822186@qq.com','588af714effa2ed9024191345d56310d','xe5cKz','hanyunhui','0.00','0','','1475718550','1475718600','117.86.20.254','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('9','fate126@126.com','a1f442be8fedd4430948520b4a5d1888','KUYHIE','fate126','0.00','0','','1475906672','1475906703','223.73.21.119','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('10','1099197917@qq.com','4f4c6379319bb31678461119e77b0a47','H2vz3S','1099197917','0.00','0','','1475958895','1475958929','121.226.153.233','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('11','363682455@qq.com','f36c7c3ed1b82ca2de8c681aeb58de9b','wPsm2C','korshow','0.00','0','','1475985674','1475985724','27.17.15.94','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('12','93990392@qq.com','cb4d60f7962dc58e3a902ac90db759f3','iSEHux','93990392','0.00','0','','1476119737','1476119769','182.131.82.117','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('13','greenhand@aliyun.com','71118d5ac89638ee186adcee1c853a84','sk7hXp','greenhand','0.00','0','','1476246468','1476246492','61.191.78.86','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('14','2849207526@qq.com','1cba98eaef1bccd4b87ee539b2b486ec','HkfC2v','去去123','0.00','0','','1476339023','1476339053','223.73.235.33','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('15','867083177@qq.com','cdc189f6567e5f5c5e91a0b4fe910745','2gzaDs','leehk','0.00','0','','1476342892','1476342928','220.161.205.30','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('16','2249101286@qq.com','f6ef81be4ad237c51abaafd961b16174','6d73kd','shaoge110','0.00','0','','1476364903','1476365043','117.174.86.25','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('17','2633734790@QQ.COM','bb5b682c768e0f4c0c7b5c4a72f00665','uZm6EZ','艺美科技网','0.00','0','','1476497605','1476497665','60.6.231.171','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('18','1126058109@qq.com','cb099c6fee9c87caf830bc5a7939de03','xcTPTa','shenqing','0.00','0','','1476669193','1476669240','101.225.81.173','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('19','fachgo@163.com','65af0092cd217b60ae485fb04ccb6b63','5BYwkI','fachgo','0.00','0','','1476669752','1476669786','122.5.30.90','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('20','910670823@qq.com','79cbafe23eaf6021861292cf0a95ae93','dHkW4R','anpianpianbu','0.00','0','','1476764047','1476764087','219.142.244.30','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('21','dreamboy520@vip.qq.com','f894e6eee2b01cc3401e05d3045050cf','fVEr9b','zgjzxr','0.00','0','','1476847816','1476847847','101.131.88.156','1','2','0','0','0','');
INSERT INTO `my_member` VALUES ('22','754350580@qq.com','e50c6c85edab20ee12398e1e7479af9d','b2Qk3y','yaxia','0.00','0','','1476863793','1476863948','61.132.54.2','1','2','0','0','0','');


# 转存表中的数据：my_member_slog 
INSERT INTO `my_member_slog` VALUES ('1','23','1','怎样唱出歌曲的韵味(1)','http://localhost:90/minyao-2.html','+1','1485786375','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('2','24','1','','','+2','1485787255','注册会员，积分+2');
INSERT INTO `my_member_slog` VALUES ('3','24','1','','','+2','1485787455','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('4','23','1','','','+2','1485831484','自动登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('5','24','1','','','+2','1485847013','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('6','24','1','街坊地块撒酒疯打飞机阿飞健康','http://localhost:90/dianjita-3.html','+1','1485848117','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('7','23','1','','','+2','1485868889','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('8','24','1','','','+2','1485878473','自动登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('9','24','1','怎样唱出歌曲的韵味','http://localhost:90/minyao-2.html','+1','1485915191','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('10','24','1','','','+2','1485915843','自动登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('11','24','1','吉他弹唱时气息训练方法和技巧','http://localhost:90/minyao-1.html','+1','1485915898','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('12','23','1','','','+2','1485917714','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('13','23','1','','','+2','1486003461','自动登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('14','23','1','街坊地块撒酒疯打飞机阿飞健康','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','+1','1486047676','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('15','23','1','街坊地块撒酒疯打飞机阿飞健康','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','+1','1486047839','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('16','23','1','','','+2','1486047912','自动登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('17','23','1','','','+2','1486047915','自动登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('18','23','1','街坊地块撒酒疯打飞机阿飞健康','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','+1','1486048127','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('19','24','1','街坊地块撒酒疯打飞机阿飞健康','http://localhost:90/Mobile/Show-index-cid-12-id-3.html','+1','1486103983','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('20','24','1','','','+2','1486176868','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('21','25','1','','','+2','1486207754','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('22','25','1','怎样唱出歌曲的韵味','http://localhost:90/minyao-2.html','+1','1486267582','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('23','23','1','','','+2','1486348053','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('24','0','1','佛挡杀佛三大gas德国','','+2','1486629058','发表文章，积分+2');
INSERT INTO `my_member_slog` VALUES ('25','24','1','','','+2','1486645587','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('26','0','1','降幅扩大解放了大三房','','+2','1486645685','发表论坛帖子，积分+2');
INSERT INTO `my_member_slog` VALUES ('27','23','1','','','+2','1486647511','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('28','23','1','','','+2','1487310803','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('29','0','1','jdfkaljfsd;','','+2','1487311166','发表文章，积分+2');
INSERT INTO `my_member_slog` VALUES ('30','23','1','吉他弹唱时气息训练方法和技巧','http://localhost:90/minyao-1.html','+1','1487397808','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('31','0','1','小星运吉他谱','','+2','1487420810','发表文章，积分+2');
INSERT INTO `my_member_slog` VALUES ('32','1','1','','','+2','1487827408','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('33','1','1','','','+2','1488337540','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('34','1','2','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','','-10','1488342650','下载资源，积分-10');
INSERT INTO `my_member_slog` VALUES ('35','1','2','价值300元的Discuz!X3IOS风格手机模版','','-2','1488374405','下载资源，积分-2');
INSERT INTO `my_member_slog` VALUES ('36','1','2','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','','-10','1488374657','下载资源，积分-10');
INSERT INTO `my_member_slog` VALUES ('37','1','1','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','','+1','1488807672','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('38','1','1','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','','+1','1488811436','发表回复，积分+1');
INSERT INTO `my_member_slog` VALUES ('39','1','1','','','+2','1492754267','登录成功，积分+2');
INSERT INTO `my_member_slog` VALUES ('40','0','1','fadsfsadf','','+2','1492754480','发表文章，积分+2');
INSERT INTO `my_member_slog` VALUES ('41','0','1','fsffdasf','','+2','1492754677','发表话题，积分+2');


# 转存表中的数据：my_memberdetail 
INSERT INTO `my_memberdetail` VALUES ('1','1','张三','张三','0000-00-00','0','0','北京,东城区,null,','416148489','','13888888888','0','0','0','0','0','0','0','','1475211512','','这位童鞋很懒，什么也没有留下～～！');


# 转存表中的数据：my_membergroup 
INSERT INTO `my_membergroup` VALUES ('1','新手上路','','0','10','0','0');
INSERT INTO `my_membergroup` VALUES ('2','注册会员','','10','50','0','0');
INSERT INTO `my_membergroup` VALUES ('3','中级会员','','50','200','0','0');
INSERT INTO `my_membergroup` VALUES ('4','高级会员','','200','500','0','0');
INSERT INTO `my_membergroup` VALUES ('5','金牌会员','','500','1000','0','0');
INSERT INTO `my_membergroup` VALUES ('6','论坛元老','','1000','2000','0','0');


# 转存表中的数据：my_menu 
INSERT INTO `my_menu` VALUES ('1','常规管理','0','','','','0','1','1','fa-certificate');
INSERT INTO `my_menu` VALUES ('2','模块管理','0','','','','0','1','3','fa-cogs');
INSERT INTO `my_menu` VALUES ('3','系统设置','0','','','','0','1','2','fa-tachometer');
INSERT INTO `my_menu` VALUES ('4','扩展管理','0','','','','0','1','4','fa-stack-exchange');
INSERT INTO `my_menu` VALUES ('5','栏目管理','1','','','','0','1','11','');
INSERT INTO `my_menu` VALUES ('6','内容管理','1','','','','0','1','12','');
INSERT INTO `my_menu` VALUES ('7','快捷面板','1','','','','0','1','13','');
INSERT INTO `my_menu` VALUES ('8','栏目管理','5','Category','index','','0','1','111','');
INSERT INTO `my_menu` VALUES ('9','内置模块','2','','','','0','1','21','');
INSERT INTO `my_menu` VALUES ('10','自由块管理','9','Block','index','','0','1','211','');
INSERT INTO `my_menu` VALUES ('11','图片广告管理','9','Abc','index','','0','1','212','');
INSERT INTO `my_menu` VALUES ('12','专题管理','9','Special','index','','0','1','214','');
INSERT INTO `my_menu` VALUES ('13','公告管理','9','Announce','index','','0','1','215','');
INSERT INTO `my_menu` VALUES ('14','友情链接','9','Link','index','','0','1','216','');
INSERT INTO `my_menu` VALUES ('15','留言本管理','9','Guestbook','index','','0','1','217','');
INSERT INTO `my_menu` VALUES ('16','评论管理','9','Comment','index','','1','1','4','');
INSERT INTO `my_menu` VALUES ('17','系统设置','3','','','','0','1','31','');
INSERT INTO `my_menu` VALUES ('18','会员管理','3','','','','0','1','33','');
INSERT INTO `my_menu` VALUES ('19','管理员管理','3','','','','0','1','34','');
INSERT INTO `my_menu` VALUES ('20','网站设置','17','System','site','','1','1','1','');
INSERT INTO `my_menu` VALUES ('21','伪静态|缓存设置','17','System','url','','0','1','312','');
INSERT INTO `my_menu` VALUES ('22','清除系统缓存','17','System','clearCache','','0','1','316','');
INSERT INTO `my_menu` VALUES ('23','在线客服设置','17','System','online','','0','1','313','');
INSERT INTO `my_menu` VALUES ('24','静态缓存','3','','','','0','1','32','');
INSERT INTO `my_menu` VALUES ('25','一键更新全站','24','ClearHtml','all','','0','1','321','');
INSERT INTO `my_menu` VALUES ('26','更新首页','24','ClearHtml','home','','0','1','322','');
INSERT INTO `my_menu` VALUES ('27','更新栏目','24','ClearHtml','lists','','0','1','323','');
INSERT INTO `my_menu` VALUES ('28','更新文档','24','ClearHtml','shows','','0','1','324','');
INSERT INTO `my_menu` VALUES ('29','更新专题','24','ClearHtml','special','','0','1','325','');
INSERT INTO `my_menu` VALUES ('30','会员管理','18','Member','index','','0','1','2','');
INSERT INTO `my_menu` VALUES ('31','会员组管理','18','Membergroup','index','','0','1','332','');
INSERT INTO `my_menu` VALUES ('32','系统用户管理','19','Rbac','index','','0','1','341','');
INSERT INTO `my_menu` VALUES ('33','用户组设置','19','Rbac','role','','0','1','342','');
INSERT INTO `my_menu` VALUES ('34','节点列表','19','Rbac','node','','0','0','343','');
INSERT INTO `my_menu` VALUES ('35','扩展管理','4','','','','0','1','41','');
INSERT INTO `my_menu` VALUES ('36','我的账户','4','','','','0','1','42','');
INSERT INTO `my_menu` VALUES ('37','模型管理','35','Model','index','','0','1','411','');
INSERT INTO `my_menu` VALUES ('38','菜单管理','35','Menu','index','','0','1','412','');
INSERT INTO `my_menu` VALUES ('39','数据库管理','35','Database','index','','0','1','4','');
INSERT INTO `my_menu` VALUES ('40','联动管理','35','Itemgroup','index','','0','1','414','');
INSERT INTO `my_menu` VALUES ('41','区域管理','35','Area','index','','0','1','415','');
INSERT INTO `my_menu` VALUES ('42','修改我的信息','36','Personal','index','','0','1','421','');
INSERT INTO `my_menu` VALUES ('43','修改密码','36','Personal','pwd','','0','1','422','');
INSERT INTO `my_menu` VALUES ('44','其他模块','2','','','','0','1','22','');
INSERT INTO `my_menu` VALUES ('45','已传文件管理','35','Attachment','index','','0','1','417','');
INSERT INTO `my_menu` VALUES ('46','数据元管理','35','Meta','index','','0','0','416','');
INSERT INTO `my_menu` VALUES ('47','模板管理','35','Templets','index','','0','0','428','');
INSERT INTO `my_menu` VALUES ('49','批量采集','44','Collect','index','','1','1','1','');
INSERT INTO `my_menu` VALUES ('48','tag管理','44','Tag','index','','1','1','8','');
INSERT INTO `my_menu` VALUES ('50','联盟广告管理','9','Union','index','','0','1','213','');
INSERT INTO `my_menu` VALUES ('51','更新sitemap','17','Sitemap','index','','1','1','317','');
INSERT INTO `my_menu` VALUES ('52','搜索词管理','44','Search','index','','0','1','6','');
INSERT INTO `my_menu` VALUES ('53','属性管理','44','Property','index','','0','1','4','');
INSERT INTO `my_menu` VALUES ('54','属性值管理','44','Property_value','index','','0','1','5','');
INSERT INTO `my_menu` VALUES ('55','批量入库','44','Importimgs','index','','0','1','7','');
INSERT INTO `my_menu` VALUES ('56','采集到的内容','44','Temp','index','','1','1','3','');
INSERT INTO `my_menu` VALUES ('57','单页采集','44','Collect','page','','1','1','2','');


# 转存表中的数据：my_meta 
INSERT INTO `my_meta` VALUES ('1','1','HOME_URL_MODEL','2');
INSERT INTO `my_meta` VALUES ('2','1','HOME_URL_PATHINFO_DEPR','-');
INSERT INTO `my_meta` VALUES ('3','1','HOME_URL_ROUTER_ON','1');
INSERT INTO `my_meta` VALUES ('4','1','HOME_URL_ROUTE_RULES','Mobile$=>Mobile/Index/index\r\nSpecial/:id\\d=>Special/shows\r\n:e/p/:p\\d=>List/index\r\n:e/:id\\d=>Show/index\r\n/^(\\w+)$/=>List/index?e=:1');
INSERT INTO `my_meta` VALUES ('5','1','HOME_HTML_CACHE_ON','0');
INSERT INTO `my_meta` VALUES ('6','1','MOBILE_HTML_CACHE_ON','0');
INSERT INTO `my_meta` VALUES ('7','1','HTML_CACHE_INDEX_ON','0');
INSERT INTO `my_meta` VALUES ('8','1','HTML_CACHE_INDEX_TIME','1200');
INSERT INTO `my_meta` VALUES ('9','1','HTML_CACHE_LIST_ON','0');
INSERT INTO `my_meta` VALUES ('10','1','HTML_CACHE_LIST_TIME','0');
INSERT INTO `my_meta` VALUES ('11','1','HTML_CACHE_SHOW_ON','0');
INSERT INTO `my_meta` VALUES ('12','1','HTML_CACHE_SHOW_TIME','1200');
INSERT INTO `my_meta` VALUES ('15','9','ONLINE_CFG_MODE','1');
INSERT INTO `my_meta` VALUES ('13','1','HTML_CACHE_SPECIAL_ON','0');
INSERT INTO `my_meta` VALUES ('14','1','HTML_CACHE_SPECIAL_TIME','0');
INSERT INTO `my_meta` VALUES ('16','9','ONLINE_CFG_STYLE','blue');
INSERT INTO `my_meta` VALUES ('17','9','ONLINE_CFG_H','1');
INSERT INTO `my_meta` VALUES ('18','9','ONLINE_CFG_H_MARGIN','0');
INSERT INTO `my_meta` VALUES ('19','9','ONLINE_CFG_V','2');
INSERT INTO `my_meta` VALUES ('20','9','ONLINE_CFG_V_MARGIN','0');
INSERT INTO `my_meta` VALUES ('21','9','ONLINE_CFG_QQ','416148489$$$点击咨询\r\n416148489$$$点击留言');
INSERT INTO `my_meta` VALUES ('22','9','ONLINE_CFG_WANGWANG','hxch1006$$$在线旺旺...');
INSERT INTO `my_meta` VALUES ('23','9','ONLINE_CFG_PHONE_ON','1');
INSERT INTO `my_meta` VALUES ('24','9','ONLINE_CFG_PHONE','08713838438');
INSERT INTO `my_meta` VALUES ('25','9','ONLINE_CFG_GUESTBOOK_ON','1');
INSERT INTO `my_meta` VALUES ('26','9','ONLINE_CFG_QQ_PARAM','<a target=\'_blank\' href=\"http://wpa.qq.com/msgrd?v=3&uin=[客服号]&site=qq&menu=yes\"><img border=\"0\" src=\"http://wpa.qq.com/pa?p=2:[客服号]:51\" alt=\"[客服说明]\" title=\"[客服说明]\"/></a>');
INSERT INTO `my_meta` VALUES ('27','9','ONLINE_CFG_WANGWANG_PARAM','<a target=\"_blank\" href=\"http://www.taobao.com/webww/ww.php?ver=3&touid=[客服号]&siteid=cntaobao&status=1&charset=utf-8\" ><img border=\"0\" src=\"http://amos.alicdn.com/online.aw?v=2&uid=[客服号]&site=cntaobao&s=10&charset=UTF-8\" alt=\"[客服说明]\" /></a>');


# 转存表中的数据：my_model 
INSERT INTO `my_model` VALUES ('1','文章模型','','article','1','','List_article.html','Show_article.html','1');
INSERT INTO `my_model` VALUES ('2','单页模型','','page','1','','List_page.html','Show_page.html','2');
INSERT INTO `my_model` VALUES ('3','产品模型','','product','1','','List_product.html','Show_product.html','3');
INSERT INTO `my_model` VALUES ('4','图片模型','','picture','1','','List_picture.html','Show_picture.html','4');
INSERT INTO `my_model` VALUES ('5','下载模型','','soft','1','','List_soft.html','Show_soft.html','5');
INSERT INTO `my_model` VALUES ('7','话题模型','','topic','1','','List_topic.html','Show_topic.html','6');
INSERT INTO `my_model` VALUES ('8','专题模型','','special','1','','List_special.html','Show_special.html','7');
INSERT INTO `my_model` VALUES ('9','论坛模型','','forum','1','','List_forum.html','Show_forum.html','8');


# 转存表中的数据：my_node 
INSERT INTO `my_node` VALUES ('1','Manage','后台应用','1','','1','0','1');
INSERT INTO `my_node` VALUES ('2','Rbac','用户权限管理','1','','1','1','2');
INSERT INTO `my_node` VALUES ('3','index','用户列表','1','','1','2','3');
INSERT INTO `my_node` VALUES ('4','addUser','添加用户','1','','2','2','3');
INSERT INTO `my_node` VALUES ('5','editUser','编辑用户','1','','3','2','3');
INSERT INTO `my_node` VALUES ('6','delUser','删除用户','1','','4','2','3');
INSERT INTO `my_node` VALUES ('7','Index','前台应用','1','','2','0','1');
INSERT INTO `my_node` VALUES ('8','role','用户组列表','1','','5','2','3');
INSERT INTO `my_node` VALUES ('9','addRole','添加用户组','1','','6','2','3');
INSERT INTO `my_node` VALUES ('10','editRole','编辑用户组','1','','7','2','3');
INSERT INTO `my_node` VALUES ('11','delRole','删除用户组','1','','8','2','3');
INSERT INTO `my_node` VALUES ('12','access','权限管理','1','','9','2','3');
INSERT INTO `my_node` VALUES ('13','node','节点列表','0','','10','2','3');
INSERT INTO `my_node` VALUES ('14','addNode','添加节点','0','','11','2','3');
INSERT INTO `my_node` VALUES ('15','editNode','编辑节点','0','','12','2','3');
INSERT INTO `my_node` VALUES ('16','delNode','删除节点','0','','13','2','3');
INSERT INTO `my_node` VALUES ('17','System','系统设置','1','','2','1','2');
INSERT INTO `my_node` VALUES ('18','site','网站设置','1','','1','17','3');
INSERT INTO `my_node` VALUES ('19','Model','模型管理','1','','3','1','2');
INSERT INTO `my_node` VALUES ('20','index','模型列表','1','','1','19','3');
INSERT INTO `my_node` VALUES ('21','add','添加模型','1','','2','19','3');
INSERT INTO `my_node` VALUES ('22','edit','模型修改','1','','3','19','3');
INSERT INTO `my_node` VALUES ('23','del','删除模型','1','','4','19','3');
INSERT INTO `my_node` VALUES ('24','sort','更新排序','1','','5','19','3');
INSERT INTO `my_node` VALUES ('25','Category','栏目管理','1','','4','1','2');
INSERT INTO `my_node` VALUES ('26','index','栏目列表','1','','1','25','3');
INSERT INTO `my_node` VALUES ('27','add','添加栏目','1','','2','25','3');
INSERT INTO `my_node` VALUES ('28','edit','修改栏目','1','','3','25','3');
INSERT INTO `my_node` VALUES ('29','del','删除栏目','1','','4','25','3');
INSERT INTO `my_node` VALUES ('30','sort','更新栏目排序','1','','5','25','3');
INSERT INTO `my_node` VALUES ('31','Member','会员管理','1','','5','1','2');
INSERT INTO `my_node` VALUES ('32','index','会员列表','1','','1','31','3');
INSERT INTO `my_node` VALUES ('33','add','添加会员','1','','2','31','3');
INSERT INTO `my_node` VALUES ('34','edit','编辑会员','1','','3','31','3');
INSERT INTO `my_node` VALUES ('35','del','删除会员','1','','4','31','3');
INSERT INTO `my_node` VALUES ('36','Membergroup','会员组管理','1','','6','1','2');
INSERT INTO `my_node` VALUES ('37','index','会员组列表','1','','1','36','3');
INSERT INTO `my_node` VALUES ('38','add','添加会员组','1','','2','36','3');
INSERT INTO `my_node` VALUES ('39','edit','编辑会员组','1','','3','36','3');
INSERT INTO `my_node` VALUES ('40','del','删除会员组','1','','4','36','3');
INSERT INTO `my_node` VALUES ('41','Announce','公告管理','1','','7','1','2');
INSERT INTO `my_node` VALUES ('42','index','公告列表','1','','1','41','3');
INSERT INTO `my_node` VALUES ('43','add','添加公告','1','','2','41','3');
INSERT INTO `my_node` VALUES ('44','edit','编辑公告','1','','3','41','3');
INSERT INTO `my_node` VALUES ('45','del','删除公告','1','','4','41','3');
INSERT INTO `my_node` VALUES ('46','Link','友情链接','1','','8','1','2');
INSERT INTO `my_node` VALUES ('47','index','友情列表','1','','1','46','3');
INSERT INTO `my_node` VALUES ('48','add','添加友情','1','','2','46','3');
INSERT INTO `my_node` VALUES ('49','edit','编辑友情','1','','3','46','3');
INSERT INTO `my_node` VALUES ('50','del','删除友情','1','','4','46','3');
INSERT INTO `my_node` VALUES ('51','Guestbook','留言本管理','1','','9','1','2');
INSERT INTO `my_node` VALUES ('52','index','留言本列表','1','','1','51','3');
INSERT INTO `my_node` VALUES ('53','reply','回复留言','1','','2','51','3');
INSERT INTO `my_node` VALUES ('54','del','删除留言','1','','3','51','3');
INSERT INTO `my_node` VALUES ('55','clearCache','清除缓存','1','','2','17','3');
INSERT INTO `my_node` VALUES ('56','Personal','我的账户','1','','10','1','2');
INSERT INTO `my_node` VALUES ('57','index','修改资料','1','','1','56','3');
INSERT INTO `my_node` VALUES ('58','pwd','修改密码','1','','2','56','3');
INSERT INTO `my_node` VALUES ('59','Comment','评论管理','1','','10','1','2');
INSERT INTO `my_node` VALUES ('60','index','评论列表','1','','1','59','3');
INSERT INTO `my_node` VALUES ('61','edit','编辑评论','1','','2','59','3');
INSERT INTO `my_node` VALUES ('62','del','删除评论','1','','3','59','3');
INSERT INTO `my_node` VALUES ('63','Area','区域管理','1','','12','1','2');
INSERT INTO `my_node` VALUES ('64','index','区域列表','1','','1','63','3');
INSERT INTO `my_node` VALUES ('65','add','添加区域','1','','2','63','3');
INSERT INTO `my_node` VALUES ('66','edit','编辑区域','1','','3','63','3');
INSERT INTO `my_node` VALUES ('67','del','删除区域','1','','4','63','3');
INSERT INTO `my_node` VALUES ('68','Itemgroup','联动组管理','1','','13','1','2');
INSERT INTO `my_node` VALUES ('69','index','联动组列表','1','','1','68','3');
INSERT INTO `my_node` VALUES ('70','add','添加联动组','1','','2','68','3');
INSERT INTO `my_node` VALUES ('71','edit','编辑联动组','1','','3','68','3');
INSERT INTO `my_node` VALUES ('72','del','删除联动组','1','','4','68','3');
INSERT INTO `my_node` VALUES ('73','Iteminfo','联动管理','1','','14','1','2');
INSERT INTO `my_node` VALUES ('74','index','联动列表','1','','1','73','3');
INSERT INTO `my_node` VALUES ('75','add','添加联动','1','','2','73','3');
INSERT INTO `my_node` VALUES ('76','edit','编辑联动','1','','3','73','3');
INSERT INTO `my_node` VALUES ('77','del','删除联动','1','','4','73','3');
INSERT INTO `my_node` VALUES ('78','sort','更新排序','1','','5','73','3');
INSERT INTO `my_node` VALUES ('79','Special','专题管理','1','','15','1','2');
INSERT INTO `my_node` VALUES ('80','index','专题列表','1','','1','79','3');
INSERT INTO `my_node` VALUES ('81','add','添加专题','1','','2','79','3');
INSERT INTO `my_node` VALUES ('82','edit','编辑专题','1','','3','79','3');
INSERT INTO `my_node` VALUES ('83','del','删除专题','1','','4','79','3');
INSERT INTO `my_node` VALUES ('84','trach','回收站','1','','5','79','3');
INSERT INTO `my_node` VALUES ('85','restore','还原专题','1','','6','79','3');
INSERT INTO `my_node` VALUES ('86','clear','彻底删除','1','','7','79','3');
INSERT INTO `my_node` VALUES ('87','Block','自由块管理','1','','16','1','2');
INSERT INTO `my_node` VALUES ('88','index','自由块列表','1','','1','87','3');
INSERT INTO `my_node` VALUES ('89','add','添加自由块','1','','2','87','3');
INSERT INTO `my_node` VALUES ('90','edit','编辑自由块','1','','3','87','3');
INSERT INTO `my_node` VALUES ('91','del','删除自由块','1','','4','87','3');
INSERT INTO `my_node` VALUES ('92','Database','数据库管理','1','','17','1','2');
INSERT INTO `my_node` VALUES ('93','index','数据表列表','1','','1','92','3');
INSERT INTO `my_node` VALUES ('94','backup','数据库备份','1','','2','92','3');
INSERT INTO `my_node` VALUES ('95','optimize','数据表优化','1','','3','92','3');
INSERT INTO `my_node` VALUES ('96','repair','数据表修复','1','','4','92','3');
INSERT INTO `my_node` VALUES ('97','restore','还原管理','1','','5','92','3');
INSERT INTO `my_node` VALUES ('98','restoreData','数据恢复','1','','6','92','3');
INSERT INTO `my_node` VALUES ('99','delSqlFiles','删除文件','1','','7','92','3');
INSERT INTO `my_node` VALUES ('100','url','伪静态缓存设置','1','','3','17','3');
INSERT INTO `my_node` VALUES ('101','ClearHtml','静态缓存管理','1','','18','1','2');
INSERT INTO `my_node` VALUES ('102','all','一键更新全站','1','','1','101','3');
INSERT INTO `my_node` VALUES ('103','home','更新首页','1','','2','101','3');
INSERT INTO `my_node` VALUES ('104','lists','更新栏目','1','','3','101','3');
INSERT INTO `my_node` VALUES ('105','shows','更新文档','1','','4','101','3');
INSERT INTO `my_node` VALUES ('106','special','更新专题','1','','5','101','3');
INSERT INTO `my_node` VALUES ('107','Menu','菜单管理','1','','19','1','2');
INSERT INTO `my_node` VALUES ('108','index','菜单列表','1','','1','107','3');
INSERT INTO `my_node` VALUES ('109','add','添加菜单','1','','2','107','3');
INSERT INTO `my_node` VALUES ('110','edit','修改菜单','1','','3','107','3');
INSERT INTO `my_node` VALUES ('111','sort','排序更新','1','','4','107','3');
INSERT INTO `my_node` VALUES ('112','qk','快捷更新','1','','5','107','3');
INSERT INTO `my_node` VALUES ('113','del','删除菜单','1','','6','107','3');
INSERT INTO `my_node` VALUES ('114','Attachment','已上传文件管理','1','','20','1','2');
INSERT INTO `my_node` VALUES ('115','index','文件列表','1','','1','114','3');
INSERT INTO `my_node` VALUES ('116','del','删除文件','1','','4','114','3');
INSERT INTO `my_node` VALUES ('117','Abc','广告管理','1','','21','1','2');
INSERT INTO `my_node` VALUES ('118','index','广告位列表','1','','1','117','3');
INSERT INTO `my_node` VALUES ('119','add','添加广告位','1','','2','117','3');
INSERT INTO `my_node` VALUES ('120','edit','修改广告位','1','','3','117','3');
INSERT INTO `my_node` VALUES ('121','del','删除广告位','1','','4','117','3');
INSERT INTO `my_node` VALUES ('122','detail','广告列表','1','','5','117','3');
INSERT INTO `my_node` VALUES ('123','addDetail','添加广告','1','','6','117','3');
INSERT INTO `my_node` VALUES ('124','editDetail','修改广告','1','','7','117','3');
INSERT INTO `my_node` VALUES ('125','sort','更新广告排序','1','','7','117','3');
INSERT INTO `my_node` VALUES ('126','getcode','获取广告代码','1','','8','117','3');
INSERT INTO `my_node` VALUES ('127','delDetail','删除广告','1','','9','117','3');
INSERT INTO `my_node` VALUES ('128','Templets','模板管理','1','','22','1','2');
INSERT INTO `my_node` VALUES ('129','index','模板列表','1','','1','128','3');
INSERT INTO `my_node` VALUES ('130','add','添加模板','1','','2','128','3');
INSERT INTO `my_node` VALUES ('131','edit','修改模板','1','','3','128','3');
INSERT INTO `my_node` VALUES ('132','del','删除模板','1','','4','128','3');


# 转存表中的数据：my_oauth_user 


# 转存表中的数据：my_order_month 
INSERT INTO `my_order_month` VALUES ('1','2016122502010816631','4006942001201612253885784749','5','0.10','1','1482602468','1','1482602481');
INSERT INTO `my_order_month` VALUES ('2','GC253458705469d','2016122521001004770256372685','12830','9.60','1','1482634587','1','1482634614');
INSERT INTO `my_order_month` VALUES ('3','2016122513344054518','','8132','9.60','1','1482644080','0','0');
INSERT INTO `my_order_month` VALUES ('4','2016122513555340195','4009002001201612253929903124','8132','9.60','1','1482645353','1','1482645377');
INSERT INTO `my_order_month` VALUES ('5','2016122518313455168','4007992001201612253964543880','12847','9.60','1','1482661894','1','1482661913');
INSERT INTO `my_order_month` VALUES ('6','2016122600275678192','','1110','9.60','1','1482683276','0','0');
INSERT INTO `my_order_month` VALUES ('7','GC268329551046d','','1110','150.00','36','1482683295','0','0');
INSERT INTO `my_order_month` VALUES ('8','2016122600302257773','','1110','150.00','36','1482683422','0','0');
INSERT INTO `my_order_month` VALUES ('9','GC261536057507d','2016122621001004950218988476','12860','9.60','1','1482715360','1','1482715427');
INSERT INTO `my_order_month` VALUES ('10','GC262459217543d','2016122621001004470299563260','12880','9.60','1','1482724592','1','1482724616');
INSERT INTO `my_order_month` VALUES ('11','GC262678172393d','','12883','9.60','1','1482726781','0','0');
INSERT INTO `my_order_month` VALUES ('12','2016122612331136394','','12883','150.00','36','1482726791','0','0');
INSERT INTO `my_order_month` VALUES ('13','2016122612335269984','4002992001201612264036195363','12883','9.60','1','1482726832','1','1482726854');
INSERT INTO `my_order_month` VALUES ('14','2016122614223741850','4006932001201612264049644628','12899','9.60','1','1482733357','1','1482733377');
INSERT INTO `my_order_month` VALUES ('15','GC263763261286d','','12912','9.60','1','1482737632','0','0');
INSERT INTO `my_order_month` VALUES ('16','GC263893012372d','','12918','150.00','36','1482738930','0','0');
INSERT INTO `my_order_month` VALUES ('17','2016122616170863379','4002192001201612264059697879','12928','9.60','1','1482740228','1','1482740254');
INSERT INTO `my_order_month` VALUES ('18','2016122616473728145','','3749','150.00','36','1482742057','0','0');
INSERT INTO `my_order_month` VALUES ('19','GC264471280422d','2016122621001004740214096419','12943','9.60','1','1482744712','1','1482744746');
INSERT INTO `my_order_month` VALUES ('20','GC264609898546d','','10169','9.60','1','1482746098','0','0');
INSERT INTO `my_order_month` VALUES ('21','GC264618065046d','2016122621001004040237465797','10169','9.60','1','1482746180','1','1482746204');
INSERT INTO `my_order_month` VALUES ('22','GC276822479262d','2016122721001004850234285317','12962','9.60','1','1482768224','1','1482768344');
INSERT INTO `my_order_month` VALUES ('23','GC279986239646d','','802','150.00','36','1482799862','0','0');
INSERT INTO `my_order_month` VALUES ('24','GC270598639981d','2016122721001004450291144646','12984','9.60','1','1482805986','1','1482806014');
INSERT INTO `my_order_month` VALUES ('25','2016122711111328081','','2486','9.60','1','1482808273','0','0');
INSERT INTO `my_order_month` VALUES ('26','GC270854214526d','2016122721001004070232249921','12990','9.60','1','1482808542','1','1482808566');
INSERT INTO `my_order_month` VALUES ('27','GC271841268858d','','8050','150.00','36','1482818412','0','0');
INSERT INTO `my_order_month` VALUES ('28','GC271843056495d','2016122721001004820246714051','8050','40.00','6','1482818430','1','1482818491');
INSERT INTO `my_order_month` VALUES ('29','2016122715483911907','','13028','9.60','1','1482824919','0','0');
INSERT INTO `my_order_month` VALUES ('30','GC272492477501d','','13028','150.00','36','1482824924','0','0');
INSERT INTO `my_order_month` VALUES ('31','2016122715485195454','4009122001201612274168623255','13028','9.60','1','1482824931','1','1482824953');
INSERT INTO `my_order_month` VALUES ('32','GC274623499095d','','1023','40.00','6','1482846235','0','0');
INSERT INTO `my_order_month` VALUES ('33','GC288667034394d','2016122821001004360221754259','11666','9.60','1','1482886670','1','1482886715');
INSERT INTO `my_order_month` VALUES ('34','GC288759491933d','2016122821001004640203744302','13074','40.00','6','1482887594','1','1482887649');
INSERT INTO `my_order_month` VALUES ('35','GC289117299293d','','13086','9.60','1','1482891173','0','0');
INSERT INTO `my_order_month` VALUES ('36','2016122810131094580','4008932001201612284241437283','13086','9.60','1','1482891190','1','1482891206');
INSERT INTO `my_order_month` VALUES ('37','2016122810395312774','4005912001201612284243239753','13093','9.60','1','1482892793','1','1482892827');
INSERT INTO `my_order_month` VALUES ('38','GC289468825877d','2016122821001004770260957931','13101','9.60','1','1482894688','1','1482894719');
INSERT INTO `my_order_month` VALUES ('39','GC289469563371d','','11973','9.60','1','1482894695','0','0');
INSERT INTO `my_order_month` VALUES ('40','2016122811115335509','','11973','9.60','1','1482894713','0','0');
INSERT INTO `my_order_month` VALUES ('41','GC289551459792d','','12993','70.00','12','1482895514','0','0');
INSERT INTO `my_order_month` VALUES ('42','GC289555323960d','2016122821001004590222507107','12993','70.00','12','1482895553','1','1482895565');
INSERT INTO `my_order_month` VALUES ('43','GC289842103932d','','4479','150.00','36','1482898421','0','0');
INSERT INTO `my_order_month` VALUES ('44','2016122814200537947','4007742001201612284267511819','8771','9.60','1','1482906005','1','1482906057');
INSERT INTO `my_order_month` VALUES ('45','GC280770245167d','2016122821001004230202269029','10146','9.60','1','1482907702','1','1482907746');
INSERT INTO `my_order_month` VALUES ('46','2016122815380835149','4006572001201612284275034343','13128','9.60','1','1482910688','1','1482910702');
INSERT INTO `my_order_month` VALUES ('47','2016122816084050475','','2357','9.60','1','1482912520','0','0');
INSERT INTO `my_order_month` VALUES ('48','2016122818084520398','4006652001201612284292686914','13138','9.60','1','1482919725','1','1482920160');
INSERT INTO `my_order_month` VALUES ('49','GC297994145719d','','7077','150.00','36','1482979941','0','0');
INSERT INTO `my_order_month` VALUES ('50','GC298116119872d','','13182','150.00','36','1482981161','0','0');
INSERT INTO `my_order_month` VALUES ('51','GC298236213657d','2016122921001004250292961995','13187','9.60','1','1482982362','1','1482982392');
INSERT INTO `my_order_month` VALUES ('52','2016122913232829247','4005322001201612294370259741','2406','9.60','1','1482989008','1','1482989028');
INSERT INTO `my_order_month` VALUES ('53','2016122913482324907','','7112','150.00','36','1482990503','0','0');
INSERT INTO `my_order_month` VALUES ('54','2016122913483347862','','7112','150.00','36','1482990513','0','0');
INSERT INTO `my_order_month` VALUES ('55','GC299292332937d','2016122921001004130221917822','13203','9.60','1','1482992923','1','1482992954');
INSERT INTO `my_order_month` VALUES ('56','GC299750444032d','','1506','9.60','1','1482997504','0','0');
INSERT INTO `my_order_month` VALUES ('57','2016122915452724121','','1506','150.00','36','1482997527','0','0');
INSERT INTO `my_order_month` VALUES ('58','2016122915454098859','4008242001201612294385123049','1506','9.60','1','1482997540','1','1482997548');
INSERT INTO `my_order_month` VALUES ('59','GC299823618747d','2016122921001004480214937565','13213','9.60','1','1482998236','1','1482998267');
INSERT INTO `my_order_month` VALUES ('60','2016122916405839802','4008802001201612294388061554','13205','9.60','1','1483000858','1','1483000876');
INSERT INTO `my_order_month` VALUES ('61','2016122917112684657','','13223','9.60','1','1483002686','0','0');
INSERT INTO `my_order_month` VALUES ('62','GC290298882942d','2016122921001004000258950760','13230','9.60','1','1483002988','1','1483003051');
INSERT INTO `my_order_month` VALUES ('63','2016122918374954374','4009322001201612294404618597','13241','9.60','1','1483007869','1','1483007885');
INSERT INTO `my_order_month` VALUES ('64','GC291708773734d','','13136','9.60','1','1483017087','0','0');
INSERT INTO `my_order_month` VALUES ('65','2016122921113585870','','13136','150.00','36','1483017095','0','0');
INSERT INTO `my_order_month` VALUES ('66','2016122921114181531','4005532001201612294422106911','13136','9.60','1','1483017101','1','1483017134');
INSERT INTO `my_order_month` VALUES ('67','GC291745112094d','2016122921001004950224507512','13249','9.60','1','1483017451','1','1483017493');
INSERT INTO `my_order_month` VALUES ('68','GC291842008050d','','2357','9.60','1','1483018420','0','0');
INSERT INTO `my_order_month` VALUES ('69','GC291867604830d','','2357','150.00','36','1483018676','0','0');
INSERT INTO `my_order_month` VALUES ('70','GC291868405125d','','2357','9.60','1','1483018684','0','0');
INSERT INTO `my_order_month` VALUES ('71','2016122921383331136','','2357','150.00','36','1483018713','0','0');
INSERT INTO `my_order_month` VALUES ('72','2016122921383479213','','2357','150.00','36','1483018714','0','0');
INSERT INTO `my_order_month` VALUES ('73','2016122921391778442','','2357','150.00','36','1483018757','0','0');
INSERT INTO `my_order_month` VALUES ('74','2016122921402873323','4009252001201612294424169671','2357','9.60','1','1483018828','1','1483018849');
INSERT INTO `my_order_month` VALUES ('75','2016122921402956211','','2357','9.60','1','1483018829','0','0');
INSERT INTO `my_order_month` VALUES ('76','2016123009262196584','4009862001201612304454736892','6168','9.60','1','1483061181','1','1483061301');
INSERT INTO `my_order_month` VALUES ('77','GC306349375882d','','13275','9.60','1','1483063493','0','0');
INSERT INTO `my_order_month` VALUES ('78','2016123010050510728','','13275','150.00','36','1483063505','0','0');
INSERT INTO `my_order_month` VALUES ('79','2016123010051295447','4003712001201612304458499616','13275','9.60','1','1483063512','1','1483063535');
INSERT INTO `my_order_month` VALUES ('80','2016123010370359703','4007852001201612304461817949','13289','9.60','1','1483065423','1','1483065437');
INSERT INTO `my_order_month` VALUES ('81','GC306667120356d','2016123021001004090226246720','7678','9.60','1','1483066671','1','1483066715');
INSERT INTO `my_order_month` VALUES ('82','GC306960075570d','','2486','9.60','1','1483069600','0','0');
INSERT INTO `my_order_month` VALUES ('83','2016123011464962924','','2486','150.00','36','1483069609','0','0');
INSERT INTO `my_order_month` VALUES ('84','GC306964087997d','','2486','9.60','1','1483069640','0','0');
INSERT INTO `my_order_month` VALUES ('85','2016123011472711801','4003372001201612304467914224','2486','9.60','1','1483069647','1','1483069666');
INSERT INTO `my_order_month` VALUES ('86','GC307009433184d','2016123021001004640206835500','13298','9.60','1','1483070094','1','1483070127');
INSERT INTO `my_order_month` VALUES ('87','GC308287172862d','2016123021001004390205498494','13308','9.60','1','1483082871','1','1483083105');
INSERT INTO `my_order_month` VALUES ('88','GC308687748333d','','13318','9.60','1','1483086877','0','0');
INSERT INTO `my_order_month` VALUES ('89','GC308687750001d','2016123021001004610293954776','13318','9.60','1','1483086877','1','1483086902');
INSERT INTO `my_order_month` VALUES ('90','GC308707580389d','2016123021001004290202400247','13314','9.60','1','1483087075','1','1483087102');
INSERT INTO `my_order_month` VALUES ('91','GC309832391226d','','12309','9.60','1','1483098323','0','0');
INSERT INTO `my_order_month` VALUES ('92','GC309834313866d','2016123021001004990252958702','12309','9.60','1','1483098343','1','1483098359');
INSERT INTO `my_order_month` VALUES ('93','GC314434040654d','2016123121001004840262890621','5750','9.60','1','1483144340','1','1483144394');
INSERT INTO `my_order_month` VALUES ('94','GC314988473049d','2016123121001004570243970805','13339','9.60','1','1483149884','1','1483149917');
INSERT INTO `my_order_month` VALUES ('95','GC315341508738d','2016123121001004780296262930','13340','9.60','1','1483153415','1','1483153642');
INSERT INTO `my_order_month` VALUES ('96','GC316272949332d','2016123121001004100250482411','13348','9.60','1','1483162729','1','1483162796');
INSERT INTO `my_order_month` VALUES ('97','GC316978496915d','2016123121001004410207240809','13353','9.60','1','1483169784','1','1483169941');
INSERT INTO `my_order_month` VALUES ('98','H2258975781991d','','1','150.00','36','1487989757','0','0');


# 转存表中的数据：my_orderaction 


# 转存表中的数据：my_orderdetail 


# 转存表中的数据：my_orderinfo 


# 转存表中的数据：my_pay 
INSERT INTO `my_pay` VALUES ('H2236126087677d','1','200.00','0','0','0','0','1487861260','1487861260');
INSERT INTO `my_pay` VALUES ('H2236234375171d','1','200.00','0','2000','0','0','1487862343','1487862343');
INSERT INTO `my_pay` VALUES ('H2236282842243d','1','200.00','0','2000','0','0','1487862828','1487862828');
INSERT INTO `my_pay` VALUES ('H2236283980608d','1','200.00','0','2000','0','0','1487862839','1487862839');
INSERT INTO `my_pay` VALUES ('H2236501766264d','1','200.00','0','2000','0','0','1487865017','1487865017');
INSERT INTO `my_pay` VALUES ('H2244694947216d','1','300.00','0','3000','0','1','1487946949','1487946949');
INSERT INTO `my_pay` VALUES ('H2251145816010d','1','200.00','0','2000','0','0','1488011458','1488011458');
INSERT INTO `my_pay` VALUES ('H2251156437418d','1','200.00','0','2000','0','0','1488011564','1488011564');
INSERT INTO `my_pay` VALUES ('H2251179867158d','1','200.00','0','2000','0','0','1488011798','1488011798');
INSERT INTO `my_pay` VALUES ('H2251209910476d','1','200.00','0','2000','0','0','1488012099','1488012099');
INSERT INTO `my_pay` VALUES ('H2251223128432d','1','200.00','0','2000','0','0','1488012231','1488012231');
INSERT INTO `my_pay` VALUES ('H2251256104718d','1','200.00','0','2000','0','0','1488012561','1488012561');
INSERT INTO `my_pay` VALUES ('H2251265056130d','1','200.00','0','2000','0','0','1488012650','1488012650');
INSERT INTO `my_pay` VALUES ('H2251269268671d','1','200.00','0','2000','0','0','1488012692','1488012692');
INSERT INTO `my_pay` VALUES ('H2251286305346d','1','200.00','0','2000','0','0','1488012863','1488012863');
INSERT INTO `my_pay` VALUES ('H2251291054717d','1','200.00','0','2000','0','0','1488012910','1488012910');
INSERT INTO `my_pay` VALUES ('H2251291726756d','1','200.00','0','2000','0','0','1488012917','1488012917');
INSERT INTO `my_pay` VALUES ('H2251296577033d','1','200.00','0','2000','0','0','1488012965','1488012965');
INSERT INTO `my_pay` VALUES ('H2251299580105d','1','200.00','0','2000','0','0','1488012995','1488012995');
INSERT INTO `my_pay` VALUES ('H2251314668468d','1','200.00','0','2000','0','0','1488013146','1488013146');
INSERT INTO `my_pay` VALUES ('H2251320908825d','1','200.00','0','2000','0','0','1488013209','1488013209');
INSERT INTO `my_pay` VALUES ('H3017760316381d','1','200.00','0','2000','0','0','1488377603','1488377603');
INSERT INTO `my_pay` VALUES ('H3017789035823d','1','200.00','0','2000','0','0','1488377890','1488377890');


# 转存表中的数据：my_pay_month 
INSERT INTO `my_pay_month` VALUES ('1','1个月','1','9.6','1');
INSERT INTO `my_pay_month` VALUES ('2','3个月','3','25.0','1');
INSERT INTO `my_pay_month` VALUES ('3','半年','6','40.0','1');
INSERT INTO `my_pay_month` VALUES ('4','一年','12','70.0','1');
INSERT INTO `my_pay_month` VALUES ('5','三年','36','150.0','1');
INSERT INTO `my_pay_month` VALUES ('6','test0.01','1','0.1','0');


# 转存表中的数据：my_picture 


# 转存表中的数据：my_points 
INSERT INTO `my_points` VALUES ('1','0','2','0','0.0','reg','5','5','0','','1484027259','1','0');


# 转存表中的数据：my_product 


# 转存表中的数据：my_property 
INSERT INTO `my_property` VALUES ('1','0','2','模板颜色','-','3','0','0');
INSERT INTO `my_property` VALUES ('35','0','0','行业分类','','2','0','1474861946');
INSERT INTO `my_property` VALUES ('33','284','0','语言编码','-','4','0','0');
INSERT INTO `my_property` VALUES ('36','0','0','源码类型','','1','0','1476609302');
INSERT INTO `my_property` VALUES ('37','0','0','教程类型','','1','0','1476714988');


# 转存表中的数据：my_property_value 
INSERT INTO `my_property_value` VALUES ('1','1','蓝色','0');
INSERT INTO `my_property_value` VALUES ('9','1','红色','0');
INSERT INTO `my_property_value` VALUES ('33','1','橙色','0');
INSERT INTO `my_property_value` VALUES ('34','1','绿色','1474731918');
INSERT INTO `my_property_value` VALUES ('35','1','黑白','1474732055');
INSERT INTO `my_property_value` VALUES ('36','1','紫色','1474732078');
INSERT INTO `my_property_value` VALUES ('37','1','灰色','1474732090');
INSERT INTO `my_property_value` VALUES ('38','1','棕色','1474732097');
INSERT INTO `my_property_value` VALUES ('39','1','彩色','1474732106');
INSERT INTO `my_property_value` VALUES ('40','35','地方门户','1474732126');
INSERT INTO `my_property_value` VALUES ('41','36','新闻资讯','1474732137');
INSERT INTO `my_property_value` VALUES ('42','35','公司企业','1474732147');
INSERT INTO `my_property_value` VALUES ('43','35','休闲娱乐','1474732163');
INSERT INTO `my_property_value` VALUES ('44','35','简约个性','1474732256');
INSERT INTO `my_property_value` VALUES ('45','35','艺术时尚','1474732279');
INSERT INTO `my_property_value` VALUES ('46','33','UTF8','1474732318');
INSERT INTO `my_property_value` VALUES ('47','33','GBK','1474732332');
INSERT INTO `my_property_value` VALUES ('48','35','商业经济','1474863916');
INSERT INTO `my_property_value` VALUES ('49','35','教育培训','1474864222');
INSERT INTO `my_property_value` VALUES ('50','35','旅游酒店','1474864451');
INSERT INTO `my_property_value` VALUES ('51','35','婚庆摄影','1474864485');
INSERT INTO `my_property_value` VALUES ('52','35','订餐外卖','1474864601');
INSERT INTO `my_property_value` VALUES ('53','35','音乐影视','1474864624');
INSERT INTO `my_property_value` VALUES ('54','36','交友会员','1474864985');
INSERT INTO `my_property_value` VALUES ('55','35','网络科技','1474865001');
INSERT INTO `my_property_value` VALUES ('56','35','房产租赁','1474865038');
INSERT INTO `my_property_value` VALUES ('57','35','农业食品','1474865055');
INSERT INTO `my_property_value` VALUES ('58','35','交通汽车','1474865083');
INSERT INTO `my_property_value` VALUES ('59','35','生活服务','1474865135');
INSERT INTO `my_property_value` VALUES ('60','35','文化传媒','1474865193');
INSERT INTO `my_property_value` VALUES ('61','36','办公OA','1474865236');
INSERT INTO `my_property_value` VALUES ('62','35','招聘求职','1474865259');
INSERT INTO `my_property_value` VALUES ('63','35','公安政府','1474865319');
INSERT INTO `my_property_value` VALUES ('64','35','服装设计','1474865377');
INSERT INTO `my_property_value` VALUES ('65','35','医疗卫生','1474865385');
INSERT INTO `my_property_value` VALUES ('66','35','游戏','1474865396');
INSERT INTO `my_property_value` VALUES ('67','35','体育','1474865510');
INSERT INTO `my_property_value` VALUES ('68','35','图片素材','1475813123');
INSERT INTO `my_property_value` VALUES ('69','36','CMS系统','1476199660');
INSERT INTO `my_property_value` VALUES ('70','36','博客系统','1476329341');
INSERT INTO `my_property_value` VALUES ('71','36','社区论坛','1476609554');
INSERT INTO `my_property_value` VALUES ('72','36','整站栏目','1476609618');
INSERT INTO `my_property_value` VALUES ('73','36','电子商务','1476609848');
INSERT INTO `my_property_value` VALUES ('74','36','上传下载','1476610368');
INSERT INTO `my_property_value` VALUES ('75','36','微信开发','1476610857');
INSERT INTO `my_property_value` VALUES ('76','35','网络金融','1476611186');
INSERT INTO `my_property_value` VALUES ('77','35','建材装修','1476612683');
INSERT INTO `my_property_value` VALUES ('78','37','电子书','1476715007');
INSERT INTO `my_property_value` VALUES ('79','37','视频','1476715024');


# 转存表中的数据：my_role 
INSERT INTO `my_role` VALUES ('1','管理员','0','1','管理员');


# 转存表中的数据：my_role_user 


# 转存表中的数据：my_search 
INSERT INTO `my_search` VALUES ('27','0','html5','0','1','54','1477797910','0','::1','http://localhost/tag-index.html?tagname=Discuz!%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90%E7%AB%99%E6%A8%A1%E6%9D%BF');
INSERT INTO `my_search` VALUES ('19','17','响应式','1','1','27','1476812281','0','207.46.13.70','http://www.sucaihuo.com/Search-index.html?keyword=%E5%93%8D%E5%BA%94%E5%BC%8F&modelid=5');
INSERT INTO `my_search` VALUES ('17','16','html5响应式','1','1','51','1477748187','0','::1','http://localhost/Search-index.html?modelid=5&amp;keyword=html5');
INSERT INTO `my_search` VALUES ('18','16','手机模板','1','1','45','1477748189','0','::1','http://localhost/Search-index.html?modelid=5&amp;keyword=html5%E5%93%8D%E5%BA%94%E5%BC%8F');
INSERT INTO `my_search` VALUES ('20','17','后台模板','1','1','36','1476816894','0','157.55.39.130','http://www.sucaihuo.com/Search-index.html?keyword=%E5%90%8E%E5%8F%B0%E6%A8%A1%E6%9D%BF&modelid=5');
INSERT INTO `my_search` VALUES ('21','17','bootstrap','1','1','42','1477748190','0','::1','http://localhost/Search-index.html?modelid=5&amp;keyword=%E6%89%8B%E6%9C%BA%E6%A8%A1%E6%9D%BF');
INSERT INTO `my_search` VALUES ('22','17','企业模板','1','1','31','1476816878','0','157.55.39.130','http://www.sucaihuo.com/Search-index.html?keyword=%E4%BC%81%E4%B8%9A%E6%A8%A1%E6%9D%BF&modelid=5');
INSERT INTO `my_search` VALUES ('23','0','导航菜单','0','1','29','1476813863','0','157.55.39.150','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%E4%BC%81%E4%B8%9A%E6%A8%A1%E6%9D%BF');
INSERT INTO `my_search` VALUES ('28','0','弹出层','0','1','1','1474426362','0','::1','http://localhost:81/Search-index.html?keyword=%E4%BC%81%E4%B8%9A%E6%A8%A1%E6%9D%BF&modelid=5');
INSERT INTO `my_search` VALUES ('31','0','手机','0','0','1','1474729096','0','39.128.16.189','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=html5%E5%93%8D%E5%BA%94%E5%BC%8F');
INSERT INTO `my_search` VALUES ('33','0','织梦','0','1','4','1475417424','0','39.128.173.206','http://www.sucaihuo.com/tag-index.html?tagname=%E7%BB%87%E6%A2%A6');
INSERT INTO `my_search` VALUES ('34','0','html','0','1','2','1475417463','0','39.128.173.206','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=html');
INSERT INTO `my_search` VALUES ('35','0','亮剑】拼车系统 完整v1.6','0','0','3','1475911686','0','39.130.89.75','http://www.sucaihuo.com/');
INSERT INTO `my_search` VALUES ('36','0','亮剑】拼车系统','0','0','2','1476118090','0','123.125.71.89','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%E4%BA%AE%E5%89%91%E3%80%91%E6%8B%BC%E8%BD%A6%E7%B3%BB%E7%BB%9F+%E5%AE%8C%E6%95%B4v1.6');
INSERT INTO `my_search` VALUES ('37','0','方维','0','1','3','1476651297','0','123.125.71.13','http://www.sucaihuo.com/yuanma');
INSERT INTO `my_search` VALUES ('38','0','thinkphp','0','1','1','1476499707','0','39.130.89.243','http://www.sucaihuo.com/');
INSERT INTO `my_search` VALUES ('39','0','88888','0','0','265','1476659262','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?keyword=88888&modelid=${87654321-12345678}');
INSERT INTO `my_search` VALUES ('272','0','weiyoou','0','0','2','1476798460','0','140.207.124.105','http://www.sucaihuo.com/yuanma');
INSERT INTO `my_search` VALUES ('40','0','88888\' AND(SELECT 1 ','0','0','1','1476658023','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('41','0','88888 AND(SELECT 1 F','0','0','1','1476658025','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('42','0','88888%\' AND(SELECT 1','0','0','1','1476658026','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('43','0','88888\') AND(SELECT 1','0','0','1','1476658028','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('44','0','88888) AND(SELECT 1 ','0','0','1','1476658030','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('45','0','88888 AND(SELECT 1 F','0','0','1','1476658031','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('46','0','88888\' AND(SELECT 1 ','0','0','1','1476658032','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('47','0','88888%\' AND(SELECT 1','0','0','1','1476658033','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('48','0','88888%\' AND(SELECT 1','0','0','1','1476658034','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('49','0','88888,(SELECT 1 FROM','0','0','1','1476658035','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('50','0','88888 OR @`\'` AND (S','0','0','1','1476658036','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('51','0','88888 OR (SELECT 1 F','0','0','1','1476658037','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('52','0','88888\' OR (SELECT 1 ','0','0','1','1476658039','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('53','0','88888) OR (SELECT 1 ','0','0','1','1476658040','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('54','0','88888\') OR (SELECT 1','0','0','1','1476658041','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('55','0','88888\' AND 1=(UPDATE','0','0','1','1476658042','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('56','0','88888%\' AND 1=(UPDAT','0','0','1','1476658043','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('57','0','88888\') AND 1=(UPDAT','0','0','1','1476658043','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('58','0','88888) AND 1=(UPDATE','0','0','1','1476658044','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('59','0','88888 AND 1=(UPDATEX','0','0','1','1476658046','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('60','0','88888, 1=(UPDATEXML(','0','0','1','1476658047','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('61','0','88888 OR 1=(UPDATEXM','0','0','1','1476658048','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('62','0','88888\' OR 1=(UPDATEX','0','0','1','1476658050','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('63','0','88888 AND EXTRACTVAL','0','0','1','1476658051','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('64','0','88888,EXTRACTVALUE(1','0','0','1','1476658052','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('65','0','88888\' AND EXTRACTVA','0','0','1','1476658054','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('66','0','88888%\' AND EXTRACTV','0','0','1','1476658056','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('67','0','88888\') AND EXTRACTV','0','0','1','1476658058','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('68','0','88888) AND EXTRACTVA','0','0','1','1476658058','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('69','0','88888 OR EXTRACTVALU','0','0','1','1476658060','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('70','0','88888\' OR EXTRACTVAL','0','0','1','1476658061','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('71','0','88888%\' AND 1122=CON','0','0','1','1476658062','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('72','0','88888\' AND 1122=CONV','0','0','1','1476658063','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('73','0','88888\') AND 1122=CON','0','0','1','1476658064','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('74','0','88888) AND 1122=CONV','0','0','1','1476658065','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('75','0','88888 AND 1122=CONVE','0','0','1','1476658066','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('76','0','88888,(SELECT CONVER','0','0','1','1476658067','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('77','0','88888 OR 1122=CONVER','0','0','1','1476658068','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('78','0','88888\' OR 1122=CONVE','0','0','1','1476658070','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('79','0','88888 AND 1=CHAR(106','0','0','1','1476658072','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('80','0','88888\' AND 1=CHAR(10','0','0','1','1476658075','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('81','0','88888/**/AND/**/1=CH','0','0','1','1476658076','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('82','0','88888\'/**/AND/**/1=C','0','0','1','1476658077','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('83','0','88888%\' AND 1=CHAR(1','0','0','1','1476658078','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('84','0','88888\') AND 1=CHAR(1','0','0','1','1476658079','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('85','0','88888) AND 1=CHAR(10','0','0','1','1476658081','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('86','0','88888\'+(SELECT CONVE','0','0','1','1476658083','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('87','0','88888\' AND 1122=(SEL','0','0','1','1476658085','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('88','0','88888\') AND 1122=(SE','0','0','1','1476658086','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('89','0','88888%\' AND 1122=(SE','0','0','1','1476658087','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('90','0','88888) AND 1122=(SEL','0','0','1','1476658089','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('91','0','88888 AND 1122=(SELE','0','0','1','1476658089','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('92','0','88888, 1122=(SELECT ','0','0','1','1476658091','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('93','0','88888 OR 1122=(SELEC','0','0','1','1476658093','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('94','0','88888\' OR 1122=(SELE','0','0','1','1476658094','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('95','0','88888\' AND 1471=UTL_','0','0','1','1476658096','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('96','0','88888\'||CTXSYS.DRITH','0','0','1','1476658097','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('97','0','(SELECT 1 FROM(SELEC','0','0','1','1476658098','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('98','0','(UPDATEXML(1,CONCAT(','0','0','1','1476658100','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('99','0','(EXTRACTVALUE(1,CONC','0','0','1','1476658103','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('100','0','CONVERT(INT,(SELECT ','0','0','1','1476658104','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('101','0','(SELECT UPPER(XMLTyp','0','0','1','1476658105','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('102','0','(SELECT CHAR(116)+CH','0','0','1','1476658106','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('103','0','\'+CONVERT(INT,CHAR(1','0','0','1','1476658107','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('104','0','convert(int,(\'s\'elec','0','0','1','1476658107','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('105','0','88888 AND 82=11','0','0','1','1476658109','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('106','0','88888a\'','0','0','2','1476658204','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('107','0','888881','0','0','2','1476658204','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('108','0','88888) AND 45=61 AND','0','0','1','1476658114','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('109','0','88888,(SELECT (CASE ','0','0','1','1476658115','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('110','0','88888,IIF(16=57,8888','0','0','1','1476658116','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('111','0','88888,IIF(97=97,8888','0','0','1','1476658118','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('112','0','88888,(SELECT (CASE ','0','0','1','1476658119','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('113','0','(SELECT (CASE WHEN (','0','0','1','1476658120','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('114','0','IIF(39=56,88888,1/0)','0','0','1','1476658120','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('115','0','IIF(77=77,88888,1/0)','0','0','1','1476658122','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('116','0','(94=12)*88888','0','0','1','1476658123','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('117','0','88888\' AND \'I9\'=\'z4','0','0','1','1476658124','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('118','0','88888%\' AND 81=79 AN','0','0','1','1476658125','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('119','0','88888&quot; AND &quo','0','0','1','1476658127','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('120','0','88888\') AND 39=26 AN','0','0','1','1476658129','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('121','0','88888&quot;) AND 14=','0','0','1','1476658132','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('122','0','88888%\') AND 89=14 A','0','0','1','1476658135','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('123','0','88888%&quot;) AND 91','0','0','1','1476658138','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('124','0','88888 RLIKE (SELECT ','0','0','1','1476658140','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('125','0','88888 RLIKE (SELECT ','0','0','1','1476658142','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('126','0','88888) RLIKE (SELECT','0','0','1','1476658143','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('127','0','88888) RLIKE (SELECT','0','0','1','1476658144','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('128','0','88888\') RLIKE (SELEC','0','0','1','1476658146','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('129','0','88888\') RLIKE (SELEC','0','0','1','1476658147','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('130','0','88888%\' RLIKE (SELEC','0','0','1','1476658148','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('131','0','88888%\' RLIKE (SELEC','0','0','1','1476658149','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('132','0','88888\' RLIKE (SELECT','0','0','1','1476658151','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('133','0','88888\' RLIKE (SELECT','0','0','1','1476658153','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('134','0','88888\') OR 63=63 AND','0','0','1','1476658155','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('135','0','88888\' AND \'k6\' LIKE','0','0','1','1476658156','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('136','0','88888\') AND (\'qX\' LI','0','0','1','1476658157','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('137','0','88888,(SELECT (CASE ','0','0','1','1476658158','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('138','0','88888,(SELECT (CASE ','0','0','1','1476658159','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('139','0','88888,(SELECT (CASE ','0','0','1','1476658161','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('140','0','(SELECT (CASE WHEN (','0','0','1','1476658164','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('141','0','(SELECT (CASE WHEN (','0','0','1','1476658165','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('142','0','(SELECT (CASE WHEN (','0','0','1','1476658167','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('143','0','MAKE_SET(17=28,88888','0','0','1','1476658168','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('144','0','ELT(57=48,88888)','0','0','1','1476658170','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('145','0','(SELECT (CASE WHEN (','0','0','1','1476658171','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('146','0','(SELECT (CASE WHEN (','0','0','1','1476658173','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('147','0','88888 WAITFOR DELAY ','0','0','1','1476658174','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('148','0','88888 AND SLEEP(5)','0','0','1','1476658175','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('149','0','88888AND (SELECT * F','0','0','1','1476658175','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('150','0','88888; SELECT SLEEP(','0','0','1','1476658175','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('151','0','88888 AND 5=SLEEP(5)','0','0','1','1476658176','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('152','0','88888 OR 5=SLEEP(5)','0','0','2','1476658180','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('153','0','88888\' AND SLEEP(5) ','0','0','1','1476658178','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('154','0','88888) AND SLEEP(5) ','0','0','1','1476658178','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('155','0','88888\') AND SLEEP(5)','0','0','1','1476658180','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('156','0','88888,(SELECT (CASE ','0','0','1','1476658182','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('157','0','88888\'+(SELECT 1 FRO','0','0','1','1476658183','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('158','0','88888\' AND 1997=DBMS','0','0','1','1476658185','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('159','0','88888 AND 1997=DBMS_','0','0','1','1476658186','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('160','0','88888\') AND 1997=DBM','0','0','1','1476658187','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('161','0','88888 OR 1997=DBMS_P','0','0','1','1476658193','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('162','0','88888 5','0','0','1','1476658197','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('163','0','88888 OR 1997=DBMS_P','0','0','1','1476658199','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('164','0','88888; 1997=DBMS_PIP','0','0','1','1476658199','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('165','0','88888%\' AND 1997=DBM','0','0','1','1476658200','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('166','0','88888 AND PG_SLEEP(5','0','0','1','1476658201','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('167','0','88888;SELECT PG_SLEE','0','0','1','1476658201','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('168','0','88888 AND 1997=PG_SL','0','0','1','1476658202','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('169','0','88888\' AND PG_SLEEP(','0','0','1','1476658203','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('170','0','88888AND 1997=(SELEC','0','0','1','1476658203','0','218.30.118.78','');
INSERT INTO `my_search` VALUES ('171','0','88888&lt;script&gt;a','0','0','1','1476658211','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<script>alert(42873)</script>');
INSERT INTO `my_search` VALUES ('181','0','88888&lt;body ONLOAD','0','0','1','1476658300','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<body ONLOAD=alert(42873)>');
INSERT INTO `my_search` VALUES ('172','0','88888&lt;img src=1 o','0','0','1','1476658218','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<img src=1 onerror=alert(42873)>');
INSERT INTO `my_search` VALUES ('173','0','88888&lt;div style=w','0','0','1','1476658226','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<div style=width:expression(alert(42873))>');
INSERT INTO `my_search` VALUES ('174','0','88888&lt;script src=','0','0','1','1476658232','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<script src=http://xxooxxoo.js></script>');
INSERT INTO `my_search` VALUES ('176','0','88888&quot; onmousem','0','0','1','1476658250','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\"%20onmousemove=alert(42873)%20wb=\"');
INSERT INTO `my_search` VALUES ('175','0','88888+/v9 +ADw-scrip','0','0','1','1476658240','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888%2B%2Fv9+%2BADw-script%2BAD4-alert%281%29%2BADw-%2Fscript%2BAD4-');
INSERT INTO `my_search` VALUES ('178','0','88888&quot; onmousem','0','0','1','1476658270','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\"%20onmousemove=\'alert(42873)\'wb=\"');
INSERT INTO `my_search` VALUES ('177','0','88888&lt;a href=&amp','0','0','1','1476658260','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<a%20href%3D%26%23106%26%2397%26%23118%26%2397%26%23115%26%2399%26%23114%26%23105%26%23112%26%23116%26%2358%26%2397%26%23108%26%23101%26%23114%26%23116%26%2340%26%2349%26%2350%26%2351%26%2352%26');
INSERT INTO `my_search` VALUES ('179','0','88888&quot; onmouseo','0','0','1','1476658280','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\" onmouseover=prompt(42873) bad=\"');
INSERT INTO `my_search` VALUES ('180','0','88888&lt;iframe SRC=','0','0','1','1476658290','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<iframe SRC=javascript:alert(42873)>');
INSERT INTO `my_search` VALUES ('187','0','88888\'','0','0','1','1476658360','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\'');
INSERT INTO `my_search` VALUES ('186','0','88888&lt;iframe src=','0','0','1','1476658350','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<iframe src=http://xxooxxoo.js>');
INSERT INTO `my_search` VALUES ('182','0','88888&lt;object data','0','0','1','1476658310','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<object data=data:text/html;base64,PHNjcmlwdD5hbGVydCg0Mjg3Myk8L3NjcmlwdD4=>');
INSERT INTO `my_search` VALUES ('183','0','88888&lt;EMBED SRC=j','0','0','1','1476658320','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<EMBED SRC=javascript:alert(42873)></EMBED>');
INSERT INTO `my_search` VALUES ('184','0','88888&lt;BASE HREF=&','0','0','1','1476658330','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888<BASE HREF=\"javascript:alert(42873);//\">');
INSERT INTO `my_search` VALUES ('185','0','88888&quot; onmouseo','0','0','1','1476658340','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\" onmouseover=propromptmpt(42873) bad=\"');
INSERT INTO `my_search` VALUES ('188','0','88888%27','0','0','1','1476658370','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888%2527');
INSERT INTO `my_search` VALUES ('189','0','88888\0\'','0','0','1','1476658380','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888%00\'');
INSERT INTO `my_search` VALUES ('190','0','88888\\\'','0','0','1','1476658390','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\\\'');
INSERT INTO `my_search` VALUES ('191','0','88888\\&quot;','0','0','1','1476658400','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\\\"');
INSERT INTO `my_search` VALUES ('192','0','88888JyI=','0','0','1','1476658410','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888JyI%3D');
INSERT INTO `my_search` VALUES ('193','0','88888\'&quot;','0','0','2','1476658501','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\'\"');
INSERT INTO `my_search` VALUES ('194','0','88888e360','0','0','1','1476658441','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888e360');
INSERT INTO `my_search` VALUES ('195','0','888886633x3X6','0','0','1','1476658451','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=888886633x3X6');
INSERT INTO `my_search` VALUES ('196','0','88888\'[.](,.)(&quot;','0','0','1','1476658471','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888\'[.](,.)(\"');
INSERT INTO `my_search` VALUES ('197','0','88888[]','0','0','1','1476658481','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888[]');
INSERT INTO `my_search` VALUES ('198','0','88888/','0','0','1','1476658511','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888/');
INSERT INTO `my_search` VALUES ('199','0','88888)','0','0','1','1476658521','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888)');
INSERT INTO `my_search` VALUES ('200','0','88888!(()','0','0','1','1476658531','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888!(%28%29&%26%21%7C*|%2A%7C');
INSERT INTO `my_search` VALUES ('201','0','88888alert(42873)','0','0','1','1476658541','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=88888alert(42873)');
INSERT INTO `my_search` VALUES ('207','0','C:\\boot.ini','0','0','1','1476658611','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=C:\\boot.ini');
INSERT INTO `my_search` VALUES ('202','0','../../../../../../..','0','0','1','1476658551','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../boot.ini');
INSERT INTO `my_search` VALUES ('203','0','../../../../../../..','0','0','1','1476658561','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../boot.ini%00');
INSERT INTO `my_search` VALUES ('204','0','../../../../../../..','0','0','1','1476658581','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../boot.ini%00.jpg');
INSERT INTO `my_search` VALUES ('206','0','/.\\\\./.\\\\./.\\\\./.\\\\.','0','0','1','1476658601','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=/.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./boot.ini');
INSERT INTO `my_search` VALUES ('205','0','../../../../../../..','0','0','1','1476658591','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../boot.ini%00.html');
INSERT INTO `my_search` VALUES ('215','0','file:///c:/boot.ini','0','0','1','1476658701','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=file:///c:/boot.ini');
INSERT INTO `my_search` VALUES ('208','0','..\\..\\..\\..\\..\\..\\..','0','0','1','1476658621','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=..\\..\\..\\..\\..\\..\\..\\..\\boot.ini');
INSERT INTO `my_search` VALUES ('209','0','../..//../..//../../','0','0','1','1476658631','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../..//../..//../..//../..//../..//../..//../..//../..//boot.ini');
INSERT INTO `my_search` VALUES ('211','0','&lt;..\\..\\..\\..\\..\\.','0','0','1','1476658661','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=<..\\..\\..\\..\\..\\..\\..\\..\\boot.ini');
INSERT INTO `my_search` VALUES ('210','0','../.../.././../.../.','0','0','1','1476658641','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../.../.././../.../.././../.../.././../.../.././../.../.././../.../.././boot.ini');
INSERT INTO `my_search` VALUES ('212','0','|..\\..\\..\\..\\..\\..\\.','0','0','1','1476658671','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=|..\\..\\..\\..\\..\\..\\..\\..\\boot.ini');
INSERT INTO `my_search` VALUES ('213','0','../../../../../../..','0','0','1','1476658681','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../boot.ini%00.htm');
INSERT INTO `my_search` VALUES ('214','0','../../../../../../..','0','0','1','1476658691','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../boot.ini%00.txt');
INSERT INTO `my_search` VALUES ('216','0','................wind','0','0','1','1476658711','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=................windowswin.ini');
INSERT INTO `my_search` VALUES ('217','0','../../../../../../..','0','0','1','1476658721','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../etc/passwd');
INSERT INTO `my_search` VALUES ('218','0','../../../../../../..','0','0','1','1476658731','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../etc/passwd%00');
INSERT INTO `my_search` VALUES ('219','0','../../../../../../..','0','0','1','1476658741','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%00../../../../../../../../etc/passwd');
INSERT INTO `my_search` VALUES ('223','0','/etc/passwd','0','0','1','1476658781','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=/etc/passwd');
INSERT INTO `my_search` VALUES ('220','0','../../../../../../..','0','0','1','1476658751','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../etc/passwd%00.html');
INSERT INTO `my_search` VALUES ('221','0','../../../../../../..','0','0','1','1476658761','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../../../../../../../../etc/passwd%00.jpg');
INSERT INTO `my_search` VALUES ('222','0','.\\\\./.\\\\./.\\\\./.\\\\./','0','0','1','1476658771','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./etc/passwd');
INSERT INTO `my_search` VALUES ('224','0','/./././././././etc/p','0','0','1','1476658793','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=/./././././././etc/passwd');
INSERT INTO `my_search` VALUES ('236','0','................etc/','0','0','1','1476658933','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=................etc/passwd');
INSERT INTO `my_search` VALUES ('225','0','..\\..\\..\\..\\..\\..\\..','0','0','1','1476658803','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=..\\..\\..\\..\\..\\..\\..\\..\\etc/passwd');
INSERT INTO `my_search` VALUES ('227','0','&lt;../../../../../.','0','0','1','1476658834','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=<../../../../../../../../etc/passwd');
INSERT INTO `my_search` VALUES ('226','0','../.../.././../.../.','0','0','1','1476658813','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../.../.././../.../.././../.../.././../.../.././../.../.././../.../.././etc/passwd');
INSERT INTO `my_search` VALUES ('228','0','|../../../../../../.','0','0','1','1476658843','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=|../../../../../../../../etc/passwd');
INSERT INTO `my_search` VALUES ('229','0','file:///etc/passwd','0','0','1','1476658863','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=file:///etc/passwd');
INSERT INTO `my_search` VALUES ('235','0','..\\..\\..\\..\\..\\..\\..','0','0','1','1476658923','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=..\\..\\..\\..\\..\\..\\..\\..\\/etc/passwd');
INSERT INTO `my_search` VALUES ('230','0','../..//../..//../../','0','0','1','1476658873','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=../..//../..//../..//../..//../..//../..//../..//../..//etc/passwd');
INSERT INTO `my_search` VALUES ('231','0','../../../../../../..','0','0','1','1476658883','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd');
INSERT INTO `my_search` VALUES ('232','0','../../../../../../..','0','0','1','1476658893','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2F..%2Fetc%2Fpasswd%00');
INSERT INTO `my_search` VALUES ('233','0','..0x5c..0x5c..0x5c..','0','0','1','1476658903','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=..0x5c..0x5c..0x5c..0x5c..0x5c..0x5c..0x5c..0x5cetc/passwd');
INSERT INTO `my_search` VALUES ('234','0','.../.../.../.../.../','0','0','1','1476658913','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=.../.../.../.../.../.../.../.../etc/passwd');
INSERT INTO `my_search` VALUES ('245','0','dir','0','0','1','1476659034','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=dir');
INSERT INTO `my_search` VALUES ('237','0','../../../../../../..','0','0','1','1476658953','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/etc/passwd');
INSERT INTO `my_search` VALUES ('240','0','http://some-inexiste','0','0','1','1476658983','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=http://some-inexistent-website.com/some_inexistent_file_with_long_name');
INSERT INTO `my_search` VALUES ('238','0','../../../../../../..','0','0','1','1476658963','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2fetc/passwd');
INSERT INTO `my_search` VALUES ('239','0','..\\..\\..\\..\\..\\..\\..','0','0','1','1476658973','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5c%2e%2e%5cetc/passwd');
INSERT INTO `my_search` VALUES ('241','0','/some_inexistent_fil','0','0','1','1476658993','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=/some_inexistent_file_with_long_name');
INSERT INTO `my_search` VALUES ('242','0','SomeCustomInjectedHe','0','0','1','1476659003','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%0d%0a%20SomeCustomInjectedHeader%3Ainjected_by_test');
INSERT INTO `my_search` VALUES ('243','0','SomeCustomInjectedHe','0','0','1','1476659013','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%0a%20SomeCustomInjectedHeader%3Ainjected_by_test');
INSERT INTO `my_search` VALUES ('244','0','SomeCustomInjectedHe','0','0','1','1476659024','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%0d%0a%20SomeCustomInjectedHeader:injected_by_test');
INSERT INTO `my_search` VALUES ('246','0','&lt;dir','0','0','1','1476659044','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=<dir');
INSERT INTO `my_search` VALUES ('247','0','http://oxoxoxoxoxoxo','0','0','1','1476659054','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=http://oxoxoxoxoxoxox.com');
INSERT INTO `my_search` VALUES ('248','0','oxoxoxoxoxoxox.com','0','0','1','1476659063','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=oxoxoxoxoxoxox.com');
INSERT INTO `my_search` VALUES ('250','0',';print(md5(1122));#','0','0','1','1476659084','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=;print(md5(1122));%23');
INSERT INTO `my_search` VALUES ('249','0','+/v9 +ADw-script+AD4','0','0','1','1476659074','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%2B%2Fv9+%2BADw-script%2BAD4-alert%281%29%2BADw-%2Fscript%2BAD4-');
INSERT INTO `my_search` VALUES ('251','0','\');print(md5(1122));','0','0','1','1476659094','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=\');print(md5(1122));//');
INSERT INTO `my_search` VALUES ('252','0','${@print(md5(1122))}','0','0','1','1476659104','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=${@print(md5(1122))}');
INSERT INTO `my_search` VALUES ('254','0','phpinfo','0','0','1','1476659124','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=phpinfo');
INSERT INTO `my_search` VALUES ('253','0','data:text/plain,&lt;','0','0','1','1476659114','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=data:text/plain,%3C%3Fphp%20print%28md5%281122%29%29%3B%3F%3E');
INSERT INTO `my_search` VALUES ('255','0','&lt;?exit(md5(1122))','0','0','1','1476659134','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=<?exit(md5(1122));?>');
INSERT INTO `my_search` VALUES ('256','0','\'];print(md5(1122));','0','0','1','1476659144','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=\'];print(md5(1122));//');
INSERT INTO `my_search` VALUES ('257','0','&lt;?php print(md5(1','0','0','1','1476659154','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=<?php print(md5(1122));exit;?>');
INSERT INTO `my_search` VALUES ('259','0',';${@print(md5(1122))','0','0','1','1476659175','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=;${@print(md5(1122))};');
INSERT INTO `my_search` VALUES ('258','0','die(md5($_get[websca','0','0','1','1476659164','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=die(md5($_get[webscan]));&webscan=1122');
INSERT INTO `my_search` VALUES ('260','0','\';?&gt;&lt;?exit(md5','0','0','1','1476659184','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=\';?><?exit(md5(1122));?>');
INSERT INTO `my_search` VALUES ('261','0','http://hitBAo6EKQnyr','0','0','1','1476659194','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=http://hitBAo6EKQnyr.bxss.me/');
INSERT INTO `my_search` VALUES ('262','0','http://hitd0rQGQge8t','0','0','1','1476659204','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=http://hitd0rQGQge8t.bxss.me/');
INSERT INTO `my_search` VALUES ('264','0','set|set','0','0','1','1476659223','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=set|set&set');
INSERT INTO `my_search` VALUES ('263','0','http://testasp.vulnw','0','0','1','1476659214','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=http://testasp.vulnweb.com/t/fit.txt');
INSERT INTO `my_search` VALUES ('265','0',';cat /etc/passwd;','0','0','1','1476659230','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=;cat /etc/passwd;');
INSERT INTO `my_search` VALUES ('266','0','`ping -c 5 127.0.0.1','0','0','1','1476659236','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=`ping -c 5 127.0.0.1`');
INSERT INTO `my_search` VALUES ('267','0','|ping -n 5 127.0.0.1','0','0','1','1476659243','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=|ping -n 5 127.0.0.1|');
INSERT INTO `my_search` VALUES ('268','0','|ping -c 4 127.0.0.1','0','0','1','1476659251','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=%7Cping+-c+4+127.0.0.1');
INSERT INTO `my_search` VALUES ('270','0','${87654321-12345678}','0','0','1','1476659265','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=${87654321-12345678}');
INSERT INTO `my_search` VALUES ('269','0','response.write(94124','0','0','1','1476659257','0','218.30.118.78','http://www.sucaihuo.com/Search-index.html?modelid=5&keyword=response.write(9412458*9542755)');
INSERT INTO `my_search` VALUES ('271','0','thinkphp网站下载','0','0','1','1476674930','0','60.219.152.245','http://www.sucaihuo.com/');
INSERT INTO `my_search` VALUES ('273','0','&lt;','0','0','1','1477748193','0','::1','http://localhost/Search-index.html?modelid=5&amp;keyword=bootstrap');
INSERT INTO `my_search` VALUES ('274','0','&lt;&gt;','0','0','1','1477748198','0','::1','http://localhost/Search-index.html?modelid=5&amp;keyword=%3C');
INSERT INTO `my_search` VALUES ('275','0','b2c','0','0','3','1478782522','0','::1','http://localhost/thinkphp-48.html');


# 转存表中的数据：my_soft 
INSERT INTO `my_soft` VALUES ('3','织梦dedecms旅游图片类网站模板下载','','','/uploads/img1/20160924/57e6694ea3136.jpg!300X300.jpg','','<p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e6694ea3136.jpg\" title=\"57e6694ea3136.jpg\" alt=\"57df5ee75892a.jpg\"/></p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e6696a6d408.jpg\" title=\"57e6696a6d408.jpg\" alt=\"57df5ee6651e2.jpg\"/></p><p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e669a967256.jpg\" title=\"57e669a967256.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e669a9c6d3a.jpg\" title=\"57e669a9c6d3a.jpg\"/></p><p><br/></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>一、★模板介绍★&nbsp;</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、dedecms旅游图片网站模板，测试完整无错，兼容主流浏览器。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2、模板包含安装说明，并包含测试数据（安装完成后还原数据库即可）。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3、本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换或联系作者转换。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4、如果您下载完成后不会安装，请根据压缩包内的联系方式联系作者免费协助安装。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>二、★模板安装方法★</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1. 用FTP将安装包上传到服务器解压（或者解压在上传，本地服务器可以忽略此步骤）</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2. http://您的域名/install/ 进入到安装界面， 按照正常步骤安装即可；不要修改数据库表前缀，否则会造成原先数据无法恢复；</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3. 安装完成后，进入后台 -&gt; 系统 -&gt; 数据库还原数据 -&gt; 还原数据；</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4. 系统 -&gt; 系统基本参数 -&gt; 站点根网址； 把网址改成你的域名</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5. 更新全站缓存</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6. 最后重新生成全站就搞定了（首页生成的时候可以选择生成动态页面和静态页面，自己可以选择）</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>三、★帐号及密码★</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、后台登录账号：admin 登录密码：admin</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2、百度网盘提取密码：8pqj</p><p><br/></p>','','http://pan.baidu.com/s/1c110Flu','一、★模板介绍★ 1、dedecms旅游图片网站模板，测试完整无错，兼容主流浏览器。2、模板包含安装说明，并包含测试数据（安装完成后还原数据库即可）。3、本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换','dedecms5.7','1','0','1','','','','1474717350','1476450933','37','17','1','15','','1','0','1','织梦dedecms,旅游图片,网站模板','','3','0','1,50,46');
INSERT INTO `my_soft` VALUES ('4','织梦HTML5响应式儿童服装类模板下载','','','/uploads/img1/20160924/57e671d027948.jpg!300X300.jpg','','<p><br/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e671d027948.jpg\" alt=\"织梦HTML5响应式儿童服装类模板PC版\" title=\"织梦HTML5响应式儿童服装类模板PC版\"/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e671d225dc5.jpg\" alt=\"织梦HTML5响应式儿童服装类模板PC版\" title=\"织梦HTML5响应式儿童服装类模板PC版\"/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e671d1284dd.jpg\" alt=\"织梦HTML5响应式儿童服装类模板PC版\" title=\"织梦HTML5响应式儿童服装类模板PC版\"/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e671d2a4d04.jpg\" alt=\"织梦HTML5响应式儿童服装类模板手机版\" title=\"织梦HTML5响应式儿童服装类模板手机版\"/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e671d34f5cf.jpg\" alt=\"织梦HTML5响应式儿童服装类模板手机版\" title=\"织梦HTML5响应式儿童服装类模板手机版\"/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e671d373006.jpg\" alt=\"织梦HTML5响应式儿童服装类模板手机版\" title=\"织梦HTML5响应式儿童服装类模板手机版\"/></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20160924/57e67226e2bca.jpg\" alt=\"织梦HTML5响应式儿童服装类模板手机版\" title=\"织梦HTML5响应式儿童服装类模板手机版\"/></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>一、★模板介绍★&nbsp;</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、HTML5响应式儿童服装类dedecms模板，测试完整无错，兼容主流浏览器。</p><p style=\"text-indent: 2em; line-height: 2em;\">2、模板包含安装说明，并包含测试数据。</p><p style=\"text-indent: 2em; line-height: 2em;\">3、本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>二、★模板安装方法★</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、下载最新的织梦dedecms5.7 UTF-8版本。</p><p style=\"text-indent: 2em; line-height: 2em;\">下载网址：http://www.dedecms.com/products/dedecms/downloads/</p><p style=\"text-indent: 2em; line-height: 2em;\">2、解压下载的织梦安装包，得到docs和uploads两个文件夹，请将uploads里面的所有文件和文件夹上传到你的网站根目录</p><p style=\"text-indent: 2em; line-height: 2em;\">3、安装dede系统。(如果您已经安装,请跳过本步.)</p><p style=\"text-indent: 2em; line-height: 2em;\">直接运行：http://您的域名/install</p><p style=\"text-indent: 2em; line-height: 2em;\">4、将web文件夹内的所有文件夹上传并覆盖到织梦的安装目录;</p><p style=\"text-indent: 2em; line-height: 2em;\">5、登陆后台并还原数据库：</p><p style=\"text-indent: 2em; line-height: 2em;\">1）进入dede后台，找到&#39;系统&#39;-&#39;数据库备份/还原&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">2）在屏幕右上角点击&#39;数据还原&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">3）点击屏幕下方的&#39;开始还原&#39;按钮</p><p style=\"text-indent: 2em; line-height: 2em;\">6、确定网站风格（无论是否修改，都点击一下确定）：</p><p style=\"text-indent: 2em; line-height: 2em;\">1）点击&#39;系统&#39;---系统基本参数</p><p style=\"text-indent: 2em; line-height: 2em;\">2）将&#39;站点根网址&#39;改为您的网址，如http://www.xxx.com/（本地安装请保持http://127.0.0.1。）</p><p style=\"text-indent: 2em; line-height: 2em;\">3）点击&#39;确定&#39;按钮&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">7、更新整站缓存：</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;更新系统缓存&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">8、更新网站：</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;一键更新网站 &#39;-更新所有-开始更新</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;更新主页html&#39;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>三、★帐号及密码★</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、后台帐号：admin &nbsp;密码：admin</p><p style=\"text-indent: 2em; line-height: 2em;\">2、百度网盘提取密码：910s</p><p><br/></p>','','http://pan.baidu.com/s/1i5nt9Gx','一、★模板介绍★ 1、HTML5响应式儿童服装类dedecms模板，测试完整无错，兼容主流浏览器。2、模板包含安装说明，并包含测试数据。3、本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换。二、★模板安','dedecms5.7','1','0','1','','29MB','','1474719649','1476450918','29','17','1','1','','1','0','1','织梦HTML5,响应式,儿童服装模板,模板下载','','1','10','35,37,42,45,64,46');
INSERT INTO `my_soft` VALUES ('5','织梦响应式化妆品类网站模板下载','','','/uploads/img1/20160925/57e6bf2acca8f.jpg!300X300.jpg','','<p><br/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6bf2acca8f.jpg\" alt=\"织梦响应式化妆品类网站模板下载\" title=\"织梦响应式化妆品类网站模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6bf2f0b87c.jpg\" alt=\"织梦响应式化妆品类网站模板下载\" title=\"织梦响应式化妆品类网站模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6bf30315c7.jpg\" alt=\"织梦响应式化妆品类网站模板下载\" title=\"织梦响应式化妆品类网站模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6bf31e0f2b.jpg\" alt=\"织梦响应式化妆品类网站模板下载\" title=\"织梦响应式化妆品类网站模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6bf3405aaa.jpg\" alt=\"织梦响应式化妆品类网站模板下载\" title=\"织梦响应式化妆品类网站模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6bf35459ac.jpg\" alt=\"织梦响应式化妆品类网站模板下载\" title=\"织梦响应式化妆品类网站模板下载\"/></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">一、★模板介绍★&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、织梦响应式化妆品类网站模板，测试完整无错，兼容主流浏览器。</p><p style=\"text-indent: 2em; line-height: 2em;\">2、模板包含安装说明，并包含测试数据。</p><p style=\"text-indent: 2em; line-height: 2em;\">3、本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">二、★模板安装方法★</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、下载最新的织梦dedecms5.7 UTF-8版本。</p><p style=\"text-indent: 2em; line-height: 2em;\">下载网址：http://www.dedecms.com/products/dedecms/downloads/</p><p style=\"text-indent: 2em; line-height: 2em;\">2、解压下载的织梦安装包，得到docs和uploads两个文件夹，请将uploads里面的所有文件和文件夹上传到你的网站根目录</p><p style=\"text-indent: 2em; line-height: 2em;\">3、安装dede系统。(如果您已经安装,请跳过本步.)</p><p style=\"text-indent: 2em; line-height: 2em;\">直接运行：http://您的域名/install</p><p style=\"text-indent: 2em; line-height: 2em;\">4、将web文件夹内的所有文件夹上传并覆盖到织梦的安装目录;</p><p style=\"text-indent: 2em; line-height: 2em;\">5、登陆后台并还原数据库：</p><p style=\"text-indent: 2em; line-height: 2em;\">1）进入dede后台，找到&#39;系统&#39;-&#39;数据库备份/还原&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">2）在屏幕右上角点击&#39;数据还原&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">3）点击屏幕下方的&#39;开始还原&#39;按钮</p><p style=\"text-indent: 2em; line-height: 2em;\">6、确定网站风格（无论是否修改，都点击一下确定）：</p><p style=\"text-indent: 2em; line-height: 2em;\">1）点击&#39;系统&#39;---系统基本参数</p><p style=\"text-indent: 2em; line-height: 2em;\">2）将&#39;站点根网址&#39;改为您的网址，如http://www.xxx.com/（本地安装请保持http://127.0.0.1。）</p><p style=\"text-indent: 2em; line-height: 2em;\">3）点击&#39;确定&#39;按钮&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">7、更新整站缓存：</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;更新系统缓存&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">8、更新网站：</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;一键更新网站 &#39;-更新所有-开始更新</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;更新主页html&#39;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">三、★百度云盘提取密码：3b9e ★</p><p><br/></p>','','http://pan.baidu.com/s/1hrKpyhI','一、★模板介绍★ 1、织梦响应式化妆品类网站模板，测试完整无错，兼容主流浏览器。2、模板包含安装说明，并包含测试数据。3、本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换。二、★模板安装方法★1、下载最','dedecms5.7','1','0','1','','','','1474739685','1476450900','53','17','1','1','','1','0','1','织梦响应式,化妆品模板,网站模板下载','','4','0','35,42,45,46');
INSERT INTO `my_soft` VALUES ('6','dedecms金融投资类企业模板下载','','','/uploads/img1/20160925/57e6c1c2d9340.jpg!300X300.jpg','','<p><br/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6c1c2d9340.jpg\" alt=\"dedecms金融投资类企业模板下载\" title=\"dedecms金融投资类企业模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6c1c35760c.jpg\" alt=\"dedecms金融投资类企业模板下载\" title=\"dedecms金融投资类企业模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6c1c3b1f71.jpg\" alt=\"dedecms金融投资类企业模板下载\" title=\"dedecms金融投资类企业模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6c1c51ea98.jpg\" alt=\"dedecms金融投资类企业模板下载\" title=\"dedecms金融投资类企业模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6c1c603509.jpg\" alt=\"dedecms金融投资类企业模板下载\" title=\"dedecms金融投资类企业模板下载\"/></p><p style=\"text-align: center\"><img src=\"/uploads/img1/20160925/57e6c1c6eca09.jpg\" alt=\"dedecms金融投资类企业模板下载\" title=\"dedecms金融投资类企业模板下载\"/></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>一、★模板介绍★&nbsp;</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、dedecms金融投资类企业模板，测试完整无错，兼容主流浏览器。</p><p style=\"text-indent: 2em; line-height: 2em;\">2、模板包含安装说明，并包含测试数据。</p><p style=\"text-indent: 2em; line-height: 2em;\">3、本模板基于DEDECms 5.7 GBK设计，需要UTF-8版本的请自己转换。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>二、★模板安装方法★</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、下载最新的织梦dedecms5.7 GBK版本。</p><p style=\"text-indent: 2em; line-height: 2em;\">下载网址：http://www.dedecms.com/products/dedecms/downloads/</p><p style=\"text-indent: 2em; line-height: 2em;\">2、解压下载的织梦安装包，得到docs和uploads两个文件夹，请将uploads里面的所有文件和文件夹上传到你的网站根目录</p><p style=\"text-indent: 2em; line-height: 2em;\">3、安装dede系统。(如果您已经安装,请跳过本步.)</p><p style=\"text-indent: 2em; line-height: 2em;\">直接运行：http://您的域名/install</p><p style=\"text-indent: 2em; line-height: 2em;\">4、将web文件夹内的所有文件夹上传并覆盖到织梦的安装目录;</p><p style=\"text-indent: 2em; line-height: 2em;\">5、登陆后台并还原数据库：</p><p style=\"text-indent: 2em; line-height: 2em;\">1）进入dede后台，找到&#39;系统&#39;-&#39;数据库备份/还原&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">2）在屏幕右上角点击&#39;数据还原&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">3）点击屏幕下方的&#39;开始还原&#39;按钮</p><p style=\"text-indent: 2em; line-height: 2em;\">6、确定网站风格（无论是否修改，都点击一下确定）：</p><p style=\"text-indent: 2em; line-height: 2em;\">1）点击&#39;系统&#39;---系统基本参数</p><p style=\"text-indent: 2em; line-height: 2em;\">2）将&#39;站点根网址&#39;改为您的网址，如http://www.xxx.com/（本地安装请保持http://127.0.0.1。）</p><p style=\"text-indent: 2em; line-height: 2em;\">3）点击&#39;确定&#39;按钮&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">7、更新整站缓存：</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;更新系统缓存&#39;</p><p style=\"text-indent: 2em; line-height: 2em;\">8、更新网站：</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;一键更新网站 &#39;-更新所有-开始更新</p><p style=\"text-indent: 2em; line-height: 2em;\">点击&#39;生成&#39;-&#39;更新主页html&#39;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>三、百度云盘提取密码：p3wu</strong></p><p><br/></p>','','http://pan.baidu.com/s/1hshqbmG\r|||http://www.ichang8.com','一、★模板介绍★ 1、dedecms金融投资类企业模板，测试完整无错，兼容主流浏览器。2、模板包含安装说明，并包含测试数据。3、本模板基于DEDECms 5.7 GBK设计，需要UTF-8版本的请自己转换。二、★模板安装方法★1、','dedecms5.7','1','0','1','','44MB','','1474740495','1476450870','73','17','1','1','','1','0','1','dedecms,金融投资模板,企业模板下载','','8','0','1,42,46');
INSERT INTO `my_soft` VALUES ('7','织梦蓝色制冷机械设备模板（带手机网站）','','','/uploads/img1/20161001/57ef2cdf3a679.jpg!300X300.jpg','/uploads/img1/20161001/57ef8d25629b3.jpg$$$首页|||/uploads/img1/20161001/57ef8d3d6b10d.jpg$$$公司介绍|||/uploads/img1/20161001/57ef8d5b0673a.jpg$$$产品展示|||/uploads/img1/20161001/57ef8d633477f.jpg$$$文章列表|||/uploads/img1/20161001/57ef8d69cad45.jpg$$$文章详情页|||/uploads/img1/20161001/57ef8d7011fdb.jpg$$$荣誉资质|||/uploads/img1/20161001/57ef8d7566333.jpg$$$手机站首页|||/uploads/img1/20161001/57ef8d79c4484.jpg$$$手机站产品展示页|||/uploads/img1/20161001/57ef900d75e23.jpg$$$手机站文章页|||/uploads/img1/20161001/57ef901427ade.jpg$$$手机站文章详情页','<p><strong>★模板介绍★&nbsp;</strong></p><p><br/></p><p>蓝色制冷机械设备织梦模板（带手机版），测试完整无错，兼容主流浏览器。</p><p>模板包含安装说明，并包含测试数据。</p><p>本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换。</p><p><br/></p><p><strong>★模板安装方法★</strong></p><p><br/></p><p>1、下载最新的织梦dedecms5.7 UTF-8版本。</p><p>下载网址：http://www.dedecms.com/products/dedecms/downloads/</p><p>2、解压下载的织梦安装包，得到docs和uploads两个文件夹，请将uploads里面的所有文件和文件夹上传到你的网站根目录</p><p>3、安装dede系统。(如果您已经安装,请跳过本步.)</p><p>直接运行：http://您的域名/install</p><p>4、将web文件夹内的所有文件夹上传并覆盖到织梦的安装目录;</p><p>5、登陆后台并还原数据库：</p><p>1）进入dede后台，找到&#39;系统&#39;-&#39;数据库备份/还原&#39;</p><p>2）在屏幕右上角点击&#39;数据还原&#39;</p><p>3）点击屏幕下方的&#39;开始还原&#39;按钮</p><p>6、确定网站风格（无论是否修改，都点击一下确定）：</p><p>1）点击&#39;系统&#39;---系统基本参数</p><p>2）将&#39;站点根网址&#39;改为您的网址，如http://www.xxx.com/（本地安装请保持http://127.0.0.1。）</p><p>3）点击&#39;确定&#39;按钮&nbsp;</p><p>7、更新整站缓存：</p><p>点击&#39;生成&#39;-&#39;更新系统缓存&#39;</p><p>8、更新网站：</p><p>点击&#39;生成&#39;-&#39;一键更新网站 &#39;-更新所有-开始更新</p><p>点击&#39;生成&#39;-&#39;更新主页html&#39;</p><p><br/></p><p><strong>百度网盘提取密码：erej</strong></p><p><br/></p>','','http://pan.baidu.com/s/1o8B6svK','★模板介绍★ 蓝色制冷机械设备织梦模板（带手机版），测试完整无错，兼容主流浏览器。模板包含安装说明，并包含测试数据。本模板基于DEDECms 5.7 UTF-8设计，需要GBK版本的请自己转换。★模板安装方法★1、下载最新的织梦d','dedecms5.7','1','0','1','','3.15M','','1475292110','1476450845','57','17','1','1','','1','0','1','织梦,蓝色,制冷机械设备模板,手机网站','','5','0','1,42,46');
INSERT INTO `my_soft` VALUES ('8','discuz【亮剑】拼车系统完整商业版2.2.2价值488元免费分享','','','/uploads/img1/20161002/57f11d8a49ca2.png!300X300.jpg','/uploads/img1/20161002/57f11d8a49ca2.png$$$首页|||/uploads/img1/20161003/57f1c5ef97656.png$$$长途拼车|||/uploads/img1/20161003/57f1c60b64840.png$$$上下班拼车|||/uploads/img1/20161003/57f1c6188bdd8.png$$$其他拼车','<p style=\"text-indent: 2em; line-height: 2em;\"><strong>discuz【亮剑】拼车系统完整商业版2.2.2程序更新公告：</strong><br/></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.优化列表页检索链接</p><p style=\"text-indent: 2em; line-height: 2em;\">2.插件发布信息上传图片路径自定义（自定义的文件夹必须存在）</p><p style=\"text-indent: 2em; line-height: 2em;\">3.修复常用设置未传图默认图片上传失效问题</p><p style=\"text-indent: 2em; line-height: 2em;\">4.添加PC端列表页信息显示上方DIY标签</p><p style=\"text-indent: 2em; line-height: 2em;\">5.信息详情页小导航右侧修改/删除信息当访问人是发布人或管理员时改</p><p style=\"text-indent: 2em; line-height: 2em;\">6.为编辑与删除本信息</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">程序适用版本：X2.5\\X3\\X3.1\\X3.2（GBK/UTF8）。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">免费下载discuz拼车/顺风车系统 完整商业版2.2.2</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>discuz【亮剑】拼车系统完整商业版功能介绍</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">亮剑分类信息系列插件-拼车/顺风车</p><p style=\"text-indent: 2em; line-height: 2em;\">1.支持基本的拼车/顺风车信息发布，管理</p><p style=\"text-indent: 2em; line-height: 2em;\">2.支持信息刷新消耗积分功能</p><p style=\"text-indent: 2em; line-height: 2em;\">3.支持信息置顶消耗积分功能</p><p style=\"text-indent: 2em; line-height: 2em;\">4.支持用户统计管理功能</p><p style=\"text-indent: 2em; line-height: 2em;\">5.支持用户刷新记录查询</p><p style=\"text-indent: 2em; line-height: 2em;\">6.支持用户置顶记录查询</p><p style=\"text-indent: 2em; line-height: 2em;\">7.支持手机版</p><p style=\"text-indent: 2em; line-height: 2em;\">8.支持伪静态</p><p style=\"text-indent: 2em; line-height: 2em;\">9.支持推荐</p><p style=\"text-indent: 2em; line-height: 2em;\">10.支持发布信息同步到论坛版块</p><p style=\"text-indent: 2em; line-height: 2em;\">11.支持发布信息扣除积分</p><p style=\"text-indent: 2em; line-height: 2em;\">12.支持设置自定义用户组允许发布信息</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>百度云盘提取密码：x3b5</strong></p><p><br/></p>','','http://pan.baidu.com/s/1c27MXDu','discuz【亮剑】拼车系统完整商业版2.2.2程序更新公告：1.优化列表页检索链接2.插件发布信息上传图片路径自定义（自定义的文件夹必须存在）3.修复常用设置未传图默认图片上传失效问题4.添加PC端列表页信息显示上方DIY标签5.信息详情','2.2.2','1','0','1','','','','1475418688','1476450817','133','18','1','5','','1','0','1','discuz亮剑拼车系统,discuz拼车系统,拼车系统下载','http://pinche.dzx30.com/plugin.php?id=aljpc','13','0','1,40,58,59,46,47');
INSERT INTO `my_soft` VALUES ('9','Discuz!X3.2精仿N5门户163K新版地方门户+分类信息+商家点评+楼盘展示模版分享','','','/uploads/img1/20161003/57f1c08655477.png!300X300.jpg','/uploads/img1/20161003/57f1c08655477.png$$$首页|||/uploads/img1/20161003/57f1c3fc10dff.png$$$商家点评|||/uploads/img1/20161003/57f1c40e32f96.png$$$最新楼盘|||/uploads/img1/20161003/57f1c41d3711e.png$$$生活信息|||/uploads/img1/20161003/57f1c429cb024.png$$$本地论坛|||/uploads/img1/20161003/57f1c4380e70d.png$$$新闻资讯','<p style=\"text-indent: 2em; line-height: 2em;\"><strong>一、Discuz!X3.2精仿163K地方门户模版介绍：</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">模版为宽屏风格，宽度为1200px，DIV+CSS，可自动识别伪静态、自动生成调用图片缩略图，模版兼容主流浏览器，全站90%文字、链接、图片可通过DIY编辑。模版主要功能模块包括：商家点评、楼盘展示、分类信息、本地论坛、新闻资讯、瀑布流等。功能齐全，是做地方门户网站的不二之选。<br/></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>二、模版适用范围：DiscuzX3.0/3.1/3.2</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">Discuz!X3精仿163K地方门户+类分类信息+商家点评+楼盘展示</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">该模板是从网络收并免费分享给大家的，安装和测试均无误，保证模版100%完整。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>三、模板安装说明</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">上传template到根目录覆盖，后台-- 界面-- 风格管理-- 安装(安装时若发现提示请安装正版程序请将function_cloudaddons.php覆盖到source/function下即可！) -- 启用</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、后台 全局 站点功能 开启门户&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">2、后台 门户 添加频道 频道模板选择“丫头建站分类信息频道”</p><p style=\"text-indent: 2em; line-height: 2em;\">3、后台 门户 添加频道 频道模板选择“丫头建站频道列表”</p><p style=\"text-indent: 2em; line-height: 2em;\">4、后台 论坛 分类信息 导入分类信息文件夹里的全部分类</p><p style=\"text-indent: 2em; line-height: 2em;\">5、后台 界面 界面设置 主题列表页 左侧板块宽度 0改202</p><p style=\"text-indent: 2em; line-height: 2em;\">6、前台个页面导入DIY文件即可！</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>百度云盘提取密码：wi1a</strong></p><p><br/></p>','','http://pan.baidu.com/s/1kVJKaGn','一、Discuz!X3.2精仿163K地方门户模版介绍：模版为宽屏风格，宽度为1200px，DIV+CSS，可自动识别伪静态、自动生成调用图片缩略图，模版兼容主流浏览器，全站90%文字、链接、图片可通过DIY编辑。模版主要功能模块包括：商家','DiscuzX3','1','0','1','','','','1475461219','1476450796','45','18','1','1','','1','0','1','Discuz!X3.2模板,Discuz仿163K地方门户,Discuz分类信息模板,Discuz楼盘展示模版','http://www.nvbing5.net/demo/nvbing5_n5xin163k/portal.php','1','0','33,40,41,48,56,59,46,47');
INSERT INTO `my_soft` VALUES ('10','WordPress响应式自适应HTML5科技资讯类网站主题模版（完美支持手机和PAD）','','','/uploads/img1/20161004/57f3b3db5bd8a.jpg!300X300.jpg','/uploads/img1/20161004/57f3b3db5bd8a.jpg$$$首页|||/uploads/img1/20161004/57f3b3f274f46.jpg$$$详情页','<p style=\"line-height: 2em; text-indent: 2em;\">WordPress响应式自适应HTML5科技资讯类网站主题模版介绍：</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">今天分享的这套模板是一款绿色大气简洁的多功能高效WordPress主题模板，这原本是一套付费的主题，本人收集来免费分享给大家了。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>模板亮点：响应式、自适应，高度可自定义和内置的流行元素，支持平板电脑和手机浏览。</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">该主题适合做自媒体科技新闻资讯类的网站，它可帮助你快速搭建属于自己的网站平台，只要你肯下功夫，就能够做到和36kr、钛媒体之类的专业性网站的水平。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>模板使用说明（详情请下载查看压缩包readme目录里面的index.html文件）：</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">如果你第一次使用WordPress（下称WP），那么从熟悉WP开始，你需要阅读第一章的所有内容。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">使用WP多年，直接进入第二章。第二章展示了GD的各种特性，你必须喜欢上它。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">对前台哪哪是怎么显示出来的搞不清楚，看第三章。</p><p style=\"line-height: 2em; text-indent: 2em;\">打算在GD基础上做二次开发，必须看第四章。里面提到的Admin Options是我的得意之作，你肯定会在其他主题中用到……</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">WordPress响应式自适应HTML5科技资讯类网站主题模版（完美支持手机和PAD浏览）</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>百度云盘提取密码：v9b7</strong></p><p><br/></p>','','http://pan.baidu.com/s/1eRCS1Xo','WordPress响应式自适应HTML5科技资讯类网站主题模版介绍：今天分享的这套模板是一款绿色大气简洁的多功能高效WordPress主题模板，这原本是一套付费的主题，本人收集来免费分享给大家了。模板亮点：响应式、自适应，高度可自定义和内置','','1','0','1','','','','1475588021','1476450956','52','20','1','5','','1','0','1','WordPress响应式,WordPress自适应,HTML5,科技资讯主题模版,手机网站','http://green.demo.utubon.com/','0','0','34,41,44,55,60,46,47');
INSERT INTO `my_soft` VALUES ('11','100多个手机wap站点html5自适应浏览器模版300M免费打包下载','','','/uploads/img1/20161004/57f3bd0eb9fcf.jpg!300X300.jpg','/uploads/img1/20161004/57f3bd0eb9fcf.jpg$$$html5手机wap购物网站模板|||/uploads/img1/20161004/57f3bd1dc0057.jpg$$$列表1|||/uploads/img1/20161004/57f3bd3ec9e45.jpg$$$列表2|||/uploads/img1/20161004/57f3bd51742e2.jpg$$$列表3|||/uploads/img1/20161004/57f3bd6e18768.jpg$$$列表4|||/uploads/img1/20161004/57f3bf73268f4.jpg$$$列表5','<p style=\"line-height: 2em;\"><strong>一、模版介绍：</strong></p><p><br/></p><p style=\"line-height: 2em;\">该压缩包资源包含100多个手机站WAP站点HTML模版共300多兆，其中有不少HTML5响应式模版，这些模版几乎都能自适应PC和手机浏览器，现在本站免费提供下载，这么好的资源你还在等什么呢？赶紧下载收藏了吧！</p><p><br/></p><p style=\"line-height: 2em;\"><strong>二、压缩包文件列表：</strong></p><p><br/></p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 126家具人才网触屏版手机wap企业会员登录网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 3533免费手机应用下载触屏版自适应手机wap软件模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 365音乐网触屏版自适应手机wap音乐网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 366网上商城触屏版手机wap用户登陆注册网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 4493性感丝袜诱惑美女图片触屏版自适应手机wap图片网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 81军事网触屏版自适应html5军事手机网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 8684免费手机小游戏触屏版自适应html5手机游戏网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 8684全国门票预订触屏版自适应html5手机wap旅游网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 8684小说网手机免费小说网站触屏版自适应html5手机小说网站模板 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 91单机网单机游戏下载触屏版自适应手机wap游戏网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 99健康网触屏版自适应手机wap健康网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; gogo旅游问答触屏版自适应手机html5旅游网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; HTML5可击碎的视频播放器.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; html5简单小游戏——猜拳【源码】.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; html5自适应性响应式Banner幻灯片切换手机js特效源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; jquery-1.9.1.min.js</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; jquery.mmenu.min.js</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; jquery图片拖动切换效果手机wap网站图片特效.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; jquery左右滑动导航手机wap网站特效.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; jquery手机触屏版响应式大图滚动切换手机js特效源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; jquery手机风格通讯录字母滑动查询联系人手机号码手机网页特效.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; list.txt</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; MP3音乐歌曲下载触屏自适应html5手机wap音乐网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; PChome手机软件下载html5大图标触屏版手机wap下载网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; png小图标.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; QQJAYQQ网名个性签名空间站触屏版自适应手机wap图片网站模板 (1).zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; QQJAYQQ网名个性签名空间站触屏版自适应手机wap图片网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; S.MUSE十年风潮 娱乐大成.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效上拉加载更多源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效下拉刷新源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效极致完美模式源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效极致流畅模式源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效横向智能模式源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效横向模式源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效自定义滚动条源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效触控TAB切换源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; SlipJs系列教程之手机js特效触控图片轮换源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; sugar手机官网html5响应式触屏版手机wap企业网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; TomPDA智能手机软件下载触屏自适应手机wap软件网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; TouchScroll插件制作幻灯切换iPhone手机wap网站特效.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; uc资讯网触屏版.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; web.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; yy138手机应用下载触屏版自适应手机wap软件网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; [全景图制作软件].Garden.Gnome.Software.Pano2VR.v3.1.2.Unbranded.Edition-BEAN.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【32赞HTM5响应式系列之右侧多级滑动式】仿Slideby触屏版html5响应式手机wap网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【32赞HTML5响应式系列之小情绪风格】仿Epsilon Elements触屏版html5响应式手机wap网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【32赞HTML5响应式系列之旅游模板】微官网html5触屏响应式手机wap网站模板下载首页.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【32赞HTML5响应式系列之蓝色经典】仿Ocean微官网触屏版html5响应式手机wap网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【32赞HTML5响应式系列之订餐模板】微官网美食订餐html5触屏响应式手机wap网站订餐模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【32赞HTML5响应式系列之黑色经典】仿eplie触屏版html5响应式手机wap网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【不看绝对后悔】仿凤凰汽车触屏版html5手机wap汽车网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【修正版4.15号】微信朋友圈怎么转发之前任与现任你到底爱哪个.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【修正版4.15号】微信朋友圈怎么转发之测一测你是那种菇凉.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【修正版4.15号】微信朋友圈怎么转发之测测你这辈子恋爱几次才结婚.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【修正版4.15号】微信朋友圈怎么转发之爆准测试：你的容貌和实际年龄相差几岁.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【修正版4.15号】微信朋友圈怎么转发史上最准：乐嘉老师色彩性格测试.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【修正版4.15号】微信朋友圈转发微信测试题源码之测你2014年能存多少钱.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【修正版4.15号】微信朋友圈转发微信测试题源码之测测你会是哪种极品女人？.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【列表多种形式展示】仿生意街触屏版html5手机wap购物网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【动感滑屏和更多加载效果】仿电子产品世界触屏版手机wap门户网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【医院高档次模板】仿珠海平安整形美容医院触屏版html5手机wap医院网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【喜欢玩占卜就是不错选择】仿灵匣网-星座算命周公解梦手机wap星座网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【多格混拼本地门户】仿智慧园区触屏版html5手机门户网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【大企业做的网站就是吊！！】仿Haier 海尔家电家居触屏版html5响应式手机wap企业网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【导航看上去不错】越野e族中国越野触屏版手机wap汽车网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【干净简洁人才模板】仿台州人力网触屏版手机wap招聘网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【很有创意网站】礼物搜手机触屏版手机wap购物网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【很有大气女性门户模板(文章页有福利)】仿VOGUE时尚网触屏版手机wap女性网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【很适合新手】仿N炂諓T手机wap旅游网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【很适合新手学习】仿coffee手机wap企业网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【很适合新手学习】仿不夜城手机wap企业网站模板下载 (1).zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【很适合新手学习】仿不夜城手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【很适合新手学习】仿住 - N炂諓T手机wap旅游网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【手机app iso7风格之页面向右滑动切换白色风格模板】触屏版html5响应式手机app网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【手机app iso7风格之页面向右滑动切换结婚模板】结婚婚庆触屏版html5响应式手机app网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【手机app大图标版 iso7风格之页面向右滑动切换大图标版模板】触屏版html5响应式手机app网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【手机app订餐 iso7风格之页面向右滑动切换餐饮美食模板】触屏版html5响应式手机app网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【淘宝客必备】购物客单页触屏版手机wap购物网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【清新iso7风格】仿格子微酒店触屏版html5手机wap旅游网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【游戏模板敢称第一好】仿玩机岛触屏版html5手机wap游戏网站模板下载 (1).zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【游戏模板敢称第一好】仿玩机岛触屏版html5手机wap游戏网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【特效超多】仿德国开元旅游触屏版html5手机wap旅游网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【简单很适合新手】仿徐薇英文手机wap培训网站模板下载 (1).rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【简单很适合新手】仿徐薇英文手机wap培训网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【超大气喔】仿悦美丽触屏版html5手机wap购物网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【超炫购物模板】仿拍鞋网商城首页触屏版html5手机wap购物网站模板下载 (1).rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【超炫购物模板】仿拍鞋网商城首页触屏版html5手机wap购物网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【超酷啊】仿迪卡侬运动专业超市触屏版html5手机wap购物网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 【这个导航看上去很牛】仿EA触屏版手机wap游戏网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 一汽奔腾触屏版自适应手机wap汽车网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 三打哈手机wap网页模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 上宫庄官网单页专题页触屏版手机wap健康网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 上海万众医院触屏版自适应手机wap医院网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 上海仁爱医院触屏版自适应html5手机医院网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 中国军事网站-战争前沿触屏版自适应html5手机新闻网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 中国第一专业手机门户触屏版自适应html5手机网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 九博人才网触屏版手机wap用户登陆网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 买花网微信鲜花网触屏版手机wap购物网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 人才招聘网触屏版手机wap用户登陆网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿2958.cn精品商机触屏版html5手机wap商机网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿7881触屏版游戏交易平台手机wap游戏网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿GoMobile触屏版html5响应式手机app网站模板下载-懒人模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿KFC肯德基3G触屏版手机wap购物订餐网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿Midifan新闻触屏版手机wap新闻网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿SAEKO微官网html5手机网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿UG生活网触屏版手机wap网址导航网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿YOKA时尚网触屏版手机wap女性网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿YOKA服饰美容3G手机wap女性网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿上海甲状腺专科医院3G触屏版手机wap医院网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿下沙网触屏版手机wap门户网站模板下载（导航可以滑动）.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿中企动力手机wap企业网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿九块邮触屏版淘宝客单页手机wap购物网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿云贝饰品批发网触屏版手机wap购物网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿享客零食网触屏版html5手机wap购物网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿今日岦物行R瞻娲テ涟媸只鷚ap购物网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿北京房地产交易网触屏版html5手机wap房产网站模板下载（超动感）.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿学知识，上传课触屏版html5手机wap培训网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿想去网触屏版html5手机wap网站模板购物网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿想去网触屏版html5手机wap网站模板购物网站模板1111.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿手机号码归属地查询触屏版手机wap查询网站模板源码.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿找法网触屏手机wap法律网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿搜优图片网触屏版手机wap图片网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿昆山看房网手机触屏版手机wap房产网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿晋优惠触屏版手机wap购物网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿有信免费网络电话触屏版手机wap资源网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿楷维留学指南触屏版手机wap考试培训网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿海王星辰网上药店触屏版手机wap健康购物网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿票啦啦触屏版电影手机wap娱乐网站模板 (1).zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿票啦啦触屏版电影手机wap娱乐网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿禾文阿思触屏版html5手机wap购物网站模板下载（超炫）.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿美食速递网触屏版html5手机wap购物网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿聚优品vip3G触屏版淘宝单页手机wap购物网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿肯德基宅急送官方网站订餐官网触屏版手机wap购物订餐网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿诚信中国触屏版手机wap购物网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿金盛集团官方触屏版手机wap企业网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 仿驱动之家触屏版手机wap硬件网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 企业产品手机模版.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 优亿市场安卓手机软件下载触屏版自适应手机wap软件模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 优美高清美女图片触屏版自适应手机wap图片网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 全屏焦点图.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 全屏翻页.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 列出目录树形结构.bat</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 列表式首页触屏版html5响应式手机app网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 动感式触屏版手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 北京丽都医疗美容医院触屏版自适应html5手机医院网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 医疗专业版触屏版html5响应式手机app网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 单环境3D全景实例.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 南京政府微门户触屏版手机wap政府网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 围住神经猫2-围住神经猫和他的好基友小游戏源码.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 围住神经猫、小呀小苹果等游戏源码.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 围住神经猫源码(修改修改版).rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 地产界面模版.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 基于dedecms仿长沙美奥口腔医院手机wap医院网站源码.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 基于oecms内核蓝色经典大方手机wap企业网站源码.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 基于百度BAE搭建图床〔用于图片外链〕.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 壹心理触屏版手机wap用户登陆网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 多米音乐高品质MP3下载自适应手机wap软件下载模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 大连圣亚海洋世界html5响应式触屏版手机wap旅游网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 大连旅行社康辉旅游触屏版手机wap旅游网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 天堂高清无水印图片网触屏版自适应手机wap图片网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 天津欢乐谷官方网站html5响应式触屏版手机wap旅游网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 女人私房话触屏版自适应手机wap健康网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 如何使用本站懒人模板教程白皮书第一期（基于dedecms整合）.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 如何利用纯CSS3实现的动感菜单效果源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 家庭医生在线html5响应式触屏版手机wap健康网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 寻宝天行触屏版手机wap游戏网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 小清新手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 小米主题商店触屏版自适应手机wap主题网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 巨有趣触屏版自适应手机wap图片网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 巴士单机游戏下载触屏版自适应手机wap游戏网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 帮5买触屏版手机wap淘宝客购物网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 广州女子医院触屏版自适应手机wap医院网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 应用汇海量应用下载触屏版自适应手机wap软件网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 微信刮刮卡源码.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 志远手机版整站程序源码.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 恋星缘星座网触屏版自适应手机wap星座网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 我要听音乐MP3歌曲下载触屏版自适应手机wap音乐网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机159彩触屏版手机wap用户登陆注册模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机js特效jquery触屏版自适应手机版列表分页样式源码下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机js特效jquery触屏自适应实现随机图片瀑布流无限加载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机js特效touchScroll实现手机触屏滚动特效源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机js特效自适应前后张图片部分截图幻灯片源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机wap网站js触屏自适应TAB菜单特效源码下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机wap触屏js特效网站相册带计数功能源码下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机wap触屏版点赞手机js特效源码下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机光明网触屏版手机wap门户网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机号码归属地在线查询触屏版自适应手机wap查询网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机和讯财金网触屏版自适应手机wap财金网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机壁纸免费下载触屏版自适应瀑布流手机wap主题图片网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机微网站触屏自适应大图切换手机js特效源码下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机百姓健康网触屏版自适应html5手机健康网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机移动端触屏版无缝滚动焦点图代码手机网页特效.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机站首页-背景轮换.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机端图片切换特效.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机网站跳转，加在电脑首页最前.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机腾牛网安卓软件免费下载触屏自适应手机wap软件模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机英语学习网站触屏版手机wap用户登陆网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机触屏版左右下角圆形点击弹出手机js特效源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 手机铁血新闻网触屏版自适应HTML5手机wap新闻网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 找歌谱网触屏版手机wap音乐网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 拉拉勾旅游线路 自助游旅游网触屏版手机wap旅游网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 指客网节短信祝福触屏版自适应手机wap短信网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 掌上家庭医生手机wap用户注册登陆网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 搞笑吧搞笑动态漫画图片触屏版自适应手机wap图片网站模板下载 (1).zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 搞笑吧搞笑动态漫画图片触屏版自适应手机wap图片网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 斗蟹游戏网单机游戏下载触屏版自适应手机wap游戏网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 新东方.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 无锡侬侬婚纱摄影手机模版.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 日志520 qq空间日志大全触屏版自适应手机空间网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 星波连锁酒店触屏版手机wap用户登录网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 景安官网触屏版手机wap用户登录网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 海尔商城触屏版手机wap用户注册网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 深圳博爱医院触屏版自适应html5手机医院网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 深圳曙光医院触屏自适应html5手机医院网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 灰色iso苹果风格触屏版手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 爱丽时尚触屏自适应手机wap女性网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 爱波网福利体育竞技彩票资讯触屏版自适应手机wap彩票网站模板 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 玩游戏网手机游戏免费下载触屏版自适应手机wap软件网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 百程境外游特卖触屏版自适应手机旅游网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 看书网触屏版手机wap小说网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 短片吧搞笑视频微电影触屏版自适应手机wap视频网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 秀美网专业女性触屏版手机自适应手机wap女性网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 绿茶手机网触屏版自适应手机wap软件网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 聚橙网触屏版手机wap剧院戏剧娱乐网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 腾讯新闻.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 自适应性html5折页式导航手机网页特效.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 自适应性咖红触屏版手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 自适应性橙色触屏版手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 自适应性绿色触屏版手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 自适应性蓝色触屏版手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 自适应性黑色简单触屏版手机wap企业网站模板下载.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 蓝途旅游网触屏版自适应html5手机wap旅游网站模板下载 .rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 虹桥信息网触屏版手机wap分类信息网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 虹桥外卖网触屏版手机wap订餐外卖购物网站模板下载列表.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 要出发触屏版手机wap用户登陆网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 要红酒触屏版手机wap会员用户登陆网站模板源码下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 触屏版HTML5左侧展开导航菜单手机wap网站特效源码.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 触屏版HTML5左侧展开导航菜单手机wap网站特效源码.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 让你流鼻血的美女图片触屏版手机wap图片网站模板.zip</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 财富·雪山和院html5响应式音乐触屏版手机wap企业网站模板下载.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 酒仙触屏版手机wap用户登陆网站模板.rar</p><p style=\"line-height: 2em;\">&nbsp; &nbsp; 黑色风格首页滑动不错手机wap企业网站模板下载.zip</p><p><br/></p><p style=\"line-height: 2em;\"><strong>三、百度云盘提取密码：bygx</strong></p><p><br/></p>','','http://pan.baidu.com/s/1o8vXwZw','一、模版介绍：该压缩包资源包含100多个手机站WAP站点HTML模版共300多兆，其中有不少HTML5响应式模版，这些模版几乎都能自适应PC和手机浏览器，现在本站免费提供下载，这么好的资源你还在等什么呢？赶紧下载收藏了吧！二、压缩包文件列表','','1','0','1','','','','1475591020','1476450677','29','30','1','5','','1','0','1','手机模板,html5模板,html5自适应,手机wap站模板','/','2','0','1,9,33,34,35,36,37,38,39,40,41,42,43,44,45,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,46,47');
INSERT INTO `my_soft` VALUES ('12','Discuz!X3漂亮大气简洁的美食类网站模板下载','','','/uploads/img1/20161007/57f79a8fbed46.jpg!300X300.jpg','/uploads/img1/20161007/57f79a8fbed46.jpg$$$首页|||/uploads/img1/20161007/57f79a961670b.jpg$$$列表页','<p><strong>一、Discuz!X3美食网站模板介绍：</strong><br/><br/>该模板参考了国外的网站风格的制作，页面兼容大部分主流浏览器，为了实现各浏览器无缝兼容浏览。本模板从构思到制作前前后后花了1个月的时间，主要原因是对ie6的兼容，因为ie6的特性，能做到兼容ie6已经尽了我最大的努力！模版设计漂亮、简洁，模版首页代码已经变得很简练，把所有的操作可通过diy完成，diy可在首页不修改模板文件的基础上进行自己的定制！<br/><br/><strong>二、Discuz!X3美食网站模板适用版本：DiscuzX3.0以上版本，编码为GBK，需要UTF-8的自己转一下。</strong><br/><br/><strong>Discuz!X3美食网站模板安装教程：</strong><br/><br/>先将文件夹【hnzz_newsplus】传到空间上的【template】文件夹下，然后进入后台：界面――风格管理 &nbsp;选择模版进行安装即可。<br/>如果安装时提示“对不起，您安装的不是正版应用...”，diy文件在模板目录下的【diy】文件夹中<br/>关于出现“对不起，您安装的不是正版应用..”的解决办法<br/>关于出现“对不起，您安装的不是正版应用..”的解决办法<br/><br/>最近很多会员朋友反映一个问题：有些插件和风格在安装时出现不能安装的现象，出现以下提示：<br/><br/>对不起，您安装的不是正版应用，安装程序无法继续执行<br/>点击这里安装正版应用<br/>点击这里返回上一页<br/>针对这一情况，本人从网络上收集了几种可以解决的办法，现在将这些办法几种起来，大家可以一一进行尝试，为了安装上自己喜欢的风格我想大家也不怕这点麻烦吧！<br/><br/>discuz 社区在更新到2.0以上后，增加了对插件的版本检测，在安装时，可能会出现：“对不起,您安装的不是正版应用,安装程序无法继续执行”的提示，要解决这个其实挺容易的，找到以下文件：/source/function/function_cloudaddons.php<br/><br/>找到文件中的cloudaddons_validator这个处理过程，将中间提示部份注释掉，改为像以下这样即可大功告成。<br/><br/>function cloudaddons_validator($addonid) {<br/>$array = cloudaddons_ge***5($addonid);<br/>if(cloudaddons_open(&#39;&amp;mod=app&amp;ac=validator&amp;addonid=&#39;.$addonid.($array !== false ? &#39;&amp;rid=&#39;.$array[&#39;RevisionID&#39;].&#39;&amp;sn=&#39;.$array[&#39;SN&#39;].&#39;&amp;rd=&#39;.$array[&#39;RevisionDateline&#39;] : &#39;&#39;)) === &#39;0&#39;) {<br/>　　/*<br/>　　cpmsg(&#39;cloudaddons_validator&#39;, &#39;&#39;, &#39;error&#39;, array(&#39;addonid&#39; =&gt; $addonid));<br/>　　*/<br/>　　}<br/>}<br/><br/><strong>四、百度云盘提取密码：igtd</strong></p>','','http://pan.baidu.com/s/1pLk0jdL','一、Discuz!X3美食网站模板介绍：\r\n\r\n该模板参考了国外的网站风格的制作，页面兼容大部分主流浏览器，为了实现各浏览器无缝兼容浏览。本模板从构思到制作前前后后花了1个月的时间，主要原因是对ie6的兼容，因为ie6的特性，能做到兼容ie6已','','1','0','1','','','','1475772627','1476450773','33','18','1','1','','1','0','0','Discuz模板,Discuz美食类模板,Discuz模板下载','/','2','0','35,36,39,40,57,47');
INSERT INTO `my_soft` VALUES ('13','DIV+CSS仿拉勾网HTML静态模板下载','','','/uploads/img1/20161007/57f71d07da7a6.png!300X300.jpg','/uploads/img1/20161007/57f71d07da7a6.png$$$仿拉勾网模板首页|||/uploads/img1/20161007/57f71d03e18ea.png$$$仿拉勾网模板企业列表页|||/uploads/img1/20161007/57f71d0610cf4.png$$$仿拉勾网模板文章列表页','<p><strong>仿拉勾网HTML模板介绍：</strong><br/><br/>仿拉钩招聘网HTML静态网页模板，该模板采用DIV+CSS排版布局，代码风格简洁清晰，总共含有38个独立HTML页面，带JS特效。页面完整，经测试无bug。这是非常不错的一套HTML模板，值得前端的小伙伴们学习和研究。<br/><br/><strong>百度云盘提取密码：wlzc</strong></p>','','http://pan.baidu.com/s/1dEEW3qL','仿拉勾网HTML模板介绍：\r\n\r\n仿拉钩招聘网HTML静态网页模板，该模板采用DIV+CSS排版布局，代码风格简洁清晰，总共含有38个独立HTML页面，带JS特效。页面完整，经测试无bug。这是非常不错的一套HTML模板，值得前端的小伙伴们学习','','1','0','1','','','','1475812617','1476450653','47','30','1','1','','1','0','0','DIV+CSS,仿拉勾网,HTML模板,仿拉勾网下载','http://www.lagou.com/','2','0','34,62,46,47');
INSERT INTO `my_soft` VALUES ('14','Discuz!X3漂亮的图片设计类素材网站模板','','','/uploads/img1/20161007/57f71e135bfd4.jpg!300X300.jpg','/uploads/img1/20161007/57f71e135bfd4.jpg$$$首页','<p><strong>一、Discuz!X3图片设计类素材网站模板介绍：</strong><br/><br/>这是一套界面非常漂亮的图片设计素材类Discuz!模板。本模板不仅设计漂亮，而且加入了很多在jquery特效，体验上不错。首页的幻灯片有多种切换效果，并带有瀑布流页面效果。适合设计、素材类等网站使用。模板完全开源，无域名限制！不用担心应用中心无法安装的提示，也不用破解discuz系统，直接上传即可安装。适用于DiscuzX3.0/3.1/3.2系统！<br/><br/><strong>二、使用说明：</strong><br/><br/>下载后打开压缩包把xinyun_bbs_004文件夹丢到Discuz的template文件夹后台启用即可<br/><br/><strong>三、模板安装方法：</strong><br/><br/>1. 进入[系统设置]-[全局]-[站点功能]，开启“门户”功能，并选中主导航<br/>2. 进入前台门户首页，然后导入 “DIY导入数据” 文件夹中的“网站首页.xml”文件<br/><br/><strong>四、网站配色安装修改方法：</strong><br/><br/>1. 进入[界面]-[风格设置]，找到“xinyun_bbs_004”模板，点击“编辑”<br/>2. 在[扩展配色]中选中要开启的配色！开启后可在前台看到切换按钮！<br/>3. 可在[默认配色]中设置网站默认显示的配色！<br/>论坛首页安装方法<br/>1. 进入论坛首页，然后导入 “DIY导入数据” 文件夹中的“论坛首页.xml”文件<br/>瀑布流设置方法<br/>1. 进入后台[界面]-[界面设置]-[主题列表页]<br/>3. 在“左侧版块导航宽度”中填写：0<br/>2. 在“主题封面宽度”中填写：282<br/>3. 在“主题封面高度”中，如需要瀑布流效果，不用填写。<br/>4. 在[论坛]-[版块管理]中，选择需要开启图片模式的版块进行“编辑”<br/>5. 在[扩展设置]的“开启图片列表模式”中选择：是<br/>新闻中心安装方法<br/>1. 进入后台[门户]-[频道栏目]-[添加频道]<br/>2. 在“列表页模板名”处选择：“xinyun-bbs-004-news”<br/>3. 在“文章页模板名”处选择：“xinyun-bbs-004-view”<br/>4. 在“启用”处选择：是；在“在导航显示”处选择：是<br/>5. 进入[后台]-[全局]-[上传设置]，进入“门户附件”选项，将“文章图片缩略图尺寸:”设置为：220 X 152<br/>6. 打开“新闻中心”列表页，然后导入 “DIY导入数据” 文件夹中的“文章列表页.xml”文件<br/>7. 在“新闻中心”栏目下随意发布一篇文章，然后导入 “DIY导入数据” 文件夹中的“文章内容页.xml”文件<br/><br/><strong>五、贴子页面顶部内容安装方法：</strong><br/><br/>1. 打开任意一个贴子页面，然后导入 “DIY导入数据” 文件夹中的“贴子页面.xml”文件<br/><br/><strong>六、百度云盘提取密码：kc8d</strong></p>','','http://pan.baidu.com/s/1kV0hwLh','一、Discuz!X3图片设计类素材网站模板介绍：\r\n\r\n这是一套界面非常漂亮的图片设计素材类Discuz!模板。本模板不仅设计漂亮，而且加入了很多在jquery特效，体验上不错。首页的幻灯片有多种切换效果，并带有瀑布流页面效果。适合设计、素材','','1','0','1','','','','1475812884','1476450736','29','18','1','1','','1','0','0','Discuz!X3模板,Discuz!X3图片素材模板','http://demo.xinyunkeji.com/bbs/004/portal.php','0','0','35,40,55,68,46,47');
INSERT INTO `my_soft` VALUES ('15','Discuz!X3.2精仿磨房旅游户外模板下载','','','/uploads/img1/20161007/57f7262a565ca.png!300X300.jpg','/uploads/img1/20161007/57f7262a565ca.png$$$首页|||/uploads/img1/20161007/57f7262c3a017.png$$$列表页|||/uploads/img1/20161007/57f7262746ab6.png$$$活动页|||/uploads/img1/20161007/57f7262f3f50a.png$$$论坛','<p><strong>一、Discuz!X3.2精仿磨房旅游户外模板：</strong><br/><br/>磨房旅游户外discuz论坛模板，某站收费模版，这是一套扁平化的风格模板，当前比较流行扁平化风格。该模板完全开源，无域名限制，不用担心应用中心无法安装的提示，更不用破解discuz系统，直接上传即可安装！<br/><br/><strong>二、模版适用版本：</strong><br/><br/>DiscuzX3.0、DiscuzX3.1、DiscuzX3.2系统<br/><br/>磨房旅游户外discuz论坛模板，这是一套扁平化的风格模板，也是最近流行的一种风格模板。最近好像大家都喜欢这种旅游户外的模板，discuz程序做这类网站确实也是相当合适的！刚拿到此套模板时首页有些问题，当然，魔客吧已经修复了，所有页面均为魔客吧本地测试截图！所以大家可以放心使用！最重要的是这套模板完全开源，绿色模板，无域名限制！所以大家不用担心应用中心无法安装的提示，更不用破解discuz系统，直接上传即可安装！并且可用于多个网站！无限制使用！适用于DiscuzX3.1和DiscuzX3.0系统！<br/><br/><strong>三、模板安装方法</strong><br/><br/>1. 通过ftp工具，将模板文件里的 mofang 目录上传到论坛模板目录template，安装moke8_mofang风格，并设为默认！<br/>2. 进入[系统设置]-[全局]-[站点功能]，开启“门户”功能，并选中主导航<br/>3. 进入前台门户首页，然后导入 “DIY导入数据” 文件夹中的“网站首页.xml”文件<br/>4. 进入前台论坛首页，然后导入 “DIY导入数据” 文件夹中的“论坛首页.xml”文件<br/>注：请自行选择相应模板文件和导入数据文件（推荐使用GBK版本，UTF8只进行了简单的转码，并未测试）<br/><br/><strong>四、新闻列表安装方法：</strong><br/><br/>1. 进入后台[门户]-[频道栏目]-[添加频道]<br/>2. 在“列表页模板名”处选择：“魔客吧-磨房图文列表页”<br/>3. 在“文章页模板名”处选择：“魔客吧-磨房内容页”<br/>4. 在“启用”处选择：是；在“在导航显示”处选择：是<br/><br/><strong>五、瀑布流设置方法</strong><br/><br/>1. 进入后台[界面]-[界面设置]-[主题列表页]<br/>2. 在“主题封面宽度”中填写：208（这个宽度可自行修改调试）<br/>3. 在“主题封面高度”中，如需要瀑布流效果，不用填写。<br/>4. 在[论坛]-[版块管理]中，选择需要开启图片模式的版块进行“编辑”<br/>5. 在[扩展设置]的“开启图片列表模式”中选择：是<br/><br/><strong>六、百度云盘提取密码：ujhr</strong></p>','','http://pan.baidu.com/s/1gfJSwPd','一、Discuz!X3.2精仿磨房旅游户外模板：\r\n\r\n磨房旅游户外discuz论坛模板，某站收费模版，这是一套扁平化的风格模板，当前比较流行扁平化风格。该模板完全开源，无域名限制，不用担心应用中心无法安装的提示，更不用破解discuz系统，直','','1','0','1','','','','1475814961','1476450713','25','18','1','1','','1','0','0','Discuz!X3.2旅游户外模板,Discuz!仿磨房旅游模板','http://demo.xinyunkeji.com/bbs/004/portal.php','0','0','1,40,44,50,46,47');
INSERT INTO `my_soft` VALUES ('16','免费分享价值400元的Discuz!仿穷游网旅游门户模版（UTF8商业版）','','','/uploads/img1/20161007/57f7375aeba09.png!300X300.jpg','/uploads/img1/20161007/57f7375aeba09.png$$$首页|||/uploads/img1/20161007/57f73757c641d.png$$$景点列表页|||/uploads/img1/20161007/57f7375e33427.png$$$论坛','<p>模板介绍：这是一套价值400元的Discuz!仿穷游网旅游门户模板UTF8商业版，该模板包含门户和论坛页面，整体色彩采用大自然的绿色，带DIY数据，模版兼容主流浏览器，页面结构和CSS均已优化适合搜索引擎收录。<br/><br/>该模板风格大气，不仅可用于旅游类站点，还可以作为兴趣、分享等类型内容站点使用。<br/><br/>模版支持：Discuz! X3.0\\X3.1\\3.2<br/><br/>百度云盘提取密码：qxxb</p>','','http://pan.baidu.com/s/1kVlotkb','模板介绍：这是一套价值400元的Discuz!仿穷游网旅游门户模板UTF8商业版，该模板包含门户和论坛页面，整体色彩采用大自然的绿色，带DIY数据，模版兼容主流浏览器，页面结构和CSS均已优化适合搜索引擎收录。\r\n\r\n该模板风格大气，不仅可用于','','1','0','1','','','','1475819360','1476450417','41','18','1','1','','1','0','0','Discuz!仿穷游网,Discuz!旅游门户模版','http://www.qyer.com/','1','0','34,40,50,46');
INSERT INTO `my_soft` VALUES ('17','精美uimaker后台管理系统模版html+div+css下载','','','/uploads/img1/20161007/57f79e6975730.png!300X300.jpg','/uploads/img1/20161007/57f79e6975730.png$$$后台首页|||/uploads/img1/20161007/57f79e679eaae.png$$$模型管理|||/uploads/img1/20161007/57f79e682b339.png$$$模块设置|||/uploads/img1/20161007/57f79e68a82fe.png$$$系统设置|||/uploads/img1/20161007/57f79e6918df4.png$$$文件管理|||/uploads/img1/20161007/57f79e69e575b.png$$$常用工具|||/uploads/img1/20161007/57f79e6a63209.png$$$工作台|||/uploads/img1/20161007/57f79e6acd883.png$$$后台登录页','<p><strong>uimaker后台管理系统html模板介绍：</strong><br/><br/>uimaker上发布的精美后台管理系统模版，包含多个HTML源文件，主要页面有登录页、表单页、列表页、图片列表、管理首页、文件管理页、工具页等，并带有JS弹出特效，菜单导航效果也很好，适合办公类或管理系统定制开发套用。<br/><br/><strong>百度云盘提取密码：x89g</strong></p>','','http://pan.baidu.com/s/1jIHezdG','uimaker后台管理系统html模板介绍：\r\n\r\nuimaker上发布的精美后台管理系统模版，包含多个HTML源文件，主要页面有登录页、表单页、列表页、图片列表、管理首页、文件管理页、工具页等，并带有JS弹出特效，菜单导航效果也很好，适合办公','','1','0','1','','','','1475845739','1476450627','37','30','1','1','','1','0','0','uimaker,uimaker后台管理系统,html模版下载,后台管理系统','/','0','0','1,46,47');
INSERT INTO `my_soft` VALUES ('18','Discuz!X3.0仿西子社区风格商业版模板下载','','','/uploads/img1/20161008/57f85ffe399d6.png!300X300.jpg','/uploads/img1/20161008/57f85ffe399d6.png$$$首页','<p>模版介绍：</p><p><br/></p><p>Discuz!商业模版，仿造西子社区门户风格，模版整体设计简洁、清爽，板块和内容围绕本地生活服务类信息，喜欢DZ论坛建站的站长们可以试试这个。</p><p><br/></p><p>百度云盘提取密码：o3hg</p>','','http://pan.baidu.com/s/1bp1dH7p','模版介绍：Discuz!商业模版，仿造西子社区门户风格，模版整体设计简洁、清爽，板块和内容围绕本地生活服务类信息，喜欢DZ论坛建站的站长们可以试试这个。百度云盘提取密码：o3hg','','1','0','1','','','','1475895298','1476450400','26','18','1','1','','1','0','0','Discuz!仿西子社区,Discuz模板下载','http://demo.webfgoo.com/xizi/forum.php','0','0','1,40,59,46,47');
INSERT INTO `my_soft` VALUES ('19','价值300元的Discuz!X3IOS风格手机模版','','','/uploads/img1/20161008/57f8bd5803517.jpg!300X300.jpg','/uploads/img1/20161008/57f8bd5803517.jpg$$$DZ手机模板','<p>Discuz!X3IOS风格手机模版模版介绍：<br/><br/>价值300元的Discuz!商业模版，可以DZ站点变成IOS风格，适应主流手机屏幕及浏览器，模版仅在一个文件夹内使用，不影响PC网站的使用，喜欢的朋友赶快下载体验吧。<br/><br/>模版支持：Discuz!X2.5\\X3.0\\3.1<br/><br/>Discuz!手机模版支持X3苹果IOS风格<br/><br/>百度云盘提取密码：5y5r</p>','','http://pan.baidu.com/s/1c2gIVpm','Discuz!X3IOS风格手机模版模版介绍：\r\n\r\n价值300元的Discuz!商业模版，可以DZ站点变成IOS风格，适应主流手机屏幕及浏览器，模版仅在一个文件夹内使用，不影响PC网站的使用，喜欢的朋友赶快下载体验吧。\r\n\r\n模版支持：Discu','','0','0','0','','','','1475919192','1488374290','24','18','1','1','','1','0','0','Discuz!仿IOS,Discuz!手机模版','/','2','2','1,33,34,40,42,45,59,62,46,47');
INSERT INTO `my_soft` VALUES ('20','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载','','','/uploads/img1/20161008/57f8bd5847ec0.png!300X300.jpg','/uploads/img1/20161008/57f8bd5847ec0.png$$$首页|||/uploads/img1/20161008/57f8bd5c4f3a4.png$$$文章列表页|||/uploads/img1/20161008/57f8bd5fa75a9.png$$$作品页','<p>价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载<br/><br/>Discuz!X3仿ZCOOL图片素材站模板介绍：<br/><br/>本模板是一款商业模板，其他网站售卖价格498元，现在本站免费分享给大家。<br/><br/>这款Discuz!X3仿ZCOOL图片素材站模板可以用来做素材、设计分享类网站使用，模板包含GBK和UTF8两个版，兼容IE6-IE10、谷歌、火狐等浏览器，模板一些功能可以自由开启与关闭，非常方便使用。<br/><br/>模版支持：Discuz!X2.5\\X3.0\\3.1。<br/><br/>百度云盘提取密码：c2sn</p>','','http://pan.baidu.com/s/1pLPHISb','价值498元的Discuz!X3仿ZCOOL图片素材站模板商业版免费下载\r\n\r\nDiscuz!X3仿ZCOOL图片素材站模板介绍：\r\n\r\n本模板是一款商业模板，其他网站售卖价格498元，现在本站免费分享给大家。\r\n\r\n这款Discuz!X3仿ZCOOL','','0','0','0','','','','1475919202','1488341075','40','18','1','1','','1','0','0','Discuz!X3,Discuz!仿ZCOOL,Discuz!图片素材站模板','http://www.zcool.com.cn/','5','10','33,68,46,47');
INSERT INTO `my_soft` VALUES ('21','织梦高仿砍柴网自媒体新闻资讯网站整站源码（含手机WAP版）','','','/uploads/img1/20161008/57f8bd7d493d8.png!300X300.jpg','/uploads/img1/20161008/57f8bd7d493d8.png$$$首页|||/uploads/img1/20161008/57f8bd7ab3b54.png$$$文章详情页|||/uploads/img1/20161008/57f8bd80cfbf4.png$$$列表页','<p>源码介绍：<br/><br/>织梦DEDECMS高仿砍柴网自媒体新闻资讯网站程序，基本与当前砍柴网风格一致，页面设计漂亮大气，多风格列表页，合理的广告位布局，全站可生成静态HTML，带手机WAP版，非常是合作科技媒体资讯网站和自媒体站点使用。<br/><br/>高仿砍柴网自媒体新闻资讯网站源码（织梦DEDE内核+手机WAP版）<br/><br/>安装说明：<br/><br/>1、上传站点跟目录下，执行http://网址/install，完成安装向导；<br/><br/>2、登录后台，http://网址/admin<br/><br/>3、还原数据库，“系统”-“系统设置”-“数据库备份/还原”-“还原数据库”<br/><br/>4、完成数据库还原后，修改“系统设置”-“系统基本参数”<br/><br/>5、生成全站，“更新系统缓存”-“一键更新网站”。<br/><br/>百度云盘提取密码：密码：k65a</p>','','http://pan.baidu.com/s/1eS3Fzl4','源码介绍：\r\n\r\n织梦DEDECMS高仿砍柴网自媒体新闻资讯网站程序，基本与当前砍柴网风格一致，页面设计漂亮大气，多风格列表页，合理的广告位布局，全站可生成静态HTML，带手机WAP版，非常是合作科技媒体资讯网站和自媒体站点使用。\r\n\r\n高仿砍柴网','','1','0','1','','','','1475919236','1476611389','18','25','1','1','','1','0','0','织梦仿砍柴网,织梦整站源码,织梦手机网站','http://www.ikanchai.com/','0','0','60,41,69,72');
INSERT INTO `my_soft` VALUES ('22','最新版方维众筹系统V1.6完美商业破解版（产品+股权众筹+手机版)','','','/uploads/img1/20161009/57f9c1930051c.png!300X300.jpg','/uploads/img1/20161009/57f9c1930051c.png$$$首页|||/uploads/img1/20161009/57f9c194b4bef.png$$$所有项目|||/uploads/img1/20161009/57f9c1955f09a.png$$$最新动态','<p><strong>方维众筹系统V1.6介绍：</strong><br/><br/>PHP+MYSQL开发的众筹网站系统，本系统采用当前最流行的thinkphp框架开发，功能强大、结构清晰。该系统有产品众筹和股权众筹两种模式，内含PC版和手机wap版。<br/><br/><strong>免费下载方维众筹系统V1.6(产品+股权众筹，带wap版)</strong><br/><br/>方维众筹系统v1.6版本更新模板及更新以下内容<br/><br/>增加股权众筹<br/><br/>1、添加文章资讯模块<br/>2、重新定义筛选过虑条件，可以按城市、分类、项目筹资状态进行筛选<br/>3、项目子项增加可以设置虚拟支持人数功能，吸引人气<br/>4、在项目中，添加是否显示：支持者 功能<br/>5、修改会员注册，验证方式分为：无需验证、手机验证、邮箱验证、<br/><br/></p><p>管理员审核<br/><br/>6、增加会员修改密码手机验证<br/>7、修改为后台可以发布城市<br/>8、增加二级分类功能和展示<br/>9、可设置不同等级的会员及项目，相应等级的会员查看对应项目的权限<br/>10、会员中心中支持但未支付完成的项目，在项目结束后不能付款<br/>11、后台项目支持中添加查询和导出功能，方便统计和发放回报<br/>12、添加：注册验证，项目成功，失败，回报发放的短信通知，可以自<br/><br/></p><p>己编辑模板<br/><br/>13、每个产品可以单独设置佣金比例<br/>14、前台会员提交银行账户后可以查看不可修改<br/>15、添加配送地址添加<br/>16、分享到各大微博网站<br/>17、页面预留广告位<br/><br/>方维众筹系统1.53版本虚拟主机服务器安装说明<br/>（股权众筹+产品众筹+wap端）<br/><br/>1、 将压缩包《方维众筹系统1.53版本》（290.82M）解压，将所有文件（363 MB）全选Ftp工具上传网站根目录（请咨询虚拟主机/服务器提供商），此时首页提示domain not authorized（域名未授权）<br/>2、请使用Dreamweave网页编辑软件打开根目录下的license文件（其中license.php不做任何修改）第一行(&quot;localhost&quot;,&quot;127.0.0.1&quot;,&quot;*.域名1&quot;,&quot;*.域名2&quot;,&quot;IP地址&quot;)将自己域名、IP地址填写替换并保存，切勿使用记事本、写字板之类的软件。（只有一个域名时，域名1和域名2填写一个相同域名，虚拟主机临时地址也可以）<br/>域名授权license文件修改授权域名如下图：<br/> <br/>3、打开首页自动进入install安装界面<br/>填写虚拟主机服务器空间商的数据库名、数据库用户名、密码<br/>安装成功！<br/>自动跳转进入网站后台域名/m.php<br/>后台账号+密码<br/>带演示demo是admin &nbsp; aaafanwe<br/>不带演示blank初始密码admin &nbsp; &nbsp;admin<br/><br/></p><p>4、此时打开首页所有图片打开错误（不显示），请在进入后台 系统设置-图片设置-图片服务器域名<br/> 图片服务器域名删除<br/>取消掉设置的域名就ok<br/>5、此时右上角清除缓存，更新商品<br/>即全部安装成功<br/>手机、Pad等移动端访问域名自动进入wap端：域名/wap<br/><br/>免责声明：该资源来源于互联网，不保证100%完整，仅供学习和研究传播，大家请在下载后24小时内删除，一切关于该资源商业行为与www.sucaihuo.com无关。如需商业授权，请前往官方购买。<br/><br/><strong>百度云盘提取密码：jhhj</strong></p>','','http://pan.baidu.com/s/1hrJAjVQ','方维众筹系统V1.6介绍：\r\n\r\nPHP+MYSQL开发的众筹网站系统，本系统采用当前最流行的thinkphp框架开发，功能强大、结构清晰。该系统有产品众筹和股权众筹两种模式，内含PC版和手机wap版。\r\n\r\n免费下载方维众筹系统V1.6(产品+股','','1','0','1','','','','1475985815','1476451301','18','24','1','5','','1','0','0','方维众筹系统,方维股权众筹','http://www.eapoo.com/','0','0','48,69');
INSERT INTO `my_soft` VALUES ('23','最新版方维O2O生活服务系统V3.01免费下载','','','/uploads/img1/20161009/57f9c198eaaeb.png!300X300.jpg','/uploads/img1/20161009/57f9c198eaaeb.png$$$首页|||/uploads/img1/20161009/57f9c197c4d5b.png$$$积分商城|||/uploads/img1/20161009/57f9c19bed194.png$$$活动|||/uploads/img1/20161009/57f9c19ce73c0.png$$$团购|||/uploads/img1/20161009/57f9c19e511e0.png$$$商城|||/uploads/img1/20161009/57f9c1a0328fe.png$$$商家列表','<p><strong>最新版方维O2O生活服务系统介绍：</strong><br/><br/>最新版V3.01方维O2O生活服务系统终于发布了，本系统采用当前最流行、效率最高的框架thinkphp开发。全新UI设计，全新界面布局，这是一套非常不错的O2O本地生活服务平台网站程序。想打造生活服务类网络平台的朋友可以考虑一下这套程序。<br/><br/><strong>方维O2O生活服务系统V3.01版主要功能包括：</strong><br/><br/>团购、商城、同城活动、商家、达人、讨论租、发现（分享）、优惠券、积分商城等。该程序内包含手机版和PC版，功能非常强大。<br/><br/>程序环境：Linux+apache/ngix+PHP(5.2以上版本)+MYSQL（推荐）或者windows+iis+PHP(5.2以上版本)+MYSQL<br/><br/><strong>免费下载方维O2O生活服务系统V3.01</strong><br/><br/>声明：该资源来源于互联网，不保证100%完整及程序的安全，仅供学习和研究使用，大家请在下载后24小时内删除，一切关于该资源商业行为与www.sucaihuo.com无关。如需商业授权，请前往官方购买。<br/><br/><strong>百度云盘提取密码：i4jw</strong></p>','','http://pan.baidu.com/s/1c1LKpfq','最新版方维O2O生活服务系统介绍：\r\n\r\n最新版V3.01方维O2O生活服务系统终于发布了，本系统采用当前最流行、效率最高的框架thinkphp开发。全新UI设计，全新界面布局，这是一套非常不错的O2O本地生活服务平台网站程序。想打造生活服务类','','1','0','1','','','','1475985826','1476451315','32','24','1','5','','1','0','0','方维O2O,方维O2O生活服务系统,方维O2O下载','http://o2o.fanwe.net/','3','0','40,48,52,59,69');
INSERT INTO `my_soft` VALUES ('28','织梦dedecms漂亮的html5响应式装修公司整站源码下载','','','/uploads/img1/20161011/57fc588b0e48d.jpg!300X300.jpg','/uploads/img1/20161011/57fc588b0e48d.jpg$$$首页|||/uploads/img1/20161011/57fc588b4e670.jpg$$$成功案例','<p><strong>源码简介：</strong><br/><br/>这是一套非常漂亮的装修公司PHP网站源码，内核采用织梦dedecms，网站前台页面布局采用HTML5响应式设计，能自适应PC端和手机移动端。出色的SEO，全站可生成静态HTML页面，排版布局简洁大气。该源码不仅能用在装修行业的企业网站，只要你稍加休整也可作为其它行业公司网站使用。<br/><br/>运行环境：php+mysql<br/><br/><strong>下载非常漂亮的html5响应式装修公司PHP网站源码</strong><br/><br/><strong>百度云盘提取密码：n9m9</strong></p>','','http://pan.baidu.com/s/1eRMwmEQ','源码简介：\r\n\r\n这是一套非常漂亮的装修公司PHP网站源码，内核采用织梦dedecms，网站前台页面布局采用HTML5响应式设计，能自适应PC端和手机移动端。出色的SEO，全站可生成静态HTML页面，排版布局简洁大气。该源码不仅能用在装修行业的','','1','0','1','','','','1476155531','1476612723','14','25','1','1','','1','0','0','织梦html5响应式,织梦装修公司源码','/','0','0','42,77,69');
INSERT INTO `my_soft` VALUES ('27','小清新淘宝客源码下载（织梦dedecms内核）','','','/uploads/img1/20161010/57fb06698a745.jpg!300X300.jpg','/uploads/img1/20161010/57fb06698a745.jpg$$$首页|||/uploads/img1/20161010/57fb0669b85e9.jpg$$$店铺列表页|||/uploads/img1/20161010/57fb0669e15c5.jpg$$$详情页','<p><strong>织梦dedecms小清新淘宝客源码程序介绍：</strong><br/><br/>织梦dedecms内核的小清新淘宝客程序，全站可生成HTML，看界面设计的还不错，故分享给大家。现在做导购类站点，还是比较适合个人站长的，可以选择一类商品做垂直导购，这个程序还是不错的。<br/><br/><strong>织梦淘宝客源码安装教程：</strong><br/><br/>1、传到空间<br/>2、输入安装地址：http://域名/install/index.php（如果出现“dir”，请按照下面的图文或视频安装教程）<br/> &nbsp; &nbsp; 数据表前缀：dede_ （不要修改）<br/>3、安装完成后 进入后台：/dede &nbsp; &nbsp; \r\n<br/> &nbsp; 还原数据（系统――数据库备份/还原――数据还原（右上角）――开始还原数据）<br/>4、数据还原后修改密码（默认账户密码都是admin）<br/>5、更改系统配置，把域名换成你的域名，然后在生成（重要）<br/>6、生成全站-每次修改都要生成（生成――一键更新网站――更新所有――开始更新――更新系统缓存――开始执行。）<br/><br/><strong>百度云盘提取密码：nfek</strong></p>','','http://pan.baidu.com/s/1eSDiXb0','织梦dedecms小清新淘宝客源码程序介绍：\r\n\r\n织梦dedecms内核的小清新淘宝客程序，全站可生成HTML，看界面设计的还不错，故分享给大家。现在做导购类站点，还是比较适合个人站长的，可以选择一类商品做垂直导购，这个程序还是不错的。\r\n\r\n织','','1','0','1','','','','1476068970','1476611669','12','25','1','1','','1','0','0','淘宝客源码,织梦淘宝客源码,dedecms淘宝客','/','0','0','48,73');
INSERT INTO `my_soft` VALUES ('29','最新Modoer点评系统V3.4多城市商业破解版','','','/uploads/img1/20161011/57fc588f765c8.png!300X300.jpg','/uploads/img1/20161011/57fc588f765c8.png$$$首页|||/uploads/img1/20161011/57fc588b8f9f8.png$$$榜单|||/uploads/img1/20161011/57fc588da696d.png$$$资讯|||/uploads/img1/20161011/57fc588e616ba.png$$$礼品|||/uploads/img1/20161011/57fc5890b3efa.png$$$小组|||/uploads/img1/20161011/57fc58918e153.png$$$活动|||/uploads/img1/20161011/57fc5892b7188.png$$$点评|||/uploads/img1/20161011/57fc5893c86be.png$$$商城','<p style=\"line-height: 2em; text-indent: 0em;\"><strong>源码简介：</strong><br/><br/>目前市面上做专门做点评系统的很少，Modoer为数不多的PHP点评系统，其功能可谓是非常完善的了。Modoer是一款以本地分享，多类型、多功能的点评网站管理系统。<br/><br/>该系统采用PHP+MYSQL架构，主要功能包括兑奖中心、资讯、礼品、优惠券、会员卡、相册、点评、圈子等，能满足站长的各类需求。而且该系统内置万能整合API，强大的整合功能不仅能整合UCenter，还可与任何PHP程序的会员进行整合，共享。<br/><br/><strong>免费下载最新Modoer点评系统V3.4多城市商业破解版</strong><br/><br/><strong>Modoer点评系统功能介绍</strong><br/><br/>多类型的点评系统<br/><br/>一款专业的点评网站系统，多种行业的点评，可以自由调控点评项目，类型。Web2.0的建站方式，网站会员能让快速上手。<br/><br/>专业的点评功能<br/><br/>针对各个点评板块，自定义主题字段，自定义点评项名称和评分项数量，喜欢程度，人均消费，消费感受，适合各个类型进行点评，会员并可推荐产品以及设置店铺Tag，其他会员可以对点评进行献花和回应，反馈，举报点评。<br/><br/>丰富的模块功能<br/><br/>默认集成产品、会员卡、优惠券、兑奖中心、新闻咨询、评论等模块，满足站长的各类需求，提供站长盈利模式和网站互动解决方案。<br/><br/>自由开放的平台<br/><br/>Modoer开放源代码，以模块为基础，由框架+多模块组成，同时可以独立开发新模块，安装所需的模块，可自由扩展系统功能，同时支持插件开发；Modoer支持多风格切换功能，可以自由设计自己的网站风格；内置了数据自定义数据调用功能，丰富的调用标签，可将任何数据调用在任何页面，从而达到独有的特色网站。<br/><br/>与各类系统的联动<br/><br/>Modoer可以整合UCenter（账户、短信、好友、积分兑换、Feed推送和个人空间插件），从而可联动所有支持UCenter的系统；同时内置万能整合API，可与任何PHP程序的会员进行整合，共享。<br/><br/><span style=\"color: rgb(192, 0, 0);\">免责声明：<br/><br/>该源码仅供学习和研究之用，请大家请在下载后24小时内删除，一切关于该资源商业行为与www.sucaihuo.com无关。</span><br/><br/><strong>百度云盘提取密码：d9co</strong></p>','','http://pan.baidu.com/s/1jHRDLzC','源码简介：\r\n\r\n目前市面上做专门做点评系统的很少，Modoer为数不多的PHP点评系统，其功能可谓是非常完善的了。Modoer是一款以本地分享，多类型、多功能的点评网站管理系统。\r\n\r\n该系统采用PHP+MYSQL架构，主要功能包括兑奖中心、资讯','','1','0','1','','','','1476155542','1476612781','14','25','1','1','','1','0','0','Modoer点评系统,Modoer多城市破解版','http://www.modoer.org/ningbo/','0','0','40,48,59,69,72');
INSERT INTO `my_soft` VALUES ('26','功能强大的PHP+MYSQL微信三级分销系统下载','','','/uploads/img1/20161010/57fb0668aaed4.jpg!300X300.jpg','/uploads/img1/20161010/57fb0668aaed4.jpg$$$订单与结算|||/uploads/img1/20161010/57fb0668e29fd.jpg$$$产品及文案|||/uploads/img1/20161010/57fb066918ad4.jpg$$$登录页|||/uploads/img1/20161010/57fb0669331ac.jpg$$$我的公众号|||/uploads/img1/20161010/57fb06695c8ef.jpg$$$产品详情','<p><strong>PHP+MYSQL微信三级分销系统介绍：</strong><br/><br/>微信分销系统，主要用于通过微信公众号帮助别人分享、推广产品，当有用户下单并付款，分享者将获取商品销售分成，系统可以实现商品添加、分销数据统计、用户注册、微信公众号添加等。想达到微信分销管理目的朋友，不妨试试这套系统。<br/><br/>程序环境：PHP5.2（或以上）+MySQL<br/><br/><strong>功能强大的PHP+MYSQLPHP+SQL微信分销平台系统</strong><br/><br/>安装说明： \r\n<br/><br/>1、空间环境支持PHP（PHP5.2之上均可，最好是5.2版本，兼容性高）语言，带有mysql数据库。 \r\n<br/>2、上传你的源码到你购买的空间或者是我们的主机，技术员会协助您搭建和维护。 \r\n<br/>3、更改conn/mysql.php为你自己购买的数据库用户名，数据库名，和你的数据库密码. \r\n<br/>4、修改admin/connect/c.php为你自己购买的数据库用户名，数据库名，和你的数据库密码<br/>5、打开你购买的数据库管理，导入fenyong.sql文件到你的数据库，这样就安装完成了，服务器的话用服务器自带的数据库管理工具操作还原。 \r\n<br/>后台用户名为：你的域名/admin 后台密码：112233<br/><br/>切换首页模板说明：<br/><br/>选择需要的首页模板，重命名为index.php即可。共五套模板：index.php（默认）、index1.html、index2.html、index3.html、index4.html<br/><br/><strong>百度云盘提取密码：idwy</strong></p>','','http://pan.baidu.com/s/1pKQh9j1','PHP+MYSQL微信三级分销系统介绍：\r\n\r\n微信分销系统，主要用于通过微信公众号帮助别人分享、推广产品，当有用户下单并付款，分享者将获取商品销售分成，系统可以实现商品添加、分销数据统计、用户注册、微信公众号添加等。想达到微信分销管理目的朋友','','1','0','1','','','','1476068969','1476611630','12','25','1','1','','1','0','0','PHP+MYSQL,微信三级分销系统,微信分销系统','/','0','0','48,73,75');
INSERT INTO `my_soft` VALUES ('30','thinkphp5.0开源系统SentCMS网站管理系统3.0RC下载','','','/uploads/img1/20161011/57fd03775fb19.png!300X300.jpg','/uploads/img1/20161011/57fd03775fb19.png$$$后台首页','<p>SentCMS系统使用thinkphp5.0框架，主要功能有内容管理、会员管理、权限管理等，在底层上，很多借鉴Onethink的开发理念。<br/><br/><strong>SentCMS介绍：</strong><br/><br/>SentCMS网站管理系统是南昌腾速科技有限公司倾力打造的一款简单易用的网站管理系统，SentCMS网站管理系统（下文简称SentCMS）继承了thinkphp5.0的优秀品质，秉承“大道至简”的设计理念。SnetCMS为网站建设而生，为网站建设减少90%的代码编写，只需前端设计师就可以设计出完美的网站，而如此完美的系统还是完全开源的。<br/><br/>安装说明：<br/><br/>访问网址：http://您的域名/install<br/><br/>系统必须开启伪静态<br/><br/><strong>SentCMS特性包括：</strong><br/><br/>全新的路由体系，完美的路由解决方案<br/>全新的系统架构，采用thinkphp5.0内核框架<br/>完善而健全的会员体系<br/>健全的权限系统，权限细化到界面上的按钮和链接<br/>漂亮的后台界面，后台界面采用世界领先的前端框架bootstrap，自适应的体验<br/>简单易用的标签体系<br/>便捷的文档系统，无需程序即可设计出完美的模型，做出完美的网站<br/>下载最新版框架后，解压缩到web目录下面，可以看到初始的目录结构如下：<br/><br/>目录结构<br/>├─addons &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;扩展插件目录<br/>├─application &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 项目目录文件<br/>│ ├─admin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 网站后台模型<br/>│ │ ├─controller<br/>│ │ ├─static<br/>│ │ ├─view<br/>│ │ ├─config.php<br/>│ ├─api &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; API接口模型<br/>│ │ ├─controller<br/>│ │ ├─static<br/>│ │ ├─view<br/>│ │ ├─config.php<br/>│ ├─common &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; COMMON公共模型，不可访问<br/>│ │ ├─controller<br/>│ │ ├─static<br/>│ │ ├─view<br/>│ │ ├─config.php<br/>│ ├─index &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 前台模型<br/>│ │ ├─controller<br/>│ │ ├─static<br/>│ │ ├─view<br/>│ │ ├─config.php<br/>│ ├─user &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用户中心模型<br/>│ │ ├─controller<br/>│ │ ├─static<br/>│ │ ├─view<br/>│ │ ├─config.php<br/>│ ├─common.php &nbsp; &nbsp; &nbsp; &nbsp;公共函数库文件<br/>│ ├─config.php &nbsp; &nbsp; &nbsp; &nbsp;基础配置文件<br/>│ ├─database.php &nbsp; &nbsp; &nbsp;数据库配置文件<br/>│ ├─route.php &nbsp; &nbsp; &nbsp; &nbsp; 路由配置文件<br/>│ ├─tags.php &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;行为扩展配置文件<br/>│ ├─ueditor.json &nbsp; &nbsp; &nbsp;编辑配置文件<br/>├─core &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;thinkphp框架目录<br/>├─data &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;缓存以及备份目录<br/>├─public &nbsp; &nbsp; &nbsp; &nbsp; 公共资源库<br/>├─uploads &nbsp; &nbsp; &nbsp; &nbsp;上传文件目录<br/>├─.htaccess &nbsp; &nbsp; &nbsp;Apache下伪静态文件<br/>├─favicon.ico &nbsp; &nbsp;ico图标<br/>├─index.php &nbsp; &nbsp; &nbsp;入口文件<br/>├─README.md &nbsp; &nbsp; &nbsp;系统介绍文件</p>','','https://git.oschina.net/sentcms/sentcms','SentCMS系统使用thinkphp5.0框架，主要功能有内容管理、会员管理、权限管理等，在底层上，很多借鉴Onethink的开发理念。\r\n\r\nSentCMS介绍：\r\n\r\nSentCMS网站管理系统是南昌腾速科技有限公司倾力打造的一款简单易用的网','','1','0','1','','','','1476199287','1476451240','10','24','1','1','','1','0','0','thinkphp5.0,thinkphp5.0开源系统,SentCMS下载','http://www.tensent.cn/','2','0','41,42,55,60,69');
INSERT INTO `my_soft` VALUES ('31','thinkphp5.0开源系统LUFFYCMS v5.0先行版下载','','','/uploads/img1/20161011/57fd0378b003e.png!300X300.jpg','/uploads/img1/20161011/57fd0378b003e.png$$$系统主界面|||/uploads/img1/20161011/57fd0377f0c0b.png$$$修改用户组|||/uploads/img1/20161011/57fd03796d2bc.png$$$登录页面|||/uploads/img1/20161011/57fd037a2fedc.png$$$用户组列表','<p><strong>LUFFYCMS v5.0简介</strong><br/><br/>LUFFYCMS是一个轻量级企业网站内容管理框架，采用ThinkPHP5.0开发，前端采用Bootstrap框架。<br/><br/>运行环境:PHP &gt;= 5.4.0 mysql &gt;= 5.5<br/>Git地址 Downloads（最新版本随时更新）<br/><br/>因为目前 ThinkPHP 5 正处于高速发展阶段，会导致cms经常更新。<br/><br/><strong>LUFFYCMS v5.0安装说明</strong><br/><br/>1.手动下载luffycms<br/>2.解压 Luffycms 然后切换到 thinkphp目录 把thinkphp5解压到这个目录里</p>','','https://codeload.github.com/lovezhao311/luffycms/zip/master','LUFFYCMS v5.0简介\r\n\r\nLUFFYCMS是一个轻量级企业网站内容管理框架，采用ThinkPHP5.0开发，前端采用Bootstrap框架。\r\n\r\n运行环境:PHP &gt;= 5.4.0 mysql &gt;= 5.5\r\nGit地址 Downloa','','1','0','1','','','','1476199290','1476451222','7','24','1','5','','1','0','0','thinkphp5.0,thinkphp5.0开源系统,LUFFYCMS下载','/','2','0','41,42,44,55,60,69');
INSERT INTO `my_soft` VALUES ('32','thinkphp3.2开源系统KenCMS内容管理系统V1.1（企业版带会员系统）','','','/uploads/img1/20161011/57fd037ad953c.png!300X300.jpg','/uploads/img1/20161011/57fd037ad953c.png$$$后台首页|||/uploads/img1/20161011/57fd037b41f84.png$$$文章管理页','<p><strong>KenCMS内容管理系统V1.1简介</strong><br/><br/>KenCMS（内容管理系统）是一款PHP+MYSQL开发的中文内容管理系统,基于thinkphp3.2。KenCMS提出灵活的应用机制，系统以简洁、简单易懂为主，系统自身提供基础的管理功能，而开发者可以根据自身的需求以应用的形式进行扩展。每个应用都能独立的完成自己的任务，也可通过系统调用其他应用进行协同开发。<br/><br/>KenCMS能够为您快速搭建一个方便的后台信息管理系统，并且提供简洁易用的管理界面。大部分CMS系统往往功能都是比较庞大繁杂的,而KenCMS就像一个框架，让您自由发挥，KenCMS只是帮你创建一个方便可用的后台信息管理，并集成一些常用的操作。简而言之，KenCMS能够帮你轻松搞定信息的增删改查、权限管理（多管理员）和数据文件管理。KenCMS可快速度开发企业网站，大大的降低了开发成本和沟通成本。<br/><br/>KenCMS（内容管理系统）内部只是已一个应用的形式存在，所以使用KenCMS你可以用来管理你的内容，视频，电商产品网站，新闻资讯等更多。这些程序不会影响，你可以模块化的增加或减少应用。<br/><br/>KenCMS自身层次非常清晰，逻辑也相当的严谨，无论你是专业的PHP开发者还是初学者KenCMS都是你最好的选择。采用了国内优秀的开源php框架ThinkPHP使得KenCMS具备了优秀的性能以及良好的安全性。<br/><br/><strong>百度云盘提取密码密码：i13i</strong></p>','','http://pan.baidu.com/s/1kVnq1gj','thinkphp3.2开源系统KenCMS内容管理系统V1.1（企业版带会员系统）\r\n\r\nKenCMS内容管理系统V1.1简介\r\n\r\nKenCMS（内容管理系统）是一款PHP+MYSQL开发的中文内容管理系统,基于thinkphp3.2。KenCM','','1','0','1','','','','1476199291','1476451201','18','24','1','1','','1','0','0','thinkphp3.2开源系统,KenCMS内容管理系统V1.1','http://qy.kencms.com/','2','0','41,42,55,60,69');
INSERT INTO `my_soft` VALUES ('33','thinkphp5源码DuoThinkCMS综合门户类管理系统下载（T5 RC3+AmazeUI-2.6.2）','','','/uploads/img1/20161012/57fdb41cc9c8d.png!300X300.jpg','/uploads/img1/20161012/57fdb41cc9c8d.png$$$前台首页|||/uploads/img1/20161012/57fdb41dd5494.png$$$后台首页|||/uploads/img1/20161012/57fdb41e6b830.png$$$前台会员注册页|||/uploads/img1/20161012/57fdb41f4df88.png$$$前台文章列表页|||/uploads/img1/20161012/57fdb42170d20.png$$$前台文章详情页|||/uploads/img1/20161012/57fdb4202c85e.png$$$内容管理|||/uploads/img1/20161012/57fdb420d76db.png$$$微官网管理|||/uploads/img1/20161012/57fdb4226333f.png$$$前台会员中心','<p><strong>DuoThinkCMS源码简介：</strong><br/><br/>这是一套thinkphp5开发的综合内容管理系统，虽然作者目前只做小部分功能，但是基本能满足普通门户资讯功能，后续进一步完善之中。<br/><br/>duothinkcms<br/><br/>thinkphp5 rc4 框架，正式内容管理系统，精简ui版本<br/>想了多种名字，也换了多种名字，最后发现我想多了，干脆就换成这个名字了DuoThinkCMS。<br/><br/>谈不上CMS，很多复杂功能，需要自定义重新开发。二次开发完全遵循原thinkphp5 rc4 标准，可以让大家借鉴参考一下。鉴于本人水平有限，很多写的不好的地方大家也就呵呵一下！<br/><br/>功能预览<br/><br/>内容管理<br/>微信公众号<br/>插件管理<br/>全局设置<br/>用户管理<br/>特色说明<br/><br/>最大化使用模型和数据缓存，目前没有采用Db::table()<br/>后台管理只支持html5浏览器 大部分采用data api操作curd<br/><br/>ThinkPHP5在保持快速开发和大道至简的核心理念不变的同时，PHP版本要求提升到5.4，对已有的CBD模式做了更深的强化，优化核心，减少依赖，基于全新的架构思想和命名空间实现，是ThinkPHP突破原有框架思路的颠覆之作，其主要特性包括：<br/><br/>基于命名空间和众多PHP新特性<br/>核心功能组件化<br/>强化路由功能<br/>更灵活的控制器<br/>重构的模型和数据库类<br/>配置文件可分离<br/>重写的自动验证和完成<br/>简化扩展机制<br/>API支持完善<br/>改进的Log类<br/>命令行访问支持<br/>REST支持<br/>引导文件支持<br/>方便的自动生成定义<br/>真正惰性加载<br/>分布式环境支持<br/>更多的社交类库<br/>ThinkPHP5的运行环境要求PHP5.4以上。<br/>详细开发文档参考 ThinkPHP5完全开发手册<br/><br/>目录结构<br/><br/>初始的目录结构如下：<br/><br/>www &nbsp;WEB部署目录（或者子目录）<br/>├─composer.json &nbsp; &nbsp; &nbsp; &nbsp; composer定义文件<br/>├─README.md &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; README文件<br/>├─LICENSE.txt &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 授权说明文件<br/>├─think &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 命令行入口文件<br/>├─application &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 应用目录<br/>│ &nbsp;├─common &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 公共模块目录（可以更改）<br/>│ &nbsp;├─runtime &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;应用的运行时目录（可写，可定制）<br/>│ &nbsp;├─module_name &nbsp; &nbsp; &nbsp; &nbsp;模块目录<br/>│ &nbsp;│ &nbsp;├─config.php &nbsp; &nbsp; &nbsp;模块配置文件<br/>│ &nbsp;│ &nbsp;├─common.php &nbsp; &nbsp; &nbsp;模块函数文件<br/>│ &nbsp;│ &nbsp;├─controller &nbsp; &nbsp; &nbsp;控制器目录<br/>│ &nbsp;│ &nbsp;├─model &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 模型目录<br/>│ &nbsp;│ &nbsp;├─view &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;视图目录<br/>│ &nbsp;│ &nbsp;└─ ... &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;更多类库目录<br/>│ &nbsp;│<br/>│ &nbsp;├─common.php &nbsp; &nbsp; &nbsp; &nbsp; 公共函数文件<br/>│ &nbsp;├─config.php &nbsp; &nbsp; &nbsp; &nbsp; 公共配置文件<br/>│ &nbsp;├─route.php &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;路由配置文件<br/>│ &nbsp;└─database.php &nbsp; &nbsp; &nbsp; 数据库配置文件<br/>│<br/>├─public &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;WEB目录（对外访问目录）<br/>│ &nbsp;├─index.php &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;入口文件<br/>│ &nbsp;└─.htaccess &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用于apache的重写<br/>│<br/>├─thinkphp &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;框架系统目录<br/>│ &nbsp;├─lang &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 语言文件目录<br/>│ &nbsp;├─library &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;框架类库目录<br/>│ &nbsp;│ &nbsp;├─think &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Think类库包目录<br/>│ &nbsp;│ &nbsp;└─traits &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;系统Trait目录<br/>│ &nbsp;│<br/>│ &nbsp;├─mode &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 应用模式目录<br/>│ &nbsp;├─tpl &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;系统模板目录<br/>│ &nbsp;├─tests &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;单元测试文件目录<br/>│ &nbsp;├─base.php &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 基础定义文件<br/>│ &nbsp;├─console.php &nbsp; &nbsp; &nbsp; &nbsp;控制台入口文件<br/>│ &nbsp;├─convention.php &nbsp; &nbsp; 框架惯例配置文件<br/>│ &nbsp;├─helper.php &nbsp; &nbsp; &nbsp; &nbsp; 助手函数文件<br/>│ &nbsp;├─phpunit.xml &nbsp; &nbsp; &nbsp; &nbsp;phpunit配置文件<br/>│ &nbsp;└─start.php &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;框架入口文件<br/>│<br/>├─extend &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;扩展类库目录<br/>├─vendor &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;第三方类库目录（Composer依赖库）<br/>router.php用于php自带webserver支持，可用于快速测试 切换到public目录后，启动命令：php -S localhost:8888 router.php 上面的目录结构和名称是可以改变的，这取决于你的入口文件和配置参数。<br/>命名规范<br/><br/>ThinkPHP5遵循PSR-2命名规范和PSR-4自动加载规范，并且注意如下规范：<br/><br/>目录和文件<br/><br/>目录不强制规范，驼峰和小写+下划线模式均支持；<br/>类库、函数文件统一以.php为后缀；<br/>类的文件名均以命名空间定义，并且命名空间的路径和类库文件所在路径一致；<br/>类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）；<br/>函数和类、属性命名<br/><br/>类的命名采用驼峰法，并且首字母大写，例如 User、UserType，默认不需要添加后缀，例如UserController应该直接命名为User；<br/>函数的命名使用小写字母和下划线（小写字母开头）的方式，例如 get_client_ip；<br/>方法的命名使用驼峰法，并且首字母小写，例如 getUserName；<br/>属性的命名使用驼峰法，并且首字母小写，例如 tableName、instance；<br/>以双下划线“__”打头的函数或方法作为魔法方法，例如 __call 和 __autoload；<br/>常量和配置<br/><br/>常量以大写字母和下划线命名，例如 APP_PATH和 THINK_PATH；<br/>配置参数以小写字母和下划线命名，例如 url_route_on 和url_convert；<br/>数据表和字段<br/><br/>数据表和字段采用小写加下划线方式命名，并注意字段名不要以下划线开头，例如 think_user 表和 user_name字段，不建议使用驼峰和中文作为数据表字段命名。</p>','','https://coding.net/u/dantes/p/duothink/git','DuoThinkCMS源码简介：\r\n\r\n这是一套thinkphp5开发的综合内容管理系统，虽然作者目前只做小部分功能，但是基本能满足普通门户资讯功能，后续进一步完善之中。\r\n\r\nduothinkcms\r\n\r\nthinkphp5 rc4 框架，正式内容管','','1','0','1','','','','1476244515','1476612910','14','24','1','5','','1','0','0','thinkphp5源码,DuoThinkCMS,综合门户,AmazeUI','/','1','0','40,42,43,55,59,41,69,72');
INSERT INTO `my_soft` VALUES ('34','thinkphp手游平台程序源码 渠道SDK+手游盒子APP+推广联盟系统','','','/uploads/img1/20161012/57fdb42348695.png!300X300.jpg','/uploads/img1/20161012/57fdb42348695.png$$$前台首页|||/uploads/img1/20161012/57fdb4253b2db.png$$$后台首页|||/uploads/img1/20161012/57fdb42629e4a.png$$$前台会员中心','<p>源码简介：<br/><br/>溪谷软件vlcms手游平台程序SDK系统及APP系统板块是基于安卓开发，手游CPS渠道推广联盟系统、PC官网以及H5平台采用简单而强大的thinkphp内容管理框架，依托最新thinkphp的功能特性，全新的架构和模块化的开发机制做为主要功能开发形式，开源代码灵活易扩展，在安全稳定的同时带来二次开发的便捷。 后台管理系统采用全新框架设计，扁平化操作界面更为清晰简洁，让运营上手更为容易。<br/><br/>thinkphp手游平台程序源码 渠道SDK+手游盒子APP+推广联盟系统<br/><br/>开发语言：PHP<br/><br/>操作系统：跨平台<br/><br/>产品主页：http://www.vlcms.com/</p>','','http://dl.vlcms.com/dl/vlcms-V1.2.zip','源码简介：\r\n\r\n溪谷软件vlcms手游平台程序SDK系统及APP系统板块是基于安卓开发，手游CPS渠道推广联盟系统、PC官网以及H5平台采用简单而强大的thinkphp内容管理框架，依托最新thinkphp的功能特性，全新的架构和模块化的开发','','1','0','1','','','','1476244519','1476451148','13','24','1','5','','1','0','0','thinkphp手游平台源码,thinkphp源码','http://pc.vlcms.com/','3','0','43,66,69');
INSERT INTO `my_soft` VALUES ('35','ThinkPHP3.1.3开源系统远航企业网站管理系统(分站版)v2.6下载','','','/uploads/img1/20161012/57fdb42a11a4a.png!300X300.jpg','/uploads/img1/20161012/57fdb42a11a4a.png$$$首页|||/uploads/img1/20161012/57fdb4274adc3.png$$$新闻中心|||/uploads/img1/20161012/57fdb4283c5cb.png$$$诚聘英才|||/uploads/img1/20161012/57fdb42b5484a.png$$$产品中心|||/uploads/img1/20161012/57fdb42d34cc1.png$$$成功案例|||/uploads/img1/20161012/57fdb42e4949e.png$$$关于我们','<p><strong>源码介绍：</strong><br/><br/>远航CMS是一套基于ThinkPHP3.1.3为核心开发的专业营销型企业建站系统。是国内首家免费+开源自带分站系统的内容管理系统。长期以来不断的完善、创新，远航CMS会为您带来全新的体验！<br/><br/>开发语言：PHP+MYSQL<br/><br/>操作系统：Windows,Linux/Unix<br/><br/><strong>远航CMS的十大优势：</strong><br/><br/>模板分离：模板程序分离，深度二次开发<br/>三网合一：电脑/手机/微信 多终端访问<br/>自定义广告：图片/文字/动画<br/>定时发布：SEO维护，无需人工值守<br/>多词生成：栏目关键词多方案生成<br/>SEO设置：自定义URL/关键字<br/>商业模板：多套精美模板供您选择<br/>城市分站：任意设置城市推广区域<br/>热门标签：自动替换关键词链接<br/>站点地图：一键生成xml地图<br/><br/><strong>远航CMS安装说明：</strong><br/><br/>远航CMS 基于ThinkPHP3.1.3 开源框架开发，对 PHP 和 MySQL 版本有一定的限制，PHP 版本需要 5.2 及以上版本，MySQL 版本需要 5.0 及以上版本。<br/><br/>其他：空间需要支持伪静态</p>','','https://pan.baidu.com/s/1kV32e2r','源码介绍：\r\n\r\n远航CMS是一套基于ThinkPHP3.1.3为核心开发的专业营销型企业建站系统。是国内首家免费+开源自带分站系统的内容管理系统。长期以来不断的完善、创新，远航CMS会为您带来全新的体验！\r\n\r\n开发语言：PHP+MYSQL\r\n\r\n操','','1','0','1','','','','1476244526','1476451106','24','24','1','1','','1','0','0','ThinkPHP3.1.3,ThinkPHP开源系统,远航企业网站管理系统,远航CMS','http://demo.yhcms.cn/','2','0','41,42,55,69');
INSERT INTO `my_soft` VALUES ('36','thinkphp开源系统里程密开源博客系统最新版V2.2下载','','','/uploads/img1/20161013/57fefef68f66b.jpg!300X300.jpg','/uploads/img1/20161013/57fefef68f66b.jpg$$$首页','<p>里程密开源博客系统V2.2介绍：<br/><br/>里程密是一款ThinkPHP开源博客系统，也是一个程序员汇集的地方,在这里程序员们无所不谈,从技术到生活,这里是属于程序员的家,希望你也能加入我们!<br/><br/>里程密的特性包括：<br/><br/>博客所有内容均可以在后台进行修改，整个博客360无死角，并且带有邮件发送系统，会员注册，数据备份恢复，在线升级等.<br/><br/>博客后台完全傻瓜式操作，所有后台功能，即看即会，无需任何功底，无需掌握任何技术，谁都可以是个人站长.<br/><br/>里程密开源博客系统代码仅3M左右（不含样式文件，包含框架文件），采用市面主流框架Thinkphp，易读，易用.<br/><br/>里程密开源博客系统支持主题的一键切换，不需要自己动任何一行代码，也能有绚丽的博客，随时随地，想用哪套用哪套.<br/><br/>开发语言：PHP<br/><br/>操作系统：Windows,Linux/Unix,OS X,Android,iPhone/iPad/iPod,Windows Phone<br/><br/>里程密开源博客系统最新版V2.2更新说明：<br/><br/>1.关闭DEBUG 不会再报出错误信息 也不会在有SQL注入<br/>2.支持自定义404错误页面 \\Application\\Common\\Conf\\config.php ERROR_PAGE属性是自定义404页面地址<br/>3.前台以及后台登陆所有变量参数全部改用I函数过滤<br/>4.后台管理增加ICP备案号管理<br/>5.页面底部管理员邮件点击改成A连接<br/>6.删除文章的时候连评论一起删除<br/>7.增加文章置顶功能<br/>8.修改评论数量查询方式<br/>9.增加评论管理<br/>10.去掉心情样式和电影样式<br/>11.固定左侧导航栏<br/>12.修改评论顺序<br/>13.增加主题切换<br/>14.增加文章分享功能<br/>15.幻灯片里面的图片随着分辨率拉伸填充<br/>16.增加分类排序<br/>17.更换编辑器<br/>18.发表文章图片不再必选（默认图片位置在：\\Public\\Uploads\\thumb.jpg）<br/>19.文章加密（输入密码之后才可查看）<br/>20.会员中心独立出来</p>','','https://pan.baidu.com/s/1pLo3gnD','里程密开源博客系统V2.2介绍：\r\n\r\n里程密是一款ThinkPHP开源博客系统，也是一个程序员汇集的地方,在这里程序员们无所不谈,从技术到生活,这里是属于程序员的家,希望你也能加入我们!\r\n\r\n里程密的特性包括：\r\n\r\n博客所有内容均可以在后台进行修','','1','0','1','','','','1476329207','1476451084','12','24','1','1','','1','0','0','thinkphp开源系统,里程密开源博客','http://bailandi.lcm.wang/','3','0','44,69,70');
INSERT INTO `my_soft` VALUES ('38','thinkphp开源社交系统OpenSNS V3.2.0下载','','','/uploads/img1/20161014/580068e138578.png!300X300.jpg','/uploads/img1/20161014/580068e138578.png$$$首页|||/uploads/img1/20161014/580068ddbc714.png$$$资讯|||/uploads/img1/20161014/580068e3621cf.png$$$会员|||/uploads/img1/20161014/580068e5222da.png$$$热门问题','<p>OpenSNS是一款社交操作系统软件，快速搭建一个类似新浪微博一样的功能强大、样式美观的社交网站。如今推出了V3.20版本，功能更为强大。<br/><br/>开发语言：HTML/CSS<br/><br/>操作系统：跨平台,Windows,Linux/Unix,OS X,Android,iPhone/iPad/iPod<br/><br/><strong>OpenSNS V3.2.0开源社交系统介绍</strong><br/><br/>自2016年8月18日，OpenSNS V3发布以来，OpenSNS一直在提升OS用户体验道路上马不停蹄地前进！ 常关注OpenSNS官方社群的站长们不难发现，每天都有一点变化，每天都会有惊喜等着发生。OS官方社群上产品经理常年驻扎，和用户不断交流获取更多有效建议，可以说，OS在不断前进的道路上凝聚了官方和站长们共同的心血，才有了OS不断的更新迭代。<br/><br/>此次更新由3.1.1更新至3.2.0，以下是主要更新内容:<br/><br/>1.调整了我的圈子的样式，UI造型更有爱<br/> <br/>2.优化了我的社群小卡片，功能展开更丰富<br/> <br/>3.美化了发布类型， 发文章、发微博更方便<br/> <br/>4.增加了新微博的即时提醒，动态捕捉更及时<br/> <br/>5.增加了微博文章类型的筛选，获取信息更便捷<br/> <br/>6.增加了评论点赞功能，评论互动更有趣<br/> <br/>以上只是在视觉上变动比较大的更新，给大家简单列举了一些，除此之外官方还修复了一些已知bug,调整了一些问题。<br/><br/>以下是本次更新日志：<br/><br/>* 【新增】新增socket。<br/>* 【修复】后台个人主页展示选项出现两次BUG<br/>* 【调整】默认分页和微博评论分页美化<br/>* 【修复】小名片上聊天和个人主页聊天优先使用阿里悟空<br/>* 【修复】话题页面发动态，无法上传图片bug修复<br/>* 【修复】找人模块 推荐bug \r\n<br/>* 【新增】模块按身份可访问<br/>* 【调整】去掉动态评论列表底部多出的一个像素的底线<br/>* 【调整】修改邮箱后缀后清理缓存<br/>* 【新增】第三方登录邮箱后缀 配置项<br/>* 【新增】第三方同步登陆成功后那个个人资料里的邮箱的后缀xxx@xxx.com可以后台设置<br/>* 【新增】我的社群卡片扩展，当超过4个的时候出现向下箭头，点击展开全部的社群功能<br/>* 【修复】找人模块好友也关注显示错误<br/>* 【修复】修复微博列表某些页面没内容bug<br/>* 【新增】话题关注sql表<br/>* 【调整】话题消息提示函数调整<br/>* 【新增】积分日志导出<br/>* 【新增】自动导出积分和行为日志<br/>* 【新增】个人主页增加用户关注话题列表<br/>* 【修复】前台模块里的二级导航多出一个空白a标签BUG<br/>* 【修复】后台个人主页设置中关注/粉丝不展示BUG<br/>* 【修复】微博评论里链接和图片显示BUG<br/>* 【修复】热门资讯会显示预期发布的资讯的bug<br/>* 【新增】资讯预发布功能<br/>* 【新增】资讯预发布功能<br/>* 【修复】用户收不到关注话题的更新通知<br/>* 【新增】话题关注功能<br/>* 【新增】群发消息增加群发邮件和短信功能<br/>* 【修复】修复loading bug<br/>* 【新增】下拉的导航栏增加链接<br/>* 【修复】获取本地图片地址bug修复<br/>* 【修复】微博评论缓存bug修复<br/>* 【调整】会员展示模块，随机推荐算法调整<br/>* 【新增】微博评论加入点赞功能<br/>* 【修复】命名bug修复<br/>* 【修复】微博评论bug<br/>* 【调整】修改个人中心关注和聊天两个按钮样式<br/><br/><strong>thinkphp开源社交系统OpenSNS V3.2.0下载</strong></p>','','http://upload.opensns.cn/Uploads_Download_2016-10-13_57ff41eb5a8b2.zip','OpenSNS是一款社交操作系统软件，快速搭建一个类似新浪微博一样的功能强大、样式美观的社交网站。如今推出了V3.20版本，功能更为强大\r\n\r\n开发语言：HTML/CSS\r\n\r\n操作系统：跨平台,Windows,Linux/Unix,OS X,An','','1','0','1','','','','1476421862','1476451034','5','24','1','1','','1','0','0','thinkphp开源社交系统,OpenSNS','http://os.opensns.cn/weibo','0','0','54,59,69');
INSERT INTO `my_soft` VALUES ('37','thinkphp开源系统TuziCMS（兔子cms）V2.5企业网站管理系统下载','','','/uploads/img1/20161013/57fefef71971a.png!300X300.jpg','/uploads/img1/20161013/57fefef71971a.png$$$后台首页|||/uploads/img1/20161013/57fefef799211.png$$$后台栏目管理|||/uploads/img1/20161013/57fefef80b4a9.png$$$后台广告管理|||/uploads/img1/20161013/57fefef87405b.png$$$后台账户管理|||/uploads/img1/20161013/57fefef906e7a.png$$$后台文章管理|||/uploads/img1/20161013/57fefef983635.png$$$后台系统设置|||/uploads/img1/20161013/57fefef9f3b20.png$$$后台缓存设置','<p>源码简介：<br/><br/>TuziCMS（兔子cms）是基于ThinkPHP框架开发的企业网站管理系统，国内PHP+MYSQL 开源建站程序，采用MVC设计模式实现业务逻辑与表现层的适当分离，使网页设计师能够轻松设计出理想的模板，框架式开发易用扩展，支持自定义内容模型，可面向中小型站点提供重量级网站建设方案。<br/><br/>开发语言：PHP<br/><br/>操作系统：Windows,Linux/Unix<br/><br/>TuziCMS 2.5 版本发布，这是一个全新的版本，个人版和企业版，修复了nginx环境下安装出错的问题，虚拟主机下安装程序数据管理员表为空等错误，PHP环境5.3版本，需要开启PDO_Mysql函数和Zend Guard Loader函数。<br/><br/>一.安装条件：<br/><br/>1、Linux/Windows 平台<br/>Nginx/Apache/IIS+PHP5.3+MySQL4/5 (PHP必须在非线路安全模式下运行)<br/>建议使用平台：Linux+Apache2.2.21+PHP5.3.8+MySQL5.5.16<br/><br/>2、PHP 必须环境或启用的系统函数<br/>PDO_Mysql<br/>Zend Guard Loader<br/>allow_url_fopen<br/>GD 扩展库<br/>MySQL 扩展库<br/>JSON 支持<br/><br/>二.Tuzicms v2.5系统修复记录<br/><br/>1.【修复】虚拟主机安装程序数据库，提示安装成功，但是创建管理员数据库失败。<br/>2.【美化】营销管理-栏目广告修改页面的图片附件input高度(2015.10.10解决)<br/>3.【修复】打开网页的等待时间，乱码显示(已经解决一部分20151201取消BOM签名)<br/>4.【修复】安装的系统手机访问默认跳转到官方演示（2015.10.18解决）<br/>5.【修复】安装以后，我查看mysql数据库，对应的tuzi_admin表，发现里面没有数据(配置表是有数据的)<br/>6.【新增】后台管理员权限控制模块<br/>7.【修复】LNMP 环境下，rewrite 怎么开始URL解析出错。首页能打开，其他的链接点击去就404错误。<br/>8.【修复】tuzicms首页在读取二级列表时无法读取（20151210解决）<br/>9.【新增】文章页，上一遍，下一遍。<br/>10.【修复】网站打开跳转时提示显示乱码(20151124解决)<br/>11.【修复】栏目图文信息列表的描述信息输出含html代码（20151201解决）<br/>12.【修复】模板uft-8在前台输出时含有空格换行符（20151202解决，模板编码修改为BOM不需要签名即可解决问题）<br/>13.【修复】演示网站首页错位（20160112完成）<br/>14.【修复】后台添加二级栏目时自动选定上级栏目链接类型（20151211解决）<br/>15.【修复】完善优化了用户登录判断模块（完成）<br/>16.【修复】公告标题只有几个字，截取和不截取一个样子（20160120完成）<br/>17.【修复】instal数据库安装模块出现sp_表前缀(20160120完成)<br/>18.【美化】美化后台图片上传按钮（已完成）<br/>19.【新增】优化了后台回收站系统（20160103完成）<br/>20.【新增】栏目调用万能标签<br/>21.【新增】优化了前台css样式，公共的css存在tuzicms.css样式表<br/>22.【修复】新闻摘要部分单独后台有表单，不用截取，以免出现字符错误。（20160118完成）<br/>23.【新增】文章评论系统（20160122完成）<br/>24.【修复】文章封面更换后源文件没有删除（20160306完成）<br/>25.【美化】css实现鼠标经过tr时,改变tr当前背景颜色（20160306完成）<br/>26.【修复】新闻图片的排序</p>','','http://www.tuzicms.com/Uploads/Goods/Tuzicms/tuzicms_v2.5_20160409_personal_php5.3.zip','源码简介：\r\n\r\nTuziCMS（兔子cms）是基于ThinkPHP框架开发的企业网站管理系统，国内PHP+MYSQL 开源建站程序，采用MVC设计模式实现业务逻辑与表现层的适当分离，使网页设计师能够轻松设计出理想的模板，框架式开发易用扩展，支','','1','0','1','','','','1476329210','1476451068','10','24','1','1','','1','0','0','thinkphp开源系统,TuziCMS,兔子cms','http://www.tuzicms.cn/','1','0','41,42,55,69');
INSERT INTO `my_soft` VALUES ('39','thinkphp5开发的微信公众号通用管理系统源码','','','/uploads/img1/20161014/580068e77424d.png!300X300.jpg','/uploads/img1/20161014/580068e77424d.png$$$基础功能|||/uploads/img1/20161014/580068e702f59.png$$$微信游戏|||/uploads/img1/20161014/580068e7ed3c0.png$$$大转盘|||/uploads/img1/20161014/580068e878486.png$$$商品管理|||/uploads/img1/20161014/580068e8e292f.png$$$用户管理','<p><strong>thinkphp5开发的微信公众号通用管理系统安装说明</strong><br/><br/>1、下载本项目压缩包到本地解压<br/>2、导入数据库，数据库文件为根目录下面的tp5_weixin.sql<br/>3、修改数据库配置文件<br/>4、修改config.php中的微信公众号相关参数，修改site_url,img_server为你自己的地址<br/>5、登陆用户名：admin 密码：123456<br/><br/>推荐使用phpstudy搭建php的集成环境，配置虚拟域名，将项目地址指、向public_html，关于phpstudy的使用方法，自行搜索。<br/><br/><strong>后台测试账号密码：test &nbsp; 123456</strong></p>','','https://github.com/ningbnii/tp5_weixin','thinkphp5开发的微信公众号通用管理系统安装说明\r\n\r\n下载本项目压缩包到本地解压\r\n\r\n1、导入数据库，数据库文件为根目录下面的tp5_weixin.sql\r\n2、修改数据库配置文件\r\n3、修改config.php中的微信公众号相关参数，修改s','','1','0','1','','','','1476421865','1476610879','17','24','1','1','','1','0','0','thinkphp5,微信公众号管理系统,thinkphp5源码','http://demo.wxbuluo.com','1','0','75,69');
INSERT INTO `my_soft` VALUES ('40','thinkphp3.23源码Easy-Admin通用后台信息管理系统下载','','','/uploads/img1/20161015/5801a2330c27e.png!300X300.jpg','/uploads/img1/20161015/5801a2330c27e.png$$$后台首页|||/uploads/img1/20161015/5801a231a0ff7.png$$$节点管理|||/uploads/img1/20161015/5801a23256878.png$$$文件管理|||/uploads/img1/20161015/5801a233973a2.png$$$登录页|||/uploads/img1/20161015/5801a234345e0.png$$$权限管理|||/uploads/img1/20161015/5801a234c3720.png$$$资讯管理','<p>Easy-Admin是一个通用的后台信息管理系统。本通用后台包含以下功能：<br/><br/>1、RBAC权限管理功能：便捷地对系统中用户进行权限分配，所以权限分配可以在一个页面分配完成。 \r\n<br/>2、简单新闻发布版块：基本的新闻发布、修改、删除。 \r\n<br/>3、无极限分类功能： 满足新闻分类等的无极限分类的功能<br/><br/>系统说明<br/><br/>Easy-Admin就如其名，它能够为你快速搭建一个方便的后台信息管理系统，并且提供简洁易用的管理界面。大部分CMS系统往往功能都是比较庞大繁杂的，不管从学习使用或者是进行二次开发都是成本比较高的。Easy-Admin不是一个CMS，它仅仅帮你创建一个方便可用的后台信息管理，并集成一些常用的操作。简而言之，Easy-Admin能够帮你轻松搞定信息的CURD、权限管理（多管理员）和数据文件管理。手头有企业站小伙伴们可以试试看，能帮到你就是这个项目的价值所在。<br/><br/>环境要求<br/><br/>请确保当前系统的PHP版本大于5.3。<br/><br/>访问安装文件<br/><br/>http://domain/easy-admin/install.php<br/><br/>文件结构<br/><br/>当前项目文件提供的是安装时所需最小要求，安装前后的目录结果会有所变化。安装后系统自动将删除Install目录和install.php文件，同时生成Data，Common，Cache三个目录。<br/><br/>下面是安装前的目录结构：<br/><br/>Easy-Admin<br/>├── Admin<br/>│ &nbsp; ├── Common<br/>│ &nbsp; │ &nbsp; ├── Common<br/>│ &nbsp; │ &nbsp; └── Conf<br/>│ &nbsp; └── Home<br/>│ &nbsp; &nbsp; &nbsp; ├── Controller<br/>│ &nbsp; &nbsp; &nbsp; ├── Logic<br/>│ &nbsp; &nbsp; &nbsp; ├── Model<br/>│ &nbsp; &nbsp; &nbsp; ├── Service<br/>│ &nbsp; &nbsp; &nbsp; └── View<br/>├── Install<br/>│ &nbsp; ├── Common<br/>│ &nbsp; │ &nbsp; ├── Common<br/>│ &nbsp; │ &nbsp; └── Conf<br/>│ &nbsp; ├── Data<br/>│ &nbsp; └── Home<br/>│ &nbsp; &nbsp; &nbsp; ├── Controller<br/>│ &nbsp; &nbsp; &nbsp; └── View<br/>├── Public<br/>│ &nbsp; ├── images<br/>│ &nbsp; │ &nbsp; ├── admin<br/>│ &nbsp; │ &nbsp; └── install<br/>│ &nbsp; ├── javascripts<br/>│ &nbsp; │ &nbsp; ├── admin<br/>│ &nbsp; │ &nbsp; └── install<br/>│ &nbsp; ├── Min<br/>│ &nbsp; │ &nbsp; ├── builder<br/>│ &nbsp; │ &nbsp; └── lib<br/>│ &nbsp; ├── stylesheets<br/>│ &nbsp; │ &nbsp; ├── admin<br/>│ &nbsp; │ &nbsp; └── install<br/>│ &nbsp; └── uploads<br/>├── ThinkPHP<br/>├── LICENSE<br/>├── README.md<br/>├── admin.php<br/>└── install.php<br/>自定义<br/><br/>支持数据类型<br/><br/>字符型：char, varchar<br/><br/>整型：tinyint, int, smallint, bigint<br/><br/>浮点型：float, double<br/><br/>文本型：text, mediumtext, longtext<br/>支持表单域类型<br/><br/>text：文本域<br/><br/>password：密码域<br/><br/>select：下拉框<br/><br/>radio：单选框<br/><br/>checkbox：复选框<br/><br/>textarea：多行文本域<br/><br/>file：文件上传，返回的值是文件存放的位置<br/><br/>date：日期控件<br/><br/>editor：编辑器，KingEditor全功能和简介功能<br/><br/>relationlink：可关联其他模型的下拉框<br/><br/>主菜单<br/><br/>菜单配置在Admin/Comom/Conf/menu_config.php文件中。<br/><br/>// File: Admin/Comom/Conf/menu_config.php<br/><br/>&#39;Posts&#39; =&gt; array(<br/> &nbsp; &nbsp;&#39;name&#39; =&gt; &#39;文章管理&#39;,<br/> &nbsp; &nbsp;&#39;target&#39; =&gt; &#39;Posts/index&#39;,<br/> &nbsp; &nbsp;// &#39;mapping&#39; =&gt; &#39;test&#39;,<br/> &nbsp; &nbsp;&#39;sub_menu&#39; =&gt; array(<br/> &nbsp; &nbsp; &nbsp; &nbsp;array(&#39;item&#39; =&gt; array(&#39;Posts/index&#39; =&gt; &#39;文章列表&#39;)),<br/> &nbsp; &nbsp; &nbsp; &nbsp;array(&#39;item&#39; =&gt; array(&#39;Posts/add&#39;) =&gt; &#39;添加文章&#39;)),<br/> &nbsp; &nbsp; &nbsp; &nbsp;array(&#39;item&#39; =&gt; array(&#39;Posts/edit&#39;) =&gt; &#39;修改文章&#39;)),<br/> &nbsp; &nbsp; &nbsp; &nbsp;array(&#39;item&#39; =&gt; array(&#39;Posts/delete&#39;) =&gt; &#39;删除文章&#39;))<br/> &nbsp; &nbsp;)<br/>)<br/><br/>&#39;Posts&#39;：菜单对应的模块名称（Controller的名字）<br/><br/>&#39;name&#39;：主菜单中显示出来的名字<br/><br/>&#39;target&#39;：点击主菜单后跳转到的操作<br/><br/>&#39;sub_menu&#39;：主菜单下的子菜单，即左侧的菜单<br/><br/>&#39;mapping&#39;：把该子菜单映射到某个主菜单下<br/>过滤函数<br/><br/>你可以选择过滤函数来过滤表单提交后某字段的值。比如，我们不希望文章标题中出现HTML效果，我们需要对它进行转义，那么我们就可以注册自定过滤函数来实现这个需求。<br/><br/>我们在Common/Common/目录下创建filter_function.php文件：<br/><br/>// File: Common/Common/filter_function.php<br/><br/>// 自定义的过滤函数<br/>function my_html_filter($val) {<br/> &nbsp; &nbsp;return htmlspecialchars($val);<br/>}<br/><br/>// 注册函数<br/>// registry_filter方法的参数必须是一个数组<br/>registry_filter(array(<br/> &nbsp; &nbsp;// 函数名<br/> &nbsp; &nbsp;&#39;my_html_filter&#39;<br/>));<br/><br/>// 不管是自定义还是php自带的函数，只要函数定义过了都可以注册<br/>// registry_filter(array(<br/>// &nbsp; &nbsp;&#39;htmlspecialchars&#39;<br/>// ));<br/>经过上面的操作后我们就可以在字段定义中选择使用这个自定义函数了。<br/><br/>填充函数<br/><br/>我们有时希望某些字段值能自动填充，那么我们就可以通过注册填充函数来实现。比如，我们需要为每篇生成一个随机的uuid。<br/><br/>// File: Common/Common/fill_function.php<br/><br/>function uuid() {<br/> &nbsp; &nbsp;$uuid = &#39;&#39;;<br/> &nbsp; &nbsp;// some logic code here<br/> &nbsp; &nbsp;return $uuid;<br/>}<br/><br/>registry_fill(array(<br/> &nbsp; &nbsp;// 函数名<br/> &nbsp; &nbsp;&#39;uuid&#39;<br/>));<br/>自定义填充函数和自定义过滤函数是一样的。<br/><br/>过滤函数必须要有一个参数和一个返回值，填充函数需要一个返回值。<br/><br/>内置filter：sql_injection、strip_sql_injection、filter_special_chars<br/><br/>内置fill：uuid、datetime<br/>可配置项<br/><br/>系统提供较多的可配置项，当然你也可以完全不管，功能依然能够正常使用。<br/><br/>安全配置<br/><br/>// File: Admin/Comom/Conf/security_config.php<br/><br/>// 表单令牌<br/>&#39;TOKEN_ON&#39; =&gt; false<br/>&#39;TOKEN_NAME&#39; =&gt; &#39;__hash__&#39;<br/>&#39;TOKEN_TYPE&#39; =&gt; &#39;md5&#39;<br/>&#39;TOKEN_RESET&#39; =&gt; true<br/><br/>// 认证token<br/>&#39;AUTH_TOKEN&#39; =&gt; &#39;eaadmin&#39;<br/>// 登录超时<br/>&#39;LOGIN_TIMEOUT&#39; =&gt; 3600<br/><br/>// 不用认证登录的模块<br/>&#39;NOT_LOGIN_MODULES&#39; =&gt; &#39;Public&#39;<br/><br/>// 开启权限认证<br/>&#39;USER_AUTH_ON&#39; =&gt; true<br/><br/>// 登录认证模式<br/>&#39;USER_AUTH_TYPE&#39; =&gt; 1<br/><br/>// 认证识别号<br/>&#39;USER_AUTH_KEY&#39; =&gt; &#39;mineaad&#39;<br/><br/>// 超级管理员认证号<br/>&#39;ADMIN_AUTH_KEY&#39; =&gt; &#39;eaadminae&#39;<br/><br/>// 游客识别号<br/>&#39;GUEST_AUTH_ID&#39; =&gt; &#39;guest&#39;<br/><br/>// 无需认证模块<br/>&#39;NOT_AUTH_MODULE&#39; =&gt; &#39;Public&#39;<br/><br/>// 需要认证模块<br/>&#39;REQUIRE_AUTH_MODULE&#39; =&gt; &#39;&#39;<br/><br/>// 认证网关<br/>&#39;USER_AUTH_GATEWAY&#39; =&gt; &#39;Public/index&#39;<br/><br/>// 关闭游客授权访问<br/>&#39;GUEST_AUTH_ON&#39; =&gt; false<br/><br/>// 管理员模型<br/>&#39;USER_AUTH_MODEL&#39; =&gt; &#39;Admin&#39;<br/>邮箱配置<br/><br/>// File: Admin/Comom/Conf/mail_config.php<br/><br/>// SMTP服务器<br/>&#39;SMTP_HOST&#39; =&gt; &#39;smtp.example.com&#39;<br/><br/>// SMTP认证<br/>&#39;SMTP_AUTH&#39; =&gt; true<br/><br/>// SMTP端口<br/>&#39;SMTP_PORT&#39; =&gt; 465<br/><br/>// SMTP服务器用户名<br/>&#39;SMTP_USER_NAME&#39; =&gt; &#39;smtpservername&#39;<br/><br/>// SMTP服务器密码<br/>&#39;SMTP_PASSWORD&#39; =&gt; &#39;smtpserverpwd&#39;<br/><br/>// 发送邮件的邮箱地址<br/>&#39;MAIL_FROM&#39; =&gt; &#39;email@example.com&#39;<br/><br/>// 发送邮件的发送者名称<br/>&#39;SENDER_NAME&#39; =&gt; &#39;ea-admin&#39;<br/><br/>// 回复者邮件<br/>&#39;MAIL_REPLY&#39; =&gt; &#39;email@example.com&#39;<br/><br/>// 回复者名称<br/>&#39;REPLYER_NAME&#39; =&gt; &#39;youname&#39;<br/><br/>// 字符集<br/>&#39;SMTP_CHARSET&#39; =&gt;&#39;UTF-8&#39;<br/><br/>// 邮件内容替换，?为占位符<br/>&#39;MAIL_BODY&#39; =&gt; &#39;在浏览器中运行下面的链接进行重置密码操作：<br/><a href=\"?\">?</a>&#39;<br/>数据备份<br/><br/>// File: Admin/Comom/Conf/backup_config.php<br/><br/>// 数据库文件备份的目录路径<br/>&#39;BACKUP_DIR_PATH&#39; =&gt; WEB_ROOT . &#39;Data/&#39;<br/><br/>// 数据库文件zip存放目录路径<br/>&#39;BACKUP_ZIP_DIR_PATH&#39; =&gt; WEB_ROOT . &#39;Data/zip/&#39;<br/><br/>// 数据库文件备份名称前缀<br/>&#39;BACKUP_PREFIX&#39; =&gt; &#39;ea_&#39;<br/><br/>// 数据库备份文件名中的随机数长度<br/>&#39;BACKUP_FILE_CODE_LENGTH&#39; =&gt; 6<br/><br/>// sql文件注释头名称<br/>&#39;BACKUP_DESCRIPTION_NAME&#39; =&gt; &#39;Easy-Admin Backup File.&#39;<br/><br/>// sql文件注释头url<br/>&#39;BACKUP_DESCRIPTION_URL&#39; =&gt; &#39;Github: http://github.com/happen-zhang/easy-admin&#39;<br/><br/>// 读取sql文件注释的最大字节数<br/>&#39;BACKUP_DESCRIPTION_LENGTH&#39; =&gt; 2000<br/><br/>// sql每页条数<br/>&#39;BACKUP_SQL_LIST_ROWS&#39; =&gt; 10000<br/><br/>// sql文件分卷大小<br/>&#39;SQL_FILE_SIZE&#39; =&gt; 5242880<br/>约定<br/><br/>方法名<br/><br/>add：数据表单添加页面<br/><br/>create：对提交的表单数据处理后存到数据库<br/><br/>edit：数据表单编辑页面<br/><br/>update：对提交的表单数据处理后更新到数据库<br/>方法名：helloWorld()<br/><br/>类中的变量名（包括方法中的变量）：$helloWorld = &#39;hi&#39;<br/><br/>函数：hello_world()<br/><br/>类外部的变量名：$hello_world = &#39;hi&#39;<br/><br/>键值: beginer[&#39;hello_world&#39;] = &#39;hi&#39;<br/><br/>表单域名：<br/>扩展库说明<br/><br/>本系统的开发没有修改过ThinkPHP中的核心系框架中的内容，如果需要，你可以尝试着对ThinkPHP版本的升级。<br/><br/>下面是引用到的PHP第三方库：<br/><br/>Min：Public/Min<br/>PHPMailer：ThinkPHP/Library/Vendor/PHPMailer：ThinkPHP<br/>下面是ThinkPHP工具类，均放在 ThinkPHP/Library/Org/Util/ 目录下：<br/><br/>Page.class.php：分页类 有改动<br/>Rbac.class.php：角色权限管理<br/>UploadFile.class.php：文件上传类 有改动<br/>Category.class.php：无限分级类<br/><br/>程序作者说明<br/><br/>本系统的页面来源于 @leohdr ，在此感谢 @leohdr 兄的分享。<br/>本系统的代码都是我一个人所写，我十分愿意分享给大家。由于个人精力有限，系统可能还存在尚未发现的bug，如果你在使用系统的过程发现bug，可以issuse给我，谢谢。</p>','','https://github.com/happen-zhang/easy-admin','Easy-Admin是一个通用的后台信息管理系统。本通用后台包含以下功能：\r\n\r\n1、RBAC权限管理功能：便捷地对系统中用户进行权限分配，所以权限分配可以在一个页面分配完成。 \r\n2、简单新闻发布版块：基本的新闻发布、修改、删除。 \r\n3、无极限','','1','0','1','','','','1476502069','1476502147','2','24','1','1','','1','0','0','thinkphp3.23源码,Easy-Admin','/','0','0','41,42,55,69');
INSERT INTO `my_soft` VALUES ('41','thinkphp源码kiscms内容管理系统下载','','','/uploads/img1/20161015/5801a2356951b.jpg!300X300.jpg','/uploads/img1/20161015/5801a2356951b.jpg$$$项目结构截图','<p>kiscms是什么?<br/><br/>Keep it simple！这个是一个简单的便于二次开发的web内容管理系统。大多数情况下，它不能满足您的需求。<br/>kiscms适合二次开发。<br/><br/>它具备基本的模块：<br/>1、用户模块<br/>2、权限模块<br/>3、文档模块<br/><br/>我们为什么需要它?<br/><br/>网站的开发需要做大量的工作，为了加快项目进度，我们通常会用上框架技术，甚至是一些现成的项目，进行二次开发。<br/>kiscms是一个工作进度介于框架与现成项目之间的产品。用它做二次开发，可以减少我们搭建框架、编写基本模块的工作量，加快项目进度。<br/><br/>它有什么优势?<br/><br/>1、kiscms采用了ThinkPHP、Bootstrap、Layer、Laydate、Jquery、KindEditor等优秀的框架与库，它们可以极大的提高我们的项目质量。<br/>2、简明规范的数据库表设计，方便我们在二次开发的时候进行大刀阔斧的增改。<br/>3、简洁的后台界面，就一个字“高颜值”！<br/>如何获取它?<br/>kiscms程序完全遵循MIT（The MIT License）开源协议。<br/><br/>建议安装环境： Linux + Apache + PHP or Linux + Nginx + PHP<br/><br/>安装步骤：<br/><br/>1、建立一个utf-8编码的数据库<br/>2、将 kiscms.sql 导入到新建立的库中<br/>3、配置数据库连接文件 Application/Common/Conf/db.php<br/>4、进入后台更改密码，后台地址：http://域名/admin/Sign/index.html<br/>5、如果要保护后台地址，可以更改 Application/Common/Conf/config.php 中的 URL_MODULE_MAP 进行模块映射，配置完毕后，清空Runtime文件夹<br/><br/>后台初始化登录帐号，将其中的#去掉：<br/><br/>admin#@admin.c#om 12345678 \r\n<br/>manage#@manage.c#om 12345678 \r\n<br/>buexplain#@163.c#om 12345678 \r\n<br/>guest#@guest.c#om 12345678 \r\n<br/><br/></p><p>Apache服务器的伪静态规则<br/><br/></p><p>&lt;IfModule expires_module&gt;</p><p>&nbsp; &nbsp; ExpiresActive On</p><p>&nbsp; &nbsp; &lt;FilesMatch &quot;\\.(gif|jpg|png|js|css)$&quot;&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; ExpiresDefault &quot;access plus 30 days&quot;</p><p>&nbsp; &nbsp; &lt;/FilesMatch&gt;</p><p>&lt;/IfModule&gt;</p><p>&lt;IfModule mod_rewrite.c&gt;</p><p>&nbsp; &nbsp; &nbsp;RewriteEngine on</p><p>&nbsp; &nbsp; &nbsp;RewriteCond %{REQUEST_FILENAME} !-d</p><p>&nbsp; &nbsp; &nbsp;RewriteCond %{REQUEST_FILENAME} !-f</p><p>&nbsp; &nbsp; &nbsp;RewriteRule ^(.*)$ index.php?s=$1 [QSA,PT,L]</p><p>&lt;/IfModule&gt;</p><p><br/>Nginx服务器的伪静态规则<br/><br/>#如果请求既不是一个文件，也不是一个目录，则执行一下重写规则<br/>if (!-e $request_filename)<br/>{<br/> &nbsp; &nbsp;#地址作为将参数rewrite到index.php上。<br/> &nbsp; &nbsp;rewrite ^/(.*)$ /index.php?s=$1;<br/>}<br/>location ~ .*\\.(gif|jpg|jpeg|png|bmp|swf)$<br/>{<br/> &nbsp; &nbsp;access_log off;<br/> &nbsp; &nbsp;expires &nbsp; &nbsp; &nbsp;30d;<br/>}<br/>location ~ .*\\.(js|css)?$<br/>{<br/> &nbsp; &nbsp;access_log off;<br/> &nbsp; &nbsp;expires &nbsp; &nbsp; &nbsp;12h;<br/>}<br/><br/>Tengine服务器的伪静态规则<br/><br/>ExpiresActive On<br/><br/> RewriteEngine on<br/> RewriteCond %{REQUEST_FILENAME} !-d<br/> RewriteCond %{REQUEST_FILENAME} !-f<br/> RewriteRule ^(.*)$ index.php?s=$1 [QSA,PT,L]<br/></p>','','https://codeload.github.com/buexplain/kiscms/zip/v0.2','kiscms是什么?\r\n\r\nKeep it simple！这个是一个简单的便于二次开发的web内容管理系统。大多数情况下，它不能满足您的需求。\r\nkiscms适合二次开发。\r\n\r\n它具备基本的模块：\r\n1、用户模块\r\n2、权限模块\r\n3、文档模块\r\n\r\n我们为','','1','0','1','','','','1476502069','1476502247','3','24','1','1','','1','0','0','thinkphp源码,kiscms','/','0','0','69');
INSERT INTO `my_soft` VALUES ('42','thinkphp3.2开发的论坛系统Yznbbs论坛下载','','','/uploads/img1/20161016/5802f046e2142.jpg!300X300.jpg','/uploads/img1/20161016/5802f046e2142.jpg$$$项目截图','<p><strong>Yznbbs论坛简介：</strong><br/><br/>使用THINKPHP3.2.3框架开发的小型论坛系统<br/><br/>开发语言：PHP<br/><br/>操作系统：跨平台,Windows<br/><br/><br/><strong>功能说明：</strong><br/><br/><strong>目前功能：（未完全完善）</strong></p><p><br/>发帖 回帖 编辑<br/>@功能<br/>未读提醒功能<br/>60秒回帖限制<br/>markdown语法支持<br/>会员基础信息修改（密码 签名等）<br/>节点支持<br/>主题收藏<br/><br/><strong>后期功能</strong><br/><br/>金币获取 发帖 回帖等方式<br/>关注用户<br/>管理后台<br/>附言<br/>赞 踩<br/>头像上传 附件上传 图片上传<br/>悬赏<br/>路由功能<br/>各类插件<br/>时间轴<br/>商城<br/>.....</p>','','https://github.com/ken678/yznbbs','Yznbbs论坛简介：\r\n\r\n使用THINKPHP3.2.3框架开发的小型论坛系统\r\n\r\n开发语言：PHP\r\n\r\n操作系统：跨平台,Windows\r\n\r\n使用最新THINKPHP3.2.3框架的小型论坛\r\n\r\n功能说明：\r\n\r\n目前功能：（未完全完善）\r\n发帖 回帖','','1','0','1','','','','1476587591','1476610724','5','24','1','1','','1','0','0','thinkphp源码,thinkphp论坛系统,Yznbbs论坛','','0','0','54,69,71');
INSERT INTO `my_soft` VALUES ('43','thinkphp源码XYHCMS（行云海CMS）内容管理系统V3.2下载（集成手机版网站）','','','/uploads/img1/20161016/5802f0487e381.png!300X300.jpg','/uploads/img1/20161016/5802f0487e381.png$$$栏目管理|||/uploads/img1/20161016/5802f047468e9.png$$$安装页面|||/uploads/img1/20161016/5802f047b6ddc.png$$$登录页面','<p><strong>XYHCMS内容管理系统V3.2介绍：</strong><br/><br/>XYHCMS（行云海CMS）是由thinkphp3.2.3开发的一套完全开源的CMS内容管理系统，使用简单，轻松建站。企业建站、个人博客、个性网站的首选。系统简洁，高效，易用，一般的开发人员能够使用本系统以最低的成本、最少的人力投入，在最短的时间内架设一个功能齐全、性能优异的网站。<br/><br/>XYHCMS V3.2是基于tp3.2.3开发的网站内容管理系统，提供了单页模块，文章类模块，产品类模块，图片类模块等。你在使用过程中可选择任意模块来建设您的网站。<br/><br/>XYHCMS集成电脑版及手机版网站。方便各种终端访问！<br/><br/><strong>XYHCMS3.2更新日志[2016年10月03日]</strong><br/><br/>[√]增加后台模板管理功能 \r\n<br/>[√]修正数据库备份还原BUG \r\n<br/>[√]修正在线客电话和留言链接不显示 \r\n<br/>[√]修正表标题太短 \r\n<br/>[√]美化后台相关界面 \r\n<br/>[√]优化安装程序及界面 \r\n<br/>[√]修正后台部份错误显示 \r\n<br/>[√]增强list,artlist,prolist,piclist,soflist标签的功能 \r\n<br/>[√]增强prev,next标签功能，增强自由定制性 \r\n<br/>[√]取消后台产品/图片集模型的图片张数限制 \r\n<br/>[√]修正会员注册的字段默认值问题</p>','','https://pan.baidu.com/s/1hrKVP4K','XYHCMS内容管理系统V3.2介绍：\r\n\r\nXYHCMS（行云海CMS）是由thinkphp3.2.3开发的一套完全开源的CMS内容管理系统，使用简单，轻松建站。企业建站、个人博客、个性网站的首选。系统简洁，高效，易用，一般的开发人员能够使用','','1','0','1','','','','1476587593','1476610678','2','24','1','5','','1','0','0','thinkphp源码,XYHCMS,行云海CMS,内容管理系统,手机版网站','http://demo.0871k.com/','0','0','42,41,69,70');
INSERT INTO `my_soft` VALUES ('44','thinkphp源码TP-Admin大型CMS站群后台管理系统','','','/uploads/img1/20161017/5804cca50f77a.png!300X300.jpg','/uploads/img1/20161017/5804cca50f77a.png$$$后台首页|||/uploads/img1/20161017/5804ccae5383c.png$$$菜单管理|||/uploads/img1/20161017/5804ccb252488.png$$$房产管理|||/uploads/img1/20161017/5804ccb588b6b.png$$$管理站点|||/uploads/img1/20161017/5804ccb97fa98.png$$$内容管理','<p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong># TP-Admin主要功能介绍 #</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">## 全新架构</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">摒弃传统CMS栏目内容组合模式的内容管理方式，引入WP Taxonomy分类机制，让系统变得更轻便灵活；抛弃固有的内容模型思想，转换成全自定义化的万能模型；将字段类型抽离为插件模式，在业务拓展时当现有功能无法满足业务需求时，只需要对字段类型库进行扩从即可满足对业务拓展的需求。让系统适应维度更广，更全面化；对自定义模型和Taxonomy进行全自动节点扩充，改进权限系统，增强角色管理由其对多站点系统完全做到分站点权限控制。让系统适应更大型和复杂业务；</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">## 模型</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">模型是整个系统的核心，也是业务扩充的基础。每新建一个模型，系统将自动创建一张数据表来存储模型数据。再结合模型字段管理，根据业务需求建立不同的字段，仅需要简单的后台操作就能完成复杂的业务逻辑和业务功能；3.0版本精简了预定义模型字段，增强模型的灵活性和可扩展性。插件化字段类型，让扩展自定义字段类型提供了更好的基础。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">## taxonomy</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">Taxonomy是3.0版本全新引入的一个概念，它必须结合模型一起使用。该思想是来自于WP的分类管理。用Taxonomy来替代了2.*中的栏目功能，也可以说是栏目功能的一个增强版。它也增强的模型灵活性。一个模型可以拥有多个分类，每一个分类都是一个2.0版本中的栏目功能。让系统变得更加灵活，也适应更复杂的业务逻辑，同时也让内容层次结构更清晰</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">## 站群及权限</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">TP-Admin率先把只有大型门户才有的站群系统引入到以Thinkphp为底层的开源系统中。所谓站群系统：就是一网站的集合，各个站点既独立又统一，分级管理，信息共享，操作互不影响。3.0版本为模型和Taxonomy增加了全自动节点扩展，改进了权限系统，做到了各站点间管理绝对解耦。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>TP-Admin 最新动态</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"># 3.5</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">推出前台模板</p><p style=\"line-height: 2em; text-indent: 2em;\">多站点CMS基础模板</p><p style=\"line-height: 2em; text-indent: 2em;\">多站点会员中心</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"># 3.4</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">新增会员系统</p><p style=\"line-height: 2em; text-indent: 2em;\">支持微博,QQ第三方账号接入</p><p style=\"line-height: 2em; text-indent: 2em;\">多站点单点登录SSO实现</p><p style=\"line-height: 2em; text-indent: 2em;\">邮箱，手机多渠道注册，登录</p><p style=\"line-height: 2em; text-indent: 2em;\">重构前端</p><p style=\"line-height: 2em; text-indent: 2em;\">增加多站点支持</p><p style=\"line-height: 2em; text-indent: 2em;\">无障碍站点切换</p><p style=\"line-height: 2em; text-indent: 2em;\">重构站群系统</p><p style=\"line-height: 2em; text-indent: 2em;\">修改原站群系统为单主域多子域模式</p><p style=\"line-height: 2em; text-indent: 2em;\">修改 TP 路由机制</p><p style=\"line-height: 2em; text-indent: 2em;\">重构框架底层路由</p><p style=\"line-height: 2em; text-indent: 2em;\">修复底层框架路由对站点无法支持问题</p><p style=\"line-height: 2em; text-indent: 2em;\">新增 url 函数替代系统 U 函数</p><p style=\"line-height: 2em; text-indent: 2em;\">重构 model和logic 函数 替代系统 M 以及 D 函数</p><p style=\"line-height: 2em; text-indent: 2em;\">修改session cookie 机制</p><p style=\"line-height: 2em; text-indent: 2em;\">修改框架底层 session &nbsp;cookie 函数</p><p style=\"line-height: 2em; text-indent: 2em;\">增加对 session cookie 跨域支持</p><p style=\"line-height: 2em; text-indent: 2em;\">重置框架底层 cookie session 初始化和过期机制</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">#3.3</p><p style=\"line-height: 2em; text-indent: 2em;\">新增模型继承功能。详情 点击查看 重大更新</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"># 3.2</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">新增关联字段类型</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"># 3.1</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">新增CMS前台DEMO</p><p style=\"line-height: 2em; text-indent: 2em;\">新增单页面系统</p><p style=\"line-height: 2em; text-indent: 2em;\">新增内容模板机制</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">#3.0</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">3.0 全新架构，重组站群系统，全新模型架构，融入WP Taxonomy分类管理思想；强大的权限系统，模型、分类全自动节点。历经三月只为简单，快捷，舒适。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>演示后台账号/密码 : tp-admin / tp-admin</strong></p><p><br/></p>','','https://github.com/xiaoyao-work/TP-Admin','# TP-Admin主要功能介绍 ### 全新架构摒弃传统CMS栏目内容组合模式的内容管理方式，引入WP Taxonomy分类机制，让系统变得更轻便灵活；抛弃固有的内容模型思想，转换成全自定义化的万能模型；将字段类型抽离为插件模式，在业务拓','','1','0','1','','','','1476708760','1476709653','7','24','1','1','','1','0','1','thinkphp源码,TP-Admin,CMS,后台管理系统','http://admin.tp3.hhailuo.com/','0','0','40,42,59,41,69');
INSERT INTO `my_soft` VALUES ('45','thinkphp开发的悬赏威客系统FoxPHP下载','','','/uploads/img1/20161017/5804f2348891d.jpg!300X300.jpg','/uploads/img1/20161017/5804daaf39cb1.png$$$首页|||/uploads/img1/20161017/5804dab9c1bdd.png$$$任务大厅|||/uploads/img1/20161017/5804dac0becbc.png$$$服务','<p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP威客系统是基于thinkphp开发的大型多用户多店铺,B2B,C2C,O2O悬赏系统,服务商(威客卖家)网上提供服务,雇主(买家)付费购买服务的在线交易平台 FoxPHP威客系统应用 应用于设计行业、程序开发、推广、起名、包外平台等。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>FoxPHP基本功能介绍：</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.强大的核心框架</p><p style=\"text-indent: 2em; line-height: 2em;\">使用ThinkPHP框架并改进优化ThinkPHP框架开发,文档完善二次开发方便快捷.</p><p style=\"text-indent: 2em; line-height: 2em;\">2.完美的 优化SEO</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP 已优化 伪静态URL和生成HTML静态部属，与应用的SEO设定完善解决 SEO优化问题。</p><p style=\"text-indent: 2em; line-height: 2em;\">3.完美的 帐务管理</p><p style=\"text-indent: 2em; line-height: 2em;\">当时用户交易情况如 交易金额；交易对象；资金流向等详细记录,并与订单关联，可以追踪到某个任务上。</p><p style=\"text-indent: 2em; line-height: 2em;\">交易金额的来龙去脉一目了然。</p><p style=\"text-indent: 2em; line-height: 2em;\">4.强大 编辑器</p><p style=\"text-indent: 2em; line-height: 2em;\">默认使用 百度编辑 优化改进版本,批量上传图片；上传文件等并显示进度。</p><p style=\"text-indent: 2em; line-height: 2em;\">并提高用户上传图片附件的操作体验</p><p style=\"text-indent: 2em; line-height: 2em;\">5.完美的 任务流程</p><p style=\"text-indent: 2em; line-height: 2em;\">任务模拟商品交易流程，交易时生产订单，可对订单批量管理，发货，支付,退款等流程。</p><p style=\"text-indent: 2em; line-height: 2em;\">6.完美的 任务操作</p><p style=\"text-indent: 2em; line-height: 2em;\">任务前台 支持 批量 中标；不合格；点评等会员中心支持 批量 发货，支付订单管理</p><p style=\"text-indent: 2em; line-height: 2em;\">7.完美的 后台权限配置</p><p style=\"text-indent: 2em; line-height: 2em;\">通过配置应用权限，可以控制每个地址的访问权限。</p><p style=\"text-indent: 2em; line-height: 2em;\">8.完美的 消息推送</p><p style=\"text-indent: 2em; line-height: 2em;\">支持实时的消息推送技术。</p><p style=\"text-indent: 2em; line-height: 2em;\">网站会员第一时间获取到消息等。</p><p style=\"text-indent: 2em; line-height: 2em;\">9.全新的Wap功能</p><p style=\"text-indent: 2em; line-height: 2em;\">新推出 Wap功能。</p><p style=\"text-indent: 2em; line-height: 2em;\">手机直接浏览网站无需下载APP,更省流量。</p><p style=\"text-indent: 2em; line-height: 2em;\">10.完善的APP接口</p><p style=\"text-indent: 2em; line-height: 2em;\">与手机端无缝对接。</p><p style=\"text-indent: 2em; line-height: 2em;\">开发手机端其它端简单方便等。</p><p style=\"text-indent: 2em; line-height: 2em;\">11.完善的手机安全</p><p style=\"text-indent: 2em; line-height: 2em;\">网站会员开通VIP会员后,可以使用手机验证登录,手机验证提现等。</p><p style=\"text-indent: 2em; line-height: 2em;\">高级安全保护会员的帐号信息。</p><p style=\"text-indent: 2em; line-height: 2em;\">12.完美整合Discuz!论坛</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP程序与Discuz!论坛实现同步登录;同步注册;同步头像等。</p><p style=\"text-indent: 2em; line-height: 2em;\">会员数据无缝对接。</p><p style=\"text-indent: 2em; line-height: 2em;\">13.IM即时通讯</p><p style=\"text-indent: 2em; line-height: 2em;\">自主研制网站即时通讯,网站会员随时聊天谈项目。</p><p style=\"text-indent: 2em; line-height: 2em;\">会员即时沟通无障碍</p><p style=\"text-indent: 2em; line-height: 2em;\">14.O2O定位</p><p style=\"text-indent: 2em; line-height: 2em;\">开启O2O定位,会员访问直接进入对应的城市</p><p style=\"text-indent: 2em; line-height: 2em;\">会员直接对本地区域数据访问</p><p style=\"text-indent: 2em; line-height: 2em;\">15.按分类收取手续费</p><p style=\"text-indent: 2em; line-height: 2em;\">传统可以按用户组收取手续费,FoxPHP 3.0 增加按分类收取手续费</p><p style=\"text-indent: 2em; line-height: 2em;\">个性收费方式</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">在线更新升级</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP 3.0支持后台在线更新升级系统,鼠标一点自动完成升级,不再需要手动下载程序包更新程序。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">管理员变身&quot;银行&quot;</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP 3.0 提出的全新交易概念,即您(管理员)就是“银行管家”,网站资金交易仿佛发生在你身上,交易记录更安全,更清晰,方便简单。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">全新微信接口</p><p style=\"text-indent: 2em; line-height: 2em;\">提供全新的微信接口,网站数据实时推送。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">程序安装请看 自带的FOXPHP安装指南</p><p style=\"text-indent: 2em; line-height: 2em;\">安装注意问题 ：</p><p style=\"text-indent: 2em; line-height: 2em;\">1.如果本地安装请使用一级目录进行安装,暂时不支持二级目录。 &nbsp;( http://localhost 或 http://127.0.0.1 或域名 )</p><p style=\"text-indent: 2em; line-height: 2em;\">2.安装后需要更新浏览器的缓存。&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>什么是 FoxPHP威客系统 ?&nbsp;</strong></p><p style=\"text-indent: 2em; line-height: 2em;\">---------------------------------------------------------------------</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP威客系统</p><p style=\"text-indent: 2em; line-height: 2em;\">是大型多用户多店铺,B2B,C2C,O2O悬赏系统,服务商(威客卖家)网上提供服务,雇主(买家)付费购买服务的在线交易平台</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP威客系统应用</p><p style=\"text-indent: 2em; line-height: 2em;\">应用于设计行业、程序开发、推广、起名、包外平台等</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>FoxPHP发展历程 &nbsp;&nbsp;</strong></p><p style=\"text-indent: 2em; line-height: 2em;\">---------------------------------------------------------------------</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP专为站长企业提供强大的威客程序,站长企业建威客首选程序。&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2006年 创立EDOOG网站专为社区站长提供模板制作与程序开发。&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2007年 使用UCHOME二次开发的威客程序 ,首次运营威客网站-广西威客1.0。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2008年 将 广西威客 进行改进并出售给站长</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2009年 开发最终版本 广西威客 1.3 ,受到站长好评当时最好的 社会化威客程序。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2010年 首次开发自己的PHP框架和威客程序命名为 EDOOG 1.0 威客系统.</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2011年 更新 EDOOG 版本为 1.5 是2011年最流行最成熟最经典的威客程序,至今还有威客站长运营 EDOOG 1.5</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2012年 为了长期发展而重写所有程序框架 更名为 PHPAPP 2.0 , PHPAPP本意指PHP无限应用概念。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2013年 推出 PHPAPP2.5版本&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2014年 推出 PHPAPP2.6改进优化版本&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2016年 首次采用 ThinkPHP 框架开发 PHPAPP3.0 并更名为 FoxPHP 3.0 十年最新大作</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>FoxPHP核心功能介绍 &nbsp;&nbsp;</strong></p><p style=\"text-indent: 2em; line-height: 2em;\">---------------------------------------------------------------------&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">1.强大的核心框架使用ThinkPHP框架并改进优化ThinkPHP框架开发,文档完善二次开发方便快捷.</p><p style=\"text-indent: 2em; line-height: 2em;\">2.完美的 优化SEO</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP 已优化 伪静态URL和生成HTML静态部属，与应用的SEO设定完善解决 SEO优化问题。&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">例如任务设计分类列表可以使用英文字母表现 sheji&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.完美的 帐务管理</p><p style=\"text-indent: 2em; line-height: 2em;\">当时用户交易情况如 交易金额；交易对象；资金流向等详细记录,并与订单关联，可以追踪到某个任务上。</p><p style=\"text-indent: 2em; line-height: 2em;\">交易金额的来龙去脉一目了然。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.强大 编辑器</p><p style=\"text-indent: 2em; line-height: 2em;\">默认使用 百度编辑 优化改进版本,批量上传图片；上传文件等并显示进度。</p><p style=\"text-indent: 2em; line-height: 2em;\">并提高用户上传图片附件的操作体验</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.完美的 任务流程</p><p style=\"text-indent: 2em; line-height: 2em;\">任务模拟商品交易流程，交易时生产订单，可对订单批量管理，发货，支付,退款等流程。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.完美的 任务操作</p><p style=\"text-indent: 2em; line-height: 2em;\">任务前台 支持 批量 中标；不合格；点评等会员中心支持 批量 发货，支付订单管理</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.完美的 后台权限配置</p><p style=\"text-indent: 2em; line-height: 2em;\">通过配置应用权限，可以控制每个地址的访问权限。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.完美的 消息推送</p><p style=\"text-indent: 2em; line-height: 2em;\">支持实时的消息推送技术。</p><p style=\"text-indent: 2em; line-height: 2em;\">网站会员第一时间获取到消息等。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.全新的Wap功能</p><p style=\"text-indent: 2em; line-height: 2em;\">新推出 Wap功能。</p><p style=\"text-indent: 2em; line-height: 2em;\">手机直接浏览网站无需下载APP,更省流量。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.完善的APP接口</p><p style=\"text-indent: 2em; line-height: 2em;\">与手机端无缝对接。</p><p style=\"text-indent: 2em; line-height: 2em;\">开发手机端其它端简单方便等。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.完善的手机安全</p><p style=\"text-indent: 2em; line-height: 2em;\">网站会员开通VIP会员后,可以使用手机验证登录,手机验证提现等。</p><p style=\"text-indent: 2em; line-height: 2em;\">高级安全保护会员的帐号信息。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.完美整合Discuz!论坛</p><p style=\"text-indent: 2em; line-height: 2em;\">FoxPHP程序与Discuz!论坛实现同步登录;同步注册;同步头像等。</p><p style=\"text-indent: 2em; line-height: 2em;\">会员数据无缝对接。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.IM即时通讯</p><p style=\"text-indent: 2em; line-height: 2em;\">自主研制网站即时通讯,网站会员随时聊天谈项目。</p><p style=\"text-indent: 2em; line-height: 2em;\">会员即时沟通无障碍</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.O2O定位</p><p style=\"text-indent: 2em; line-height: 2em;\">开启O2O定位,会员访问直接进入对应的城市</p><p style=\"text-indent: 2em; line-height: 2em;\">会员直接对本地区域数据访问</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>FoxPHP安装环境要求</strong></p><p style=\"text-indent: 2em; line-height: 2em;\">---------------------------------------------------------------------</p><p style=\"text-indent: 2em; line-height: 2em;\">硬件要求CPU 1G 以上</p><p style=\"text-indent: 2em; line-height: 2em;\">内存 1G 以上</p><p style=\"text-indent: 2em; line-height: 2em;\">硬盘 500M以上</p><p style=\"text-indent: 2em; line-height: 2em;\">软件要求Nginx 或 Apache</p><p style=\"text-indent: 2em; line-height: 2em;\">PHP 5.3 以上</p><p style=\"text-indent: 2em; line-height: 2em;\">MySQL 5.0 以上</p><p><br/></p>','','http://ah1.down.chinaz.com/201610/foxphp_v3.01.zip','FoxPHP威客系统是基于thinkphp开发的大型多用户多店铺,B2B,C2C,O2O悬赏系统,服务商(威客卖家)网上提供服务,雇主(买家)付费购买服务的在线交易平台 FoxPHP威客系统应用 应用于设计行业、程序开发、推广、起名、包外平','','1','0','1','','','','1476712735','1476719160','9','24','1','5','','1','0','1','thinkphp,威客系统,FoxPHP','http://demo.foxphp.com/','1','0','48,69,72,73');
INSERT INTO `my_soft` VALUES ('46','PHP内容管理系统_Joomla快速建站指南[陈红飞 pdf扫描版]','','','/uploads/img1/20161017/5804e0b5167f7.jpg!300X300.jpg','','<p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>《PHP内容管理系统:Joomla快速建站指南》是一本由浅入深，循序渐进地讲授如何使用Joomla架构网站的教程，适合广大Web网站开发人员、网站管理维护人员、个人站点和企业门户创建者、大专院校学生阅读。</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>内容简介</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">Joomla内容管理系统是目前最流行的内容管理系统之一。全书内容包括认识Joomla和内容管理系统、开发工具安装和Joomla安装、后台管理系统学习、内容管理学习、模板开发应用、组件开发应用、插件开发应用、模块开发应用、常见模块应用、架构和源码剖析、综合网站实例开发。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">为了便于读者学习，《PHP内容管理系统:Joomla快速建站指南》有一章综合了Joomla中几乎所有的知识点，对一个完整网站进行架构，实例具有很强的实用价值，具体讲解了开发环境和开发软件安装、用户注册登录模块、内容管理模块、评论系统、首页模板开发、产品展示模块、相册模块、积分模块、用户系统开发、论坛模块和站内短信模块应用。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">《PHP内容管理系统:Joomla快速建站指南》适合广大Web网站开发人员、网站管理维护人员、个人站点和企业门户创建者、大专院校学生阅读，尤其是有一定PHP网站编程技术的人员。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>作者简介</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">陈红飞，从事web开发工作有6年时间，先后在几家跨国公司从事大型电子商务平台开发。现担任大型游戏社区开发主管。精通LAMP框架开发，参与多个国内外开源PHP框架开发。Joomla是一套筒单易学，操作便刺的跨平台内各管理系统(eMS)。它采用PHP十MYsol数据厍开发，可跨平台运行。Joomia包含基本的内各管理、图片管理、网站布局管理、模板/主题管理。同时，用户可以通过上千个插件进行功能扩展，如电手商务与购物车引擎、论坛与聊天、日历、博蓉、目录分炎管理、广告管理系统、电手报、数据收集与报表工具、期刊订阅服务等。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>编辑推荐</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">《PHP内容管理系统:Joomla快速建站指南》是国内第一本详细讲解Joomla的书籍，详细讲解从安装到应用，掌握快速建站的方法;分析Joomla强大的后台管理，轻松管理网站内容、探讨模板设计、开发和外部模板的应用，打造个性化的网站;结合最流行的MVC开发架构讲解，分析Joomla的设计和工作机制、Apache安装和配置、MySQL安装和配置、PHP安装和配置、Joomla后台、Joomla内容管理、lootnla插件、组件开发、模板开发、模块开发、新闻系统、注册登录模块、论坛模块、站内信息、台球网、源代码配置文件探析、Joomla运行机制探析等方面。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>目录</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第1篇 Joomla框架概述篇</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第1章 欢迎来到Joomla 16</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.1 Joomla简介 16</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.1.1 什么是内容管理系统(CMS) 16</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.1.2 为什么选择Joomla 17</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.2 Joomla与其他CMS的比较 19</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.2.1 Joomla 19</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.2.2 Drupal 21</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.2.3 Plone 21</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.3 Joomla的发展 21</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1.4 小结 22</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第2章 开始Joomla之旅 23</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.1 安装配置Apache服务器 23</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.1.1 安装Web服务器Apache 23</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.1.2 启动和配置Web服务器Apache 25</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.1.3 测试Web服务器Apache 26</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.2 安装和配置MySQL数据库 27</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.2.1 下载MySQL及其相关工具 27</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.2.2 安装MySQL数据库 28</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.2.3 配置MySQL数据库 29</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.3 安装和配置PHP 30</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.3.1 下载PHP及其相关工具 31</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.3.2 安装与配置PHP 31</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.3.3 测试PHP 32</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4 下载和安装Joomla 34</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.1 下载Joomla 34</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.2 安装Joomla--配置语言 34</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.3 安装Joomla--安装前检查 35</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.4 安装Joomla--授权规定 36</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.5 安装Joomla--数据库配置 37</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.6 安装Joomla--FTP配置 39</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.7 安装Joomla--主要配置 39</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.4.8 安装Joomla--完成 41</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.5 Joomla组成结构 41</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.5.1 Joomla的目录结构 42</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.5.2 Joomla模板介绍 43</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.5.3 Joomla组件介绍 44</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.5.4 Joomla模块介绍 45</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.5.5 Joomla插件介绍 46</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.6 Joomla用户设计详解 47</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.6.1 前台用户 47</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.6.2 后台用户 47</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">2.7 本章小结 48</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第2篇 Joomla后台篇</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第3章 建立Joomla后台 50</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.1 Joomla后台概述 50</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.2 媒体文件管理 52</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.2.1 媒体目录浏览 52</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.2.2 创建媒体目录 52</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.2.3 上传文件到媒体管理 53</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.3 功能菜单管理 55</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.3.1 创建功能菜单 55</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.3.2 复制/移动/删除功能菜单 56</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.4 菜单项目管理 59</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.4.1 菜单项目类型 59</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.4.2 新建文章类型的菜单项目 60</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.4.3 复制/移动/回收菜单项目 63</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.4.4 发布与取消菜单项目 66</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.5 语言管理 67</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.5.1 后台语言包 67</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.5.2 前台语言包 69</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.5.3 设置默认语言包 69</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.6 全站设置 71</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.6.1 网站设置 71</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.6.2 系统设置 73</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.6.3 服务器设置 76</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.7 后台数据库管理 79</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.7.1 新建数据库表结构 79</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.7.2 建立数据库表基类 80</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.7.3 建立数据库表单 81</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.8 处理数据表数据 84</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.8.1 添加工具命令栏 84</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.8.2 数据添加 86</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.8.3 数据列表 88</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.8.4 编辑数据表记录 90</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.8.5 删除数据表记录 93</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">3.9 本章小结 94</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第4章 Joomla后台内容管理 95</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.1 内容区块管理--单元管理 95</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.1.1 添加单元信息 96</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.1.2 编辑单元信息 97</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.1.3 删除单元信息 97</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.1.4 复制单元信息 99</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.1.5 发布/取消发布 99</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.2 内容区块管理--类别管理 100</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.2.1 添加类别项目 101</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.2.2 编辑类别项目 103</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.2.3 删除类别项目 103</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.2.4 复制类别项目 104</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.2.5 发布/取消发布类别项目 105</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.3 文章管理概述 105</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.4 添加文章 107</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.4.1 文章内容块 107</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.4.2 文章参数设定 108</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.4.3 完成文章添加 110</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5 文章维护 111</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5.1 编辑文章 111</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5.2 文章存档 111</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5.3 发布/取消发布文章 112</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5.4 复制文章 113</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5.5 移动文章 113</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5.6 回收文章 115</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.5.7 文章回收站管理 115</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.6 首页管理 116</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.6.1 首页模板 117</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.6.2 首页菜单 119</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.6.3 首页内容 120</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">4.7 本章小结 121</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第3篇 Joomla开发篇</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第5章 插件详解 124</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.1 后台插件管理 124</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.1.1 插件维护 125</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.1.2 插件应用 128</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.1.3 编写简单插件 131</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.2 内容管理插件 134</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.2.1 Vote插件 134</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.2.2 Pagenavigation插件 137</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.3 开发插件实例 141</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">5.4 本章小结 144</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第6章 组件开发 145</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.1 后台组件管理 145</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.2 Joomla的MVC开发模式 147</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.2.1 Model 147</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.2.2 Controller 147</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.2.3 View 148</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3 Hello World组件开发 148</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3.1 创建组件 148</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3.2 创建组件入口文件 149</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3.3 创建组件控制器(Controller)文件 150</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3.4 创建组件视图(View)文件 151</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3.5 创建组件模板(Tpl)文件 151</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3.6 创建安装文件(Hello.xml) 151</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.3.7 查看组件执行结果 153</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">6.4 本章小结 153</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第7章 组件开发--Hello World组件开发进阶 154</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.1 创建Model 154</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.2 在组件中使用数据库 156</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.2.1 创建数据表 156</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.2.2 修改Model 156</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.2.3 修改入口文件 157</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.2.4 修改模板 158</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.2.5 查看结果 158</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.3 创建组件管理员页面基本框架 158</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.3.1 创建入口文件 158</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.3.2 创建Hellos Controller文件 159</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.3.3 创建Hellos Model文件 160</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.3.4 创建Hellos View文件 161</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.3.5 创建Hellos Template文件 162</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.3.6 目录结构及查看结果 162</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.4 加强组件管理员页面 163</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.4.1 增加工具栏命令按钮 163</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.4.2 增加编辑功能 164</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.4.3 添加保存功能 169</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.4.4 添加数据删除功能 172</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.4.5 添加取消功能 173</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">7.5 本章小结 174</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第8章 模板开发和应用 175</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.1 后台模板文件管理 175</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.1.1 后台添加模板 176</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.1.2 设置默认模板 178</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.1.3 编辑模板 178</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.1.4 删除模板 181</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.2 简单的模板设计 182</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.2.1 模板基本结构 182</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.2.2 创建主入口文件 182</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.2.3 创建配置文件 185</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.2.4 创建样式文件 186</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.2.5 测试模板 187</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.3 模板开发进阶 188</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.3.1 准备工作 188</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.3.2 模板标记 189</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.3.3 模板中应用模块 189</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.3.4 获取模板参数 190</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.3.5 模板全局变量 190</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.4 完整的模板开发实例 191</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.4.1 模板结构 191</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.4.2 模板中模块应用 193</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.4.3 模板中的隐藏 194</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.4.4 模板参数说明 195</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.4.5 自定义error page模板 199</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">8.5 本章小结 202</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第9章 模块开发 203</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.1 后台模块管理 203</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.1.1 后台添加模块 205</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.1.2 复制/修改/删除模块 206</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.2 Hello World模块开发入门 209</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.2.1 模块架构 209</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.2.2 创建主入口文件 209</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.2.3 创建helper文件 210</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.2.4 创建模板文件 211</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.2.5 创建安装配置文件 211</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.2.6 测试模块 212</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.3 模块开发进阶 214</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.3.1 准备工作 214</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.3.2 创建主入口文件 216</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.3.3 创建helper文件 217</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.3.4 创建模板文件 218</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.3.5 创建安装配置文件 218</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.3.6 应用模块 219</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">9.4 本章小结 220</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第4篇 Joomla实战篇</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第10章 新闻系统实例 224</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.1 准备工作 224</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.2 后台新闻管理 224</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.2.1 新闻系统内容管理 225</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.2.2 新闻系统菜单管理 230</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.2.3 新闻系统模块管理 233</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.3 前台开发 235</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.3.1 简单的新闻系统 235</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.3.2 增强型新闻系统 238</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">10.4 本章小结 244</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第11章 用户登录注册模块 245</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.1 后台登录模块管理 245</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.1.1 改变用户权限 245</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.1.2 后台添加会员 247</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.1.3 注销/删除会员 249</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.1.4 注册激活 250</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.2 前台注册登录模块 251</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.2.1 前台显示 251</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.2.2 注册功能 252</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.2.3 忘记密码功能 254</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.2.4 忘记用户名功能 255</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.2.5 登录功能 256</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.2.6 注销用户登录 256</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">11.3 本章小结 257</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第12章 论坛模块 258</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.1 论坛安装 258</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.1.1 安装过程 258</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.1.2 应用论坛 261</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.2 论坛管理 263</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.2.1 论坛基本设置 263</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.2.2 论坛版块管理 263</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.2.3 会员管理 266</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.3 论坛应用 269</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.3.1 发帖 269</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.3.2 个人资料 269</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">12.4 本章小结 271</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第13章 站内信息模块 273</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.1 站内信息安装 273</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.2 站内信息前台应用 274</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.3 站内信息收发 277</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.4 站内信息源码剖析 278</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.4.1 站内信息安装目录 278</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.4.2 站内信息MVC开发模式 280</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">13.5 本章小结 284</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第14章 项目实战--台球网 285</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.1 系统介绍 285</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.2 系统设计 286</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.2.1 开发环境 286</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.2.2 安装软件 286</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.3 准备工作 287</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.3.1 添加球房资料 287</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.3.2 增强型单元管理页面 287</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.3.3 添加用户登录模块 290</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.4 用户评论系统 291</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.4.1 安装评论组件 292</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.4.2 后台设置评论组件 292</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.4.3 前台应用评论组件 295</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.5 首页模板开发 296</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.5.1 修改模板头部 296</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.5.2 内容区模板修改 299</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.5.3 右边区模板修改 304</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.6 外部组件、模块和插件 312</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.6.1 产品展示组件 313</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.6.2 产品展示组件扩展应用 317</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.6.3 相册组件应用 318</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.6.4 用户积分系统 327</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.7 用户系统开发 333</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.7.1 活跃用户 333</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.7.2 用户个性化设计 336</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.8 外部组件应用 345</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.8.1 论坛应用 345</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.8.2 站内短信应用 345</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">14.9 本章小结 347</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第5篇 Joomla扩展篇</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">第15章 Joomla源码探析 350</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1 Joomla1.5架构 350</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.1 Application包 350</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.2 Cache包 352</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.3 DataBase包 353</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.4 Common包 354</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.5 Connector包 354</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.6 FileSystem包 355</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.7 Document包 355</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.8 Registry包 356</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.9 Template包 356</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.10 I18n包 356</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.11 Mail包 358</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.12 Installer包 358</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.13 Model包 359</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.14 Parameter包 360</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.1.15 Utilities包 360</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2 Joomla1.5源码 361</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2.1 入口及配置文件 361</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2.2 引入文件 365</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2.3 常用类文件 366</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2.4 Filesystem包类文件 371</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2.5 JRequest类 373</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2.6 MVC组件类 375</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.2.7 组件及模块调用及渲染 378</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">15.3 本章小结 385</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">……</p><p><br/></p>','','http://pan.baidu.com/s/1cyyzIu','《PHP内容管理系统:Joomla快速建站指南》是一本由浅入深，循序渐进地讲授如何使用Joomla架构网站的教程，适合广大Web网站开发人员、网站管理维护人员、个人站点和企业门户创建者、大专院校学生阅读。\r\n百度云盘提取密码：saf6','','1','0','1','','','','1476714597','1476715185','4','32','1','5','','1','0','1','PHP,Joomla,陈红飞,pdf','','0','0','78');
INSERT INTO `my_soft` VALUES ('47','基于thinkphp5.0.1开发的wstMall V1.7.5多商户系统下载','','','/uploads/img1/20161017/5804f1aaab0c3.jpg!300X300.jpg','/uploads/img1/20161017/5804f064696e5.gif$$$首页|||/uploads/img1/20161017/5804f0ad5ff61.gif$$$商品详情页','<p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>wstMall&nbsp;V1.7.5本次版本要新增以下功能：</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">1.添加全国配送功能</p><p style=\"line-height: 2em; text-indent: 2em;\">2.添加商品优惠套餐功能</p><p style=\"line-height: 2em; text-indent: 2em;\">3.修复导入商品没有商品分类bug</p><p style=\"line-height: 2em; text-indent: 2em;\">4.修复（评价）订单下多件商品时，只有第一个能上传附件</p><p style=\"line-height: 2em; text-indent: 2em;\">5.系统代码优化</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">*若已安装的用户请参照以下步骤：</p><p style=\"line-height: 2em; text-indent: 2em;\">1、wstmall/Upgrade/Upgrade覆盖升级。</p><p style=\"line-height: 2em; text-indent: 2em;\">2、执行1.7.5.sql 数据库文件。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>WSTMall 电子商务系统功能更新计划</strong></p><p style=\"line-height: 2em; text-indent: 2em;\">&nbsp;</p><p style=\"line-height: 2em; text-indent: 2em;\">以下内容为WSTMall 电子商务系统2016下半年功能新增计划，已授权用户可同步更新，部分功能仅开放授权用户使用。 &nbsp;&nbsp;</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">2016年10月</p><p style=\"line-height: 2em; text-indent: 2em;\">将新增以下功能，PC授权执行价格为1600元。</p><p style=\"line-height: 2em; text-indent: 2em;\">入驻店铺可支持全国配送：入驻的店铺如果为全国支持性店铺，店铺出售的商品可支持配送至全国，可不受区域限制。</p><p style=\"line-height: 2em; text-indent: 2em;\">商品组合优惠功能：店铺可发布组合商品，购买商品组合会执行组合套餐设置的商品价格。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">2016年11月</p><p style=\"line-height: 2em; text-indent: 2em;\">将新增以下功能，PC授权执行价格为1700元。</p><p style=\"line-height: 2em; text-indent: 2em;\">会员账户/资金管理：新增用户账户功能，用户余额可用于商品购物以及资金提现。</p><p style=\"line-height: 2em; text-indent: 2em;\">二级分销：提供商品推荐购买返现，提供二级分销推荐机制。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">2016年12月</p><p style=\"line-height: 2em; text-indent: 2em;\">将新增以下功能，PC授权执行价格为1800元。</p><p style=\"line-height: 2em; text-indent: 2em;\">优惠码：线上线下结合，线下发放优惠码，线上购物可输入优惠码进行结算。</p><p style=\"line-height: 2em; text-indent: 2em;\">满减优惠券：用户可领取满减优惠券，购买满了一定额度的商品，可选择满减优惠券进行优惠结算。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">2017年1月</p><p style=\"line-height: 2em; text-indent: 2em;\">将新增以下功能，PC授权执行价格为1900元。</p><p style=\"line-height: 2em; text-indent: 2em;\">商品团购功能：提供商品团购功能。</p><p style=\"line-height: 2em; text-indent: 2em;\">限时抢购功能：提供商品限时抢购功能。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">2017年2月</p><p style=\"line-height: 2em; text-indent: 2em;\">将更新以下功能，PC授权执行价格为2000元。</p><p style=\"line-height: 2em; text-indent: 2em;\">网站风格实现灵活切换：完善风格标签功能，网站风格可在系统后台灵活切换。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>WSTMall有计划提供以下报表：</strong></p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">1.店铺-订单报表（当天，7天,30天已取消，拒收，销售的订单报表）</p><p style=\"line-height: 2em; text-indent: 2em;\">2.店铺-商品销售情况表（当天，7天,30天前10名销售商品）</p><p style=\"line-height: 2em; text-indent: 2em;\">3.商城-注册用户、注册商家、活跃用户、活跃商家报表（当天，7天,30天）</p><p style=\"line-height: 2em; text-indent: 2em;\">4.店铺-每月（时间段）在线支付的对账单</p><p style=\"line-height: 2em; text-indent: 2em;\">5.商城-各店铺每月（时间段）在线支付的对账单</p><p style=\"line-height: 2em; text-indent: 2em;\">6.商城-订单报表（当天，7天,30天已取消，拒收，销售的订单报表）</p><p style=\"line-height: 2em; text-indent: 2em;\">7.店铺-商品销售情况表（当天，7天,30天前10名销售商品）</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\">以上为WSTMall 电子商务系统功能新增计划供大家参考，部分功能将依实际情况进行调整，届时手机版、微信版功能和授权价格将按实际情况进行调整，授权用户将一直享受免费升级服务。</p><p><br/></p><p style=\"line-height: 2em; text-indent: 2em;\"><strong>百度云盘提取密码：mbvj</strong></p><p><br/></p>','','http://pan.baidu.com/s/1nv8luyd','wstMall V1.7.5本次版本要新增以下功能：1.添加全国配送功能2.添加商品优惠套餐功能3.修复导入商品没有商品分类bug4.修复（评价）订单下多件商品时，只有第一个能上传附件5.系统代码优化*若已安装的用户请参照以下步骤','','1','0','1','','','','1476718600','1476719022','6','24','1','5','','1','0','1','thinkphp5.0.1,wstMall,多商户系统','http://wstmart.shangtaosoft.com/','1','0','48,69,72,73');
INSERT INTO `my_soft` VALUES ('48','thinkphp开源商城源码TPshop V1.3.1下载','','','/uploads/img1/20161018/58063863532a4.jpg!300X300.jpg','/uploads/img1/20161018/58063863532a4.jpg$$$首页|||/uploads/img1/20161018/5806386761d31.jpg$$$后台|||/uploads/img1/20161018/5806386b6bb66.jpg$$$商品列表页','<p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>源码简介：</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">TPshop商城( Thinkphp shop的简称 )B2C 和 B2B2C商城免费开源网站源码,TPshop V1.3.1目前是最新版本。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">TPshop是基于thinkphp开发的一款免费开源的网店系统，适合企业及个人,包含 (微信商城 + wap + android + ios + pc) 二次开发非常方便, 详细的TPshop使用手册 + TPshop二开手册 + TPshop 98小时的二开视频教程，使开发者得心应手, 一看就懂 一听就会, 代码清晰简洁,通俗易懂. 丰富的插件和多套模板支持, 易扩展. 是目前国内首家最为完善的开源商城系统。系统支持多语言版本，操作简单,安全稳定,是广大用户二次开发的最佳选择。</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>TPshop 网店系统安装说明：</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1、下载文件，并且解压到网站的根目录下或者根目录下新建一个目录，配置好apache虚拟主机;</p><p style=\"text-indent: 2em; line-height: 2em;\">2、访问安装地址:</p><p style=\"text-indent: 2em; line-height: 2em;\">(1)服务器本地安装http://localhost/install/（或者http://www.xxx.com/install/）&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">(2)远程访问域名安装例如http://域名/install/,不支持http://域名/xxx/install/域名下的子目录安装方式</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">注意： 这里所讲的在域名根目录安装指的是 apache 配置虚拟主机安装， 不能嵌套文件夹下面，</p><p style=\"text-indent: 2em; line-height: 2em;\">而不是说一个服务器只能安装一个web程序， 安装TPshop对其他web项目没有任何影响。</p><p style=\"text-indent: 2em; line-height: 2em;\">如果不会安装， 请看安装视频教程 http://pan.baidu.com/s/1dFpvStz&nbsp;</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">环境要求：</p><p style=\"text-indent: 2em; line-height: 2em;\">Linux + Apache + Mysql + PHP</p><p style=\"text-indent: 2em; line-height: 2em;\">注意事项：</p><p style=\"text-indent: 2em; line-height: 2em;\">1、本商城运行需要依靠Cookies支持；</p><p style=\"text-indent: 2em; line-height: 2em;\">2、本版本免费开放个人学习使用权，网友可以任意学习使用和传播，但必须保留TPshop的著作权和署名权； 如果商业用途，请到官网进行注册授权，避免日后产生法律纠纷。</p><p style=\"text-indent: 2em; line-height: 2em;\">3、如有问题请咨询；</p><p style=\"text-indent: 2em; line-height: 2em;\">4、使用过程可参考 图文教程，视频教程。</p><p style=\"text-indent: 2em; line-height: 2em;\">一些对你有用帮助的说明：</p><p style=\"text-indent: 2em; line-height: 2em;\">1、安装后请登录网店系统后台修改管理员密码和管理员的相关信息。&nbsp;</p><p style=\"text-indent: 2em; line-height: 2em;\">2、在网店系统系统设置面板设置好系统参数后就可以添加商品分类和商品了</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>TPshop V1.3.1 更新日志：</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">1 修复用户中心找回密码</p><p style=\"text-indent: 2em; line-height: 2em;\">2 手机版增加在线充值，申请提现，充值记录</p><p style=\"text-indent: 2em; line-height: 2em;\">3 增加文章分组功能</p><p style=\"text-indent: 2em; line-height: 2em;\">4 修复发货单出现已取消的订单</p><p style=\"text-indent: 2em; line-height: 2em;\">5 增加会员分销收益情况统计</p><p style=\"text-indent: 2em; line-height: 2em;\">6 修复报表统计概览数据不准问题</p><p style=\"text-indent: 2em; line-height: 2em;\">7 修复文章分类编辑超时BUG</p><p style=\"text-indent: 2em; line-height: 2em;\">8 修复团购活动编辑保存ID出错问题</p><p style=\"text-indent: 2em; line-height: 2em;\">9 增加会员充值记录统计查询</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>版本区别：</strong></p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\">最新版: 底层代码优化,支持更新升级,在线模板,插件任意下载使用,无限扩展.</p><p style=\"text-indent: 2em; line-height: 2em;\">旧版本: 不支持升级,不兼容(新版插件,模板,模块)不易扩展.功能没新版多</p><p><br/></p><p style=\"text-indent: 2em; line-height: 2em;\"><strong>360云盘访问密码：8f78</strong></p><p><br/></p>','','https://320be1.lt.yunpan.cn/lk/OcvLmJAhGbuZKR','源码简介：TPshop商城( Thinkphp shop的简称 )B2C 和 B2B2C商城免费开源网站源码,TPshop V1.3.1目前是最新版本。TPshop是基于thinkphp开发的一款免费开源的网店系统，适合企业及个人,包含 (','','1','0','1','','','','1476802327','1476802673','10','24','1','1','','1','0','1','thinkphp,开源商城,TPshop,源码下载','http://demo2.tp-shop.cn/','4','0','48,73');


# 转存表中的数据：my_special 
INSERT INTO `my_special` VALUES ('1','文章汇集','','','','','http://img9.xyhcms.com/201410/53391df14c069.jpg!200X200.jpg','文章汇集','','1398668509','1398668509','82','0','1','1','','0','','Special_content.html','1','');


# 转存表中的数据：my_tag 
INSERT INTO `my_tag` VALUES ('43','0','17','蓝色','1','1','9','1476450845','1');
INSERT INTO `my_tag` VALUES ('88','0','24','方维股权众筹','1','1','5','1475985815','1');
INSERT INTO `my_tag` VALUES ('41','0','17','织梦','1','1','9','1475292464','7');
INSERT INTO `my_tag` VALUES ('12','0','0','facebook','1','1','7','1472830667','0');
INSERT INTO `my_tag` VALUES ('13','0','0','浏览器','1','1','3','1472830667','0');
INSERT INTO `my_tag` VALUES ('19','0','16','织梦HTML5','1','1','10','1474720746','2');
INSERT INTO `my_tag` VALUES ('89','0','24','方维O2O','1','1','6','1475985826','1');
INSERT INTO `my_tag` VALUES ('17','0','16','html5响应式','1','1','5','1473955120','1');
INSERT INTO `my_tag` VALUES ('18','0','16','手机模板','1','1','16','1473955120','1');
INSERT INTO `my_tag` VALUES ('20','0','17','后台模板','1','1','3','1474341896','1');
INSERT INTO `my_tag` VALUES ('21','0','17','bootstrap','1','1','3','1474341896','1');
INSERT INTO `my_tag` VALUES ('22','0','17','企业模板','1','1','3','1474341896','1');
INSERT INTO `my_tag` VALUES ('25','0','17','织梦dedecms','1','1','5','1474718255','1');
INSERT INTO `my_tag` VALUES ('26','0','17','旅游图片','1','1','5','1474718255','1');
INSERT INTO `my_tag` VALUES ('27','0','17','网站模板','1','1','5','1474718255','2');
INSERT INTO `my_tag` VALUES ('29','0','16','织梦HTML5','1','1','10','1474720746','2');
INSERT INTO `my_tag` VALUES ('30','0','17','响应式','1','1','7','1474739659','4');
INSERT INTO `my_tag` VALUES ('90','0','24','方维O2O生活服务系统','1','1','6','1475985826','1');
INSERT INTO `my_tag` VALUES ('33','0','17','织梦响应式','1','1','4','1474740245','1');
INSERT INTO `my_tag` VALUES ('34','0','17','化妆品模板','1','1','4','1474740245','1');
INSERT INTO `my_tag` VALUES ('35','0','17','网站模板下载','1','1','4','1474740245','1');
INSERT INTO `my_tag` VALUES ('36','0','17','dedecms','1','1','13','1474740811','0');
INSERT INTO `my_tag` VALUES ('37','0','17','金融投资模板','1','1','12','1474740811','1');
INSERT INTO `my_tag` VALUES ('38','0','17','企业模板下载','1','1','12','1474740811','1');
INSERT INTO `my_tag` VALUES ('39','0','17','儿童服装模板','1','1','5','1474717916','1');
INSERT INTO `my_tag` VALUES ('40','0','17','模板下载','1','1','5','1474717916','5');
INSERT INTO `my_tag` VALUES ('45','0','18','discuz亮剑拼车系统','1','1','5','1475419564','1');
INSERT INTO `my_tag` VALUES ('46','0','18','discuz拼车系统','1','1','5','1475419564','1');
INSERT INTO `my_tag` VALUES ('47','0','18','拼车系统下载','1','1','5','1475419564','1');
INSERT INTO `my_tag` VALUES ('48','0','18','Discuz!X3.2模板','1','1','5','1475461682','1');
INSERT INTO `my_tag` VALUES ('49','0','18','Discuz仿163K地方门户','1','1','5','1475461682','1');
INSERT INTO `my_tag` VALUES ('50','0','18','Discuz分类信息模板','1','1','5','1475461682','1');
INSERT INTO `my_tag` VALUES ('51','0','18','Discuz楼盘展示模版','1','1','5','1475461682','1');
INSERT INTO `my_tag` VALUES ('52','0','20','WordPress响应式','1','1','5','1475589336','1');
INSERT INTO `my_tag` VALUES ('53','0','20','WordPress自适应','1','1','5','1475589336','1');
INSERT INTO `my_tag` VALUES ('54','0','20','HTML5','1','1','5','1475589336','4');
INSERT INTO `my_tag` VALUES ('55','0','20','科技资讯主题模版','1','1','14','1475589336','0');
INSERT INTO `my_tag` VALUES ('56','0','17','蓝色','1','1','4','1476450845','3');
INSERT INTO `my_tag` VALUES ('57','0','30','html5模板','1','1','7','1475591753','1');
INSERT INTO `my_tag` VALUES ('58','0','30','html5自适应','1','1','7','1475591753','1');
INSERT INTO `my_tag` VALUES ('59','0','30','手机wap站模板','1','1','7','1475591753','1');
INSERT INTO `my_tag` VALUES ('60','0','18','Discuz模板','1','1','4','1475772627','2');
INSERT INTO `my_tag` VALUES ('61','0','18','Discuz美食类模板','1','1','4','1475772627','1');
INSERT INTO `my_tag` VALUES ('63','0','30','DIV+CSS','1','1','4','1475812617','1');
INSERT INTO `my_tag` VALUES ('64','0','30','仿拉勾网','1','1','4','1475812617','1');
INSERT INTO `my_tag` VALUES ('65','0','30','HTML模板','1','1','4','1475812617','1');
INSERT INTO `my_tag` VALUES ('66','0','30','仿拉勾网下载','1','1','4','1475812617','1');
INSERT INTO `my_tag` VALUES ('67','0','18','Discuz!X3模板','1','1','5','1475812884','1');
INSERT INTO `my_tag` VALUES ('68','0','18','Discuz!X3图片素材模板','1','1','5','1475812884','1');
INSERT INTO `my_tag` VALUES ('69','0','18','Discuz!X3.2旅游户外模板','1','1','5','1475814961','1');
INSERT INTO `my_tag` VALUES ('70','0','18','Discuz!仿磨房旅游模板','1','1','5','1475814961','1');
INSERT INTO `my_tag` VALUES ('71','0','18','Discuz!仿穷游网','1','1','4','1475819360','1');
INSERT INTO `my_tag` VALUES ('72','0','18','Discuz!旅游门户模版','1','1','4','1475819360','1');
INSERT INTO `my_tag` VALUES ('87','0','24','方维众筹系统','1','1','5','1475985815','1');
INSERT INTO `my_tag` VALUES ('73','0','30','uimaker','1','1','4','1475845739','1');
INSERT INTO `my_tag` VALUES ('74','0','30','uimaker后台管理系统','1','1','4','1475845739','1');
INSERT INTO `my_tag` VALUES ('75','0','30','html模版下载','1','1','4','1475845739','1');
INSERT INTO `my_tag` VALUES ('76','0','24','CMS','1','1','5','1476709653','1');
INSERT INTO `my_tag` VALUES ('148','0','24','thinkphp','1','1','4','1476713117','17');
INSERT INTO `my_tag` VALUES ('77','0','18','Discuz!仿西子社区','1','1','8','1475895298','1');
INSERT INTO `my_tag` VALUES ('78','0','18','Discuz模板下载','1','1','5','1475895392','2');
INSERT INTO `my_tag` VALUES ('79','soft','18','Discuz!仿IOS','1','1','4','1475919192','1');
INSERT INTO `my_tag` VALUES ('80','soft','18','Discuz!手机模版','1','1','4','1475919192','1');
INSERT INTO `my_tag` VALUES ('81','soft','18','Discuz!X3','1','1','4','1475919202','4');
INSERT INTO `my_tag` VALUES ('82','soft','18','Discuz!仿ZCOOL','1','1','4','1475919202','1');
INSERT INTO `my_tag` VALUES ('83','soft','18','Discuz!图片素材站模板','1','1','4','1475919202','1');
INSERT INTO `my_tag` VALUES ('84','0','25','织梦仿砍柴网','1','1','4','1475919236','1');
INSERT INTO `my_tag` VALUES ('85','0','25','织梦整站源码','1','1','4','1475919236','1');
INSERT INTO `my_tag` VALUES ('86','0','25','织梦手机网站','1','1','4','1475919236','1');
INSERT INTO `my_tag` VALUES ('91','0','24','方维O2O下载','1','1','6','1475985826','1');
INSERT INTO `my_tag` VALUES ('92','0','25','PHP+MYSQL','1','1','4','1476068969','1');
INSERT INTO `my_tag` VALUES ('93','0','25','微信三级分销系统','1','1','4','1476068969','1');
INSERT INTO `my_tag` VALUES ('94','0','25','微信分销系统','1','1','4','1476068969','1');
INSERT INTO `my_tag` VALUES ('95','0','25','淘宝客源码','1','1','4','1476068970','1');
INSERT INTO `my_tag` VALUES ('96','0','25','织梦淘宝客源码','1','1','4','1476068970','1');
INSERT INTO `my_tag` VALUES ('97','0','25','dedecms淘宝客','1','1','4','1476068970','1');
INSERT INTO `my_tag` VALUES ('98','0','25','织梦html5响应式','1','1','4','1476155531','1');
INSERT INTO `my_tag` VALUES ('99','0','25','织梦装修公司源码','1','1','4','1476155531','1');
INSERT INTO `my_tag` VALUES ('100','0','25','Modoer点评系统','1','1','5','1476155542','1');
INSERT INTO `my_tag` VALUES ('101','0','25','Modoer多城市破解版','1','1','5','1476155542','1');
INSERT INTO `my_tag` VALUES ('104','0','24','thinkphp5.0开源系统','1','1','10','1476199403','2');
INSERT INTO `my_tag` VALUES ('105','0','24','LUFFYCMS下载','1','1','4','1476199290','1');
INSERT INTO `my_tag` VALUES ('106','0','24','thinkphp3.2开源系统','1','1','3','1476199291','1');
INSERT INTO `my_tag` VALUES ('107','0','24','KenCMS内容管理系统V1.1','1','1','3','1476199291','1');
INSERT INTO `my_tag` VALUES ('108','0','24','thinkphp5.0','1','1','8','1476199403','2');
INSERT INTO `my_tag` VALUES ('121','0','24','thinkphp开源系统','1','1','7','1476329280','3');
INSERT INTO `my_tag` VALUES ('123','0','24','兔子cms','1','1','3','1476329210','1');
INSERT INTO `my_tag` VALUES ('122','0','24','TuziCMS','1','1','3','1476329210','1');
INSERT INTO `my_tag` VALUES ('110','0','24','SentCMS下载','1','1','4','1476199558','1');
INSERT INTO `my_tag` VALUES ('111','0','24','微信公众号管理系统','1','1','7','1476421865','1');
INSERT INTO `my_tag` VALUES ('112','0','24','DuoThinkCMS','1','1','5','1476244515','1');
INSERT INTO `my_tag` VALUES ('113','0','24','综合门户','1','1','5','1476244515','1');
INSERT INTO `my_tag` VALUES ('114','0','24','AmazeUI','1','1','5','1476244515','1');
INSERT INTO `my_tag` VALUES ('115','0','24','thinkphp手游平台源码','1','1','4','1476244519','1');
INSERT INTO `my_tag` VALUES ('116','0','24','Easy-Admin','1','1','6','1476502069','0');
INSERT INTO `my_tag` VALUES ('117','0','24','ThinkPHP3.1.3','1','1','3','1476244526','1');
INSERT INTO `my_tag` VALUES ('127','0','24','OpenSNS','1','1','3','1476421862','1');
INSERT INTO `my_tag` VALUES ('119','0','24','远航企业网站管理系统','1','1','3','1476244526','1');
INSERT INTO `my_tag` VALUES ('120','0','24','远航CMS','1','1','3','1476244527','1');
INSERT INTO `my_tag` VALUES ('126','0','24','thinkphp开源社交系统','1','1','3','1476421862','1');
INSERT INTO `my_tag` VALUES ('125','0','24','里程密开源博客','1','1','2','1476329360','1');
INSERT INTO `my_tag` VALUES ('128','0','24','thinkphp5','1','1','4','1476421865','4');
INSERT INTO `my_tag` VALUES ('129','0','24','微信公众号管理系统','1','1','7','1476421865','1');
INSERT INTO `my_tag` VALUES ('130','0','24','thinkphp5源码','1','1','5','1476422075','2');
INSERT INTO `my_tag` VALUES ('133','0','24','thinkphp3.23源码','1','1','2','1476502069','0');
INSERT INTO `my_tag` VALUES ('132','0','20','手机网站','1','1','1','1476450956','3');
INSERT INTO `my_tag` VALUES ('134','0','24','Easy-Admin','1','1','6','1476502069','0');
INSERT INTO `my_tag` VALUES ('146','0','24','TP-Admin','1','1','1','1476709653','0');
INSERT INTO `my_tag` VALUES ('139','0','24','XYHCMS','1','1','4','1476587593','1');
INSERT INTO `my_tag` VALUES ('140','0','24','行云海CMS','1','1','4','1476587593','1');
INSERT INTO `my_tag` VALUES ('141','0','24','内容管理系统','1','1','4','1476587593','2');
INSERT INTO `my_tag` VALUES ('142','0','24','手机版网站','1','1','4','1476587593','1');
INSERT INTO `my_tag` VALUES ('143','0','24','thinkphp源码','1','1','10','1476587677','4');
INSERT INTO `my_tag` VALUES ('144','0','24','thinkphp论坛系统','1','1','2','1476587691','1');
INSERT INTO `my_tag` VALUES ('145','0','24','Yznbbs论坛','1','1','2','1476587691','1');
INSERT INTO `my_tag` VALUES ('147','0','24','CMS','1','1','1','1476709653','11');
INSERT INTO `my_tag` VALUES ('149','0','24','威客系统','1','1','3','1476713117','1');
INSERT INTO `my_tag` VALUES ('150','0','24','FoxPHP','1','1','3','1476713117','1');
INSERT INTO `my_tag` VALUES ('151','0','32','PHP','1','1','4','1476714859','0');
INSERT INTO `my_tag` VALUES ('152','0','32','Joomla','1','1','2','1476714859','1');
INSERT INTO `my_tag` VALUES ('153','0','32','陈红飞','1','1','2','1476714859','1');
INSERT INTO `my_tag` VALUES ('154','0','32','pdf','1','1','2','1476714859','1');
INSERT INTO `my_tag` VALUES ('155','0','24','thinkphp5.0.1','1','1','2','1476718863','1');
INSERT INTO `my_tag` VALUES ('156','0','24','wstMall','1','1','2','1476718863','1');
INSERT INTO `my_tag` VALUES ('157','0','24','多商户系统','1','1','2','1476718863','1');
INSERT INTO `my_tag` VALUES ('158','0','24','开源商城','1','1','1','1476802673','0');
INSERT INTO `my_tag` VALUES ('159','0','24','TPshop','1','1','1','1476802673','0');
INSERT INTO `my_tag` VALUES ('160','0','24','源码下载','1','1','1','1476802673','0');
INSERT INTO `my_tag` VALUES ('161','0','44','SEO技巧','1','1','4','1476803791','1');
INSERT INTO `my_tag` VALUES ('162','0','44','权重','1','1','4','1476803791','1');
INSERT INTO `my_tag` VALUES ('163','0','44','排名','1','1','3','1476803791','0');
INSERT INTO `my_tag` VALUES ('164','0','43','神舟十一号','1','1','1','1476843328','0');
INSERT INTO `my_tag` VALUES ('165','0','43','天宫二号','1','1','1','1476843328','0');
INSERT INTO `my_tag` VALUES ('166','0','43','景海涛','1','1','1','1476843328','0');
INSERT INTO `my_tag` VALUES ('167','0','43','陈冬入','1','1','1','1476843328','0');
INSERT INTO `my_tag` VALUES ('168','0','45','湖南都市职业学院','1','1','3','1476845502','1');
INSERT INTO `my_tag` VALUES ('169','0','45','学生死亡','1','1','3','1476845502','1');
INSERT INTO `my_tag` VALUES ('170','0','45','灵异事件','1','1','3','1476845502','1');
INSERT INTO `my_tag` VALUES ('171','article','45','湖南都市职业学院','1','1','2','1477365944','1');
INSERT INTO `my_tag` VALUES ('172','article','45','学生死亡','1','1','2','1477365944','1');
INSERT INTO `my_tag` VALUES ('173','article','45','灵异事件','1','1','2','1477365944','1');
INSERT INTO `my_tag` VALUES ('174','soft','18','Discuz!X3','1','1','4','1477366920','0');
INSERT INTO `my_tag` VALUES ('175','soft','18','Discuz!仿ZCOOL','1','1','4','1477366920','0');
INSERT INTO `my_tag` VALUES ('176','soft','18','Discuz!图片素材站模板','1','1','4','1477366920','0');


# 转存表中的数据：my_temp 


# 转存表中的数据：my_topic 
INSERT INTO `my_topic` VALUES ('535','fjdkslafjsdkf;af;','','','','user1','','','<p>dfasfasdfadsfdsf</p>','dfasfasdfadsfdsf','1476882583','1476882600','0','40','1','0','','1','1','0','0','0','php');
INSERT INTO `my_topic` VALUES ('536','fsffdasf','','','','user1','','','<p>dsafjaskljf;ds</p>','dsafjaskljf;ds','1492754677','1492754677','0','40','1','0','','2','1','0','0','0','科技资讯主题模版,dedecms');


# 转存表中的数据：my_union 
