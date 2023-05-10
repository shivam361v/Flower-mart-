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
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (14,'UPI','749b0547-ce8f-4610-bbc4-4674f4c033c3'),(15,'debit card','13e6782c-e004-40db-bac6-39e46f56cd8b'),(16,'debit card','128cdcaf-08c7-4e44-a639-31c7adeb9863'),(17,'undefined','36538d2b-42a1-4bfa-a1d1-e367b83b62f7'),(18,'undefined','d57bfe52-9f8f-4101-827b-83cb2d2eff7c'),(19,'debit card','aa782836-b945-4a36-abff-a940c168dee1'),(20,'debit card','480d0209-4d74-4e9a-8463-d7abc5388c32'),(21,'debit card','932e90b0-afc6-4cea-8549-ae3236c6d7da'),(22,'undefined','43e3f0a3-4d45-4d0f-9ae6-2fb8d9baa442'),(23,'UPI','0624a740-9089-498d-893e-a9e4c52fc03b'),(24,'UPI','b14df0df-d022-4832-8e94-b9a54fdff245'),(25,'debit card','89d28954-fe8b-45e7-8106-52307d0284c4'),(26,'debit card','c1d0df7d-7fe7-40c1-9a52-8a659826c107'),(27,'undefined','9292400a-e96a-4d71-8d4e-3dd39a868482'),(28,'cash on delivery','7bdce32e-e28c-4af8-a522-f9ace42c4923'),(29,'debit card','fc0fa79b-1e9a-4a59-a9a6-cb2a4ea20adc'),(30,'undefined','5e650424-cbac-4e50-a777-cf5c8dbbd3bc'),(31,'debit card','a5d574c1-2d8a-4919-a69b-518320593a6c'),(32,'UPI','ba106574-9c92-4291-ac4c-f951667f8dac');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
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
