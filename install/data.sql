#
# 91736.com
# Version: 
# Time: 2011-12-01 07:02
# 91736: http://www.baidu.com
# --------------------------------------------------------



DROP TABLE IF EXISTS `c_admin`;
CREATE TABLE `c_admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `encrypt` char(20) NOT NULL,
  `last_time` int(10) NOT NULL default '0',
  `creat_time` int(10) NOT NULL,
  `is_lock` smallint(2) NOT NULL default '0',
  `last_ip` varchar(50) NOT NULL,
  `logins` int(10) NOT NULL default '0',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_admin_group`;
CREATE TABLE `c_admin_group` (
  `groupid` smallint(4) NOT NULL auto_increment,
  `name` char(20) NOT NULL,
  PRIMARY KEY  (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_block`;
CREATE TABLE `c_block` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `title` char(40) NOT NULL,
  `tag` char(40) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_category`;
CREATE TABLE `c_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `model` char(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `catname` char(30) NOT NULL,
  `catdir` char(30) NOT NULL,
  `thumb` char(100) DEFAULT NULL,
  `url` char(100) NOT NULL,
  `sort` int(8) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_target` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_cate` char(30) NOT NULL,
  `template_list` char(30) NOT NULL,
  `template_show` char(30) NOT NULL,
  `seo_title` char(80) NOT NULL,
  `seo_key` text NOT NULL,
  `seo_des` text NOT NULL,
  `power` text,
  `lang` int(2) unsigned NOT NULL default '1',
  `url_list` int(4) unsigned NOT NULL DEFAULT '1',
  `url_show` int(4) unsigned NOT NULL DEFAULT '2',
  `pagesize` int(5) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_config`;
CREATE TABLE `c_config` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `config_array` text NOT NULL,
  `config_tag` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_download`;
CREATE TABLE `c_download` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` tinyint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `commend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(8) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '0',
  `style` char(20) default NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_download_content`;
CREATE TABLE `c_download_content` (
  `id` int(8) NOT NULL,
  `files` char(80) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_flash`;
CREATE TABLE `c_flash` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` char(80) NOT NULL,
  `typeid` int(4) unsigned NOT NULL DEFAULT '1',
  `url` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inputtime` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_flash_type`;
CREATE TABLE `c_flash_type` (
  `id` INT( 4 ) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` CHAR( 20 ) NOT NULL ,
  PRIMARY KEY ( `id` ) 
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_form`;
CREATE TABLE `c_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `form_name` char(20) NOT NULL,
  `form_table` char(20) NOT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_code` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_form_field`;
CREATE TABLE `c_form_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `formid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `formtype` char(20) NOT NULL,
  `width` tinyint(4) NOT NULL default '0',
  `height` tinyint(4) NOT NULL default '0',
  `initial` text DEFAULT NULL,
  `explain` char(20) DEFAULT NULL,
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_keywords`;
CREATE TABLE `c_keywords` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `title` char(20) NOT NULL,
  `url` char(80) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `c_language`;
CREATE TABLE `c_language` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `title` char(20) character set utf8 NOT NULL,
  `sitename` char(20) character set utf8 NOT NULL,
  `dir` char(20) character set utf8 NOT NULL,
  `seo_title` char(80) character set utf8 NOT NULL,
  `seo_key` char(100) character set utf8 NOT NULL,
  `seo_des` text character set utf8 NOT NULL,
  `copyright` text character set utf8 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_link`;
CREATE TABLE `c_link` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(3) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `url` char(80) NOT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_link_type`;
CREATE TABLE `c_link_type` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_menu`;
CREATE TABLE `c_menu` (
  `menuid` int(8) unsigned NOT NULL auto_increment,
  `parentid` int(8) unsigned NOT NULL,
  `title` char(20) character set utf8 NOT NULL,
  `url` text character set utf8 NOT NULL,
  `sort` int(8) default '0',
  `is_show` MEDIUMINT(1) unsigned NOT NULL DEFAULT '1',
  `groupid` text character set utf8 NOT NULL,
  PRIMARY KEY  (`menuid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_model`;
CREATE TABLE `c_model` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `model_name` char(20) NOT NULL,
  `model_table` char(20) NOT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_model_field`;
CREATE TABLE `c_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `formtype` char(20) NOT NULL,
  `width` tinyint(4) NOT NULL default '0',
  `height` tinyint(4) NOT NULL default '0',
  `initial` text DEFAULT NULL,
  `explain` char(20) DEFAULT NULL,
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_member`;
CREATE TABLE `c_member` (
  `userid` int(10) unsigned NOT NULL auto_increment,
  `groupid` tinyint(4) unsigned NOT NULL default '1',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_time` int(10) NOT NULL default '0',
  `creat_time` int(10) NOT NULL,
  `is_lock` smallint(2) NOT NULL default '0',
  `last_ip` varchar(50) NOT NULL,
  `logins` int(10) NOT NULL default '0',
  `sex` char(80) DEFAULT NULL,
  `truename` char(80) DEFAULT NULL,
  `phone` char(80) DEFAULT NULL,
  `address` char(80) DEFAULT NULL,
  `email` char(80) DEFAULT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_member_field`;
CREATE TABLE `c_member_field` (
  `fieldid` mediumint(8) unsigned NOT NULL auto_increment,
  `field` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `formtype` char(20) NOT NULL,
  `width` tinyint(4) NOT NULL default '0',
  `height` tinyint(4) NOT NULL default '0',
  `initial` text DEFAULT NULL,
  `explain` char(20) DEFAULT NULL,
  `sort` mediumint(8) unsigned NOT NULL default '0',
  `is_fixed` tinyint(1) unsigned NOT NULL default '0',
  `is_register` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_member_group`;
CREATE TABLE `c_member_group` (
  `groupid` tinyint(4) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY  (`groupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_qq`;
CREATE TABLE `c_qq` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(20) NOT NULL,
  `qq` char(20) NOT NULL,
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_single`;
CREATE TABLE `c_single` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` tinyint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `commend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(8) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '0',
  `style` char(20) default NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_single_content`;
CREATE TABLE `c_single_content` (
  `id` int(8) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_job`;
CREATE TABLE `c_job` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` tinyint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `commend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(8) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '0',
  `style` char(20) default NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_job_content`;
CREATE TABLE `c_job_content` (
  `id` int(8) NOT NULL,
  `type` char(80) NOT NULL,
  `experience` char(80) NOT NULL,
  `degree` char(80) NOT NULL,
  `sex` char(80) NOT NULL,
  `numbers` char(80) NOT NULL,
  `wage` char(80) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_message`;
CREATE TABLE `c_message` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` char(80) NOT NULL,
  `inputtime` int(10) NOT NULL DEFAULT '0',
  `truename` char(80) NOT NULL,
  `telephone` char(80) NOT NULL,
  `address` char(80) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_news`;
CREATE TABLE `c_news` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` tinyint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `commend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(8) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '0',
  `style` char(20) default NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_news_content`;
CREATE TABLE `c_news_content` (
  `id` int(8) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_product`;
CREATE TABLE `c_product` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` tinyint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `commend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(8) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '0',
  `style` char(20) default NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_product_content`;
CREATE TABLE `c_product_content` (
  `id` int(8) NOT NULL,
  `content` text NOT NULL,
  `moreimage` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `c_resume`;
CREATE TABLE `c_resume` (
  `id` int(8) NOT NULL auto_increment,
  `title` char(80) NOT NULL,
  `inputtime` int(10) NOT NULL default '0',
  `truename` char(80) NOT NULL,
  `age` char(80) NOT NULL,
  `telephone` char(80) NOT NULL,
  `degree` char(80) NOT NULL,
  `address` char(80) NOT NULL,
  `school` text NOT NULL,
  `work` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `c_urlrule` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `class` varchar(10) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL default '0',
  `urldemo` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `is_fixed` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO `c_admin_group` (`groupid`, `name`) VALUES
(1, '超级管理员');

INSERT INTO `c_block` VALUES('1', 'banner', 'banner', '<img alt=\"\" src=\"/uploadfile/image/20120820/20120820133503_75593.jpg\" />');

INSERT INTO `c_category` VALUES('1', 'single', '0', '1', '0', '关于我们', 'abouts', NULL, 'index.php?m=content&c=index&f=lists&catid=1', '1', '1', '0', '0', '0', 'category_single.html', 'list_single.html', 'show_news.html', '', '', '', NULL, '1','1','2','20');
INSERT INTO `c_category` VALUES('2', 'news', '0', '2', '0', '新闻资讯', 'news', NULL, 'index.php?m=content&c=index&f=lists&catid=2', '2', '1', '0', '0', '0', 'category_news.html', 'list_news.html', 'show_news.html', '', '', '', NULL, '1','1','2','20');
INSERT INTO `c_category` VALUES('3', 'product', '0', '3', '0', '产品展示', 'products', NULL, 'index.php?m=content&c=index&f=lists&catid=3', '3', '1', '0', '0', '0', 'category_product.html', 'list_news.html', 'show_news.html', '', '', '', NULL, '1','1','2','20');

INSERT INTO `c_config` VALUES('1', 'array (
  \'is_modify\' => 1,
  \'siteurl\' => \'http://127.0.0.1/\',
  \'logourl\' => \'system/templates/xdcms/images/logo.gif\',
  \'template\' => \'xdcms\',
  \'caching\' => \'false\',
  \'createhtml\' => NULL,
)', 'config');
INSERT INTO `c_config` VALUES('2', 'array (  \'master\' => \'管理员\',  \'email\' => \'service@91736.com\',  \'contact\' => \'管理员\',  \'telephone\' => \'0771-1234567\',  \'fax\' => \'0771-1234567\',  \'mobilephone\' => \'13333333333\',  \'address\' => \'广西南宁市东葛路\',)', 'contact');
INSERT INTO `c_config` VALUES('3', 'array (  \'mailobject\' => \'1\',  \'mailserver\' => \'smtp.163.com\',  \'mailport\' => \'25\',  \'password\' => \'123456\',  \'mailadd\' => \'admin@163.com\',  \'username\' => \'admin@163.com\',)', 'email');
INSERT INTO `c_config` VALUES('4', 'array (
  \'isopen\' => \'1\',
  \'imagesize\' => \'500\',
  \'imageallowed\' => \'gif,jpg,jpeg,png\',
  \'filesize\' => \'2048\',
  \'fileallowed\' => \'rar,zip,doc\',
  \'watermark\' => \'100\',
  \'pos\' => \'9\',
  \'font\' => \'5\',
  \'width\' => \'300\',
  \'color\' => \'#FF0000\',
  \'text\' => \'xdcms.cn\',
  \'image\' => \'uploadfile/xdcms.png\',
)', 'upload');

INSERT INTO `c_flash` (`id`, `title`, `typeid`, `url`, `thumb`, `is_lock`, `inputtime`) VALUES
(1, '首页幻灯图片', 1, 'http://www.baidu.com', 'uploadfile/image/20111123/20111123030811.jpg', 0, 1322017704),
(2, '首页幻灯图片', 1, 'http://www.baidu.com', 'uploadfile/image/20111123/20111123031219.jpg', 0, 1322017941),
(3, '首页幻灯图片', 1, 'http://www.baidu.com', 'uploadfile/image/20111123/20111123031235.jpg', 0, 1322017956);

INSERT INTO `c_flash_type` (`id`, `name`) VALUES
(1, '首页幻灯');

INSERT INTO `c_form` (`id`, `form_name`, `form_table`, `is_lock`, `is_fixed`, `is_email`, `is_code`) VALUES
(7, '在线留言', 'message', 1, 0,0,1),
(8, '投递简历', 'resume', 1, 0,0,0);

INSERT INTO `c_form_field` (`fieldid`, `formid`, `field`, `name`, `formtype`, `width`, `height`, `initial`, `explain`, `sort`, `is_fixed`) VALUES
(18, 7, 'address', '地址', 'text', 35, 0, '', '', 0, 0),
(16, 7, 'truename', '姓名', 'text', 15, 0, '', '', 0, 0),
(17, 7, 'telephone', '电话', 'text', 20, 0, '', '', 0, 0),
(19, 7, 'content', '详细内容', 'textarea', 45, 6, '', '', 0, 0),
(20, 8, 'truename', '姓名', 'text', 10, 0, '', '', 0, 0),
(21, 8, 'age', '年龄', 'text', 8, 0, '', '岁', 0, 0),
(22, 8, 'telephone', '联系电话', 'text', 15, 0, '', '', 0, 0),
(23, 8, 'degree', '学历', 'option', 0, 0, '小学,初中,高中,中专,大专,本科及以上', '', 0, 0),
(24, 8, 'address', '目前所在地', 'text', 8, 0, '', '', 0, 0),
(25, 8, 'school', '学习经历', 'textarea', 60, 6, '', '', 0, 0),
(26, 8, 'work', '工作经历', 'textarea', 60, 8, '', '', 0, 0);

INSERT INTO `c_language` VALUES('1', '中文','XDcms', '', 'XDcms企业网站管理系统', '企业网站系统', 'XDcms企业网站管理系统是由南宁旭东网络科技有限公司独立开发的企业网站管理系统','南宁旭东网络科技有限公司 2012 版权所有 桂ICP备03023960号&lt;br&gt;Copyright 2012 XuDong network technology Co., LT');
INSERT INTO `c_language` VALUES('2', 'English','XDcms', 'en', 'XDcms Enterprise web site management system', 'Enterprise web site management system', 'Enterprise web site management system','Copyright 2012 XuDong network technology Co., LT');

INSERT INTO `c_menu` VALUES('1', '0', '后台首页', 'index.php?m=xdcms&c=index&f=left&id=1', '0', '1', '');
INSERT INTO `c_menu` VALUES('2', '0', '系统设置', 'index.php?m=xdcms&c=index&f=left&id=2', '0', '1', '');
INSERT INTO `c_menu` VALUES('3', '0', '内容管理', 'index.php?m=xdcms&c=index&f=left&id=3', '0', '1', '');
INSERT INTO `c_menu` VALUES('4', '0', '模块管理', 'index.php?m=xdcms&c=index&f=left&id=4', '0', '1', '');
INSERT INTO `c_menu` VALUES('5', '0', '模板管理', 'index.php?m=xdcms&c=index&f=left&id=5', '0', '1', '');
INSERT INTO `c_menu` VALUES('6', '0', '文件管理', 'index.php?m=xdcms&c=index&f=left&id=6', '0', '1', '');
INSERT INTO `c_menu` VALUES('7', '1', '常用操作', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('8', '7', '后台首页', 'index.php?m=xdcms&c=index&f=main', '0', '1', '');
INSERT INTO `c_menu` VALUES('9', '7', '更新首页', 'index.php?m=xdcms&c=creathtml&f=update_index', '0', '1', '');
INSERT INTO `c_menu` VALUES('10', '7', '添加栏目', 'index.php?m=xdcms&c=category&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('11', '7', '管理栏目', 'index.php?m=xdcms&c=category', '0', '1', '');
INSERT INTO `c_menu` VALUES('12', '7', '内容模型管理', 'index.php?m=xdcms&c=model', '0', '1', '');
INSERT INTO `c_menu` VALUES('13', '7', '更新全站缓存', 'index.php?m=xdcms&c=update_cache', '0', '1', '');
INSERT INTO `c_menu` VALUES('14', '1', '个人信息', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('15', '14', '修改密码', 'index.php?m=xdcms&c=index&f=edit', '0', '1', '');
INSERT INTO `c_menu` VALUES('16', '2', '栏目管理', '###', '2', '1', '');
INSERT INTO `c_menu` VALUES('17', '2', '模型管理', '###', '3', '1', '');
INSERT INTO `c_menu` VALUES('18', '2', '管理员设置', '###', '4', '1', '');
INSERT INTO `c_menu` VALUES('19', '2', '数据库管理', '###', '5', '1', '');
INSERT INTO `c_menu` VALUES('20', '2', '关键词链接', '###', '6', '1', '');
INSERT INTO `c_menu` VALUES('21', '2', '网站配置', '###', '1', '1', '');
INSERT INTO `c_menu` VALUES('22', '2', '后台菜单管理', '###', '7', '1', '');
INSERT INTO `c_menu` VALUES('23', '16', '添加栏目', 'index.php?m=xdcms&c=category&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('24', '16', '管理栏目', 'index.php?m=xdcms&c=category', '0', '1', '');
INSERT INTO `c_menu` VALUES('25', '17', '添加模型', 'index.php?m=xdcms&c=model&f=model_add', '0', '1', '');
INSERT INTO `c_menu` VALUES('26', '17', '管理模型', 'index.php?m=xdcms&c=model', '0', '1', '');
INSERT INTO `c_menu` VALUES('27', '18', '添加管理员', 'index.php?m=xdcms&c=admin&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('28', '18', '管理员列表', 'index.php?m=xdcms&c=admin', '0', '1', '');
INSERT INTO `c_menu` VALUES('29', '19', '数据库备份', 'index.php?m=xdcms&c=data', '0', '1', '');
INSERT INTO `c_menu` VALUES('30', '19', '数据库恢复', 'index.php?m=xdcms&c=data&f=data_file', '0', '1', '');
INSERT INTO `c_menu` VALUES('31', '20', '添加关键词', 'index.php?m=xdcms&c=keywords&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('32', '20', '管理关键词', 'index.php?m=xdcms&c=keywords', '0', '1', '');
INSERT INTO `c_menu` VALUES('33', '21', '基本信息', 'index.php?m=xdcms&c=setting', '0', '1', '');
INSERT INTO `c_menu` VALUES('34', '21', '联系方式', 'index.php?m=xdcms&c=setting&f=contact', '0', '1', '');
INSERT INTO `c_menu` VALUES('35', '21', '邮件设置', 'index.php?m=xdcms&c=setting&f=email', '0', '1', '');
INSERT INTO `c_menu` VALUES('36', '22', '添加菜单', 'index.php?m=xdcms&c=menu&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('37', '22', '管理菜单', 'index.php?m=xdcms&c=menu', '0', '1', '');
INSERT INTO `c_menu` VALUES('38', '4', '碎片管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('39', '38', '添加碎片', 'index.php?m=xdcms&c=block&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('40', '38', '管理碎片', 'index.php?m=xdcms&c=block', '0', '1', '');
INSERT INTO `c_menu` VALUES('41', '4', '幻灯片管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('42', '4', '客服QQ管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('43', '4', '友情链接管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('44', '4', '会员管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('45', '41', '添加幻灯', 'index.php?m=flash&c=admin&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('46', '41', '管理幻灯', 'index.php?m=flash&c=admin', '0', '1', '');
INSERT INTO `c_menu` VALUES('47', '42', '添加客服', 'index.php?m=qq&c=admin&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('48', '42', '管理客服', 'index.php?m=qq&c=admin', '0', '1', '');
INSERT INTO `c_menu` VALUES('49', '43', '添加链接', 'index.php?m=link&c=admin&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('50', '43', '管理链接', 'index.php?m=link&c=admin', '0', '1', '');
INSERT INTO `c_menu` VALUES('51', '44', '会员列表', 'index.php?m=member&c=admin', '0', '1', '');
INSERT INTO `c_menu` VALUES('52', '44', '模型配置', 'index.php?m=member&c=admin&f=field', '0', '1', '');
INSERT INTO `c_menu` VALUES('53', '44', '会员组管理', 'index.php?m=member&c=group', '0', '1', '');
INSERT INTO `c_menu` VALUES('54', '5', '模板管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('55', '54', '模板列表', 'index.php?m=xdcms&c=template', '0', '1', '');
INSERT INTO `c_menu` VALUES('56', '5', '数据调用', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('57', '56', '调用说明', 'index.php?m=xdcms&c=template&f=calls', '0', '1', '');
INSERT INTO `c_menu` VALUES('58', '6', '生成html', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('59', '6', '更新URL', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('60', '58', '更新首页', 'index.php?m=xdcms&c=creathtml&f=update_index', '0', '1', '');
INSERT INTO `c_menu` VALUES('61', '58', '更新栏目页', 'index.php?m=xdcms&c=categorytree&f=category_tree', '0', '1', '');
INSERT INTO `c_menu` VALUES('62', '58', '更新内容页', 'index.php?m=xdcms&c=categorytree&f=show_tree', '0', '1', '');
INSERT INTO `c_menu` VALUES('63', '59', '更新URL', 'index.php?m=xdcms&c=categorytree', '0', '1', '');
INSERT INTO `c_menu` VALUES('64', '4', '自定义表单管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('65', '64', '管理表单', 'index.php?m=form&c=admin', '0', '1', '');
INSERT INTO `c_menu` VALUES('66', '4', '模块管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('67', '66', '模块列表', 'index.php?m=xdcms&c=module', '0', '1', '');
INSERT INTO `c_menu` VALUES('68', '18', '管理员组管理', 'index.php?m=xdcms&c=admin&f=admin_group', '0', '1', '');
INSERT INTO `c_menu` VALUES('69', '18', '添加管理员组', 'index.php?m=xdcms&c=admin&f=admin_group_add', '0', '1', '');
INSERT INTO `c_menu` VALUES('70', '21', '上传设置', 'index.php?m=xdcms&c=setting&f=upload', '0', '1', '');
INSERT INTO `c_menu` VALUES('71', '2', '版本管理', '###', '1', '1', '');
INSERT INTO `c_menu` VALUES('72', '71', '版本列表', 'index.php?m=xdcms&c=language', '2', '1', '');
INSERT INTO `c_menu` VALUES('73', '71', '添加版本', 'index.php?m=xdcms&c=language&f=add', '1', '1', '');
INSERT INTO `c_menu` VALUES('74', '6', 'URL规则管理', '###', '0', '1', '');
INSERT INTO `c_menu` VALUES('75', '74', '添加规则', 'index.php?m=xdcms&c=urlrule&f=add', '0', '1', '');
INSERT INTO `c_menu` VALUES('76', '74', '规则管理', 'index.php?m=xdcms&c=urlrule', '0', '1', '');

INSERT INTO `c_link` VALUES ('1', '1', '全部', 'http://www.baidu.com', '0', '1496474485');
INSERT INTO `c_link_type` VALUES ('1', '全部', '0', '1496474417');

INSERT INTO `c_model` (`id`, `model_name`, `model_table`, `is_lock`, `is_fixed`) VALUES
(1, '单页模型', 'single', 1, 1),
(2, '新闻模型', 'news', 1, 0),
(3, '产品模型', 'product', 1, 0),
(4, '招聘模型', 'job', 1, 0),
(5, '下载模型', 'download', 1, 0);

INSERT INTO `c_model_field` (`fieldid`, `modelid`, `field`, `name`, `formtype`, `width`, `height`, `initial`, `explain`, `sort`, `is_fixed`) VALUES
(1, 1, 'content', '详细内容', 'editor', 0, 0, '', '', 0, 1),
(2, 2, 'content', '详细内容', 'editor', 0, 0, '', '', 0, 0),
(4, 3, 'content', '详细说明', 'editor', 0, 0, '', '', 2, 0),
(5, 4, 'type', '招聘类别', 'option', 0, 0, '全职,兼职', '', 0, 0),
(6, 4, 'experience', '经验要求', 'option', 0, 0, '不限,毕业生,1年,2年,3年,5年', '或以上', 0, 0),
(7, 4, 'degree', '学历要求', 'option', 0, 0, '不限,初中,高中,职校,中专,大专,本科,硕士,博士', '或以上', 0, 0),
(8, 4, 'sex', '性别要求', 'option', 0, 0, '不限,男性,女性', '', 0, 0),
(9, 4, 'numbers', '招聘人数', 'text', 8, 0, '', '人', 0, 0),
(10, 4, 'wage', '月薪待遇', 'text', 15, 0, '', '', 0, 0),
(11, 4, 'content', '职位描述', 'editor', 0, 0, '', '', 0, 0),
(14, 5, 'files', '上传文件', 'files', 0, 0, '', '', 0, 0),
(15, 5, 'content', '详细说明', 'editor', 0, 0, '', '', 0, 0),
(16, 3, 'moreimage', '多图上传', 'moreimage', 0, 0, '', '', 1, 0);

INSERT INTO `c_member_field` (`fieldid`, `field`, `name`, `formtype`, `width`, `height`, `initial`, `explain`, `sort`, `is_fixed`, `is_register`) VALUES
(3, 'truename', '姓名', 'text', 12, 0, '', '', 1, 0, 1),
(2, 'sex', '性别', 'radio', 0, 0, '男,女,保密', '', 2, 0, 0),
(4, 'phone', '联系电话', 'text', 15, 0, '', '', 3, 0, 0),
(5, 'address', '联系地址', 'text', 40, 0, '', '', 5, 0, 0),
(6, 'email', '安全邮箱', 'text', 30, 0, '', '', 4, 1, 1);

INSERT INTO `c_member_group` (`groupid`, `name`) VALUES
(1, '普通会员');

INSERT INTO `c_urlrule` (`id`, `class`, `ishtml`, `urldemo`, `url`, `is_fixed`) VALUES
(1, 'list', 0, 'index.php?m=content&c=index&f=lists&catid=1&l=1&page=1', 'index.php?m=content&c=index&f=lists&catid=[catid]&l=[languageid]&page=[page]', 1),
(2, 'show', 0, 'index.php?m=content&c=index&f=show&catid=1&l=1&id=1', 'index.php?m=content&c=index&f=show&catid=[catid]&l=[languageid]&id=[id]', 1),
(3, 'list', 1, 'it/news/1.html', '[languagedir][categorydir]/[catdir]/[page].html', 1),
(4, 'show', 1, 'cn/2012/1212/1.html', '[languagedir][year]/[month][day]/[id].html', 1),
(5, 'list', 0, 'list/1/1/1.html', 'list/[languageid]/[catid]/[page].html', 1),
(6, 'show', 0, 'show_1_1_1.html', 'show_[languageid]_[catid]_[id].html', 1);