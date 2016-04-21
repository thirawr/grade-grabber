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
  `c_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `subject` varchar(4) NOT NULL,
  `course_number` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (155,'AAS',100,'Intro Asian American Studies'),(156,'AAS',211,'Asian Americans and the Arts'),(157,'AAS',258,'Muslims in America'),(158,'AAS',287,'Food and Asian Americans'),(159,'AAS',390,'Race, Memory, and Violence'),(160,'AAS',490,'Social Movements'),(161,'ABE',100,'Intro Agric & Biological Engrg'),(162,'ABE',199,'Undergraduate Open Seminar'),(163,'ABE',223,'ABE Principles: Machine Syst'),(164,'ABE',224,'ABE Principles: Soil & Water'),(165,'ABE',341,'Transport Processes in ABE'),(166,'ABE',361,'Off-Road Machine Design'),(167,'ABE',398,'International Experience'),(168,'ABE',430,'Project Management'),(169,'ABE',455,'Erosion and Sediment Control'),(170,'ABE',463,'Electrohydraulic Systems'),(171,'ABE',466,'Engineering Off-Road Vehicles'),(172,'ABE',483,'Engrg Properties of Food Matls'),(173,'ABE',488,'Bioprocessing Biomass for Fuel'),(174,'ACCY',200,'Fundamentals of Accounting'),(175,'ACCY',201,'Accounting and Accountancy I'),(176,'ACCY',202,'Accounting and Accountancy II'),(177,'ACCY',301,'Atg Measurement & Disclosure'),(178,'ACCY',302,'Decision Making for Atg'),(179,'ACCY',303,'Atg Institutions and Reg'),(180,'ACCY',304,'Accounting Control Systems'),(181,'ACCY',312,'Principles of Taxation'),(182,'ACCY',398,'Practical Problems in Atg'),(183,'ACCY',405,'Assurance and Attestation'),(184,'ACCY',410,'Advanced Financial Reporting'),(194,'1',2,'3'),(202,'3',4,'5'),(203,'5',7,'9'),(204,'11',12,'13');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_counts`
--

DROP TABLE IF EXISTS `grade_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_counts` (
  `s_id` mediumint(9) NOT NULL,
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
  `w_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_counts`
--

LOCK TABLES `grade_counts` WRITE;
/*!40000 ALTER TABLE `grade_counts` DISABLE KEYS */;
INSERT INTO `grade_counts` VALUES (101,3.03,2,7,4,4,5,1,2,2,0,0,0,1,2,0),(102,3.69,6,19,2,2,1,1,0,1,0,0,0,0,1,0),(103,3.72,2,15,6,2,2,2,0,0,0,0,0,0,0,0),(104,3.58,1,14,7,5,0,0,2,2,0,0,0,0,0,0),(105,3.39,3,11,4,3,6,2,0,1,1,0,0,1,0,0),(106,3.25,2,9,4,5,4,2,0,4,0,0,0,0,1,0),(107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,3.62,7,15,2,3,3,1,1,0,0,0,0,0,1,0),(111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,3.11,0,23,0,0,22,0,0,5,0,0,3,0,2,0),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,3.80,8,36,3,2,3,0,0,0,0,1,1,0,0,0),(116,3.46,5,32,5,1,7,0,2,3,2,0,3,0,0,0),(117,2.97,0,2,4,4,5,5,0,0,1,1,1,0,0,0),(118,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,3.23,1,24,11,29,48,5,4,7,1,0,0,0,0,0),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,3.22,0,4,11,8,6,2,1,2,0,0,0,0,1,0),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,3.33,3,4,6,7,3,4,0,1,1,0,0,0,0,1),(126,3.19,4,72,59,50,40,29,23,12,10,6,3,1,1,0),(127,3.49,7,8,6,4,3,4,0,1,1,0,0,0,0,0),(128,3.28,4,6,9,3,6,4,1,2,2,0,0,0,0,0),(129,3.44,8,8,8,3,4,1,2,0,0,0,1,0,1,0),(130,3.09,4,4,10,5,3,4,1,0,3,0,2,0,1,0),(131,2.96,2,6,1,7,5,3,3,1,1,0,2,0,1,0),(132,3.20,2,2,12,4,4,6,1,0,0,0,2,0,0,2),(133,3.09,4,5,9,1,2,3,5,1,3,0,0,0,1,0),(134,3.20,4,7,9,7,1,5,3,0,0,0,1,0,2,0),(135,3.33,5,8,9,2,2,2,0,0,1,0,2,0,1,0),(136,3.40,4,13,4,4,4,5,1,2,1,0,0,0,0,0),(137,3.02,1,9,7,5,4,3,3,0,2,0,2,0,2,0),(138,2.98,3,7,3,6,5,4,2,1,0,0,4,0,1,0),(139,3.19,4,3,5,5,4,1,1,1,0,0,1,0,1,0),(140,3.22,5,9,5,3,3,4,3,0,3,0,0,0,1,0),(141,3.40,5,6,11,6,1,5,0,2,0,0,1,0,0,0),(142,3.40,4,9,8,2,3,3,2,3,0,0,0,0,0,2),(143,3.08,5,6,9,4,5,0,1,2,2,0,2,0,2,0),(144,3.12,4,6,6,3,2,1,1,3,1,0,3,0,0,0),(145,3.07,1,7,2,4,5,3,1,2,0,0,1,0,1,0),(146,3.14,1,9,7,10,8,4,2,0,3,0,1,0,1,1),(147,3.39,3,16,2,10,4,3,3,2,1,0,0,0,0,0),(148,3.41,1,11,10,10,7,2,3,1,0,0,0,0,0,0),(149,3.37,1,9,8,12,8,4,1,1,0,0,0,0,0,0),(150,3.28,1,6,9,13,6,3,1,0,0,0,2,0,0,1),(151,3.04,0,6,3,7,5,1,3,2,2,0,1,0,0,0),(152,3.40,0,11,5,2,10,0,1,2,0,0,0,0,0,0),(153,3.61,0,13,8,3,6,1,0,0,0,0,0,0,0,0),(154,3.30,0,8,8,5,8,1,1,2,0,1,0,0,0,0),(155,3.45,0,13,6,0,9,2,0,2,0,0,0,0,0,0),(156,3.44,0,5,13,2,11,1,0,0,0,0,0,0,0,0),(157,3.18,0,7,4,5,9,3,3,1,1,0,0,0,0,0),(158,3.47,1,11,7,4,3,0,1,2,1,0,0,0,0,0),(159,3.50,0,9,8,5,5,3,0,0,0,0,0,0,0,1),(160,3.16,0,5,5,8,3,7,0,0,0,1,0,1,0,1),(161,3.31,0,4,7,9,9,4,0,0,0,0,0,0,0,0),(162,3.37,0,4,11,9,5,3,0,1,0,0,0,0,0,0),(163,3.34,1,6,8,6,5,3,2,1,0,0,0,0,0,0),(164,3.41,0,7,9,5,9,3,0,0,0,0,0,0,0,0),(165,3.20,2,5,3,4,9,7,1,1,0,0,0,0,0,0),(166,3.37,1,8,6,3,12,1,2,0,0,0,0,0,0,0),(167,3.38,0,11,5,5,7,5,0,0,1,0,0,0,0,0),(168,3.11,0,6,11,6,5,0,1,2,2,1,1,1,0,0),(169,3.47,3,7,7,14,3,2,0,0,1,0,0,0,0,0),(170,3.46,4,10,8,8,4,0,0,3,0,1,0,0,0,0),(171,3.32,1,6,10,7,7,3,3,1,0,0,0,0,0,0),(172,3.38,0,7,12,11,3,2,1,0,1,1,0,0,0,0),(173,3.26,1,9,10,6,4,4,0,0,2,1,0,0,1,0),(174,3.28,1,12,3,4,6,2,5,0,2,0,0,0,0,0),(175,3.30,0,7,4,11,10,3,2,0,0,0,0,0,0,0),(176,3.32,0,11,2,10,7,5,1,0,1,0,0,0,0,0),(177,3.18,0,10,6,2,7,7,0,1,0,0,1,0,1,0),(178,3.22,0,11,4,2,12,4,0,3,0,0,1,0,0,0),(179,3.57,0,12,11,7,5,2,0,0,0,0,0,0,0,0),(180,3.18,0,7,7,7,9,5,2,2,0,0,1,0,0,0),(181,3.35,4,6,7,8,8,2,3,1,0,0,0,0,0,0),(182,3.38,3,6,11,6,7,4,3,0,0,0,0,0,0,0),(183,3.21,1,10,0,3,9,2,0,2,1,0,1,0,0,1),(184,3.14,2,2,13,6,4,1,5,1,1,2,0,0,0,0),(185,3.46,3,7,15,7,1,4,0,0,1,1,0,0,0,0),(186,3.29,4,1,8,15,6,3,1,2,0,0,0,0,0,0),(187,3.98,34,1,0,1,0,0,0,0,0,0,0,0,0,1),(188,3.36,0,3,10,16,2,4,1,0,0,0,0,0,0,0),(189,3.33,5,4,4,13,4,2,1,0,1,1,0,0,0,0),(190,3.29,0,12,5,1,9,3,2,2,1,0,0,0,0,0),(191,3.42,0,10,9,4,11,0,0,1,1,0,0,0,0,0),(192,3.11,0,1,6,9,10,6,3,0,0,0,0,0,0,0),(193,3.29,1,3,8,14,2,2,3,0,1,0,0,0,0,0),(194,3.44,0,8,10,9,5,3,1,0,0,0,0,0,0,0),(195,3.20,2,5,4,2,11,3,3,1,0,0,0,0,0,0),(196,3.55,2,8,11,2,3,3,1,0,0,0,0,0,0,0),(197,3.06,0,2,6,5,8,6,1,1,0,0,0,1,0,0),(198,3.54,3,14,4,5,4,2,0,1,1,0,0,0,0,0),(199,3.21,0,7,2,4,11,7,1,0,0,0,0,0,0,0),(200,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grade_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `c_id` mediumint(9) NOT NULL,
  `s_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `raw_term` varchar(6) NOT NULL,
  `parsed_term` varchar(4) NOT NULL,
  `section` varchar(4) NOT NULL,
  `instructor` varchar(100) NOT NULL,
  `crn` varchar(6) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (155,101,'120148','FA14','AD1','Thomas, Merin A','41758'),(155,102,'120148','FA14','AD2','Thomas, Merin A','47100'),(155,103,'120148','FA14','AD3','Peralta, Christine N','47102'),(155,104,'120148','FA14','AD4','Peralta, Christine N','51248'),(155,105,'120148','FA14','AD5','Lee, Sang S','51249'),(155,106,'120148','FA14','AD6','Lee, Sang S','51932'),(155,107,'120148','FA14','B','Paik, Angela N','56496'),(156,108,'120148','FA14','A','Nguyen, Mimi T','53947'),(157,109,'120148','FA14','A','Rana, Junaid','58913'),(158,110,'120148','FA14','A','Manalansan, Martin F','58092'),(159,111,'120148','FA14','NPU','Paik, Angela N','51335'),(160,112,'120148','FA14','JRU','Rana, Junaid','31301'),(161,113,'120148','FA14','B','Green, Angela R','31263'),(162,114,'120148','FA14','CHP','Kalita, Prasanta K','55376'),(163,115,'120148','FA14','AL1','Grift, Tony E','58927'),(164,116,'120148','FA14','AL1','Kalita, Prasanta K','58931'),(165,117,'120148','FA14','MGD','Rausch, Kent D','57598'),(166,118,'120148','FA14','AL1','Hansen, Alan C','29651'),(167,119,'120148','FA14','SZ','Zahos, Stephen C','64349'),(168,120,'120148','FA14','A','Schideman, Lance C','36669'),(169,121,'120148','FA14','AB1','Bhattarai, Rabin','49611'),(170,122,'120148','FA14','TEG','Grift, Tony E','56114'),(171,123,'120148','FA14','AL1','Hansen, Alan C','31280'),(172,124,'120148','FA14','A','Rausch, Kent D','29663'),(173,125,'120148','FA14','VS','Singh, Vijay','57478'),(174,126,'120148','FA14','OL','Silhan, Peter A','29670'),(175,127,'120148','FA14','AD1','Korte, Brianne E','36478'),(175,128,'120148','FA14','AD3','Korte, Brianne E','36482'),(175,129,'120148','FA14','AD4','Koziel, Mark C','36484'),(175,130,'120148','FA14','AD6','Pollard, Robert C','36486'),(175,131,'120148','FA14','AD7','Michelson, Mark J','36487'),(175,132,'120148','FA14','AD8','Koziel, Mark C','36489'),(175,133,'120148','FA14','ADA','Pollard, Robert C','36494'),(175,134,'120148','FA14','ADB','Michelson, Mark J','36496'),(175,135,'120148','FA14','ADC','Mora, Bradley J','36499'),(175,136,'120148','FA14','ADD','McConnell, Kelly R','36502'),(175,137,'120148','FA14','ADE','McConnell, Kelly R','36506'),(175,138,'120148','FA14','ADF','Zhang, Fangye','36509'),(175,139,'120148','FA14','ADH','Mora, Bradley J','36516'),(175,140,'120148','FA14','ADI','Tong, Shuqing','36522'),(175,141,'120148','FA14','ADJ','Storto, Joseph M','36526'),(175,142,'120148','FA14','ADL','Tong, Shuqing','36536'),(175,143,'120148','FA14','ADM','Storto, Joseph M','36538'),(175,144,'120148','FA14','ADN','Zhang, Fangye','36543'),(176,145,'120148','FA14','AD1','Jin, Yiyun','36552'),(176,146,'120148','FA14','AD2','Jin, Yiyun','36556'),(176,147,'120148','FA14','AD3','Ladd, Dylan T','36560'),(176,148,'120148','FA14','AD4','Ladd, Dylan T','36565'),(176,149,'120148','FA14','AD5','Lie, Jeane Natalia','36568'),(176,150,'120148','FA14','AD6','Lie, Jeane Natalia','36574'),(177,151,'120148','FA14','AE1','Winn, Amanda M','36577'),(177,152,'120148','FA14','AE2','Winn, Amanda M','36581'),(177,153,'120148','FA14','AE3','Winn, Amanda M','36584'),(177,154,'120148','FA14','AE4','Jackson, Kevin','36587'),(177,155,'120148','FA14','AE5','Jackson, Kevin','36590'),(177,156,'120148','FA14','AE6','Finnegan, Thomas','36592'),(177,157,'120148','FA14','AE7','Finnegan, Thomas','36596'),(177,158,'120148','FA14','AE8','Jackson, Kevin','36598'),(177,159,'120148','FA14','AEB','Finnegan, Thomas','49255'),(178,160,'120148','FA14','AE1','Autrey, Romana L','36610'),(178,161,'120148','FA14','AE2','Autrey, Romana L','36614'),(178,162,'120148','FA14','AE3','Finnegan, Thomas','36618'),(178,163,'120148','FA14','AE4','Zhang, Li','36677'),(178,164,'120148','FA14','AE5','Autrey, Romana L','36680'),(178,165,'120148','FA14','AE8','Chen, Xiaoling','36688'),(178,166,'120148','FA14','AE9','Chen, Xiaoling','49257'),(178,167,'120148','FA14','AEA','Chen, Xiaoling','49258'),(179,168,'120148','FA14','AE1','Li, Wei','36692'),(179,169,'120148','FA14','AE2','Li, Wei','36700'),(179,170,'120148','FA14','AE3','Brown, Timothy J','36701'),(179,171,'120148','FA14','AE4','Brown, Timothy J','36713'),(179,172,'120148','FA14','AE5','Li, Wei','49259'),(179,173,'120148','FA14','AE6','Brown, Timothy J','36703'),(180,174,'120148','FA14','AE1','Koo, Seung Hyun','31317'),(180,175,'120148','FA14','AE2','Koo, Seung Hyun','31318'),(180,176,'120148','FA14','AE3','Koo, Seung Hyun','31319'),(180,177,'120148','FA14','AE4','Wang, Wei','31320'),(180,178,'120148','FA14','AE5','Wang, Wei','49280'),(180,179,'120148','FA14','AE6','Wang, Wei','62036'),(181,180,'120148','FA14','A','Bauer, Andrew M','31321'),(181,181,'120148','FA14','B','Bauer, Andrew M','31324'),(181,182,'120148','FA14','C','Bauer, Andrew M','31330'),(181,183,'120148','FA14','D','Holder, Daniel E','31332'),(181,184,'120148','FA14','E','Donohoe, Michael P','31333'),(181,185,'120148','FA14','F','Donohoe, Michael P','45719'),(181,186,'120148','FA14','G','Donohoe, Michael P','45934'),(182,187,'120148','FA14','A','Nekrasz, Frank','61229'),(183,188,'120148','FA14','AE2','Bauer, Timothy D','36758'),(183,189,'120148','FA14','AE3','Bauer, Timothy D','36764'),(183,190,'120148','FA14','AE4','Peecher, Mark E','36768'),(183,191,'120148','FA14','AE5','Peecher, Mark E','36771'),(183,192,'120148','FA14','AE6','Asante Appiah, Bright','36775'),(183,193,'120148','FA14','AE7','Bauer, Timothy D','54162'),(183,194,'120148','FA14','AE8','Asante Appiah, Bright','59161'),(184,195,'120148','FA14','A','Steward, Cynthia G','29671'),(184,196,'120148','FA14','B','Steward, Cynthia G','61231'),(184,197,'120148','FA14','C','Steward, Cynthia G','62729'),(184,198,'120148','FA14','D','Kustanovich, Michael','62730'),(184,199,'120148','FA14','E','Kustanovich, Michael','62731'),(184,200,'120148','FA14','F','Kustanovich, Michael','62732'),(203,213,'11','FA14','12','13','10'),(204,214,'15','FA14','16','17','14');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-14 13:17:21
