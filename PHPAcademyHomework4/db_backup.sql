-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: homework
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_code` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,31000,'OSIJEK'),(2,32000,'VUKOVAR'),(3,10000,'ZAGREB'),(4,48000,'KOPRIVNICA'),(5,49000,'KRAPINA'),(6,40000,'ČAKOVEC'),(7,51000,'RIJEKA'),(8,21000,'SPLIT'),(9,31400,'ĐAKOVO'),(10,23000,'ZADAR');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Action'),(2,'Adventure'),(3,'Drama'),(4,'Fantasy'),(5,'War'),(6,'Mystery'),(7,'Thriller'),(8,'Comedy'),(9,'Sci-fi'),(10,'Crime'),(11,'Romance'),(12,'Horror');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_movies`
--

DROP TABLE IF EXISTS `genres_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genres` int(11) NOT NULL,
  `movies` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `genres` (`genres`),
  KEY `movies` (`movies`),
  CONSTRAINT `genres_movies_ibfk_1` FOREIGN KEY (`genres`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `genres_movies_ibfk_2` FOREIGN KEY (`movies`) REFERENCES `movies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_movies`
--

LOCK TABLES `genres_movies` WRITE;
/*!40000 ALTER TABLE `genres_movies` DISABLE KEYS */;
INSERT INTO `genres_movies` VALUES (1,1,1),(2,1,2),(3,3,13),(4,11,12),(5,5,3),(6,5,5),(7,7,4),(8,12,4),(10,5,6),(11,5,8),(12,4,7),(13,4,9),(14,10,10);
/*!40000 ALTER TABLE `genres_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'CD'),(2,'DVD'),(3,'VHS');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) DEFAULT 1,
  `cities` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cities` (`cities`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`cities`) REFERENCES `cities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (2,'BRUNO','Brunić','adresa broj 15',1,2),(5,'PERO','Perić','Gundulićeva 42',1,6),(7,'MALCOLM','Reynolds','Strossmayerova 5',1,1),(8,'COHEN','The Barbarian','Trg Grgura Ninskog 2',1,3),(12,'SAM','Verner','Rooseveltova 105',1,2);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trigger_insert_members
    before insert on members
    for each row
    set new.first_name = upper(new.first_name) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `members_movies`
--

DROP TABLE IF EXISTS `members_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `members` int(11) NOT NULL,
  `movies` int(11) NOT NULL,
  `day_of_rent` datetime NOT NULL,
  `day_of_return` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `members` (`members`),
  KEY `movies` (`movies`),
  CONSTRAINT `members_movies_ibfk_1` FOREIGN KEY (`members`) REFERENCES `members` (`id`),
  CONSTRAINT `members_movies_ibfk_2` FOREIGN KEY (`movies`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_movies`
--

LOCK TABLES `members_movies` WRITE;
/*!40000 ALTER TABLE `members_movies` DISABLE KEYS */;
INSERT INTO `members_movies` VALUES (1,2,1,'2020-09-09 13:18:44','2020-09-15 05:45:05'),(2,5,3,'2020-09-09 13:18:44','2020-09-11 07:39:42'),(3,7,9,'2020-09-09 13:18:44','2020-09-15 07:44:30'),(5,8,8,'2020-09-09 13:18:44','2020-09-11 23:31:14');
/*!40000 ALTER TABLE `members_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media` (`media`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`media`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Casablanca',3),(2,'Avengers',2),(3,'Serenity',2),(4,'Ran',1),(5,'Pulp Fiction',1),(6,'Fifth Element',3),(7,'Big Fish',1),(8,'Cowboy Bebop',3),(9,'The Good, The Bad and The Ugly',2),(10,'Shawshank Redemption',2),(12,'Going Postal',1),(13,'Escape From New York',3);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09 13:20:45
