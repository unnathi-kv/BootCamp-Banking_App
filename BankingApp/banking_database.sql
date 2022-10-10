CREATE DATABASE  IF NOT EXISTS `banking_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banking_app`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: banking_app
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_name` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delete_users`
--

DROP TABLE IF EXISTS `delete_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delete_users` (
  `acc_no` int NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delete_users`
--

LOCK TABLES `delete_users` WRITE;
/*!40000 ALTER TABLE `delete_users` DISABLE KEYS */;
INSERT INTO `delete_users` VALUES (10,'vigneshm','waiting'),(12,'hema','deleted'),(13,'joshua','deleted'),(26,'apoorva','deleted'),(28,'tejuwu','deleted'),(29,'vunnati7','waiting'),(30,'deepu','deleted'),(30,'deepu','deleted');
/*!40000 ALTER TABLE `delete_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `acc_no` int DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `applicant_name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `chronic_disease` varchar(45) DEFAULT NULL,
  `loan_type` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (10,'vigneshm','Unnathi',21,'Heart-disease','Quarterly','accepted'),(12,'hema','Unnathi',25,'Kidney-disease','Half-yearly','accepted'),(13,'joshua','Vignesh',21,'Diabetes','Quarterly','accepted'),(26,'apoorva','Nancy',21,'Diabetes','Quarterly','accepted'),(27,'Dbhartiya0711','Unnathi',23,'Heart-disease','Quarterly','accepted'),(29,'vunnati7','Hema',25,'Kidney-disease','Half-yearly','Accepted'),(30,'deepu','Monica',26,'Diabetes','Quarterly','Denied'),(31,'Balaji@2258','Balaji',22,'Heart-disease','Yearly','Accepted'),(31,'Balaji@2258','Nancy',21,'Heart-disease','Quarterly','Accepted');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `acc_no` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `delete_user` varchar(45) DEFAULT NULL,
  `insurance` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (10,'vigneshm','1',NULL),(10,'vigneshm',NULL,'1'),(12,'hema','1',NULL),(12,'hema',NULL,'1'),(13,'joshua','1',NULL),(13,'joshua',NULL,'1'),(26,'apoorva',NULL,'1'),(26,'apoorva','1',NULL),(28,'tejuwu','1',NULL),(29,'vunnati7','1',NULL),(27,'Dbhartiya0711',NULL,'1'),(29,'vunnati7',NULL,'1'),(30,'deepu',NULL,'1'),(30,'deepu','1',NULL),(31,'Balaji@2258',NULL,'1'),(30,'deepu','1',NULL),(31,'Balaji@2258',NULL,'1');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transcation_id` int NOT NULL AUTO_INCREMENT,
  `from_acc_no` int DEFAULT NULL,
  `to_acc_no` int DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `dateandtime` datetime DEFAULT NULL,
  `acc_no` int DEFAULT NULL,
  `transcation_type` varchar(20) DEFAULT NULL,
  `mode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`transcation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,0,10,1000,'2022-09-28 23:48:49',10,'Deposit','Credited'),(2,10,12,1000,'2022-09-28 23:49:03',10,'Transfer','Debited'),(3,10,12,1000,'2022-09-28 23:49:03',12,'Transfer','Credited'),(4,12,0,1000,'2022-09-28 23:59:48',12,'Withdraw','Debited'),(5,26,0,1000,'2022-09-29 16:12:57',26,'Withdraw','Debited'),(6,0,26,1000,'2022-09-29 16:13:06',26,'Deposit','Credited'),(7,26,27,1000,'2022-09-29 16:13:27',26,'Transfer','Debited'),(8,26,27,1000,'2022-09-29 16:13:27',27,'Transfer','Credited'),(9,29,0,5000,'2022-09-29 20:43:41',29,'Withdraw','Debited'),(10,31,29,1,'2022-09-30 11:17:43',31,'Transfer','Debited'),(11,31,29,1,'2022-09-30 11:17:43',29,'Transfer','Credited'),(12,33,0,1000,'2022-09-30 14:34:41',33,'Withdraw','Debited'),(13,0,33,1500,'2022-09-30 14:34:50',33,'Deposit','Credited'),(14,33,27,1000,'2022-09-30 14:35:10',33,'Transfer','Debited'),(15,33,27,1000,'2022-09-30 14:35:10',27,'Transfer','Credited'),(16,38,0,1000,'2022-10-09 19:48:42',38,'Withdraw','Debited'),(17,0,39,150000,'2022-10-10 12:20:19',39,'Deposit','Credited');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `phoneno` varchar(10) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `aadharno` varchar(12) NOT NULL,
  `upi` varchar(14) DEFAULT NULL,
  `acc_type` varchar(45) NOT NULL,
  `cardno` varchar(10) DEFAULT NULL,
  `acc_no` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`acc_no`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `acc_no_UNIQUE` (`acc_no`),
  UNIQUE KEY `aadharno_UNIQUE` (`aadharno`),
  UNIQUE KEY `upi_UNIQUE` (`upi`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES ('Dbhartiya0711','devesh.bhartiya0799@gmail.com','Organic@99','Devesh','Bhartiya','936871523','Prabhoo Niwas, Lucknow','535555300920','936871523@svt','Savings','793628',27,'Male',202000),('vunnati7','unnathi791@gmail.com','qwerty','Unnathi','K','9398341502','Hindupur','789582369410','9398341502@svt','Savings','661155',29,'Female',9001),('Balaji@2258','shesha.sb@perfios.com','qwerty','Shesha Sai','Balaji K P','9880682403','Bangalore, Karnataka','823166027958','9880682403@svt','Savings','NA',31,'Male',69999),('Teju','teju@gmail.com','bhosdiwala','Sai','Tejashwini H','8564123589','Yadgir','986574123056','8564123589@svt','Current','567420',32,'Female',28000),('apoorva','apoorvan@gmail.com','qwerty','Apoorva','Nayak','1234567890','Kumta','741852963012','1234567890@svt','Savings','NA',33,'Female',1000),('nonie','chwenotchwe@gmail.com','qwerty','Vernon','Chwe','1230456789','LA','145236984512','1230456789@svt','Current','NA',38,'Male',149000),('dilipg','dilipg@gmail.com','qwerty','Dilip','Gokulapati','4561230145','Bangalore','123485964512','4561230145@svt','Savings','930089',39,'Male',152500);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-10 14:18:10
