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
create database if not exists flower_mart;
use flower_mart;

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

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`cart_id`),
  KEY `cart_fk0` (`user_id`),
  CONSTRAINT `cart_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (11,21,0.00),(12,22,0.00),(13,28,0.00),(14,30,0.00);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_details` (
  `cart_detail_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_quantity` int DEFAULT '1',
  `product_rate` decimal(9,2) NOT NULL,
  `product_amount` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`cart_detail_id`),
  KEY `cart_details_fk0` (`cart_id`),
  KEY `cart_details_fk1` (`product_id`),
  CONSTRAINT `cart_details_fk0` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `cart_details_fk1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `florist_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedbacks_fk0` (`user_id`),
  KEY `feedbacks_fk1` (`product_id`),
  KEY `feedbacks_fk2` (`florist_id`),
  CONSTRAINT `feedbacks_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `feedbacks_fk1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `feedbacks_fk2` FOREIGN KEY (`florist_id`) REFERENCES `florist_products` (`florist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `florist_products`
--

DROP TABLE IF EXISTS `florist_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `florist_products` (
  `florist_id` int NOT NULL AUTO_INCREMENT,
  `stocks` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`florist_id`),
  KEY `florist_products_fk0` (`user_id`),
  CONSTRAINT `florist_products_fk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `florist_products`
--

LOCK TABLES `florist_products` WRITE;
/*!40000 ALTER TABLE `florist_products` DISABLE KEYS */;
INSERT INTO `florist_products` VALUES (1,1,1000,9),(2,2,800,9),(3,2,1050,9);
/*!40000 ALTER TABLE `florist_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_quantity` int NOT NULL,
  `product_rate` decimal(9,2) NOT NULL,
  `product_amount` decimal(9,2) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_details_fk0` (`order_id`),
  KEY `order_details_fk1` (`product_id`),
  CONSTRAINT `order_details_fk0` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`),
  CONSTRAINT `order_details_fk1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (30,17,1,1,1000.00,1000.00),(31,17,2,1,800.00,800.00),(32,17,1,1,1000.00,1000.00),(33,18,1,1,1000.00,1000.00),(34,18,2,1,800.00,800.00),(35,18,3,1,550.00,550.00),(36,19,1,1,1000.00,1000.00),(37,19,4,1,1050.00,1050.00),(38,20,1,1,1000.00,1000.00),(39,20,2,1,800.00,800.00),(40,21,1,1,1000.00,1000.00),(41,22,1,1,1000.00,1000.00),(42,22,2,1,800.00,800.00),(43,22,3,1,550.00,550.00),(44,22,4,1,1050.00,1050.00),(45,23,1,1,1000.00,1000.00),(46,24,1,1,1000.00,1000.00),(47,24,2,1,800.00,800.00),(48,25,2,1,800.00,800.00),(49,25,4,1,1050.00,1050.00),(50,26,1,1,1000.00,1000.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'carnation'),(2,'roses'),(3,'lilies'),(4,'geabera'),(5,'orchids');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL,
  `image` blob,
  `cat_id` int NOT NULL,
  `availablity` tinyint(1) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `florist_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_fk0` (`cat_id`),
  KEY `florist_fk1_idx` (`florist_id`),
  CONSTRAINT `FKtkqtqg1to96fs75iqbpa1ugg` FOREIGN KEY (`florist_id`) REFERENCES `product_categories` (`cat_id`),
  CONSTRAINT `florist_fk1` FOREIGN KEY (`florist_id`) REFERENCES `florist_products` (`florist_id`),
  CONSTRAINT `products_fk0` FOREIGN KEY (`cat_id`) REFERENCES `product_categories` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Florazone',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0\n\Z\Z\Z\Z\Z\Z\Z\Z\Z!.%!+!\Z\'8&+/1555\Z$;@;4?.4514%$+44444144444444444444444544444444444444446444444444��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0>\0\0\0\0\0!1AQa\"q2������BR\�\�#br���\��s34�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\'\0\0\0\0\0\0\0\0!1AQ\"a2q�����\�\0\0\0?\0o�\�\�D�H�6֜.�\\�5eH\r\�(q~X�\r\�\�\�i^�E%�h\�W1[�l�A4k\��ۺ\0�=&nuԗ�-#�~2�\�Ź:S״\r�`5�\�˾�\�\r�c�q\�\�\�\�,k+�&\�t^mP\�zѶ�)T��\�\�^�j�v(�J��\"�N\�\�@ތ\n\�\�W఍u\�h�\�n��z��6ثr\���kS�/@�K���ٚ�h�:RKɓTZ��0�\"��zQ+�r\�I\�\�~��\�,M+�mZ!kzQiD�R�)��e#z>\�\n\�\�\\%ȣ-� �\�YK.\�\�b�Z���rΒ){u��j\�SiJ8u\�d\�O\�h1�W\�R�\�@Xc\rNsxia��\�Z�U=�EP�����\�6�x��\�hհN��\�\�>�\���U1���)�A�\\Ҩ\�ށBܽ�R\�F4�G\Zan�17�\�J��\Zi���+]��\�D�K�(�b\"A$O1\�u�h�\"\�z�	�k���\�\�:�\�p\��&\�yu>]zР\n @h�\�9>R\�c�U*�\�OSCq<&u�\�.\���6j\n\�8\'>�d�\���\��y[:��:�ߟ�Q`\�.x�I�:aosJ�\�W���St\�r=ļ�D\�\�w3@ܶ&�*\�\�\��U\�\�J�r�t�LF�z�E$Uk�f.���잌�\�\�)�\�҃��Q@�t��sҥJ�(j-��b�\�VEf�>�hxe\�Z�\"�\�8���\n\0��\�\�k�[\n�I\�a�}j\�(�\\�h�x���u\��)�%\�\�bt�f�m�\�Vs\n	\'�U\�\�Չ�av��[- \0I;�5��~0\r\�\�?H�}�a�xl\"\'��wܟ2u�\�r\�H<(]¸6P\Z\�\�y�u?\nm~\�4P\�dMrq1�OI�\�Ƶ\�\"�\�^��ׅ��Իƭ#e-�ߔ{N�ʱ���%\'IX\�5X����V��LJ\�fҗ��\0��n `A�)\�1F�\\�QOTtV�\0Ƣ�͍Mk�Z\�$\�9}�E\�ִ\�w����#�\�Z��1�C��.\�h[\�L\�\����c-�X\�V-C4>&\�:���\�\�rVP-�v+�n#\�E]��.Ǧ����t]\�\�5���*᠊mq�֞N�]��T�=-JNC�q+(\���X�\Zg�\��ҋ�]�B�*”�.�֟bl\n�\rlR�\�V�\��FƔ\"\�Z\�b(+�v�RǷ\�\�)a9I\�%\n�3�[��؁\0�\�n\'��[\�\�ʊ�\�\�i\'	\�~�Π�v�\�\�N�]<\�\\�2-#�z�WQ\\\��\�_��e�\�T�f�cRw�\�\�\�:T�~.)r��\n��\\�u\�g�Ҩ^)\�n\0�1��2@1�ӟƲ��\"�у\�!�P��:hN�\��\�\\�-+\n�(Uq�\\���\�\"�)6u\�iq\�[6)�F\\\�do����Q�\�k�\�u�\�\�H\�\�ѿnzS\�\����0\"4\Z\�R\�!�_\�bA\�\�O9)�f\\x>6\�\�ط�bJ��p	,\��\�H_\�ӤN�\�\�^�\�	>&`\�6Yԉ\�:\�	k�*��\��\�N\�ή�\n�\�\\p@a��\�$\�6\�H\���Q\�ɧhu�\�\n\�B��\'ĤHa:\�Kz��h7%C����\\\�[\n[1?�Pc^��{�\�N���ׯ\�\�њj��\�j��n\�iW z��أ��n&u�%�\�|\�c̹I�ƹB\�\�\�O�Y1�rV��(\�\�\�1�t�,짵h���\�ɢ\�\�Ȣ�Ż�S�L\�W�l���$I�\�\�*(�n+\�]\� U�����\�IY]l�=J�-JPi�0�~U��\�+��&�xlG��qof��\�ڄ\�ff\n�X�CSZN�{��\�j�=���S\�VQ�UG�@*��\�&ڢ�鋰\\(�7�G\��\��dTB�j\�P\�[�\�5�M��U����\\\����>~\�;\�\�\����o\\�W\��\"	\�e�z\�k\�]\�\�P�e?�\�1\�Y\�x\��\�.a\0\�mL\�cI[�+2�d\��HR=e \�\�ʱI�VδsB\�\�`?�83�,>\"\�B��\��\�H0D�\�N��[�2�e�1��J�����x,��Q`�.�t:Mlx\�P\�lݑqL�2��g1\�\"bbF\�֞�1\��\�\�)\�\�WU\Z\�X򓯇}�z\�q\�0Ιe�)�3.^�,Ƈ�j\�q^ ���\0Pr\�܁�\�R+\�>�\�\�}άN\�\��\�\�<�\�1J:o�n\���@MC��Pb�Z\�*���/ۗ���\�d\r\n\�X�N�\� n\��\�\'��\0B������V�\�p#Ŕ�\\�BTr:li�\����d\��l��}�\�z@ި/q L�X�\�F�\����\�p�d\�3;0�5\�ƽ\�\�.:\�\�e\0\�\�,�<A%�f\�#\�H�\�8����l%\�l.��\�9}4A���\�ST�L�\�B�vGC:�4<\�\�\�j\�1�=��\�5�qPX�ܓL�\Zs�5�5\�>�\�F�J\�\�\�P���[�9�y6�9�\�\�3k0G\�2����\�j���E\�L\�\�\�dR�\0A⣕��	H\��4�16t4�Ά+K�M\r\"\�Z�M<%\�iD�>�)b4Uػ�3K�!5eZ\�R���*Q,\�b)�b��Q�\�\�\n\�_\�\r�U���\�i�*N0\�eI�\�[�\�?�����)\�_ˣv\�ˠ��&\�B���ץ>\�\�l��1\�{�\�k��\Z+�\�\����d��֤�B��4%�y�>:\r�s�\�:$�	��B�D\�Nt���[ܕvb�\0�L�\�Ztل�O�ۤVC�\�M�PV[a�Fn�u�n4��$�O��\�v�C\�Y@E.�Ү�\�Xe��\��qK�tm�(ܖ\��\�\�p�B�����_\�4G\r\�8��\�+Ās\r���� Du\�\r�Sk�v�D\"�\�K2G�,��gn�S>�}\�6w\0��\�I&y\��B���j^�����\�\��l�\�4!�X\�{�SC7\�\�:\'�p]�*���\�H\�\r`��ybᐦAԝ����2�L\�\"\�Q�\�΂�m#��e\'i\��Z��gѨFf\�_+x�<k�;\�e�8\�\�8,\���%B\�	\�m�Ls4N��\0�����T\��\�׸���\��\�Qlxl�q\�\�`d\�2�]\�ej\�� �i��\0A�\0�f	fB\r%�b��Ӡa\�9\Z\�\\/��\�\�n;�Ql�(\0-���C��Q\�=�\�T�`^Pv\�\�\����@QX\�u��X>\'�b�����\nX�R\ZO\�\0�RIkZg7̄#N:�\�\n[e\��ث3IvQ�)\�zah�\0\�fH\�(\�޳�;�R\�tb����Ϧ�9��u�dS�ne�\�x�� �;\�2T�Q�l1�d \�LVw\�	��{l\�@\�#���\0\��\0���\�j>*yC���\�\�R敝\�c�֝`\�0��\r\n��!\�\�pxk5Ɛ�\"�1�Qd\�\�gqO&��na�\�cJ\�i�\�T���C\��\�88�\�\rk�\�\�C\�J���\���x�\r\�\��M6\�\�t�\�\�S>4�3if\�\n�\n��kfׁh ֢\�,@t\�zy��f\n�\�5�lq&S��R�I\�,ז�]\�o�\�\��$\�hՌvt��1\�\�P8��\0l��\�\'\��\��ԖD\�\��b�&\�jq3\��*\�C��A\�6}	Ǹ���1,��T\�n\�Ir��%B鶚\�N\��)��H\n�,�w�\�9w��C�5\�/L�\�\�\�M�\���N\�Y5�\�\'�-�\�ꩊ�\0\�\��\�~\�\�gyRF��d�C�m\�֤\�\�*]��� u��\n\�V\�@Y\�K�\�KnD�B\��{\���K�9\���9C	Ў[s\�N�-�\�Q�x\�b��	ڂ�\Z�\�B�p9׸�P��d)�!,\�1]@\�=\�\'y\�\����\�t\�) �g�[��\�ESp�+\�\��ː$��4�r����\�\�ZZhؿ��\�\�\�\r���\�x���\�32�����c���=\�{yݳ1��N�z�(\n4���?\�R\�۾�и��Z�e&�ҧS�}����W�ϣ\\\�i]\�EfTQXX	53���m3�\'��J\��c\��G�{Oo&{h!�$*�o\"&\�\�2֯�0\�.:\"\�W\�\�a�h��\�${�:�+\rjՔvM}\�\�o\�%bX\�R�`�`Q�\�|Up\�f\�\�qi\�\�̬3������\�:ޙUіs�\�\�\�\'�\�vb`��e<:�b\�WQC�\�6���H]���\�çbMaxC*�\�\�$�P\�\�5\�A\0o1�[U�r�Ԙ�\Z�m��\�\���\� y>ç\�)7\�bZ\���\0\�i���\0\�\�\�\�\�@q�̪;���i.8�\�ل��j�#��C�\0E<��\�PEb��\�q\�\�<4�cY�\r)g])����q2��`A�1-�3\�I \n\�\�U�\�]�%؛#T����\��Z4�lk5f!	]%�]3�X�F�Y�$�\�\�n)m\�\'j\�H�Qg�+��2\�\�\�\�j\�>��\��\\8�#䷦- |�@q3&\�2���+Cm@/\"� ��	wf�sQTa\��\\[ʦ\�@I\Z(Rvՙ\�NU{]:##_tV\�d�\0���1�c�;,�Ip5#\�\�P	�d]\0��\�h\�m\�����Y)r\�bn޴��NU��B?T�a\�Sϩ�����ᕽ\'�#\� \�a\�;I�Ɂ1O�8%btIRa|γ�U�xr>�b1) @\�Am��\�J0\\zV\��3\\O�\"��}Є.ŋg\�@\\�cNzt\ZA��+FTP�(*	\�6�\�\�_����#�\\]J���x�ݵ*|,� ���;\�7�P)�a�?���\�\�-\��\\WBJ���(o\�6v�جf%�Ŷ\n�²��B��\�=Q(@&fi\�5�n\�z$f\�\\-�ZA9��x0G­o]��7.=�O��˦ڋ�C\�A;��\Z\�9\�t\�\"�_Ŭ�\�H\�\�o\�Smo�fBQ\�c0>!d�\�Jx}ј-\�=�L\�v\�ۢ\���ے\�m.\�.v�\ZiCᰩ���ɇGW\\\��u��\�L� {t�\�&��;^@���\�S��\�\�,\���1&�)\�--#=�\r�\Z\�\�V��v;�\�\�=)���T�<�=O]��\0�\�)��\�K\����\'4��d���\�\�a\'S�\�`ę�\�\��cA\\�\r�\�n�\�\�E`\�#0V\0\��<�\r��[�/�ҙa\�Ʊ��δ\���hy�hm�\�]J:UL\�j\\�\�J�\�%U��\�\Z�\�ީ˅5u�c*-6�\n\��SE\"j�A>\�y32�gZ��a�x�q*�\�1B��\0\�J�\�ъ��ж![��KƖ�\�\�ߨ\���ʆ\��X�i@�V��W��\�/U�xRe\��r_i>:Lr��x^ij\�k�L:\�jC��\�\\�t\�\��$!�����G�\�^�Gz*RJ��gh\�b�l���>F�[�cZ�uq$w�t�X\�\Z7]���ފ�ٳx\�OLZ�TEP�����<�Zp�=`~�\�`s>\�{-q\��O�A�&|Jd�&T�\�\��\�:�:ad�RZw*k\�&6�1�@~cU]=ox�\�\�1?�\�-��\�\���e#\�$sS��m\�i��^\��2\�Õ{O\�³1\�e��\'�k�\�\\=��\�����eH\�9`�3ʴc���\����\�с\0�3_˚t\��\��\�~ۻ�\��@n\�L{[\�Y\�<P�UI��@$2\�5\n4#��V��\�-�v>-�k��Ī�G��QTi�>u͎\�d1����&\�\�\��;U��\�\�\�\�#\�5zYc\Z��qx�˘B�9�c�5\�ֆP\�	\�&cϽ	o�%؉bI繚e�\�$I �Ec�<�mp��\'�\�\nK�\�\��U\�Q���\�*Ye\��&Uv����#\�ׅ+,�);`\�\�3W�vJ�-�كPj\�CV��>\�W��>\�Z�2pe+n�T���\�jŰ\��\�r\�P�D��\�k��\�\rA\�E�*����\�\rt�I�m�\��y�W�\n\�#~�P\�o\�hY8����P���\Z�[~��\�*���©2�&f4��\0�S\�y\��Q`\�΂g��|\���8\�[F�y%Bf\�\�3\�\"�{	*Is9*l\�\�Pu�6�BbР\���aF\��t�-/l�\�bK�F�zA�>Uż9\�	;\���T\�ҽր�\�6f�[En\"���\�c^zV�a�]7��<���\0L\�2�V\�\�Y?\�7[\"h��\�\�I��\��>/`�R#`,�\��o<�����8��X˂\"��Iq[:��?)\�)���\�\�+5�\�;�t��gʫ\�c�!\Z\�&a\��5%\�\�\r��M�5\�O���\�9�\�Zű\n\��mt#���\�	�#�Ͻp|�8�r�\��\0����\��s\\��\�	\�s���\�$T��iJ�\�״	B%B5s\'���\�m�s�z\rϙ�V\�\�Rk��fj~\�m7�%�]�w5\�!m��ۯ�A�\�V�\��\���\�W\\����Y(�-*�g\�MT\�bB�\�|�\n�\�9\�@\�~g��Ɵ�_\�Dh�,/*\�\��W~�*�\�$\�\�y��\�\"\��U,�y�m,�3\�\�\�1$�\�\�\�5چVgi$�ވ�\0�|�\�\�c$qv\�\�9z\�\�\���p4\�9D\nW��Uq��\�6U�ryї	�܁�\�iS\r_ę�>\�U\�\'�\"\"�.�G@���\��ꓮ���-�r�\�IBH\Z\�;��;t�|y%�g�<N#v\�`��D(\Zo��:�\\�4h7\�Ҏ`��\�Sښ��\�\r�\�L\�>O�R�	ƍ�r��a��z`+$s\'\�^aqp5\���V3Ť¢\�K��\0�\�a�9j/ofYBKl�\�{�r��B\�|�U�k\�\�5ƂvT\�i��h\�YXF*\�t��\\Nݢ�)9�]�St|��4�Y� t\�\�F\�\n��\�1\0�S؀5����w؊a��z<��gS�1JQ��>ly~_F�R\��\0OWnk?\�?J� ��\�w�k�so*\�\�\�{\�\�\�E\�\�A�l��\�>\�\�\�\�o��5�}mA\����m�\�w\�\n}���{]�\��\�P�B̥�]��\�緝]nҮ��]ϙ�\�㹠�\�9Vs\'U_>��~�A\�E�\�`n\�e\Z{OAީT�\���\�;\�Jɂ\��\�}f�\�W \0Kh:�2D-���¨\�\�U\�n~�S�\�\�\Znv��\��?T}b�-�U��\�\�\�\�\�J�\�傃\�$@\�\��\0�Ѹ���ű%�ׯN�\�#�DB\�|��s��\�\�%S\�\�\�#\���Li�\Z�|�_!�\�Up�\n�\n\�d\�!]�jG\�g\�KCX\�s\��\0uUǍGC\��]���з.:\07�\�G�9[\�D\�\�\�I�ݕQ� \'�2~$Q719U\�\�}��I�s�~���R1#�N\n�\0\�\�yi�\"�a�s1\��������Y}\�G\�a�fO0~\0ƙ\���F�sB?����A�1��\�#B>G\�k>1�\��&k�\�̟:|NX䤁))*c�E\�E�*�:�h�u�\�A\'�U�|@� �?\n\�^\�\0��A�A�:\�4o\� ���E�	?���\�\�{\�j�l��YS�(ӌC�!�R�:g�O$\���Q��S����kl\�\�s��\�\�a�Ҷ9$�\0���p\��Z�\�6\� q�H�)C/1W�d�C\�=�g\�U\�I�\�c��:7�VZ��ބg\�\'\�C]\�k�	\�\�\�u�KV\�٠r9\�\�d���\���>�Jl\�Y J{\�?u�|�\�\�\�9���*�N��\0r\��[��]\��}Jm�\r\��/7�� ����-[4R~d���\�E!=\0�5��b�3��P��\"��\0�\�j|��;\n#t(�|�|\�,dnc\��\�!V\n\\�}Ϸ��H\�]_p4\��JO�ıeDN\�b3��v���3�\�O���j\�\�*\�<�r~\�@��\�\�\�RL*�L��R�5\�\�v�\�\��N\��M��~�\����:�$�~\�\�\n�uv\�A\�V!�.�\0\�w\�LH\�\�K=� {<�;ց��\�#�1L���fG���G�L\�>[y\�\"(�q�\�߸\����T����ʠ��Z\�c��\"X��\05������p\�QH�4,D\Z��#�\��\�/��p6`�g�¹\�[�ܶ\��,Oʝ�\�`��P\�\�\��\�T6,^gνv�{i�\0��9\�#mz�\0}�\"�\�\�\�|>�\� �\�u�O�\\R\�\ZʦG:�\�*\�f N�1$*`�0D5\�\'\0��2� �D#\�E4s8�@\�z\��!��m\�0 3eȐ\�Y�¸\�yS\�5��m]\Z	ض���e�\�r�ń`\�іg\'�,it�x�\��\�ٻ���\\,\�.\�@~g\�/\�[\�\�\�m\�\�.�\�\�\Zi,\�\"�i��R��\'bK\�<,\�\�$\�O֙\�\�5�Q�\�\n��hy��{}\�0N=V�\Z�h~�͓0G�\�6Jz�D\�O2�m���l����`F�\�\�\��A?�_\��\0\�z�o�~�\�JKQ�W/\0:�h�QG]|�z�8��O�r\�\']��vM��\�[�Q\��?+\�\�Q�~��\�\�\�A�1�ڞ���؞\"�k�=\'�\nh��\�q`�\"}�ڧ\n�\"\�syk���s}|\�\�i�\�\�+\�\�)ӯ�ԣh8\�1\'�w\�=�qs�\�P��ru��\�M?S\�º8\�\�x��u\�\0Ʃ�.�\��`2(\�eP�\'�\r��\�\r����\�\�#o:\�=5\�~ܶ\�\\�N�>��j�:%��\�\�ߤ���}h;r��ן�$��Ln92\0&3\rt\�\'�2O��|Z\Z�=��Чa�G�\�Y\0\�+��£\�Ԣ����@��9yQk�R\��dQ\�.O����\�bSF�;y\�u��bɕ\�\�[NB<\�(�\�{d(R9\\M��fv�\0$��R`\�?��L�b\�ѹ0\�R+\�(\�0E�K\����0��/C#}�m�\�A&-7\0\�{y|��x\���۷?:��=����Z��M����|��\�=u;o�~~��\�Ў}�\�\�ML��]J2\�Tx.\r��\\\�1��]��m\Zf9O1튲\�5`�Ab5o���c�VF$�Nm�seY	\�p�A=T�t�\�x�\Z�y\������=��\�\�ۿ\�U613N�ﶧy�\�^J�\"A\�t\���遡\��U\�\"ʝF۞\�\��/-�YǢ��\�G>S\�\�S�\�v�\"�\n\�\�^>�o�οJW{�	\��\�gM�\�\�5\�\�A�{�ޢ�\r\�\���@\\����k\�43׹��k\��T�L�\�\�\���\n]�\�}�R�\":OT�}Mxް�Z�);~^U_\��\0�=��i�Z�*>���\�AQ�ϑ�R��\�}_`�\Z\��_�U\�J>�����>��}jT��$Uc\���Q�=G�?Z�*H16_�Uj�\�\���*R[s\�>g\�]�T�~U*QD8�\�Ҽ�w�\0+�*T�^\�_w���\n\�s�\0\rJ�\�)>���ҏ�\�\�\�R�2:���S�T8\�\��*Q�AU*T�C�\�',1,1,1000.00,1),(2,'Pink carnation',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0\n\Z\Z\Z\Z\Z\Z!.\'+#\Z\'8\'+01555\Z$;@;5?.4516+$+84445174116444444444444444444444444444444444444414��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\07\0\0\0\0\0\0!1AQ\"aq2���B���R\�#b\���r��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0&\0\0\0\0\0\0\0!1A\"Q2�q�a��\�\0\0\0?\0�4D@DDD@DL\\�=_�*\�Q��I�{�\�\�N�\�݁�N�^P6��+s�\�\��\�\�Qֶ2�I\"��\�y\\�.�AI\��Ny:�[)\'\�ހ\�\"��\��F\�Ѡtv\�yK\��o�ē�v�2ٖև\��=��\��5:sC���N�\�\0\Z�@\"�\�b`3��eF�\���\�J�ߦ��\�.p<{_0\��k�ի)mEn\�K\�p�\0���T#��R��:\�\�;�/�R�S1\�\0;آ6N\�\��\�9߶Y�q\��*\�Ɖ&\�W��S\�7\����aVMV���\�Q�\Z\�4M�@��\'�M�[��\�W������\�`u���bE�\Z\�\�Ig\�x�+\nn\�c�8�\�&R��\�\���\"y\r0���\�,\�\�&&`\"\"\" \"\"\" \"\"&\"�5(|C\�A\�k�jПO��\����4�\n���Y3S\��\0�\�\�Q6Y9�\�(�1>��\�L�\�]Go\���)\��R+\�b\�Mr��(_�����&\�\�3Su\�\��B\�����-h\�>\�[tX�X.(\�FPJ\0&��� G��\�\�\�bb\�p\�#�\�8T�c���\�1Q��EV볛9��N�\�)T\n\0�_3�F$\�\�9��\�_\'��\\\�R4\�E\�\�s��\�@��\�\�(`\��T\n\0\0��m\�NH�v\rz[jB�\�KsZ\�u\�^\�{_��g�\�\�\��l):֋z\0w\�߼��\�ke�2\�!\\؀�͘Sb��97�]\Zk��\��<t��\�։jaA���E/Po�\�\0�A԰f9\�AQ�!,(�W�Ƭ\�3\�+:s��^�:LUl%b\�\�sYpC�Z>U�QhoE�gY^�)�إKC�\�mYv�vS_Z�C�kc����6u�f��\�Zm�\�C\�\�p\�(	͚듩��dlH���\�ٻ�~�\��P�k�ʬR�\0\�@�*\�\�\�q52��U�\�^\�Q�=澟�q2�B\�IRkz����w\�_;�\�\�@�\n3hWZ\�C�\�u}M�\�\�/~��j�Q@�^�E�܁��f�\\�\��Z�\n8|�1[�G��)\�ux}K�\�\��~�TB��!�7\�\r�\�h�\�	�H��P��VbKfvl��O�l}A\�E\��e�,���\�ՙ�RA\�]���~��U�+QM\�Uר \�\���p�AƗ���^~r��tڂ�F\�E�[\��}��e\�H\�\�\�\�S�zu\��\r�k�\�\�\�ZN7�aC��\�`�\06�W�\�\�\�\�0\r�lA\�k�\�qs\�1˦؈�bDDD@DD����1\0I\�O���9\�>&��L���8\rc)djl0ٴf\�qW+r�2n\�[\�>&�\��\0\n����g^\��Hx�@n\��M\�Dz��纎�J�f�\�ࢀ�j\�S/8VY2\�e�KR��Ck+��\�4\�]x�\�sۺ��\�\�\"wG��2��\�ٺӼ�\�3 gr�\�\�\�نk\�B8U4ޯrg���uakى��\�\���_�\�h1Fml�?H޺��e\��Ӎ\� \n�\r�\�ǌ��a��6���W3imDr�N�67�Xe�*��\\#m�l	5��-lt�\�W�oTz�>\Z2a�`\��N#\�\�d.bh�(\n\�J\�ky\�?�\�g�\�_���Tb?������&!\nB_\0Փ\�+:n���\Z� �X��\�\�\�\n\n��T\�*\�B��f�S�!�\���\�7�`\���\\�+������\�VW//W+�\�I\�a��\�\�G\n(\�\r>�Cc`��F\�l�>u\�&\Zd�eј�\�$\Z�\�&�qu=\�abQbI:�v\�\�Y{2�N�1Ƿ�&\'r,\�]w\�\�͏I\�13\�BV�\�6\�Qb\�z\��5I,�I�3Hǯ�\���R\�J\���P?\��y�@�\r�\�R7ڬŝn��<ub�\�3`�Q�&|��]\�\�[\�Hڅj;\��gWm�AS�\�\�2�4�b\�\�\���\0�\�M�&�h5�\�j��y7�\�\�?N\�k�++)\�\�PZ��.�+]\�r\�w�\�\�e,\\�%\�V�l³\�\�h\�G=0n�ք^[\�\�$\�|f�\�k\��:\�\�\�\�\�zv\�I鞇��-�f�\�[\0\�?�t�;e�\�@	PFZ$\�\0\�\r(6\"�\�i.pF)(s.@[0Ж\�ea����}�\�<����z�K��9���������=o�:b�\�  3Q�`�)\"�g���\�W;y\�1^�a���Ƴ�?\���t\'��E\�\Z�\�$s\\����n�e\�w�(FT\�`YT���\����5\�lc�\��@���	��e,	�<\�Y,P(}��K��KQ 8\�C)\�\��w�\�z\\|\�\n�X���(X\�M\�\�	��0T\r�ȯB\�8�,N\�\0\�\�\�K=�8y��ʮ׬p�򪨰\�\�Z\�\\\��J�\"��$ln�\�lAjbAR2�1$�\�R\�[�\�gU�_Ӻ��X�\�+V\�PXm�i\�Vx��.6&D\�\�Ar�l\��\�\�R��\�?�\�+.��zn��\�w\�\�\�\�\n2\�\�E¢@�E��a�\��\�\\t�\�\�*\�\"h9V\��W@^�\�/���|g\�]2)V�b\�OÛ0{����\���fP<\�\�@`tRsk\�\�f5\�7\"���_w\�!��\r�p\�\�z7��t?\�K\�:�Ă�v�r=�\Z�\�i\�\�1Q���Z�f�\�G��\���z>���΅��]�;_���\�\�y\�\�\�ê\�\�o\�\�|ِ�\\�_\0\��aCi�U�e�pA\�~=�����r�(��;\�M��21閕mYI�\')`Nk\�F���{K\�o\�<1�Ԍ��X\rI�\�����\�;IN_\�d\�\�\n4��\�\�;�\�TUGk\�(�m����&�\�\�P�]\�5\�z\�y�}/�ٽ9�\0\�N�F>\\0͊�P��J\�m\�#��\�e\��ޘ諉�g)�ٺ\�\�\��\�\�]𱘐�yN@r\�|Ő�7�/�\n&\�c��\�,\�z�(�e*s\Z2�7D��<u�|3	\�eH\�I\n\r�u\�{V��3gG�YA$\�� q|�*Qذb��|�H&�\�D������S�S�\�E�_C~�ev匳K�0�B��\�\�l���j곞\�]�,�\'�W+�EXl\'\�eү#�\�Iߩ\�T�#3Z���\�0V%X�|�\Z�a؋\�Z����kBr\�RNq�\�JA�0��c�x|\�YռL	��\"\" \"\"\" \"\"*R�\�/�5\0\�Zm[m뼺��&]8_\�s[e<\Z��(U���W�\�8$U6�\�I:k\�.�\�>�\�tew\�\�\��\'\�~s�a�2�c�N����\�\�u\��\�Ɠ���ϥ\�\�\�_D\�\�[\0o�Ս驲w\�o6�8t?(!C�mM�V\�u܋4�\�e\�t\���Z3.Sy�*>!\�|\�Q��-\�\���=�@\�D�&{��F�\�e�\�ͭ\'\�s���\�\�A	�(\r��9M��v\�\\�\�8\�\\�R����\�\r\��L�\�x@Y@k\�|\'�+l���I<7#� �4hkUV=h\�ˉ{�:�y�\Z�pz�\�`�\r_)XU45T\�\�\�aV&<W\�[	ՙC\�-\�\� U\�QU�\�\�2\'�\rsX�\�qu�N{���gtwɇ�:�g`p��+D�\�38օJ\�f^�\��2\�\�i�\�\�T�*�e@Z�\�N����|�\�C\�a\�\�\�\�b��R͘l\�\�\�_��O�\�\�:�A�\�N�m�����r��\�?�\�n�\�\n\�>l\� \��6P\�֝�i�q�=�\�+a:\�[��Rn�\r<�T����2\�\�\��\0\n�W�K\���3\�\�O��	�.�V\\ۂ���:\�<|VUlWe\n|�@\04M �sR\�\rnE\�c�W�\�[%�\���[\�C�\ZeF�\�G8 -YJ\�\�A̽�\\L_�uE`	@	!�V�V\�0l\�~\�\r݃���U\�PZ͖�	\�˯:�\�N\�0�?\0�#�b�sj\�G>c�5�{F�2Ó�\�\��ˋ=emM�\�\�U���Ŝ�گ2\�;\�.��\nr*�S�l̵wg�i@�\�\�u$k�mO�\�B�N\�/���#��ŀ�1PX^�u$d���\�le����\�+°qqS���*�BS���\�Z\r5\�Z\�u\"�#R���r�F�P5�Zޓ\�/F���@\�\0��߄����\�<^u�dL\�	���D@DDD@DD\�\�@ħ�8�\�\�\�j\�\�2\�#D�p\�F���[s��\�~/\�G�_\��߽�΃\��@�XyCk`^�\�\�yP\�F\��\�a��׃���\�U�9}�c\�ޚ;����\0�h|�\� n��\�3�\�CD�\0/�f����\rh�\�<w\��\�\�p�\�d\']	\�v\�[�/]U�2�o�*��\�m<a�,�h��mgQ�\0RG\��J\�1�r\'(��鮟��N��a�B���փ�$Op��L\�]��\r��\"�͛],�:�_\�jP,�^�lڸ\�\�S\��+#j���`=	�\�S�;�|\'�_(wT��,_��VY����T\�(ڷ��X}8Quzk��Z\�\\%�\\gۖ\��T\�*\�M�\Zf��O��鬕�\0\�c�b�i~\�\��M{�:|�s wD\�S�Q�?y%�s\�|�h(\��`�H�\�\�=���Ӗ�OlV\\fc�\�Y\'6�\"]��\�z>�0��P\�|�\r�O5g~\�m��\n=L\�6\��,�\�S2\�f`L�DDD@DDD@DD\�\�@�\�`R�K\��NW#a[\���\�Ǯ���[\�u\�\�z\�\�z�[\�-W:��\��\�\�\�4=hI\Z\�\�md�L2�7;q�Q�9��w�o�\�\�QA��}�\�d�����\�Y\'Oq6\�\�\�$ߙ530ҁ\�׉�Үa�������H\0I���C��\�=\� \���&1��@q7;ҳ\rv\�\r\�\�i�L\�\�=lhv��f��\�\�\�$W-J\�\�&P�\'Ry$�kic\�\�~c�:|\�\�yh�\�\�-�\�00&b \"\"\" \"\"\" \"\"\" \'�\'���\0���u_��/cϴ\�]½pHx;�\'u\�afR*�\0�Nźr�\�Z�X�����\�Pl\�\rv���\\ɏ�\�7\�h}w&R�V\�B|�@>\�zi��gm@ܟ�\�u\�\�u��c�Z\Z�/�+�q�\�Η��x\�]\�K��4���\�\rE���\��\��e�N.��v�	�6�צ�\�[�\�8]y�i28�\�7a �ɉ�fD@DDD@DDD@DDD@DDD@LL\�\r���h}�\��k�\�l��1-���l�y�jZ\�Z�\0Q\�\�N\\�����\�Mp���\�\�V�\�\�}�\�\�9\�����(���\�_\�2\��fK	ގ�\�a��=�;�\�P\�\Z����$�}2��X\�H�\0\'@5\�����`���َ��\�\�PxC2�-�e?�^ڞe׆���YH\'3|Z\�ݷ�O?��G[\�t�F��\�J��Գ�Z�V·,$�����bbfDDD@DDD@DDD@DDD@DL@E\�D\rn��RpuI\��\�\n��-DX`���;w\�u\� \�#YmASM�\'os�\�a��\�*.�\�\�v��\�Et�n�\�6EJ�\�䷩�\'�\�\��\�\r�h���UG\�Hl>5�\�O_C0K6[���i�;s=l8\�\�\�i@\�؏�\0+���?)\'�>R��k�\0\"�Sj`(Uf;�(Z,@\�\�Y�SK���5�Ͼ\�\�,��_\�o\�\�_�*���\�B\rPӶ�\�\��8g2�N\��\�DG�\�$˧����Ř����������������1314\�\�.f:F7R��}�?IO\�����]n\�ý\"ձ\�u\�qlg\�h\�N���v���(AyG\�s\�>�_��E�\��w&�\��Ƚ��wS�#0���}%]|_�\�tR�\���T&p��֭\�\r�}{{\Z�[���c\��G��]���\'5\�H\�\��[��=Ǥ߆scf�=�\�\�&�ҿ\�\�z�\�N7TZS��,yG��跰�ɵ�&x�W]\�w9�p��O7\����x��oy\�xY�d�H$�[]���KD\�6\�\���\�\�f\�,B=D��%��{��fa\�DD@DDD@DDD@DL@J�\�|���<s\��Kc9\�\�\�\�۶޽�\�j\�\�\�JՒ$\�;\Z\�\�\�\�׉�vF\�\�\\���ާ�C�Y��ү\�R�mN�\0C�2���Z���U�\�t=Pӊ��\��\�Xb\r�\�{I�ָ\�\�\�I��\��l֜��\0?���:��qDP\��7�ڿY�0�׭\�\�\�\�{\�>0\0��^�\"�͡a�y�H�]\�]wj�9KMnn\�\�mV\�@J�6\�\�y\�0\�\Z�����Ơ_\�w�f�\��0\�\�*T�z�@=�Q\�\�\�&�P<�j��\�Z�a\�^�����\�G\�,�o��\0���#)5�\�ץ?\�H�z�\���{q!������N���2H���z��A��33[�N\�S/�uyM\�ޝɜ�\'cc�����\�Y�ډV�G\�#ⅿ+��\�\Z\�kAǴ�\�\�iӁ�jG\��\�۞�[�\�=\��\0?I��_�Ҥ�k-�εX(P|ē}��\�\�*�\�\\�Z;�5C\�/���\�\��&��@u�n\�\�[[[}��d�Wr>��WQ�2\reB4�\�\�#Qc\�t\�X�C\� }=g�\�?)���ս\�$I�W@�!A`U�l\Z;v�z\�,\�+\\\�^\�_\�E\�\"��E�v\�K�\n\�bw�#}�)>�-&�\�r\�\�!`t����*��\�_\�K89\0\�r>b���/J\�B\�\�|�sq\r�W:حv\'^4w�\�,�ZY\�ߴ��Z\\\�0�L���L\"\0li%a��HU�m\�`���=U�����������`%o�\�\���\�l%����\����˯\��L�Y��#�_\�I�zy\ZZ\��sX�gk��1zV\'}��\0�n�kn��F���8�B��;\�m���\���\"�QĬ\�\�E�m���-�c�}#�\�Us!\'\�b=��}/I��\�\�\\�\�{��\0�i\�����:�\�˅�E����\0o���o���\Z\�\�Zi�\0roE�\�@4\\�k�&\�y��9�0�\�#.�]\��\�G�ӕ�DΡH�\r=��;T�\Z�;\�d�\�\�zL!fubw��\�h\��\�R\��GL�*o�0\�ؒ��w[\�Q=��\'�$�13<�D\0�31\"���vo\�1�>\�_a�\�?\�\"$\�陸<\�l>q�\�#)���\�7��\�\�\�j\�Ci��l���#31�\�',1,1,800.00,2),(3,'Red rose boquet',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( \Z%!1!%)+...383-7(-.+\n\n\n\r\Z\Z-%%-------------------------/+----+----------------+-��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0?\0\0\0\0\0\0!1\"AQaq����2r�#3B\��Rb\�C����\��Ss�\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\01\0\0\0\0\0\0\0!1AQaq���2��\�\��\"�3\�r�\�\0\0\0?\0է�В�e�\�\�D\���\����S\�@\�\�	@�L@�\"�_l��|>��]\�<[\�H�Ƙ��.,NѣJZ�a\"@s�$XnF���O0m$��b\0�L��\�\�nq�����o���\�/ST^�O�Nɼ�\�qh�qti���-\�(��\�2\�$��G9�\�Z1V\�V�o\r_�:�#B�5MCo\�\\Z^��\�1\'�O��M4�+�Ntݦ�\��+!8W\n\��SK\ZTa4��&\�G�h�̼�P\�8�H�T�\�U��GI�]/\'�FCG�kB��5�D���\� \n��R B\n#%� ��f)��\�5��\0a\�ak����C��\�0\�`����sP�\�M�L\\S{�Iqz}ߦF\���O\�xi\�7�\�pT\�=-k�D�SHl\�{�b��\�C\�\�\�̛\�\�On�&�<��9�:*�f{�}�J�W�r�]\��>&\�\�g��S\�ָ�\�\�\�Aク\�\�wN\�\��d|w00Gb�\�3$Tr\0�>7�\\\�Q!�j�.o DϰPs�\�\�\�qY\�w\�{��\�w\�v\"�cj���Ĵ�E��\\A\'\�K*�89\�͐�\�\�\"ل\�\�\�\�\�Z\�p\�\\\ndA�͘ͅ\�<N\�\�.-u\"\�\�sCH�1l݀\�(�\�\�\'�V4\�ɷm\�\�\�e7Si\�s�p�\r��I>\�tSu2s�NV���N���:t^\�\�:��$�j\�\�&xE�;Tb�i0\�\�\���\� �Q��\r\��;�b֒\�\�my\�t\�\�WF\�\�>*��\�\�;(\�2�Gx\�*\�8��\�pL�x\"��(�\�I\�\�H\�\�l\�`���\�r�/g���\�\�\�\��j�i\�\�\�[{\'C�Rqt\�k5�\�,�\�^1-&\�޼4Z.>�G�ًD�\�8�\Z�c�A�tNYs@�\0��\�e��\�6}�\�{���\�.H\�1��m\"\�o�\�UJ\�ՒWIy_\�\�C\�@Mu9S\�	�`Z�l�\�I�M��I��0�1���T�ωBD�\�\�NpH\�B�,!\0T!	\0�BC!r\�\�I{LK\\E�=!�\�J��x�\0\�	y�I��,�_�HX��fs�\"��I�\�A�\�^�ҭ�qbi��-,6.k�\��\�d�\�\�q,����\�1hl&/\�Vy\'�s��V��\nWJk-\�\��\�\�;�q*�\�˷�\�q`�\�\�V�\�\�ػp�\�r2G�\�8I�J�	\�FP�����iH\�{E0j}ۚ\�2�&8�܏Y\�ӼR\�ǯ\�oԙ��7u\�7��K\�\�⳯/�T\�, 8�+��6��\�hr\�f�\�\�5#Neq\�qǭ-�\�\�\�	É^>{��R\�{\�p\�\���؜m��\�m6�\�h㔑r=-ا\�\�!���\�mڀ\�s\�\�w6#,��\�`=��9�#\��%\�\\\�\���0�\�\�T�&\�㯷\��ȹ\�\�s�5F�\�I\'\�V�=\�,9K\�Lf�\0=�Wc\�s��ܡ�E��\�\�\�\���<����p�\�\�H\�\"K4�W��\�u\'++z�\�~Z�\�\�\�t�f @e�\0�d�\�m\�?\�i\'�\'t\�	�\�u�|\�c\�^�#H��}4�s�\�1�\��;�\��q���\r\06�\0�|lF�\"�h\�-?u�˖d5i�\�\���i��43\�5�к�6\�4\�ڴ̖� 	\� �Ÿ(��:\�\rssN`\0�\�ţ��\\ʱػ�huX�-\r��٧z�b\�\�c(֌�sY�\��nj�T4�\�hvVn\�4\�/\���(\�8�{\�ܠ\�NQ.=�y�,K@\r&�;�W[q��\�\�wi��h\�\0@\���jV\�x���\�Q�W.<�^�\r\�\�Ś\�\�sLϑV0��\�5�h{��by\�O\�i[�a\�\�?\�\n軣�\�\�T\�J+O�O\�3��\�|J�7�$Q�ɭOzcUd\���	Б\0\"P�\"CG�&�@�Ƽ�\�1E^.m��\�)9�\�ox\�\�$x�\�]\Z�U\�\Z\�OMg����\�T%\�WDeW�6uj�/��\�Iy�\�H*)�∲��:�\0\n7ӧ\�wQ9\\̱\�����aM]Ѭ\���\�\n}��.��^ �\'V��K+�qvA��V��\�\�8�ɵp�\�2\�\�|!ǘ\�b\��i3v�`�g\�y��F�Q�\\�19j��k\�K3-�\�\�\���ͫ\�Sk�p�\0��z��W\�6[� �۵\��\�<��G�\�k�l5�\��By]ӧ%�\�\���\�\�,�׋\�-\")�\�p��\08�	�\�f\�]e_ъ�\�ͫyǃk\�\�\0��\��Q��+���_⿓\�\�\�_\�\�82�JO\��7+�s���\�N�\'Y]�U\�J�1(��k��\���њ\�)\�fc�����\�;*w\'��;\"�\�\�\�\�?�\�\�x|#~\��\"\�w�ǀ\�>\'h\�+s��	�S\�����Ձ\�-\��\�\nn��Zr\0\�\�\�\�x�����\�N�iSIE]�\�~�+�7\�w\��u�\�~��\0U��!�j�Ì\�\�\��+K\�ݝ\�W���܉\Z7��B<�8\�\�4Y���]͏G�]U�\�\�y�A\�!\\�\në\�\��\0/`�BؖV8J�I��[�ň�\�\rs�`�M�T8-/�\��e�)HQ#��\�ꉴ\�H�!\0S!*B�0*�\��^���\�~��\�\�\�s��H�}e\��3xw~a\�\�+,դu�3\�PW\�d��\�|\�K�B��\�\�\�\�˺T8�H*�\�N\�e\n\�\���\'�*��R�\��!Y\"\�ҹ8*ZNP1L\�H�:{L\�\nP��\�5�\�\�T\�`���`S4)���\��F4\�%8����.\�\�fsZ\�\�\�\0\0\�\r�m\nt\�uq\�躭\�nʁ����\�gx\�\�\�^\�/��D#es�\�طV���׿\�\�mS�\�\��4\n���\�/`�٠V#\���7��\�g\��/�\��e@�\"qQ6�uMi(�	a	�J�! �P�	P���{o\�\�p���nE�U=$���d\r\�w/\�_]X\��\�\��5\��G\��lĦ�)\nl,\�\\�\02TZ\�]��0\�Z;,�l\�\�;J��NЂ\�=�JКƩ���L��Sƅ#B�\�&!j�\�\�\�5���[w�\�]\�O5_F�q\0I��c�a���q\0�?\�N�<����)\�|OO�۩wI��\0 \0r@���\�\�+��8�?\�w\�\�:M3\�O�\�-QV�O/��j\�����^�ZS\�!#\���S쨕�/�\��eB�\"Q#��I-D��H�.T��B\0� \"T�\0HS�&n\�:��>o\�\��V��\��\n�\�0�O#˸�-j%�� �r+$\�g\�\��n3��Vo�\�\'ׂ~|z���t8�~\�=\�P�\�%Y\�D��CZ�E��\�RH�� j��R���b(��$j�ֵvl�9걐]&\�[w��X��&����2\�\��>O��\�8\�sL\0\0��$M���dq���Q\�_\�)q�\���`gh�R\�G\��~�z�:߉\�\��4\n���\�/`���J \��_��\0��*%{��7��\�Q�!Ć�)%����d�K@�4%)\0�$�\0!@\n�!\0=\�m�#�`\�\�\�\�\�hR6<Te�\Z0؉P��G�\\�t<\�\�\\\�Z��\�\�\�H�$vsʒ�\�՝�څXՂ�4g^ͯ���}��7,\��J��6=\�_��\Z��{WGX*ZM\\\'\�\��+-���P9\�X\�%\�p`��I\�MUN��]r&cI�̀\�6\0-�\�\�b�%�\0�#˓G\�\�T\�519�\�RS�\\\�jG8>\n\�f\�ce�i� �����\�mL[����w\�\�4\�\�JW�{Orm\Zwt�J\�\�%\�\�\��ܹ\�\0h %Ӊ��\�蔴GTo�{d\�\�7���\�j\�\'\�\�}�\n��?\�>ʌ�ȔHj\"�W���\�Hz��\"�\"R�R\0H��R��B\0T�\"T\0�J��9v��i9� q?��\n�ڸC\�e6�6\Z\�\�\��}1�e2A.\0�?˪\�\�LP�\�ޭ���\�\���A�kp�\�y�.\�rPvwM\�˯�.�\�W[2\�2\Zg/p\�6N.��\��Y\�p\\I\r0N�vB\�\�{X⺺McX�\�48\�5$\��\0e׆\��\�\Z\�^z\�q�0~a\�{S\�\�\�\�\�\�\�跠\��k�|\�Wi�r��yq;i�w��6\�{],r��:n�];KmT�^\�\�_+D\0֋nS��Q:�7�v\�\�P�*Qk̒\\*9��#\�I�>\�ճ�ef;6�\�Z[a\�\�\�T�jUj~*��\�W\���\��;z,\�a�^֐Z۸4�L�~\�\'�-.\n\�i\0�\"\�<d@^{J�q�CDG\�\�ov\n`Sh0\Zi�q1\�D\��>;��\�*\�ͻ止�\�|��\�u����v�\��KF�oÛ��\�v\��\�>���eeu\�\r����!j\r�\0\� �B\�w�>��!\r�\�>��\�Ry_\�wq�T�Q�\�@�1H«\�L�	��\�Rԥ4�\0�M%���QvJ�X\�Fl�\�6RH5��(\�L\�\�)\���\�t\�0��\�\�\�<Toc����̀\Z�9P�t�E��J���2R��#\�T-��6d@�� \�$h�;O\�;>l��$�4�Z\�?\�ڶ{N�\�\'9����\��첛V�zN};�\�\�7,\'�O�h�\�.·b\�{\����N�v\��:8�ʁ\�\�c趻\'l|5���p?\�R�\�?�c�\�StĂyr\�WcT\�2��rƂY;\�\�\�Ϥ�9��-��\�קJpޓIs\�g�O�\�m\�h�����mu�\�(��\"n\�\0�\0�>Ʀ3:�F� Ān/i�W��g���FJ����\��#\�<\�:��\�,�+�|�\�gS~\\\�\�R\�ZA �~Sm��gc�eWgT\�1xw\�c~Q�ծ�\�\�v�\��\�\�r�\�\�M\�\�\�C\�\�j\�ulC\�䩾錎�\0/\�\�眭T\"��\�m�Ҿ\��M\�\�-E{\�\�\�И|I����\�\��]�\�\�\�E��\Zl\�}�\�.,\�f�\�������+F�\��6x\Z\r\�\�\�ꢫH�\�\��\�~���\0o���I?�|]�@�A\�o	VT��\�\��\'�Iµ1�w\�\�	�\�\�و;�\�>ʉ\�]�1\r �7��q�7�>i9!�@\�\�\�XE%Y\")J�Ȅ��c>JD��2 ��	�\\6%\�ok��J��A��l��t�D�M�\�=S1\�C��\�UN��\�\n);\��\0�\�.�.BD\�� �)\�c�\\�Tu\�5\�v���+\��cM�=��|\�\�^\Z\�ӗ0 �`\�\\�\�qԒRa�\�\��\0E�N\�\�o�\�ƍ��׿�d��g_��ٻI�ͤGV\��i�7�hWS0�Zřڦj9\��:[�7\�E�K��\�vը\�5��L\�|����s~\\�17��`\��W\�b@\0\0\\.	\�\�U\�Ě��\�\�x�q\�8Jlsrul��^\"�%J\n�Y�U��\'	/m<�.Ӈ^ݟ��\�C\�f�T?%�6\0rd���\�A��{\�\�Υ#��Xn\�\\`�;\�\�\�Z̤˙\0�\0SF��Lў.\�\��U\�|6I�\�?�\�\�X�S��;)�R�L\�\�+X�hLjx@\n�@�	\�@�!$B\0͔\�R�� RJBRJ@>�	mB��ݠ��yHT\�9�\�\�W8\��\�|�U\�ս̜\�0bA\�\Z��#���mQ�d�\�\� \�p\�{g�er�m�nbn\�\�Jq�}�5:�\�R���Rt���\�2c\�䬟��\�@$��2���<\�?�>�%ec\�\��o���E�{�c\�\�a\�B/P\�\�=Ne�\�P/{X5$\�\�\��*0\Z\�\Z\0�@�P�\'��*�AAqw�\�\�\�e1�\�\�F�\\�H���\�<%�\�.�\�? \�~n>�\�8�*��(|	�D\�\Z��Nc�9\�\�\������^ý����^\�\�A\�E��^����*Uf\�X׎\�\�c�\��Y��d\�3\�\�5*RQq\�WO�����np���9h���ccM�\�g7�gy���\�}-s\�U\Zk\�\�k{GaK1Z�^z�V- Ua�Lݭ:Owj�v\�/\�7W�5x\�|�i�\�j�\�k\�d8H]\rY΍\� d�a\�o0x��	��+\�Up\�÷\�h\�\Z�\Z�f9@�!\"\0�	\0�!\0e\0qѤ�R�=C��u�\��*\�\�;\�l`j�\0w�\�8l\��sGt�\�h����7�b�\�#%��$���W;9�l!�\���&V˨@���JI�\�o\�>\�vF\�\�OE\�\�A:�+��G�\rc\\�X4O`V\�6\�_I��������?e�ʬ1uMZ��\�I�\�8(\\����\r30-oq�\�\'ws��a�\nq�\�Wߏ���:6V담�\�_Ou��\0\�:U*\��\�\����iaNV�$Lr�ɶ^Z�\�\'y��\��\n�Q��mJ1�;7�\�\�M\�r\�I<\�7*��5�\�K+훈c�������pp��5�ٞ\�h�d\�ʔ�i޴\��8\�\�\�]\�p��\�^�\�?�\�\�X\\M\���\�AХ\�����\��\�㧬y�BN2�b\�ƽ\�\���L�lv<Wk�G�\�\�t\r\Z��4u�-/<�\n\�\�I�\�\n\�\�y�v���-\�M=L�v���^�:?����\�\�\�\�\�\�>ZҼ\�d�\'PZ|��z/]\��!�0��i�\�\���WS�H�v�-\�I.?O��\�\����(𷲍\�Fp�\���\�3�\�8���p)�\�%� � N48(\�#PBV�����\���\rJ\�TEգ\"�	�V��R\�XHz�I\�=W`\�\n\r/x\�r��\0\� ���C�5ub\�U9\�k�O\�\�\��/\0\�R\�S\�U\Z@��K�����@�Xͱ��Uj��|�\��{*�\�?��\�\�\�1N|K���ӕ�G��q�iիZ��������<\�\��\"�\�A����*ns�@�Lf�{L/GC0\�!�\�w\�.>-�|�V�+eQ³%\'W8�s�\�UC\�\�\�i�ܧ�J/{����\�\�\�\Z\�:O�0�\�\�?S\�O��M<�4�\�ԁ�{ݩ]�Z�\�Dx�]lC�Y7Ӈ�\���\0\�Ʀh������� X�+��\�@\�ܼ�R<�_K.\n�\n\�\�z$�4�O���~WL��~\��\0��8oZ�w�\\�~G�lח��:��\�5W,dpZ��\��\�\rM�-�Z\�\��E�_\�VT\��7i�ݝc~��TxS��W7GiQ�\�ѳ/�ci�4Y\���\0\��ZΆ\����Ȩ4\�\���6�	�\�,~���{�v�S\�n�?\�\�\r\��$6u��wZ!���v�\"�\�\�N\�\�\�K?,�\"�W���	a$ �!>B@B\�\r<���\�A\�Bꄐ�I�\�\'\�;}?�U\�Kr!v4\'�\nb@\n�@\n�!\0	B�\�� B�\"�\�\�@Λ~�\0_�G\�o\�=������?����!38&�PP��D�B\0� �\�',2,1,550.00,1),(4,'8 roes',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( %!1!%*+...383-7(-.+\n\n\n\r\Z-%%-----------/--------------------------------------��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0@\0\0\0\0!1AQ\"aq��2��B��#Rb�\�\�r���\�\�$3Cs�\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\05\0\0\0\0\0\0\0!1AQaq�����\"�\�#\��2%3b��\�\0\0\0?\0\�L�QBZ<�\�t�\�j](s�C�\0�\nTmh\�u\Z��-	�V��<S\\Z�S\�P�\�uژ�\n4RW\�\'\�R�\�T\0\�\\��u�\r�jBj4i�8N���H��\�/�Al�\�I:P�A\�	\�1Ji���ZΕގ\'zQ�4�S�mL��!�b�T�\�i��	(\�P��\0Ԛb(B��\�ΕH�w�Q4\�N�!8���HAB[C����\�Ig�	�jJ5�&��\�B��[�y\�\�HYZi�\r@\�\'J&�\'JHN��41��!;.�)��zR����`Ԍ�Z�4��<Ӆ\�B+S�\'��B-H{У��3�	$\�6�^�i\�i�	?Z���[t�BH�Ҩ{�iP�\����JEt�\�\�)�\r0)5	�)��qΚi9���\�@;T)hWŰm�?�yT\\\�\�\�i:����;՛�{U~/�[E\'V�Q���\�q7�s\\fy�%�$�\�\�\���3n���Vgb#��\�\�\�Y�9�H\��-K|f�Al�\��h\��_\�\�>�\�+ �m]\�_ң�l�\�z�l�kg��.��z�~\�\�xw��YI���x��\Z�\�\�O���\'_m\�\�m\�XS\rh\Zڰ\�5�;cS�X\�p6\�\�\�\'\�G��W�\�\�1Ti`& �6�#Q]L+\���j\�d\�\r�w)Շ�g\�S\�V\��@��G#?�iS�]�es*\��Tsp\�\�\�,\�\"/�\�B��i=�\\�\�	}��\�W�+�ZKN�sT�\"��&҅	4씵�\"hB�F�E\\\�L\�ivt\�NPEBMH\�H�҄\"G�f��ZG��$�=<�T!M(�LP�E�zP�p\���Ѓ�:L(BJ�	΢m�\�b۶\�¨�\�\�t���miq\rh�lX\�N^\�\�\�\�*���°د��=�\0�\�u-:A \�\�;V�\�P��y0 �b5C��tp.\�S}\�_�~U���\0\�\n<�L��Y�0;sg2`z��V�\�\0E��P!d0����\�³6�\���� r��*n\�|4\�m�bӜ��T��E���2�xJ�L�p\�#	��O�ǈ�=��RFRU\�1��EPؿ\�0�W�],\�Ky�3\'\�δ|gl_�}{\�u`��X\'t���\�o!e�]�\�\� 4���fh�q1��\�B�f3\�]��eIu\Z\�v?~�\n\\��ǎ�\�=@�,s��f\�1\'\�<4\�\'e\�kY�,\Z�x}��\�w���Z�[�pk&�� � `�\�A\�=��բ\'\�\�j@eXpX\Z8jnm#2d��/\�k�\��\�*H�F���\�V�\�\�\�\�\�ְ\\;��\�t>F������,�腋¨>�yn��[\\.-.�di\�:zv����\�F=�:$C)�D�ץ\��!\���\�\�u\�Mh�[9#p�\\K��\0H�e��ۯDO3S4\�@\�W�Rv4%�\�4Ѕ\�4 s�2δ\�SI4\�I���\\\�G4�:T$�֕��\��F�\�\�\�1\�J\�R\'\�Є\�\�Ds�=�\��\�P�\�\�\�6ټ��{��\�\\F\�C���J\'\�,\�s�\�#}�\��\��\�P٢wC��#\r���x�����\�\��#A8��K7�s�\�ʯd\�	ffB	�t\�F\�>�,&k7\'�}$oo�n���|D����T\�m��\�$k�\�\�y�޳Mסu\�#{\\u\�ܴ#nZ\�b!*�\�#ea�CN�5Aqqbӛ�߈.T�f���\�8\�\�\��I!�P\�\�)�4`�H�\�/�$H\�&<\�\�M\';/U�꘧�����w\ZG[\\}3��\�{�Z2�\��\0��	\�U�\��qL00\�\�*\�\�Aӗ!\�\�,f �UI�\�\�\��mI�=6�U*ؿ�fa2\�1\�\0�S�t���\�@7�\�8SV�Z5f�\�\�q�D\�:�V\�w\�\\�?0h\�\���\0T�\�A*�xs\�\�i��\0�!fv\�7�^�\n\n\�R\�C�AXe;�G;�k�h|\�A��R ��\�2��K����{\�ߚ+��R2�tr[\�\Z\�\��\0*\�߆p\�6\�\�b�\�\�M\��b�M%W4D\�=+\Z��.\����z���Z9�g& \�W��(\�R�]!A\� ������$+q/�kW;yw��ѿ o^�\�U��$��S���\�\�\�<��\�S�\�Ҫ8� 3�� �B�@\�I\�֦�b��3����c\�MA���\��v���#c>�`G�\�\�\�\\s\�}\�{�v35�nuRt�\��F=�\r\��\�\��\���\��G�[p\\Oeu5��t��{o\�V\�yeRO�\�\�p\��n��w�\�H�^�4P�DL�\�\0�RQOp��G���\�LƁ�J\�e�\nb\�P1��:z�8�B �w�{m\�mR\��f�K��cLH�#�\0��l΄giN����6\�]p\�Yy��$�����\�\�k\�\�mDy\�?�W�\��ւ:��]W�B�C[` ��\nF�\�`�&��\�يvG陝\�\�H\�o䭸Z��rw\��s��\�\��C�w\�S��\���.CX�a\�m�&Fӱ\�?\n�Z\�\�\�\�e�\�\�#\�Fm\�!\�|Y���\�\�4\��\�\�yt�\�+~���4���\0X {@��kv�@�\"z��g�\�ZVC\r�6\���i\0�D��h�.�|9&�~q�|��	\0�s�\�\�b3{\��\���Hn�5�PBΠD7} wu\�3����E�\�G\�ܐ\�\0p�=�oj��Gi\'�̦M������N��W­0�\�nE\�aє��\�ǈ\��\�Sc����W(��\�\�5�Y�1\�\�\�\�قdL.�\�\�\�F�i�|Qpp[\�\0,�\�`�:�\�\�0v�Y�����L�mI˙�:��M�\�QW�Y�{YF\�\�y»\�_\"\�AqWA��\"����e\�ߍi\�>�	h\'O{i��*g\�a�h�\�d@!\�\�˘�bF�:B惼i:NǱ+e�����b\�O��\�\�Ud\��Am�M\�\�<cב\\ec�\0b�B�_%\�Ĩ|\�@T��\'H�\�\�U�f\�\�ηU�˖��$��i\Z\0\�\�:\�u\n�)�uS�\�����\0�\'\��-(ʈ\�;\�\�%N���ن��\�I)��� �:�\�\�pv6\��\�,\�.^\�-\�Į̑.\�`u;\�gu��`	s\�\�_-A�r�azl.9�pݠ%\�3{\�ө�_�\�o�j\�4\�\�����W�\"&k�\�g�#ٙ�yG̅D5���6��;I]3�$D^c���%z7\���Kg�;��v�e��=\�3�u�VC�-\�\Z��+S �\�\�vf�7�\�\�\�4i2<on\�ӪT�\n���XTl�id�HЄ1��LV��	(�t�\\���J���9�3>A(MF\\��B\�x����\��OwN\�\��0=h�@�\Z�7�\�\�܆\���t\0~�\�8�/\�ovA\�\\h\�FT0Z\�`&k\�t�|c��fY��ԝI�5��k\�JB\\��.*��3����ܐ��j\�㰮`2I&?�\�1tjv�&��/Ѻ��\��YO�e�D\"J�˞\Ze�r\�\�w\��\�\�\�R�m��r-8bd�F#S�b>�]>3�7\�\�R��\�v.U@.)@X8\�@a�\�\�\�k\�q�{��q\�Kg\\�\�5)q���TB���ڍ25^[�u?�\�\�����i!\r�s/z!U\�I&IC��p�\�D�l�\"v�GG�����T,@\�\�Y�~�\�\�C^���(\�\�d\�\�6^Ɵe6�\�\�\\\�(��`�\0\�s�^$jι\\\0)@\�B4\0\rcҭmaa�+�W�\�mv�CsCӀb\��\�/�1\�ګ)\����\\<e \�\�G>{\�:�7Ǯ^­���\�72����Z\�d6�\0����	�fA>+�İ8�L��G��I�i\�D\�nL\rF�Uw�8\�w^�\Z\�Z!�H.���\�2.�H\�\ZT�\�/�fՠ\��3qs\"ݶ\�;)m��7!©\�\�X��mv}�w{.G+\�\�ՙ[A\0\�u\�#R�vx�6�8��.��C渲\�	f]�B�1�H\�\�U\�\��\�Uvf�L��\�\�$Lo\�s�Yv�\�v�\0\�Ȭ��6�2�w.��\�Em��p`\��򥅲�-[��Fe̍�%\�Z[�\�Y�1+�\ZS\�\�v\�õ\�*���o�(�d���ͅ\�\�m�\�R�nM\�C��\0�\��!�\r� �$\�qk�|��ZqDK\�-\��\�\�&3�va�\�L\�\�F�?1�����v��b�����r��c\�>U\�ǘ\\�v�	qT:\�vcpk��\�4׺$�8\�¶W.V\�;��H@\0�1;L2�ґ\r⧇�De\�\�KXzX\�\�\�n�Cn\�\�\n\�TYIPI>Z���vX�[՟n-\�A��c��0A$��\�Y��v\�XB��`]5\r��\�m�\�+�\�\�\0����^.�\��b~��I�X\�\�1\�5t\�#ƴR�\�\'èV�\�:v\��V��\��)\��p\�\�WN��t\ZT+�\"ޓR5u*4�8jf\�\���xg���\�CV�rF��3ʴ�3\�\'�\r��jO\�W�\��?\�`��\�y�\�׽X�J�\�f�\\U.jUҡ%h�B\����iQ\�rt�кXW\'�v\�\��p � �R|$\n�\��7F�\�\"lSk\�\�\�\\w�\���n�4.�:i��x\��ջ8\\\Z8U�E\�w\��Ʀ9WGļ\"\�e��w�����O�Qb�h&[3,��m\�n��Ϣ\�e\��_\�k�!��N�h�\�X=Ҩ1x�\�\�܁%W/]D>�֪\�م[���H\�\0\r=\�k\�E[�\�!��J�4\�7�Y�\"ʋ���KR\r�	7����\�\0\�\�Ѵ\\L���{B�\�VPz<~�\�k>\�\�-\�d��S6��ی��]z�\0Y�;�G�\�9f\0 \�:�O�\r�h8�\�\�k>���%\�\�@����Vߤ�W�s�z-{�F\�\�|\�\�\��\�#��#1�\��W\'\�)�Z\��>!�P	\Z�\�d�D�*Φ�:!\Zfn�Y\�9{��\n�wss&���.\�EV\rsI\�L2\�A��]zi�ԝ�Ұ\�1#\r�x��\0\�6\�X\�L��S\��\�\�s\n�2�\�V�\�#Y>5>=M�`)C�\n�\�4�cMy\�X\�À�\�-1Vk�+IvD��@ܞm�T�l��L�\�L��,\rIi��F\�D\�\�B���i鑠t�\�^\�8�`Y-\�g\��\�UW/.F< ՞G}�Mu\�.�\�ןH1W�p\�m]K\�P�DʂIЍ9s8{3��6h\�3�2Z<\"�sD*���g\0\�>gM����\��UkWo1$\�m\"�9\��a��=5Ҡ\�\�وR�\ZT���^+�{l+��Qnۇ�\�\rd:\�aa�o?۫��\�n\\\�ƶ\���s,Z	|\�X����o���\��\�\�q+����f\�<���t\�z��\�6T#\�pg\�L\�P�\�n[\���j\�.�A\�b�H2 \"\��Q�Y\�0ݘ\�:��\�F?��E͍W�\�\���\�<#\ne-]\'������j\�\�\�f�O�H���b�C�lH\�5��Y�ˉi�N\�+�\�ʚ�H\��\�v������rh�^e�X�\"EN�V$Q��R�U�\�vp�e�\�3�\�Vēʳ��+Z8��7\"��]\"�\��29�\0d[\�z{){*T�\0\�Jz�q\��F�=�޹\Z\�]�3tr4лE�hN�\\���m֒k�3(\�Q�e8�\�\�S*혓>:\�\�Wݰ\�b~5�E\�\�hPA\�$Ǿ՛���\�\�E\�\�\�-|�.��{��Q��\�=��\�U�\�\�RA|�pT�|\�\�\�Q�?\�\r�\��\�\�~�\�\�O\n\�]\�Z��R|���\�I���:+S\�\�\�\�;�\�\�,_\n\���\�tS�j<\rhWd�\�r\�5��9�?.��\�6F|���\�tm|�n\"5>+�Ӯ`hx\�*R/�b\�\\s�&t\��S\�5e\\��\�:H\'\\����\�b|)�����Ģ�\�\�\0Ȗ`F�4�9DW\�,�\�W�u=�D2=wqDnA\�BWq\�0\�a\�J2��\\\ZMg�1�k\�\�\�j���|3RۧhB\\\r�T��\�Y$kȯCwpy\�#8kzlOy\n\��\�A�}w �\�\�ʷ8R\"g(\�>��޶\\,\0\"H\\\�:Ɋ�iq��]<cps��\�n��h���V�\�\n��v����\�]�\Zʪ\�^�����aX[l\� �\�2\�\�`\Z[�Ϻ45\��\�&.\�-�؆��\0�\�e\�*�H-��<>\�e��kh�ܽ\�\�)�[T�\�)������#T\��0\��\�$Y\�$N�/~���\0�\�\�.\�KWm�\�͵e\n�`ݻ9��{M\�\�\Z\�(0��\�\�ܭ��\�PD-�\�l��\�T\��׋{�\�\�&8kjH��!\�\�h���\Z�t5.\n\�\�\�\�ۻr\�:@�I�o\n�ٽ�{)\�xk�76\�O�}���b\�\�\�n\0�ad/\�$B��	\��\�/\�|ϕR[%��f�1���֗\0�4?zTM\��ci�\�\nX�c�:B��;�d{\�p>\�\�R\��Q{\��7\'���O��峉mB�G\�Mo�i�Y\�<Ug\�ONC�:�+\�U��\�\�+�\��\�+���\0o*\�=ͣ}4 \�5�ґK��\����;,\�\�[��\�&�h��\�B�]�?\�\\X\�\"\�a�GU��i��\�<����Wu\���\n�\�8�\\�m\�\�4�����෷@�$\��s��_��t6\�����U�R���]\�\�|=k�\�\�\�]��\Z7�w\�X_\�mӯ�%%\\n\�\�Vm�:��Mc\�\�h5\�\�Z^)��J��d\r\�\�?\�\�&�mY`��\��=F�wwJ��w���\�-Zp\�M\n��ѧ\�A^[�u��\�\�kQ��\�xm\��O�\0\�+)�g�LȞ���\�\�#wB<Cʱ\nO;h�=.!B�˚θ��M\�\�\�mqQ�\�$$`WOy���\�k=\�0t\����s5c�\�Ȣl��\�\�*�\�hNE\0\�܁\0s\���\�EP�x\�l���c�N`\�G8�\�\�h�\"�\�\�3�\'A#���&�\�\��\�\�yi]XL-����9t\�si\�W��m��6�� \�\�cC>-F�\�a�D\�m\Z�+\Zp\�\�/\rX\�5\�A3㶇\�&�p��\�r\��8�TIMܴ�g+D�\�	k�\���Ҁ���Љ\�@\�\�A��:^c\��aM�\��r\�\�Y�\�\�8\��B.@6�\0�\�6�l���\�H�#�lʼ\�.�,xOR-�m\�\�w�7\r�\��D�D�*�I��Y?�\�m7\0\�<�1!}3yUĻ^:(��Z2:o)\�\�ad<���.Ck��\�\�Q/�ǋ�¢j�:����A\�jj����R|�x(\�}5�5�\�n!&��\�\r��ǥs]῵\Zh5���U���]�U�a8|Y�\�\�s�+��\�g|��� @\��@k�jT�����Y�\�0�c%��A�&z�jt\����n����\�K�\��\0e\�ݛ�����v-�Gد7\�s]\��OuOB6��B�\�lY{�r˙�1͘\�5>?J\�.]J��>���U��*\\.�j\�ui�Lp�mB�a\�zO�:\�ųZ��;��c�+j��zLi\�u��A:o�<֯S�\rmʫ�}3	�`��G���\�P�C�f\�\�[���x�U\�e����&&	\�IӧJ\�j���ݕ��8j�\�`\�9w13«80,\�\�Z\��ǵm����\��\�\�A���/\�sA\�ORҭ+����9\�?:\�A�\�!\�\��\0\�o�Z\'\�GOΛQ*\�ݨn\�\rH8۝<\�\�JUn\'�N\�W�8;\Z\�\��H9b�G�Ub$o^���5ǈ\�_t���6\��3v3\"f�\�1\�\�9|^;\�ϑ�\�߆-��\�5\�\'f[�\�\�-tq=�%�-�F�_��\�A��|^��H�-\�0F\�iZ�\��!>Z\�\��T�֣�\��\��\�\�g�w���.\�\�Gb�\�\��kN�\r�ʺ�pH\�@l)\Z��\�\�go⻰�ް?*\�q�yEz���5\�\�\r\�q�\�u9V\�\�6���|+�kW\�\�W\���\���\�ᵚ��,f̬\�}\rw\��\\�\���Rp\�\�mN�6\�{�˓��\�\�v\�\�W�\Z\nH�\\Ϗ���`H\��u��m6�\\,F%��\�r��\�����3�\Z\�!�:myiX{/\Z�̼�A�\�գN�\�{�\�{6�uʠ��&�V�\��\�\��S�V\Ze�&u\�\�t^|�	\Z8�#�O\�O\�\nm��3f\�D\�i#]\�:\�\�\�4�\��\0\���\"���\n��\�⣡{l=�٪N\��߰\�Ak�-�\�Y\�N\r\�\�Vx�uV�\0�m�_[�d�\���\0E��~�\\��2\�\��T�\�\�?W��Ƙ\�c�?WV\�\�\�\\<YH&I܊끸N#A�$��c@\�T�\�.q�T^��M\�xR��X>!b\�:���Oἱ��;\�\�C�z;A\�\�a\��EQL\�:Ei愂+\�u}U�\��\�\��v��Y�\�2�J\�\�\�\�=i�NUcp�-\��\��\0��\�A�\n��*G�\�\0�ոsO�Ӓ�TW\�\�m\��\�����\�S\�^��\�B�D0t:��<ȕGJ��h�\0?\�J��p\�\�\�<��y��^��ML�5�\�#�\�\�8#\�q\�)̦��\�D�GA\\�\�\��\rjAJ�q]kuz\Z��詰��\�hʟhWi==\�6Y�I0���Wu�u\����@KUU�\�\��$\�t�\�\�;\�jL�\0j��,�\0Om\�X�ED\�D�	@9\�N�ڥ\�)��~T�)�\��\0���\0&�ǝ2[>~��	\�i\�I\�I�O/*j��N����Z�♛�ӕ9<M*]����\n��|2oj�\r�����\\\�\�꾱�H���I���?�~��4\��\0��\�\�Ҥ\0r\'ވ7RI�\�D�=��`�΅�(4̾\�y�S�\�=\�(V\�\�N\�O\���\�\���\n%	���qezG��:\�_<\�3D�\�^PDQ��\����\0M1\�\�9�\��D���\\4n4�6\�f?��5s\�f_�������~US\�J�����x�\r\�O�?CJ��^f2<I�\�W\"p�ӭ����j\�`�\�~��\�!�m�$����SQ��\��\��\Zb\�ɽ�\�)J\�\�ho0�u$\����W�x\�e4�Q�t֧\�`>�\�i\"Tmj<:iE��0����SBOn6>zO�R\0��J\�ơ)�����$\�W�\�B�4��q��fcL!�)S\�x}iP��?A>�S\�SR�S�4$�\�\�֟7\�*M=b��Єt\�s$~U�O�ZY\��Q	ʘ�,�\0~<��I	G\�*JiyI��e&�$G���>\�8Q�7�	�H�\������\� ~��	9�S\�I�QHք\'n�\��\0\�;iHO��	�ЍA���r�:rdhg\�)���\�D|(Bu��M���\0\Z��B��x\�y�ȩ.iQ���I,�$G�G��P=>��\�\nL4!D�\�>\'ڞzO\�J)~t\�C\�xҢ�?sJ�J5�jF\�\�ҥBK�\�:\�\�Ε*P�\�)��T�B�6t��\0ZT���\�\�ޟ�*U$�4O�5*a	��\�s\�J�	Ҥ]�R��\'?��͏\�!J�2���H��P�|\�3\�>�R�I\"�\�~��\��\0�*T\�hZ6��R�BAF\�TO���J�\"�J�	/�\�',2,1,1050.00,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'customer'),(2,'florist'),(3,'admin');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 10:44:46
