CREATE DATABASE  IF NOT EXISTS `universitydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `universitydb`;
-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: localhost    Database: universitydb
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin'),('a','a'),('aa','aa');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `DEPARTMENT` varchar(45) NOT NULL,
  `SECTION_NO` varchar(45) NOT NULL,
  `COURSE_NO` varchar(45) NOT NULL,
  `COURSE_NAME` varchar(45) DEFAULT NULL,
  `CREDITS` varchar(45) DEFAULT NULL,
  `COURSE_DESC` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT`,`COURSE_NO`,`SECTION_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('CMPE','02','273','Enterprise Dist systems','3','Prof Shim course'),('CMPE','01','CMPE202','EST','3','DESCIPTION'),('CMPE','02','CMPE202','EST','3','DESCIPTION'),('CMPE','01','CMPE272','EST','3','DESCIPTION'),('CMPE','02','CMPE272','EST','3','DESCIPTION'),('CMPE','01','CMPE273','EST','3','DESCIPTION'),('CMPE','02','CMPE273','EST','3','DESCIPTION'),('SE','01','SE202','SE202EST','3','DESCIPTION'),('SE','02','SE202','SE202EST','3','DESCIPTION'),('SE','01','SE272','SE272EST','3','DESCIPTION'),('SE','02','SE272','SE272EST','3','DESCIPTION'),('SE','01','SE273','SE273EST','3','DESCIPTION'),('SE','02','SE273','SE273EST','3','DESCIPTION');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `SJSU_ID` int(11) NOT NULL,
  `INSTR_OFFC_HOUR` varchar(45) DEFAULT NULL,
  `INSTR_OFFC_DAY` varchar(45) DEFAULT NULL,
  `DEPARTMENT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SJSU_ID`),
  CONSTRAINT `SJSUID` FOREIGN KEY (`SJSU_ID`) REFERENCES `person` (`SJSUID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_course`
--

DROP TABLE IF EXISTS `instructor_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_course` (
  `COURSE_NO` varchar(45) NOT NULL,
  `SJSU_ID` varchar(45) NOT NULL,
  `DAY` varchar(45) DEFAULT NULL,
  `TIME` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(45) DEFAULT NULL,
  `SECTION` int(11) NOT NULL,
  `AVAILABLE_SEATS` int(11) DEFAULT NULL,
  `FILLED_SEATS` int(11) DEFAULT NULL,
  `DEPARTMENT` varchar(45) NOT NULL,
  PRIMARY KEY (`SECTION`,`COURSE_NO`,`SJSU_ID`,`DEPARTMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_course`
--

LOCK TABLES `instructor_course` WRITE;
/*!40000 ALTER TABLE `instructor_course` DISABLE KEYS */;
INSERT INTO `instructor_course` VALUES ('CMPE273','44','Monday','11:45','BBC',1,44,12,'CMPE'),('SE273','45','Wednesday','11:45','BBC',1,44,12,'SE'),('273','43','Monday','11:45','BBC',2,44,12,'CMPE'),('CMPE273','44','Tuesday','11:45','BBC',2,44,12,'CMPE'),('cmpe273','46','MONDAY','1:00 PM to 2:15 PM','nbc',2,44,NULL,'CMPE'),('se273','46','MONDAY','1:00 AM to 2:00 PM','qqq',2,44,NULL,'CMPE'),('se273','46','MONDAY','1:00 PM to 2:00 PM','bbc',2,22,NULL,'SE');
/*!40000 ALTER TABLE `instructor_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `SJSUID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `LAST_NAME` varchar(45) DEFAULT NULL,
  `ADDR_LINE_1` varchar(45) DEFAULT NULL,
  `ADDR_LINE_2` varchar(45) DEFAULT NULL,
  `CITY_NAME` varchar(45) DEFAULT NULL,
  `STATE_NAME` varchar(45) DEFAULT NULL,
  `ZIPCODE` varchar(45) DEFAULT NULL,
  `EMAIL_ID` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `DATEOFBIRTH` varchar(45) DEFAULT NULL,
  `GENDER` varchar(45) DEFAULT NULL,
  `ROLE` varchar(45) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(45) DEFAULT NULL,
  `DEPARTMENT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SJSUID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (41,'Harshal','Sakpal','Addr1','Addr1','saas','AL','11111','email@emailc.com','hari','01-03-1989','male','STUDENT',NULL,'CMPE'),(42,'Ha','Sa','Addr1','123','asdasd','AZ','23423','email1@email.com','a','12-26-1988','male','STUDENT',NULL,'CMPE'),(43,'AAA','AAA','AAA','AAAA','sdjf','CA','21322','emai@ksdj.com','hari','12-25-1988','male','INSTRUCTOR',NULL,'CMPE'),(44,'AAA','aAA','AAA','AA','AA','AL','22222','asd@e.com','a','12-28-1988','male','INSTRUCTOR',NULL,'CS'),(45,'AAA','aAA','AAA','AA','AA','CA','22222','asd@e.com','a','12-33-2212','male','INSTRUCTOR',NULL,'SE'),(46,'46Name','46Name','46Addr1','46Addr1','46City','CA','22222','asd@e.com','a','12-27-1988','male','INSTRUCTOR',NULL,'ME'),(47,'AAA','aAA','AAA','AA','AA','CA','22222','asd@e.com','a','12-33-2212','male','INSTRUCTOR',NULL,'SE'),(48,'Ha','sa','201','634','san','AL','23423','hari2hari.gre@gmail.com','hari','01-02-1989','male','STUDENT',NULL,'CMPE'),(49,'Harshal','Sakpal','201','634','san jose','CA','14324','hari2hari.gre@gmail.com','hari','01-02-1988','male','STUDENT',NULL,'SE');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_invoice`
--

DROP TABLE IF EXISTS `stud_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_invoice` (
  `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SJSU_STUDENT_ID` int(11) DEFAULT NULL,
  `CREDITS` int(11) DEFAULT NULL,
  `DATE_OF_INVOICE` varchar(45) DEFAULT NULL,
  `AMOUNT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`INVOICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_invoice`
--

LOCK TABLES `stud_invoice` WRITE;
/*!40000 ALTER TABLE `stud_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `stud_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course` (
  `SJSU_ID` int(11) NOT NULL,
  `COURSE_NO` varchar(45) NOT NULL,
  `COURSE_DAY` varchar(45) DEFAULT NULL,
  `COURSE_TIME` varchar(45) DEFAULT NULL,
  `COURSE_LOCATION` varchar(45) DEFAULT NULL,
  `COURSE_SEC` int(11) NOT NULL,
  PRIMARY KEY (`SJSU_ID`,`COURSE_NO`,`COURSE_SEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES (49,'CMPE273','Tuesday','BBC','11:45',2);
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-10 18:20:27
