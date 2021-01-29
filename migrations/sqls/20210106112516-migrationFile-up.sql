

CREATE TABLE IF NOT EXISTS `ms_hospital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `ms_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_hospital_id` int DEFAULT NULL,
  `text_rating` varchar(120) DEFAULT NULL,
  `scale_min` int DEFAULT NULL,
  `scale_max` int DEFAULT NULL,
  `text_comment` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_question_ms_hospital1_idx` (`fk_hospital_id`),
  CONSTRAINT `fk_ms_question_ms_hospital1` FOREIGN KEY (`fk_hospital_id`) REFERENCES `ms_hospital` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ms_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ms_survey` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `fk_experience_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_survey_ms_experience1_idx` (`fk_experience_id`),
  CONSTRAINT `fk_ms_survey_ms_experience1` FOREIGN KEY (`fk_experience_id`) REFERENCES `ms_experience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `ms_question_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `fk_question_id` int NOT NULL,
  `fk_survey_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_question_has_ms_survey_ms_survey1_idx` (`fk_survey_id`),
  KEY `fk_ms_question_has_ms_survey_ms_question1_idx` (`fk_question_id`),
  CONSTRAINT `fk_ms_question_has_ms_survey_ms_question1` FOREIGN KEY (`fk_question_id`) REFERENCES `ms_question` (`id`),
  CONSTRAINT `fk_ms_question_has_ms_survey_ms_survey1` FOREIGN KEY (`fk_survey_id`) REFERENCES `ms_survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ms_specialty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `ms_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` int DEFAULT NULL,
  `text_answer` varchar(255) DEFAULT NULL,
  `fk_question_id` int NOT NULL,
  `pseudo` varchar(155) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `ms_specialty_has_ms_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_specialty_id` int NOT NULL,
  `fk_experience_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ms_specialty_has_ms_experience_ms_experience1_idx` (`fk_experience_id`,`fk_specialty_id`),
  KEY `fk_ms_specialty_idx` (`fk_specialty_id`),
  CONSTRAINT `fk_ms_experience` FOREIGN KEY (`fk_experience_id`) REFERENCES `ms_experience` (`id`),
  CONSTRAINT `fk_ms_specialty` FOREIGN KEY (`fk_specialty_id`) REFERENCES `ms_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ms_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `ms_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;