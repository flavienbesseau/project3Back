/* Replace with your SQL commands */

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
INSERT INTO `ms_experience` VALUES (1,'Hospitalisation avec Bloc'),(2,'Hospitalisation sans Bloc'),(3,'Ambulatoire sans Bloc'),(4,'Ambulatoire avec Bloc'),(5,'Urgences'),(6,'Maternité');
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
INSERT INTO `ms_hospital` VALUES (1,'Hopital de Purpan'),(2,'Hopital de Rangueil'),(3,'Clinique Pasteur'),(4,'Hopital Saint Louis');
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
INSERT INTO `ms_question` VALUES (1,NULL,'De l\'arrivée sur place: accès, signalétique, accueil, confidentialité, écoute, formalités, orientation',1,5,'Mes suggestions pour améliorer l\'accès, l\'accueil, les formalités...'),(2,NULL,'Des équipes soignantes (hors bloc): professionnalisme, amabilité, aide',1,5,'Mes suggestions aux équipes soignantes...'),(3,NULL,'Du chirurgien',1,5,'Mes suggestions aux médecins, internes...'),(4,NULL,'Des équipes soignantes du bloc opératoire: professionnalisme, amabilité, aide',1,5,'Mes suggestions aux équipes soignantes...'),(5,NULL,'De l\'anésthésiste',1,5,'Mes suggestions aux médecins, internes...'),(6,NULL,'Du transfert vers le bloc et du retour vers la chambre: qualité du brancardage, attente avant l\'intervention',1,5,'Mes commentaires'),(7,NULL,'Des explications fournies: maladie, diagnostic, traitements, effets...',1,5,'Mes suggestions'),(8,NULL,'De la gestion de la douleur',1,5,'Mes suggestions'),(9,NULL,'De l\'organisation des services et coordination des soins',1,5,'Mes suggestions pour améliorer le vécu des accompagnants'),(10,NULL,'Du fait que je me senti considéré et impliqué dans les décisions: respect de ma personne, de mon bien-être, etc.',1,5,'Mes commentaires'),(11,NULL,'Des services proposés: TV, Wifi, conciergerie...',1,5,'Les services dont j\'aurais aimé bénéficier'),(12,NULL,'De l\'organisation de sortie',1,5,'Mes commentaires'),(13,NULL,'Des informations sur la suite: activités, traitements, suivi à domicile, liaison avec un nouvel établissement',1,5,'Mes commentaires'),(14,NULL,'De la place accordée aux proches: information, services rendus',1,5,'Mes suggestions pour améliorer le vécu des accompagnants'),(15,NULL,'Des tarifs',1,5,'Mes commentaires'),(16,NULL,'De mon sentiment de sécurité, de confiance pendant le sejour',1,5,'Quelques commentaires sur mes émotions...'),(17,NULL,'De mon premier contact avec cet établissement',1,5,'Mes commentaires'),(18,NULL,'De cet établissement de manière générale',1,5,'Mes commentaires'),(23,NULL,'Du ou des médecin(s)',1,5,'Mes suggestions aux médecins, aux internes'),(24,NULL,'La consultation préalable avec le chirurgien',1,5,'Mes commentaires'),(25,NULL,'La consultations préalable avec l\'anésthésiste',1,5,'Mes commentaires'),(26,NULL,'L\'appel téléphonique de la veille',1,5,'Mes commentaires'),(27,NULL,'Les démarches administratives',1,5,'Mes commentaires'),(28,NULL,'Mon sentiment de sécurité, de confiance avant la journée',1,5,'Mes commentaires'),(29,NULL,'De mon sentiment de sécutité, de confiance pendant la journée',1,5,'Quelques commentaires sur mes émotions'),(30,NULL,'De mon sentiment de sécurité après cette journée: retour au domicile...',1,5,'Quelques commentaires sur mes émotions'),(31,NULL,'De l\'appel téléphonique du lendemain',1,5,'Mes commentaires');
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
INSERT INTO `ms_question_order` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(4,4,4,1),(5,5,5,1),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,1),(10,10,10,1),(11,11,11,1),(12,12,12,1),(13,13,13,1),(14,14,14,1),(15,15,15,1),(16,16,16,1),(17,17,17,1),(18,18,18,1),(19,1,1,2),(20,2,2,2),(21,3,23,2),(22,4,7,2),(23,5,8,2),(24,6,9,2),(25,7,10,2),(26,8,11,2),(27,9,12,2),(28,10,13,2),(29,11,14,2),(30,12,15,2),(31,13,16,2),(32,14,17,2),(33,15,18,2),(34,1,24,4),(35,2,25,4),(36,3,26,4),(37,4,27,4),(38,5,28,4),(39,6,1,4),(40,7,2,4),(41,8,3,4),(42,9,4,4),(43,10,5,4),(44,11,6,4),(45,12,7,4),(46,13,8,4),(47,14,9,4),(48,15,10,4),(49,16,11,4),(50,17,13,4),(51,18,14,4),(52,19,15,4),(53,20,29,4),(54,21,30,4),(55,22,31,4),(56,23,17,4),(57,24,18,4);
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
INSERT INTO `ms_response` VALUES (208,5,'Adipisci laborum qua',1,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(209,1,'Incidunt vel ex acc',2,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(210,5,'Ullam iure proident',3,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(211,5,'Enim enim dignissimo',4,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(212,1,'Aspernatur vel asper',5,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(213,2,'In fugiat dolor ut ',6,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(214,3,'Soluta sint sunt qu',7,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(215,2,'Quis consequuntur pr',8,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(216,5,'Sit duis aliquam vol',9,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(217,5,'Aut natus et ut temp',10,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(218,4,'Et eum voluptatem q',11,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(219,5,'Et molestias iste si',12,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(220,5,'Recusandae Illo vol',13,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(221,1,'Quis aperiam error n',14,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(222,3,'Voluptas vel quasi q',15,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(223,2,'Non obcaecati quia n',16,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(224,4,'Repudiandae eiusmod ',17,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(225,5,'Inventore illum vol',18,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(226,3,'Enim velit iste a n',23,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(227,2,'Atque iusto et nisi ',24,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(228,2,'Occaecat assumenda e',25,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(229,2,'Molestiae facere ven',26,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(230,2,'Fuga Labore vel dol',27,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(231,5,'Incidunt excepteur ',28,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(232,5,'Adipisci lorem rerum',29,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(233,5,'Et corrupti dolorem',30,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com'),(234,1,'Debitis placeat deb',31,'Cillum assumenda por',1,3,'2021-01-06','xiby@mailinator.com');
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
INSERT INTO `ms_specialty` VALUES (1,'Cardiologie'),(2,'Urologie'),(3,'Nephrologie'),(4,'Gynecologie'),(5,'Hépato-Gastro'),(6,'Orthopédie'),(7,'Cancérologie');
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
INSERT INTO `ms_specialty_has_ms_experience` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4);
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
INSERT INTO `ms_survey` VALUES (1,'Questionnaire Hospitalisation avec Bloc',1),(2,'Questionnaire Hospitalisation sans Bloc',2),(3,'Questionnaire Ambulatoire sans Bloc',3),(4,'Questionnaire Ambulatoire avec Bloc',4);
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
INSERT INTO `ms_user` VALUES (1,'Flavien Besseau','besseau.flavien@gmail.com',NULL,NULL,1,1);
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
INSERT INTO `ms_user_role` VALUES (1,'patient','can give a review'),(2,'administrator','can access to a dashboard');
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

-- Dump completed on 2021-01-06 12:28:29