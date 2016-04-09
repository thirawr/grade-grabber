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
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'AAS',100,'Intro Asian American Studies'),(2,'AAS',211,'Asian Americans and the Arts'),(3,'AAS',258,'Muslims in America'),(4,'AAS',287,'Food and Asian Americans'),(5,'AAS',390,'Race, Memory, and Violence'),(6,'AAS',490,'Social Movements'),(7,'ABE',100,'Intro Agric & Biological Engrg'),(8,'ABE',199,'Undergraduate Open Seminar'),(9,'ABE',223,'ABE Principles: Machine Syst'),(10,'ABE',224,'ABE Principles: Soil & Water'),(11,'ABE',341,'Transport Processes in ABE'),(12,'ABE',361,'Off-Road Machine Design'),(13,'ABE',398,'International Experience'),(14,'ABE',430,'Project Management'),(15,'ABE',455,'Erosion and Sediment Control'),(16,'ABE',463,'Electrohydraulic Systems'),(17,'ABE',466,'Engineering Off-Road Vehicles'),(18,'ABE',483,'Engrg Properties of Food Matls'),(19,'ABE',488,'Bioprocessing Biomass for Fuel'),(20,'ACCY',200,'Fundamentals of Accounting'),(21,'ACCY',201,'Accounting and Accountancy I'),(22,'ACCY',202,'Accounting and Accountancy II'),(23,'ACCY',301,'Atg Measurement & Disclosure'),(24,'ACCY',302,'Decision Making for Atg'),(25,'ACCY',303,'Atg Institutions and Reg'),(26,'ACCY',304,'Accounting Control Systems'),(27,'ACCY',312,'Principles of Taxation'),(28,'ACCY',398,'Practical Problems in Atg'),(29,'ACCY',405,'Assurance and Attestation'),(30,'ACCY',410,'Advanced Financial Reporting');
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
INSERT INTO `grade_counts` VALUES (1,3.03,2,7,4,4,5,1,2,2,0,0,0,1,2,0),(2,3.69,6,19,2,2,1,1,0,1,0,0,0,0,1,0),(3,3.72,2,15,6,2,2,2,0,0,0,0,0,0,0,0),(4,3.58,1,14,7,5,0,0,2,2,0,0,0,0,0,0),(5,3.39,3,11,4,3,6,2,0,1,1,0,0,1,0,0),(6,3.25,2,9,4,5,4,2,0,4,0,0,0,0,1,0),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,3.62,7,15,2,3,3,1,1,0,0,0,0,0,1,0),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,3.11,0,23,0,0,22,0,0,5,0,0,3,0,2,0),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,3.80,8,36,3,2,3,0,0,0,0,1,1,0,0,0),(16,3.46,5,32,5,1,7,0,2,3,2,0,3,0,0,0),(17,2.97,0,2,4,4,5,5,0,0,1,1,1,0,0,0),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,3.23,1,24,11,29,48,5,4,7,1,0,0,0,0,0),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,3.22,0,4,11,8,6,2,1,2,0,0,0,0,1,0),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,3.33,3,4,6,7,3,4,0,1,1,0,0,0,0,1),(26,3.19,4,72,59,50,40,29,23,12,10,6,3,1,1,0),(27,3.49,7,8,6,4,3,4,0,1,1,0,0,0,0,0),(28,3.28,4,6,9,3,6,4,1,2,2,0,0,0,0,0),(29,3.44,8,8,8,3,4,1,2,0,0,0,1,0,1,0),(30,3.09,4,4,10,5,3,4,1,0,3,0,2,0,1,0),(31,2.96,2,6,1,7,5,3,3,1,1,0,2,0,1,0),(32,3.20,2,2,12,4,4,6,1,0,0,0,2,0,0,2),(33,3.09,4,5,9,1,2,3,5,1,3,0,0,0,1,0),(34,3.20,4,7,9,7,1,5,3,0,0,0,1,0,2,0),(35,3.33,5,8,9,2,2,2,0,0,1,0,2,0,1,0),(36,3.40,4,13,4,4,4,5,1,2,1,0,0,0,0,0),(37,3.02,1,9,7,5,4,3,3,0,2,0,2,0,2,0),(38,2.98,3,7,3,6,5,4,2,1,0,0,4,0,1,0),(39,3.19,4,3,5,5,4,1,1,1,0,0,1,0,1,0),(40,3.22,5,9,5,3,3,4,3,0,3,0,0,0,1,0),(41,3.40,5,6,11,6,1,5,0,2,0,0,1,0,0,0),(42,3.40,4,9,8,2,3,3,2,3,0,0,0,0,0,2),(43,3.08,5,6,9,4,5,0,1,2,2,0,2,0,2,0),(44,3.12,4,6,6,3,2,1,1,3,1,0,3,0,0,0),(45,3.07,1,7,2,4,5,3,1,2,0,0,1,0,1,0),(46,3.14,1,9,7,10,8,4,2,0,3,0,1,0,1,1),(47,3.39,3,16,2,10,4,3,3,2,1,0,0,0,0,0),(48,3.41,1,11,10,10,7,2,3,1,0,0,0,0,0,0),(49,3.37,1,9,8,12,8,4,1,1,0,0,0,0,0,0),(50,3.28,1,6,9,13,6,3,1,0,0,0,2,0,0,1),(51,3.04,0,6,3,7,5,1,3,2,2,0,1,0,0,0),(52,3.40,0,11,5,2,10,0,1,2,0,0,0,0,0,0),(53,3.61,0,13,8,3,6,1,0,0,0,0,0,0,0,0),(54,3.30,0,8,8,5,8,1,1,2,0,1,0,0,0,0),(55,3.45,0,13,6,0,9,2,0,2,0,0,0,0,0,0),(56,3.44,0,5,13,2,11,1,0,0,0,0,0,0,0,0),(57,3.18,0,7,4,5,9,3,3,1,1,0,0,0,0,0),(58,3.47,1,11,7,4,3,0,1,2,1,0,0,0,0,0),(59,3.50,0,9,8,5,5,3,0,0,0,0,0,0,0,1),(60,3.16,0,5,5,8,3,7,0,0,0,1,0,1,0,1),(61,3.31,0,4,7,9,9,4,0,0,0,0,0,0,0,0),(62,3.37,0,4,11,9,5,3,0,1,0,0,0,0,0,0),(63,3.34,1,6,8,6,5,3,2,1,0,0,0,0,0,0),(64,3.41,0,7,9,5,9,3,0,0,0,0,0,0,0,0),(65,3.20,2,5,3,4,9,7,1,1,0,0,0,0,0,0),(66,3.37,1,8,6,3,12,1,2,0,0,0,0,0,0,0),(67,3.38,0,11,5,5,7,5,0,0,1,0,0,0,0,0),(68,3.11,0,6,11,6,5,0,1,2,2,1,1,1,0,0),(69,3.47,3,7,7,14,3,2,0,0,1,0,0,0,0,0),(70,3.46,4,10,8,8,4,0,0,3,0,1,0,0,0,0),(71,3.32,1,6,10,7,7,3,3,1,0,0,0,0,0,0),(72,3.38,0,7,12,11,3,2,1,0,1,1,0,0,0,0),(73,3.26,1,9,10,6,4,4,0,0,2,1,0,0,1,0),(74,3.28,1,12,3,4,6,2,5,0,2,0,0,0,0,0),(75,3.30,0,7,4,11,10,3,2,0,0,0,0,0,0,0),(76,3.32,0,11,2,10,7,5,1,0,1,0,0,0,0,0),(77,3.18,0,10,6,2,7,7,0,1,0,0,1,0,1,0),(78,3.22,0,11,4,2,12,4,0,3,0,0,1,0,0,0),(79,3.57,0,12,11,7,5,2,0,0,0,0,0,0,0,0),(80,3.18,0,7,7,7,9,5,2,2,0,0,1,0,0,0),(81,3.35,4,6,7,8,8,2,3,1,0,0,0,0,0,0),(82,3.38,3,6,11,6,7,4,3,0,0,0,0,0,0,0),(83,3.21,1,10,0,3,9,2,0,2,1,0,1,0,0,1),(84,3.14,2,2,13,6,4,1,5,1,1,2,0,0,0,0),(85,3.46,3,7,15,7,1,4,0,0,1,1,0,0,0,0),(86,3.29,4,1,8,15,6,3,1,2,0,0,0,0,0,0),(87,3.98,34,1,0,1,0,0,0,0,0,0,0,0,0,1),(88,3.36,0,3,10,16,2,4,1,0,0,0,0,0,0,0),(89,3.33,5,4,4,13,4,2,1,0,1,1,0,0,0,0),(90,3.29,0,12,5,1,9,3,2,2,1,0,0,0,0,0),(91,3.42,0,10,9,4,11,0,0,1,1,0,0,0,0,0),(92,3.11,0,1,6,9,10,6,3,0,0,0,0,0,0,0),(93,3.29,1,3,8,14,2,2,3,0,1,0,0,0,0,0),(94,3.44,0,8,10,9,5,3,1,0,0,0,0,0,0,0),(95,3.20,2,5,4,2,11,3,3,1,0,0,0,0,0,0),(96,3.55,2,8,11,2,3,3,1,0,0,0,0,0,0,0),(97,3.06,0,2,6,5,8,6,1,1,0,0,0,1,0,0),(98,3.54,3,14,4,5,4,2,0,1,1,0,0,0,0,0),(99,3.21,0,7,2,4,11,7,1,0,0,0,0,0,0,0),(100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,1,'120148','FA14','AD1','Thomas, Merin A'),(1,2,'120148','FA14','AD2','Thomas, Merin A'),(1,3,'120148','FA14','AD3','Peralta, Christine N'),(1,4,'120148','FA14','AD4','Peralta, Christine N'),(1,5,'120148','FA14','AD5','Lee, Sang S'),(1,6,'120148','FA14','AD6','Lee, Sang S'),(1,7,'120148','FA14','B','Paik, Angela N'),(2,8,'120148','FA14','A','Nguyen, Mimi T'),(3,9,'120148','FA14','A','Rana, Junaid'),(4,10,'120148','FA14','A','Manalansan, Martin F'),(5,11,'120148','FA14','NPU','Paik, Angela N'),(6,12,'120148','FA14','JRU','Rana, Junaid'),(7,13,'120148','FA14','B','Green, Angela R'),(8,14,'120148','FA14','CHP','Kalita, Prasanta K'),(9,15,'120148','FA14','AL1','Grift, Tony E'),(10,16,'120148','FA14','AL1','Kalita, Prasanta K'),(11,17,'120148','FA14','MGD','Rausch, Kent D'),(12,18,'120148','FA14','AL1','Hansen, Alan C'),(13,19,'120148','FA14','SZ','Zahos, Stephen C'),(14,20,'120148','FA14','A','Schideman, Lance C'),(15,21,'120148','FA14','AB1','Bhattarai, Rabin'),(16,22,'120148','FA14','TEG','Grift, Tony E'),(17,23,'120148','FA14','AL1','Hansen, Alan C'),(18,24,'120148','FA14','A','Rausch, Kent D'),(19,25,'120148','FA14','VS','Singh, Vijay'),(20,26,'120148','FA14','OL','Silhan, Peter A'),(21,27,'120148','FA14','AD1','Korte, Brianne E'),(21,28,'120148','FA14','AD3','Korte, Brianne E'),(21,29,'120148','FA14','AD4','Koziel, Mark C'),(21,30,'120148','FA14','AD6','Pollard, Robert C'),(21,31,'120148','FA14','AD7','Michelson, Mark J'),(21,32,'120148','FA14','AD8','Koziel, Mark C'),(21,33,'120148','FA14','ADA','Pollard, Robert C'),(21,34,'120148','FA14','ADB','Michelson, Mark J'),(21,35,'120148','FA14','ADC','Mora, Bradley J'),(21,36,'120148','FA14','ADD','McConnell, Kelly R'),(21,37,'120148','FA14','ADE','McConnell, Kelly R'),(21,38,'120148','FA14','ADF','Zhang, Fangye'),(21,39,'120148','FA14','ADH','Mora, Bradley J'),(21,40,'120148','FA14','ADI','Tong, Shuqing'),(21,41,'120148','FA14','ADJ','Storto, Joseph M'),(21,42,'120148','FA14','ADL','Tong, Shuqing'),(21,43,'120148','FA14','ADM','Storto, Joseph M'),(21,44,'120148','FA14','ADN','Zhang, Fangye'),(22,45,'120148','FA14','AD1','Jin, Yiyun'),(22,46,'120148','FA14','AD2','Jin, Yiyun'),(22,47,'120148','FA14','AD3','Ladd, Dylan T'),(22,48,'120148','FA14','AD4','Ladd, Dylan T'),(22,49,'120148','FA14','AD5','Lie, Jeane Natalia'),(22,50,'120148','FA14','AD6','Lie, Jeane Natalia'),(23,51,'120148','FA14','AE1','Winn, Amanda M'),(23,52,'120148','FA14','AE2','Winn, Amanda M'),(23,53,'120148','FA14','AE3','Winn, Amanda M'),(23,54,'120148','FA14','AE4','Jackson, Kevin'),(23,55,'120148','FA14','AE5','Jackson, Kevin'),(23,56,'120148','FA14','AE6','Finnegan, Thomas'),(23,57,'120148','FA14','AE7','Finnegan, Thomas'),(23,58,'120148','FA14','AE8','Jackson, Kevin'),(23,59,'120148','FA14','AEB','Finnegan, Thomas'),(24,60,'120148','FA14','AE1','Autrey, Romana L'),(24,61,'120148','FA14','AE2','Autrey, Romana L'),(24,62,'120148','FA14','AE3','Finnegan, Thomas'),(24,63,'120148','FA14','AE4','Zhang, Li'),(24,64,'120148','FA14','AE5','Autrey, Romana L'),(24,65,'120148','FA14','AE8','Chen, Xiaoling'),(24,66,'120148','FA14','AE9','Chen, Xiaoling'),(24,67,'120148','FA14','AEA','Chen, Xiaoling'),(25,68,'120148','FA14','AE1','Li, Wei'),(25,69,'120148','FA14','AE2','Li, Wei'),(25,70,'120148','FA14','AE3','Brown, Timothy J'),(25,71,'120148','FA14','AE4','Brown, Timothy J'),(25,72,'120148','FA14','AE5','Li, Wei'),(25,73,'120148','FA14','AE6','Brown, Timothy J'),(26,74,'120148','FA14','AE1','Koo, Seung Hyun'),(26,75,'120148','FA14','AE2','Koo, Seung Hyun'),(26,76,'120148','FA14','AE3','Koo, Seung Hyun'),(26,77,'120148','FA14','AE4','Wang, Wei'),(26,78,'120148','FA14','AE5','Wang, Wei'),(26,79,'120148','FA14','AE6','Wang, Wei'),(27,80,'120148','FA14','A','Bauer, Andrew M'),(27,81,'120148','FA14','B','Bauer, Andrew M'),(27,82,'120148','FA14','C','Bauer, Andrew M'),(27,83,'120148','FA14','D','Holder, Daniel E'),(27,84,'120148','FA14','E','Donohoe, Michael P'),(27,85,'120148','FA14','F','Donohoe, Michael P'),(27,86,'120148','FA14','G','Donohoe, Michael P'),(28,87,'120148','FA14','A','Nekrasz, Frank'),(29,88,'120148','FA14','AE2','Bauer, Timothy D'),(29,89,'120148','FA14','AE3','Bauer, Timothy D'),(29,90,'120148','FA14','AE4','Peecher, Mark E'),(29,91,'120148','FA14','AE5','Peecher, Mark E'),(29,92,'120148','FA14','AE6','Asante Appiah, Bright'),(29,93,'120148','FA14','AE7','Bauer, Timothy D'),(29,94,'120148','FA14','AE8','Asante Appiah, Bright'),(30,95,'120148','FA14','A','Steward, Cynthia G'),(30,96,'120148','FA14','B','Steward, Cynthia G'),(30,97,'120148','FA14','C','Steward, Cynthia G'),(30,98,'120148','FA14','D','Kustanovich, Michael'),(30,99,'120148','FA14','E','Kustanovich, Michael'),(30,100,'120148','FA14','F','Kustanovich, Michael');
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

-- Dump completed on 2016-04-08 21:10:51
