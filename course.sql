-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: course
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `merchant` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES (1,'陨蹄铁',30,1,'IMG/clevis.jpg',3),(2,'齿轮',35,1,'IMG/gear.jpg',1),(3,'煤油灯',31,1,'IMG/lamp.jpg',3),(4,'芙芙的狗粮配方',34,1,'IMG/paper.jpg',2),(5,'石榴果汁',39,1,'IMG/potion.jpg',2),(6,'占卜球',53,1,'IMG/snake.jpg',1);
INSERT INTO `commodity` VALUES (201,'陨蹄铁ex',300,2,'IMG/clevis.jpg',3);
INSERT INTO `commodity` VALUES (301,'陨蹄铁ssr',999,3,'IMG/clevis.jpg',3);
INSERT INTO `commodity` VALUES (401,'+1s',1,4,'IMG/xys.jpg',3);
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `income` double DEFAULT '0',
  `image` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `class` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (1,251,'IMG/njupt.jpg','加勒底（南邮分部）',1),(2,0,'IMG/house.jpg','蒙娜丽莎工坊',3),(3,0,'IMG/ygf.jpg','杨国福原料店',NULL),(4,0,'IMG/sjsr.jpg','时间旅行商',NULL);
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellrecord`
--

DROP TABLE IF EXISTS `sellrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer` int(11) DEFAULT NULL,
  `commodity` varchar(20) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellrecord`
--

LOCK TABLES `sellrecord` WRITE;
/*!40000 ALTER TABLE `sellrecord` DISABLE KEYS */;
INSERT INTO `sellrecord` VALUES (1,1,'1',15,'2017-4-7 21:00'),(2,2,'1',10,'2017-4-11 17:56'),(3,1,'3|4|',65,'2017-04-12 18:37:39'),(4,1,'1|3|',61,'2017-04-12 18:43:15'),(5,3,'2|3|4|',100,'2017-04-13 12:19:05');
/*!40000 ALTER TABLE `sellrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlist`
--

DROP TABLE IF EXISTS `userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `cost` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlist`
--

LOCK TABLES `userlist` WRITE;
/*!40000 ALTER TABLE `userlist` DISABLE KEYS */;
INSERT INTO `userlist` VALUES (1,'test123','15851811286','25f9e794323b453885f5181f1b624d0b','南京邮电大学兰苑',141),(2,'youyuge','18362933375','4297f44b13955235245b2497399d7a93','111',0),(3,'wangxiaoming','15851811286','25f9e794323b453885f5181f1b624d0b','南京邮电大学仙林校区菊苑',100);
/*!40000 ALTER TABLE `userlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14 11:04:32
