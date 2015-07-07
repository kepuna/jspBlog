-- MySQL dump 10.13  Distrib 5.1.46, for Win32 (ia32)
--
-- Host: localhost    Database: blogdb
-- ------------------------------------------------------
-- Server version	5.1.46-community

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `title` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleIntro` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(20000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_1` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (15,11,'123','sdgasgagas','<p>asdgsadgsdg</p>\r\n','2015-04-11 07:42:22'),(16,12,'zhongyugaodingle ',NULL,'<p>asdgasdgsdgasdgasdgasdg</p>\r\n','2015-04-11 08:00:37'),(17,13,'sadgsafg','34sfgsfdg','<p>asbgsfbgfgs</p>\r\n','2015-04-12 23:02:31'),(18,20,'fdhdfhsdg','fdshdfhdf','<p>asfbsfb</p>\r\n','2015-04-12 23:02:46'),(19,20,'sagwr','gdfshfh','<p>sadgsfhsf</p>\r\n','2015-04-12 23:03:19'),(20,12,'45','3454','<p>sdgsagsafgasf</p>\r\n','2015-04-15 08:36:00'),(21,12,'JS实现分享到微博的功能','本内容修改策划那个','<p>This is my textarea to be replaced with CKEditor.</p>\r\n','2015-04-15 08:36:12'),(22,20,'sdfasgs','sdgsafgasg','<p>sdgagsgs</p>\r\n','2015-04-15 11:55:34'),(23,12,'sdgasg','dfgdfgdf','<p>This is my textarea to be replaced with CKEditor.</p>\r\n','2015-04-15 11:55:44'),(24,11,'sdgdafgdf','dghghsgh','<p>This is my textarea to be replaced with CKEditor.</p>\r\n','2015-04-15 11:55:58'),(25,12,'JS运动','原声JS实现运动效果','<p>This is my textarea to be replaced with CKEditor.</p>\r\n','2015-04-16 10:03:44'),(26,13,'weile ','sdgasgasg','<p>sdgasdgrjfgjfg</p>\r\n','2015-04-21 03:53:09'),(27,20,'sdfhgerhsdf','adfhdafhsdhs','<ol>\r\n	<li><strong><span style=\"font-size:20px\"><span style=\"font-family:comic sans ms,cursive\">dfhadfherhdfh</span></span></strong></li>\r\n	<li><strong><span style=\"font-size:20px\"><span style=\"font-family:comic sans ms,cursive\">sdljglkasjdglsdg</span></span></strong></li>\r\n</ol>\r\n','2015-04-21 03:53:57'),(28,11,'终于修改完成了','博客终于快完成了，比较高兴','<p><strong>进太难终于要玩车过了</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n','2015-04-27 05:14:25'),(29,20,'发表第一排按微博违法','啊算法嘎斯法国萨芬噶三个发噶司法官','<p>上的嘎斯嘎斯发噶斯发个三发的个发的个</p>\r\n\r\n<p>上的嘎斯嘎斯发噶斯发个三发的个发的个上的嘎斯嘎斯发噶斯发个三发的个发的个</p>\r\n\r\n<p>上的嘎斯嘎斯发噶斯发个三发的个发的个上的嘎斯嘎斯发噶斯发个三发的个发的个</p>\r\n','2015-04-27 11:39:32'),(30,20,'怎么回事那','这里不是第三个','<p>是否嘎斯发噶是否</p>\r\n','2015-04-27 20:24:50');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (11,'过去的日子',10),(12,'js学习',12),(13,'CSS笔记修改',10),(15,'现在的日子',3),(20,'JAVA_学习',12);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_2` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (8,53,'sdgsfdg','bdsfghadfsg','2015-03-31 00:25:57'),(10,53,'匿名','啊三嘎司法官','2015-03-31 00:28:42'),(13,56,'keyi','sgsadgsdkeyoba','2015-03-31 07:42:54'),(14,56,'xinnew','fsdgadf','2015-04-01 08:30:30'),(16,55,'fdgsag','asfgasg','2015-04-04 01:52:25'),(17,55,'gfhf','sadgasd','2015-04-04 01:52:33'),(18,52,'fdgdfg','fdgafdda','2015-04-04 05:12:41'),(19,15,'ddd','sfdgsfag','2015-04-10 22:50:54'),(20,15,'第一次','第一次在啫哩潘尼管略','2015-04-10 22:51:17'),(21,15,'哈哈','感觉写的噶挺不错的，下我那个nidsfnasgdg撒帝国时代富商大贾撒的嘎斯的嘎斯法国萨嘎萨嘎萨嘎十多个士大夫伽师瓜撒个上的伽师瓜三国杀仨公司嘎斯\r\n哈哈','2015-04-10 22:52:01'),(22,16,'shafa','地去哦到沙发分了','2015-04-10 23:00:49'),(23,16,'积极为','申达股份十多个','2015-04-10 23:06:09'),(24,16,'liuxia',NULL,'2015-04-10 23:19:06'),(25,16,'匿名',NULL,'2015-04-10 23:19:49'),(26,16,'sdgsadg','sagsag','2015-04-10 23:19:56'),(27,19,'sfgas','fdhgsdfh','2015-04-10 23:20:08'),(28,17,'试着提交一个','的噶规定','2015-04-11 05:53:34'),(29,16,'zhangshan','sdgasdgsagasdga','2015-04-18 06:02:28'),(30,24,'dfgasfd','safgsdfg','2015-04-27 23:06:04'),(31,24,'dfgasfd','safgsdfg','2015-04-27 23:06:10');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'xx','c8837b23ff8aaa8a2dde915473ce0991'),(4,'zj','202cb962ac59075b964b07152d234b70');
insert into users(username,password) values("vvv",md5("111")) ;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-28  3:53:43
