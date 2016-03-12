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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `crn` int(11) NOT NULL,
  `term` int(11) NOT NULL,
  `subject` varchar(10) NOT NULL,
  `course_number` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
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
  `instructor_name` varchar(50) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  UNIQUE KEY `c_ID` (`crn`,`term`,`subject`,`course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (29670,120148,'ACCY',200,'Fundamentals of Accounting',3.19,4,72,59,50,40,29,23,12,10,6,3,3,1,'Silhan, Peter A','OL\r'),(31263,120148,'ABE',100,'Intro Agric & Biological Engrg',3.11,0,23,0,0,22,0,0,5,0,0,3,3,2,'Green, Angela R','B\r'),(31280,120148,'ABE',466,'Engineering Off-Road Vehicles',3.22,0,4,11,8,6,2,1,2,0,0,0,0,1,'Hansen, Alan C','AL1\r'),(36478,120148,'ACCY',201,'Accounting and Accountancy I',3.49,7,8,6,4,3,4,0,1,1,0,0,0,0,'Korte, Brianne E','AD1\r'),(36482,120148,'ACCY',201,'Accounting and Accountancy I',3.28,4,6,9,3,6,4,1,2,2,0,0,0,0,'Korte, Brianne E','AD3\r'),(36484,120148,'ACCY',201,'Accounting and Accountancy I',3.44,8,8,8,3,4,1,2,0,0,0,1,1,1,'Koziel, Mark C','AD4\r'),(36486,120148,'ACCY',201,'Accounting and Accountancy I',3.09,4,4,10,5,3,4,1,0,3,0,2,2,1,'Pollard, Robert C','AD6\r'),(36487,120148,'ACCY',201,'Accounting and Accountancy I',2.96,2,6,1,7,5,3,3,1,1,0,2,2,1,'Michelson, Mark J','AD7\r'),(36489,120148,'ACCY',201,'Accounting and Accountancy I',3.20,2,2,12,4,4,6,1,0,0,0,2,2,0,'Koziel, Mark C','AD8\r'),(36494,120148,'ACCY',201,'Accounting and Accountancy I',3.09,4,5,9,1,2,3,5,1,3,0,0,0,1,'Pollard, Robert C','ADA\r'),(36496,120148,'ACCY',201,'Accounting and Accountancy I',3.20,4,7,9,7,1,5,3,0,0,0,1,1,2,'Michelson, Mark J','ADB\r'),(36499,120148,'ACCY',201,'Accounting and Accountancy I',3.33,5,8,9,2,2,2,0,0,1,0,2,2,1,'Mora, Bradley J','ADC\r'),(36502,120148,'ACCY',201,'Accounting and Accountancy I',3.40,4,13,4,4,4,5,1,2,1,0,0,0,0,'McConnell, Kelly R','ADD\r'),(36506,120148,'ACCY',201,'Accounting and Accountancy I',3.02,1,9,7,5,4,3,3,0,2,0,2,2,2,'McConnell, Kelly R','ADE\r'),(36509,120148,'ACCY',201,'Accounting and Accountancy I',2.98,3,7,3,6,5,4,2,1,0,0,4,4,1,'Zhang, Fangye','ADF\r'),(36516,120148,'ACCY',201,'Accounting and Accountancy I',3.19,4,3,5,5,4,1,1,1,0,0,1,1,1,'Mora, Bradley J','ADH\r'),(36522,120148,'ACCY',201,'Accounting and Accountancy I',3.22,5,9,5,3,3,4,3,0,3,0,0,0,1,'Tong, Shuqing','ADI\r'),(36526,120148,'ACCY',201,'Accounting and Accountancy I',3.40,5,6,11,6,1,5,0,2,0,0,1,1,0,'Storto, Joseph M','ADJ\r'),(36536,120148,'ACCY',201,'Accounting and Accountancy I',3.40,4,9,8,2,3,3,2,3,0,0,0,0,0,'Tong, Shuqing','ADL\r'),(36538,120148,'ACCY',201,'Accounting and Accountancy I',3.08,5,6,9,4,5,0,1,2,2,0,2,2,2,'Storto, Joseph M','ADM\r'),(36543,120148,'ACCY',201,'Accounting and Accountancy I',3.12,4,6,6,3,2,1,1,3,1,0,3,3,0,'Zhang, Fangye','ADN\r'),(36552,120148,'ACCY',202,'Accounting and Accountancy II',3.07,1,7,2,4,5,3,1,2,0,0,1,1,1,'Jin, Yiyun','AD1\r'),(36556,120148,'ACCY',202,'Accounting and Accountancy II',3.14,1,9,7,10,8,4,2,0,3,0,1,1,1,'Jin, Yiyun','AD2\r'),(36560,120148,'ACCY',202,'Accounting and Accountancy II',3.39,3,16,2,10,4,3,3,2,1,0,0,0,0,'Ladd, Dylan T','AD3\r'),(36565,120148,'ACCY',202,'Accounting and Accountancy II',3.41,1,11,10,10,7,2,3,1,0,0,0,0,0,'Ladd, Dylan T','AD4\r'),(36568,120148,'ACCY',202,'Accounting and Accountancy II',3.37,1,9,8,12,8,4,1,1,0,0,0,0,0,'Lie, Jeane Natalia','AD5\r'),(36574,120148,'ACCY',202,'Accounting and Accountancy II',3.28,1,6,9,13,6,3,1,0,0,0,2,2,0,'Lie, Jeane Natalia','AD6\r'),(36577,120148,'ACCY',301,'Atg Measurement & Disclosure',3.04,0,6,3,7,5,1,3,2,2,0,1,1,0,'Winn, Amanda M','AE1\r'),(36581,120148,'ACCY',301,'Atg Measurement & Disclosure',3.40,0,11,5,2,10,0,1,2,0,0,0,0,0,'Winn, Amanda M','AE2\r'),(36584,120148,'ACCY',301,'Atg Measurement & Disclosure',3.61,0,13,8,3,6,1,0,0,0,0,0,0,0,'Winn, Amanda M','AE3\r'),(36587,120148,'ACCY',301,'Atg Measurement & Disclosure',3.30,0,8,8,5,8,1,1,2,0,1,0,0,0,'Jackson, Kevin','AE4\r'),(36590,120148,'ACCY',301,'Atg Measurement & Disclosure',3.45,0,13,6,0,9,2,0,2,0,0,0,0,0,'Jackson, Kevin','AE5\r'),(36592,120148,'ACCY',301,'Atg Measurement & Disclosure',3.44,0,5,13,2,11,1,0,0,0,0,0,0,0,'Finnegan, Thomas','AE6\r'),(36596,120148,'ACCY',301,'Atg Measurement & Disclosure',3.18,0,7,4,5,9,3,3,1,1,0,0,0,0,'Finnegan, Thomas','AE7\r'),(36598,120148,'ACCY',301,'Atg Measurement & Disclosure',3.47,1,11,7,4,3,0,1,2,1,0,0,0,0,'Jackson, Kevin','AE8\r'),(36610,120148,'ACCY',302,'Decision Making for Atg',3.16,0,5,5,8,3,7,0,0,0,1,0,0,0,'Autrey, Romana L','AE1\r'),(36614,120148,'ACCY',302,'Decision Making for Atg',3.31,0,4,7,9,9,4,0,0,0,0,0,0,0,'Autrey, Romana L','AE2\r'),(36669,120148,'ABE',430,'Project Management',3.23,1,24,11,29,48,5,4,7,1,0,0,0,0,'Schideman, Lance C','A\r'),(41758,120148,'AAS',100,'Intro Asian American Studies',3.03,2,7,4,4,5,1,2,2,0,0,0,0,2,'Thomas, Merin A','AD1\r'),(47100,120148,'AAS',100,'Intro Asian American Studies',3.69,6,19,2,2,1,1,0,1,0,0,0,0,1,'Thomas, Merin A','AD2\r'),(47102,120148,'AAS',100,'Intro Asian American Studies',3.72,2,15,6,2,2,2,0,0,0,0,0,0,0,'Peralta, Christine N','AD3\r'),(49255,120148,'ACCY',301,'Atg Measurement & Disclosure',3.50,0,9,8,5,5,3,0,0,0,0,0,0,0,'Finnegan, Thomas','AEB\r'),(51248,120148,'AAS',100,'Intro Asian American Studies',3.58,1,14,7,5,0,0,2,2,0,0,0,0,0,'Peralta, Christine N','AD4\r'),(51249,120148,'AAS',100,'Intro Asian American Studies',3.39,3,11,4,3,6,2,0,1,1,0,0,0,0,'Lee, Sang S','AD5\r'),(51932,120148,'AAS',100,'Intro Asian American Studies',3.25,2,9,4,5,4,2,0,4,0,0,0,0,1,'Lee, Sang S','AD6\r'),(57478,120148,'ABE',488,'Bioprocessing Biomass for Fuel',3.33,3,4,6,7,3,4,0,1,1,0,0,0,0,'Singh, Vijay','VS\r'),(57598,120148,'ABE',341,'Transport Processes in ABE',2.97,0,2,4,4,5,5,0,0,1,1,1,1,0,'Rausch, Kent D','MGD\r'),(58092,120148,'AAS',287,'Food and Asian Americans',3.62,7,15,2,3,3,1,1,0,0,0,0,0,1,'Manalansan, Martin F','A\r'),(58927,120148,'ABE',223,'ABE Principles: Machine Syst',3.80,8,36,3,2,3,0,0,0,0,1,1,1,0,'Grift, Tony E','AL1\r'),(58931,120148,'ABE',224,'ABE Principles: Soil & Water',3.46,5,32,5,1,7,0,2,3,2,0,3,3,0,'Kalita, Prasanta K','AL1\r');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-11 18:18:02
