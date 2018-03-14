-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: xz
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `xz_active`
--

DROP TABLE IF EXISTS `xz_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '活动名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `type` smallint(1) DEFAULT NULL COMMENT '活动类型',
  `num` int(5) DEFAULT NULL COMMENT '次数限制',
  `numtype` smallint(1) DEFAULT NULL COMMENT '1每天都有的次数，2仅有的次数',
  `bgimg` text COMMENT '活动背景图片',
  `publicid` int(10) DEFAULT NULL,
  `rule` text COMMENT '活动规则',
  `profile` text COMMENT '活动简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_active`
--

LOCK TABLES `xz_active` WRITE;
/*!40000 ALTER TABLE `xz_active` DISABLE KEYS */;
INSERT INTO `xz_active` VALUES (2,'港龙微美人幸运大转盘','2017-07-27 16:47:00','2017-09-30 23:59:00',1,3,1,'admin/20170731/597ea2f7e1a1a.jpg',1,'<p style=\"white-space: normal;\">关注方可抽奖</p><p style=\"white-space: normal;\">每天有3次抽奖机会</p><p><br/></p>','<p>大转盘抽奖</p>');
/*!40000 ALTER TABLE `xz_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_ad`
--

DROP TABLE IF EXISTS `xz_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_ad`
--

LOCK TABLES `xz_ad` WRITE;
/*!40000 ALTER TABLE `xz_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_article`
--

DROP TABLE IF EXISTS `xz_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `hospitalid` int(10) DEFAULT NULL COMMENT '所属医院',
  `articletype` varchar(10) DEFAULT NULL COMMENT '文章类型',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`) USING BTREE,
  KEY `post_parent` (`post_parent`) USING BTREE,
  KEY `post_author` (`post_author`) USING BTREE,
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_article`
--

LOCK TABLES `xz_article` WRITE;
/*!40000 ALTER TABLE `xz_article` DISABLE KEYS */;
INSERT INTO `xz_article` VALUES (1,1,'测试关键字',1,'1,3,1','2017-08-25 11:04:54','<p>测试内容</p>','测试标题','测试摘要',1,1,'2017-08-25 11:04:59',NULL,0,1,'',0,'admin/20170821/599a53d7bf680.png',0,0,0,0);
/*!40000 ALTER TABLE `xz_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_article1`
--

DROP TABLE IF EXISTS `xz_article1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_article1` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `hospitalid` int(10) DEFAULT NULL COMMENT '所属医院',
  `articletype` varchar(10) DEFAULT NULL COMMENT '文章类型',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`) USING BTREE,
  KEY `post_parent` (`post_parent`) USING BTREE,
  KEY `post_author` (`post_author`) USING BTREE,
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_article1`
--

LOCK TABLES `xz_article1` WRITE;
/*!40000 ALTER TABLE `xz_article1` DISABLE KEYS */;
INSERT INTO `xz_article1` VALUES (1,1,'测试关键字',1,'1,3,1','2017-08-25 11:06:31','<p>测试内容</p>','测试标题','测试摘要',1,1,'2017-08-25 11:06:35',NULL,0,1,'',0,'admin/20170821/599a53d7bf680.png',0,0,0,0);
/*!40000 ALTER TABLE `xz_article1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_asset`
--

DROP TABLE IF EXISTS `xz_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_asset`
--

LOCK TABLES `xz_asset` WRITE;
/*!40000 ALTER TABLE `xz_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_auth_access`
--

DROP TABLE IF EXISTS `xz_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_auth_access`
--

LOCK TABLES `xz_auth_access` WRITE;
/*!40000 ALTER TABLE `xz_auth_access` DISABLE KEYS */;
INSERT INTO `xz_auth_access` VALUES (3,'admin/health/post','admin_url'),(3,'admin/health/edit','admin_url'),(3,'admin/health/default','admin_url'),(3,'admin/health/index','admin_url'),(3,'admin/health/add','admin_url'),(3,'admin/hospital/dise','admin_url'),(3,'admin/hospital/disedelete','admin_url'),(3,'admin/hospital/disepost','admin_url'),(3,'admin/hospital/diseedit','admin_url'),(3,'admin/hospital/diseadd','admin_url'),(3,'admin/hospital/diseases','admin_url'),(3,'admin/hospital/dpm','admin_url'),(3,'admin/hospital/dpmdelete','admin_url'),(3,'admin/hospital/dpmpost','admin_url'),(3,'admin/hospital/dpmedit','admin_url'),(3,'admin/hospital/dpmadd','admin_url'),(3,'admin/hospital/department','admin_url'),(3,'admin/hospital/delete','admin_url'),(2,'admin/active/delete','admin_url'),(2,'admin/active/post','admin_url'),(2,'admin/active/edit','admin_url'),(2,'admin/active/add','admin_url'),(2,'admin/active/index','admin_url'),(2,'admin/active/zjmd','admin_url'),(2,'admin/active/jpdelete','admin_url'),(2,'admin/active/jppost','admin_url'),(2,'admin/active/jpedit','admin_url'),(2,'admin/active/jpadd','admin_url'),(2,'admin/active/jp','admin_url'),(2,'admin/active/default','admin_url'),(2,'admin/wxvip/vipcenter','admin_url'),(2,'admin/wxvip/delete','admin_url'),(2,'admin/wxvip/post','admin_url'),(2,'admin/wxvip/edit','admin_url'),(2,'admin/wxvip/add','admin_url'),(2,'admin/wxvip/index','admin_url'),(2,'admin/wxvip/default','admin_url'),(2,'admin/wechat/messagedelete','admin_url'),(2,'admin/wechat/wxmessagepost','admin_url'),(2,'admin/wechat/messagedit','admin_url'),(2,'admin/wechat/hfmessage','admin_url'),(2,'admin/wechat/messageadd','admin_url'),(2,'admin/wechat/fensi','admin_url'),(2,'admin/wechat/wxmenudelete','admin_url'),(2,'admin/wechat/wxmenupost','admin_url'),(2,'admin/wechat/wxmenuedit','admin_url'),(2,'admin/wechat/wxmenuadd','admin_url'),(2,'admin/wechat/wxmenu','admin_url'),(2,'admin/wechat/delete','admin_url'),(2,'admin/wechat/post','admin_url'),(2,'admin/wechat/edit','admin_url'),(2,'admin/wechat/add','admin_url'),(2,'admin/wechat/index','admin_url'),(2,'admin/wechat/default','admin_url'),(3,'admin/hospital/post','admin_url'),(3,'admin/hospital/edit','admin_url'),(3,'admin/hospital/add','admin_url'),(3,'admin/hospital/index','admin_url'),(3,'admin/hospital/default','admin_url'),(3,'admin/hospital/disname','admin_url'),(3,'admin/content/delete','admin_url'),(3,'admin/content/edit','admin_url'),(3,'admin/content/post','admin_url'),(3,'admin/content/add','admin_url'),(3,'admin/content/article','admin_url'),(3,'admin/content/default','admin_url'),(3,'admin/slidecat/add_post','admin_url'),(3,'admin/slidecat/add','admin_url'),(3,'admin/slidecat/edit_post','admin_url'),(3,'admin/slidecat/edit','admin_url'),(3,'admin/slidecat/delete','admin_url'),(3,'admin/slidecat/index','admin_url'),(3,'admin/slide/cancelban','admin_url'),(3,'admin/slide/ban','admin_url'),(3,'admin/slide/add_post','admin_url'),(3,'admin/slide/add','admin_url'),(3,'admin/slide/edit_post','admin_url'),(3,'admin/slide/edit','admin_url'),(3,'admin/slide/delete','admin_url'),(3,'admin/slide/toggle','admin_url'),(3,'admin/slide/listorders','admin_url'),(3,'admin/slide/index','admin_url'),(3,'admin/slide/default','admin_url'),(3,'admin/extension/default','admin_url'),(3,'admin/health/delete','admin_url'),(3,'admin/health/health','admin_url'),(3,'admin/health/tmadd','admin_url'),(3,'admin/health/tmedit','admin_url'),(3,'admin/health/tmpost','admin_url'),(3,'admin/health/tmdelete','admin_url'),(4,'admin/domain/default','admin_url'),(4,'admin/domain/ipindex','admin_url'),(4,'admin/domain/domainindex','admin_url'),(5,'admin/yuyue/index','admin_url'),(5,'admin/yuyue/iscl','admin_url'),(5,'admin/dteam/del','admin_url'),(5,'admin/dteam/post','admin_url'),(5,'admin/dteam/add','admin_url'),(5,'admin/dteam/edit','admin_url'),(5,'admin/dteam/index','admin_url'),(5,'admin/hospital/dpm','admin_url'),(5,'admin/hospital/dpmdelete','admin_url'),(5,'admin/hospital/dpmpost','admin_url'),(5,'admin/hospital/dpmedit','admin_url'),(5,'admin/hospital/dpmadd','admin_url'),(5,'admin/hospital/department','admin_url'),(5,'admin/hospital/delete','admin_url'),(5,'admin/hospital/post','admin_url'),(5,'admin/hospital/edit','admin_url'),(5,'admin/hospital/add','admin_url'),(5,'admin/hospital/index','admin_url'),(5,'admin/hospital/default','admin_url'),(5,'admin/plastic/index','admin_url'),(5,'admin/plastic/add','admin_url'),(5,'admin/plastic/edit','admin_url'),(5,'admin/plastic/post','admin_url'),(5,'admin/plastic/del','admin_url');
/*!40000 ALTER TABLE `xz_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_auth_rule`
--

DROP TABLE IF EXISTS `xz_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COMMENT='权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_auth_rule`
--

LOCK TABLES `xz_auth_rule` WRITE;
/*!40000 ALTER TABLE `xz_auth_rule` DISABLE KEYS */;
INSERT INTO `xz_auth_rule` VALUES (1,'Admin','admin_url','admin/content_bak/default',NULL,'内容管理',1,''),(2,'Api','admin_url','api/guestbookadmin/index',NULL,'所有留言',1,''),(3,'Api','admin_url','api/guestbookadmin/delete',NULL,'删除网站留言',1,''),(4,'Comment','admin_url','comment/commentadmin/index',NULL,'评论管理',1,''),(5,'Comment','admin_url','comment/commentadmin/delete',NULL,'删除评论',1,''),(6,'Comment','admin_url','comment/commentadmin/check',NULL,'评论审核',1,''),(7,'Portal','admin_url','portal/adminpost/index',NULL,'文章管理',1,''),(8,'Portal','admin_url','portal/adminpost/listorders',NULL,'文章排序',1,''),(9,'Portal','admin_url','portal/adminpost/top',NULL,'文章置顶',1,''),(10,'Portal','admin_url','portal/adminpost/recommend',NULL,'文章推荐',1,''),(11,'Portal','admin_url','portal/adminpost/move',NULL,'批量移动',1,''),(12,'Portal','admin_url','portal/adminpost/check',NULL,'文章审核',1,''),(13,'Portal','admin_url','portal/adminpost/delete',NULL,'删除文章',1,''),(14,'Portal','admin_url','portal/adminpost/edit',NULL,'编辑文章',1,''),(15,'Portal','admin_url','portal/adminpost/edit_post',NULL,'提交编辑',1,''),(16,'Portal','admin_url','portal/adminpost/add',NULL,'添加文章',1,''),(17,'Portal','admin_url','portal/adminpost/add_post',NULL,'提交添加',1,''),(18,'Portal','admin_url','portal/adminterm/index',NULL,'分类管理',1,''),(19,'Portal','admin_url','portal/adminterm/listorders',NULL,'文章分类排序',1,''),(20,'Portal','admin_url','portal/adminterm/delete',NULL,'删除分类',1,''),(21,'Portal','admin_url','portal/adminterm/edit',NULL,'编辑分类',1,''),(22,'Portal','admin_url','portal/adminterm/edit_post',NULL,'提交编辑',1,''),(23,'Portal','admin_url','portal/adminterm/add',NULL,'添加分类',1,''),(24,'Portal','admin_url','portal/adminterm/add_post',NULL,'提交添加',1,''),(25,'Portal','admin_url','portal/adminpage/index',NULL,'页面管理',1,''),(26,'Portal','admin_url','portal/adminpage/listorders',NULL,'页面排序',1,''),(27,'Portal','admin_url','portal/adminpage/delete',NULL,'删除页面',1,''),(28,'Portal','admin_url','portal/adminpage/edit',NULL,'编辑页面',1,''),(29,'Portal','admin_url','portal/adminpage/edit_post',NULL,'提交编辑',1,''),(30,'Portal','admin_url','portal/adminpage/add',NULL,'添加页面',1,''),(31,'Portal','admin_url','portal/adminpage/add_post',NULL,'提交添加',1,''),(32,'Admin','admin_url','admin/recycle/default',NULL,'回收站',1,''),(33,'Portal','admin_url','portal/adminpost/recyclebin',NULL,'文章回收',1,''),(34,'Portal','admin_url','portal/adminpost/restore',NULL,'文章还原',1,''),(35,'Portal','admin_url','portal/adminpost/clean',NULL,'彻底删除',1,''),(36,'Portal','admin_url','portal/adminpage/recyclebin',NULL,'页面回收',1,''),(37,'Portal','admin_url','portal/adminpage/clean',NULL,'彻底删除',1,''),(38,'Portal','admin_url','portal/adminpage/restore',NULL,'页面还原',1,''),(39,'Admin','admin_url','admin/extension/default',NULL,'扩展工具',1,''),(40,'Admin','admin_url','admin/backup/default',NULL,'备份管理',1,''),(41,'Admin','admin_url','admin/backup/restore',NULL,'数据还原',1,''),(42,'Admin','admin_url','admin/backup/index',NULL,'数据备份',1,''),(43,'Admin','admin_url','admin/backup/index_post',NULL,'提交数据备份',1,''),(44,'Admin','admin_url','admin/backup/download',NULL,'下载备份',1,''),(45,'Admin','admin_url','admin/backup/del_backup',NULL,'删除备份',1,''),(46,'Admin','admin_url','admin/backup/import',NULL,'数据备份导入',1,''),(47,'Admin','admin_url','admin/plugin/index',NULL,'插件管理',1,''),(48,'Admin','admin_url','admin/plugin/toggle',NULL,'插件启用切换',1,''),(49,'Admin','admin_url','admin/plugin/setting',NULL,'插件设置',1,''),(50,'Admin','admin_url','admin/plugin/setting_post',NULL,'插件设置提交',1,''),(51,'Admin','admin_url','admin/plugin/install',NULL,'插件安装',1,''),(52,'Admin','admin_url','admin/plugin/uninstall',NULL,'插件卸载',1,''),(53,'Admin','admin_url','admin/slide/default',NULL,'幻灯片',1,''),(54,'Admin','admin_url','admin/slide/index',NULL,'幻灯片管理',1,''),(55,'Admin','admin_url','admin/slide/listorders',NULL,'幻灯片排序',1,''),(56,'Admin','admin_url','admin/slide/toggle',NULL,'幻灯片显示切换',1,''),(57,'Admin','admin_url','admin/slide/delete',NULL,'删除幻灯片',1,''),(58,'Admin','admin_url','admin/slide/edit',NULL,'编辑幻灯片',1,''),(59,'Admin','admin_url','admin/slide/edit_post',NULL,'提交编辑',1,''),(60,'Admin','admin_url','admin/slide/add',NULL,'添加幻灯片',1,''),(61,'Admin','admin_url','admin/slide/add_post',NULL,'提交添加',1,''),(62,'Admin','admin_url','admin/slidecat/index',NULL,'幻灯片分类',1,''),(63,'Admin','admin_url','admin/slidecat/delete',NULL,'删除分类',1,''),(64,'Admin','admin_url','admin/slidecat/edit',NULL,'编辑分类',1,''),(65,'Admin','admin_url','admin/slidecat/edit_post',NULL,'提交编辑',1,''),(66,'Admin','admin_url','admin/slidecat/add',NULL,'添加分类',1,''),(67,'Admin','admin_url','admin/slidecat/add_post',NULL,'提交添加',1,''),(68,'Admin','admin_url','admin/ad/index',NULL,'网站广告',1,''),(69,'Admin','admin_url','admin/ad/toggle',NULL,'广告显示切换',1,''),(70,'Admin','admin_url','admin/ad/delete',NULL,'删除广告',1,''),(71,'Admin','admin_url','admin/ad/edit',NULL,'编辑广告',1,''),(72,'Admin','admin_url','admin/ad/edit_post',NULL,'提交编辑',1,''),(73,'Admin','admin_url','admin/ad/add',NULL,'添加广告',1,''),(74,'Admin','admin_url','admin/ad/add_post',NULL,'提交添加',1,''),(75,'Admin','admin_url','admin/link/index',NULL,'友情链接',1,''),(76,'Admin','admin_url','admin/link/listorders',NULL,'友情链接排序',1,''),(77,'Admin','admin_url','admin/link/toggle',NULL,'友链显示切换',1,''),(78,'Admin','admin_url','admin/link/delete',NULL,'删除友情链接',1,''),(79,'Admin','admin_url','admin/link/edit',NULL,'编辑友情链接',1,''),(80,'Admin','admin_url','admin/link/edit_post',NULL,'提交编辑',1,''),(81,'Admin','admin_url','admin/link/add',NULL,'添加友情链接',1,''),(82,'Admin','admin_url','admin/link/add_post',NULL,'提交添加',1,''),(83,'Api','admin_url','api/oauthadmin/setting',NULL,'第三方登陆',1,''),(84,'Api','admin_url','api/oauthadmin/setting_post',NULL,'提交设置',1,''),(85,'Admin','admin_url','admin/menu/default',NULL,'菜单管理',1,''),(86,'Admin','admin_url','admin/navcat/default1',NULL,'前台菜单',1,''),(87,'Admin','admin_url','admin/nav/index',NULL,'菜单管理',1,''),(88,'Admin','admin_url','admin/nav/listorders',NULL,'前台导航排序',1,''),(89,'Admin','admin_url','admin/nav/delete',NULL,'删除菜单',1,''),(90,'Admin','admin_url','admin/nav/edit',NULL,'编辑菜单',1,''),(91,'Admin','admin_url','admin/nav/edit_post',NULL,'提交编辑',1,''),(92,'Admin','admin_url','admin/nav/add',NULL,'添加菜单',1,''),(93,'Admin','admin_url','admin/nav/add_post',NULL,'提交添加',1,''),(94,'Admin','admin_url','admin/navcat/index',NULL,'菜单分类',1,''),(95,'Admin','admin_url','admin/navcat/delete',NULL,'删除分类',1,''),(96,'Admin','admin_url','admin/navcat/edit',NULL,'编辑分类',1,''),(97,'Admin','admin_url','admin/navcat/edit_post',NULL,'提交编辑',1,''),(98,'Admin','admin_url','admin/navcat/add',NULL,'添加分类',1,''),(99,'Admin','admin_url','admin/navcat/add_post',NULL,'提交添加',1,''),(100,'Admin','admin_url','admin/menu/index',NULL,'后台菜单',1,''),(101,'Admin','admin_url','admin/menu/add',NULL,'添加菜单',1,''),(102,'Admin','admin_url','admin/menu/add_post',NULL,'提交添加',1,''),(103,'Admin','admin_url','admin/menu/listorders',NULL,'后台菜单排序',1,''),(104,'Admin','admin_url','admin/menu/export_menu',NULL,'菜单备份',1,''),(105,'Admin','admin_url','admin/menu/edit',NULL,'编辑菜单',1,''),(106,'Admin','admin_url','admin/menu/edit_post',NULL,'提交编辑',1,''),(107,'Admin','admin_url','admin/menu/delete',NULL,'删除菜单',1,''),(108,'Admin','admin_url','admin/menu/lists',NULL,'所有菜单',1,''),(109,'Admin','admin_url','admin/setting/default',NULL,'设置',1,''),(110,'Admin','admin_url','admin/setting/userdefault',NULL,'个人信息',1,''),(111,'Admin','admin_url','admin/user/userinfo',NULL,'修改信息',1,''),(112,'Admin','admin_url','admin/user/userinfo_post',NULL,'修改信息提交',1,''),(113,'Admin','admin_url','admin/setting/password',NULL,'修改密码',1,''),(114,'Admin','admin_url','admin/setting/password_post',NULL,'提交修改',1,''),(115,'Admin','admin_url','admin/setting/site',NULL,'网站信息',1,''),(116,'Admin','admin_url','admin/setting/site_post',NULL,'提交修改',1,''),(117,'Admin','admin_url','admin/route/index',NULL,'路由列表',1,''),(118,'Admin','admin_url','admin/route/add',NULL,'路由添加',1,''),(119,'Admin','admin_url','admin/route/add_post',NULL,'路由添加提交',1,''),(120,'Admin','admin_url','admin/route/edit',NULL,'路由编辑',1,''),(121,'Admin','admin_url','admin/route/edit_post',NULL,'路由编辑提交',1,''),(122,'Admin','admin_url','admin/route/delete',NULL,'路由删除',1,''),(123,'Admin','admin_url','admin/route/ban',NULL,'路由禁止',1,''),(124,'Admin','admin_url','admin/route/open',NULL,'路由启用',1,''),(125,'Admin','admin_url','admin/route/listorders',NULL,'路由排序',1,''),(126,'Admin','admin_url','admin/mailer/default',NULL,'邮箱配置',1,''),(127,'Admin','admin_url','admin/mailer/index',NULL,'SMTP配置',1,''),(128,'Admin','admin_url','admin/mailer/index_post',NULL,'提交配置',1,''),(129,'Admin','admin_url','admin/mailer/active',NULL,'注册邮件模板',1,''),(130,'Admin','admin_url','admin/mailer/active_post',NULL,'提交模板',1,''),(131,'Admin','admin_url','admin/setting/clearcache',NULL,'清除缓存',1,''),(132,'User','admin_url','user/indexadmin/default',NULL,'用户管理',1,''),(133,'User','admin_url','user/indexadmin/default1',NULL,'用户组',1,''),(134,'User','admin_url','user/indexadmin/index',NULL,'本站用户',1,''),(135,'User','admin_url','user/indexadmin/ban',NULL,'拉黑会员',1,''),(136,'User','admin_url','user/indexadmin/cancelban',NULL,'启用会员',1,''),(137,'User','admin_url','user/oauthadmin/index',NULL,'第三方用户',1,''),(138,'User','admin_url','user/oauthadmin/delete',NULL,'第三方用户解绑',1,''),(139,'User','admin_url','user/indexadmin/default3',NULL,'管理组',1,''),(140,'Admin','admin_url','admin/rbac/index',NULL,'角色管理',1,''),(141,'Admin','admin_url','admin/rbac/member',NULL,'成员管理',1,''),(142,'Admin','admin_url','admin/rbac/authorize',NULL,'权限设置',1,''),(143,'Admin','admin_url','admin/rbac/authorize_post',NULL,'提交设置',1,''),(144,'Admin','admin_url','admin/rbac/roleedit',NULL,'编辑角色',1,''),(145,'Admin','admin_url','admin/rbac/roleedit_post',NULL,'提交编辑',1,''),(146,'Admin','admin_url','admin/rbac/roledelete',NULL,'删除角色',1,''),(147,'Admin','admin_url','admin/rbac/roleadd',NULL,'添加角色',1,''),(148,'Admin','admin_url','admin/rbac/roleadd_post',NULL,'提交添加',1,''),(149,'Admin','admin_url','admin/user/index',NULL,'管理员',1,''),(150,'Admin','admin_url','admin/user/delete',NULL,'删除管理员',1,''),(151,'Admin','admin_url','admin/user/edit',NULL,'管理员编辑',1,''),(152,'Admin','admin_url','admin/user/edit_post',NULL,'编辑提交',1,''),(153,'Admin','admin_url','admin/user/add',NULL,'管理员添加',1,''),(154,'Admin','admin_url','admin/user/add_post',NULL,'添加提交',1,''),(155,'Admin','admin_url','admin/plugin/update',NULL,'插件更新',1,''),(156,'Admin','admin_url','admin/storage/index',NULL,'文件存储',1,''),(157,'Admin','admin_url','admin/storage/setting_post',NULL,'文件存储设置提交',1,''),(158,'Admin','admin_url','admin/slide/ban',NULL,'禁用幻灯片',1,''),(159,'Admin','admin_url','admin/slide/cancelban',NULL,'启用幻灯片',1,''),(160,'Admin','admin_url','admin/user/ban',NULL,'禁用管理员',1,''),(161,'Admin','admin_url','admin/user/cancelban',NULL,'启用管理员',1,''),(162,'Demo','admin_url','demo/adminindex/index',NULL,'',1,''),(163,'Demo','admin_url','demo/adminindex/last',NULL,'',1,''),(166,'Admin','admin_url','admin/mailer/test',NULL,'测试邮件',1,''),(167,'Admin','admin_url','admin/setting/upload',NULL,'上传设置',1,''),(168,'Admin','admin_url','admin/setting/upload_post',NULL,'上传设置提交',1,''),(169,'Portal','admin_url','portal/adminpost/copy',NULL,'文章批量复制',1,''),(170,'Admin','admin_url','admin/menu/backup_menu',NULL,'备份菜单',1,''),(171,'Admin','admin_url','admin/menu/export_menu_lang',NULL,'导出后台菜单多语言包',1,''),(172,'Admin','admin_url','admin/menu/restore_menu',NULL,'还原菜单',1,''),(173,'Admin','admin_url','admin/menu/getactions',NULL,'导入新菜单',1,''),(174,'Admin','admin_url','admin/wechat/default',NULL,'微信管理',1,''),(175,'Admin','admin_url','admin/wechat/index',NULL,'公众号管理',1,''),(176,'Admin','admin_url','admin/wechat/wxmenu',NULL,'菜单管理',1,''),(177,'Admin','admin_url','admin/wechat/fensi',NULL,'粉丝管理',1,''),(178,'Admin','admin_url','admin/wechat/add',NULL,'添加微信公众号',1,''),(179,'Admin','admin_url','admin/wechat/edit',NULL,'修改微信公众号',1,''),(180,'Admin','admin_url','admin/wechat/post',NULL,'提交',1,''),(181,'Admin','admin_url','admin/wechat/delete',NULL,'删除',1,''),(182,'Admin','admin_url','admin/wechat/wxmenuadd',NULL,'添加',1,''),(183,'Admin','admin_url','admin/wechat/wxmenuedit',NULL,'修改',1,''),(184,'Admin','admin_url','admin/wechat/wxmenupost',NULL,'提交',1,''),(185,'Admin','admin_url','admin/wechat/wxmenudelete',NULL,'删除',1,''),(186,'Admin','admin_url','admin/wechat/messageadd',NULL,'添加',1,''),(187,'Admin','admin_url','admin/wechat/messagedit',NULL,'修改',1,''),(188,'Admin','admin_url','admin/wechat/wxmessagepost',NULL,'提交',1,''),(189,'Admin','admin_url','admin/wechat/messagedelete',NULL,'删除',1,''),(190,'Admin','admin_url','admin/wxvip/default',NULL,'微信会员管理',1,''),(191,'Admin','admin_url','admin/wxvip/index',NULL,'会员卡管理',1,''),(192,'Admin','admin_url','admin/wxvip/vipcenter',NULL,'会员中心管理',1,''),(193,'Admin','admin_url','admin/wechat/hfmessage',NULL,'文本回复',1,''),(194,'Admin','admin_url','admin/active/default',NULL,'活动管理',1,''),(195,'Admin','admin_url','admin/active/index',NULL,'活动列表',1,''),(196,'Admin','admin_url','admin/active/jp',NULL,'奖品设置',1,''),(197,'Admin','admin_url','admin/active/zjmd',NULL,'中奖名单',1,''),(198,'Admin','admin_url','admin/active/add',NULL,'添加',1,''),(199,'Admin','admin_url','admin/active/edit',NULL,'修改',1,''),(200,'Admin','admin_url','admin/active/post',NULL,'提交',1,''),(201,'Admin','admin_url','admin/active/delete',NULL,'删除',1,''),(202,'Admin','admin_url','admin/active/jpadd',NULL,'添加',1,''),(203,'Admin','admin_url','admin/active/jpedit',NULL,'修改',1,''),(204,'Admin','admin_url','admin/active/jppost',NULL,'提交',1,''),(205,'Admin','admin_url','admin/active/jpdelete',NULL,'删除',1,''),(206,'Admin','admin_url','admin/content/default',NULL,'内容管理',1,''),(207,'Admin','admin_url','admin/content/article',NULL,'文章管理',1,''),(208,'Admin','admin_url','admin/content/add',NULL,'添加',1,''),(209,'Admin','admin_url','admin/content/edit',NULL,'修改',1,''),(210,'Admin','admin_url','admin/content/post',NULL,'提交',1,''),(211,'Admin','admin_url','admin/content/delete',NULL,'删除',1,''),(212,'Admin','admin_url','admin/hospital/default',NULL,'医院管理',1,''),(213,'Admin','admin_url','admin/hospital/index',NULL,'基本信息',1,''),(214,'Admin','admin_url','admin/hospital/add',NULL,'添加',1,''),(215,'Admin','admin_url','admin/hospital/edit',NULL,'修改',1,''),(216,'Admin','admin_url','admin/hospital/post',NULL,'提交',1,''),(217,'Admin','admin_url','admin/hospital/delete',NULL,'删除',1,''),(218,'Admin','admin_url','admin/hospital/department',NULL,'科室管理',1,''),(219,'Admin','admin_url','admin/hospital/dpmadd',NULL,'添加',1,''),(220,'Admin','admin_url','admin/hospital/dpmedit',NULL,'修改',1,''),(221,'Admin','admin_url','admin/hospital/dpmpost',NULL,'提交',1,''),(222,'Admin','admin_url','admin/hospital/dpmdelete',NULL,'删除',1,''),(223,'Admin','admin_url','admin/hospital/diseases',NULL,'病种管理',1,''),(224,'Admin','admin_url','admin/hospital/diseadd',NULL,'添加',1,''),(225,'Admin','admin_url','admin/hospital/diseedit',NULL,'修改',1,''),(226,'Admin','admin_url','admin/hospital/disepost',NULL,'提交',1,''),(227,'Admin','admin_url','admin/hospital/disedelete',NULL,'删除',1,''),(228,'Admin','admin_url','admin/health/default',NULL,'健康自测',1,''),(229,'Admin','admin_url','admin/health/index',NULL,'疾病种类',1,''),(230,'Admin','admin_url','admin/health/add',NULL,'添加',1,''),(231,'Admin','admin_url','admin/health/edit',NULL,'修改',1,''),(232,'Admin','admin_url','admin/health/post',NULL,'提交',1,''),(233,'Admin','admin_url','admin/health/delete',NULL,'删除',1,''),(234,'Admin','admin_url','admin/health/health',NULL,'自测题目',1,''),(235,'Admin','admin_url','admin/health/tmadd',NULL,'添加',1,''),(236,'Admin','admin_url','admin/health/tmedit',NULL,'修改',1,''),(237,'Admin','admin_url','admin/health/tmpost',NULL,'提交',1,''),(238,'Admin','admin_url','admin/health/tmdelete',NULL,'删除',1,''),(239,'Admin','admin_url','admin/hospital/dpm',NULL,'Ajax提交',1,''),(240,'Admin','admin_url','admin/hospital/dise',NULL,'Ajax提交',1,''),(241,'Admin','admin_url','admin/hospital/disname',NULL,'Ajax提交',1,''),(242,'Admin','admin_url','admin/domain/default',NULL,'域名管理',1,''),(243,'Admin','admin_url','admin/domain/ipindex',NULL,'IP管理',1,''),(244,'Admin','admin_url','admin/domain/ipadd',NULL,'添加',1,''),(245,'Admin','admin_url','admin/domain/ipedit',NULL,'修改',1,''),(246,'Admin','admin_url','admin/domain/ippost',NULL,'提交',1,''),(247,'Admin','admin_url','admin/domain/ipdel',NULL,'删除',1,''),(248,'Admin','admin_url','admin/domain/domainindex',NULL,'域名列表',1,''),(249,'Admin','admin_url','admin/domain/domainadd',NULL,'添加',1,''),(250,'Admin','admin_url','admin/domain/domainedit',NULL,'修改',1,''),(251,'Admin','admin_url','admin/domain/domainpost',NULL,'提交',1,''),(252,'Admin','admin_url','admin/domain/domaindel',NULL,'删除',1,''),(253,'Admin','admin_url','admin/yuyue/index',NULL,'预约挂号',1,''),(254,'Admin','admin_url','admin/dteam/index',NULL,'专家团队',1,''),(255,'Admin','admin_url','admin/plastic/index',NULL,'专题栏目管理',1,''),(256,'Admin','admin_url','admin/plastic/add',NULL,'添加',1,''),(257,'Admin','admin_url','admin/plastic/edit',NULL,'修改',1,''),(258,'Admin','admin_url','admin/plastic/post',NULL,'提交',1,''),(259,'Admin','admin_url','admin/plastic/del',NULL,'删除',1,''),(260,'Admin','admin_url','admin/dteam/add',NULL,'添加',1,''),(261,'Admin','admin_url','admin/dteam/edit',NULL,'修改',1,''),(262,'Admin','admin_url','admin/dteam/post',NULL,'提交',1,''),(263,'Admin','admin_url','admin/dteam/del',NULL,'删除',1,''),(264,'Admin','admin_url','admin/yuyue/iscl',NULL,'处理',1,'');
/*!40000 ALTER TABLE `xz_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_cjtotal`
--

DROP TABLE IF EXISTS `xz_cjtotal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_cjtotal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT NULL,
  `hdid` int(10) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_cjtotal`
--

LOCK TABLES `xz_cjtotal` WRITE;
/*!40000 ALTER TABLE `xz_cjtotal` DISABLE KEYS */;
INSERT INTO `xz_cjtotal` VALUES (17,NULL,2,'2017-07-28 17:40:24'),(18,NULL,2,'2017-07-29 08:24:48'),(19,NULL,2,'2017-07-29 08:24:59'),(20,NULL,2,'2017-07-29 11:05:14'),(21,'o8t4Qt-G7ByFQybZ5rOCOYHkf0rE',2,'2017-07-31 10:43:26'),(22,'o8t4Qt-G7ByFQybZ5rOCOYHkf0rE',2,'2017-07-31 10:43:26');
/*!40000 ALTER TABLE `xz_cjtotal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_comments`
--

DROP TABLE IF EXISTS `xz_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`) USING BTREE,
  KEY `comment_approved_date_gmt` (`status`) USING BTREE,
  KEY `comment_parent` (`parentid`) USING BTREE,
  KEY `table_id_status` (`post_table`,`post_id`,`status`) USING BTREE,
  KEY `createtime` (`createtime`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_comments`
--

LOCK TABLES `xz_comments` WRITE;
/*!40000 ALTER TABLE `xz_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_common_action_log`
--

DROP TABLE IF EXISTS `xz_common_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`) USING BTREE,
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_common_action_log`
--

LOCK TABLES `xz_common_action_log` WRITE;
/*!40000 ALTER TABLE `xz_common_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_common_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_department`
--

DROP TABLE IF EXISTS `xz_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_department` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `ico` varchar(100) DEFAULT NULL COMMENT '科室图标',
  `name` varchar(10) DEFAULT NULL,
  `listorder` int(5) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `hospitalid` int(10) DEFAULT NULL,
  `profile` text COMMENT '科室简介',
  `profileimg` varchar(100) DEFAULT NULL COMMENT '简介图片',
  `ylts` text COMMENT '医疗特色',
  `yltsimg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_department`
--

LOCK TABLES `xz_department` WRITE;
/*!40000 ALTER TABLE `xz_department` DISABLE KEYS */;
INSERT INTO `xz_department` VALUES (1,NULL,'内科',NULL,NULL,0,1,NULL,NULL,NULL,NULL),(2,NULL,'呼吸内科',NULL,NULL,1,1,NULL,NULL,NULL,NULL),(3,'','消化内科',NULL,NULL,1,1,'测试','','',''),(4,NULL,'外科',NULL,NULL,0,1,NULL,NULL,NULL,NULL),(5,NULL,'普通外科',NULL,NULL,4,1,NULL,NULL,NULL,NULL),(6,'admin/20171108/5a026b25e432e.jpg','心血管内科',NULL,NULL,1,1,'科室介绍数据测试','admin/20171108/5a026b2dc08de.jpg','诊疗特色数据测试','');
/*!40000 ALTER TABLE `xz_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_department_copy`
--

DROP TABLE IF EXISTS `xz_department_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_department_copy` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `ico` varchar(100) DEFAULT NULL COMMENT '科室图标',
  `name` varchar(10) DEFAULT NULL,
  `listorder` int(5) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `hospitalid` int(10) DEFAULT NULL,
  `profile` text COMMENT '科室简介',
  `profileimg` varchar(100) DEFAULT NULL COMMENT '简介图片',
  `ylts` text COMMENT '医疗特色',
  `yltsimg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_department_copy`
--

LOCK TABLES `xz_department_copy` WRITE;
/*!40000 ALTER TABLE `xz_department_copy` DISABLE KEYS */;
INSERT INTO `xz_department_copy` VALUES (1,NULL,'内科',NULL,NULL,0,1,NULL,NULL,NULL,NULL),(2,'admin/20171109/5a03cca92576b.jpg','神经内科',NULL,NULL,1,1,'','','',''),(3,'admin/20171109/5a03cc0a594df.jpg','消化内科',NULL,NULL,1,1,'消化测试','','xxxxx',''),(4,NULL,'外科',NULL,NULL,0,1,NULL,NULL,NULL,NULL),(5,'admin/20171109/5a03ccf42aaf9.jpg','普通外科',NULL,NULL,4,1,'','','',''),(6,'admin/20171108/5a026b25e432e.jpg','心血管内科',NULL,NULL,1,1,'科室介绍数据测试','admin/20171108/5a026b2dc08de.jpg','诊疗特色数据测试',''),(7,'admin/20171109/5a03cdd277268.jpg','肾脏内科',NULL,NULL,1,1,'','','','');
/*!40000 ALTER TABLE `xz_department_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_diseases`
--

DROP TABLE IF EXISTS `xz_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_diseases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_diseases`
--

LOCK TABLES `xz_diseases` WRITE;
/*!40000 ALTER TABLE `xz_diseases` DISABLE KEYS */;
INSERT INTO `xz_diseases` VALUES (1,'消化不良',3);
/*!40000 ALTER TABLE `xz_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_diseasetype`
--

DROP TABLE IF EXISTS `xz_diseasetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_diseasetype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disease` varchar(50) DEFAULT NULL,
  `hospitalid` int(10) DEFAULT NULL,
  `a` int(3) DEFAULT NULL,
  `b` int(3) DEFAULT NULL,
  `c` int(3) DEFAULT NULL,
  `d` int(3) DEFAULT NULL,
  `e` int(3) DEFAULT NULL,
  `f` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_diseasetype`
--

LOCK TABLES `xz_diseasetype` WRITE;
/*!40000 ALTER TABLE `xz_diseasetype` DISABLE KEYS */;
INSERT INTO `xz_diseasetype` VALUES (1,'心里测试',1,1,2,3,4,0,0);
/*!40000 ALTER TABLE `xz_diseasetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_domain`
--

DROP TABLE IF EXISTS `xz_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipid` int(10) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `isspeed` smallint(1) DEFAULT NULL COMMENT '是否加速',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=962 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_domain`
--

LOCK TABLES `xz_domain` WRITE;
/*!40000 ALTER TABLE `xz_domain` DISABLE KEYS */;
INSERT INTO `xz_domain` VALUES (1,16,'3g.dysg.org',0,''),(2,16,'3g.wjba120.cn',1,''),(3,4,'4g.lcbdnk.com',0,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(4,50,'lcyy.lcbdyy.com',1,''),(5,50,'yy. lcbdyy.com',1,''),(6,50,'shouji.lcbdyy.com',1,''),(7,50,'gc.lcbdyy.com',1,''),(8,50,'wapby.lcbdyy.com',1,''),(9,2,'3gnk.lcbdyy.com',1,''),(10,2,'wapfk.lcbdyy.com',1,''),(11,2,'zxmr.lcbdyy.com',1,'zxmr.lcbdyy.com www.lcbd120.com'),(12,2,'byby.lcbdyy.com',1,''),(13,2,'bbs.lcbdyy.com',1,''),(14,2,'wapgc.lcbdyy.com',1,''),(15,2,'wapzx.lcbdyy.com',1,''),(16,68,'wappf.lcbdyy.com',1,''),(17,4,'wap.lcbdyy.com',1,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com    ///wap.lcbdyy.com此战已关闭'),(18,4,'4gzx.lcbdyy.com',1,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(19,2,'www.lcbdyy.com',1,''),(20,16,'nk.lcbdyy.com',1,''),(21,88,'zt.lcbdyy.com',1,''),(22,16,'www.wjba120.cn',1,''),(23,16,'wap.tcfkyy.cn',1,''),(24,16,'fk.tcfkyy.cn',1,''),(25,15,'www.tcfkyy.cn',1,''),(26,66,'www.njwhgb.com',0,''),(27,64,'m.njwhgb.com',0,'m.njwhgb.com ss.jswh120.com nj.jswhgb.com'),(28,66,'nj.njwhgb.com',0,'sgg.njwhgb.com nj.njwhgb.com'),(29,64,'jsnre.njwhgb.com',0,''),(30,16,'www.wjbayy.cn',1,''),(31,16,'www.tzdfzx.com',1,''),(32,16,'www.lcbdfk120.com',1,''),(33,16,'www.zjgwczx.com',1,'zjgwczxyy.com www.zjgwczxyy.com zjgwczx.com www.zjgwczx.com'),(34,16,'wap.zjgwczx.com',1,'wap.zjgwczxyy.com wap.zjgwczx.com'),(35,15,'4g.zjgwczx.com',1,''),(36,16,'wap.zjgwczxyy.com',1,'wap.zjgwczxyy.com wap.zjgwczx.com'),(37,16,'www.zjgwczxyy.com',1,'zjgwczxyy.com www.zjgwczxyy.com zjgwczx.com www.zjgwczx.com'),(38,58,'zx.zjgwczxyy.com',1,''),(39,16,'m.wcnke.com',1,''),(40,16,'nk.wcnke.com',1,''),(41,16,'wap.wcnke.com',1,''),(42,16,'www.wcnke.com',1,''),(43,69,'new.tzpfb.cn',1,'CDN加速'),(44,69,'www.tzpfb.cn',1,'CDN加速'),(45,63,'msg.tzpfb.cn',0,''),(46,28,'sg.tzpfb.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(47,63,'sgw.tzpfb.cn',0,''),(48,63,'sm.tzpfb.cn',0,'m.tzpfb.cn sm.tzpfb.cn'),(49,16,'wap.tzpfb.cn',0,''),(50,16,'m.tzpfb.cn',0,'m.tzpfb.cn sm.tzpfb.cn'),(51,16,'ai.tzpfb.cn',0,''),(52,63,'dywap.tzpfb.cn',0,''),(53,28,'dypf.tzpfb.cn',0,'www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(54,39,'wapfk.tchsyy.com',1,''),(55,4,'fuke.tchsyy.com',1,''),(56,15,'m.tchsyy.com',1,''),(57,15,'www.tchsyy.com',1,''),(58,16,'wap.tchsyy.com',1,''),(59,16,'3g.tchsyy.com',1,''),(60,16,'fk.tchsyy.com',1,''),(61,17,'sg.wjboai.com',1,''),(62,17,'nk.wjboai.com',1,''),(63,40,'m.wjboai.com',1,''),(64,15,'4g.wjboai.com',1,''),(65,16,'3g.wjboai.com',1,''),(66,16,'wap.wjboai.com',1,''),(67,77,'www.wjboai.com',1,''),(68,57,'mm.wjboai.com',1,''),(69,15,'a.wjboai.com',1,''),(70,16,'mgc.yxnkyy.cn',0,''),(71,69,'3g.yxnkyy.cn',1,'CDN加速'),(72,16,'wap.yxnkyy.cn',0,''),(73,69,'www.yxnkyy.cn',1,'CDN加速'),(74,5,'nk.yxnkyy.cn',0,''),(75,17,'4g.yxnkyy.cn',0,''),(76,70,'jc.yxnkyy.cn',0,''),(77,68,'baopi.yxnkyy.cn',0,''),(78,34,'gc.yxnkyy.cn',0,''),(79,29,'bp.yxnkyy.cn',0,''),(80,88,'m.yxnkyy.cn',0,'与m.yxbayy120.com共用'),(81,39,'m.szxieheyy.com',1,''),(82,88,'www.szxieheyy.com',1,''),(83,39,'3g.szxieheyy.com',1,''),(84,61,'xh.szxieheyy.com',1,''),(85,70,'a.szxieheyy.com',1,''),(86,70,'sz.szxieheyy.com',0,''),(87,88,'4g.szxieheyy.com',0,''),(88,88,'wap.szxieheyy.com',0,''),(89,88,'nk.szxieheyy.com',0,''),(90,88,'zc.szxieheyy.com',0,''),(91,88,'fk.szxieheyy.com',0,''),(92,88,'gc.szxieheyy.com',1,''),(93,21,'www.yzltyy.cn',1,'nk.yzlt120.com yzltyy.cn www.yzltyy.cn'),(94,60,'wap.yzltyy.cn',1,'wap.yzlt120.com wap.yzltyy.cn'),(95,70,'pp.yzltyy.cn',1,''),(96,49,'fk.yzltyy.cn',1,'已关闭'),(97,49,'m.yzltyy.cn',1,'已关闭'),(98,14,'m.0511woman.com',1,'m.dypfyy.com m.0511woman.com'),(99,88,'www.0511woman.com',1,''),(100,57,'ycyy.0523yy.com',0,''),(101,58,'wfnk.0523yy.com',0,''),(102,15,'tzgcyy.0523yy.com',0,''),(103,40,'bdf.0523yy.com',0,''),(104,16,'bak4.0523yy.com',0,''),(105,28,'bak3.0523yy.com',0,''),(106,47,'bak2.0523yy.com',0,''),(107,26,'bak1.0523yy.com',0,''),(108,26,'3g.0523yy.com',0,''),(109,26,'adminn.0523yy.com',0,''),(110,26,'ycyjs.0523yy.com',0,''),(111,26,'yc.0523yy.com',0,''),(112,69,'wap.0523yy.com',1,'CDN加速'),(113,26,'tzpfyy.0523yy.com',0,''),(114,26,'tzpf.0523yy.com',0,''),(115,69,'nk.0523yy.com',1,'CDN加速'),(116,26,'4g.0523yy.com',0,''),(117,26,'www.0523yy.com',0,''),(118,88,'m.0523yy.com',0,''),(119,15,'sgm.yxbayy120.com',0,''),(120,16,'sg.yxbayy120.com',0,''),(121,15,'4g.yxbayy120.com',0,''),(122,6,'gc.yxbayy120.com',0,''),(123,6,'wap.yxbayy120.com',0,''),(124,15,'www.yxbayy120.com',0,''),(125,16,'3g.yxbayy120.com',0,''),(126,16,'mgc.yxbayy120.com',1,''),(127,88,'m.yxbayy120.com',1,''),(128,5,'4g.cszhongshan.com',0,''),(129,51,'crm.cszhongshan.com',0,''),(130,5,'wap.cszhongshan.com',0,''),(131,4,'www.cszhongshan.com',0,''),(132,88,'m.cszhongshan.com',0,''),(133,17,'m.83359999.com',0,''),(134,69,'mnk.83359999.com',1,'CDN加速'),(135,16,'mgc.83359999.com',0,''),(136,6,'gc.83359999.com',0,'gc.83359999.com gc.changzheng120.com'),(137,88,'app.83359999.com',0,''),(138,6,'3gfk.83359999.com',0,''),(139,14,'fk.83359999.com',0,''),(140,69,'nk.83359999.com',1,'CDN加速'),(141,6,'4g.83359999.com',0,''),(142,15,'3g.83359999.com',0,''),(143,14,'www.83359999.com',0,''),(144,88,'wap.83359999.com',0,''),(145,17,'wap.dysg.org',1,''),(146,17,'zh.dysg.org',1,''),(147,88,'fk.dysg.org',0,''),(148,88,'www.dysg.org',0,'与dy.changzheng120.com共用'),(149,39,'pf.dysg.org',0,'站已关闭'),(150,40,'gk.dysg.org',0,''),(151,40,'guke.dysg.org',0,''),(152,63,'dpisj.dysg.org',0,''),(153,63,'nk.dysg.org',0,''),(154,58,'gksj.dysg.org',0,''),(155,58,'tsks.dysg.org',0,''),(156,88,'sggc.dysg.org',0,''),(157,88,'sgnk.dysg.org',0,''),(158,88,'sgzx.dysg.org',0,''),(159,88,'sgyz.dysg.org',0,''),(160,88,'sgrl.dysg.org',0,''),(161,88,'sgfk.dysg.org',0,''),(162,88,'sggj.dysg.org',0,''),(163,88,'sgby.dysg.org',0,''),(164,88,'m.dysg.org',0,''),(165,17,'msg.changzheng120.com',1,''),(166,17,'sg.changzheng120.com',1,''),(167,17,'4g.changzheng120.com',1,''),(168,5,'0511.changzheng120.com',1,''),(169,6,'gc.changzheng120.com',1,'gc.83359999.com gc.changzheng120.com'),(170,71,'fk.changzheng120.com',1,''),(171,14,'nk.changzheng120.com',1,'nk.changzheng120.com www.changzheng120.com changzheng120.com'),(172,15,'3g.changzheng120.com',1,''),(173,68,'wap.changzheng120.com',1,''),(174,14,'www.changzheng120.com',1,'nk.changzheng120.com www.changzheng120.com'),(175,88,'dyguke.changzheng120.com',1,''),(176,88,'dysgby.changzheng120.com',1,''),(177,88,'dysgfk.changzheng120.com',1,''),(178,88,'dysggc.changzheng120.com',1,''),(179,88,'dysgnk.changzheng120.com',1,''),(180,88,'dysgzx.changzheng120.com',1,''),(181,88,'dysgyz.changzheng120.com',1,''),(182,88,'dysgrl.changzheng120.com',1,''),(183,88,'dysggj.changzheng120.com',1,''),(184,88,'dygc.changzheng120.com',1,'与sggc.dysg.org共用'),(185,88,'dynk.changzheng120.com',1,''),(186,70,'pp.changzheng120.com',1,''),(187,88,'dyzx.changzheng120.com',1,''),(188,88,'dyyz.changzheng120.com',1,'与sgyz.dysg.org共用'),(189,88,'dyrl.changzheng120.com',1,'与sgrl.dysg.org共用'),(190,88,'dygj.changzheng120.com',1,'与sggj.dysg.org共用'),(191,88,'dyby.changzheng120.com',1,'与sgby.dysg.org共用'),(192,88,'m.changzheng120.com',1,''),(193,88,'dyfk.changzheng120.com',1,'与fk.dysgyy.net共用'),(194,88,'dy.changzheng120.com',1,''),(195,88,'dym.changzheng120.com',1,'与m.dysg.org共用'),(196,39,'pf.dysgyy.net',0,''),(197,39,'120.dysgyy.net',1,''),(198,68,'fk120.dysgyy.net',0,''),(199,63,'pfb.dysgyy.net',0,''),(200,63,'pm.dysgyy.net',0,''),(201,61,'wap.dysgyy.net',0,''),(202,61,'zx.dysgyy.net',0,''),(203,88,'www.dysgyy.net',0,''),(204,88,'fk.dysgyy.net',0,''),(205,17,'fk.tlhsyy.com',1,''),(206,17,'nanke.tlhsyy.com',1,''),(207,17,'c.tlhsyy.com',1,''),(208,17,'b.tlhsyy.com',1,''),(209,17,'a.tlhsyy.com',1,''),(210,39,'www.tlhsyy.com',1,''),(211,66,'wap.tznke.com',0,''),(212,88,'m.tznke.com',0,''),(213,46,'crm.tznke.com',0,''),(214,72,'yetc.tznke.com',0,''),(215,39,'tzgcyy.tznke.com',0,''),(216,26,'nk.tznke.com',0,''),(217,26,'3g.tznke.com',0,''),(218,26,'www.tznke.com',0,''),(219,26,'bak.tznke.com',0,''),(220,26,'nkbak.tznke.com',0,''),(221,88,'mbak.tznke.com',0,''),(222,43,'4gbak.tznke.com',0,''),(223,60,'pybak.tznke.com',0,''),(224,70,'pp.tznke.com',0,''),(225,44,'m.yzlt120.com',1,''),(226,28,'www.yzlt120.com',1,''),(227,57,'wap.yzlt120.com',1,'wap.yzlt120.com wap.yzltyy.cn'),(228,15,'nk.yzlt120.com',1,'nk.yzlt120.com yzltyy.cn www.yzltyy.cn'),(229,16,'4g.yzlt120.com',1,''),(230,16,'www.yzltnk.com',0,''),(231,88,'wap.yzltnk.com',0,''),(232,69,'nk.yzltnk.com',1,'nk.yzltnk.com kqnk.yzltnk.com  CDN加速'),(233,49,'m.yzltnk.com',0,'已关闭'),(234,6,'kqnk.yzltnk.com',0,'nk.yzltnk.com kqnk.yzltnk.com'),(235,16,'kq4g.yzltnk.com',0,'4g.yzltnk.com kq4g.yzltnk.com'),(236,49,'fk.yzltnk.com',0,'已关闭'),(237,72,'ffs.yzltnk.com',0,''),(238,44,'3g.yzltnk.com',0,''),(239,69,'4g.yzltnk.com',1,'4g.yzltnk.com kq4g.yzltnk.com  CDN加速'),(240,69,'wap.dypfzk.com',0,'wap.dypfyy.com wap.dypfzk.com'),(241,69,'www.dypfzk.com',0,'www.dypfyy.com dypfyy.com pc.dypfzk.com www.dypfzk.com dypfzk.com'),(242,69,'pc.dypfzk.com',0,'www.dypfyy.com dypfyy.com pc.dypfzk.com'),(243,64,'jsnre.jswh120.com',0,''),(244,64,'sgm.jswh120.com',0,''),(245,64,'ss.jswh120.com',0,'m.njwhgb.com ss.jswh120.com nj.jswhgb.com'),(246,66,'nk.jswh120.com',0,''),(247,66,'m.jswh120.com',0,''),(248,66,'www.jswh120.com',0,''),(249,64,'jsnre.jswhgb.com',0,''),(250,64,'360m.jswhgb.com',0,''),(251,64,'nj.jswhgb.com',0,'m.njwhgb.com ss.jswh120.com nj.jswhgb.com'),(252,66,'nk.jswhgb.com',0,''),(253,66,'m.jswhgb.com',0,''),(254,66,'www.jswhgb.com',0,''),(255,17,'sgpc.lygnjnk.cn',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(256,17,'39nk.lygnjnk.cn',0,'39nk.lygnjnk.cn 120ask.nj0518.com'),(257,17,'sgmo.lygnjnk.cn',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(258,17,'www.lygnjnk.cn',0,'www.lygnjnk.cn lygnjnk.cn www.nakeyy.cn nakeyy.cn'),(259,17,'m.lygnjnk.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(260,17,'sgpc.nakeyy.cn',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(261,17,'sgmo.nakeyy.cn',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(262,17,'www.nakeyy.cn',0,'www.lygnjnk.cn lygnjnk.cn www.nakeyy.cn nakeyy.cn'),(263,17,'m.nakeyy.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(264,62,'bdpc.lygnk.cn',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(265,62,'bdmo.lygnk.cn',0,''),(266,17,'www.lygnk.cn',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(267,17,'m.lygnk.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(268,17,'www.njnakeyy.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(269,17,'m.njnakeyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(270,17,'bdpc.njnankyy.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(271,69,'bdmo.njnankyy.com',0,''),(272,17,'www.njnankyy.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(273,17,'m.njnankyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(274,17,'mgc.lyjfyy.com',0,''),(275,17,'gc.lyjfyy.com',0,''),(276,17,'mnk.lyjfyy.com',0,'mnk.120lyjf.com mnk.lyjfyy.com'),(277,17,'mfk.lyjfyy.com',0,''),(278,17,'nk.lyjfyy.com',0,''),(279,17,'fuke.lyjfyy.com',0,''),(280,17,'m.lyjfyy.com',0,''),(281,17,'www.lyjfyy.com',0,''),(282,69,'wap.tzpfbzk.com',1,'CDN加速'),(283,69,'www.tzpfbzk.com',1,'CDN加速  '),(284,63,'www.gytjnk.cn',0,''),(285,63,'sg.tjnk120.cn',0,''),(286,27,'3g.tjnk120.cn',0,'3g.gytjyy120.com 3g.tjnk120.cn'),(287,63,'www.tjnk120.cn',0,'www.gytjyy120.com gytjyy120.com  www.tjnk120.cn tjnk120.cn'),(288,15,'4g.tj0514.com',0,''),(289,15,'m.tj0514.com',0,''),(290,15,'3g.tj0514.com',0,''),(291,64,'www.tj0514.com',0,'nk.gytjyy120.com www.tj0514.com tj0514.com'),(292,17,'360pc.0518njyy.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(293,17,'bdpc.0518njyy.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(294,17,'360mo.0518njyy.com',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(295,17,'m.0518njyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(296,17,'wap.0518njyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(297,17,'www.0518njyy.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(298,61,'www.dysgzxmr.com',0,''),(299,61,'m.dysgzxmr.com',0,''),(300,67,'m.0513hxyy.com',0,''),(301,67,'www.0513hxyy.com',0,''),(302,17,'www.qdhuaxiayy.com',0,''),(303,17,'www.qdhxyy.cn',0,''),(304,17,'4g.qdhxyy.cn',0,''),(305,17,'4rd.hnlj120.com',0,''),(306,64,'www.hnlj120.com',0,''),(307,64,'m.hnlj120.com',0,''),(308,64,'mgc.jyhwyy.com',0,''),(309,64,'fk.jyhwyy.com',0,''),(310,64,'nk.jyhwyy.com',0,''),(311,64,'wap.jyhwyy.com',0,''),(312,64,'www.jyhwyy.com',0,''),(313,64,'fk.jyhw120.com',0,''),(314,64,'nk.jyhw120.com',0,''),(315,64,'wap.jyhw120.com',0,''),(316,64,'www.jyhw120.com',0,''),(317,61,'3g.hmzx0511.com',0,'已关闭'),(318,61,'4g.hmzx0511.com',0,'4g.hm0511.com 4g.zjhmzxyy.com 4g.hmzx0511.com'),(319,61,'wap.hmzx0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(320,61,'www.hmzx0511.com',0,'www.hm0511.com hm0511.com www.zjhm0511.com zjhm0511.com hmzx0511.com www.hmzx0511.com 项目zjhmzxyy.com'),(321,61,'5g.zjhm0511.com',0,''),(322,61,'www.zjhm0511.com',0,'www.hm0511.com hm0511.com www.zjhm0511.com zjhm0511.com hmzx0511.com www.hmzx0511.com 项目zjhmzxyy.com'),(323,61,'wap.zjhm0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com  sougou.zjhm0511.com'),(324,64,'www.phhqjk.com',0,''),(325,64,'4g.phhqjk.com',0,''),(326,61,'4g.0635hmzx.com',0,'4g.lchmzxyy.com 4g.lchmzxmr.com 4g.0635hmzx.com 项目 4g.lchmzxmryy.com'),(327,61,'m.0635hmzx.com',0,'m.lchmzxyy.com m.lchmzxmr.com m.0635hmzx.com 项目m.lchmzxmryy.com'),(328,66,'wap.0635hmzx.com',0,'wap.lchmzxyy.com wap.lchmzxmr.com wap.0635hmzx.com'),(329,66,'www.0635hmzx.com',0,''),(330,69,'www.lchmzxmryy.com',1,'CDN加速'),(331,69,'m.lchmzxmryy.com',1,'CDN加速'),(332,69,'wap.lchmzxmryy.com',1,'CDN加速'),(333,69,'4g.lchmzxmryy.com',1,'CDN加速'),(334,61,'5g.lchmzxmryy.com',0,''),(335,61,'4g.lchmzxmr.com',0,'4g.lchmzxyy.com 4g.lchmzxmr.com 4g.0635hmzx.com 项目 4g.lchmzxmryy.com'),(336,61,'m.lchmzxmr.com',0,'m.lchmzxyy.com m.lchmzxmr.com m.0635hmzx.com 项目m.lchmzxmryy.com'),(337,66,'wap.lchmzxmr.com',0,'wap.lchmzxyy.com wap.lchmzxmr.com wap.0635hmzx.com'),(338,66,'www.lchmzxmr.com',0,'www.lchmzxmr.com www.lchmzxyy.com'),(339,61,'4g.lchmzxyy.com',0,'4g.lchmzxyy.com 4g.lchmzxmr.com 4g.0635hmzx.com 项目 4g.lchmzxmryy.com'),(340,61,'m.lchmzxyy.com',0,'m.lchmzxyy.com m.lchmzxmr.com m.0635hmzx.com 项目m.lchmzxmryy.com'),(341,66,'wap.lchmzxyy.com',0,'wap.lchmzxyy.com wap.lchmzxmr.com wap.0635hmzx.com'),(342,66,'www.lchmzxyy.com',0,'www.lchmzxmr.com www.lchmzxyy.com'),(343,17,'3g.ganyutongjiyiyuan.com',0,''),(344,17,'www.ganyutongjiyiyuan.com',0,''),(345,14,'www.ganyutongji.com',0,''),(346,17,'wap.ganyutongji.cn',0,''),(347,17,'www.ganyutongji.cn',0,'www.ganyutongji.cn ganyutongji.cn tongji.qingzhifeng.com'),(348,66,'nk.cjyyfk.com',0,''),(349,66,'3g.cjyyfk.com',0,'m.cjnkyy.cn 3g.cjyyfk.com'),(350,61,'m.cjyyfk.com',0,'m.cjyyfk.com m.cjyyfk.cn'),(351,66,'www.cjyyfk.com',0,'www.cjyyfk.com cjyyfk.com fuke.cjyyfk.cn'),(352,69,'m.lhxtzyy.com',1,'CDN加速'),(353,69,'www.lhxtzyy.com',1,'CDN加速'),(354,17,'wap.lhxtzyy.com',0,''),(355,61,'www.lhxtnk.com',0,''),(356,63,'m.lhxtnk.com',0,''),(357,26,'www.jrtjyy.com',0,''),(358,26,'fk.jrtjyy.com',0,''),(359,61,'nk.jrtjyy.com',0,''),(360,69,'www.zjhmzxyy.com',1,'CDN加速'),(361,69,'3g.zjhmzxyy.com',1,'CDN加速 文件夹wap.zjhmzxyy.com'),(362,61,'wap.zjhmzxyy.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(363,61,'sougou.zjhmzxyy.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(364,61,'4g.zjhmzxyy.com',0,'4g.hm0511.com 4g.zjhmzxyy.com 4g.hmzx0511.com'),(365,61,'lchm.zjhmzxyy.com',0,''),(366,61,'360.hm0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(367,61,'4g.hm0511.com',0,'4g.hm0511.com 4g.zjhmzxyy.com 4g.hmzx0511.com'),(368,61,'wap.hm0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(369,61,'www.hm0511.com',0,'www.hm0511.com hm0511.com www.zjhm0511.com zjhm0511.com hmzx0511.com www.hmzx0511.com 项目zjhmzxyy.com'),(370,61,'4g.jttjyy.net',0,''),(371,61,'3g.jttjyy.net',0,''),(372,61,'m.jttjyy.net',0,''),(373,61,'www.jttjyy.net',0,''),(374,17,'www.phyy120.com',0,''),(375,17,'www.phyy120.cn',0,''),(376,15,'a.csdffkyy.com',0,''),(377,15,'b.csdffkyy.com',0,''),(378,15,'c.csdffkyy.com',0,''),(379,17,'wap.csdffkyy.com',0,''),(380,17,'fuke.csdffkyy.com',0,''),(381,17,'gc.csdffkyy.com',0,''),(382,17,'mgc.csdffkyy.com',0,''),(383,17,'www.csdffkyy.com',0,''),(384,61,'www.phhqyy.com',0,''),(385,61,'4g.phhqyy.com',0,''),(386,61,'4g.phhqyy.cn',0,''),(387,61,'www.phhqyy.cn',0,''),(388,17,'www.zjcznk.com',0,''),(389,17,'m.zjcznk.com',0,''),(390,63,'0514.gytjyy120.com',0,''),(391,27,'3g.gytjyy120.com',0,'3g.gytjyy120.com 3g.tjnk120.cn'),(392,64,'nk.gytjyy120.com',0,'nk.gytjyy120.com www.tj0514.com tj0514.com'),(393,63,'tt.gytjyy120.com',0,''),(394,63,'www.gytjyy120.com',0,'www.gytjyy120.com   www.tjnk120.cn tjnk120.cn'),(395,63,'m.gytjyy120.com',0,''),(396,5,'gc.qdhx120.com',0,''),(397,70,'qd.qdhx120.com',0,''),(398,4,'3g.qdhx120.com',0,''),(399,70,'a.qdhx120.com',0,''),(400,4,'nkyd.qdhx120.com',0,'m.qdhx120.com m.qdys120.com nkyd.qdhx120.com'),(401,4,'nkpc.qdhx120.com',0,'www.qdhx120.com www.qdys120.com qdys120.com nkpc.qdhx120.com 项目qdhx120.com'),(402,4,'m.qdhx120.com',0,'m.qdhx120.com m.qdys120.com nkyd.qdhx120.com  现在在60.174.237.174服务器'),(403,4,'www.qdhx120.com',0,'www.qdhx120.com www.qdys120.com qdys120.com nkpc.qdhx120.com'),(404,6,'nk.qdhx120.com',0,''),(405,4,'4g.qdhx120.com',0,''),(406,4,'3g.qdys120.com',0,''),(407,4,'www.qdys120.com',0,'www.qdhx120.com www.qdys120.com qdys120.com nkpc.qdhx120.com'),(408,4,'m.qdys120.com',0,'m.qdhx120.com m.qdys120.com nkyd.qdhx120.com 现在在60.174.237.174服务器上'),(409,4,'nk.qdys120.com',0,''),(410,4,'4g.qdys120.com',0,''),(411,69,'www.csdfnzyy.com',1,'CDN加速'),(412,15,'mfrd.csdfnzyy.com',0,''),(413,15,'frd.csdfnzyy.com',0,''),(414,63,'wap.csdfnzyy.com',0,'fk.csdfnzyy.com wap.csdfnzyy.com'),(415,73,'swt.csdfnzyy.com',0,''),(416,61,'fuke.csdfnzyy.com',0,''),(417,63,'fk.csdfnzyy.com',0,'fk.csdfnzyy.com wap.csdfnzyy.com'),(418,63,'gc.csdfnzyy.com',0,''),(419,63,'mgc.csdfnzyy.com',0,''),(420,63,'m.dypfyy.cn',0,''),(421,63,'www.dypfyy.cn',0,''),(422,16,'www.wyxygyy.cn',0,'原站在119.28.17.249'),(423,16,'nk.wyxygyy.com',0,''),(424,16,'fk.wyxygyy.com',0,''),(425,16,'www.wyxygyy.com',0,''),(426,16,'4g.wyxygyy.com',0,''),(427,16,'4g.wyxyg120.com',0,''),(428,16,'fk.wyxyg120.com',0,''),(429,16,'nk.wyxyg120.com',0,''),(430,16,'www.wyxyg120.com',0,''),(431,16,'www.0579ygyy.com',0,''),(432,69,'wap.byytqyy.com',1,'CDN加速'),(433,69,'www.byytqyy.com',1,'CDN加速'),(434,4,'3g.byytqyy.com',0,''),(435,6,'myc.byytqyy.com',0,''),(436,4,'m.byytqyy.com',0,''),(437,28,'www.lyxdyy120.com',0,''),(438,4,'pcnk.hxfk120.cn',0,''),(439,17,'m.hxfk120.cn',0,''),(440,4,'xh.hxfk120.cn',0,''),(441,4,'nk.hxfk120.cn',0,''),(442,4,'4g.hxfk120.cn',0,''),(443,4,'www.hxfk120.cn',0,''),(444,2,'www.hxxhyy.cn',0,''),(445,2,'m.hxxhyy.cn',0,''),(446,28,'www.jttj120.com',0,''),(447,63,'dywap.dfpfyy.com',0,''),(448,28,'dypf.dfpfyy.com',0,''),(449,28,'ai.dfpfyy.com',0,''),(450,74,'3g.dfpfyy.com',0,''),(451,28,'www.dfpfyy.com',0,''),(452,28,'m.dfpfyy.com',0,''),(453,28,'www.zjgnkyy.cn',0,''),(454,28,'www.wcnke.cn',0,''),(455,28,'www.xcjl120.com',0,''),(456,40,'www.hxxhyy.com',0,''),(457,5,'3g.0555xhyy.com',0,''),(458,5,'www.0555xhyy.com',0,''),(459,6,'www.xhfkyy120.com',0,''),(460,57,'3g.0512csfk.com',0,''),(461,57,'www.0512csfk.com',0,'fukecsrlyy'),(462,40,'wap.0512csfk.com',0,''),(463,25,'5g.tzhmzx.com',0,''),(464,69,'m.tzhmzx.com',1,'CDN加速'),(465,69,'zxmr.tzhmzx.com',1,'CDN加速'),(466,69,'www.tzhmzx.com',0,'www.tzhmzx.com www.tzhmmr.com www.tzhmgj.com'),(467,25,'swt.tzhmzx.com',0,''),(468,25,'zx.tzhmzx.com',0,'zx.tzhmmr.com zx.tzhmgj.com zx.tzhmzx.com'),(469,76,'www.tzhmyy.com',0,''),(470,76,'m.tzhmyy.com',0,''),(471,25,'5g.tzhmmr.com',0,''),(472,25,'wap.tzhmmr.com',0,'wap.tzhmgj.com wap.tzhmmr.com 项目wap.tzhmzx.com'),(473,25,'zx.tzhmmr.com',0,'zx.tzhmmr.com zx.tzhmgj.com  zx.tzhmzx.com'),(474,25,'www.tzhmmr.com',0,'www.tzhmzx.com www.tzhmmr.com www.tzhmgj.com'),(475,25,'m.tzhmmr.com',0,'m.tzhmmr.com m.tzhmgj.com 项目m.tzhmzx.com'),(476,25,'fbd3.tzhmgj.com',0,''),(477,25,'5g.tzhmgj.com',0,''),(478,25,'fbd1.tzhmgj.com',0,''),(479,25,'fbd2.tzhmgj.com',0,''),(480,25,'wap.tzhmgj.com',0,'wap.tzhmgj.com wap.tzhmmr.com 项目wap.tzhmzx.com'),(481,25,'zx.tzhmgj.com',0,'zx.tzhmmr.com zx.tzhmgj.com zx.tzhmzx.com'),(482,25,'www.tzhmgj.com',0,'www.tzhmzx.com www.tzhmmr.com www.tzhmgj.com'),(483,25,'m.tzhmgj.com',0,'m.tzhmmr.com m.tzhmgj.com 项目m.tzhmzx.com'),(484,25,'wvvw.tzhmgj.com',0,''),(485,76,'www.0523mr.com',0,''),(486,76,'m.0523mr.com',0,''),(487,16,'www.81pfyy.com',0,''),(488,21,'m.81pfyy.com',0,''),(489,58,'www.tlhsfk.com',0,''),(490,61,'5g.dysgzxyy.com',0,''),(491,69,'wap.dysgzxyy.com',1,'CDN加速'),(492,69,'4g.dysgzxyy.com',1,'CDN加速'),(493,69,'www.dysgzxyy.com',1,'CDN加速'),(494,61,'pf.dysgzxyy.com',0,''),(495,63,'pfm.dysgzxyy.com',0,''),(496,63,'fkzx.dysgzxyy.com',0,''),(497,63,'fkby.dysgzxyy.com',0,''),(498,63,'fkgj.dysgzxyy.com',0,''),(499,63,'fkyz.dysgzxyy.com',0,''),(500,63,'fkrl.dysgzxyy.com',0,''),(501,63,'m.dysgzxyy.com',0,''),(502,63,'gc.dysgzxyy.com',0,''),(503,63,'gk.dysgzxyy.com',0,''),(504,63,'fk.dysgzxyy.com',0,''),(505,63,'nk.dysgzxyy.com',0,''),(506,63,'ai.dysgzxyy.com',0,''),(507,47,'www.tlhsnk.com',0,''),(508,7,'www.0523gcyy.com',0,''),(509,63,'sgw.tzpfyy.cn',0,''),(510,66,'new.tzpfyy.cn',0,''),(511,63,'sm.tzpfyy.cn',0,''),(512,63,'wap.tzpfyy.cn',0,'m.tzpfyy.cn wap.tzpfyy.cn'),(513,28,'sg.tzpfyy.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(514,73,'swt.tzpfyy.cn',0,''),(515,57,'yc.tzpfyy.cn',0,''),(516,63,'m.tzpfyy.cn',0,'m.tzpfyy.cn wap.tzpfyy.cn'),(517,28,'ai.tzpfyy.cn',0,'ai.tzpfyy.cn、pf.tzpfyy.cn共用一个后台'),(518,28,'pf.tzpfyy.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(519,28,'www.tzpfyy.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(520,47,'www.tzpfyy.net',0,''),(521,58,'www.tcxhnkyy.com',0,''),(522,58,'3g.tcxhnkyy.com',0,'m.tcxiehe.com 3g.tcxhnkyy.com'),(523,70,'jj.tcxhnkyy.com',0,''),(524,66,'www.jrtjnk.com',0,''),(525,15,'www.wjnk.org',0,''),(526,40,'www.wjnkyy.org',0,''),(527,15,'www.wjboai.cn',0,''),(528,15,'4g.wjboai.cn',0,''),(529,15,'m.0514tjyy.com',0,''),(530,27,'www.0514tjyy.com',0,''),(531,27,'www.0519jttj.com',0,''),(532,15,'3g.0519jttj.com',0,''),(533,27,'www.0519tjyy.cn',0,''),(534,28,'www.jttjyy.cn',0,''),(535,27,'m.gytjyy.cn',0,''),(536,27,'www.gytjyy.cn',0,''),(537,63,'m.gytjfk.com',0,''),(538,27,'www.gytjfk.com',0,''),(539,41,'c.tchsfk.com',0,''),(540,41,'b.tchsfk.com',0,''),(541,41,'a.tchsfk.com',0,''),(542,28,'www.tchsfk.com',0,''),(543,28,'www.53120888.com',0,''),(544,26,'nk.sznx120.com',0,''),(545,26,'120.sznx120.com',0,''),(546,26,'3g.sznx120.com',0,''),(547,66,'fk.sznx120.com',0,''),(548,28,'xh.sznx120.com',0,''),(549,57,'gc.sznx120.com',0,''),(550,15,'wap.sznx120.com',0,''),(551,28,'zc.sznx120.com',0,''),(552,28,'www.sznx120.com',0,''),(553,40,'m.sznx120.com',0,''),(554,57,'sg.wjbayy120.com',0,''),(555,57,'4g.wjbayy120.com',0,''),(556,57,'www.wjbayy120.com',0,''),(557,15,'3g.wjbayy120.com',0,''),(558,15,'wap.wjbayy120.com',0,''),(559,47,'sj.wjbayy120.com',0,''),(560,39,'m.wjbayy120.com',0,''),(561,73,'swt.sz120nk.com',0,''),(562,40,'m.sz120nk.com',0,''),(563,39,'www.sz120nk.com',0,''),(564,40,'3g.sz120fk.com',0,''),(565,40,'m.sz120fk.com',0,''),(566,39,'www.sz120fk.com',0,''),(567,58,'wap.zjczfk.com',0,''),(568,58,'mp.zjczfk.com',0,''),(569,58,'3g.zjczfk.com',0,''),(570,58,'www.zjczfk.com',0,''),(571,77,'fk.zjczfk.com',0,'fk.jrtj120.com  fk.zjczfk.com'),(572,20,'m.zjczfk.com',0,''),(573,58,'wap.tzgcyy.cn',0,''),(574,66,'3g.tzgcyy.cn',0,''),(575,58,'m.tzgcyy.cn',0,''),(576,28,'dypfm.tzgcyy.cn',0,'dypfm.tzgcyy.cn，m.dfpfyy.com'),(577,28,'dypf.tzgcyy.cn',0,'www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(578,28,'pfm.tzgcyy.cn',0,''),(579,28,'pf.tzgcyy.cn',0,''),(580,28,'ai.tzgcyy.cn',0,''),(581,28,'www.tzgcyy.cn',0,''),(582,39,'gc.tzgcyy.cn',0,''),(583,69,'wap.dypfyy.com',1,'CDN加速   wap.dypfyy.com wap.dypfzk.com'),(584,69,'www.dypfyy.com',1,'CDN加速   www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(585,63,'sgw.dypfyy.com',0,'m.dypfyy.com共用后台'),(586,63,'sm.dypfyy.com',0,'m.dypfyy.com共用后台'),(587,28,'sg.dypfyy.com',0,'网站已移动至43.277.196.97 与www.dypfyy.com共用后台'),(588,63,'m.dypfyy.com',0,'m.dypfyy.com m.0511woman.com'),(589,73,'swt.dypfyy.com',0,''),(590,28,'ai.dypfyy.com',0,''),(591,28,'pf.dypfyy.com',0,'www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(592,15,'3g.jrbxyy.com',0,''),(593,58,'www.jrbxyy.com',0,''),(594,58,'nk.jrbxyy.com',0,''),(595,14,'m.jrbxyy.com',0,''),(596,27,'gc.jrbxyy.com',0,''),(597,15,'fk.jrbxyy.com',0,''),(598,39,'gk.jrbxyy.com',0,''),(599,66,'www.njwh120.com',0,''),(600,61,'m.njwh120.com',0,''),(601,61,'3g.njwh120.com',0,''),(602,5,'www.gytjyy.com',0,''),(603,4,'m.gytjyy.com',0,''),(604,55,'nk.gytjyy.com',0,''),(605,39,'3g.gytjyy.com',0,''),(606,57,'nk.xcjlyy.com',0,''),(607,2,'www.xcjlyy.com',0,'原站47.90.79.154'),(608,15,'3g.xcjlyy.com',0,''),(609,15,'m.xcjlyy.com',0,'m.tchsyy.com/xcjlyywap'),(610,69,'wap.4009999120.com',1,'CDN加速'),(611,69,'www.4009999120.com',1,'CDN加速'),(612,56,'m.4009999120.com',0,''),(613,56,'mbd.4009999120.com',0,''),(614,70,'pp.4009999120.com',0,''),(615,56,'yc.4009999120.com',0,''),(616,56,'bd.4009999120.com',0,''),(617,15,'www.tcxhnk.com',0,''),(618,15,'m.tcxhnk.com',0,''),(619,40,'wap.tcxhnk.com',0,''),(620,77,'nk.tcxhnk.com',0,''),(621,35,'wshh.tcxhnk.com',0,''),(622,28,'www.tcrlyy.com',0,''),(623,57,'www.jynke.com',0,''),(624,57,'bak.jynke.com',0,''),(625,68,'bak.jjnke.com',0,''),(626,68,'www.jjnke.com',0,''),(627,17,'www.ntrdrl.com',0,''),(628,69,'3g.rdjgnk.com',1,'CDN加速'),(629,69,'www.rdjgnk.com',1,'CDN加速'),(630,87,'m.rdjgnk.com',0,''),(631,17,'4g.rdjgnk.com',0,''),(632,17,'nk.rdjgnk.com',0,''),(633,17,'3g.rdnkjg.com',0,''),(634,87,'www.rdnkjg.com',0,''),(635,17,'www.ntrdfk.com',0,''),(636,17,'www.rdrlw.com',0,''),(637,17,'www.84522888.com',0,''),(638,15,'www.tzdfyy.cn',0,''),(639,15,'bak.tzdfyy.cn',0,''),(640,58,'www.tzdfyy.net',0,''),(641,70,'pp.tzdfyy.net',0,''),(642,69,'www.cszsyy.cn',1,'CDN加速'),(643,69,'3g.cszsyy.cn',1,'CDN加速'),(644,16,'wap.cszsyy.cn',0,''),(645,70,'jj.cszsyy.cn',0,''),(646,5,'nk.cszsyy.cn',0,''),(647,13,'bak.cszsyy.cn',0,''),(648,13,'crm.cszsyy.cn',0,''),(649,6,'m.cszsyy.cn',0,''),(650,60,'bak1.tzdf120.com',0,''),(651,68,'bak.tzdf120.com',0,''),(652,68,'www.tzdf120.com',0,''),(653,17,'fuke.csrlfk.com',0,''),(654,17,'3g.csrlfk.com',0,''),(655,57,'a.csrlfk.com',0,''),(656,57,'b.csrlfk.com',0,''),(657,57,'c.csrlfk.com',0,''),(658,15,'www.csrlfk.com',0,''),(659,13,'crm.csrlfk.com',0,''),(660,69,'dds1.czganglong.com',0,''),(661,78,'wmr.czganglong.com',0,''),(662,57,'nankektl120.czganglong.com',0,''),(663,58,'fktl120.czganglong.com',0,''),(664,58,'3wtlhsfk.czganglong.com',0,''),(665,16,'comet.czganglong.com',0,''),(666,15,'3wtl120.czganglong.com',0,''),(667,15,'nktl120.czganglong.com',0,''),(668,15,'mtchsyy.czganglong.com',0,''),(669,47,'3wtlhsnk.czganglong.com',0,''),(670,73,'swt.czganglong.com',0,''),(671,28,'by.czganglong.com',0,''),(672,28,'wxb.czganglong.com',0,''),(673,28,'pp.czganglong.com',0,''),(674,78,'s.czganglong.com',0,''),(675,70,'cc.tcxiehe.com',0,''),(676,66,'120.tcxiehe.com',0,''),(677,58,'m.tcxiehe.com',0,'m.tcxiehe.com 3g.tcxhnkyy.com'),(678,15,'4g.tcxiehe.com',0,''),(679,14,'nk.tcxiehe.com',0,''),(680,70,'pp.tcxiehe.com',0,''),(681,63,'www.tcxiehe.com',0,''),(682,63,'5g.tcxiehe.com',0,''),(683,26,'m.jrtj120.com',0,''),(684,58,'male.jrtj120.com',0,''),(685,58,'mfk.jrtj120.com',0,''),(686,58,'3g.jrtj120.com',0,''),(687,63,'mp.jrtj120.com',0,''),(688,63,'www.jrtj120.com',0,''),(689,63,'nk.jrtj120.com',0,''),(690,63,'wap.jrtj120.com',0,''),(691,63,'nanke.jrtj120.com',0,''),(692,77,'fk.jrtj120.com',0,'fk.jrtj120.com  fk.zjczfk.com'),(693,27,'mgc.jrtj120.com',0,'与gc.jrbxyy.com共用'),(694,27,'gc.jrtj120.com',0,'与gc.jrbxyy.com共用'),(695,79,'man.jrtj120.com',0,''),(696,80,'yzqlx.jrtj120.com',0,''),(697,80,'yzlt.jrtj120.com',0,''),(698,80,'yzgc.jrtj120.com',0,''),(699,80,'yzbp.jrtj120.com',0,''),(700,80,'zjgc.jrtj120.com',0,''),(701,80,'zjcz.jrtj120.com',0,''),(702,80,'zjbp.jrtj120.com',0,''),(703,80,'jrnk.jrtj120.com',0,''),(704,80,'jrrl.jrtj120.com',0,''),(705,80,'jrfk.jrtj120.com',0,''),(706,26,'m.jttjyy.com',0,''),(707,26,'www.jttjyy.com',0,''),(708,57,'4g.jttjyy.com',0,''),(709,57,'3g.jttjyy.com',0,''),(710,63,'gaofang.jttjyy.com',0,''),(711,17,'www.rdjgyy.com',0,''),(712,17,'www.rdnkyy.com',0,''),(713,64,'m.njgb120.com',0,''),(714,64,'smc.njgb120.com',0,''),(715,64,'jsnre.njgb120.com',0,''),(716,66,'www.njgb120.com',0,''),(717,66,'www.gbyy120.com',0,''),(718,64,'smc.gbyy120.com',0,''),(719,64,'sgm.gbyy120.com',0,''),(720,64,'jsnre.gbyy120.com',0,''),(721,64,'m.gbyy120.com',0,''),(722,73,'swt.gbyy120.com',0,''),(723,66,'www.njgbyy.com',0,'njwhgb.com gbyy120.com njgb120.com jswh120.com jswhgb.com njgbyy.com njwh120.com www.njwh120.com www.njwhgb.com www.gbyy120.com www.njgb120.com www.jswh120.com www.jswhgb.com www.njgbyy.com  项目www.jswh120.com'),(724,64,'jsnre.njgbyy.com',0,''),(725,64,'m.njgbyy.com',0,''),(726,69,'m.zjgwcyy.com',1,'CDN加速'),(727,4,'www.zjgwcyy.com',0,''),(728,5,'4g.zjgwcyy.com',0,''),(729,70,'pp.zjgwcyy.com',0,''),(730,4,'wap.zjgwcyy.com',0,''),(731,4,'nk.zjgwcyy.com',0,''),(732,4,'ftp.zjgwcyy.com',0,''),(733,81,'mail.zjgwcyy.com',0,''),(734,82,'www.njyahan.cn',0,''),(735,82,'www.yhzx025.com',0,''),(736,82,'www.yahanzx.com',0,''),(737,18,'5g.njyhzx.com',0,''),(738,18,'4g.njyhzx.com',0,'4g.025yahan.com 4g.njyhzx.com 4g.52177777.com'),(739,18,'wap.njyhzx.com',0,'wap.njyhzx.com m.52177777.com 项目m_025yahan'),(740,18,'zx.njyhzx.com',0,'www.52177777.com zx.025yahan.com  zx.njyhzx.com项目文件夹025yahan_com'),(741,69,'m.njyhzx.com',1,'CDN加速'),(742,69,'www.njyhzx.com',1,'CDN加速'),(743,83,'qb.njyhzx.com',0,''),(744,83,'xizhi.njyhzx.com',0,''),(745,18,'5g.52177777.com',0,''),(746,18,'m.52177777.com',0,'wap.njyhzx.com m.52177777.com 项目m_025yahan'),(747,18,'4g.52177777.com',0,'4g.025yahan.com 4g.njyhzx.com 4g.52177777.com'),(748,18,'www.52177777.com',0,'www.52177777.com  zx.025yahan.com  zx.njyhzx.com'),(749,18,'fbd3.025yahan.com',0,''),(750,69,'www.025yahan.com',1,'CDN加速'),(751,69,'m.025yahan.com',1,'CDN加速'),(752,18,'fbd2.025yahan.com',0,''),(753,18,'fbd1.025yahan.com',0,''),(754,18,'5g.025yahan.com',0,''),(755,18,'4g.025yahan.com',0,'4g.025yahan.com 4g.njyhzx.com 4g.52177777.com'),(756,18,'zx.025yahan.com',0,'www.52177777.com  zx.025yahan.com  zx.njyhzx.com 项目文件夹025yahan_com'),(757,18,'oa.025yahan.com',0,''),(758,57,'wx.nuozhizhou.com',0,''),(759,57,'www.nuozhizhou.com',0,''),(760,57,'www.tcdryy.com',0,''),(761,57,'www.tcdr120.com',0,''),(762,69,'4g.dtzsyy.com',1,'CDN加速   4g.dtzsnk.com 4g.dtzsyy.com'),(763,6,'www.dtzsyy.com',0,''),(764,6,'m.dtzsyy.com',0,''),(765,69,'4g.dtzsnk.com',1,'CDN加速    4g.dtzsnk.com 4g.dtzsyy.com'),(766,69,'www.dtzsnk.com',1,'CDN加速'),(767,4,'m.xhnkyy.cn',0,''),(768,4,'www.xhnkyy.cn',0,''),(769,69,'qwap.syxymp.com',1,'CDN加速'),(770,57,'www.syxymp.com',0,''),(771,14,'m.tcxhzk.com',0,''),(772,14,'www.tcxhzk.com',0,''),(773,3,'www.duchang8.com',0,'www.duchang8.com duchang8.com bbs.duchang8.com'),(774,3,'bbs.duchang8.com',0,'www.duchang8.com duchang8.com bbs.duchang8.com'),(775,66,'www.cjnkyy.cn',0,'www.cjnkyy.cn  nk.cjyyfk.com'),(776,66,'www.cjtfyy.com',0,''),(777,66,'fk.changjiangfuke.com',0,''),(778,66,'m.changjiangfuke.com',0,''),(779,66,'mfk.changjiangfuke.com',0,''),(780,66,'www.changjiangfuke.com',0,''),(781,66,'m.cjnkyy.cn',0,'m.cjnkyy.cn 3g.cjyyfk.com'),(782,66,'m.cjtfyy.com',0,''),(783,66,'m.cjyyfs.com',0,'m.cjyyfs.com m.cjfsk.cn'),(784,66,'m.cjfsk.cn',0,'m.cjyyfs.com m.cjfsk.cn'),(785,66,'www.tzdfyy.com',0,''),(787,17,'120ask.nj0518.com',0,'39nk.lygnjnk.cn 120ask.nj0518.com  | 120ask.nj0518.com的原项目在61.155.150.192'),(788,17,'bdmo.lygnj120.com',0,'bdmo.lygnj120.com bdmo.0518njyy.com bdmo.nj0518.com'),(789,17,'bdmo.0518njyy.com',0,'bdmo.lygnj120.com bdmo.0518njyy.com bdmo.nj0518.com'),(790,17,'bdmo.nj0518.com',0,'bdmo.lygnj120.com bdmo.0518njyy.com bdmo.nj0518.com'),(791,17,'bdpc.nj0518.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(792,17,'bdpc.lygnj120.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(793,17,'sgpc.lygnj120.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(794,17,'m.lygnj120.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(795,17,'bdmo.lygnjmnk.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(796,17,'m.nj0518.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(797,17,'sgmo.lygnj120.com',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(798,17,'www.lygnj120.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(799,17,'www.nj0518.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(800,17,'www.lygnjmnk.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(801,69,'wap.tzhmzx.com',0,''),(802,84,'m.cjyyfk.cn',0,''),(803,85,'www.0512csrl.com',0,''),(804,15,'wap.csrlzx.com',1,'wap.csrlzx.com wapzx.csrlyy.com wap.csrlzxyy.com'),(805,85,'wapzx.csrlyy.com',1,'wap.csrlzx.com wapzx.csrlyy.com wap.csrlzxyy.com'),(806,21,'wap.csrlzxyy.com',0,'wap.csrlzx.com wapzx.csrlyy.com wap.csrlzxyy.com'),(807,16,'www.cjyyfk.cn',1,''),(808,17,'mnk.120lyjf.com',0,'mnk.120lyjf.com mnk.lyjfyy.com'),(809,17,'tongji.qingzhifeng.com',0,'www.ganyutongji.cn ganyutongji.cn tongji.qingzhifeng.com'),(810,68,'www.97dx.com',0,''),(811,4,'wap.lcbd120.com',0,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(812,4,'4g.0635yy.com',0,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(813,4,'4g.csrlzx.com',0,''),(814,4,'www.csrlzx.com',0,'www.csrlzx.com csrlzx.com zx.csrlyy.com'),(815,6,'wvvw.dtzsyy.com',0,''),(816,6,'www.csrayy.com',0,''),(817,6,'www.csxhmz.com',0,''),(818,85,'www.cszxmr0512.com',0,'www.cszxmr0512.com cszxmr0512.com www.csrlyy.com csrlyy.com'),(819,85,'www.csrlyy.com',0,'www.cszxmr0512.com cszxmr0512.com www.csrlyy.com csrlyy.com'),(820,16,'www.yxsgyy.com',0,''),(821,16,'m.yxsgyy.com',0,''),(822,17,'mbd.rdnkjg.com',0,''),(823,16,'www.rdbayy.com',0,''),(824,61,'5g.hm0511.com',0,''),(825,61,'5g.zjhmzxyy.com',0,''),(826,58,'nk.zjczfk.com',0,'已关闭'),(827,17,'m.dysghs.com',0,''),(828,17,'www.dysghs.com',0,''),(829,17,'sg.zjcznk.com',0,''),(830,15,'m.tl120.com',0,'m.tchsyy.com/tlhsyywap'),(831,61,'sougou.zjhm0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com  sougou.zjhm0511.com'),(832,61,'sougou5g.zjhm0511.com',0,''),(833,17,'mfk.120lyjf.com',0,''),(834,15,'fk.rdbayy.com',0,''),(835,17,'m.lygnj120.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com m.lygnj120.cn'),(836,17,'m.lygnk120.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com m.lygnj120.cn m.lygnk120.cn'),(837,17,'www.lygnj120.cn',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com lygnk120.cn www.lygnk120.cn lygnj120.cn www.lygnj120.cn'),(838,17,'www.lygnk120.cn',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com lygnk120.cn www.lygnk120.cn lygnj120.cn www.lygnj120.cn'),(839,63,'m.gytjnk.cn',0,''),(840,61,'mgc.jrtjyy.com',0,''),(841,28,'sg.dysghs.com',0,''),(842,17,'sgw.dysghs.com',0,''),(843,69,'sg.dypfzk.com',0,''),(844,69,'sgw.dypfzk.com',0,''),(845,64,'fuke.jyhwyy.com',0,''),(846,64,'4g.jyhw120.com',0,''),(847,17,'www.lyjfzk.com',0,''),(848,57,'www.wjboaiyy.com',0,''),(849,57,'m.wjboaiyy.com',0,''),(850,61,'5g.lchmzxyy.com',0,''),(851,64,'4g.jyhwyy.com',0,''),(852,61,'wap.jttjyy.net',0,''),(853,62,'bdmo.lygnj120.cn',0,''),(854,17,'bdpc.lygnj120.cn',0,'bdpc.lygnj120.cn  bdpc.0518njyy.com  共用后台'),(855,17,'bdpc.lygnk120.cn',0,'bdpc.lygnk120.cn   bdpc.0518njyy.com  共用后台'),(856,62,'wap.tzpyyy.com',0,''),(857,62,'www.tzpyyy.com',0,''),(858,58,'4g.zjczfk.com',0,''),(859,64,'0578.jyhwyy.com',0,''),(860,15,'tx.tjnk120.cn',0,'tx.tjnk120.cn'),(861,15,'tx3g.tjnk120.cn',0,'tx3g.tjnk120.cn'),(862,15,'m.jrtjnk.com',0,''),(863,15,'4g.txglnk.com',0,''),(864,15,'4g.txglfk.com',0,''),(865,15,'www.txglnk.com',0,''),(866,15,'www.txglfk.com',0,''),(867,61,'5g.dysgzxmr.com',0,''),(868,64,'3g.jyhw120.com',0,''),(869,16,'wap.yxsgyy.com',0,''),(870,62,'wap.tzpfkyy.cn',0,''),(871,62,'bdmo.lygnk120.cn',0,''),(872,63,'fuke.jttjyy.com',0,''),(873,28,'5g.yzlt120.com',1,''),(874,16,'5g.yzltnk.com',0,''),(875,64,'m.jyhwyy.com',0,''),(876,66,'www.tzdfpfyy.com',0,''),(877,57,'m.dysgyy.net',0,''),(878,66,'www.tzhlpf.com',0,''),(879,66,'wap.tzhlpf.com',0,''),(880,66,'m.tzdfpfyy.com',0,''),(881,16,'mgc.yxsgyy.com',0,''),(882,16,'mgc.yxsgyy.cn',0,''),(883,15,'www1.txglnk.com',0,''),(884,15,'5g.txglnk.com',0,'与4g.txglnk.com共用'),(885,66,'m.tzdfyy.com',0,''),(886,17,'www.dysg120.com',0,''),(887,17,'m.dysg120.com',0,''),(888,88,'3wtlhsyy.czganglong.com',0,''),(889,88,'bj.czganglong.com',0,''),(890,16,'4g.yxsgyy.cn',0,''),(891,15,'www.txglyy.com',0,'与www1.txglnk.com共用'),(892,15,'m.txglyy.com',0,'与www1.txglnk.com共用'),(893,16,'www.yxsgyy.cn',0,''),(894,17,'msg.zjcznk.com',0,''),(895,15,'sg.3g.xcjlyy.com',0,''),(896,87,'m.lygnk0518.com',0,''),(897,87,'m.lygnkyy.net',0,''),(898,87,'www.czzxjn.com',0,''),(899,69,'new.tzpfbzk.com',0,''),(900,57,'sg.jttjyy.com',0,''),(901,63,'sgfk.jttjyy.com',0,''),(902,28,'sg.yzlt120.com',1,''),(903,17,'www.120lyjf.com',0,''),(904,16,'sg.yzltnk.com',0,''),(905,61,'sougou5g.zjhmzxyy.com',0,''),(906,66,'www.whgb120.com',0,''),(907,61,'sg.jttjyy.net',0,''),(908,66,'m.whgb120.com',0,''),(909,16,'m.njyz8.com ',0,''),(910,16,'www.njyz8.com',0,''),(911,2,'www.njgrzs.com',0,''),(912,2,'m.njgrzs.com',0,''),(913,2,'m.njjczdm.com',0,''),(914,2,'www.njjczdm.com',0,''),(915,14,'www.soemyintaung.com',0,''),(916,64,'sg.jyhw120.com',0,''),(917,57,'5g.wjboai.com',1,''),(918,66,'baidu.njgbyy.com',0,''),(919,16,'www.wygryy120.com',0,''),(920,16,'www.wygryy.com',0,''),(921,16,'nk.wygryy.com',0,''),(922,16,'fk.wygryy.com',0,''),(923,16,'4g.wygryy.com',0,''),(924,16,'nk.wygryy120.com',0,''),(925,16,'fk.wygryy120.com',0,''),(926,16,'4g.wygryy120.com',0,''),(927,88,'www.szoyyy.com',0,''),(928,28,'www.szoyyy.cn',0,''),(929,28,'nk.szoy120.com',0,''),(930,28,'xh.szoy120.com',0,''),(931,28,'zc.szoy120.com',0,''),(932,88,'zc.szoyyy.com',0,''),(933,88,'nk.szoyyy.com',0,''),(934,61,'fk.szoyyy.com',0,''),(935,28,'3g.szoy120.com',0,''),(936,87,'m.rdnkjg.com',0,''),(937,64,'sgnk.jyhwyy.com',0,''),(938,64,'sgfk.jyhwyy.com',0,''),(939,47,'mbd.changzheng120.com',1,''),(940,62,'mpfb.tzpfyy.cn',0,''),(941,62,'www.80192111.com',0,''),(942,16,'wap.80192111.com',0,''),(943,66,'yg.njwh120.com',0,''),(944,66,'bg.njwh120.com',0,''),(945,66,'gb.njwh120.com',0,''),(946,66,'gbyy.njwh120.com',0,''),(947,61,'m.njwh025.com',0,''),(948,61,'4g.njwh120.com',0,''),(949,61,'wap.njwh120.com',0,''),(950,16,'m.njfs120.com',0,''),(951,16,'m.njfsyy.com',0,''),(952,47,'www.njfs120.com',0,'www.njfsyy.com'),(953,47,'www.njfsyy.com',0,'www.njfs120.com'),(954,15,'wap.yxba120.com',0,''),(955,62,'wap.yxnke.com',0,'加速不加速心里没点数么'),(956,62,'www.gbyynj.com',0,''),(957,64,'m.gbyynj.com',0,''),(958,47,'www.njwhfk.com',0,''),(959,26,'4g.tznke.com',0,''),(960,16,'yzltyy120.cn',0,''),(961,15,'sm.0523yy.com',0,'');
/*!40000 ALTER TABLE `xz_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_domain_copy`
--

DROP TABLE IF EXISTS `xz_domain_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_domain_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipid` int(10) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `isspeed` smallint(1) DEFAULT NULL COMMENT '是否加速',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=829 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_domain_copy`
--

LOCK TABLES `xz_domain_copy` WRITE;
/*!40000 ALTER TABLE `xz_domain_copy` DISABLE KEYS */;
INSERT INTO `xz_domain_copy` VALUES (1,16,'3g.dysg.org',0,''),(2,16,'3g.wjba120.cn',1,''),(3,4,'4g.lcbdnk.com',0,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(4,50,'lcyy.lcbdyy.com',1,''),(5,50,'yy. lcbdyy.com',1,''),(6,50,'shouji.lcbdyy.com',1,''),(7,50,'gc.lcbdyy.com',1,''),(8,50,'wapby.lcbdyy.com',1,''),(9,2,'3gnk.lcbdyy.com',1,''),(10,2,'wapfk.lcbdyy.com',1,''),(11,2,'zxmr.lcbdyy.com',1,'zxmr.lcbdyy.com www.lcbd120.com'),(12,2,'byby.lcbdyy.com',1,''),(13,2,'bbs.lcbdyy.com',1,''),(14,2,'wapgc.lcbdyy.com',1,''),(15,2,'wapzx.lcbdyy.com',1,''),(16,68,'wappf.lcbdyy.com',1,''),(17,4,'wap.lcbdyy.com',1,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(18,4,'4gzx.lcbdyy.com',1,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(19,2,'www.lcbdyy.com',1,''),(20,16,'nk.lcbdyy.com',1,''),(21,49,'zt.lcbdyy.com',1,''),(22,16,'www.wjba120.cn',1,''),(23,16,'wap.tcfkyy.cn',1,''),(24,16,'fk.tcfkyy.cn',1,''),(25,15,'www.tcfkyy.cn',1,''),(26,66,'www.njwhgb.com',0,''),(27,64,'m.njwhgb.com',0,'m.njwhgb.com ss.jswh120.com nj.jswhgb.com'),(28,66,'nj.njwhgb.com',0,'sgg.njwhgb.com nj.njwhgb.com'),(29,64,'jsnre.njwhgb.com',0,''),(30,16,'www.wjbayy.cn',1,''),(31,16,'www.tzdfzx.com',1,''),(32,16,'www.lcbdfk120.com',1,''),(33,16,'www.zjgwczx.com',1,'zjgwczxyy.com www.zjgwczxyy.com zjgwczx.com www.zjgwczx.com'),(34,16,'wap.zjgwczx.com',1,'wap.zjgwczxyy.com wap.zjgwczx.com'),(35,15,'4g.zjgwczx.com',1,''),(36,16,'wap.zjgwczxyy.com',1,'wap.zjgwczxyy.com wap.zjgwczx.com'),(37,16,'www.zjgwczxyy.com',1,'zjgwczxyy.com www.zjgwczxyy.com zjgwczx.com www.zjgwczx.com'),(38,58,'zx.zjgwczxyy.com',1,''),(39,16,'m.wcnke.com',1,''),(40,16,'nk.wcnke.com',1,''),(41,16,'wap.wcnke.com',1,''),(42,16,'www.wcnke.com',1,''),(43,69,'new.tzpfb.cn',1,''),(44,69,'www.tzpfb.cn',1,'CDN加速   www.tzpfb.cn tzpfb.cn www.tzpfbzk.com tzpfbzk.com'),(45,63,'msg.tzpfb.cn',0,''),(46,28,'sg.tzpfb.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(47,63,'sgw.tzpfb.cn',0,''),(48,63,'sm.tzpfb.cn',0,'m.tzpfb.cn sm.tzpfb.cn'),(49,16,'wap.tzpfb.cn',0,''),(50,16,'m.tzpfb.cn',0,'m.tzpfb.cn sm.tzpfb.cn'),(51,16,'ai.tzpfb.cn',0,''),(52,63,'dywap.tzpfb.cn',0,''),(53,28,'dypf.tzpfb.cn',0,'www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(54,39,'wapfk.tchsyy.com',1,''),(55,4,'fuke.tchsyy.com',1,''),(56,15,'m.tchsyy.com',1,''),(57,15,'www.tchsyy.com',1,''),(58,16,'wap.tchsyy.com',1,''),(59,16,'3g.tchsyy.com',1,''),(60,16,'fk.tchsyy.com',1,''),(61,17,'sg.wjboai.com',1,''),(62,17,'nk.wjboai.com',1,''),(63,40,'m.wjboai.com',1,''),(64,15,'4g.wjboai.com',1,''),(65,16,'3g.wjboai.com',1,''),(66,16,'wap.wjboai.com',1,''),(67,20,'www.wjboai.com',1,''),(68,57,'mm.wjboai.com',1,''),(69,15,'a.wjboai.com',1,''),(70,16,'mgc.yxnkyy.cn',0,''),(71,69,'3g.yxnkyy.cn',1,'CDN加速'),(72,16,'wap.yxnkyy.cn',0,''),(73,69,'www.yxnkyy.cn',1,'CDN加速'),(74,5,'nk.yxnkyy.cn',0,''),(75,17,'4g.yxnkyy.cn',0,''),(76,70,'jc.yxnkyy.cn',0,''),(77,68,'baopi.yxnkyy.cn',0,''),(78,34,'gc.yxnkyy.cn',0,''),(79,29,'bp.yxnkyy.cn',0,''),(80,49,'m.yxnkyy.cn',0,''),(81,39,'m.szxieheyy.com',1,''),(82,49,'www.szxieheyy.com',1,''),(83,39,'3g.szxieheyy.com',1,''),(84,61,'xh.szxieheyy.com',1,''),(85,70,'a.szxieheyy.com',1,''),(86,70,'sz.szxieheyy.com',0,''),(87,49,'4g.szxieheyy.com',0,''),(88,49,'wap.szxieheyy.com',0,''),(89,49,'nk.szxieheyy.com',0,''),(90,49,'zc.szxieheyy.com',0,''),(91,49,'fk.szxieheyy.com',0,''),(92,49,'gc.szxieheyy.com',0,''),(93,21,'www.yzltyy.cn',1,'nk.yzlt120.com yzltyy.cn www.yzltyy.cn'),(94,60,'wap.yzltyy.cn',1,'wap.yzlt120.com wap.yzltyy.cn'),(95,70,'pp.yzltyy.cn',1,''),(96,49,'fk.yzltyy.cn',1,''),(97,49,'m.yzltyy.cn',1,''),(98,14,'m.0511woman.com',1,'m.dypfyy.com m.0511woman.com'),(99,49,'www.0511woman.com',1,''),(100,57,'ycyy.0523yy.com',0,''),(101,58,'wfnk.0523yy.com',0,''),(102,15,'tzgcyy.0523yy.com',0,''),(103,40,'bdf.0523yy.com',0,''),(104,16,'bak4.0523yy.com',0,''),(105,28,'bak3.0523yy.com',0,''),(106,47,'bak2.0523yy.com',0,''),(107,26,'bak1.0523yy.com',0,''),(108,26,'3g.0523yy.com',0,''),(109,26,'adminn.0523yy.com',0,''),(110,26,'ycyjs.0523yy.com',0,''),(111,26,'yc.0523yy.com',0,''),(112,26,'wap.0523yy.com',0,''),(113,26,'tzpfyy.0523yy.com',0,''),(114,26,'tzpf.0523yy.com',0,''),(115,26,'nk.0523yy.com',0,''),(116,26,'4g.0523yy.com',0,''),(117,26,'www.0523yy.com',0,''),(118,49,'m.0523yy.com',0,''),(119,15,'sgm.yxbayy120.com',0,''),(120,16,'sg.yxbayy120.com',0,''),(121,15,'4g.yxbayy120.com',0,''),(122,6,'gc.yxbayy120.com',0,''),(123,6,'wap.yxbayy120.com',0,''),(124,15,'www.yxbayy120.com',0,''),(125,16,'3g.yxbayy120.com',0,''),(126,16,'mgc.yxbayy120.com',1,''),(127,49,'m.yxbayy120.com',0,''),(128,5,'4g.cszhongshan.com',0,''),(129,51,'crm.cszhongshan.com',0,''),(130,5,'wap.cszhongshan.com',0,''),(131,4,'www.cszhongshan.com',0,''),(132,49,'m.cszhongshan.com',0,''),(133,17,'m.83359999.com',0,''),(134,17,'mnk.83359999.com',0,''),(135,16,'mgc.83359999.com',0,''),(136,6,'gc.83359999.com',0,'gc.83359999.com gc.changzheng120.com'),(137,49,'app.83359999.com',0,''),(138,6,'3gfk.83359999.com',0,''),(139,14,'fk.83359999.com',0,''),(140,40,'nk.83359999.com',0,''),(141,6,'4g.83359999.com',0,''),(142,15,'3g.83359999.com',0,''),(143,14,'www.83359999.com',0,''),(144,49,'wap.83359999.com',0,''),(145,17,'wap.dysg.org',1,''),(146,17,'zh.dysg.org',1,''),(147,49,'fk.dysg.org',0,''),(148,49,'www.dysg.org',0,''),(149,39,'pf.dysg.org',0,''),(150,40,'gk.dysg.org',0,''),(151,40,'guke.dysg.org',0,''),(152,63,'dpisj.dysg.org',0,''),(153,63,'nk.dysg.org',0,''),(154,58,'gksj.dysg.org',0,''),(155,58,'tsks.dysg.org',0,''),(156,49,'sggc.dysg.org',0,''),(157,49,'sgnk.dysg.org',0,''),(158,49,'sgzx.dysg.org',0,''),(159,49,'sgyz.dysg.org',0,''),(160,49,'sgrl.dysg.org',0,''),(161,49,'sgfk.dysg.org',0,''),(162,49,'sggj.dysg.org',0,''),(163,49,'sgby.dysg.org',0,''),(164,49,'m.dysg.org',0,''),(165,17,'msg.changzheng120.com',1,''),(166,17,'sg.changzheng120.com',1,''),(167,17,'4g.changzheng120.com',1,''),(168,5,'0511.changzheng120.com',1,''),(169,6,'gc.changzheng120.com',1,'gc.83359999.com gc.changzheng120.com'),(170,71,'fk.changzheng120.com',1,''),(171,14,'nk.changzheng120.com',1,'nk.changzheng120.com www.changzheng120.com changzheng120.com'),(172,15,'3g.changzheng120.com',1,''),(173,68,'wap.changzheng120.com',1,''),(174,14,'www.changzheng120.com',1,'nk.changzheng120.com www.changzheng120.com'),(175,49,'dyguke.changzheng120.com',1,''),(176,49,'dysgby.changzheng120.com',1,''),(177,49,'dysgfk.changzheng120.com',1,''),(178,49,'dysggc.changzheng120.com',1,''),(179,49,'dysgnk.changzheng120.com',1,''),(180,49,'dysgzx.changzheng120.com',1,''),(181,49,'dysgyz.changzheng120.com',1,''),(182,49,'dysgrl.changzheng120.com',1,''),(183,49,'dysggj.changzheng120.com',1,''),(184,49,'dygc.changzheng120.com',1,''),(185,49,'dynk.changzheng120.com',1,''),(186,70,'pp.changzheng120.com',1,''),(187,49,'dyzx.changzheng120.com',1,''),(188,49,'dyyz.changzheng120.com',1,''),(189,49,'dyrl.changzheng120.com',1,''),(190,49,'dygj.changzheng120.com',1,''),(191,49,'dyby.changzheng120.com',1,''),(192,49,'m.changzheng120.com',1,''),(193,49,'dyfk.changzheng120.com',1,''),(194,49,'dy.changzheng120.com',1,''),(195,49,'dym.changzheng120.com',1,''),(196,39,'pf.dysgyy.net',0,''),(197,39,'120.dysgyy.net',1,''),(198,68,'fk120.dysgyy.net',0,''),(199,63,'pfb.dysgyy.net',0,''),(200,63,'pm.dysgyy.net',0,''),(201,61,'wap.dysgyy.net',0,''),(202,61,'zx.dysgyy.net',0,''),(203,49,'www.dysgyy.net',0,''),(204,49,'fk.dysgyy.net',0,''),(205,17,'fk.tlhsyy.com',1,''),(206,17,'nanke.tlhsyy.com',1,''),(207,17,'c.tlhsyy.com',1,''),(208,17,'b.tlhsyy.com',1,''),(209,17,'a.tlhsyy.com',1,''),(210,39,'www.tlhsyy.com',1,''),(211,66,'wap.tznke.com',0,''),(212,49,'m.tznke.com',0,''),(213,46,'crm.tznke.com',0,''),(214,72,'yetc.tznke.com',0,''),(215,39,'tzgcyy.tznke.com',0,''),(216,26,'nk.tznke.com',0,''),(217,26,'3g.tznke.com',0,''),(218,26,'www.tznke.com',0,''),(219,26,'bak.tznke.com',0,''),(220,26,'nkbak.tznke.com',0,''),(221,49,'mbak.tznke.com',0,''),(222,43,'4gbak.tznke.com',0,''),(223,60,'pybak.tznke.com',0,''),(224,70,'pp.tznke.com',0,''),(225,44,'m.yzlt120.com',1,''),(226,28,'www.yzlt120.com',1,''),(227,57,'wap.yzlt120.com',1,'wap.yzlt120.com wap.yzltyy.cn'),(228,15,'nk.yzlt120.com',1,'nk.yzlt120.com yzltyy.cn www.yzltyy.cn'),(229,16,'4g.yzlt120.com',1,''),(230,16,'www.yzltnk.com',0,''),(231,49,'wap.yzltnk.com',0,''),(232,6,'nk.yzltnk.com',0,'nk.yzltnk.com kqnk.yzltnk.com'),(233,49,'m.yzltnk.com',0,''),(234,6,'kqnk.yzltnk.com',0,'nk.yzltnk.com kqnk.yzltnk.com'),(235,16,'kq4g.yzltnk.com',0,'4g.yzltnk.com kq4g.yzltnk.com'),(236,49,'fk.yzltnk.com',0,''),(237,72,'ffs.yzltnk.com',0,''),(238,44,'3g.yzltnk.com',0,''),(239,16,'4g.yzltnk.com',0,'4g.yzltnk.com kq4g.yzltnk.com'),(240,69,'wap.dypfzk.com',0,'wap.dypfyy.com wap.dypfzk.com'),(241,69,'www.dypfzk.com',0,'www.dypfyy.com dypfyy.com pc.dypfzk.com www.dypfzk.com dypfzk.com'),(242,69,'pc.dypfzk.com',0,'www.dypfyy.com dypfyy.com pc.dypfzk.com'),(243,64,'jsnre.jswh120.com',0,''),(244,64,'sgm.jswh120.com',0,''),(245,64,'ss.jswh120.com',0,'m.njwhgb.com ss.jswh120.com nj.jswhgb.com'),(246,66,'nk.jswh120.com',0,''),(247,66,'m.jswh120.com',0,''),(248,66,'www.jswh120.com',0,''),(249,64,'jsnre.jswhgb.com',0,''),(250,64,'360m.jswhgb.com',0,''),(251,64,'nj.jswhgb.com',0,'m.njwhgb.com ss.jswh120.com nj.jswhgb.com'),(252,66,'nk.jswhgb.com',0,''),(253,66,'m.jswhgb.com',0,''),(254,66,'www.jswhgb.com',0,''),(255,17,'sgpc.lygnjnk.cn',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(256,17,'39nk.lygnjnk.cn',0,'39nk.lygnjnk.cn 120ask.nj0518.com'),(257,17,'sgmo.lygnjnk.cn',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(258,17,'www.lygnjnk.cn',0,'www.lygnjnk.cn lygnjnk.cn www.nakeyy.cn nakeyy.cn'),(259,17,'m.lygnjnk.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(260,17,'sgpc.nakeyy.cn',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(261,17,'sgmo.nakeyy.cn',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(262,17,'www.nakeyy.cn',0,'www.lygnjnk.cn lygnjnk.cn www.nakeyy.cn nakeyy.cn'),(263,17,'m.nakeyy.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(264,62,'bdpc.lygnk.cn',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(265,62,'bdmo.lygnk.cn',0,'bdmo.lygnk.cn的项目是bdmo.njnankyy.com（61.155.150.192）'),(266,17,'www.lygnk.cn',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(267,17,'m.lygnk.cn',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(268,17,'www.njnakeyy.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(269,17,'m.njnakeyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(270,17,'bdpc.njnankyy.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(271,69,'bdmo.njnankyy.com',0,''),(272,17,'www.njnankyy.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(273,17,'m.njnankyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(274,17,'mgc.lyjfyy.com',0,''),(275,17,'gc.lyjfyy.com',0,''),(276,17,'mnk.lyjfyy.com',0,'mnk.120lyjf.com mnk.lyjfyy.com'),(277,17,'mfk.lyjfyy.com',0,''),(278,17,'nk.lyjfyy.com',0,''),(279,17,'fuke.lyjfyy.com',0,''),(280,17,'m.lyjfyy.com',0,''),(281,17,'www.lyjfyy.com',0,''),(282,69,'wap.tzpfbzk.com',1,'CDN加速'),(283,69,'www.tzpfbzk.com',1,'CDN加速   www.tzpfb.cn tzpfb.cn www.tzpfbzk.com tzpfbzk.com'),(284,63,'www.gytjnk.cn',0,'www.gytjyy120.com gytjyy120.com www.gytjnk.cn gytjnk.cn www.tjnk120.cn tjnk120.cn'),(285,63,'sg.tjnk120.cn',0,''),(286,27,'3g.tjnk120.cn',0,'3g.gytjyy120.com 3g.tjnk120.cn'),(287,63,'www.tjnk120.cn',0,'www.gytjyy120.com gytjyy120.com www.gytjnk.cn gytjnk.cn www.tjnk120.cn tjnk120.cn'),(288,15,'4g.tj0514.com',0,''),(289,15,'m.tj0514.com',0,''),(290,15,'3g.tj0514.com',0,''),(291,64,'www.tj0514.com',0,'nk.gytjyy120.com www.tj0514.com tj0514.com'),(292,17,'360pc.0518njyy.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(293,17,'bdpc.0518njyy.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(294,17,'360mo.0518njyy.com',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(295,17,'m.0518njyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(296,17,'wap.0518njyy.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(297,17,'www.0518njyy.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(298,61,'www.dysgzxmr.com',0,''),(299,61,'m.dysgzxmr.com',0,''),(300,67,'m.0513hxyy.com',0,''),(301,67,'www.0513hxyy.com',0,''),(302,17,'www.qdhuaxiayy.com',0,''),(303,17,'www.qdhxyy.cn',0,''),(304,17,'4g.qdhxyy.cn',0,''),(305,17,'4rd.hnlj120.com',0,''),(306,64,'www.hnlj120.com',0,''),(307,64,'m.hnlj120.com',0,''),(308,64,'mgc.jyhwyy.com',0,''),(309,64,'fk.jyhwyy.com',0,''),(310,64,'nk.jyhwyy.com',0,''),(311,64,'wap.jyhwyy.com',0,''),(312,64,'www.jyhwyy.com',0,''),(313,64,'fk.jyhw120.com',0,''),(314,64,'nk.jyhw120.com',0,''),(315,64,'wap.jyhw120.com',0,''),(316,64,'www.jyhw120.com',0,''),(317,61,'3g.hmzx0511.com',0,''),(318,61,'4g.hmzx0511.com',0,'4g.hm0511.com 4g.zjhmzxyy.com 4g.hmzx0511.com'),(319,61,'wap.hmzx0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(320,61,'www.hmzx0511.com',0,'www.hm0511.com hm0511.com www.zjhm0511.com zjhm0511.com hmzx0511.com www.hmzx0511.com 项目zjhmzxyy.com'),(321,61,'5g.zjhm0511.com',0,''),(322,61,'www.zjhm0511.com',0,'www.hm0511.com hm0511.com www.zjhm0511.com zjhm0511.com hmzx0511.com www.hmzx0511.com 项目zjhmzxyy.com'),(323,61,'wap.zjhm0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(324,64,'www.phhqjk.com',0,''),(325,64,'4g.phhqjk.com',0,''),(326,61,'4g.0635hmzx.com',0,'4g.lchmzxyy.com 4g.lchmzxmr.com 4g.0635hmzx.com 项目 4g.lchmzxmryy.com'),(327,61,'m.0635hmzx.com',0,'m.lchmzxyy.com m.lchmzxmr.com m.0635hmzx.com 项目m.lchmzxmryy.com'),(328,66,'wap.0635hmzx.com',0,'wap.lchmzxyy.com wap.lchmzxmr.com wap.0635hmzx.com'),(329,66,'www.0635hmzx.com',0,''),(330,69,'www.lchmzxmryy.com',1,'CDN加速'),(331,69,'m.lchmzxmryy.com',1,'CDN加速'),(332,69,'wap.lchmzxmryy.com',1,'CDN加速'),(333,69,'4g.lchmzxmryy.com',1,'CDN加速'),(334,69,'5g.lchmzxmryy.com',1,'CDN加速'),(335,61,'4g.lchmzxmr.com',0,'4g.lchmzxyy.com 4g.lchmzxmr.com 4g.0635hmzx.com 项目 4g.lchmzxmryy.com'),(336,61,'m.lchmzxmr.com',0,'m.lchmzxyy.com m.lchmzxmr.com m.0635hmzx.com 项目m.lchmzxmryy.com'),(337,66,'wap.lchmzxmr.com',0,'wap.lchmzxyy.com wap.lchmzxmr.com wap.0635hmzx.com'),(338,66,'www.lchmzxmr.com',0,''),(339,61,'4g.lchmzxyy.com',0,'4g.lchmzxyy.com 4g.lchmzxmr.com 4g.0635hmzx.com 项目 4g.lchmzxmryy.com'),(340,61,'m.lchmzxyy.com',0,'m.lchmzxyy.com m.lchmzxmr.com m.0635hmzx.com 项目m.lchmzxmryy.com'),(341,66,'wap.lchmzxyy.com',0,'wap.lchmzxyy.com wap.lchmzxmr.com wap.0635hmzx.com'),(342,66,'www.lchmzxyy.com',0,''),(343,17,'3g.ganyutongjiyiyuan.com',0,''),(344,17,'www.ganyutongjiyiyuan.com',0,''),(345,14,'www.ganyutongji.com',0,''),(346,17,'wap.ganyutongji.cn',0,''),(347,17,'www.ganyutongji.cn',0,'www.ganyutongji.cn ganyutongji.cn tongji.qingzhifeng.com'),(348,66,'nk.cjyyfk.com',0,''),(349,66,'3g.cjyyfk.com',0,'m.cjnkyy.cn 3g.cjyyfk.com'),(350,61,'m.cjyyfk.com',0,'m.cjyyfk.com m.cjyyfk.cn'),(351,66,'www.cjyyfk.com',0,'www.cjyyfk.com cjyyfk.com fuke.cjyyfk.cn'),(352,69,'m.lhxtzyy.com',1,'CDN加速'),(353,69,'www.lhxtzyy.com',1,'CDN加速'),(354,17,'wap.lhxtzyy.com',0,''),(355,61,'www.lhxtnk.com',0,''),(356,63,'m.lhxtnk.com',0,''),(357,26,'www.jrtjyy.com',0,''),(358,26,'fk.jrtjyy.com',0,''),(359,61,'nk.jrtjyy.com',0,''),(360,69,'www.zjhmzxyy.com',1,'CDN加速'),(361,69,'3g.zjhmzxyy.com',1,'CDN加速 wap.zjhmzxyy.com'),(362,61,'wap.zjhmzxyy.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(363,61,'sougou.zjhmzxyy.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(364,61,'4g.zjhmzxyy.com',0,'4g.hm0511.com 4g.zjhmzxyy.com 4g.hmzx0511.com'),(365,61,'lchm.zjhmzxyy.com',0,''),(366,61,'360.hm0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(367,61,'4g.hm0511.com',0,'4g.hm0511.com 4g.zjhmzxyy.com 4g.hmzx0511.com'),(368,61,'wap.hm0511.com',0,'wap.zjhmzxyy.com wap.hm0511.com wap.zjhm0511.com wap.hmzx0511.com sougou.zjhmzxyy.com 360.hm0511.com'),(369,61,'www.hm0511.com',0,'www.hm0511.com hm0511.com www.zjhm0511.com zjhm0511.com hmzx0511.com www.hmzx0511.com 项目zjhmzxyy.com'),(370,61,'4g.jttjyy.net',0,''),(371,61,'3g.jttjyy.net',0,''),(372,61,'m.jttjyy.net',0,''),(373,61,'www.jttjyy.net',0,''),(374,17,'www.phyy120.com',0,''),(375,17,'www.phyy120.cn',0,''),(376,15,'a.csdffkyy.com',0,''),(377,15,'b.csdffkyy.com',0,''),(378,15,'c.csdffkyy.com',0,''),(379,17,'wap.csdffkyy.com',0,''),(380,17,'fuke.csdffkyy.com',0,''),(381,17,'gc.csdffkyy.com',0,''),(382,17,'mgc.csdffkyy.com',0,''),(383,17,'www.csdffkyy.com',0,''),(384,61,'www.phhqyy.com',0,''),(385,61,'4g.phhqyy.com',0,''),(386,61,'4g.phhqyy.cn',0,''),(387,61,'www.phhqyy.cn',0,''),(388,17,'www.zjcznk.com',0,''),(389,17,'m.zjcznk.com',0,''),(390,63,'0514.gytjyy120.com',0,''),(391,27,'3g.gytjyy120.com',0,'3g.gytjyy120.com 3g.tjnk120.cn'),(392,64,'nk.gytjyy120.com',0,'nk.gytjyy120.com www.tj0514.com tj0514.com'),(393,63,'tt.gytjyy120.com',0,''),(394,63,'www.gytjyy120.com',0,'www.gytjyy120.com  www.gytjnk.cn gytjnk.cn www.tjnk120.cn tjnk120.cn'),(395,63,'m.gytjyy120.com',0,''),(396,5,'gc.qdhx120.com',0,''),(397,70,'qd.qdhx120.com',0,''),(398,4,'3g.qdhx120.com',0,''),(399,70,'a.qdhx120.com',0,''),(400,4,'nkyd.qdhx120.com',0,'m.qdhx120.com m.qdys120.com nkyd.qdhx120.com'),(401,4,'nkpc.qdhx120.com',0,'www.qdhx120.com www.qdys120.com qdys120.com nkpc.qdhx120.com'),(402,4,'m.qdhx120.com',0,'m.qdhx120.com m.qdys120.com nkyd.qdhx120.com'),(403,4,'www.qdhx120.com',0,'www.qdhx120.com www.qdys120.com qdys120.com nkpc.qdhx120.com'),(404,6,'nk.qdhx120.com',0,''),(405,4,'4g.qdhx120.com',0,''),(406,4,'3g.qdys120.com',0,''),(407,4,'www.qdys120.com',0,'www.qdhx120.com www.qdys120.com qdys120.com nkpc.qdhx120.com'),(408,4,'m.qdys120.com',0,'m.qdhx120.com m.qdys120.com nkyd.qdhx120.com'),(409,4,'nk.qdys120.com',0,''),(410,4,'4g.qdys120.com',0,''),(411,69,'www.csdfnzyy.com',1,'CDN加速'),(412,15,'mfrd.csdfnzyy.com',0,''),(413,15,'frd.csdfnzyy.com',0,''),(414,63,'wap.csdfnzyy.com',0,'fk.csdfnzyy.com wap.csdfnzyy.com'),(415,73,'swt.csdfnzyy.com',0,''),(416,61,'fuke.csdfnzyy.com',0,''),(417,63,'fk.csdfnzyy.com',0,'fk.csdfnzyy.com wap.csdfnzyy.com'),(418,63,'gc.csdfnzyy.com',0,''),(419,63,'mgc.csdfnzyy.com',0,''),(420,63,'m.dypfyy.cn',0,''),(421,63,'www.dypfyy.cn',0,''),(422,40,'www.wyxygyy.cn',0,''),(423,5,'nk.wyxygyy.com',0,''),(424,6,'fk.wyxygyy.com',0,''),(425,4,'www.wyxygyy.com',0,''),(426,6,'4g.wyxygyy.com',0,''),(427,6,'4g.wyxyg120.com',0,''),(428,5,'fk.wyxyg120.com',0,''),(429,6,'nk.wyxyg120.com',0,''),(430,6,'www.wyxyg120.com',0,''),(431,17,'www.0579ygyy.com',0,''),(432,69,'wap.byytqyy.com',1,'CDN加速'),(433,69,'www.byytqyy.com',1,'CDN加速'),(434,4,'3g.byytqyy.com',0,''),(435,6,'myc.byytqyy.com',0,''),(436,4,'m.byytqyy.com',0,''),(437,28,'www.lyxdyy120.com',0,''),(438,4,'pcnk.hxfk120.cn',0,''),(439,17,'m.hxfk120.cn',0,''),(440,4,'xh.hxfk120.cn',0,''),(441,4,'nk.hxfk120.cn',0,''),(442,4,'4g.hxfk120.cn',0,''),(443,4,'www.hxfk120.cn',0,''),(444,2,'www.hxxhyy.cn',0,''),(445,2,'m.hxxhyy.cn',0,''),(446,28,'www.jttj120.com',0,''),(447,63,'dywap.dfpfyy.com',0,''),(448,28,'dypf.dfpfyy.com',0,''),(449,28,'ai.dfpfyy.com',0,''),(450,74,'3g.dfpfyy.com',0,''),(451,28,'www.dfpfyy.com',0,''),(452,28,'m.dfpfyy.com',0,''),(453,28,'www.zjgnkyy.cn',0,''),(454,28,'www.wcnke.cn',0,''),(455,28,'www.xcjl120.com',0,''),(456,40,'www.hxxhyy.com',0,''),(457,5,'3g.0555xhyy.com',0,''),(458,5,'www.0555xhyy.com',0,''),(459,6,'www.xhfkyy120.com',0,''),(460,57,'3g.0512csfk.com',0,''),(461,57,'www.0512csfk.com',0,''),(462,40,'wap.0512csfk.com',0,''),(463,25,'5g.tzhmzx.com',0,''),(464,69,'m.tzhmzx.com',1,'CDN加速'),(465,69,'zxmr.tzhmzx.com',1,'CDN加速'),(466,69,'www.tzhmzx.com',0,'www.tzhmzx.com www.tzhmmr.com www.tzhmgj.com'),(467,25,'swt.tzhmzx.com',0,''),(468,25,'zx.tzhmzx.com',0,'zx.tzhmmr.com zx.tzhmgj.com zx.tzhmzx.com'),(469,76,'www.tzhmyy.com',0,''),(470,76,'m.tzhmyy.com',0,''),(471,25,'5g.tzhmmr.com',0,''),(472,25,'wap.tzhmmr.com',0,'wap.tzhmgj.com wap.tzhmmr.com 项目wap.tzhmzx.com'),(473,25,'zx.tzhmmr.com',0,'zx.tzhmmr.com zx.tzhmgj.com  zx.tzhmzx.com'),(474,25,'www.tzhmmr.com',0,'www.tzhmzx.com www.tzhmmr.com www.tzhmgj.com'),(475,25,'m.tzhmmr.com',0,'m.tzhmmr.com m.tzhmgj.com 项目m.tzhmzx.com'),(476,25,'fbd3.tzhmgj.com',0,''),(477,25,'5g.tzhmgj.com',0,''),(478,25,'fbd1.tzhmgj.com',0,''),(479,25,'fbd2.tzhmgj.com',0,''),(480,25,'wap.tzhmgj.com',0,'wap.tzhmgj.com wap.tzhmmr.com 项目wap.tzhmzx.com'),(481,25,'zx.tzhmgj.com',0,'zx.tzhmmr.com zx.tzhmgj.com zx.tzhmzx.com'),(482,25,'www.tzhmgj.com',0,'www.tzhmzx.com www.tzhmmr.com www.tzhmgj.com'),(483,25,'m.tzhmgj.com',0,'m.tzhmmr.com m.tzhmgj.com 项目m.tzhmzx.com'),(484,25,'wvvw.tzhmgj.com',0,''),(485,76,'www.0523mr.com',0,''),(486,76,'m.0523mr.com',0,''),(487,16,'www.81pfyy.com',0,''),(488,21,'m.81pfyy.com',0,''),(489,58,'www.tlhsfk.com',0,''),(490,61,'5g.dysgzxyy.com',0,''),(491,69,'wap.dysgzxyy.com',1,'CDN加速'),(492,69,'4g.dysgzxyy.com',1,'CDN加速'),(493,69,'www.dysgzxyy.com',1,'CDN加速'),(494,61,'pf.dysgzxyy.com',0,''),(495,63,'pfm.dysgzxyy.com',0,''),(496,63,'fkzx.dysgzxyy.com',0,''),(497,63,'fkby.dysgzxyy.com',0,''),(498,63,'fkgj.dysgzxyy.com',0,''),(499,63,'fkyz.dysgzxyy.com',0,''),(500,63,'fkrl.dysgzxyy.com',0,''),(501,63,'m.dysgzxyy.com',0,''),(502,63,'gc.dysgzxyy.com',0,''),(503,63,'gk.dysgzxyy.com',0,''),(504,63,'fk.dysgzxyy.com',0,''),(505,63,'nk.dysgzxyy.com',0,''),(506,63,'ai.dysgzxyy.com',0,''),(507,47,'www.tlhsnk.com',0,''),(508,7,'www.0523gcyy.com',0,''),(509,63,'sgw.tzpfyy.cn',0,''),(510,66,'new.tzpfyy.cn',0,''),(511,63,'sm.tzpfyy.cn',0,''),(512,63,'wap.tzpfyy.cn',0,'m.tzpfyy.cn wap.tzpfyy.cn'),(513,28,'sg.tzpfyy.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(514,73,'swt.tzpfyy.cn',0,''),(515,57,'yc.tzpfyy.cn',0,''),(516,63,'m.tzpfyy.cn',0,'m.tzpfyy.cn wap.tzpfyy.cn'),(517,28,'ai.tzpfyy.cn',0,'ai.tzpfyy.cn、pf.tzpfyy.cn共用一个后台'),(518,28,'pf.tzpfyy.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(519,28,'www.tzpfyy.cn',0,'www.tzpfyy.cn tzpfyy.cn pf.tzpfyy.cn sg.tzpfyy.cn sg.tzpfb.cn www.tzpfb.cn tzpfb.cn'),(520,47,'www.tzpfyy.net',0,''),(521,58,'www.tcxhnkyy.com',0,''),(522,58,'3g.tcxhnkyy.com',0,'m.tcxiehe.com 3g.tcxhnkyy.com'),(523,70,'jj.tcxhnkyy.com',0,''),(524,15,'www.jrtjnk.com',0,''),(525,15,'www.wjnk.org',0,''),(526,40,'www.wjnkyy.org',0,''),(527,15,'www.wjboai.cn',0,''),(528,15,'4g.wjboai.cn',0,''),(529,15,'m.0514tjyy.com',0,''),(530,27,'www.0514tjyy.com',0,''),(531,27,'www.0519jttj.com',0,''),(532,15,'3g.0519jttj.com',0,''),(533,27,'www.0519tjyy.cn',0,''),(534,28,'www.jttjyy.cn',0,''),(535,27,'m.gytjyy.cn',0,''),(536,27,'www.gytjyy.cn',0,''),(537,63,'m.gytjfk.com',0,''),(538,27,'www.gytjfk.com',0,''),(539,41,'c.tchsfk.com',0,''),(540,41,'b.tchsfk.com',0,''),(541,41,'a.tchsfk.com',0,''),(542,28,'www.tchsfk.com',0,''),(543,28,'www.53120888.com',0,''),(544,26,'nk.sznx120.com',0,''),(545,26,'120.sznx120.com',0,''),(546,26,'3g.sznx120.com',0,''),(547,66,'fk.sznx120.com',0,''),(548,28,'xh.sznx120.com',0,''),(549,57,'gc.sznx120.com',0,''),(550,15,'wap.sznx120.com',0,''),(551,28,'zc.sznx120.com',0,''),(552,28,'www.sznx120.com',0,''),(553,40,'m.sznx120.com',0,''),(554,57,'sg.wjbayy120.com',0,''),(555,57,'4g.wjbayy120.com',0,''),(556,57,'www.wjbayy120.com',0,''),(557,15,'3g.wjbayy120.com',0,''),(558,15,'wap.wjbayy120.com',0,''),(559,47,'sj.wjbayy120.com',0,''),(560,39,'m.wjbayy120.com',0,''),(561,73,'swt.sz120nk.com',0,''),(562,40,'m.sz120nk.com',0,''),(563,39,'www.sz120nk.com',0,''),(564,40,'3g.sz120fk.com',0,''),(565,40,'m.sz120fk.com',0,''),(566,39,'www.sz120fk.com',0,''),(567,58,'wap.zjczfk.com',0,''),(568,58,'mp.zjczfk.com',0,''),(569,58,'3g.zjczfk.com',0,''),(570,28,'www.zjczfk.com',0,''),(571,20,'fk.zjczfk.com',0,''),(572,20,'m.zjczfk.com',0,''),(573,58,'wap.tzgcyy.cn',0,''),(574,66,'3g.tzgcyy.cn',0,''),(575,58,'m.tzgcyy.cn',0,''),(576,28,'dypfm.tzgcyy.cn',0,'dypfm.tzgcyy.cn，m.dfpfyy.com'),(577,28,'dypf.tzgcyy.cn',0,'www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(578,28,'pfm.tzgcyy.cn',0,''),(579,28,'pf.tzgcyy.cn',0,''),(580,28,'ai.tzgcyy.cn',0,''),(581,28,'www.tzgcyy.cn',0,''),(582,39,'gc.tzgcyy.cn',0,''),(583,69,'wap.dypfyy.com',1,'CDN加速   wap.dypfyy.com wap.dypfzk.com'),(584,69,'www.dypfyy.com',1,'CDN加速   www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(585,63,'sgw.dypfyy.com',0,''),(586,63,'sm.dypfyy.com',0,''),(587,28,'sg.dypfyy.com',0,'www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(588,63,'m.dypfyy.com',0,'m.dypfyy.com m.0511woman.com'),(589,73,'swt.dypfyy.com',0,''),(590,28,'ai.dypfyy.com',0,''),(591,28,'pf.dypfyy.com',0,'www.dypfyy.com dypfyy.com pf.dypfyy.com dypf.tzgcyy.cn dypf.tzpfb.cn sg.dypfyy.com'),(592,15,'3g.jrbxyy.com',0,''),(593,58,'www.jrbxyy.com',0,''),(594,58,'nk.jrbxyy.com',0,''),(595,14,'m.jrbxyy.com',0,''),(596,27,'gc.jrbxyy.com',0,''),(597,27,'fk.jrbxyy.com',0,''),(598,39,'gk.jrbxyy.com',0,''),(599,66,'www.njwh120.com',0,''),(600,61,'m.njwh120.com',0,''),(601,23,'3g.njwh120.com',0,''),(602,5,'www.gytjyy.com',0,''),(603,4,'m.gytjyy.com',0,''),(604,55,'nk.gytjyy.com',0,''),(605,39,'3g.gytjyy.com',0,''),(606,57,'nk.xcjlyy.com',0,''),(607,57,'www.xcjlyy.com',0,''),(608,15,'3g.xcjlyy.com',0,''),(609,15,'m.xcjlyy.com',0,''),(610,69,'wap.4009999120.com',1,'CDN加速'),(611,69,'www.4009999120.com',1,'CDN加速'),(612,56,'m.4009999120.com',0,''),(613,56,'mbd.4009999120.com',0,''),(614,70,'pp.4009999120.com',0,''),(615,56,'yc.4009999120.com',0,''),(616,56,'bd.4009999120.com',0,''),(617,15,'www.tcxhnk.com',0,''),(618,15,'m.tcxhnk.com',0,''),(619,40,'wap.tcxhnk.com',0,''),(620,77,'nk.tcxhnk.com',0,''),(621,35,'wshh.tcxhnk.com',0,''),(622,28,'www.tcrlyy.com',0,''),(623,57,'www.jynke.com',0,''),(624,57,'bak.jynke.com',0,''),(625,68,'bak.jjnke.com',0,''),(626,68,'www.jjnke.com',0,''),(627,17,'www.ntrdrl.com',0,''),(628,69,'3g.rdjgnk.com',1,'CDN加速'),(629,69,'www.rdjgnk.com',1,'CDN加速'),(630,17,'m.rdjgnk.com',0,''),(631,17,'4g.rdjgnk.com',0,''),(632,17,'nk.rdjgnk.com',0,''),(633,17,'3g.rdnkjg.com',0,''),(634,17,'www.rdnkjg.com',0,''),(635,17,'www.ntrdfk.com',0,''),(636,17,'www.rdrlw.com',0,''),(637,17,'www.84522888.com',0,''),(638,15,'www.tzdfyy.cn',0,''),(639,15,'bak.tzdfyy.cn',0,''),(640,58,'www.tzdfyy.net',0,''),(641,70,'pp.tzdfyy.net',0,''),(642,69,'www.cszsyy.cn',1,'CDN加速'),(643,69,'3g.cszsyy.cn',1,'CDN加速'),(644,16,'wap.cszsyy.cn',0,''),(645,70,'jj.cszsyy.cn',0,''),(646,5,'nk.cszsyy.cn',0,''),(647,13,'bak.cszsyy.cn',0,''),(648,13,'crm.cszsyy.cn',0,''),(649,6,'m.cszsyy.cn',0,''),(650,60,'bak1.tzdf120.com',0,''),(651,68,'bak.tzdf120.com',0,''),(652,68,'www.tzdf120.com',0,''),(653,17,'fuke.csrlfk.com',0,''),(654,17,'3g.csrlfk.com',0,''),(655,57,'a.csrlfk.com',0,''),(656,57,'b.csrlfk.com',0,''),(657,57,'c.csrlfk.com',0,''),(658,15,'www.csrlfk.com',0,''),(659,13,'crm.csrlfk.com',0,''),(660,69,'dds1.czganglong.com',0,''),(661,78,'wmr.czganglong.com',0,''),(662,57,'nankektl120.czganglong.com',0,''),(663,58,'fktl120.czganglong.com',0,''),(664,58,'3wtlhsfk.czganglong.com',0,''),(665,16,'comet.czganglong.com',0,''),(666,15,'3wtl120.czganglong.com',0,''),(667,15,'nktl120.czganglong.com',0,''),(668,15,'mtchsyy.czganglong.com',0,''),(669,47,'3wtlhsnk.czganglong.com',0,''),(670,73,'swt.czganglong.com',0,''),(671,28,'by.czganglong.com',0,''),(672,28,'wxb.czganglong.com',0,''),(673,28,'pp.czganglong.com',0,''),(674,78,'s.czganglong.com',0,''),(675,70,'cc.tcxiehe.com',0,''),(676,66,'120.tcxiehe.com',0,''),(677,58,'m.tcxiehe.com',0,'m.tcxiehe.com 3g.tcxhnkyy.com'),(678,15,'4g.tcxiehe.com',0,''),(679,14,'nk.tcxiehe.com',0,''),(680,70,'pp.tcxiehe.com',0,''),(681,63,'www.tcxiehe.com',0,''),(682,63,'5g.tcxiehe.com',0,''),(683,26,'m.jrtj120.com',0,''),(684,58,'male.jrtj120.com',0,''),(685,58,'mfk.jrtj120.com',0,''),(686,58,'3g.jrtj120.com',0,''),(687,63,'mp.jrtj120.com',0,''),(688,63,'www.jrtj120.com',0,''),(689,63,'nk.jrtj120.com',0,''),(690,63,'wap.jrtj120.com',0,''),(691,63,'nanke.jrtj120.com',0,''),(692,77,'fk.jrtj120.com',0,''),(693,39,'mgc.jrtj120.com',0,''),(694,39,'gc.jrtj120.com',0,''),(695,79,'man.jrtj120.com',0,''),(696,80,'yzqlx.jrtj120.com',0,''),(697,80,'yzlt.jrtj120.com',0,''),(698,80,'yzgc.jrtj120.com',0,''),(699,80,'yzbp.jrtj120.com',0,''),(700,80,'zjgc.jrtj120.com',0,''),(701,80,'zjcz.jrtj120.com',0,''),(702,80,'zjbp.jrtj120.com',0,''),(703,80,'jrnk.jrtj120.com',0,''),(704,80,'jrrl.jrtj120.com',0,''),(705,80,'jrfk.jrtj120.com',0,''),(706,26,'m.jttjyy.com',0,''),(707,26,'www.jttjyy.com',0,''),(708,57,'4g.jttjyy.com',0,''),(709,57,'3g.jttjyy.com',0,''),(710,63,'gaofang.jttjyy.com',0,''),(711,17,'www.rdjgyy.com',0,''),(712,17,'www.rdnkyy.com',0,''),(713,64,'m.njgb120.com',0,''),(714,64,'smc.njgb120.com',0,''),(715,64,'jsnre.njgb120.com',0,''),(716,66,'www.njgb120.com',0,''),(717,66,'www.gbyy120.com',0,''),(718,64,'smc.gbyy120.com',0,''),(719,64,'sgm.gbyy120.com',0,''),(720,64,'jsnre.gbyy120.com',0,''),(721,64,'m.gbyy120.com',0,''),(722,73,'swt.gbyy120.com',0,''),(723,66,'www.njgbyy.com',0,''),(724,64,'jsnre.njgbyy.com',0,''),(725,64,'m.njgbyy.com',0,''),(726,69,'m.zjgwcyy.com',1,'CDN加速'),(727,69,'www.zjgwcyy.com',1,'CDN加速'),(728,5,'4g.zjgwcyy.com',0,''),(729,70,'pp.zjgwcyy.com',0,''),(730,4,'wap.zjgwcyy.com',0,''),(731,4,'nk.zjgwcyy.com',0,''),(732,4,'ftp.zjgwcyy.com',0,''),(733,81,'mail.zjgwcyy.com',0,''),(734,82,'www.njyahan.cn',0,''),(735,82,'www.yhzx025.com',0,''),(736,82,'www.yahanzx.com',0,''),(737,18,'5g.njyhzx.com',0,''),(738,18,'4g.njyhzx.com',0,'4g.025yahan.com 4g.njyhzx.com 4g.52177777.com'),(739,18,'wap.njyhzx.com',0,'wap.njyhzx.com m.52177777.com 项目m_025yahan'),(740,18,'zx.njyhzx.com',0,'www.52177777.com zx.025yahan.com  zx.njyhzx.com'),(741,69,'m.njyhzx.com',1,'CDN加速'),(742,69,'www.njyhzx.com',1,'CDN加速'),(743,83,'qb.njyhzx.com',0,''),(744,83,'xizhi.njyhzx.com',0,''),(745,18,'5g.52177777.com',0,''),(746,18,'m.52177777.com',0,'wap.njyhzx.com m.52177777.com 项目m_025yahan'),(747,18,'4g.52177777.com',0,'4g.025yahan.com 4g.njyhzx.com 4g.52177777.com'),(748,18,'www.52177777.com',0,'www.52177777.com  zx.025yahan.com  zx.njyhzx.com'),(749,18,'fbd3.025yahan.com',0,''),(750,69,'www.025yahan.com',1,'CDN加速'),(751,69,'m.025yahan.com',1,'CDN加速'),(752,18,'fbd2.025yahan.com',0,''),(753,18,'fbd1.025yahan.com',0,''),(754,18,'5g.025yahan.com',0,''),(755,18,'4g.025yahan.com',0,'4g.025yahan.com 4g.njyhzx.com 4g.52177777.com'),(756,18,'zx.025yahan.com',0,'www.52177777.com  zx.025yahan.com  zx.njyhzx.com'),(757,18,'oa.025yahan.com',0,''),(758,57,'wx.nuozhizhou.com',0,''),(759,57,'www.nuozhizhou.com',0,''),(760,57,'www.tcdryy.com',0,''),(761,57,'www.tcdr120.com',0,''),(762,69,'4g.dtzsyy.com',1,'CDN加速   4g.dtzsnk.com 4g.dtzsyy.com'),(763,6,'www.dtzsyy.com',0,''),(764,6,'m.dtzsyy.com',0,''),(765,69,'4g.dtzsnk.com',1,'CDN加速    4g.dtzsnk.com 4g.dtzsyy.com'),(766,69,'www.dtzsnk.com',1,'CDN加速'),(767,4,'m.xhnkyy.cn',0,''),(768,4,'www.xhnkyy.cn',0,''),(769,69,'qwap.syxymp.com',1,'CDN加速'),(770,57,'www.syxymp.com',0,''),(771,14,'m.tcxhzk.com',0,''),(772,14,'www.tcxhzk.com',0,''),(773,3,'www.duchang8.com',0,'www.duchang8.com duchang8.com bbs.duchang8.com'),(774,3,'bbs.duchang8.com',0,'www.duchang8.com duchang8.com bbs.duchang8.com'),(775,66,'www.cjnkyy.cn',0,'www.cjnkyy.cn  nk.cjyyfk.com'),(776,66,'www.cjtfyy.com',0,''),(777,66,'fk.changjiangfuke.com',0,''),(778,66,'m.changjiangfuke.com',0,''),(779,66,'mfk.changjiangfuke.com',0,''),(780,66,'www.changjiangfuke.com',0,''),(781,66,'m.cjnkyy.cn',0,'m.cjnkyy.cn 3g.cjyyfk.com'),(782,66,'m.cjtfyy.com',0,''),(783,66,'m.cjyyfs.com',0,'m.cjyyfs.com m.cjfsk.cn'),(784,66,'m.cjfsk.cn',0,'m.cjyyfs.com m.cjfsk.cn'),(785,26,'www.tzdfyy.com',0,''),(787,17,'120ask.nj0518.com',0,'39nk.lygnjnk.cn 120ask.nj0518.com  | 120ask.nj0518.com的原项目在61.155.150.192'),(788,17,'bdmo.lygnj120.com',0,'bdmo.lygnj120.com bdmo.0518njyy.com bdmo.nj0518.com'),(789,17,'bdmo.0518njyy.com',0,'bdmo.lygnj120.com bdmo.0518njyy.com bdmo.nj0518.com'),(790,17,'bdmo.nj0518.com',0,'bdmo.lygnj120.com bdmo.0518njyy.com bdmo.nj0518.com'),(791,17,'bdpc.nj0518.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(792,17,'bdpc.lygnj120.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(793,17,'sgpc.lygnj120.com',0,'bdpc.0518njyy.com bdpc.nj0518.com sgpc.lygnjnk.cn bdpc.lygnj120.com sgpc.lygnj120.com 360pc.0518njyy.com sgpc.nakeyy.cn bdpc.njnankyy.com bdpc.lygnk.cn'),(794,17,'m.lygnj120.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(795,17,'bdmo.lygnjmnk.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(796,17,'m.nj0518.com',0,'m.lygnj120.com wap.0518njyy.com bdmo.lygnjmnk.com m.0518njyy.com m.nj0518.com m.lygnjnk.cn m.lygnk.cn m.njnankyy.com m.nakeyy.cn m.njnakeyy.com'),(797,17,'sgmo.lygnj120.com',0,'sgmo.lygnjnk.cn sgmo.lygnj120.com sgmo.nakeyy.cn 360mo.0518njyy.com'),(798,17,'www.lygnj120.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(799,17,'www.nj0518.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(800,17,'www.lygnjmnk.com',0,'www.lygnj120.com lygnj120.com www.0518njyy.com 0518njyy.com nj0518.com www.nj0518.com www.lygnjmnk.com lygnjmnk.com  lygnk.cn www.lygnk.cn njnankyy.com www.njnankyy.com  njnakeyy.com www.njnakeyy.com'),(801,69,'wap.tzhmzx.com',1,''),(802,84,'m.cjyyfk.cn',0,''),(803,85,'www.0512csrl.com',0,''),(804,15,'wap.csrlzx.com',1,'wap.csrlzx.com wapzx.csrlyy.com wap.csrlzxyy.com'),(805,85,'wapzx.csrlyy.com',1,'wap.csrlzx.com wapzx.csrlyy.com wap.csrlzxyy.com'),(806,21,'wap.csrlzxyy.com',0,'wap.csrlzx.com wapzx.csrlyy.com wap.csrlzxyy.com'),(807,16,'www.cjyyfk.cn',1,''),(808,17,'mnk.120lyjf.com',0,'mnk.120lyjf.com mnk.lyjfyy.com'),(809,17,'tongji.qingzhifeng.com',0,'www.ganyutongji.cn ganyutongji.cn tongji.qingzhifeng.com'),(810,68,'www.97dx.com',0,''),(811,4,'wap.lcbd120.com',0,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(812,4,'4g.0635yy.com',0,'4g.0635yy.com wap.lcbdyy.com 4g.lcbdnk.com 4gzx.lcbdyy.com wap.lcbd120.com'),(813,4,'4g.csrlzx.com',0,''),(814,4,'www.csrlzx.com',0,'www.csrlzx.com csrlzx.com zx.csrlyy.com'),(815,6,'wvvw.dtzsyy.com',0,''),(816,6,'www.csrayy.com',0,''),(817,6,'www.csxhmz.com',0,''),(818,85,'www.cszxmr0512.com',0,'www.cszxmr0512.com cszxmr0512.com www.csrlyy.com csrlyy.com'),(819,85,'www.csrlyy.com',0,'www.cszxmr0512.com cszxmr0512.com www.csrlyy.com csrlyy.com'),(820,16,'www.yxsgyy.com',0,''),(821,16,'m.yxsgyy.com',0,''),(822,17,'mbd.rdnkjg.com',0,''),(823,69,'www.rdbayy.com',1,'CDN加速'),(824,61,'5g.hm0511.com',0,''),(825,61,'5g.zjhmzxyy.com',0,''),(826,58,'nk.zjczfk.com',0,''),(827,17,'m.dysghs.com',0,''),(828,17,'www.dysghs.com',0,'');
/*!40000 ALTER TABLE `xz_domain_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_guestbook`
--

DROP TABLE IF EXISTS `xz_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_guestbook`
--

LOCK TABLES `xz_guestbook` WRITE;
/*!40000 ALTER TABLE `xz_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_hospital`
--

DROP TABLE IF EXISTS `xz_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_hospital` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo',
  `profileimg` varchar(255) DEFAULT NULL,
  `ksimg` varchar(255) DEFAULT NULL,
  `gyimg` varchar(255) DEFAULT NULL,
  `hzimg` varchar(255) DEFAULT NULL,
  `profile` text COMMENT '医院简介',
  `banner` text,
  `creatime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_hospital`
--

LOCK TABLES `xz_hospital` WRITE;
/*!40000 ALTER TABLE `xz_hospital` DISABLE KEYS */;
INSERT INTO `xz_hospital` VALUES (1,'常州第一人民医院','4001235','江苏省常州市武进区','119.952837','31.790976','admin/20171110/5a055077721bd.png',NULL,NULL,NULL,NULL,'医院简介测试数据','[\"admin\\/20171110\\/5a0551d0cdaca.jpg\",\"admin\\/20171110\\/5a0564b9af921.jpg\",\"admin\\/20171110\\/5a0564b9da942.jpg\"]','2017-11-14 15:13:51'),(2,'常州港龙','15111111111','测试数据','12.123456789','151.12541254','admin/20171110/5a05545646b07.png',NULL,NULL,NULL,NULL,'测试数据','[\"admin\\/20171110\\/5a05550f3d7af.jpg\",\"admin\\/20171110\\/5a05550f5f950.jpg\"]','2017-11-10 15:28:22');
/*!40000 ALTER TABLE `xz_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_hospital_copy`
--

DROP TABLE IF EXISTS `xz_hospital_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_hospital_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo',
  `profileimg` varchar(255) DEFAULT NULL,
  `ksimg` varchar(255) DEFAULT NULL,
  `gyimg` varchar(255) DEFAULT NULL,
  `hzimg` varchar(255) DEFAULT NULL,
  `profile` text COMMENT '医院简介',
  `banner` text,
  `creatime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_hospital_copy`
--

LOCK TABLES `xz_hospital_copy` WRITE;
/*!40000 ALTER TABLE `xz_hospital_copy` DISABLE KEYS */;
INSERT INTO `xz_hospital_copy` VALUES (1,'常州第一人民医院','4001235','江苏省常州市武进区','119.952837','31.790976','admin/20171110/5a055077721bd.png','admin/20171114/5a0a98cb1ecda.jpg','admin/20171114/5a0a98dd8cba3.jpg','admin/20171114/5a0a98e7a6de9.jpg','admin/20171114/5a0a98f0a1282.jpg','<p><span style=\"color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\"> &nbsp; &nbsp;　　常州博爱医院是常州地区一所集预防、治疗、科研和学术交流于一体的现代化医院。多次受到上级部门的嘉奖和鼓励，经过多次考察审核，医院各方面实力得到了上级部门的肯定，成立常州市老科技工作者协会医学分会，并连续5年被评为3.15诚信满意单位。医院座落于青龙西路37-1号,九龙小商品市场往东1200米，环境幽静、交通方便。</span></p><p style=\"text-align:center\"><span style=\"color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\"><img src=\"https://ywj.ganglongyun.com/data/upload/ueditor/20171114/5a0aa56593088.jpg\" title=\"20140404084700170.jpg\" alt=\"20140404084700170.jpg\" width=\"390\" height=\"260\" style=\"width: 390px; height: 260px;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; white-space: normal;\"><strong style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\">一、中心简介——</span><span style=\"margin: 0px; padding: 0px; color: rgb(255, 0, 0);\">品牌博爱 服务龙城</span></strong></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; white-space: normal;\">　　常州博爱医院创建于二十世纪初期。在常州市卫生局的直接领导下，坚持以“病人为中心”，根据自身特点，发展科室。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; white-space: normal;\">　　医院党委坚持以“三个代表”重要思想为指导，坚持与时俱进，积极把握时代的脉搏，适应医疗市场的新变化、新需求，狠抓以深化改革，主任、质量建院，科技兴院，更新观念为主要内容的四项工程建设，不断创新管理机制和服务理念，大兴医生、名科、名院战略，形成了院有重点、科有所长、人有专长的良好格局。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; white-space: normal;\">　　医院致力打造一支人性丰满、技术过硬的医护队伍，倡导专业医疗、科技医疗、和谐医疗，提倡“用情服务、用心呵护”的服务理念，推行医务公开、治疗公开、价格公开，让广大的老百姓以平价医院的价格，享受高标准的医疗服务。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; white-space: normal;\"><span style=\"color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px;\">　　</span>管理上引进现代医院管理理念，进行标准化和规范化管理。医院严格执行省、市、区各种卫生管理规章制度，各职能管理部门不断加强质量安全管理，重视发挥医生的技术特点和丰富经验，有效地防范了医疗纠纷和事故的发生，使患者“治得放心，医得舒心”。 安全的医疗质量、和谐的医环境、专业的设备、高品质的管理，已成为博爱的色彩。</span></p><p style=\"text-align:center\"><img src=\"https://ywj.ganglongyun.com/data/upload/ueditor/20171114/5a0aa5cc5e89f.jpg\" title=\"20150203084749754.jpg\" alt=\"20150203084749754.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; white-space: normal;\"><span style=\"color: rgb(102, 102, 102); font-family: Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\"> &nbsp; &nbsp;　　迅速崛起的常州博爱医院正踏着与时俱进的节拍，迈着铿锵有力的步伐，凭借“做一台手术出一台好手术，看一个病人交一个朋友”的不懈追求，逐步赢得广大人民群众的信赖。</span></p><p style=\"text-align: center;\"><br/></p>','[\"admin\\/20171110\\/5a0551d0cdaca.jpg\",\"admin\\/20171110\\/5a0564b9af921.jpg\",\"admin\\/20171110\\/5a0564b9da942.jpg\"]','2017-11-15 08:42:43'),(2,'常州港龙','15111111111','测试数据','12.123456789','151.12541254','admin/20171110/5a05545646b07.png',NULL,NULL,NULL,NULL,'测试数据','[\"admin\\/20171110\\/5a05550f3d7af.jpg\",\"admin\\/20171110\\/5a05550f5f950.jpg\"]','2017-11-10 15:28:22');
/*!40000 ALTER TABLE `xz_hospital_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_ipadmin`
--

DROP TABLE IF EXISTS `xz_ipadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_ipadmin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `ipremark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_ipadmin`
--

LOCK TABLES `xz_ipadmin` WRITE;
/*!40000 ALTER TABLE `xz_ipadmin` DISABLE KEYS */;
INSERT INTO `xz_ipadmin` VALUES (2,'121.42.156.42','华北1'),(3,'114.55.144.40','华东1'),(4,'121.40.190.243','华东1'),(5,'115.29.223.185','华东1'),(6,'114.215.190.152','华东1'),(7,'139.196.15.49','华东2'),(8,'139.196.46.31','华东2'),(9,'139.196.15.119','华东2'),(10,'139.196.240.149','华东2'),(11,'139.196.188.241','华东2'),(12,'139.224.24.200','华东2'),(13,'139.196.49.198','华东2'),(14,'47.90.79.92','香港'),(15,'47.90.79.63','香港'),(16,'47.90.79.121','香港'),(17,'47.90.78.199',''),(18,'121.40.133.174','亚韩--华东1'),(19,'27.255.77.82',''),(20,'27.288.83.77',''),(21,'49.213.8.38',''),(22,'49.213.8.126',''),(23,'49.213.9.99',''),(24,'58.96.177.191',''),(25,'58.218.199.37',''),(26,'61.155.194.43',''),(27,'61.160.249.39',''),(28,'61.160.251.49',''),(29,'103.28.44.187',''),(30,'103.28.45.116',''),(31,'103.28.45.130',''),(32,'103.28.46.227',''),(33,'106.185.40.25',''),(34,'106.185.41.236',''),(35,'106.185.43.8',''),(36,'106.185.47.171',''),(37,'106.186.121.75',''),(38,'106.187.36.198',''),(39,'119.28.2.250','香港服务器，修改网站需打开Serv-U'),(40,'119.28.17.249',''),(41,'203.88.163.96',''),(42,'203.124.12.114',''),(43,'203.124.12.131',''),(44,'203.124.12.159',''),(45,'203.124.12.196',''),(46,'203.124.12.215',''),(47,'203.124.12.229',''),(48,'211.42.249.47',''),(49,'211.152.51.148',''),(50,'218.98.35.181',''),(51,'222.186.9.77',''),(52,'222.186.41.70',''),(53,'223.4.204.214',''),(54,'223.4.208.52',''),(55,'223.4.211.196',''),(56,'14.17.81.26',''),(57,'47.90.79.154',''),(58,'47.90.79.166',''),(59,'49.213.8.85',''),(60,'49.213.8.95',''),(61,'58.211.73.248',''),(62,'61.155.150.192',''),(63,'61.155.161.243',''),(64,'61.155.173.250',''),(65,'61.155.202.41',''),(66,'61.155.214.33',''),(67,'119.28.20.97',''),(68,'180.150.227.9',''),(69,'43.227.196.97',''),(70,'116.255.169.119',''),(71,'59.188.233.148',''),(72,'222.189.239.151',''),(73,'103.28.46.117',''),(74,'103.6.222.49',''),(75,'112.85.219.131',''),(76,'58.218.211.197',''),(77,'27.255.83.77',''),(78,'61.160.251.46',''),(79,'218.65.30.68',''),(80,'118.244.168.44',''),(81,'58.68.254.21',''),(82,'211.149.236.231',''),(83,'121.40.254.10',''),(84,'58.211.137.222',''),(85,'106.14.238.14',''),(87,'60.174.237.174',''),(88,'60.174.237.163',''),(89,'43.277.196.97',NULL);
/*!40000 ALTER TABLE `xz_ipadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_ipadmin_copy`
--

DROP TABLE IF EXISTS `xz_ipadmin_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_ipadmin_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `ipremark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_ipadmin_copy`
--

LOCK TABLES `xz_ipadmin_copy` WRITE;
/*!40000 ALTER TABLE `xz_ipadmin_copy` DISABLE KEYS */;
INSERT INTO `xz_ipadmin_copy` VALUES (2,'121.42.156.42','华北1'),(3,'114.55.144.40','华东1'),(4,'121.40.190.243','华东1'),(5,'115.29.223.185','华东1'),(6,'114.215.190.152','华东1'),(7,'139.196.15.49','华东2'),(8,'139.196.46.31','华东2'),(9,'139.196.15.119','华东2'),(10,'139.196.240.149','华东2'),(11,'139.196.188.241','华东2'),(12,'139.224.24.200','华东2'),(13,'139.196.49.198','华东2'),(14,'47.90.79.92','香港'),(15,'47.90.79.63','香港'),(16,'47.90.79.121','香港'),(17,'47.90.78.199',''),(18,'121.40.133.174','亚韩--华东1'),(19,'27.255.77.82',''),(20,'27.288.83.77',''),(21,'49.213.8.38',''),(22,'49.213.8.126',''),(23,'49.213.9.99',''),(24,'58.96.177.191',''),(25,'58.218.199.37',''),(26,'61.155.194.43',''),(27,'61.160.249.39',''),(28,'61.160.251.49',''),(29,'103.28.44.187',''),(30,'103.28.45.116',''),(31,'103.28.45.130',''),(32,'103.28.46.227',''),(33,'106.185.40.25',''),(34,'106.185.41.236',''),(35,'106.185.43.8',''),(36,'106.185.47.171',''),(37,'106.186.121.75',''),(38,'106.187.36.198',''),(39,'119.28.2.250',''),(40,'119.28.17.249',''),(41,'203.88.163.96',''),(42,'203.124.12.114',''),(43,'203.124.12.131',''),(44,'203.124.12.159',''),(45,'203.124.12.196',''),(46,'203.124.12.215',''),(47,'203.124.12.229',''),(48,'211.42.249.47',''),(49,'211.152.51.148',''),(50,'218.98.35.181',''),(51,'222.186.9.77',''),(52,'222.186.41.70',''),(53,'223.4.204.214',''),(54,'223.4.208.52',''),(55,'223.4.211.196',''),(56,'14.17.81.26',''),(57,'47.90.79.154',''),(58,'47.90.79.166',''),(59,'49.213.8.85',''),(60,'49.213.8.95',''),(61,'58.211.73.248',''),(62,'61.155.150.192',''),(63,'61.155.161.243',''),(64,'61.155.173.250',''),(65,'61.155.202.41',''),(66,'61.155.214.33',''),(67,'119.28.20.97',''),(68,'180.150.227.9',''),(69,'43.227.196.97',''),(70,'116.255.169.119',''),(71,'59.188.233.148',''),(72,'222.189.239.151',''),(73,'103.28.46.117',''),(74,'103.6.222.49',''),(75,'112.85.219.131',''),(76,'58.218.211.197',''),(77,'27.255.83.77',''),(78,'61.160.251.46',''),(79,'218.65.30.68',''),(80,'118.244.168.44',''),(81,'58.68.254.21',''),(82,'211.149.236.231',''),(83,'121.40.254.10',''),(84,'58.211.137.222',''),(85,'106.14.238.14','');
/*!40000 ALTER TABLE `xz_ipadmin_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_lanmu`
--

DROP TABLE IF EXISTS `xz_lanmu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_lanmu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hospitalid` int(10) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `ico` varchar(100) DEFAULT NULL,
  `adphotos` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_lanmu`
--

LOCK TABLES `xz_lanmu` WRITE;
/*!40000 ALTER TABLE `xz_lanmu` DISABLE KEYS */;
INSERT INTO `xz_lanmu` VALUES (1,1,'塑沟丰胸','admin/20171107/5a015096d71fc.jpg','[\"admin\\/20171107\\/5a01508a0b941.jpg\",\"admin\\/20171107\\/5a01508a684e4.jpg\",\"admin\\/20171107\\/5a01508a7852d.jpg\",\"admin\\/20171107\\/5a01508a94357.jpg\",\"admin\\/20171107\\/5a01508aa0784.jpg\"]'),(2,1,'双眼皮','admin/20171107/5a0150d9a2f44.jpg','[\"admin\\/20171107\\/5a0150ca1586c.jpg\",\"admin\\/20171107\\/5a0150ca356d9.jpg\",\"admin\\/20171107\\/5a0150ca5944f.jpg\",\"admin\\/20171107\\/5a0150ca6e47d.jpg\",\"admin\\/20171107\\/5a0150ca84c21.jpg\",\"admin\\/20171107\\/5a0150cab0769.jpg\",\"admin\\/20171107\\/5a0150cc80ee2.jpg\",\"admin\\/20171107\\/5a0150ccb4a6c.jpg\"]');
/*!40000 ALTER TABLE `xz_lanmu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_links`
--

DROP TABLE IF EXISTS `xz_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_links`
--

LOCK TABLES `xz_links` WRITE;
/*!40000 ALTER TABLE `xz_links` DISABLE KEYS */;
INSERT INTO `xz_links` VALUES (1,'http://www.thinkcmf.com','ThinkCMF','','_blank','',1,0,'',0);
/*!40000 ALTER TABLE `xz_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_menu`
--

DROP TABLE IF EXISTS `xz_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `model` (`model`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_menu`
--

LOCK TABLES `xz_menu` WRITE;
/*!40000 ALTER TABLE `xz_menu` DISABLE KEYS */;
INSERT INTO `xz_menu` VALUES (1,0,'Admin','Content_bak','default','',0,0,'内容管理','th','',30),(2,1,'Api','Guestbookadmin','index','',1,1,'所有留言','','',0),(3,2,'Api','Guestbookadmin','delete','',1,0,'删除网站留言','','',0),(4,1,'Comment','Commentadmin','index','',1,1,'评论管理','','',0),(5,4,'Comment','Commentadmin','delete','',1,0,'删除评论','','',0),(6,4,'Comment','Commentadmin','check','',1,0,'评论审核','','',0),(7,1,'Portal','AdminPost','index','',1,1,'文章管理','','',1),(8,7,'Portal','AdminPost','listorders','',1,0,'文章排序','','',0),(9,7,'Portal','AdminPost','top','',1,0,'文章置顶','','',0),(10,7,'Portal','AdminPost','recommend','',1,0,'文章推荐','','',0),(11,7,'Portal','AdminPost','move','',1,0,'批量移动','','',1000),(12,7,'Portal','AdminPost','check','',1,0,'文章审核','','',1000),(13,7,'Portal','AdminPost','delete','',1,0,'删除文章','','',1000),(14,7,'Portal','AdminPost','edit','',1,0,'编辑文章','','',1000),(15,14,'Portal','AdminPost','edit_post','',1,0,'提交编辑','','',0),(16,7,'Portal','AdminPost','add','',1,0,'添加文章','','',1000),(17,16,'Portal','AdminPost','add_post','',1,0,'提交添加','','',0),(18,1,'Portal','AdminTerm','index','',0,1,'分类管理','','',2),(19,18,'Portal','AdminTerm','listorders','',1,0,'文章分类排序','','',0),(20,18,'Portal','AdminTerm','delete','',1,0,'删除分类','','',1000),(21,18,'Portal','AdminTerm','edit','',1,0,'编辑分类','','',1000),(22,21,'Portal','AdminTerm','edit_post','',1,0,'提交编辑','','',0),(23,18,'Portal','AdminTerm','add','',1,0,'添加分类','','',1000),(24,23,'Portal','AdminTerm','add_post','',1,0,'提交添加','','',0),(25,1,'Portal','AdminPage','index','',1,1,'页面管理','','',3),(26,25,'Portal','AdminPage','listorders','',1,0,'页面排序','','',0),(27,25,'Portal','AdminPage','delete','',1,0,'删除页面','','',1000),(28,25,'Portal','AdminPage','edit','',1,0,'编辑页面','','',1000),(29,28,'Portal','AdminPage','edit_post','',1,0,'提交编辑','','',0),(30,25,'Portal','AdminPage','add','',1,0,'添加页面','','',1000),(31,30,'Portal','AdminPage','add_post','',1,0,'提交添加','','',0),(32,1,'Admin','Recycle','default','',1,1,'回收站','','',4),(33,32,'Portal','AdminPost','recyclebin','',1,1,'文章回收','','',0),(34,33,'Portal','AdminPost','restore','',1,0,'文章还原','','',1000),(35,33,'Portal','AdminPost','clean','',1,0,'彻底删除','','',1000),(36,32,'Portal','AdminPage','recyclebin','',1,1,'页面回收','','',1),(37,36,'Portal','AdminPage','clean','',1,0,'彻底删除','','',1000),(38,36,'Portal','AdminPage','restore','',1,0,'页面还原','','',1000),(39,0,'Admin','Extension','default','',0,1,'扩展工具','cloud','',40),(40,39,'Admin','Backup','default','',1,0,'备份管理','','',0),(41,40,'Admin','Backup','restore','',1,1,'数据还原','','',0),(42,40,'Admin','Backup','index','',1,1,'数据备份','','',0),(43,42,'Admin','Backup','index_post','',1,0,'提交数据备份','','',0),(44,40,'Admin','Backup','download','',1,0,'下载备份','','',1000),(45,40,'Admin','Backup','del_backup','',1,0,'删除备份','','',1000),(46,40,'Admin','Backup','import','',1,0,'数据备份导入','','',1000),(47,39,'Admin','Plugin','index','',1,1,'插件管理','','',0),(48,47,'Admin','Plugin','toggle','',1,0,'插件启用切换','','',0),(49,47,'Admin','Plugin','setting','',1,0,'插件设置','','',0),(50,49,'Admin','Plugin','setting_post','',1,0,'插件设置提交','','',0),(51,47,'Admin','Plugin','install','',1,0,'插件安装','','',0),(52,47,'Admin','Plugin','uninstall','',1,0,'插件卸载','','',0),(53,39,'Admin','Slide','default','',1,1,'幻灯片','','',1),(54,53,'Admin','Slide','index','',1,1,'幻灯片管理','','',0),(55,54,'Admin','Slide','listorders','',1,0,'幻灯片排序','','',0),(56,54,'Admin','Slide','toggle','',1,0,'幻灯片显示切换','','',0),(57,54,'Admin','Slide','delete','',1,0,'删除幻灯片','','',1000),(58,54,'Admin','Slide','edit','',1,0,'编辑幻灯片','','',1000),(59,58,'Admin','Slide','edit_post','',1,0,'提交编辑','','',0),(60,54,'Admin','Slide','add','',1,0,'添加幻灯片','','',1000),(61,60,'Admin','Slide','add_post','',1,0,'提交添加','','',0),(62,53,'Admin','Slidecat','index','',1,1,'幻灯片分类','','',0),(63,62,'Admin','Slidecat','delete','',1,0,'删除分类','','',1000),(64,62,'Admin','Slidecat','edit','',1,0,'编辑分类','','',1000),(65,64,'Admin','Slidecat','edit_post','',1,0,'提交编辑','','',0),(66,62,'Admin','Slidecat','add','',1,0,'添加分类','','',1000),(67,66,'Admin','Slidecat','add_post','',1,0,'提交添加','','',0),(68,39,'Admin','Ad','index','',1,1,'网站广告','','',2),(69,68,'Admin','Ad','toggle','',1,0,'广告显示切换','','',0),(70,68,'Admin','Ad','delete','',1,0,'删除广告','','',1000),(71,68,'Admin','Ad','edit','',1,0,'编辑广告','','',1000),(72,71,'Admin','Ad','edit_post','',1,0,'提交编辑','','',0),(73,68,'Admin','Ad','add','',1,0,'添加广告','','',1000),(74,73,'Admin','Ad','add_post','',1,0,'提交添加','','',0),(75,39,'Admin','Link','index','',0,1,'友情链接','','',3),(76,75,'Admin','Link','listorders','',1,0,'友情链接排序','','',0),(77,75,'Admin','Link','toggle','',1,0,'友链显示切换','','',0),(78,75,'Admin','Link','delete','',1,0,'删除友情链接','','',1000),(79,75,'Admin','Link','edit','',1,0,'编辑友情链接','','',1000),(80,79,'Admin','Link','edit_post','',1,0,'提交编辑','','',0),(81,75,'Admin','Link','add','',1,0,'添加友情链接','','',1000),(82,81,'Admin','Link','add_post','',1,0,'提交添加','','',0),(83,39,'Api','Oauthadmin','setting','',1,1,'第三方登陆','leaf','',4),(84,83,'Api','Oauthadmin','setting_post','',1,0,'提交设置','','',0),(85,0,'Admin','Menu','default','',1,1,'菜单管理','list','',20),(86,85,'Admin','Navcat','default1','',1,1,'前台菜单','','',0),(87,86,'Admin','Nav','index','',1,1,'菜单管理','','',0),(88,87,'Admin','Nav','listorders','',1,0,'前台导航排序','','',0),(89,87,'Admin','Nav','delete','',1,0,'删除菜单','','',1000),(90,87,'Admin','Nav','edit','',1,0,'编辑菜单','','',1000),(91,90,'Admin','Nav','edit_post','',1,0,'提交编辑','','',0),(92,87,'Admin','Nav','add','',1,0,'添加菜单','','',1000),(93,92,'Admin','Nav','add_post','',1,0,'提交添加','','',0),(94,86,'Admin','Navcat','index','',1,1,'菜单分类','','',0),(95,94,'Admin','Navcat','delete','',1,0,'删除分类','','',1000),(96,94,'Admin','Navcat','edit','',1,0,'编辑分类','','',1000),(97,96,'Admin','Navcat','edit_post','',1,0,'提交编辑','','',0),(98,94,'Admin','Navcat','add','',1,0,'添加分类','','',1000),(99,98,'Admin','Navcat','add_post','',1,0,'提交添加','','',0),(100,85,'Admin','Menu','index','',1,1,'后台菜单','','',0),(101,100,'Admin','Menu','add','',1,0,'添加菜单','','',0),(102,101,'Admin','Menu','add_post','',1,0,'提交添加','','',0),(103,100,'Admin','Menu','listorders','',1,0,'后台菜单排序','','',0),(104,100,'Admin','Menu','export_menu','',1,0,'菜单备份','','',1000),(105,100,'Admin','Menu','edit','',1,0,'编辑菜单','','',1000),(106,105,'Admin','Menu','edit_post','',1,0,'提交编辑','','',0),(107,100,'Admin','Menu','delete','',1,0,'删除菜单','','',1000),(108,100,'Admin','Menu','lists','',1,0,'所有菜单','','',1000),(109,0,'Admin','Setting','default','',0,1,'设置','cogs','',0),(110,109,'Admin','Setting','userdefault','',0,1,'个人信息','','',0),(111,110,'Admin','User','userinfo','',1,1,'修改信息','','',0),(112,111,'Admin','User','userinfo_post','',1,0,'修改信息提交','','',0),(113,110,'Admin','Setting','password','',1,1,'修改密码','','',0),(114,113,'Admin','Setting','password_post','',1,0,'提交修改','','',0),(115,109,'Admin','Setting','site','',1,1,'网站信息','','',0),(116,115,'Admin','Setting','site_post','',1,0,'提交修改','','',0),(117,115,'Admin','Route','index','',1,0,'路由列表','','',0),(118,115,'Admin','Route','add','',1,0,'路由添加','','',0),(119,118,'Admin','Route','add_post','',1,0,'路由添加提交','','',0),(120,115,'Admin','Route','edit','',1,0,'路由编辑','','',0),(121,120,'Admin','Route','edit_post','',1,0,'路由编辑提交','','',0),(122,115,'Admin','Route','delete','',1,0,'路由删除','','',0),(123,115,'Admin','Route','ban','',1,0,'路由禁止','','',0),(124,115,'Admin','Route','open','',1,0,'路由启用','','',0),(125,115,'Admin','Route','listorders','',1,0,'路由排序','','',0),(126,109,'Admin','Mailer','default','',1,1,'邮箱配置','','',0),(127,126,'Admin','Mailer','index','',1,1,'SMTP配置','','',0),(128,127,'Admin','Mailer','index_post','',1,0,'提交配置','','',0),(129,126,'Admin','Mailer','active','',1,1,'注册邮件模板','','',0),(130,129,'Admin','Mailer','active_post','',1,0,'提交模板','','',0),(131,109,'Admin','Setting','clearcache','',1,1,'清除缓存','','',1),(132,0,'User','Indexadmin','default','',1,1,'用户管理','group','',10),(133,132,'User','Indexadmin','default1','',1,1,'用户组','','',0),(134,133,'User','Indexadmin','index','',1,1,'本站用户','leaf','',0),(135,134,'User','Indexadmin','ban','',1,0,'拉黑会员','','',0),(136,134,'User','Indexadmin','cancelban','',1,0,'启用会员','','',0),(137,133,'User','Oauthadmin','index','',1,1,'第三方用户','leaf','',0),(138,137,'User','Oauthadmin','delete','',1,0,'第三方用户解绑','','',0),(139,132,'User','Indexadmin','default3','',1,1,'管理组','','',0),(140,139,'Admin','Rbac','index','',1,1,'角色管理','','',0),(141,140,'Admin','Rbac','member','',1,0,'成员管理','','',1000),(142,140,'Admin','Rbac','authorize','',1,0,'权限设置','','',1000),(143,142,'Admin','Rbac','authorize_post','',1,0,'提交设置','','',0),(144,140,'Admin','Rbac','roleedit','',1,0,'编辑角色','','',1000),(145,144,'Admin','Rbac','roleedit_post','',1,0,'提交编辑','','',0),(146,140,'Admin','Rbac','roledelete','',1,1,'删除角色','','',1000),(147,140,'Admin','Rbac','roleadd','',1,1,'添加角色','','',1000),(148,147,'Admin','Rbac','roleadd_post','',1,0,'提交添加','','',0),(149,139,'Admin','User','index','',1,1,'管理员','','',0),(150,149,'Admin','User','delete','',1,0,'删除管理员','','',1000),(151,149,'Admin','User','edit','',1,0,'管理员编辑','','',1000),(152,151,'Admin','User','edit_post','',1,0,'编辑提交','','',0),(153,149,'Admin','User','add','',1,0,'管理员添加','','',1000),(154,153,'Admin','User','add_post','',1,0,'添加提交','','',0),(155,47,'Admin','Plugin','update','',1,0,'插件更新','','',0),(156,109,'Admin','Storage','index','',1,1,'文件存储','','',0),(157,156,'Admin','Storage','setting_post','',1,0,'文件存储设置提交','','',0),(158,54,'Admin','Slide','ban','',1,0,'禁用幻灯片','','',0),(159,54,'Admin','Slide','cancelban','',1,0,'启用幻灯片','','',0),(160,149,'Admin','User','ban','',1,0,'禁用管理员','','',0),(161,149,'Admin','User','cancelban','',1,0,'启用管理员','','',0),(166,127,'Admin','Mailer','test','',1,0,'测试邮件','','',0),(167,109,'Admin','Setting','upload','',1,1,'上传设置','','',0),(168,167,'Admin','Setting','upload_post','',1,0,'上传设置提交','','',0),(169,7,'Portal','AdminPost','copy','',1,0,'文章批量复制','','',0),(174,100,'Admin','Menu','backup_menu','',1,0,'备份菜单','','',0),(175,100,'Admin','Menu','export_menu_lang','',1,0,'导出后台菜单多语言包','','',0),(176,100,'Admin','Menu','restore_menu','',1,0,'还原菜单','','',0),(177,100,'Admin','Menu','getactions','',1,0,'导入新菜单','','',0),(187,0,'Admin','Wechat','default','',1,1,'微信管理','weixin','',0),(188,187,'Admin','Wechat','index','',1,1,'公众号管理','','',0),(189,187,'Admin','Wechat','wxmenu','',1,1,'菜单管理','','',0),(190,187,'Admin','Wechat','fensi','',1,1,'粉丝管理','','',0),(191,187,'Admin','Wechat','hfmessage','',1,1,'文本回复','','',0),(192,188,'Admin','Wechat','add','',1,0,'添加微信公众号','','',0),(193,188,'Admin','Wechat','edit','',1,0,'修改微信公众号','','',0),(194,188,'Admin','Wechat','post','',1,0,'提交','','',0),(195,188,'Admin','Wechat','delete','',1,0,'删除','','',0),(196,189,'Admin','Wechat','wxmenuadd','',1,0,'添加','','',0),(197,189,'Admin','Wechat','wxmenuedit','',1,0,'修改','','',0),(198,189,'Admin','Wechat','wxmenupost','',1,0,'提交','','',0),(199,189,'Admin','Wechat','wxmenudelete','',1,0,'删除','','',0),(200,191,'Admin','Wechat','messageadd','',1,0,'添加','','',0),(201,191,'Admin','Wechat','messagedit','',1,0,'修改','','',0),(202,191,'Admin','Wechat','wxmessagepost','',1,0,'提交','','',0),(203,191,'Admin','Wechat','messagedelete','',1,0,'删除','','',0),(204,0,'Admin','Wxvip','default','',1,1,'微信会员管理','user','',0),(205,204,'Admin','Wxvip','index','',1,1,'会员卡管理','','',0),(206,204,'Admin','Wxvip','vipcenter','',1,1,'会员中心管理','','',0),(207,0,'Admin','Active','default','',1,1,'活动管理','life-bouy','',0),(208,207,'Admin','Active','jp','',1,1,'奖品设置','','',1),(212,205,'Admin','Wxvip','add','',1,0,'添加','','',0),(210,207,'Admin','Active','zjmd','',1,1,'中奖名单','','',2),(211,207,'Admin','Active','index','',1,1,'活动列表','','',0),(213,205,'Admin','Wxvip','edit','',1,0,'修改','','',0),(214,205,'Admin','Wxvip','post','',1,0,'提交','','',0),(215,205,'Admin','Wxvip','delete','',1,0,'删除','','',0),(216,211,'Admin','Active','add','',1,0,'添加','','',0),(217,211,'Admin','Active','edit','',1,0,'修改','','',0),(218,211,'Admin','Active','post','',1,0,'提交','','',0),(219,211,'Admin','Active','delete','',1,0,'删除','','',0),(220,208,'Admin','Active','jpadd','',1,0,'添加','','',0),(221,208,'Admin','Active','jpedit','',1,0,'修改','','',0),(222,208,'Admin','Active','jppost','',1,0,'提交','','',0),(223,208,'Admin','Active','jpdelete','',1,0,'删除','','',0),(224,0,'Admin','Content','default','',1,1,'内容管理','th','',0),(225,224,'Admin','Content','article','',1,1,'文章管理','','',0),(226,225,'Admin','Content','add','',1,0,'添加','','',0),(227,225,'Admin','Content','edit','',1,0,'修改','','',0),(228,225,'Admin','Content','post','',1,0,'提交','','',0),(229,225,'Admin','Content','delete','',1,0,'删除','','',0),(230,0,'Admin','Hospital','default','',1,1,'医院管理','hospital-o','',0),(231,230,'Admin','Hospital','index','',1,1,'基本信息','','',0),(232,231,'Admin','Hospital','add','',1,0,'添加','','',0),(233,231,'Admin','Hospital','edit','',1,0,'修改','','',0),(234,231,'Admin','Hospital','post','',1,0,'提交','','',0),(235,231,'Admin','Hospital','delete','',1,0,'删除','','',0),(236,230,'Admin','Hospital','department','',1,1,'科室管理','','',0),(237,236,'Admin','Hospital','dpmadd','',1,0,'添加','','',0),(238,236,'Admin','Hospital','dpmedit','',1,0,'修改','','',0),(239,236,'Admin','Hospital','dpmpost','',1,0,'提交','','',0),(240,236,'Admin','Hospital','dpmdelete','',1,0,'删除','','',0),(241,230,'Admin','Hospital','diseases','',1,1,'病种管理','','',0),(242,241,'Admin','Hospital','diseadd','',1,0,'添加','','',0),(243,241,'Admin','Hospital','diseedit','',1,0,'修改','','',0),(244,241,'Admin','Hospital','disepost','',1,0,'提交','','',0),(245,241,'Admin','Hospital','disedelete','',1,0,'删除','','',0),(246,230,'Admin','Health','default','',1,1,'健康自测','','',0),(247,246,'Admin','Health','index','',1,1,'疾病种类','','',0),(248,247,'Admin','Health','add','',1,0,'添加','','',0),(249,247,'Admin','Health','edit','',1,0,'修改','','',0),(250,247,'Admin','Health','post','',1,0,'提交','','',0),(251,247,'Admin','Health','delete','',1,0,'删除','','',0),(252,246,'Admin','Health','health','',1,1,'自测题目','','',0),(253,252,'Admin','Health','tmadd','',1,0,'添加','','',0),(254,252,'Admin','Health','tmedit','',1,0,'修改','','',0),(255,252,'Admin','Health','tmpost','',1,0,'提交','','',0),(256,252,'Admin','Health','tmdelete','',1,0,'删除','','',0),(257,236,'Admin','Hospital','dpm','',1,0,'Ajax提交','','',0),(258,241,'Admin','Hospital','dise','',1,0,'Ajax提交','','',0),(259,225,'Admin','Hospital','disname','',1,0,'Ajax提交','','',0),(260,0,'Admin','Domain','default','',1,1,'域名管理','laptop','',0),(261,260,'Admin','Domain','ipindex','',1,1,'IP管理','','',0),(262,261,'Admin','Domain','ipadd','',1,0,'添加','','',0),(263,261,'Admin','Domain','ipedit','',1,0,'修改','','',0),(264,261,'Admin','Domain','ippost','',1,0,'提交','','',0),(265,261,'Admin','Domain','ipdel','',1,0,'删除','','',0),(266,260,'Admin','Domain','domainindex','',1,1,'域名列表','','',0),(267,266,'Admin','Domain','domainadd','',1,0,'添加','','',0),(268,266,'Admin','Domain','domainedit','',1,0,'修改','','',0),(269,266,'Admin','Domain','domainpost','',1,0,'提交','','',0),(270,266,'Admin','Domain','domaindel','',1,0,'删除','','',0),(271,0,'Admin','Yuyue','index','',1,1,'预约挂号','bold','',0),(272,230,'Admin','Dteam','index','',1,1,'专家团队','','',0),(273,0,'Admin','Plastic','index','',1,1,'专题栏目管理','star','',0),(274,273,'Admin','Plastic','add','',1,0,'添加','','',0),(275,273,'Admin','Plastic','edit','',1,0,'修改','','',0),(276,273,'Admin','Plastic','post','',1,0,'提交','','',0),(277,273,'Admin','Plastic','del','',1,0,'删除','','',0),(278,272,'Admin','Dteam','add','',1,0,'添加','','',0),(279,272,'Admin','Dteam','edit','',1,0,'修改','','',0),(280,272,'Admin','Dteam','post','',1,0,'提交','','',0),(281,272,'Admin','Dteam','del','',1,0,'删除','','',0),(282,271,'Admin','Yuyue','iscl','',1,0,'处理','','',0);
/*!40000 ALTER TABLE `xz_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_nav`
--

DROP TABLE IF EXISTS `xz_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_nav`
--

LOCK TABLES `xz_nav` WRITE;
/*!40000 ALTER TABLE `xz_nav` DISABLE KEYS */;
INSERT INTO `xz_nav` VALUES (1,1,0,'首页','','home','',1,0,'0-1'),(2,1,0,'列表演示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','',1,0,'0-2'),(3,1,0,'瀑布流','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}','',1,0,'0-3');
/*!40000 ALTER TABLE `xz_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_nav_cat`
--

DROP TABLE IF EXISTS `xz_nav_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_nav_cat`
--

LOCK TABLES `xz_nav_cat` WRITE;
/*!40000 ALTER TABLE `xz_nav_cat` DISABLE KEYS */;
INSERT INTO `xz_nav_cat` VALUES (1,'主导航',1,'主导航');
/*!40000 ALTER TABLE `xz_nav_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_oauth_user`
--

DROP TABLE IF EXISTS `xz_oauth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_oauth_user`
--

LOCK TABLES `xz_oauth_user` WRITE;
/*!40000 ALTER TABLE `xz_oauth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_oauth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_options`
--

DROP TABLE IF EXISTS `xz_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='全站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_options`
--

LOCK TABLES `xz_options` WRITE;
/*!40000 ALTER TABLE `xz_options` DISABLE KEYS */;
INSERT INTO `xz_options` VALUES (1,'member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}',1),(6,'site_options','            {\n            		\"site_name\":\"xz\",\n            		\"site_host\":\"http://192.168.0.239:82/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"1@1.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"xz\",\n            		\"site_seo_keywords\":\"xz\",\n            		\"site_seo_description\":\"xz\"\n        }',1);
/*!40000 ALTER TABLE `xz_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_plugins`
--

DROP TABLE IF EXISTS `xz_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_plugins`
--

LOCK TABLES `xz_plugins` WRITE;
/*!40000 ALTER TABLE `xz_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_posts`
--

DROP TABLE IF EXISTS `xz_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`) USING BTREE,
  KEY `post_parent` (`post_parent`) USING BTREE,
  KEY `post_author` (`post_author`) USING BTREE,
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_posts`
--

LOCK TABLES `xz_posts` WRITE;
/*!40000 ALTER TABLE `xz_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_prize`
--

DROP TABLE IF EXISTS `xz_prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '奖品名称',
  `bgcolor` varchar(8) DEFAULT NULL COMMENT '奖品区域的背景颜色',
  `jpnum` int(10) DEFAULT NULL COMMENT '奖品个数',
  `zjnum` int(10) DEFAULT '0' COMMENT '已中奖个数',
  `hdid` int(10) DEFAULT NULL COMMENT '活动id',
  `proba` float(5,2) DEFAULT NULL COMMENT '中奖概率',
  `publicid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_prize`
--

LOCK TABLES `xz_prize` WRITE;
/*!40000 ALTER TABLE `xz_prize` DISABLE KEYS */;
INSERT INTO `xz_prize` VALUES (1,'谢谢参与','#d0d627',100000,0,2,38.00,0),(3,'一等奖','#ff8d30',3,0,2,5.00,0),(4,'二等奖','#d9ff98',10,0,2,10.00,0),(5,'三等奖','#ff78f6',20,0,2,12.00,0),(6,'四等奖','#7d78ff',26,0,2,15.00,0),(7,'五等奖','#54cfff',30,0,2,20.00,0),(8,'六等奖','#60ffd5',100,0,2,100.00,0);
/*!40000 ALTER TABLE `xz_prize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_role`
--

DROP TABLE IF EXISTS `xz_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_role`
--

LOCK TABLES `xz_role` WRITE;
/*!40000 ALTER TABLE `xz_role` DISABLE KEYS */;
INSERT INTO `xz_role` VALUES (1,'超级管理员',0,1,'拥有网站最高管理员权限！',1329633709,1329633709,0),(2,'管理员',NULL,1,'权限仅次于超级管理员',1501463443,1501465343,0),(3,'医院管理',NULL,1,'医院管理包括题目添加',1503475553,0,0),(4,'域名管理',NULL,1,'网站IP和域名查询',1507361900,0,0),(5,'微信小程序',NULL,1,'微信小程序数据管理',1510274717,0,0);
/*!40000 ALTER TABLE `xz_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_role_user`
--

DROP TABLE IF EXISTS `xz_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_role_user`
--

LOCK TABLES `xz_role_user` WRITE;
/*!40000 ALTER TABLE `xz_role_user` DISABLE KEYS */;
INSERT INTO `xz_role_user` VALUES (2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `xz_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_route`
--

DROP TABLE IF EXISTS `xz_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_route`
--

LOCK TABLES `xz_route` WRITE;
/*!40000 ALTER TABLE `xz_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_slide`
--

DROP TABLE IF EXISTS `xz_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_slide`
--

LOCK TABLES `xz_slide` WRITE;
/*!40000 ALTER TABLE `xz_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_slide_cat`
--

DROP TABLE IF EXISTS `xz_slide_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_slide_cat`
--

LOCK TABLES `xz_slide_cat` WRITE;
/*!40000 ALTER TABLE `xz_slide_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_slide_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_term_relationships`
--

DROP TABLE IF EXISTS `xz_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_term_relationships`
--

LOCK TABLES `xz_term_relationships` WRITE;
/*!40000 ALTER TABLE `xz_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_terms`
--

DROP TABLE IF EXISTS `xz_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_terms`
--

LOCK TABLES `xz_terms` WRITE;
/*!40000 ALTER TABLE `xz_terms` DISABLE KEYS */;
INSERT INTO `xz_terms` VALUES (1,'列表演示','','article','',0,0,'0-1','','','','list','article',0,1),(2,'瀑布流','','article','',0,0,'0-2','','','','list_masonry','article',0,1);
/*!40000 ALTER TABLE `xz_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_tmlist`
--

DROP TABLE IF EXISTS `xz_tmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_tmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tmname` varchar(255) DEFAULT NULL,
  `tmtypeid` int(10) DEFAULT NULL COMMENT '题目类型',
  `answer1` varchar(225) DEFAULT NULL,
  `answer2` varchar(225) DEFAULT NULL,
  `answer3` varchar(225) DEFAULT NULL,
  `answer4` varchar(225) DEFAULT NULL,
  `answer5` varchar(225) DEFAULT NULL,
  `answer6` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_tmlist`
--

LOCK TABLES `xz_tmlist` WRITE;
/*!40000 ALTER TABLE `xz_tmlist` DISABLE KEYS */;
INSERT INTO `xz_tmlist` VALUES (1,'测试题目1',1,'选项1','选项2','选项3','选项4','','');
/*!40000 ALTER TABLE `xz_tmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_user_favorites`
--

DROP TABLE IF EXISTS `xz_user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_user_favorites`
--

LOCK TABLES `xz_user_favorites` WRITE;
/*!40000 ALTER TABLE `xz_user_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `xz_user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_users`
--

DROP TABLE IF EXISTS `xz_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`) USING BTREE,
  KEY `user_nicename` (`user_nicename`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_users`
--

LOCK TABLES `xz_users` WRITE;
/*!40000 ALTER TABLE `xz_users` DISABLE KEYS */;
INSERT INTO `xz_users` VALUES (1,'admin','###d3b21f509166045dc696a8953822a1ce','admin','1@1.com','',NULL,0,'2000-01-01',NULL,'61.177.82.66','2018-03-14 10:29:07','2017-07-10 10:34:12','',1,0,1,0,''),(2,'wxadmin','###7a29e003186c3e3a17b5c514c28466d8','','123@123.com','',NULL,0,'2000-01-01',NULL,'222.185.249.138','2017-07-31 15:01:27','2017-07-31 09:12:05','',1,0,1,0,''),(3,'hospital','###f5563e64159025ae0dd2af26a1418571','','123@1.com','',NULL,0,'2000-01-01',NULL,'222.185.249.138','2017-08-25 10:30:02','2017-08-23 16:08:05','',1,0,1,0,''),(4,'domain','###674aba5c5765a266136f0699716ad350','','1@domain.com','',NULL,0,'2000-01-01',NULL,'222.185.249.138','2017-10-19 09:02:18','2017-10-07 15:39:07','',0,0,1,0,''),(5,'wechatapp','###b6cbbe9454b68dd22b0344e2a0d3e7e3','','123@321.com','',NULL,0,'2000-01-01',NULL,'222.185.249.138','2017-11-14 10:34:31','2017-11-10 08:46:58','',1,0,1,0,'');
/*!40000 ALTER TABLE `xz_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_vipdetail`
--

DROP TABLE IF EXISTS `xz_vipdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_vipdetail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '会员姓名',
  `tel` varchar(15) DEFAULT NULL COMMENT '电话',
  `cardnumber` varchar(50) DEFAULT NULL COMMENT '卡号',
  `cardcode` varchar(15) DEFAULT NULL COMMENT '卡的code码',
  `cardid` varchar(50) DEFAULT NULL COMMENT '会员卡id',
  `openid` varchar(50) DEFAULT NULL COMMENT '领取会员卡的openid',
  `OuterStr` varchar(10) DEFAULT NULL COMMENT '会员卡来源',
  `IsRestoreMemberCard` smallint(1) DEFAULT NULL COMMENT '用户是否删除了会员卡',
  `bonus` int(10) DEFAULT NULL COMMENT '会员卡积分',
  `user_card_status` varchar(30) DEFAULT NULL COMMENT '会员卡状态',
  `publicid` int(10) DEFAULT NULL,
  `isjihuo` smallint(1) DEFAULT '0' COMMENT '是否激活',
  `caeattime` date DEFAULT NULL COMMENT '领取会员卡的时间',
  `jhtime` date DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_vipdetail`
--

LOCK TABLES `xz_vipdetail` WRITE;
/*!40000 ALTER TABLE `xz_vipdetail` DISABLE KEYS */;
INSERT INTO `xz_vipdetail` VALUES (8,'张三','15187543665','7230001','697938201251','p8t4Qtwr7s_qQFf8H6GbxcMABx_s','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','666',0,100,'NORMAL',2,1,'2017-07-25','2017-07-25'),(9,'smy','15178754875','5340002','978043992521','p8t4Qtwr7s_qQFf8H6GbxcMABx_s','o8t4Qt4R8aBcaY0ALztPqoa1q6c4','xx',0,50,'NORMAL',2,1,'2017-07-26','2017-07-26');
/*!40000 ALTER TABLE `xz_vipdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_wxconfig`
--

DROP TABLE IF EXISTS `xz_wxconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_wxconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '公众号名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '公众号图标',
  `appid` varchar(25) DEFAULT NULL,
  `appsecret` varchar(40) DEFAULT NULL,
  `url` text,
  `token` varchar(100) DEFAULT NULL,
  `encodingaeskey` varchar(200) DEFAULT NULL,
  `hftext` varchar(255) DEFAULT NULL,
  `creatime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_wxconfig`
--

LOCK TABLES `xz_wxconfig` WRITE;
/*!40000 ALTER TABLE `xz_wxconfig` DISABLE KEYS */;
INSERT INTO `xz_wxconfig` VALUES (1,'测试','','wx5f2e8a37bb917e1e','d4624c36b6795d1d99dcf0547af5443d','http://ywj.ganglongyun.com/index.php?g=Portal&amp;m=Wechat&amp;a=index&amp;accountid=1','weixin','','欢迎关注！','2017-07-12 16:57:03'),(2,'港龙微美人','admin/20170731/597e9a4b1ae61.jpg','wx58189944629f8b53','f15e84b7e6777f2001de8943cb0ae127','http://ywj.ganglongyun.com/index.php?g=Portal&amp;m=Wechat&amp;a=index&amp;accountid=2','3qhbGihm5ojzfftabFoA','','欢迎关注！','2017-07-31 10:47:49');
/*!40000 ALTER TABLE `xz_wxconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_wxjfhx`
--

DROP TABLE IF EXISTS `xz_wxjfhx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_wxjfhx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jf` varchar(10) DEFAULT NULL COMMENT '核销的积分数',
  `jftype` smallint(1) DEFAULT NULL COMMENT '0，积分添加 1，积分减少',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `openid` varchar(70) DEFAULT NULL COMMENT '核销人的openid',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_wxjfhx`
--

LOCK TABLES `xz_wxjfhx` WRITE;
/*!40000 ALTER TABLE `xz_wxjfhx` DISABLE KEYS */;
INSERT INTO `xz_wxjfhx` VALUES (1,'',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 16:12:56'),(2,'',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 16:23:32'),(3,'',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 16:38:38'),(4,'',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 16:43:30'),(5,'',0,'','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 16:47:23'),(6,'10',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 16:52:34'),(7,'20',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 16:55:30'),(8,'10',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 17:07:34'),(9,'10',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 17:10:02'),(10,'10',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 17:14:01'),(11,'50',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 17:16:58'),(12,'10',0,'gji','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 17:33:23'),(13,'10',0,'ces','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 17:40:19'),(14,'5',0,'why','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-24 17:43:50'),(15,'5',0,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:03:10'),(16,'5',1,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:18:05'),(17,'15',2,'减少','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:18:33'),(18,'10',1,'增加','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:20:43'),(19,'10',1,'＋','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:23:21'),(20,'5',2,'减少','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:29:39'),(21,'35',1,'加','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:34:20'),(22,'50',2,'减少','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 10:36:01'),(23,'10',1,'加','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-25 11:04:50'),(24,'50',2,'测试','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE','2017-07-26 08:56:44');
/*!40000 ALTER TABLE `xz_wxjfhx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_wxmenu`
--

DROP TABLE IF EXISTS `xz_wxmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_wxmenu` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `key` varchar(200) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `pid` int(5) DEFAULT '0',
  `listorder` int(5) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `parentid` int(10) DEFAULT NULL,
  `publicid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_wxmenu`
--

LOCK TABLES `xz_wxmenu` WRITE;
/*!40000 ALTER TABLE `xz_wxmenu` DISABLE KEYS */;
INSERT INTO `xz_wxmenu` VALUES (1,'view','百度翻译','','https://fanyi.baidu.com',0,0,0,0,1),(2,'view','测试','','',0,1,1,0,1),(3,'view','百度','','https://www.baidu.com',0,1,1,2,1),(4,'view','gly','','http://ywj.ganglongyun.com',0,1,1,2,1);
/*!40000 ALTER TABLE `xz_wxmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_wxmessage`
--

DROP TABLE IF EXISTS `xz_wxmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_wxmessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(20) DEFAULT NULL,
  `content` text,
  `publicid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_wxmessage`
--

LOCK TABLES `xz_wxmessage` WRITE;
/*!40000 ALTER TABLE `xz_wxmessage` DISABLE KEYS */;
INSERT INTO `xz_wxmessage` VALUES (1,'你好','您好！',1);
/*!40000 ALTER TABLE `xz_wxmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_wxuser`
--

DROP TABLE IF EXISTS `xz_wxuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_wxuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(1) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `sex` varchar(3) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `headimgurl` text,
  `unionid` varchar(100) DEFAULT NULL,
  `isguanzhu` smallint(1) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `publicid` int(10) DEFAULT NULL,
  `isscan` smallint(1) DEFAULT '0' COMMENT '是否有扫码权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_wxuser`
--

LOCK TABLES `xz_wxuser` WRITE;
/*!40000 ALTER TABLE `xz_wxuser` DISABLE KEYS */;
INSERT INTO `xz_wxuser` VALUES (1,0,'osAvDuCUWmJTAIBJb13vl51PR51s',NULL,NULL,'吃的','1','江苏','常州','http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLCiabib32d70eQzUcalBeiaUg2cFEt54yNbqMdVYtvrP8UibaWO4KBdnCkLCWTHHZjkjmkSOrqUzk3GApFUVDqPVXJy62kKkLTA5pM/132',NULL,0,'2018-03-05 16:22:17',1,0),(3,0,'o8t4Qt4R8aBcaY0ALztPqoa1q6c4',NULL,NULL,'邵明瑜','2','江苏','常州','http://wx.qlogo.cn/mmopen/hficiaUKWOdG25PM4JjzgFx5VGIwSaEgytic7l06Gk5lxT45SpNqs51NfQjalGbno8ZsnNbHuUiaqx1YEgI8FSx5aZ7hQjMLOsUO/0',NULL,1,'2017-07-26 08:52:23',2,0),(6,0,'o8t4Qt-G7ByFQybZ5rOCOYHkf0rE',NULL,NULL,'吃的','1','江苏','常州','http://wx.qlogo.cn/mmopen/ajNVdqHZLLD4AXIP6sOS2F5OJgb02NEB0micnrnluZvk43ibRlaJVczu0jiaVSE3dTiaa0TrOOUvdqn1eZo09YLDlkPbaROkH5iaicHKfNgOaHEjk/0',NULL,1,'2017-07-26 10:42:55',2,0),(7,0,'o8t4Qt35KxhuKr93JOkV3jNj-3NY',NULL,NULL,'叶','1','','','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6aojiaLdzdI6smetZf4ekdtwhvm9Zgepotty3ATTR2ePAKplrQA2CicNScdTlgZsYicxsGz0MpSy26nuCeQiarMvnEw3fOHfX18Qw/0',NULL,0,'2017-07-29 21:54:31',2,0),(8,0,'o8t4Qt-A63SjKJKQAxL1WBGHNo88',NULL,NULL,'李永利-冰山来客','2','山东','日照','http://wx.qlogo.cn/mmopen/ajNVdqHZLLA6HjSw9YedG1nEDSKuKjqJO5yuUP0Dic0hXDBnV2Z39nH8qeqEu7iawIJbAr1bic9og50tF27MBlO2w/0',NULL,1,'2017-08-19 05:24:41',2,0),(9,0,'o8t4QtzDUwRJniOYcwJ5AC4CCfHI',NULL,NULL,'乔治','2','北京','朝阳','http://wx.qlogo.cn/mmopen/PiajxSqBRaELa9KkplU0x4OA9VJ252dZBA5gvnlw1lrtqUOyibgp4qbzLVdTMdMwvg1co0mNPDIZnYYTibZpNTpOw/0',NULL,1,'2017-08-19 05:24:41',2,0);
/*!40000 ALTER TABLE `xz_wxuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_wxvipcard`
--

DROP TABLE IF EXISTS `xz_wxvipcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_wxvipcard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publicid` int(10) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL COMMENT '会员卡类型',
  `background_pic_url` varchar(500) DEFAULT NULL COMMENT '会员卡背景图片',
  `wx_activate` varchar(5) DEFAULT '' COMMENT '微信一键开卡功能',
  `logo_url` varchar(500) DEFAULT NULL COMMENT '会员卡商户logo',
  `code_type` varchar(50) DEFAULT NULL COMMENT '文本CODE_TYPE_TEXT，一维码CODE_TYPE_BARCODE，二维码CODE_TYPE_QRCODE',
  `brand_name` varchar(25) DEFAULT NULL COMMENT '商户名称（12个汉字）',
  `title` varchar(18) DEFAULT NULL COMMENT '会员卡名称（9个字）',
  `color` varchar(10) DEFAULT NULL COMMENT 'Color010-Color0100',
  `notice` varchar(32) DEFAULT '使用时请出示' COMMENT '会员卡使用提示',
  `service_phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `description` text COMMENT '使用须知',
  `date_info` varchar(30) DEFAULT 'DATE_TYPE_PERMANENT' COMMENT '使用有效期',
  `quantity` int(8) DEFAULT NULL COMMENT '会员卡数量',
  `membership_number` varchar(10) DEFAULT NULL COMMENT '会员卡前5位',
  `get_limit` smallint(1) DEFAULT '1' COMMENT '领取数量',
  `use_custom_code` varchar(5) DEFAULT 'true' COMMENT '是否自定义会员卡的编号',
  `can_give_friend` varchar(5) DEFAULT 'false' COMMENT '是否可以转送朋友',
  `need_push_on_view` varchar(5) DEFAULT 'false' COMMENT '点击进入会员卡是否推送事件',
  `image_url` text COMMENT '图文详情的图片',
  `text` text COMMENT '图文详情的内容',
  `business_service` varchar(200) DEFAULT NULL COMMENT '商户可提供的服务',
  `supply_bonus` varchar(5) DEFAULT 'true' COMMENT '显示积分',
  `supply_balance` varchar(5) DEFAULT 'true' COMMENT '是否支持储值',
  `prerogative` text COMMENT '会员卡特权说明',
  `name_type` varchar(30) DEFAULT NULL COMMENT '会员卡等级',
  `name_type_url` text COMMENT '会员卡等级需要跳转的外链',
  `cost_money_unit` int(10) DEFAULT NULL COMMENT '消费多少分钱的1积分',
  `increase_bonus` int(10) DEFAULT NULL COMMENT '得到多少积分',
  `max_increase_bonus` int(10) DEFAULT NULL COMMENT '单次上限',
  `init_increase_bonus` int(10) DEFAULT NULL COMMENT '使用多少积分抵扣cost_bonus_unit',
  `cost_bonus_unit` int(10) DEFAULT NULL COMMENT '扣多少积分',
  `reduce_money` int(10) DEFAULT NULL,
  `least_money_to_use_bonus` int(10) DEFAULT NULL COMMENT '抵扣条件，满xx元（这里以分为单位）',
  `max_reduce_bonus` int(10) DEFAULT NULL COMMENT '抵扣条件，单笔最多使用xx积分',
  `discount` float(10,1) DEFAULT NULL COMMENT '享受折扣',
  `isopen` smallint(1) DEFAULT '0' COMMENT '会员卡是否开卡',
  `cardid` varchar(50) DEFAULT NULL COMMENT '会员卡id',
  `vipstate` smallint(1) DEFAULT '0' COMMENT '0未投放，1已投放',
  `promotion_url_name` varchar(30) DEFAULT NULL COMMENT '网络营销入口',
  `promotion_url` text COMMENT '营销入口链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_wxvipcard`
--

LOCK TABLES `xz_wxvipcard` WRITE;
/*!40000 ALTER TABLE `xz_wxvipcard` DISABLE KEYS */;
INSERT INTO `xz_wxvipcard` VALUES (1,1,'MEMBER_CARD','','1','www.baidu.com','CODE_TYPE_QRCODE','港龙1','港龙普通会员卡1','Color010','使用时请出示此卡','4311110','使用须知1','DATE_TYPE_PERMANENT',100,'',1,'1','','','admin/20170722/5972c18341526.jpg','图文详情1','BIZ_SERVICE_FREE_WIFI,,BIZ_SERVICE_FREE_PARK,','1','1','特权说明1','FIELD_NAME_TYPE_LEVEL','www.baidu.com',1,1,10000000,100,10,1,100,100000,9.9,0,'',0,'营销入口1','www.baidu.com'),(9,2,'MEMBER_CARD','','1','admin/20170725/59770ceb036c3.jpg','CODE_TYPE_QRCODE','港龙微美人','港龙普通会员卡','Color010','使用时请出示此卡','4311114','仅限一人使用','DATE_TYPE_PERMANENT',10,'',1,'1','','','admin/20170725/59770d9050c02.png','港龙微美人--只做有品质的医疗美容！专业的医学美容信息平台，你变美路上最亲密的闺蜜！','BIZ_SERVICE_FREE_WIFI,,BIZ_SERVICE_FREE_PARK,','1','1','凭此卡9折诱惑','FIELD_NAME_TYPE_LEVEL','',1,1,0,100,10,1,0,0,9.0,1,'p8t4Qtwr7s_qQFf8H6GbxcMABx_s',0,'','');
/*!40000 ALTER TABLE `xz_wxvipcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_wxvipscene`
--

DROP TABLE IF EXISTS `xz_wxvipscene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_wxvipscene` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publicid` int(10) DEFAULT NULL,
  `outerid` varchar(20) DEFAULT NULL COMMENT '场景id',
  `remark` varchar(255) DEFAULT NULL COMMENT '场景备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_wxvipscene`
--

LOCK TABLES `xz_wxvipscene` WRITE;
/*!40000 ALTER TABLE `xz_wxvipscene` DISABLE KEYS */;
INSERT INTO `xz_wxvipscene` VALUES (3,2,'gly123','港龙美容武进店'),(4,2,'123','测试'),(5,2,'66','测试'),(6,2,'666','测试'),(7,2,'xx','测试');
/*!40000 ALTER TABLE `xz_wxvipscene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_yuyue`
--

DROP TABLE IF EXISTS `xz_yuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_yuyue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(200) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `xuqiu` text,
  `hospitalid` int(10) DEFAULT NULL,
  `formid` varchar(550) DEFAULT NULL,
  `iscl` smallint(1) DEFAULT '1',
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_yuyue`
--

LOCK TABLES `xz_yuyue` WRITE;
/*!40000 ALTER TABLE `xz_yuyue` DISABLE KEYS */;
INSERT INTO `xz_yuyue` VALUES (1,'oGC4L0aBo47HNvWfpzkVFfvEad5o','张三','15189754396','2017-11-15','测试数据',1,'1510624726658',2,'2017-11-14 09:59:33'),(2,'oGC4L0aBo47HNvWfpzkVFfvEad5o','李四','15178453698','2017-11-18','李四的测试数据',1,'1510626695142',1,'2017-11-14 10:32:21'),(3,'oGC4L0aBo47HNvWfpzkVFfvEad5o','测试','15148754224','2017-11-19','测试数据',1,'1510627530462',1,'2017-11-14 10:46:16'),(4,'oGC4L0bKp6OxyumPd_RD_N2fGLbU','依依','13513863510','2017-11-14','好\n',1,'1510627954260',2,'2017-11-14 10:52:34'),(5,'oGC4L0XsZempfI7PAJ0dZdUn9pp8','他','15157548445','2017-11-14','看看',1,'0c8fe9dec2ef02c30ca2b47d9a1aa90b',2,'2017-11-14 11:12:00'),(6,'oGC4L0c75km_KZs5MlSfwKJ6xOl8','任斌','18915073088','2017-11-14','你好',1,'90676a81162e232d4a8d07c103d85ca3',2,'2017-11-14 11:17:35');
/*!40000 ALTER TABLE `xz_yuyue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_zjmd`
--

DROP TABLE IF EXISTS `xz_zjmd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_zjmd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '中奖姓名',
  `jpid` int(10) DEFAULT NULL COMMENT '奖品id',
  `tel` varchar(15) DEFAULT NULL COMMENT '电话',
  `openid` varchar(100) DEFAULT NULL,
  `hdid` int(10) DEFAULT NULL,
  `islj` smallint(1) DEFAULT NULL COMMENT '是否领奖,1表示领取，2表示未领取',
  `time` datetime DEFAULT NULL COMMENT '中奖时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_zjmd`
--

LOCK TABLES `xz_zjmd` WRITE;
/*!40000 ALTER TABLE `xz_zjmd` DISABLE KEYS */;
INSERT INTO `xz_zjmd` VALUES (9,'张三',5,'15145425114',NULL,2,2,'2017-07-28 17:28:51'),(10,'李四',8,'15145478554','o8t4Qt-G7ByFQybZ5rOCOYHkf0rE',2,2,'2017-07-31 10:43:46');
/*!40000 ALTER TABLE `xz_zjmd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xz_zjteam_copy`
--

DROP TABLE IF EXISTS `xz_zjteam_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xz_zjteam_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hospitalid` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `position` varchar(100) DEFAULT NULL COMMENT '职位',
  `department` varchar(50) DEFAULT NULL COMMENT '所属科室',
  `tel` varchar(15) DEFAULT NULL,
  `profile` text,
  `shanchang` text COMMENT '擅长',
  `office` text COMMENT '学术任职',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xz_zjteam_copy`
--

LOCK TABLES `xz_zjteam_copy` WRITE;
/*!40000 ALTER TABLE `xz_zjteam_copy` DISABLE KEYS */;
INSERT INTO `xz_zjteam_copy` VALUES (1,1,'戴德坚','admin/20171106/5a0001a606e02.jpg','主治医师 教授 博导','普外科','15123213212','戴德坚，男，上海天佑医院普外科副主任医师  ，擅长肝脏、胆道、甲状腺、乳腺、胃肠道肿瘤、肝硬化门脂高压及肝脏移植等外科治疗，尤其复杂、疑难肝脏肿瘤手术、肝门胆管癌和胰十二指肠切除术等周围神经病及肌肉病，肉毒素治疗妇科内镜，子宫出血，宫颈病变，妇科肿瘤，尿失禁 ，肝脏、胆道、甲状腺、乳腺、胃肠道肿瘤、肝硬化门脂高压及肝脏移植等外科治疗，尤其复杂、疑难肝脏肿瘤手术、肝门胆管癌和胰十二指肠切除术。','致力副主任毕业医师移植博士北京擅长肝脏胆道甲状腺乳腺胃肠道肿瘤肝硬化门脂高压及肝脏导师移植等，之一外科国内治疗指导尤其复杂疑难已经肝脏肿瘤认识手术肝门胆管癌和胰十二指肠切除术等，有着方面腹腔积累了技能丰富的经验技。','外科学博士，博士后 副主任医师，硕士生导师。外科教研室主任和普外科副主任。2005年毕业于浙江大学，获医学博士学位。后在上海交通大学附属第一人民医院器官移植中心从事博士后研究。主要从事肝胆胰肿瘤、肝移植临床和基础研究，2013年底人才引进到上海市浦东新区周浦医院普外科。现任上海中西医结合学会委员，《世界华人消化杂志》、《现代外科学杂志》编委，担任国家自然科学基金课题同行评议专家。有二十余年的普外科临床诊治工作经验 能较全面地开展普外科各类手术，专业特长：擅长肝脏、胆道、胰腺肿瘤，甲状腺、乳腺、胃肠道肿瘤，肝硬化门脉高压及肝脏移植等外科治疗，尤其在复杂、疑难肝脏肿瘤手术，肝门胆管癌和胰十二指肠切除术 腹腔镜结直肠癌根治术等方面积累了丰富的经验。学术成果：承担或参与国家自然科学基金2项，中国博士后科学基金1项，上海市、浙江省级课题3项。获上海市科技进步一等奖和浙江省技进步二等奖等科研成果。发表国际核心期刊（SCI收录）8篇，国内核心期刊论文20余篇。'),(2,1,'张三','admin/20171106/5a0001b5f219e.jpg','医生 博导','神经科','15123456789','测试','测试','测试'),(4,1,'李四','admin/20171106/5a00244b17f43.png','教授 医学博士 硕导','心血管内科','15188888888','先后担任上海二军大附属公利医院心内科主任；同济大学附属东方医院心内科副主任；上海市第八人民医院心内科主任；曾到美国、法国、德国等国家进修学习；相继毕业于武汉大学医学院、郑州大学医学院、华中科技大学同济医学院。\r\n对冠心病及心衰的早期诊断与防治具有相当经验，在心血管疾病的介入性诊断与治疗方面颇有建树（如冠脉造影、PTCA、血管内支架植入术、心脏起搏与电生理等），近5年来，个人累计操作各类心脏介入手术2000余例，成功抢救急危重症心血管病800余例。近年来带教了大批医学院实习学生和全国各地进修医师，5年累计带教实习学生和进修医师200余名，带教硕士研究生4名。','擅长各类心脏病的介入性诊治，心血管内科血管造影、二尖瓣狭窄球囊扩张术和肺动脉瓣狭窄球囊张术。特别是在高血压、冠心病、心律失常、心衰等疾病诊治和冠心病、心肌梗死、心力衰竭病人的抢救方面，具有丰富临床经验。','先后在省市级以上专业杂志发表论文70余篇，其中SCI论文8篇；出版著作9部，有《分子心脏病学》（人民卫生出版社出版）、《现代心脏病诊断与治疗》、《心脏病快速诊治手册》、《临床血管病学》等；主研或参研市级以上课题20余项，目前在研浦东新区科委等课题3项；2002年起先后担任同济大学、江苏大学、上海二军大硕士生导师。\r\n曾获首届世界创新医学大会优秀论文一等奖，获同济大学“临床医疗成果奖”1项。主研国家级课题2项，市级课题2项。心内科工作成就曾被多家媒体报道。');
/*!40000 ALTER TABLE `xz_zjteam_copy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-14 10:46:41
