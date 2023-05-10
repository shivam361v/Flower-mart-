-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: flower_mart_11
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `type_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `add_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_fk0` (`type_id`),
  KEY `add_id_fk1_idx` (`add_id`),
  CONSTRAINT `user_fk0` FOREIGN KEY (`type_id`) REFERENCES `user_type` (`type_id`),
  CONSTRAINT `user_fk1` FOREIGN KEY (`add_id`) REFERENCES `address` (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'Shubham','Gulamkar','shubham@gmail.com','Shubham@123','7845685252',2,1,8),(14,'Bhanu','Pratap','bhanu@gmail.com','bhanu@123','07845123658',2,1,13),(21,'Avadhut','Doiphale','avadhut@gmail.com','Avadhut@123','784512365',1,1,20),(22,'Prathmesh','Yennawar','prathmesh@gmail.com','Prathmesh@123','7887998867',1,1,21),(23,'Admin','Admin11','admin@gmail.com','Admin@123','1212121212',3,1,1),(24,'Vijay','Sharma','vijay@gmail.com','Vijay@123','9922266698',2,0,22),(28,'Manish','Kumar','manish@gmail.com','Manish@123','8574565584',1,1,26),(29,'Rajiv','Doiphale','rajiv@gmail.com','Rajiv@123','7458745215',2,0,27),(30,'Shivam','Vishwakarma','shivam@gmail.com','Shivam@123','7999796317',1,1,28),(31,'Svsdfgh','Vishwakarma','sv123@gmail.com','Shivam@123','7999796317',2,1,29);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30 16:38:03
