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
-- Dumping data for table `ms_experience`
--

LOCK TABLES `ms_experience` WRITE;
/*!40000 ALTER TABLE `ms_experience` DISABLE KEYS */;
INSERT INTO `ms_experience` VALUES (1,'Hospitalisation avec Bloc'),(2,'Hospitalisation sans Bloc'),(3,'Ambulatoire sans Bloc'),(4,'Ambulatoire avec Bloc'),(5,'Urgences'),(6,'Maternité');
/*!40000 ALTER TABLE `ms_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_hospital`
--

LOCK TABLES `ms_hospital` WRITE;
/*!40000 ALTER TABLE `ms_hospital` DISABLE KEYS */;
INSERT INTO `ms_hospital` VALUES (1,'Hopital de Purpan'),(2,'Hopital de Rangueil'),(3,'Clinique Pasteur'),(4,'Hopital Saint Louis');
/*!40000 ALTER TABLE `ms_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_question`
--

LOCK TABLES `ms_question` WRITE;
/*!40000 ALTER TABLE `ms_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_question_order`
--

LOCK TABLES `ms_question_order` WRITE;
/*!40000 ALTER TABLE `ms_question_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_question_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_response`
--

LOCK TABLES `ms_response` WRITE;
/*!40000 ALTER TABLE `ms_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_specialty`
--

LOCK TABLES `ms_specialty` WRITE;
/*!40000 ALTER TABLE `ms_specialty` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_specialty_has_ms_experience`
--

LOCK TABLES `ms_specialty_has_ms_experience` WRITE;
/*!40000 ALTER TABLE `ms_specialty_has_ms_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_specialty_has_ms_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_survey`
--

LOCK TABLES `ms_survey` WRITE;
/*!40000 ALTER TABLE `ms_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_user`
--

LOCK TABLES `ms_user` WRITE;
/*!40000 ALTER TABLE `ms_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ms_user_role`
--

LOCK TABLES `ms_user_role` WRITE;
/*!40000 ALTER TABLE `ms_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ms_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-06 14:18:01