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
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `total_amount` decimal(9,2) NOT NULL,
  `payment_id` int NOT NULL,
  `delivery_status` int NOT NULL DEFAULT '0',
  `address_id` int NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_order_fk0` (`user_id`),
  KEY `customer_order_fk2` (`address_id`),
  KEY `customer_order_fk3_idx` (`payment_id`),
  CONSTRAINT `customer_order_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `customer_order_fk2` FOREIGN KEY (`address_id`) REFERENCES `address` (`add_id`),
  CONSTRAINT `customer_order_fk3` FOREIGN KEY (`payment_id`) REFERENCES `payment_details` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (17,28,'2023-03-14 00:00:00',2800.00,23,2,26,'1970-01-01 00:00:00'),(18,28,'2023-03-14 00:00:00',2350.00,24,2,26,'1970-01-01 00:00:00'),(19,28,'2023-03-14 00:00:00',2050.00,25,2,26,'1970-01-01 00:00:00'),(20,28,'2023-03-14 00:00:00',1800.00,26,2,26,'1970-01-01 00:00:00'),(21,28,'2023-03-14 00:00:00',1000.00,27,2,26,'1970-01-01 00:00:00'),(22,30,'2023-03-14 00:00:00',3400.00,28,2,28,'1970-01-01 00:00:00'),(23,30,'2023-03-14 00:00:00',1000.00,29,2,28,'1970-01-01 00:00:00'),(24,28,'2023-03-15 00:00:00',1800.00,30,2,26,'1970-01-01 00:00:00'),(25,28,'2023-03-15 00:00:00',1850.00,31,2,26,'1970-01-01 00:00:00'),(26,28,'2023-03-15 00:00:00',1000.00,32,1,26,'1970-01-01 00:00:00');
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30 16:38:02
