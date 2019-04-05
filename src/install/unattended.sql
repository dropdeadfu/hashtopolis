-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mariadb    Database: htp
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB-1:10.3.14+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AccessGroup`
--

DROP TABLE IF EXISTS `AccessGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessGroup` (
  `accessGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`accessGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessGroup`
--

LOCK TABLES `AccessGroup` WRITE;
/*!40000 ALTER TABLE `AccessGroup` DISABLE KEYS */;
INSERT INTO `AccessGroup` VALUES (1,'Default Group');
/*!40000 ALTER TABLE `AccessGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccessGroupAgent`
--

DROP TABLE IF EXISTS `AccessGroupAgent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessGroupAgent` (
  `accessGroupAgentId` int(11) NOT NULL AUTO_INCREMENT,
  `accessGroupId` int(11) NOT NULL,
  `agentId` int(11) NOT NULL,
  PRIMARY KEY (`accessGroupAgentId`),
  KEY `accessGroupId` (`accessGroupId`),
  KEY `agentId` (`agentId`),
  CONSTRAINT `AccessGroupAgent_ibfk_1` FOREIGN KEY (`accessGroupId`) REFERENCES `AccessGroup` (`accessGroupId`),
  CONSTRAINT `AccessGroupAgent_ibfk_2` FOREIGN KEY (`agentId`) REFERENCES `Agent` (`agentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessGroupAgent`
--

LOCK TABLES `AccessGroupAgent` WRITE;
/*!40000 ALTER TABLE `AccessGroupAgent` DISABLE KEYS */;
/*!40000 ALTER TABLE `AccessGroupAgent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccessGroupUser`
--

DROP TABLE IF EXISTS `AccessGroupUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessGroupUser` (
  `accessGroupUserId` int(11) NOT NULL AUTO_INCREMENT,
  `accessGroupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`accessGroupUserId`),
  KEY `accessGroupId` (`accessGroupId`),
  KEY `userId` (`userId`),
  CONSTRAINT `AccessGroupUser_ibfk_1` FOREIGN KEY (`accessGroupId`) REFERENCES `AccessGroup` (`accessGroupId`),
  CONSTRAINT `AccessGroupUser_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessGroupUser`
--

LOCK TABLES `AccessGroupUser` WRITE;
/*!40000 ALTER TABLE `AccessGroupUser` DISABLE KEYS */;
INSERT INTO `AccessGroupUser` VALUES (1,1,1);
/*!40000 ALTER TABLE `AccessGroupUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Agent`
--

DROP TABLE IF EXISTS `Agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Agent` (
  `agentId` int(11) NOT NULL AUTO_INCREMENT,
  `agentName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `os` int(11) NOT NULL,
  `devices` text COLLATE utf8_unicode_ci NOT NULL,
  `cmdPars` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ignoreErrors` tinyint(4) NOT NULL,
  `isActive` tinyint(4) NOT NULL,
  `isTrusted` tinyint(4) NOT NULL,
  `token` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastAct` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastTime` int(11) NOT NULL,
  `lastIp` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `cpuOnly` tinyint(4) NOT NULL,
  `clientSignature` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`agentId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Agent_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agent`
--

LOCK TABLES `Agent` WRITE;
/*!40000 ALTER TABLE `Agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `Agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentBinary`
--

DROP TABLE IF EXISTS `AgentBinary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentBinary` (
  `agentBinaryId` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `operatingSystems` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`agentBinaryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentBinary`
--

LOCK TABLES `AgentBinary` WRITE;
/*!40000 ALTER TABLE `AgentBinary` DISABLE KEYS */;
INSERT INTO `AgentBinary` VALUES (1,'csharp','0.52.2','Windows, Linux(mono), OS X(mono)','hashtopolis.exe'),(2,'python','0.1.4','Windows, Linux, OS X','hashtopolis.zip');
/*!40000 ALTER TABLE `AgentBinary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentError`
--

DROP TABLE IF EXISTS `AgentError`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentError` (
  `agentErrorId` int(11) NOT NULL AUTO_INCREMENT,
  `agentId` int(11) NOT NULL,
  `taskId` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `error` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`agentErrorId`),
  KEY `agentId` (`agentId`),
  KEY `taskId` (`taskId`),
  CONSTRAINT `AgentError_ibfk_1` FOREIGN KEY (`agentId`) REFERENCES `Agent` (`agentId`),
  CONSTRAINT `AgentError_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `Task` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentError`
--

LOCK TABLES `AgentError` WRITE;
/*!40000 ALTER TABLE `AgentError` DISABLE KEYS */;
/*!40000 ALTER TABLE `AgentError` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentStat`
--

DROP TABLE IF EXISTS `AgentStat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentStat` (
  `agentStatId` int(11) NOT NULL AUTO_INCREMENT,
  `agentId` int(11) NOT NULL,
  `statType` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`agentStatId`),
  KEY `agentId` (`agentId`),
  CONSTRAINT `AgentStat_ibfk_1` FOREIGN KEY (`agentId`) REFERENCES `Agent` (`agentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentStat`
--

LOCK TABLES `AgentStat` WRITE;
/*!40000 ALTER TABLE `AgentStat` DISABLE KEYS */;
/*!40000 ALTER TABLE `AgentStat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentZap`
--

DROP TABLE IF EXISTS `AgentZap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentZap` (
  `agentZapId` int(11) NOT NULL AUTO_INCREMENT,
  `agentId` int(11) NOT NULL,
  `lastZapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`agentZapId`),
  KEY `agentId` (`agentId`),
  KEY `lastZapId` (`lastZapId`),
  CONSTRAINT `AgentZap_ibfk_1` FOREIGN KEY (`agentId`) REFERENCES `Agent` (`agentId`),
  CONSTRAINT `AgentZap_ibfk_2` FOREIGN KEY (`lastZapId`) REFERENCES `Zap` (`zapId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentZap`
--

LOCK TABLES `AgentZap` WRITE;
/*!40000 ALTER TABLE `AgentZap` DISABLE KEYS */;
/*!40000 ALTER TABLE `AgentZap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assignment` (
  `assignmentId` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` int(11) NOT NULL,
  `agentId` int(11) NOT NULL,
  `benchmark` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`assignmentId`),
  KEY `taskId` (`taskId`),
  KEY `agentId` (`agentId`),
  CONSTRAINT `Assignment_ibfk_1` FOREIGN KEY (`taskId`) REFERENCES `Task` (`taskId`),
  CONSTRAINT `Assignment_ibfk_2` FOREIGN KEY (`agentId`) REFERENCES `Agent` (`agentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Chunk`
--

DROP TABLE IF EXISTS `Chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chunk` (
  `chunkId` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` int(11) NOT NULL,
  `skip` bigint(20) NOT NULL,
  `length` bigint(20) NOT NULL,
  `agentId` int(11) DEFAULT NULL,
  `dispatchTime` int(11) NOT NULL,
  `solveTime` int(11) NOT NULL,
  `checkpoint` bigint(20) NOT NULL,
  `progress` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `cracked` int(11) NOT NULL,
  `speed` bigint(20) NOT NULL,
  PRIMARY KEY (`chunkId`),
  KEY `taskId` (`taskId`),
  KEY `agentId` (`agentId`),
  CONSTRAINT `Chunk_ibfk_1` FOREIGN KEY (`taskId`) REFERENCES `Task` (`taskId`),
  CONSTRAINT `Chunk_ibfk_2` FOREIGN KEY (`agentId`) REFERENCES `Agent` (`agentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chunk`
--

LOCK TABLES `Chunk` WRITE;
/*!40000 ALTER TABLE `Chunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `Chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Config`
--

DROP TABLE IF EXISTS `Config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config` (
  `configId` int(11) NOT NULL AUTO_INCREMENT,
  `configSectionId` int(11) NOT NULL,
  `item` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`configId`),
  KEY `configSectionId` (`configSectionId`),
  CONSTRAINT `Config_ibfk_1` FOREIGN KEY (`configSectionId`) REFERENCES `ConfigSection` (`configSectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Config`
--

LOCK TABLES `Config` WRITE;
/*!40000 ALTER TABLE `Config` DISABLE KEYS */;
INSERT INTO `Config` VALUES (1,1,'agenttimeout','30'),(2,1,'benchtime','30'),(3,1,'chunktime','600'),(4,1,'chunktimeout','30'),(9,1,'fieldseparator',':'),(10,1,'hashlistAlias','#HL#'),(11,1,'statustimer','5'),(12,4,'timefmt','d.m.Y, H:i:s'),(13,1,'blacklistChars','&|`\"\'{}()[]$<>'),(14,3,'numLogEntries','5000'),(15,1,'disptolerance','20'),(16,3,'batchSize','50000'),(18,2,'yubikey_id',''),(19,2,'yubikey_key',''),(20,2,'yubikey_url','http://api.yubico.com/wsapi/2.0/verify'),(21,4,'donateOff','0'),(22,3,'pagingSize','5000'),(23,3,'plainTextMaxLength','200'),(24,3,'hashMaxLength','1024'),(25,5,'emailSender','hashtopolis@example.org'),(26,5,'emailSenderName','Hashtopolis'),(27,5,'baseHost',''),(28,3,'maxHashlistSize','5000000'),(29,4,'hideImportMasks','1'),(30,5,'telegramBotToken',''),(31,5,'contactEmail',''),(32,5,'voucherDeletion','0'),(33,4,'hashesPerPage','1000'),(34,4,'hideIpInfo','0'),(35,1,'defaultBenchmark','1'),(36,4,'showTaskPerformance','0'),(37,5,'baseUrl',''),(38,5,'baseUrl','');
/*!40000 ALTER TABLE `Config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConfigSection`
--

DROP TABLE IF EXISTS `ConfigSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConfigSection` (
  `configSectionId` int(11) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`configSectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConfigSection`
--

LOCK TABLES `ConfigSection` WRITE;
/*!40000 ALTER TABLE `ConfigSection` DISABLE KEYS */;
INSERT INTO `ConfigSection` VALUES (1,'Cracking/Tasks'),(2,'Yubikey'),(3,'Finetuning'),(4,'UI'),(5,'Server');
/*!40000 ALTER TABLE `ConfigSection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CrackerBinary`
--

DROP TABLE IF EXISTS `CrackerBinary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrackerBinary` (
  `crackerBinaryId` int(11) NOT NULL AUTO_INCREMENT,
  `crackerBinaryTypeId` int(11) NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `downloadUrl` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `binaryName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`crackerBinaryId`),
  KEY `crackerBinaryTypeId` (`crackerBinaryTypeId`),
  CONSTRAINT `CrackerBinary_ibfk_1` FOREIGN KEY (`crackerBinaryTypeId`) REFERENCES `CrackerBinaryType` (`crackerBinaryTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CrackerBinary`
--

LOCK TABLES `CrackerBinary` WRITE;
/*!40000 ALTER TABLE `CrackerBinary` DISABLE KEYS */;
/*!40000 ALTER TABLE `CrackerBinary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CrackerBinaryType`
--

DROP TABLE IF EXISTS `CrackerBinaryType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrackerBinaryType` (
  `crackerBinaryTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `isChunkingAvailable` int(11) NOT NULL,
  PRIMARY KEY (`crackerBinaryTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CrackerBinaryType`
--

LOCK TABLES `CrackerBinaryType` WRITE;
/*!40000 ALTER TABLE `CrackerBinaryType` DISABLE KEYS */;
/*!40000 ALTER TABLE `CrackerBinaryType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `File` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `size` bigint(20) NOT NULL,
  `isSecret` int(11) NOT NULL,
  `fileType` int(11) NOT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `File`
--

LOCK TABLES `File` WRITE;
/*!40000 ALTER TABLE `File` DISABLE KEYS */;
/*!40000 ALTER TABLE `File` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FilePretask`
--

DROP TABLE IF EXISTS `FilePretask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FilePretask` (
  `filePretaskId` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `pretaskId` int(11) NOT NULL,
  PRIMARY KEY (`filePretaskId`),
  KEY `fileId` (`fileId`),
  KEY `pretaskId` (`pretaskId`),
  CONSTRAINT `FilePretask_ibfk_1` FOREIGN KEY (`fileId`) REFERENCES `File` (`fileId`),
  CONSTRAINT `FilePretask_ibfk_2` FOREIGN KEY (`pretaskId`) REFERENCES `Pretask` (`pretaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilePretask`
--

LOCK TABLES `FilePretask` WRITE;
/*!40000 ALTER TABLE `FilePretask` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilePretask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileTask`
--

DROP TABLE IF EXISTS `FileTask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileTask` (
  `fileTaskId` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `taskId` int(11) NOT NULL,
  PRIMARY KEY (`fileTaskId`),
  KEY `fileId` (`fileId`),
  KEY `taskId` (`taskId`),
  CONSTRAINT `FileTask_ibfk_1` FOREIGN KEY (`fileId`) REFERENCES `File` (`fileId`),
  CONSTRAINT `FileTask_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `Task` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileTask`
--

LOCK TABLES `FileTask` WRITE;
/*!40000 ALTER TABLE `FileTask` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileTask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hash`
--

DROP TABLE IF EXISTS `Hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hash` (
  `hashId` int(11) NOT NULL AUTO_INCREMENT,
  `hashlistId` int(11) NOT NULL,
  `hash` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plaintext` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeCracked` int(11) DEFAULT NULL,
  `chunkId` int(11) DEFAULT NULL,
  `isCracked` tinyint(4) NOT NULL,
  PRIMARY KEY (`hashId`),
  KEY `hashlistId` (`hashlistId`),
  KEY `chunkId` (`chunkId`),
  KEY `isCracked` (`isCracked`),
  KEY `hash` (`hash`),
  CONSTRAINT `Hash_ibfk_1` FOREIGN KEY (`hashlistId`) REFERENCES `Hashlist` (`hashlistId`),
  CONSTRAINT `Hash_ibfk_2` FOREIGN KEY (`chunkId`) REFERENCES `Chunk` (`chunkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hash`
--

LOCK TABLES `Hash` WRITE;
/*!40000 ALTER TABLE `Hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HashBinary`
--

DROP TABLE IF EXISTS `HashBinary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HashBinary` (
  `hashBinaryId` int(11) NOT NULL AUTO_INCREMENT,
  `hashlistId` int(11) NOT NULL,
  `essid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hash` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `plaintext` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timeCracked` int(11) DEFAULT NULL,
  `chunkId` int(11) DEFAULT NULL,
  `isCracked` tinyint(4) NOT NULL,
  PRIMARY KEY (`hashBinaryId`),
  KEY `hashlistId` (`hashlistId`),
  KEY `chunkId` (`chunkId`),
  CONSTRAINT `HashBinary_ibfk_1` FOREIGN KEY (`hashlistId`) REFERENCES `Hashlist` (`hashlistId`),
  CONSTRAINT `HashBinary_ibfk_2` FOREIGN KEY (`chunkId`) REFERENCES `Chunk` (`chunkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HashBinary`
--

LOCK TABLES `HashBinary` WRITE;
/*!40000 ALTER TABLE `HashBinary` DISABLE KEYS */;
/*!40000 ALTER TABLE `HashBinary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HashType`
--

DROP TABLE IF EXISTS `HashType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HashType` (
  `hashTypeId` int(11) NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `isSalted` tinyint(4) NOT NULL,
  PRIMARY KEY (`hashTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HashType`
--

LOCK TABLES `HashType` WRITE;
/*!40000 ALTER TABLE `HashType` DISABLE KEYS */;
INSERT INTO `HashType` VALUES (0,'MD5',0),(10,'md5($pass.$salt)',1),(11,'Joomla < 2.5.18',1),(12,'PostgreSQL',1),(20,'md5($salt.$pass)',1),(21,'osCommerce, xt:Commerce',1),(22,'Juniper Netscreen/SSG (ScreenOS)',1),(23,'Skype',1),(30,'md5(unicode($pass).$salt)',1),(40,'md5($salt.unicode($pass))',1),(50,'HMAC-MD5 (key = $pass)',1),(60,'HMAC-MD5 (key = $salt)',1),(100,'SHA1',0),(101,'nsldap, SHA-1(Base64), Netscape LDAP SHA',0),(110,'sha1($pass.$salt)',1),(111,'nsldaps, SSHA-1(Base64), Netscape LDAP SSHA',0),(112,'Oracle S: Type (Oracle 11+)',1),(120,'sha1($salt.$pass)',1),(121,'SMF >= v1.1',1),(122,'OS X v10.4, v10.5, v10.6',0),(123,'EPi',0),(124,'Django (SHA-1)',0),(125,'ArubaOS',0),(130,'sha1(unicode($pass).$salt)',1),(131,'MSSQL(2000)',0),(132,'MSSQL(2005)',0),(133,'PeopleSoft',0),(140,'sha1($salt.unicode($pass))',1),(141,'EPiServer 6.x < v4',0),(150,'HMAC-SHA1 (key = $pass)',1),(160,'HMAC-SHA1 (key = $salt)',1),(200,'MySQL323',0),(300,'MySQL4.1/MySQL5+',0),(400,'phpass, MD5(Wordpress), MD5(Joomla), MD5(phpBB3)',0),(500,'md5crypt, MD5(Unix), FreeBSD MD5, Cisco-IOS MD5 2',0),(501,'Juniper IVE',0),(600,'BLAKE2b-512',0),(900,'MD4',0),(1000,'NTLM',0),(1100,'Domain Cached Credentials (DCC), MS Cache',1),(1300,'SHA-224',0),(1400,'SHA256',0),(1410,'sha256($pass.$salt)',1),(1411,'SSHA-256(Base64), LDAP {SSHA256}',0),(1420,'sha256($salt.$pass)',1),(1421,'hMailServer',0),(1430,'sha256(unicode($pass).$salt)',1),(1440,'sha256($salt.unicode($pass))',1),(1441,'EPiServer 6.x >= v4',0),(1450,'HMAC-SHA256 (key = $pass)',1),(1460,'HMAC-SHA256 (key = $salt)',1),(1500,'descrypt, DES(Unix), Traditional DES',0),(1600,'md5apr1, MD5(APR), Apache MD5',0),(1700,'SHA512',0),(1710,'sha512($pass.$salt)',1),(1711,'SSHA-512(Base64), LDAP {SSHA512}',0),(1720,'sha512($salt.$pass)',1),(1722,'OS X v10.7',0),(1730,'sha512(unicode($pass).$salt)',1),(1731,'MSSQL(2012), MSSQL(2014)',0),(1740,'sha512($salt.unicode($pass))',1),(1750,'HMAC-SHA512 (key = $pass)',1),(1760,'HMAC-SHA512 (key = $salt)',1),(1800,'sha512crypt, SHA512(Unix)',0),(2100,'Domain Cached Credentials 2 (DCC2), MS Cache',0),(2400,'Cisco-PIX MD5',0),(2410,'Cisco-ASA MD5',1),(2500,'WPA/WPA2',0),(2600,'md5(md5($pass))',0),(2611,'vBulletin < v3.8.5',1),(2612,'PHPS',0),(2711,'vBulletin >= v3.8.5',1),(2811,'IPB2+, MyBB1.2+',1),(3000,'LM',0),(3100,'Oracle H: Type (Oracle 7+), DES(Oracle)',1),(3200,'bcrypt, Blowfish(OpenBSD)',0),(3710,'md5($salt.md5($pass))',1),(3711,'Mediawiki B type',0),(3800,'md5($salt.$pass.$salt)',1),(3910,'md5(md5($pass).md5($salt))',1),(4010,'md5($salt.md5($salt.$pass))',1),(4110,'md5($salt.md5($pass.$salt))',1),(4300,'md5(strtoupper(md5($pass)))',0),(4400,'md5(sha1($pass))',0),(4500,'sha1(sha1($pass))',0),(4520,'sha1($salt.sha1($pass))',1),(4521,'Redmine Project Management Web App',0),(4522,'PunBB',0),(4700,'sha1(md5($pass))',0),(4800,'MD5(Chap), iSCSI CHAP authentication',1),(4900,'sha1($salt.$pass.$salt)',1),(5000,'SHA-3(Keccak)',0),(5100,'Half MD5',0),(5200,'Password Safe v3',0),(5300,'IKE-PSK MD5',0),(5400,'IKE-PSK SHA1',0),(5500,'NetNTLMv1-VANILLA / NetNTLMv1+ESS',0),(5600,'NetNTLMv2',0),(5700,'Cisco-IOS SHA256',0),(5800,'Samsung Android Password/PIN',1),(6000,'RipeMD160',0),(6100,'Whirlpool',0),(6211,'TrueCrypt 5.0+ PBKDF2-HMAC-RipeMD160 + AES/Serpent/Twofish',0),(6212,'TrueCrypt 5.0+ PBKDF2-HMAC-RipeMD160 + AES-Twofish/Serpent-AES/Twofish-Serpent',0),(6213,'TrueCrypt 5.0+ PBKDF2-HMAC-RipeMD160 + AES-Twofish-Serpent/Serpent-Twofish-AES',0),(6221,'TrueCrypt 5.0+ SHA512 + AES/Serpent/Twofish',0),(6222,'TrueCrypt 5.0+ SHA512 + AES-Twofish/Serpent-AES/Twofish-Serpent',0),(6223,'TrueCrypt 5.0+ SHA512 + AES-Twofish-Serpent/Serpent-Twofish-AES',0),(6231,'TrueCrypt 5.0+ Whirlpool + AES/Serpent/Twofish',0),(6232,'TrueCrypt 5.0+ Whirlpool + AES-Twofish/Serpent-AES/Twofish-Serpent',0),(6233,'TrueCrypt 5.0+ Whirlpool + AES-Twofish-Serpent/Serpent-Twofish-AES',0),(6241,'TrueCrypt 5.0+ PBKDF2-HMAC-RipeMD160 + AES/Serpent/Twofish + boot',0),(6242,'TrueCrypt 5.0+ PBKDF2-HMAC-RipeMD160 + AES-Twofish/Serpent-AES/Twofish-Serpent + boot',0),(6243,'TrueCrypt 5.0+ PBKDF2-HMAC-RipeMD160 + AES-Twofish-Serpent/Serpent-Twofish-AES + boot',0),(6300,'AIX {smd5}',0),(6400,'AIX {ssha256}',0),(6500,'AIX {ssha512}',0),(6600,'1Password, Agile Keychain',0),(6700,'AIX {ssha1}',0),(6800,'Lastpass',1),(6900,'GOST R 34.11-94',0),(7000,'Fortigate (FortiOS)',0),(7100,'OS X v10.8 / v10.9',0),(7200,'GRUB 2',0),(7300,'IPMI2 RAKP HMAC-SHA1',1),(7400,'sha256crypt, SHA256(Unix)',0),(7500,'Kerberos 5 AS-REQ Pre-Auth',0),(7700,'SAP CODVN B (BCODE)',0),(7800,'SAP CODVN F/G (PASSCODE)',0),(7900,'Drupal7',0),(8000,'Sybase ASE',0),(8100,'Citrix Netscaler',0),(8200,'1Password, Cloud Keychain',0),(8300,'DNSSEC (NSEC3)',1),(8400,'WBB3, Woltlab Burning Board 3',1),(8500,'RACF',0),(8600,'Lotus Notes/Domino 5',0),(8700,'Lotus Notes/Domino 6',0),(8800,'Android FDE <= 4.3',0),(8900,'scrypt',1),(9000,'Password Safe v2',0),(9100,'Lotus Notes/Domino',0),(9200,'Cisco $8$',0),(9300,'Cisco $9$',0),(9400,'Office 2007',0),(9500,'Office 2010',0),(9600,'Office 2013',0),(9700,'MS Office ⇐ 2003 MD5 + RC4, oldoffice$0, oldoffice$1',0),(9710,'MS Office <= 2003 $0/$1, MD5 + RC4, collider #1',0),(9720,'MS Office <= 2003 $0/$1, MD5 + RC4, collider #2',0),(9800,'MS Office ⇐ 2003 SHA1 + RC4, oldoffice$3, oldoffice$4',0),(9810,'MS Office <= 2003 $3, SHA1 + RC4, collider #1',0),(9820,'MS Office <= 2003 $3, SHA1 + RC4, collider #2',0),(9900,'Radmin2',0),(10000,'Django (PBKDF2-SHA256)',0),(10100,'SipHash',1),(10200,'Cram MD5',0),(10300,'SAP CODVN H (PWDSALTEDHASH) iSSHA-1',0),(10400,'PDF 1.1 - 1.3 (Acrobat 2 - 4)',0),(10410,'PDF 1.1 - 1.3 (Acrobat 2 - 4), collider #1',0),(10420,'PDF 1.1 - 1.3 (Acrobat 2 - 4), collider #2',0),(10500,'PDF 1.4 - 1.6 (Acrobat 5 - 8)',0),(10600,'PDF 1.7 Level 3 (Acrobat 9)',0),(10700,'PDF 1.7 Level 8 (Acrobat 10 - 11)',0),(10800,'SHA384',0),(10900,'PBKDF2-HMAC-SHA256',1),(11000,'PrestaShop',1),(11100,'PostgreSQL Challenge-Response Authentication (MD5)',0),(11200,'MySQL Challenge-Response Authentication (SHA1)',0),(11300,'Bitcoin/Litecoin wallet.dat',0),(11400,'SIP digest authentication (MD5)',0),(11500,'CRC32',1),(11600,'7-Zip',0),(11700,'GOST R 34.11-2012 (Streebog) 256-bit',0),(11800,'GOST R 34.11-2012 (Streebog) 512-bit',0),(11900,'PBKDF2-HMAC-MD5',1),(12000,'PBKDF2-HMAC-SHA1',1),(12001,'Atlassian (PBKDF2-HMAC-SHA1)',0),(12100,'PBKDF2-HMAC-SHA512',1),(12200,'eCryptfs',0),(12300,'Oracle T: Type (Oracle 12+)',0),(12400,'BSDiCrypt, Extended DES',0),(12500,'RAR3-hp',0),(12600,'ColdFusion 10+',1),(12700,'Blockchain, My Wallet',0),(12800,'MS-AzureSync PBKDF2-HMAC-SHA256',0),(12900,'Android FDE (Samsung DEK)',0),(13000,'RAR5',0),(13100,'Kerberos 5 TGS-REP etype 23',0),(13200,'AxCrypt',0),(13300,'AxCrypt in memory SHA1',0),(13400,'Keepass 1/2 AES/Twofish with/without keyfile',0),(13500,'PeopleSoft PS_TOKEN',1),(13600,'WinZip',0),(13711,'VeraCrypt PBKDF2-HMAC-RIPEMD160 + AES, Serpent, Twofish',0),(13712,'VeraCrypt PBKDF2-HMAC-RIPEMD160 + AES-Twofish, Serpent-AES, Twofish-Serpent',0),(13713,'VeraCrypt PBKDF2-HMAC-RIPEMD160 + Serpent-Twofish-AES',0),(13721,'VeraCrypt PBKDF2-HMAC-SHA512 + AES, Serpent, Twofish',0),(13722,'VeraCrypt PBKDF2-HMAC-SHA512 + AES-Twofish, Serpent-AES, Twofish-Serpent',0),(13723,'VeraCrypt PBKDF2-HMAC-SHA512 + Serpent-Twofish-AES',0),(13731,'VeraCrypt PBKDF2-HMAC-Whirlpool + AES, Serpent, Twofish',0),(13732,'VeraCrypt PBKDF2-HMAC-Whirlpool + AES-Twofish, Serpent-AES, Twofish-Serpent',0),(13733,'VeraCrypt PBKDF2-HMAC-Whirlpool + Serpent-Twofish-AES',0),(13751,'VeraCrypt PBKDF2-HMAC-SHA256 + AES, Serpent, Twofish',0),(13752,'VeraCrypt PBKDF2-HMAC-SHA256 + AES-Twofish, Serpent-AES, Twofish-Serpent',0),(13753,'VeraCrypt PBKDF2-HMAC-SHA256 + Serpent-Twofish-AES',0),(13800,'Windows 8+ phone PIN/Password',1),(13900,'OpenCart',1),(14000,'DES (PT = $salt, key = $pass)',1),(14100,'3DES (PT = $salt, key = $pass)',1),(14400,'sha1(CX)',1),(14600,'LUKS 10',0),(14700,'iTunes Backup < 10.0 11',0),(14800,'iTunes Backup >= 10.0 11',0),(14900,'Skip32 12',1),(15000,'FileZilla Server >= 0.9.55',1),(15100,'Juniper/NetBSD sha1crypt',0),(15200,'Blockchain, My Wallet, V2',0),(15300,'DPAPI masterkey file v1 and v2',0),(15400,'ChaCha20',0),(15500,'JKS Java Key Store Private Keys (SHA1)',0),(15600,'Ethereum Wallet, PBKDF2-HMAC-SHA256',0),(15700,'Ethereum Wallet, SCRYPT',0),(15900,'DPAPI master key file version 2 + Active Directory domain context',0),(16000,'Tripcode',0),(16100,'TACACS+',0),(16200,'Apple Secure Notes',0),(16300,'Ethereum Pre-Sale Wallet, PBKDF2-HMAC-SHA256',0),(16400,'CRAM-MD5 Dovecot',0),(16500,'JWT (JSON Web Token)',0),(16600,'Electrum Wallet (Salt-Type 1-3)',0),(99999,'Plaintext',0);
/*!40000 ALTER TABLE `HashType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hashlist`
--

DROP TABLE IF EXISTS `Hashlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hashlist` (
  `hashlistId` int(11) NOT NULL AUTO_INCREMENT,
  `hashlistName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `format` int(11) NOT NULL,
  `hashTypeId` int(11) NOT NULL,
  `hashCount` int(11) NOT NULL,
  `saltSeparator` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cracked` int(11) NOT NULL,
  `isSecret` int(11) NOT NULL,
  `hexSalt` int(11) NOT NULL,
  `isSalted` tinyint(4) NOT NULL,
  `accessGroupId` int(11) NOT NULL,
  PRIMARY KEY (`hashlistId`),
  KEY `hashTypeId` (`hashTypeId`),
  CONSTRAINT `Hashlist_ibfk_1` FOREIGN KEY (`hashTypeId`) REFERENCES `HashType` (`hashTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hashlist`
--

LOCK TABLES `Hashlist` WRITE;
/*!40000 ALTER TABLE `Hashlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hashlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HashlistHashlist`
--

DROP TABLE IF EXISTS `HashlistHashlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HashlistHashlist` (
  `hashlistHashlistId` int(11) NOT NULL AUTO_INCREMENT,
  `parentHashlistId` int(11) NOT NULL,
  `hashlistId` int(11) NOT NULL,
  PRIMARY KEY (`hashlistHashlistId`),
  KEY `parentHashlistId` (`parentHashlistId`),
  KEY `hashlistId` (`hashlistId`),
  CONSTRAINT `HashlistHashlist_ibfk_1` FOREIGN KEY (`parentHashlistId`) REFERENCES `Hashlist` (`hashlistId`),
  CONSTRAINT `HashlistHashlist_ibfk_2` FOREIGN KEY (`hashlistId`) REFERENCES `Hashlist` (`hashlistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HashlistHashlist`
--

LOCK TABLES `HashlistHashlist` WRITE;
/*!40000 ALTER TABLE `HashlistHashlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `HashlistHashlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LogEntry`
--

DROP TABLE IF EXISTS `LogEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LogEntry` (
  `logEntryId` int(11) NOT NULL AUTO_INCREMENT,
  `issuer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `issuerId` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`logEntryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LogEntry`
--

LOCK TABLES `LogEntry` WRITE;
/*!40000 ALTER TABLE `LogEntry` DISABLE KEYS */;
INSERT INTO `LogEntry` VALUES (1,'User','1','information','Successful login!',1554504271);
/*!40000 ALTER TABLE `LogEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NotificationSetting`
--

DROP TABLE IF EXISTS `NotificationSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NotificationSetting` (
  `notificationSettingId` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `objectId` int(11) DEFAULT NULL,
  `notification` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `receiver` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(4) NOT NULL,
  PRIMARY KEY (`notificationSettingId`),
  KEY `userId` (`userId`),
  CONSTRAINT `NotificationSetting_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NotificationSetting`
--

LOCK TABLES `NotificationSetting` WRITE;
/*!40000 ALTER TABLE `NotificationSetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `NotificationSetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pretask`
--

DROP TABLE IF EXISTS `Pretask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pretask` (
  `pretaskId` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `attackCmd` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `chunkTime` int(11) NOT NULL,
  `statusTimer` int(11) NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `isSmall` int(11) NOT NULL,
  `isCpuTask` int(11) NOT NULL,
  `useNewBench` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `isMaskImport` int(11) NOT NULL,
  `crackerBinaryTypeId` int(11) NOT NULL,
  PRIMARY KEY (`pretaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pretask`
--

LOCK TABLES `Pretask` WRITE;
/*!40000 ALTER TABLE `Pretask` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pretask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegVoucher`
--

DROP TABLE IF EXISTS `RegVoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegVoucher` (
  `regVoucherId` int(11) NOT NULL AUTO_INCREMENT,
  `voucher` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`regVoucherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegVoucher`
--

LOCK TABLES `RegVoucher` WRITE;
/*!40000 ALTER TABLE `RegVoucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegVoucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RightGroup`
--

DROP TABLE IF EXISTS `RightGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RightGroup` (
  `rightGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`rightGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RightGroup`
--

LOCK TABLES `RightGroup` WRITE;
/*!40000 ALTER TABLE `RightGroup` DISABLE KEYS */;
INSERT INTO `RightGroup` VALUES (1,'Administrator','ALL');
/*!40000 ALTER TABLE `RightGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Session` (
  `sessionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `sessionStartDate` int(11) NOT NULL,
  `lastActionDate` int(11) NOT NULL,
  `isOpen` int(11) NOT NULL,
  `sessionLifetime` int(11) NOT NULL,
  `sessionKey` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sessionId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Session_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
INSERT INTO `Session` VALUES (1,1,1554504271,1554504271,1,3600,'f7fb121a1f8f0f89a5e420caff19a2c330ebcd663531271dc8b752670b2abd70');
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StoredValue`
--

DROP TABLE IF EXISTS `StoredValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StoredValue` (
  `storedValueId` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `val` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`storedValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StoredValue`
--

LOCK TABLES `StoredValue` WRITE;
/*!40000 ALTER TABLE `StoredValue` DISABLE KEYS */;
/*!40000 ALTER TABLE `StoredValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supertask`
--

DROP TABLE IF EXISTS `Supertask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supertask` (
  `supertaskId` int(11) NOT NULL AUTO_INCREMENT,
  `supertaskName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`supertaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supertask`
--

LOCK TABLES `Supertask` WRITE;
/*!40000 ALTER TABLE `Supertask` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supertask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SupertaskPretask`
--

DROP TABLE IF EXISTS `SupertaskPretask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SupertaskPretask` (
  `supertaskPretaskId` int(11) NOT NULL AUTO_INCREMENT,
  `supertaskId` int(11) NOT NULL,
  `pretaskId` int(11) NOT NULL,
  PRIMARY KEY (`supertaskPretaskId`),
  KEY `supertaskId` (`supertaskId`),
  KEY `pretaskId` (`pretaskId`),
  CONSTRAINT `SupertaskPretask_ibfk_1` FOREIGN KEY (`supertaskId`) REFERENCES `Supertask` (`supertaskId`),
  CONSTRAINT `SupertaskPretask_ibfk_2` FOREIGN KEY (`pretaskId`) REFERENCES `Pretask` (`pretaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupertaskPretask`
--

LOCK TABLES `SupertaskPretask` WRITE;
/*!40000 ALTER TABLE `SupertaskPretask` DISABLE KEYS */;
/*!40000 ALTER TABLE `SupertaskPretask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Task` (
  `taskId` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `attackCmd` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `chunkTime` int(11) NOT NULL,
  `statusTimer` int(11) NOT NULL,
  `keyspace` bigint(20) NOT NULL,
  `keyspaceProgress` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isSmall` int(11) NOT NULL,
  `isCpuTask` int(11) NOT NULL,
  `useNewBench` int(11) NOT NULL,
  `skipKeyspace` bigint(20) NOT NULL,
  `crackerBinaryId` int(11) DEFAULT NULL,
  `crackerBinaryTypeId` int(11) DEFAULT NULL,
  `taskWrapperId` int(11) NOT NULL,
  PRIMARY KEY (`taskId`),
  KEY `crackerBinaryId` (`crackerBinaryId`),
  CONSTRAINT `Task_ibfk_1` FOREIGN KEY (`crackerBinaryId`) REFERENCES `CrackerBinary` (`crackerBinaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task`
--

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;
/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TaskWrapper`
--

DROP TABLE IF EXISTS `TaskWrapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskWrapper` (
  `taskWrapperId` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL,
  `taskType` int(11) NOT NULL,
  `hashlistId` int(11) NOT NULL,
  `accessGroupId` int(11) DEFAULT NULL,
  `taskWrapperName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`taskWrapperId`),
  KEY `hashlistId` (`hashlistId`),
  KEY `accessGroupId` (`accessGroupId`),
  CONSTRAINT `TaskWrapper_ibfk_1` FOREIGN KEY (`hashlistId`) REFERENCES `Hashlist` (`hashlistId`),
  CONSTRAINT `TaskWrapper_ibfk_2` FOREIGN KEY (`accessGroupId`) REFERENCES `AccessGroup` (`accessGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TaskWrapper`
--

LOCK TABLES `TaskWrapper` WRITE;
/*!40000 ALTER TABLE `TaskWrapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `TaskWrapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `passwordHash` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `passwordSalt` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `isValid` int(11) NOT NULL,
  `isComputedPassword` int(11) NOT NULL,
  `lastLoginDate` int(11) NOT NULL,
  `registeredSince` int(11) NOT NULL,
  `sessionLifetime` int(11) NOT NULL,
  `rightGroupId` int(11) NOT NULL,
  `yubikey` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp1` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp2` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp3` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp4` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  KEY `rightGroupId` (`rightGroupId`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`rightGroupId`) REFERENCES `RightGroup` (`rightGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'admin','atom@hashcat.net','$2y$12$fiqBNQZlVyG3zAOzRPkxpOJQfP/zx5rrBvSGKAEtbGlVfZdmo9Fku','BQEzXz2SD7ivKcOKdOCt',1,1,1554504271,1554504260,3600,1,'0','','','','');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zap`
--

DROP TABLE IF EXISTS `Zap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zap` (
  `zapId` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `solveTime` int(11) NOT NULL,
  `agentId` int(11) DEFAULT NULL,
  `hashlistId` int(11) NOT NULL,
  PRIMARY KEY (`zapId`),
  KEY `agentId` (`agentId`),
  KEY `hashlistId` (`hashlistId`),
  CONSTRAINT `Zap_ibfk_1` FOREIGN KEY (`agentId`) REFERENCES `Agent` (`agentId`),
  CONSTRAINT `Zap_ibfk_2` FOREIGN KEY (`hashlistId`) REFERENCES `Hashlist` (`hashlistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zap`
--

LOCK TABLES `Zap` WRITE;
/*!40000 ALTER TABLE `Zap` DISABLE KEYS */;
/*!40000 ALTER TABLE `Zap` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-05 22:46:01
