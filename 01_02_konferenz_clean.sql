-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: konferenzdb
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `referenten`
--

DROP TABLE IF EXISTS `referenten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referenten` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referenten`
--

INSERT INTO `referenten` (`id`, `name`, `email`, `organisation`) VALUES (1,'Dr. Anna Schmidt','anna.schmidt@uni-berlin.de','Universität Berlin');
INSERT INTO `referenten` (`id`, `name`, `email`, `organisation`) VALUES (2,'Prof. Markus Weber','markus.weber@techlab.com','TechLab GmbH');
INSERT INTO `referenten` (`id`, `name`, `email`, `organisation`) VALUES (3,'Claudia Meier','claudia.meier@medica.at','Medica Institut');
INSERT INTO `referenten` (`id`, `name`, `email`, `organisation`) VALUES (4,'Johann Bauer','j.bauer@financeconsult.de','Finance Consult AG');

--
-- Table structure for table `teilnehmende`
--

DROP TABLE IF EXISTS `teilnehmende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teilnehmende` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name_email_org` (`name`,`email`,`organisation`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teilnehmende`
--

INSERT INTO `teilnehmende` (`id`, `name`, `email`, `organisation`) VALUES (1,'Alfreds Futterkiste','alfreds@gmail.com','Alfreds Futterkiste GmbH');
INSERT INTO `teilnehmende` (`id`, `name`, `email`, `organisation`) VALUES (7,'Antonio Moreno','antonio@gmail.com','Antonio Moreno GmbH');
INSERT INTO `teilnehmende` (`id`, `name`, `email`, `organisation`) VALUES (6,'Thomas Hardy','thomas@gmail.com','Thomas Hardy GmbH');
INSERT INTO `teilnehmende` (`id`, `name`, `email`, `organisation`) VALUES (4,'Wilman Kala','Wilman@gmail.com','Wilman Kala GmbH');

--
-- Table structure for table `teilnehmende_themen`
--

DROP TABLE IF EXISTS `teilnehmende_themen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teilnehmende_themen` (
  `teilnehmer_id` int NOT NULL,
  `themE_id` int NOT NULL,
  PRIMARY KEY (`teilnehmer_id`,`themE_id`),
  KEY `themE_id` (`themE_id`),
  CONSTRAINT `teilnehmende_themen_ibfk_1` FOREIGN KEY (`teilnehmer_id`) REFERENCES `teilnehmende` (`id`),
  CONSTRAINT `teilnehmende_themen_ibfk_2` FOREIGN KEY (`themE_id`) REFERENCES `themen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teilnehmende_themen`
--

INSERT INTO `teilnehmende_themen` (`teilnehmer_id`, `themE_id`) VALUES (1,1);
INSERT INTO `teilnehmende_themen` (`teilnehmer_id`, `themE_id`) VALUES (4,1);
INSERT INTO `teilnehmende_themen` (`teilnehmer_id`, `themE_id`) VALUES (6,2);
INSERT INTO `teilnehmende_themen` (`teilnehmer_id`, `themE_id`) VALUES (7,2);
INSERT INTO `teilnehmende_themen` (`teilnehmer_id`, `themE_id`) VALUES (4,3);
INSERT INTO `teilnehmende_themen` (`teilnehmer_id`, `themE_id`) VALUES (7,3);

--
-- Table structure for table `themen`
--

DROP TABLE IF EXISTS `themen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `kurzbeschreibung` text,
  `referent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referent_id` (`referent_id`),
  CONSTRAINT `themen_ibfk_1` FOREIGN KEY (`referent_id`) REFERENCES `referenten` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themen`
--

INSERT INTO `themen` (`id`, `theme`, `kurzbeschreibung`, `referent_id`) VALUES (1,'Künstliche Intelligenz','Einsatz von KI in der Medizin und Industrie',1);
INSERT INTO `themen` (`id`, `theme`, `kurzbeschreibung`, `referent_id`) VALUES (2,'Nachhaltige Energie','Innovative Lösungen für erneuerbare Energien',2);
INSERT INTO `themen` (`id`, `theme`, `kurzbeschreibung`, `referent_id`) VALUES (3,'Digitale Transformation','Wie Unternehmen den digitalen Wandel meistern',3);
INSERT INTO `themen` (`id`, `theme`, `kurzbeschreibung`, `referent_id`) VALUES (4,'Finanzmärkte 2030','Trends und Prognosen für die nächsten Jahre',4);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 16:08:23
