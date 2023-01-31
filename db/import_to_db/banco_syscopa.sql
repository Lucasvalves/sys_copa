CREATE DATABASE  IF NOT EXISTS `syscopa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `syscopa`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: syscopa
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
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `id_arbitro` int NOT NULL AUTO_INCREMENT,
  `nome_arbitro` text NOT NULL,
  PRIMARY KEY (`id_arbitro`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (2,'Wilton Pereira Sampaio'),(3,'Neuza Ines Back'),(4,'Daniele Orsato'),(5,'Karen Diaz'),(6,'Bruno Boschilia'),(7,'Fernando Rapallini'),(8,'Danilo Manis'),(9,'Salima Mukansanga'),(10,'Jesus Valenzuela');
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `id_equipe` int NOT NULL AUTO_INCREMENT,
  `nome_equipe` text NOT NULL,
  `id_tecnico` int DEFAULT NULL,
  PRIMARY KEY (`id_equipe`),
  KEY `fk_tecnico` (`id_tecnico`),
  CONSTRAINT `fk_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id_tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (2,'Senegal',2),(3,'Equador',3),(4,'Catar',4),(5,'Inglaterra',5),(6,'Estados Unidos',6),(7,'Ira',7),(8,'Gales',8),(9,'Argetina',9),(10,'Polonia',10),(11,'Mexico',11),(12,'Arabia Saudita',12),(13,'Franca',13),(14,'Australia',14),(15,'Tunisia',15),(16,'Dinamarca',16),(17,'Japao',17),(18,'Espanha',18),(19,'Alemanha',19),(20,'Costa Rica',20),(21,'Marrocos',21),(22,'Croacia',22),(23,'Belgica',23),(24,'Canada',24),(25,'Brasil',25),(26,'Suica',26),(27,'Camaroes',27),(28,'Servia',28),(29,'Portugal',29),(30,'Coreia do Sul',30),(31,'Uruguai',31),(32,'Gana',32);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `desc_grupo` text NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H'),(9,'OITAVAS'),(10,'QUARTAS'),(11,'SEMI'),(12,'FINAL');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidas` (
  `id_partida` int NOT NULL AUTO_INCREMENT,
  `local_partida` text NOT NULL,
  `data_partida` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `id_arbitro` int DEFAULT NULL,
  `id_grupos` int NOT NULL,
  `id_equipe1` int DEFAULT NULL,
  `id_equipe2` int DEFAULT NULL,
  `num_gol_equipe1` int DEFAULT NULL,
  `num_gol_equipe2` int DEFAULT NULL,
  PRIMARY KEY (`id_partida`),
  KEY `fk_equipe1` (`id_equipe1`) /*!80000 INVISIBLE */,
  KEY `fk_arbitroP` (`id_arbitro`),
  KEY `fk_grupos_idx` (`id_grupos`),
  CONSTRAINT `fk_arbitroP` FOREIGN KEY (`id_arbitro`) REFERENCES `arbitro` (`id_arbitro`),
  CONSTRAINT `fk_equipe1` FOREIGN KEY (`id_equipe1`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `fk_grupos` FOREIGN KEY (`id_grupos`) REFERENCES `grupos` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (3,'Khalifa','2022-11-21','10:00:00',2,1,2,4,0,2),(4,'Al Thumama','2022-11-21','13:00:00',3,2,5,7,6,2),(5,'Ahmad Bin Ali','2022-11-21','16:00:00',4,2,6,8,1,1),(6,'Lusail','2022-11-22','07:00:00',5,3,9,12,1,2),(7,'Education City','2022-11-22','10:00:00',6,3,11,10,0,0),(8,'974','2022-11-22','13:00:00',7,4,16,15,0,0),(9,'Al Janoub','2022-11-22','16:00:00',8,4,13,14,4,1),(10,'Al Bayt','2022-11-23','07:00:00',9,5,19,17,1,2),(11,'Khalifa','2022-11-23','10:00:00',10,5,18,20,7,0),(13,'Ahmad Bin Ali','2022-11-23','16:00:00',2,6,23,24,1,0),(14,'Al Janoub','2022-11-24','07:00:00',3,7,26,27,1,0),(15,'Education City','2022-11-24','10:00:00',4,7,25,28,2,0),(16,'974','2022-11-24','13:00:00',5,8,31,30,0,0),(17,'Lusail','2022-11-24','16:00:00',6,8,29,32,3,2),(18,'Ahmad Bin Ali','2022-11-25','07:00:00',7,1,4,2,1,3),(20,'Khalifa','2022-11-25','13:00:00',9,2,8,7,0,2),(21,'Al Bayt','2022-11-25','16:00:00',10,2,5,6,0,0),(23,'Education City','2022-11-26','10:00:00',2,3,9,11,2,0),(24,'974','2022-11-26','13:00:00',3,4,15,14,0,1),(25,'Lusail','2022-11-26','16:00:00',4,4,13,16,2,1),(26,'Ahmad Bin Ali','2022-11-27','07:00:00',5,5,17,20,0,1),(27,'Al Thumama','2022-11-27','10:00:00',6,5,18,19,1,1),(28,'Khalifa','2022-11-27','13:00:00',7,6,23,21,2,1),(29,'Al Bayt','2022-11-27','16:00:00',8,6,22,24,0,0),(30,'Al Janoub','2022-11-28','07:00:00',9,7,27,28,3,3),(31,'Education City','2022-11-28','10:00:00',10,7,25,26,1,0),(33,'Lusail','2022-11-28','16:00:00',2,8,29,31,2,1),(35,'Khalifa','2022-11-29','10:00:00',4,1,3,2,1,2),(36,'Ahmad Bin Ali','2022-11-29','13:00:00',5,2,7,6,0,1),(37,'Al Thumama','2022-11-29','16:00:00',6,2,8,5,0,3),(38,'Education City','2022-11-30','07:00:00',7,3,10,9,0,2),(39,'Al Janoub','2022-11-30','10:00:00',8,3,12,11,1,2),(40,'974','2022-11-30','13:00:00',9,4,15,13,1,0),(42,'Al Thumama','2022-12-01','10:00:00',2,5,20,19,2,4),(43,'Al Bayt','2022-12-01','13:00:00',3,6,22,23,0,0),(44,'Khalifa','2022-12-01','16:00:00',4,6,24,21,1,2),(45,'Education City','2022-12-02','07:00:00',5,7,27,25,1,0),(46,'Al Janoub','2022-12-02','10:00:00',6,7,28,26,2,3),(47,'Lusail','2022-12-02','13:00:00',7,8,30,29,2,1),(48,'974','2022-12-02','16:00:00',8,8,32,31,0,2),(50,'Ahmad Bin Ali','2022-12-03','16:00:00',10,9,9,14,2,1),(52,'Al Bayt','2022-12-04','16:00:00',2,9,5,2,3,0),(53,'Education City','2022-12-06','12:00:00',3,9,17,22,1,1),(54,'Lusail','2022-12-06','16:00:00',4,9,25,30,4,1),(55,'Education City','2022-12-09','12:00:00',5,9,21,18,2,0),(56,'Lusail','2022-12-09','16:00:00',6,9,29,26,6,1),(57,'Al Thumama','2022-12-10','12:00:00',7,10,22,25,1,1),(59,'Lusail','2022-12-13','12:00:00',9,10,21,29,1,0),(60,'Education City','2022-12-13','16:00:00',10,10,5,13,1,2),(62,'Al Thumama','2022-12-14','16:00:00',2,11,13,21,2,0),(63,'Education City','2022-12-17','16:00:00',3,12,22,21,2,1);
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `id_tecnico` int NOT NULL AUTO_INCREMENT,
  `nome_tecnico` text NOT NULL,
  PRIMARY KEY (`id_tecnico`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES (2,'Aliou Cisse'),(3,'Gustavo Alfaro'),(4,'Felix Sanchez'),(5,'Gareth Southgate'),(6,'Gregg Berhalter'),(7,'Dragan Skocic'),(8,'Rob Page'),(9,'Lionel Scaloni'),(10,'Czeslaw Michniewicz;'),(11,'Gerardo Martino'),(12,'Herve Renard'),(13,'Didier Deschamps'),(14,'Graham Arnold'),(15,'Jalel Kadr'),(16,'Kasper Hjulmand'),(17,'Hajime Moriyasu'),(18,'Luis Enrique'),(19,'Hansi Flick'),(20,'Luis Fernando Suarez'),(21,'Walid Regragui'),(22,'Zlatko Dalic'),(23,'Roberto MartÃ­nez'),(24,'John Herdman'),(25,'Tite'),(26,'Murat Yakin'),(27,'Rigobert Song'),(28,'Dragan Stojkovic'),(29,'Fernando Santos'),(30,'Paulo Bento'),(31,'Diego Alonso'),(32,'Otto Addo'),(33,'Paula Santos'),(34,'Lucas Veloso Alves'),(35,'Paula Santos');
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 20:09:32
