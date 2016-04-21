-- MySQL dump 10.13  Distrib 5.6.26, for osx10.8 (x86_64)
--
-- Host: localhost    Database: grade_grabber
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(4) NOT NULL,
  `course_number` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (31,'AAS',100,'Intro Asian American Studies'),(32,'AAS',211,'Asian Americans and the Arts'),(33,'AAS',258,'Muslims in America'),(34,'AAS',287,'Food and Asian Americans'),(35,'AAS',390,'Race, Memory, and Violence'),(36,'AAS',490,'Social Movements'),(37,'ABE',100,'Intro Agric & Biological Engrg'),(38,'ABE',199,'Undergraduate Open Seminar'),(39,'ABE',223,'ABE Principles: Machine Syst'),(40,'ABE',224,'ABE Principles: Soil & Water'),(41,'ABE',341,'Transport Processes in ABE'),(42,'ABE',361,'Off-Road Machine Design'),(43,'ABE',398,'International Experience'),(44,'ABE',430,'Project Management'),(45,'ABE',455,'Erosion and Sediment Control'),(46,'ABE',463,'Electrohydraulic Systems'),(47,'ABE',466,'Engineering Off-Road Vehicles'),(48,'ABE',483,'Engrg Properties of Food Matls'),(49,'ABE',488,'Bioprocessing Biomass for Fuel'),(50,'ACCY',200,'Fundamentals of Accounting'),(51,'ACCY',201,'Accounting and Accountancy I'),(52,'ACCY',202,'Accounting and Accountancy II'),(53,'ACCY',301,'Atg Measurement & Disclosure'),(54,'ACCY',302,'Decision Making for Atg'),(55,'ACCY',303,'Atg Institutions and Reg'),(56,'ACCY',304,'Accounting Control Systems'),(57,'ACCY',312,'Principles of Taxation'),(58,'ACCY',398,'Practical Problems in Atg'),(59,'ACCY',405,'Assurance and Attestation'),(60,'ACCY',410,'Advanced Financial Reporting');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `grade_aggregates`
--

DROP TABLE IF EXISTS `grade_aggregates`;
/*!50001 DROP VIEW IF EXISTS `grade_aggregates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `grade_aggregates` AS SELECT 
 1 AS `c_id`,
 1 AS `subject`,
 1 AS `course_number`,
 1 AS `title`,
 1 AS `AVG(g.average_gpa)`,
 1 AS `SUM(g.a_plus_count)`,
 1 AS `SUM(g.a_count)`,
 1 AS `SUM(g.a_minus_count)`,
 1 AS `SUM(g.b_plus_count)`,
 1 AS `SUM(g.b_count)`,
 1 AS `SUM(g.b_minus_count)`,
 1 AS `SUM(g.c_plus_count)`,
 1 AS `SUM(g.c_count)`,
 1 AS `SUM(g.c_minus_count)`,
 1 AS `SUM(g.d_plus_count)`,
 1 AS `SUM(g.d_count)`,
 1 AS `SUM(g.d_minus_count)`,
 1 AS `SUM(g.f_count)`,
 1 AS `sum(g.w_count)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grade_counts`
--

DROP TABLE IF EXISTS `grade_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_counts` (
  `c_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `average_gpa` decimal(3,2) DEFAULT NULL,
  `a_plus_count` int(11) DEFAULT NULL,
  `a_count` int(11) DEFAULT NULL,
  `a_minus_count` int(11) DEFAULT NULL,
  `b_plus_count` int(11) DEFAULT NULL,
  `b_count` int(11) DEFAULT NULL,
  `b_minus_count` int(11) DEFAULT NULL,
  `c_plus_count` int(11) DEFAULT NULL,
  `c_count` int(11) DEFAULT NULL,
  `c_minus_count` int(11) DEFAULT NULL,
  `d_plus_count` int(11) DEFAULT NULL,
  `d_count` int(11) DEFAULT NULL,
  `d_minus_count` int(11) DEFAULT NULL,
  `f_count` int(11) DEFAULT NULL,
  `w_count` int(11) DEFAULT NULL,
  UNIQUE KEY `c_id` (`c_id`,`s_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `grade_counts_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`) ON UPDATE CASCADE,
  CONSTRAINT `grade_counts_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `semesters` (`s_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_counts`
--

LOCK TABLES `grade_counts` WRITE;
/*!40000 ALTER TABLE `grade_counts` DISABLE KEYS */;
INSERT INTO `grade_counts` VALUES (31,101,3.03,2,7,4,4,5,1,2,2,0,0,0,1,2,0),(31,102,3.69,6,19,2,2,1,1,0,1,0,0,0,0,1,0),(31,103,3.72,2,15,6,2,2,2,0,0,0,0,0,0,0,0),(31,104,3.58,1,14,7,5,0,0,2,2,0,0,0,0,0,0),(31,105,3.39,3,11,4,3,6,2,0,1,1,0,0,1,0,0),(31,106,3.25,2,9,4,5,4,2,0,4,0,0,0,0,1,0),(31,107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,109,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,110,3.62,7,15,2,3,3,1,1,0,0,0,0,0,1,0),(35,111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,113,3.11,0,23,0,0,22,0,0,5,0,0,3,0,2,0),(38,114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,115,3.80,8,36,3,2,3,0,0,0,0,1,1,0,0,0),(40,116,3.46,5,32,5,1,7,0,2,3,2,0,3,0,0,0),(41,117,2.97,0,2,4,4,5,5,0,0,1,1,1,0,0,0),(42,118,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,119,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,120,3.23,1,24,11,29,48,5,4,7,1,0,0,0,0,0),(45,121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,123,3.22,0,4,11,8,6,2,1,2,0,0,0,0,1,0),(48,124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,125,3.33,3,4,6,7,3,4,0,1,1,0,0,0,0,1),(50,126,3.19,4,72,59,50,40,29,23,12,10,6,3,1,1,0),(51,127,3.49,7,8,6,4,3,4,0,1,1,0,0,0,0,0),(51,128,3.28,4,6,9,3,6,4,1,2,2,0,0,0,0,0),(51,129,3.44,8,8,8,3,4,1,2,0,0,0,1,0,1,0),(51,130,3.09,4,4,10,5,3,4,1,0,3,0,2,0,1,0),(51,131,2.96,2,6,1,7,5,3,3,1,1,0,2,0,1,0),(51,132,3.20,2,2,12,4,4,6,1,0,0,0,2,0,0,2),(51,133,3.09,4,5,9,1,2,3,5,1,3,0,0,0,1,0),(51,134,3.20,4,7,9,7,1,5,3,0,0,0,1,0,2,0),(51,135,3.33,5,8,9,2,2,2,0,0,1,0,2,0,1,0),(51,136,3.40,4,13,4,4,4,5,1,2,1,0,0,0,0,0),(51,137,3.02,1,9,7,5,4,3,3,0,2,0,2,0,2,0),(51,138,2.98,3,7,3,6,5,4,2,1,0,0,4,0,1,0),(51,139,3.19,4,3,5,5,4,1,1,1,0,0,1,0,1,0),(51,140,3.22,5,9,5,3,3,4,3,0,3,0,0,0,1,0),(51,141,3.40,5,6,11,6,1,5,0,2,0,0,1,0,0,0),(51,142,3.40,4,9,8,2,3,3,2,3,0,0,0,0,0,2),(51,143,3.08,5,6,9,4,5,0,1,2,2,0,2,0,2,0),(51,144,3.12,4,6,6,3,2,1,1,3,1,0,3,0,0,0),(52,145,3.07,1,7,2,4,5,3,1,2,0,0,1,0,1,0),(52,146,3.14,1,9,7,10,8,4,2,0,3,0,1,0,1,1),(52,147,3.39,3,16,2,10,4,3,3,2,1,0,0,0,0,0),(52,148,3.41,1,11,10,10,7,2,3,1,0,0,0,0,0,0),(52,149,3.37,1,9,8,12,8,4,1,1,0,0,0,0,0,0),(52,150,3.28,1,6,9,13,6,3,1,0,0,0,2,0,0,1),(53,151,3.04,0,6,3,7,5,1,3,2,2,0,1,0,0,0),(53,152,3.40,0,11,5,2,10,0,1,2,0,0,0,0,0,0),(53,153,3.61,0,13,8,3,6,1,0,0,0,0,0,0,0,0),(53,154,3.30,0,8,8,5,8,1,1,2,0,1,0,0,0,0),(53,155,3.45,0,13,6,0,9,2,0,2,0,0,0,0,0,0),(53,156,3.44,0,5,13,2,11,1,0,0,0,0,0,0,0,0),(53,157,3.18,0,7,4,5,9,3,3,1,1,0,0,0,0,0),(53,158,3.47,1,11,7,4,3,0,1,2,1,0,0,0,0,0),(53,159,3.50,0,9,8,5,5,3,0,0,0,0,0,0,0,1),(54,160,3.16,0,5,5,8,3,7,0,0,0,1,0,1,0,1),(54,161,3.31,0,4,7,9,9,4,0,0,0,0,0,0,0,0),(54,162,3.37,0,4,11,9,5,3,0,1,0,0,0,0,0,0),(54,163,3.34,1,6,8,6,5,3,2,1,0,0,0,0,0,0),(54,164,3.41,0,7,9,5,9,3,0,0,0,0,0,0,0,0),(54,165,3.20,2,5,3,4,9,7,1,1,0,0,0,0,0,0),(54,166,3.37,1,8,6,3,12,1,2,0,0,0,0,0,0,0),(54,167,3.38,0,11,5,5,7,5,0,0,1,0,0,0,0,0),(55,168,3.11,0,6,11,6,5,0,1,2,2,1,1,1,0,0),(55,169,3.47,3,7,7,14,3,2,0,0,1,0,0,0,0,0),(55,170,3.46,4,10,8,8,4,0,0,3,0,1,0,0,0,0),(55,171,3.32,1,6,10,7,7,3,3,1,0,0,0,0,0,0),(55,172,3.38,0,7,12,11,3,2,1,0,1,1,0,0,0,0),(55,173,3.26,1,9,10,6,4,4,0,0,2,1,0,0,1,0),(56,174,3.28,1,12,3,4,6,2,5,0,2,0,0,0,0,0),(56,175,3.30,0,7,4,11,10,3,2,0,0,0,0,0,0,0),(56,176,3.32,0,11,2,10,7,5,1,0,1,0,0,0,0,0),(56,177,3.18,0,10,6,2,7,7,0,1,0,0,1,0,1,0),(56,178,3.22,0,11,4,2,12,4,0,3,0,0,1,0,0,0),(56,179,3.57,0,12,11,7,5,2,0,0,0,0,0,0,0,0),(57,180,3.18,0,7,7,7,9,5,2,2,0,0,1,0,0,0),(57,181,3.35,4,6,7,8,8,2,3,1,0,0,0,0,0,0),(57,182,3.38,3,6,11,6,7,4,3,0,0,0,0,0,0,0),(57,183,3.21,1,10,0,3,9,2,0,2,1,0,1,0,0,1),(57,184,3.14,2,2,13,6,4,1,5,1,1,2,0,0,0,0),(57,185,3.46,3,7,15,7,1,4,0,0,1,1,0,0,0,0),(57,186,3.29,4,1,8,15,6,3,1,2,0,0,0,0,0,0),(58,187,3.98,34,1,0,1,0,0,0,0,0,0,0,0,0,1),(59,188,3.36,0,3,10,16,2,4,1,0,0,0,0,0,0,0),(59,189,3.33,5,4,4,13,4,2,1,0,1,1,0,0,0,0),(59,190,3.29,0,12,5,1,9,3,2,2,1,0,0,0,0,0),(59,191,3.42,0,10,9,4,11,0,0,1,1,0,0,0,0,0),(59,192,3.11,0,1,6,9,10,6,3,0,0,0,0,0,0,0),(59,193,3.29,1,3,8,14,2,2,3,0,1,0,0,0,0,0),(59,194,3.44,0,8,10,9,5,3,1,0,0,0,0,0,0,0),(60,195,3.20,2,5,4,2,11,3,3,1,0,0,0,0,0,0),(60,196,3.55,2,8,11,2,3,3,1,0,0,0,0,0,0,0),(60,197,3.06,0,2,6,5,8,6,1,1,0,0,0,1,0,0),(60,198,3.54,3,14,4,5,4,2,0,1,1,0,0,0,0,0),(60,199,3.21,0,7,2,4,11,7,1,0,0,0,0,0,0,0),(60,200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grade_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `c_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `crn` varchar(6) NOT NULL,
  `raw_term` varchar(6) NOT NULL,
  `parsed_term` varchar(4) NOT NULL,
  `section` varchar(4) NOT NULL,
  `instructor` varchar(75) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (31,101,'41758','120148','FA14','AD1','Thomas, Merin A'),(31,102,'47100','120148','FA14','AD2','Thomas, Merin A'),(31,103,'47102','120148','FA14','AD3','Peralta, Christine N'),(31,104,'51248','120148','FA14','AD4','Peralta, Christine N'),(31,105,'51249','120148','FA14','AD5','Lee, Sang S'),(31,106,'51932','120148','FA14','AD6','Lee, Sang S'),(31,107,'56496','120148','FA14','B','Paik, Angela N'),(32,108,'53947','120148','FA14','A','Nguyen, Mimi T'),(33,109,'58913','120148','FA14','A','Rana, Junaid'),(34,110,'58092','120148','FA14','A','Manalansan, Martin F'),(35,111,'51335','120148','FA14','NPU','Paik, Angela N'),(36,112,'31301','120148','FA14','JRU','Rana, Junaid'),(37,113,'31263','120148','FA14','B','Green, Angela R'),(38,114,'55376','120148','FA14','CHP','Kalita, Prasanta K'),(39,115,'58927','120148','FA14','AL1','Grift, Tony E'),(40,116,'58931','120148','FA14','AL1','Kalita, Prasanta K'),(41,117,'57598','120148','FA14','MGD','Rausch, Kent D'),(42,118,'29651','120148','FA14','AL1','Hansen, Alan C'),(43,119,'64349','120148','FA14','SZ','Zahos, Stephen C'),(44,120,'36669','120148','FA14','A','Schideman, Lance C'),(45,121,'49611','120148','FA14','AB1','Bhattarai, Rabin'),(46,122,'56114','120148','FA14','TEG','Grift, Tony E'),(47,123,'31280','120148','FA14','AL1','Hansen, Alan C'),(48,124,'29663','120148','FA14','A','Rausch, Kent D'),(49,125,'57478','120148','FA14','VS','Singh, Vijay'),(50,126,'29670','120148','FA14','OL','Silhan, Peter A'),(51,127,'36478','120148','FA14','AD1','Korte, Brianne E'),(51,128,'36482','120148','FA14','AD3','Korte, Brianne E'),(51,129,'36484','120148','FA14','AD4','Koziel, Mark C'),(51,130,'36486','120148','FA14','AD6','Pollard, Robert C'),(51,131,'36487','120148','FA14','AD7','Michelson, Mark J'),(51,132,'36489','120148','FA14','AD8','Koziel, Mark C'),(51,133,'36494','120148','FA14','ADA','Pollard, Robert C'),(51,134,'36496','120148','FA14','ADB','Michelson, Mark J'),(51,135,'36499','120148','FA14','ADC','Mora, Bradley J'),(51,136,'36502','120148','FA14','ADD','McConnell, Kelly R'),(51,137,'36506','120148','FA14','ADE','McConnell, Kelly R'),(51,138,'36509','120148','FA14','ADF','Zhang, Fangye'),(51,139,'36516','120148','FA14','ADH','Mora, Bradley J'),(51,140,'36522','120148','FA14','ADI','Tong, Shuqing'),(51,141,'36526','120148','FA14','ADJ','Storto, Joseph M'),(51,142,'36536','120148','FA14','ADL','Tong, Shuqing'),(51,143,'36538','120148','FA14','ADM','Storto, Joseph M'),(51,144,'36543','120148','FA14','ADN','Zhang, Fangye'),(52,145,'36552','120148','FA14','AD1','Jin, Yiyun'),(52,146,'36556','120148','FA14','AD2','Jin, Yiyun'),(52,147,'36560','120148','FA14','AD3','Ladd, Dylan T'),(52,148,'36565','120148','FA14','AD4','Ladd, Dylan T'),(52,149,'36568','120148','FA14','AD5','Lie, Jeane Natalia'),(52,150,'36574','120148','FA14','AD6','Lie, Jeane Natalia'),(53,151,'36577','120148','FA14','AE1','Winn, Amanda M'),(53,152,'36581','120148','FA14','AE2','Winn, Amanda M'),(53,153,'36584','120148','FA14','AE3','Winn, Amanda M'),(53,154,'36587','120148','FA14','AE4','Jackson, Kevin'),(53,155,'36590','120148','FA14','AE5','Jackson, Kevin'),(53,156,'36592','120148','FA14','AE6','Finnegan, Thomas'),(53,157,'36596','120148','FA14','AE7','Finnegan, Thomas'),(53,158,'36598','120148','FA14','AE8','Jackson, Kevin'),(53,159,'49255','120148','FA14','AEB','Finnegan, Thomas'),(54,160,'36610','120148','FA14','AE1','Autrey, Romana L'),(54,161,'36614','120148','FA14','AE2','Autrey, Romana L'),(54,162,'36618','120148','FA14','AE3','Finnegan, Thomas'),(54,163,'36677','120148','FA14','AE4','Zhang, Li'),(54,164,'36680','120148','FA14','AE5','Autrey, Romana L'),(54,165,'36688','120148','FA14','AE8','Chen, Xiaoling'),(54,166,'49257','120148','FA14','AE9','Chen, Xiaoling'),(54,167,'49258','120148','FA14','AEA','Chen, Xiaoling'),(55,168,'36692','120148','FA14','AE1','Li, Wei'),(55,169,'36700','120148','FA14','AE2','Li, Wei'),(55,170,'36701','120148','FA14','AE3','Brown, Timothy J'),(55,171,'36713','120148','FA14','AE4','Brown, Timothy J'),(55,172,'49259','120148','FA14','AE5','Li, Wei'),(55,173,'36703','120148','FA14','AE6','Brown, Timothy J'),(56,174,'31317','120148','FA14','AE1','Koo, Seung Hyun'),(56,175,'31318','120148','FA14','AE2','Koo, Seung Hyun'),(56,176,'31319','120148','FA14','AE3','Koo, Seung Hyun'),(56,177,'31320','120148','FA14','AE4','Wang, Wei'),(56,178,'49280','120148','FA14','AE5','Wang, Wei'),(56,179,'62036','120148','FA14','AE6','Wang, Wei'),(57,180,'31321','120148','FA14','A','Bauer, Andrew M'),(57,181,'31324','120148','FA14','B','Bauer, Andrew M'),(57,182,'31330','120148','FA14','C','Bauer, Andrew M'),(57,183,'31332','120148','FA14','D','Holder, Daniel E'),(57,184,'31333','120148','FA14','E','Donohoe, Michael P'),(57,185,'45719','120148','FA14','F','Donohoe, Michael P'),(57,186,'45934','120148','FA14','G','Donohoe, Michael P'),(58,187,'61229','120148','FA14','A','Nekrasz, Frank'),(59,188,'36758','120148','FA14','AE2','Bauer, Timothy D'),(59,189,'36764','120148','FA14','AE3','Bauer, Timothy D'),(59,190,'36768','120148','FA14','AE4','Peecher, Mark E'),(59,191,'36771','120148','FA14','AE5','Peecher, Mark E'),(59,192,'36775','120148','FA14','AE6','Asante Appiah, Bright'),(59,193,'54162','120148','FA14','AE7','Bauer, Timothy D'),(59,194,'59161','120148','FA14','AE8','Asante Appiah, Bright'),(60,195,'29671','120148','FA14','A','Steward, Cynthia G'),(60,196,'61231','120148','FA14','B','Steward, Cynthia G'),(60,197,'62729','120148','FA14','C','Steward, Cynthia G'),(60,198,'62730','120148','FA14','D','Kustanovich, Michael'),(60,199,'62731','120148','FA14','E','Kustanovich, Michael'),(60,200,'62732','120148','FA14','F','Kustanovich, Michael');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `grade_aggregates`
--

/*!50001 DROP VIEW IF EXISTS `grade_aggregates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `grade_aggregates` AS select `c`.`c_id` AS `c_id`,`c`.`subject` AS `subject`,`c`.`course_number` AS `course_number`,`c`.`title` AS `title`,avg(`g`.`average_gpa`) AS `AVG(g.average_gpa)`,sum(`g`.`a_plus_count`) AS `SUM(g.a_plus_count)`,sum(`g`.`a_count`) AS `SUM(g.a_count)`,sum(`g`.`a_minus_count`) AS `SUM(g.a_minus_count)`,sum(`g`.`b_plus_count`) AS `SUM(g.b_plus_count)`,sum(`g`.`b_count`) AS `SUM(g.b_count)`,sum(`g`.`b_minus_count`) AS `SUM(g.b_minus_count)`,sum(`g`.`c_plus_count`) AS `SUM(g.c_plus_count)`,sum(`g`.`c_count`) AS `SUM(g.c_count)`,sum(`g`.`c_minus_count`) AS `SUM(g.c_minus_count)`,sum(`g`.`d_plus_count`) AS `SUM(g.d_plus_count)`,sum(`g`.`d_count`) AS `SUM(g.d_count)`,sum(`g`.`d_minus_count`) AS `SUM(g.d_minus_count)`,sum(`g`.`f_count`) AS `SUM(g.f_count)`,sum(`g`.`w_count`) AS `sum(g.w_count)` from (`grade_counts` `g` join `courses` `c` on((`g`.`c_id` = `c`.`c_id`))) group by `c`.`subject`,`c`.`course_number`,`c`.`title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-14 14:11:25