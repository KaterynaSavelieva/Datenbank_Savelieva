CREATE DATABASE  IF NOT EXISTS `konferenzdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `konferenzdb`;
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

LOCK TABLES `referenten` WRITE;
/*!40000 ALTER TABLE `referenten` DISABLE KEYS */;
INSERT INTO `referenten` VALUES (1,'Dr. Anna Schmidt','anna.schmidt@uni-berlin.de','Universität Berlin'),(2,'Prof. Markus Weber','markus.weber@techlab.com','TechLab GmbH'),(3,'Claudia Meier','claudia.meier@medica.at','Medica Institut'),(4,'Johann Bauer','j.bauer@financeconsult.de','Finance Consult AG');
/*!40000 ALTER TABLE `referenten` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `teilnehmende` WRITE;
/*!40000 ALTER TABLE `teilnehmende` DISABLE KEYS */;
INSERT INTO `teilnehmende` VALUES (1,'Alfreds Futterkiste','alfreds@gmail.com','Alfreds Futterkiste GmbH'),(7,'Antonio Moreno','antonio@gmail.com','Antonio Moreno GmbH'),(6,'Thomas Hardy','thomas@gmail.com','Thomas Hardy GmbH'),(4,'Wilman Kala','Wilman@gmail.com','Wilman Kala GmbH');
/*!40000 ALTER TABLE `teilnehmende` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `teilnehmende_themen` WRITE;
/*!40000 ALTER TABLE `teilnehmende_themen` DISABLE KEYS */;
INSERT INTO `teilnehmende_themen` VALUES (1,1),(4,1),(6,2),(7,2),(4,3),(7,3);
/*!40000 ALTER TABLE `teilnehmende_themen` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `themen` WRITE;
/*!40000 ALTER TABLE `themen` DISABLE KEYS */;
INSERT INTO `themen` VALUES (1,'Künstliche Intelligenz','Einsatz von KI in der Medizin und Industrie',1),(2,'Nachhaltige Energie','Innovative Lösungen für erneuerbare Energien',2),(3,'Digitale Transformation','Wie Unternehmen den digitalen Wandel meistern',3),(4,'Finanzmärkte 2030','Trends und Prognosen für die nächsten Jahre',4);
/*!40000 ALTER TABLE `themen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 15:38:25
