-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: track_new
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `lname` varchar(20) NOT NULL,
  `phone` char(10) NOT NULL,
  `address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES ('Lincoln','683 4523','Lincoln Place'),('O\'Neil\'s','674 2134','Pearse St'),('Old Nag','767 8132','Dame St'),('Buttery','702 3421','College St');
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sandwiches`
--

DROP TABLE IF EXISTS `Sandwiches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sandwiches` (
  `location` varchar(20) NOT NULL,
  `bread` varchar(10) NOT NULL,
  `filling` varchar(10) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sandwiches`
--

LOCK TABLES `Sandwiches` WRITE;
/*!40000 ALTER TABLE `Sandwiches` DISABLE KEYS */;
INSERT INTO `Sandwiches` VALUES ('Lincoln','Rye','Ham',1.25),('O\'Neil\'s','White','Cheese',1.2),('O\'Neil\'s','Whole','Ham',1.25),('Old Nag','Rye','Beef',1.35),('Buttery','White','Cheese',1),('O\'Neil\'s','White','Turkey',1.35),('Buttery','White','Ham',1.1),('Lincoln','Rye','Beef',1.35),('Lincoln','White','Ham',1.3),('Old Nag','Rye','Ham',1.4);
/*!40000 ALTER TABLE `Sandwiches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tastes`
--

DROP TABLE IF EXISTS `Tastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tastes` (
  `name` varchar(10) NOT NULL,
  `filling` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tastes`
--

LOCK TABLES `Tastes` WRITE;
/*!40000 ALTER TABLE `Tastes` DISABLE KEYS */;
INSERT INTO `Tastes` VALUES ('Brown','Turkey'),('Brown','Beef'),('Brown','Ham'),('Jones','Cheese'),('Green','Beef'),('Green','Turkey'),('Green','Cheese');
/*!40000 ALTER TABLE `Tastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testing_table`
--

DROP TABLE IF EXISTS `testing_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testing_table` (
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `username` char(20) NOT NULL,
  `roll_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testing_table`
--

LOCK TABLES `testing_table` WRITE;
/*!40000 ALTER TABLE `testing_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `testing_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-13  5:53:53
