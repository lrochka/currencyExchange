CREATE DATABASE  IF NOT EXISTS `currencyexchange` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `currencyexchange`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: currencyexchange
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `acl_class`
--

DROP TABLE IF EXISTS `acl_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_class` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_entry`
--

DROP TABLE IF EXISTS `acl_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_entry` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `acl_object_identity` bigint(20) unsigned NOT NULL,
  `ace_order` bigint(20) unsigned NOT NULL,
  `sid` bigint(20) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL DEFAULT '1',
  `audit_success` tinyint(1) NOT NULL DEFAULT '0',
  `audit_failure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_entry_idx_1` (`acl_object_identity`,`ace_order`),
  KEY `sid` (`sid`),
  CONSTRAINT `acl_entry_ibfk_1` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`),
  CONSTRAINT `acl_entry_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_object_identity`
--

DROP TABLE IF EXISTS `acl_object_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id_class` bigint(20) unsigned NOT NULL,
  `object_id_identity` bigint(20) unsigned NOT NULL,
  `parent_object` bigint(20) unsigned DEFAULT NULL,
  `owner_sid` bigint(20) unsigned DEFAULT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_object_identity_idx_1` (`object_id_class`,`object_id_identity`),
  KEY `parent_object` (`parent_object`),
  KEY `owner_sid` (`owner_sid`),
  CONSTRAINT `acl_object_identity_ibfk_1` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`),
  CONSTRAINT `acl_object_identity_ibfk_2` FOREIGN KEY (`parent_object`) REFERENCES `acl_object_identity` (`id`),
  CONSTRAINT `acl_object_identity_ibfk_3` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_sid`
--

DROP TABLE IF EXISTS `acl_sid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_sid` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principal` tinyint(1) NOT NULL,
  `sid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_sid_idx_1` (`sid`,`principal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sphone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ncompany` bigint(20) unsigned NOT NULL,
  `nuser` bigint(20) unsigned NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nclninsrc` smallint(5) unsigned NOT NULL DEFAULT '1',
  `nclnstats` smallint(5) unsigned NOT NULL DEFAULT '1',
  `ndealcnt` int(11) NOT NULL DEFAULT '0',
  `ndonedealcnt` int(11) NOT NULL DEFAULT '0',
  `ndeallatecnt` int(11) NOT NULL DEFAULT '0',
  `ddate_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ddate_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_idx_1` (`sphone`,`ncompany`),
  KEY `nclninsrc` (`nclninsrc`),
  KEY `nclnstats` (`nclnstats`),
  KEY `ncompany` (`ncompany`),
  KEY `clients_ibfk_4_idx` (`nuser`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`nclninsrc`) REFERENCES `clninsrc` (`id`),
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`nclnstats`) REFERENCES `clnstats` (`id`),
  CONSTRAINT `clients_ibfk_3` FOREIGN KEY (`ncompany`) REFERENCES `companies` (`id`),
  CONSTRAINT `clients_ibfk_4` FOREIGN KEY (`nuser`) REFERENCES `userlist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER currencyexchange.clients_AFTER_INSERT 
AFTER INSERT 
ON currencyexchange.clients 
FOR EACH ROW
BEGIN

INSERT INTO currencyexchange.logclients(nclient,ncompany,nuser,sphone,sname,nclninsrc,nclnstats,ndealcnt,ndonedealcnt,ndeallatecnt)
VALUES(NEW.id,NEW.ncompany,NEW.nuser,NEW.sphone,NEW.sname,NEW.nclninsrc,NEW.nclnstats,NEW.ndealcnt,NEW.ndonedealcnt,NEW.ndeallatecnt);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER currencyexchange.clients_AFTER_UPDATE 
AFTER UPDATE 
ON currencyexchange.clients 
FOR EACH ROW
BEGIN

INSERT INTO currencyexchange.logclients(nclient,ncompany,nuser,sphone,sname,nclninsrc,nclnstats,ndealcnt,ndonedealcnt,ndeallatecnt)
VALUES(NEW.id,NEW.ncompany,NEW.nuser,NEW.sphone,NEW.sname,NEW.nclninsrc,NEW.nclnstats,NEW.ndealcnt,NEW.ndonedealcnt,NEW.ndeallatecnt);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clncontacts`
--

DROP TABLE IF EXISTS `clncontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clncontacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nclient` bigint(20) unsigned NOT NULL,
  `nuser` bigint(20) unsigned NOT NULL,
  `nclntypecontact` smallint(5) unsigned NOT NULL,
  `svalue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ddate_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ddate_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clncontacts_idx_1` (`nclient`,`nclntypecontact`,`svalue`),
  KEY `clncontacts_ibfk_2` (`nclntypecontact`),
  KEY `clncontacts_ibfk_3_idx` (`nuser`),
  CONSTRAINT `clncontacts_ibfk_1` FOREIGN KEY (`nclient`) REFERENCES `clients` (`id`),
  CONSTRAINT `clncontacts_ibfk_2` FOREIGN KEY (`nclntypecontact`) REFERENCES `clntypecontact` (`id`),
  CONSTRAINT `clncontacts_ibfk_3` FOREIGN KEY (`nuser`) REFERENCES `userlist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER currencyexchange.clncontacts_AFTER_INSERT 
AFTER INSERT 
ON currencyexchange.clncontacts 
FOR EACH ROW
BEGIN

INSERT INTO `currencyexchange`.`logclncontacts`
(nclient,nclntypecontact,nclncontact,nuser,svalue)
VALUES(NEW.nclient,NEW.nclntypecontact,NEW.id,NEW.nuser,NEW.svalue);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER currencyexchange.clncontacts_AFTER_UPDATE 
AFTER UPDATE 
ON currencyexchange.clncontacts 
FOR EACH ROW
BEGIN

INSERT INTO `currencyexchange`.`logclncontacts`
(nclient,nclntypecontact,nclncontact,nuser,svalue)
VALUES(NEW.nclient,NEW.nclntypecontact,NEW.id,NEW.nuser,NEW.svalue);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clndescr`
--

DROP TABLE IF EXISTS `clndescr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clndescr` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clninsrc`
--

DROP TABLE IF EXISTS `clninsrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clninsrc` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clnstats`
--

DROP TABLE IF EXISTS `clnstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clnstats` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clntypecontact`
--

DROP TABLE IF EXISTS `clntypecontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clntypecontact` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  `sname` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  `scity` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logclients`
--

DROP TABLE IF EXISTS `logclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logclients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nclient` bigint(20) unsigned NOT NULL,
  `ncompany` bigint(20) unsigned NOT NULL,
  `nuser` bigint(20) unsigned NOT NULL,
  `sphone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nclninsrc` smallint(5) unsigned NOT NULL DEFAULT '1',
  `nclnstats` smallint(5) unsigned NOT NULL DEFAULT '1',
  `ndealcnt` int(11) NOT NULL DEFAULT '0',
  `ndonedealcnt` int(11) NOT NULL DEFAULT '0',
  `ndeallatecnt` int(11) NOT NULL DEFAULT '0',
  `ddate_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sphone` (`sphone`),
  KEY `nclninsrc` (`nclninsrc`),
  KEY `nclnstats` (`nclnstats`),
  KEY `ncompany` (`ncompany`),
  KEY `nclient` (`nclient`),
  KEY `nuser` (`nuser`),
  CONSTRAINT `logclients_ibfk_1` FOREIGN KEY (`nclninsrc`) REFERENCES `clninsrc` (`id`),
  CONSTRAINT `logclients_ibfk_2` FOREIGN KEY (`nclnstats`) REFERENCES `clnstats` (`id`),
  CONSTRAINT `logclients_ibfk_3` FOREIGN KEY (`ncompany`) REFERENCES `companies` (`id`),
  CONSTRAINT `logclients_ibfk_4` FOREIGN KEY (`nclient`) REFERENCES `clients` (`id`),
  CONSTRAINT `logclients_ibfk_5` FOREIGN KEY (`nuser`) REFERENCES `userlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logclncontacts`
--

DROP TABLE IF EXISTS `logclncontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logclncontacts` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nclient` bigint(20) unsigned NOT NULL,
  `nclntypecontact` smallint(5) unsigned NOT NULL,
  `nclncontact` bigint(20) unsigned NOT NULL,
  `nuser` bigint(20) unsigned NOT NULL,
  `svalue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ddate_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `nclient` (`nclient`),
  KEY `nuser` (`nuser`),
  KEY `nclncontact` (`nclncontact`),
  KEY `logclncontacts_ibfk_2` (`nclntypecontact`),
  CONSTRAINT `logclncontacts_ibfk_1` FOREIGN KEY (`nclient`) REFERENCES `clients` (`id`),
  CONSTRAINT `logclncontacts_ibfk_2` FOREIGN KEY (`nclntypecontact`) REFERENCES `clntypecontact` (`id`),
  CONSTRAINT `logclncontacts_ibfk_3` FOREIGN KEY (`nuser`) REFERENCES `userlist` (`id`),
  CONSTRAINT `logclncontacts_ibfk_4` FOREIGN KEY (`nclncontact`) REFERENCES `clncontacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nsection` bigint(20) unsigned NOT NULL,
  `spropCode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spropNameEN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spropNameUA` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spropNameRU` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nsection` (`nsection`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`nsection`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  `sname` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scode` (`scode`),
  UNIQUE KEY `sname` (`sname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nrole` bigint(20) unsigned NOT NULL,
  `npermission` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_permission_idx1` (`nrole`,`npermission`),
  KEY `npermission` (`npermission`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`nrole`) REFERENCES `role` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`npermission`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nclass` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nclass` (`nclass`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`nclass`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userlist`
--

DROP TABLE IF EXISTS `userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slogin` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  `sfirst_name` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  `slast_name` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  `semail` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci NOT NULL,
  `sphone` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0123456789',
  `spassword` varchar(64) CHARACTER SET cp1251 COLLATE cp1251_ukrainian_ci DEFAULT NULL,
  `benabled` tinyint(1) NOT NULL,
  `ncompany` bigint(20) unsigned DEFAULT '1',
  `ddate_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ddate_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slogin` (`slogin`),
  UNIQUE KEY `userlist_idx_1` (`slogin`),
  UNIQUE KEY `userlist_idx_2` (`semail`),
  KEY `userlist_ibfk_2` (`ncompany`),
  CONSTRAINT `userlist_ibfk_2` FOREIGN KEY (`ncompany`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nuser` bigint(20) unsigned NOT NULL,
  `nrole` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userrole_idx_1` (`nuser`,`nrole`),
  KEY `nrole` (`nrole`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`nuser`) REFERENCES `userlist` (`id`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`nrole`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'currencyexchange'
--

--
-- Dumping routines for database 'currencyexchange'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-04 19:16:17
