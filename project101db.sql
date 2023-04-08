-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: project101db
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookingrec`
--

DROP TABLE IF EXISTS `bookingrec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingrec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source` varchar(20) DEFAULT NULL,
  `destination` varchar(20) DEFAULT NULL,
  `arrival` varchar(20) DEFAULT NULL,
  `departure` varchar(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `SeatNo` varchar(20) DEFAULT NULL,
  `fare` int DEFAULT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_uid` (`uid`),
  KEY `fk_bid` (`bid`),
  CONSTRAINT `fk_bid` FOREIGN KEY (`bid`) REFERENCES `busses` (`bid`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingrec`
--

LOCK TABLES `bookingrec` WRITE;
/*!40000 ALTER TABLE `bookingrec` DISABLE KEYS */;
INSERT INTO `bookingrec` VALUES (21,'kalyan','mumbai','10:00pm 2/03/20223','10:10 2/03/2023','2h','d3',80,'ayaz ',2,1),(23,'kalyan','aurangabad','12:00pm','12:10pm','5h','d6',300,'Silentkilleraa',8,14),(26,'kalyan','mumbai','10:00pm 2/03/20223','10:10 2/03/2023','2h','d3',80,'Ganesh',2,22),(27,'kalyan','bangluru','12:00pm 2/03/20223','12:10 2/03/2023','13h','d3',300,'deepthi',1,23),(29,'kalyan','aurangabad','12:00pm','12:10pm','5h','d6',300,'deepthi',8,23),(31,'kalyan','bangluru','12:00pm 2/03/20223','12:10 2/03/2023','13h','d3',300,'ayaz ',1,1);
/*!40000 ALTER TABLE `bookingrec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busses`
--

DROP TABLE IF EXISTS `busses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busses` (
  `bid` int NOT NULL,
  `source` varchar(20) DEFAULT NULL,
  `destination` varchar(20) DEFAULT NULL,
  `arrival` varchar(20) DEFAULT NULL,
  `departure` varchar(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `Seats` varchar(20) DEFAULT NULL,
  `SeatsBooked` varchar(20) DEFAULT NULL,
  `fare` int DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busses`
--

LOCK TABLES `busses` WRITE;
/*!40000 ALTER TABLE `busses` DISABLE KEYS */;
INSERT INTO `busses` VALUES (1,'kalyan','bangluru','12:00pm 2/03/20223','12:10 2/03/2023','13h','d1,d2,d3','d4',300),(2,'kalyan','mumbai','10:00pm 2/03/20223','10:10 2/03/2023','2h','d1,d2,d3,d4','',80),(3,'kalyan','pune','9:00Am 2/03/20223','9:10 2/03/2023','4h','d1,d2,d3,d4','',200),(8,'kalyan','aurangabad','12:00pm','12:10pm','5h','d4,d5,d6','d3',300),(2078,'kalyan','lucknow','12:00 pm','12:10','24h','d4,d5,d6','d3',1000);
/*!40000 ALTER TABLE `busses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobileNo` varchar(50) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ayaz ','ayaz1234','ayazkhanm3496@gmail.com','9561889850',NULL),(2,'akash','ak1234','akash12@gmail.com','9561889850',NULL),(12,'rahul','rahul1243','Rahul123@gmail.com','9561889850',NULL),(13,'rizwan','rizwan12','rizwan2@gmail.com','7410115702',NULL),(14,'Silentkilleraa','sk1212','sk12@gmail.com','9324582848',1),(20,'keval','keval1234','keval12@gmail.com','7410115702',NULL),(21,'makbool','makbool1234','makbool12@gmail.com','7410115702',NULL),(22,'Ganesh','gp1212','ganesh12@gmail.com','9561889850',NULL),(23,'deepthi','1234','deepthi@gmail.com','123543564153',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-06 20:29:24
