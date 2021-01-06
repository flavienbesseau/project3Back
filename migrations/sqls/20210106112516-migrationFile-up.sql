-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: hospitalidee
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `ms_experience`
--

DROP TABLE IF EXISTS `ms_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_experience`
--

LOCK TABLES `ms_experience` WRITE;
/*!40000 ALTER TABLE `ms_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_hospital`
--

DROP TABLE IF EXISTS `ms_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_hospital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_hospital`
--

LOCK TABLES `ms_hospital` WRITE;
/*!40000 ALTER TABLE `ms_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_question`
--

DROP TABLE IF EXISTS `ms_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_hospital_id` int DEFAULT NULL,
  `text_rating` varchar(120) DEFAULT NULL,
  `scale_min` int DEFAULT NULL,
  `scale_max` int DEFAULT NULL,
  `text_comment` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_question_ms_hospital1_idx` (`fk_hospital_id`),
  CONSTRAINT `fk_ms_question_ms_hospital1` FOREIGN KEY (`fk_hospital_id`) REFERENCES `ms_hospital` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_question`
--

LOCK TABLES `ms_question` WRITE;
/*!40000 ALTER TABLE `ms_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_question_order`
--

DROP TABLE IF EXISTS `ms_question_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_question_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `fk_question_id` int NOT NULL,
  `fk_survey_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_question_has_ms_survey_ms_survey1_idx` (`fk_survey_id`),
  KEY `fk_ms_question_has_ms_survey_ms_question1_idx` (`fk_question_id`),
  CONSTRAINT `fk_ms_question_has_ms_survey_ms_question1` FOREIGN KEY (`fk_question_id`) REFERENCES `ms_question` (`id`),
  CONSTRAINT `fk_ms_question_has_ms_survey_ms_survey1` FOREIGN KEY (`fk_survey_id`) REFERENCES `ms_survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_question_order`
--

LOCK TABLES `ms_question_order` WRITE;
/*!40000 ALTER TABLE `ms_question_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_question_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_response`
--

DROP TABLE IF EXISTS `ms_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` int DEFAULT NULL,
  `text_answer` varchar(45) DEFAULT NULL,
  `fk_question_id` int NOT NULL,
  `pseudo` varchar(45) NOT NULL,
  `fk_hospital_id` int NOT NULL,
  `fk_specialty_id` int NOT NULL,
  `post_date` date NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_response_ms_question1_idx` (`fk_question_id`,`pseudo`),
  KEY `fk_ms_response_ms_hospital1_idx` (`fk_hospital_id`,`pseudo`,`fk_question_id`),
  KEY `fk_ms_response_ms_user1_idx` (`pseudo`),
  KEY `fk_ms_response_1_idx` (`fk_specialty_id`),
  CONSTRAINT `fk_ms_hospital_1` FOREIGN KEY (`fk_hospital_id`) REFERENCES `ms_hospital` (`id`),
  CONSTRAINT `fk_ms_question_1` FOREIGN KEY (`fk_question_id`) REFERENCES `ms_question` (`id`),
  CONSTRAINT `fk_ms_specialty_1` FOREIGN KEY (`fk_specialty_id`) REFERENCES `ms_specialty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_response`
--

LOCK TABLES `ms_response` WRITE;
/*!40000 ALTER TABLE `ms_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_specialty`
--

DROP TABLE IF EXISTS `ms_specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_specialty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_specialty`
--

LOCK TABLES `ms_specialty` WRITE;
/*!40000 ALTER TABLE `ms_specialty` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_specialty_has_ms_experience`
--

DROP TABLE IF EXISTS `ms_specialty_has_ms_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_specialty_has_ms_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_specialty_id` int NOT NULL,
  `fk_experience_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_specialty_has_ms_experience_ms_experience1_idx` (`fk_experience_id`,`fk_specialty_id`),
  KEY `fk_ms_specialty_idx` (`fk_specialty_id`),
  CONSTRAINT `fk_ms_experience` FOREIGN KEY (`fk_experience_id`) REFERENCES `ms_experience` (`id`),
  CONSTRAINT `fk_ms_specialty` FOREIGN KEY (`fk_specialty_id`) REFERENCES `ms_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_specialty_has_ms_experience`
--

LOCK TABLES `ms_specialty_has_ms_experience` WRITE;
/*!40000 ALTER TABLE `ms_specialty_has_ms_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_specialty_has_ms_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_survey`
--

DROP TABLE IF EXISTS `ms_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_survey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `fk_experience_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_survey_ms_experience1_idx` (`fk_experience_id`),
  CONSTRAINT `fk_ms_survey_ms_experience1` FOREIGN KEY (`fk_experience_id`) REFERENCES `ms_experience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_survey`
--

LOCK TABLES `ms_survey` WRITE;
/*!40000 ALTER TABLE `ms_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_user`
--

DROP TABLE IF EXISTS `ms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_account` datetime DEFAULT NULL,
  `fk_user_role_id` int NOT NULL,
  `fk_hospital_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ms_user_ms_user_role_idx` (`fk_user_role_id`),
  KEY `fk_ms_user_ms_hospital1_idx` (`fk_hospital_id`),
  CONSTRAINT `fk_ms_user_ms_hospital1` FOREIGN KEY (`fk_hospital_id`) REFERENCES `ms_hospital` (`id`),
  CONSTRAINT `fk_ms_user_ms_user_role` FOREIGN KEY (`fk_user_role_id`) REFERENCES `ms_user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_user`
--

LOCK TABLES `ms_user` WRITE;
/*!40000 ALTER TABLE `ms_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ms_user_role`
--

DROP TABLE IF EXISTS `ms_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ms_user_role`
--

LOCK TABLES `ms_user_role` WRITE;
/*!40000 ALTER TABLE `ms_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hospitalidee'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-06 14:21:18