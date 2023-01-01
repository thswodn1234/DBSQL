CREATE DATABASE  IF NOT EXISTS `pnusw02` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pnusw02`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pnusw02
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `강의`
--

DROP TABLE IF EXISTS `강의`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `강의` (
  `강좌이름` varchar(20) NOT NULL,
  `강의실` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`강좌이름`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='													';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `강의`
--

LOCK TABLES `강의` WRITE;
/*!40000 ALTER TABLE `강의` DISABLE KEYS */;
INSERT INTO `강의` VALUES ('데이터베이스','공학관 110'),('스포츠경영학','체육관 103'),('자료구조','공학관 111');
/*!40000 ALTER TABLE `강의` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `학과`
--

DROP TABLE IF EXISTS `학과`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `학과` (
  `학과` varchar(20) NOT NULL,
  `학과사무실` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`학과`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='								';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `학과`
--

LOCK TABLES `학과` WRITE;
/*!40000 ALTER TABLE `학과` DISABLE KEYS */;
INSERT INTO `학과` VALUES ('로봇학과','과학관101'),('체육학과','체육관101'),('컴퓨터공학과','공학관101');
/*!40000 ALTER TABLE `학과` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `학생`
--

DROP TABLE IF EXISTS `학생`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `학생` (
  `학생번호` int NOT NULL,
  `주소` varchar(20) DEFAULT NULL,
  `학생이름` varchar(20) DEFAULT NULL,
  `학과` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`학생번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `학생`
--

LOCK TABLES `학생` WRITE;
/*!40000 ALTER TABLE `학생` DISABLE KEYS */;
INSERT INTO `학생` VALUES (401,'대한민국 서울','김연아','체육학과'),(402,'대한민국 강원도','장미란','체육학과'),(403,'영국 토트넘','손흥민','로봇학과'),(501,'영국 맨체스타','박지성','컴퓨터공학과'),(502,'미국 텍사스','추신수 ','컴퓨터공학과');
/*!40000 ALTER TABLE `학생` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `학생수강성적`
--

DROP TABLE IF EXISTS `학생수강성적`;
/*!50001 DROP VIEW IF EXISTS `학생수강성적`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `학생수강성적` AS SELECT 
 1 AS `학생번호`,
 1 AS `학생이름`,
 1 AS `주소`,
 1 AS `학과`,
 1 AS `학과사무실`,
 1 AS `강좌이름`,
 1 AS `강의실`,
 1 AS `성적`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `학점`
--

DROP TABLE IF EXISTS `학점`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `학점` (
  `학생번호` int NOT NULL,
  `강좌이름` varchar(20) NOT NULL,
  `성적` float DEFAULT NULL,
  PRIMARY KEY (`학생번호`,`강좌이름`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `학점`
--

LOCK TABLES `학점` WRITE;
/*!40000 ALTER TABLE `학점` DISABLE KEYS */;
INSERT INTO `학점` VALUES (401,'데이터베이스',4),(402,'스포츠경영학',3.5),(403,'데이터베이스',4),(403,'스포츠경영학',4),(403,'자료구조',4),(501,'데이터베이스',3.5),(501,'자료구조',3.5),(502,'자료구조',4);
/*!40000 ALTER TABLE `학점` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pnusw02'
--

--
-- Dumping routines for database 'pnusw02'
--

--
-- Final view structure for view `학생수강성적`
--

/*!50001 DROP VIEW IF EXISTS `학생수강성적`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `학생수강성적` AS select `학생`.`학생번호` AS `학생번호`,`학생`.`학생이름` AS `학생이름`,`학생`.`주소` AS `주소`,`학과`.`학과` AS `학과`,`학과`.`학과사무실` AS `학과사무실`,`학점`.`강좌이름` AS `강좌이름`,`강의`.`강의실` AS `강의실`,`학점`.`성적` AS `성적` from (((`학과` join `학생` on((`학과`.`학과` = `학생`.`학과`))) join `학점` on((`학생`.`학생번호` = `학점`.`학생번호`))) join `강의` on((`학점`.`강좌이름` = `강의`.`강좌이름`))) */;
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

-- Dump completed on 2022-11-24 17:13:30
