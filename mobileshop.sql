-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mobileshop
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `profdb`
--

DROP TABLE IF EXISTS `profdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profdb` (
  `username` varchar(20) DEFAULT NULL,
  `id` varchar(200) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profdb`
--

LOCK TABLES `profdb` WRITE;
/*!40000 ALTER TABLE `profdb` DISABLE KEYS */;
INSERT INTO `profdb` VALUES ('Vijaya','vijaya631958@gmail.com','123','9535070707'),('myuser','xyz@abc.com','hello','1234567899'),('sanjana Das','sanjanacemcs@gmail.com','Sreehari','9526625915'),('Bhavya','bhavjaya@cisco.com','abcd@123','9535070707'),('Sumit162','sumit73sarkar@gmail.com','Snit@162','9401133731'),('Pavan','pavan@gmail.com','1234','9535070707'),('Praveen','vijaya631957@gmail.com','123','8660262552');
/*!40000 ALTER TABLE `profdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiledb`
--

DROP TABLE IF EXISTS `profiledb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiledb` (
  `username` varchar(20) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `num` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiledb`
--

LOCK TABLES `profiledb` WRITE;
/*!40000 ALTER TABLE `profiledb` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiledb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilesdb`
--

DROP TABLE IF EXISTS `profilesdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profilesdb` (
  `username` varchar(20) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilesdb`
--

LOCK TABLES `profilesdb` WRITE;
/*!40000 ALTER TABLE `profilesdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `profilesdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersdb`
--

DROP TABLE IF EXISTS `usersdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersdb` (
  `username` varchar(20) DEFAULT NULL,
  `id` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `num` int(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersdb`
--

LOCK TABLES `usersdb` WRITE;
/*!40000 ALTER TABLE `usersdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersdb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-21 20:36:34
