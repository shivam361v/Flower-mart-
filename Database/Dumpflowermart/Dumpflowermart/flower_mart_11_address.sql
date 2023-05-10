-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: flower_mart
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `add_id` int NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(45) DEFAULT NULL,
  `line_1` varchar(255) DEFAULT NULL,
  `line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,NULL,'ram kirshna nagar','vasmat road','pune','maharastra','123456'),(2,'abc','def','piun','pune','mh','123456'),(3,NULL,'ram kirshna nagar','vasmat road','pune','maharastra','123456'),(8,'Florist Wala','gokhle nagar','sb road','pune','mh','986575'),(9,'Flsdorist Wala','gokhlsdfe nagar','sb sdroad','pusne','mdsh',NULL),(13,'','','','','',NULL),(14,'FlowerCafe','123','kbj','Gajipur','Mumbai','456321'),(15,'FlowerCafe','123','gajipur','Gajipur','Mumbai','456321'),(16,NULL,'gokhlsdfe nagar','sb sdroad','pune','up','123456'),(17,NULL,'FlowerCafe','gajipur','Gajipur','Mumbai','456321'),(18,NULL,'123 Mavaikar','Jintur','Parbhani','Maharastra','431401'),(19,NULL,'FlowerCafe','fvd','Gajipur','Mumbai','456321'),(20,NULL,'Cidco','Nanded','Nanded','Maharastra','456321'),(21,NULL,'Godakunj','RamKrishna Nagar','Parbhani','Maharastra','431401'),(22,'Vijay Flowers','shop.no 124','Gokhle nagar','Pune','Maharastra','745878'),(26,NULL,'Baghaw','Station Road','Ghazipur','UP','275204'),(27,'Raju Flower Cafe','Khamariya nagar','','Jabalpur','MP','382005'),(28,NULL,'abc','def','Shahdol','madhya pradesh','484001'),(29,'Floral house','vd ','ganeshwadi','pune','Maharastra','484001');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
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
