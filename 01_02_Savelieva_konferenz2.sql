-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: konferenz2
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
  `referent_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`referent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referenten`
--

LOCK TABLES `referenten` WRITE;
/*!40000 ALTER TABLE `referenten` DISABLE KEYS */;
INSERT INTO `referenten` VALUES (1,'Dr. Müller','mueller@uni.de','Uni Berlin'),(2,'Frau Schmidt','schmidt@firma.at','Firma AT'),(3,'Herr Wagner','wagner@tech.de','Tech Solutions GmbH'),(4,'Prof. Bauer','bauer@fh.at','FH Wien'),(5,'Dr. Novak','novak@company.com','DataVision GmbH');
/*!40000 ALTER TABLE `referenten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teilnehmende`
--

DROP TABLE IF EXISTS `teilnehmende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teilnehmende` (
  `teilnehmer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `organisation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teilnehmer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teilnehmende`
--

LOCK TABLES `teilnehmende` WRITE;
/*!40000 ALTER TABLE `teilnehmende` DISABLE KEYS */;
INSERT INTO `teilnehmende` VALUES (1,'Max Mayer','max.mayer@mail.de','Tech GmbH'),(2,'Lisa Klein','lisa.klein@mail.at','Data Experts'),(3,'Anna Schwarz','anna.schwarz@mail.de','Smart Solutions'),(4,'Peter Huber','peter.huber@mail.at','FinCorp'),(5,'Sabine Leitner','sabine.leitner@mail.de','EduSoft'),(6,'Michael Hofer','michael.hofer@mail.at','ITWorks'),(7,'Claudia Meier','claudia.meier@mail.de','Innovatech'),(8,'Thomas Berger','thomas.berger@mail.at','ConsultX');
/*!40000 ALTER TABLE `teilnehmende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teilnehmer_nach_themen`
--

DROP TABLE IF EXISTS `teilnehmer_nach_themen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teilnehmer_nach_themen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teilnehmer_id` int DEFAULT NULL,
  `thema_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teilnehmer_id` (`teilnehmer_id`),
  KEY `thema_id` (`thema_id`),
  CONSTRAINT `teilnehmer_nach_themen_ibfk_1` FOREIGN KEY (`teilnehmer_id`) REFERENCES `teilnehmende` (`teilnehmer_id`),
  CONSTRAINT `teilnehmer_nach_themen_ibfk_2` FOREIGN KEY (`thema_id`) REFERENCES `themen` (`thema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teilnehmer_nach_themen`
--

LOCK TABLES `teilnehmer_nach_themen` WRITE;
/*!40000 ALTER TABLE `teilnehmer_nach_themen` DISABLE KEYS */;
INSERT INTO `teilnehmer_nach_themen` VALUES (1,1,1),(2,1,3),(3,2,2),(4,2,5),(5,3,1),(6,3,6),(7,4,4),(8,4,7),(9,5,2),(10,6,3),(11,6,8),(12,7,5),(13,8,6),(14,8,1);
/*!40000 ALTER TABLE `teilnehmer_nach_themen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themen`
--

DROP TABLE IF EXISTS `themen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themen` (
  `thema_id` int NOT NULL AUTO_INCREMENT,
  `titel` varchar(100) NOT NULL,
  `beschreibung` text,
  `referent_id` int DEFAULT NULL,
  PRIMARY KEY (`thema_id`),
  KEY `referent_id` (`referent_id`),
  CONSTRAINT `themen_ibfk_1` FOREIGN KEY (`referent_id`) REFERENCES `referenten` (`referent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themen`
--

LOCK TABLES `themen` WRITE;
/*!40000 ALTER TABLE `themen` DISABLE KEYS */;
INSERT INTO `themen` VALUES (1,'KI in der Wirtschaft','Einsatz von KI in Unternehmen',1),(2,'Datenschutz','Neue DSGVO-Regeln',2),(3,'Cloud Computing','Sichere Cloud-Lösungen für Firmen',3),(4,'Big Data','Analyse großer Datenmengen',4),(5,'Cybersecurity','Schutz vor digitalen Angriffen',5),(6,'Machine Learning','Grundlagen des maschinellen Lernens',1),(7,'Business Intelligence','Berichtssysteme und Analysen',4),(8,'Blockchain','Anwendung in der Industrie',3);
/*!40000 ALTER TABLE `themen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_konferenzuebersicht`
--

DROP TABLE IF EXISTS `v_konferenzuebersicht`;
/*!50001 DROP VIEW IF EXISTS `v_konferenzuebersicht`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_konferenzuebersicht` AS SELECT 
 1 AS `teilnehmer`,
 1 AS `thema`,
 1 AS `referent`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_konferenzuebersicht`
--

/*!50001 DROP VIEW IF EXISTS `v_konferenzuebersicht`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_konferenzuebersicht` AS select `teilnehmende`.`name` AS `teilnehmer`,`themen`.`titel` AS `thema`,`referenten`.`name` AS `referent` from (((`teilnehmer_nach_themen` join `teilnehmende` on((`teilnehmer_nach_themen`.`teilnehmer_id` = `teilnehmende`.`teilnehmer_id`))) join `themen` on((`teilnehmer_nach_themen`.`thema_id` = `themen`.`thema_id`))) join `referenten` on((`themen`.`referent_id` = `referenten`.`referent_id`))) */;
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

-- Dump completed on 2025-10-07  8:38:02
