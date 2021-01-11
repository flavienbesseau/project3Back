/* Replace with your SQL commands */

INSERT INTO `ms_experience` VALUES (1,'Hospitalisation avec Bloc'),(2,'Hospitalisation sans Bloc'),(3,'Ambulatoire sans Bloc'),(4,'Ambulatoire avec Bloc'),(5,'Urgences'),(6,'Maternité');
INSERT INTO `ms_hospital` VALUES (1,'Hopital de Purpan'),(2,'Hopital de Rangueil'),(3,'Clinique Pasteur'),(4,'Hopital Saint Louis');
INSERT INTO `ms_question` VALUES (1,NULL,'De l\'arrivée sur place: accès, signalétique, accueil, confidentialité, écoute, formalités, orientation',1,5,'Mes suggestions pour améliorer l\'accès, l\'accueil, les formalités...'),(2,NULL,'Des équipes soignantes (hors bloc): professionnalisme, amabilité, aide',1,5,'Mes suggestions aux équipes soignantes...'),(3,NULL,'Du chirurgien',1,5,'Mes suggestions aux médecins, internes...'),(4,NULL,'Des équipes soignantes du bloc opératoire: professionnalisme, amabilité, aide',1,5,'Mes suggestions aux équipes soignantes...'),(5,NULL,'De l\'anésthésiste',1,5,'Mes suggestions aux médecins, internes...'),(6,NULL,'Du transfert vers le bloc et du retour vers la chambre: qualité du brancardage, attente avant l\'intervention',1,5,'Mes commentaires'),(7,NULL,'Des explications fournies: maladie, diagnostic, traitements, effets...',1,5,'Mes suggestions'),(8,NULL,'De la gestion de la douleur',1,5,'Mes suggestions'),(9,NULL,'De l\'organisation des services et coordination des soins',1,5,'Mes suggestions pour améliorer le vécu des accompagnants'),(10,NULL,'Du fait que je me senti considéré et impliqué dans les décisions: respect de ma personne, de mon bien-être, etc.',1,5,'Mes commentaires'),(11,NULL,'Des services proposés: TV, Wifi, conciergerie...',1,5,'Les services dont j\'aurais aimé bénéficier'),(12,NULL,'De l\'organisation de sortie',1,5,'Mes commentaires'),(13,NULL,'Des informations sur la suite: activités, traitements, suivi à domicile, liaison avec un nouvel établissement',1,5,'Mes commentaires'),(14,NULL,'De la place accordée aux proches: information, services rendus',1,5,'Mes suggestions pour améliorer le vécu des accompagnants'),(15,NULL,'Des tarifs',1,5,'Mes commentaires'),(16,NULL,'De mon sentiment de sécurité, de confiance pendant le sejour',1,5,'Quelques commentaires sur mes émotions...'),(17,NULL,'De mon premier contact avec cet établissement',1,5,'Mes commentaires'),(18,NULL,'De cet établissement de manière générale',1,5,'Mes commentaires'),(23,NULL,'Du ou des médecin(s)',1,5,'Mes suggestions aux médecins, aux internes'),(24,NULL,'La consultation préalable avec le chirurgien',1,5,'Mes commentaires'),(25,NULL,'La consultations préalable avec l\'anésthésiste',1,5,'Mes commentaires'),(26,NULL,'L\'appel téléphonique de la veille',1,5,'Mes commentaires'),(27,NULL,'Les démarches administratives',1,5,'Mes commentaires'),(28,NULL,'Mon sentiment de sécurité, de confiance avant la journée',1,5,'Mes commentaires'),(29,NULL,'De mon sentiment de sécutité, de confiance pendant la journée',1,5,'Quelques commentaires sur mes émotions'),(30,NULL,'De mon sentiment de sécurité après cette journée: retour au domicile...',1,5,'Quelques commentaires sur mes émotions'),(31,NULL,'De l\'appel téléphonique du lendemain',1,5,'Mes commentaires');
INSERT INTO `ms_user_role` VALUES (1,'patient','can give a review'),(2,'administrator','can access to a dashboard');
INSERT INTO `ms_survey` VALUES (1,'Questionnaire Hospitalisation avec Bloc',1),(2,'Questionnaire Hospitalisation sans Bloc',2),(3,'Questionnaire Ambulatoire sans Bloc',3),(4,'Questionnaire Ambulatoire avec Bloc',4);
INSERT INTO `ms_question_order` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(4,4,4,1),(5,5,5,1),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,1),(10,10,10,1),(11,11,11,1),(12,12,12,1),(13,13,13,1),(14,14,14,1),(15,15,15,1),(16,16,16,1),(17,17,17,1),(18,18,18,1),(19,1,1,2),(20,2,2,2),(21,3,23,2),(22,4,7,2),(23,5,8,2),(24,6,9,2),(25,7,10,2),(26,8,11,2),(27,9,12,2),(28,10,13,2),(29,11,14,2),(30,12,15,2),(31,13,16,2),(32,14,17,2),(33,15,18,2),(34,1,24,4),(35,2,25,4),(36,3,26,4),(37,4,27,4),(38,5,28,4),(39,6,1,4),(40,7,2,4),(41,8,3,4),(42,9,4,4),(43,10,5,4),(44,11,6,4),(45,12,7,4),(46,13,8,4),(47,14,9,4),(48,15,10,4),(49,16,11,4),(50,17,13,4),(51,18,14,4),(52,19,15,4),(53,20,29,4),(54,21,30,4),(55,22,31,4),(56,23,17,4),(57,24,18,4);
INSERT INTO `ms_specialty` VALUES (1,'Cardiologie'),(2,'Urologie'),(3,'Nephrologie'),(4,'Gynecologie'),(5,'Hépato-Gastro'),(6,'Orthopédie'),(7,'Cancérologie');
INSERT INTO `ms_specialty_has_ms_experience` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4);
INSERT INTO `ms_user` VALUES (1,'Flavien Besseau','besseau.flavien@gmail.com',NULL,NULL,1,1);
