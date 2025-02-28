-- MySQL dump 10.13  Distrib 5.7.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: secondshop
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `collect_table`
--

DROP TABLE IF EXISTS `collect_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collect_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `good_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect_table`
--

LOCK TABLES `collect_table` WRITE;
/*!40000 ALTER TABLE `collect_table` DISABLE KEYS */;
INSERT INTO `collect_table` VALUES (1,1,'iPhone 13',2),(2,2,'Nike T-Shirt',1);
/*!40000 ALTER TABLE `collect_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_type_table`
--

DROP TABLE IF EXISTS `first_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `first_type_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_type_table`
--

LOCK TABLES `first_type_table` WRITE;
/*!40000 ALTER TABLE `first_type_table` DISABLE KEYS */;
INSERT INTO `first_type_table` VALUES (1,'Electronics'),(2,'Clothing');
/*!40000 ALTER TABLE `first_type_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_table`
--

DROP TABLE IF EXISTS `good_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_type_id` int(11) NOT NULL,
  `second_type_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(10,2) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_table`
--

LOCK TABLES `good_table` WRITE;
/*!40000 ALTER TABLE `good_table` DISABLE KEYS */;
INSERT INTO `good_table` VALUES (1,'iPhone 13','https://example.com/iphone13.jpg',1,1,'Brand new iPhone 13','2025-02-26 07:43:16',999.99,1,1,'2025-02-26 07:43:16'),(2,'Nike T-Shirt','https://example.com/nike-tshirt.jpg',2,2,'Comfortable Nike T-Shirt','2025-02-26 07:43:16',29.99,1,2,'2025-02-26 07:43:16');
/*!40000 ALTER TABLE `good_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_table`
--

DROP TABLE IF EXISTS `image_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_table`
--

LOCK TABLES `image_table` WRITE;
/*!40000 ALTER TABLE `image_table` DISABLE KEYS */;
INSERT INTO `image_table` VALUES (1,1,'Front View','https://example.com/iphone13-front.jpg'),(2,1,'Back View','https://example.com/iphone13-back.jpg'),(3,2,'Product Image','https://example.com/nike-tshirt.jpg');
/*!40000 ALTER TABLE `image_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seller_id` int(11) NOT NULL,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `submit_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `endDate` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1,'iPhone 13','Alice',1,'Bob',2,1,999.99,'2025-02-26 16:43:16','2025-02-27 11:58:05',1),(2,'Nike T-Shirt','Bob',2,'Alice',1,2,29.99,'2025-02-26 16:43:16','2025-02-27 11:58:08',1),(3,'iPhone 13','Alice',1,'lele cheng1',4,1,0.00,'2025-02-27 11:12:40','2025-02-27 11:58:11',2),(4,'iPhone 13','Alice',1,'lele cheng1',4,1,0.00,'2025-02-27 11:12:48','2025-02-27 11:58:13',2),(5,'iPhone 13','Alice',1,'lele cheng1',4,1,0.00,'2025-02-27 18:32:42',NULL,2);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply_table`
--

DROP TABLE IF EXISTS `reply_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `from_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_table`
--

LOCK TABLES `reply_table` WRITE;
/*!40000 ALTER TABLE `reply_table` DISABLE KEYS */;
INSERT INTO `reply_table` VALUES (1,1,'Alice',1,'Bob',2,'Great product!','2025-02-26 16:43:16',1),(2,2,'Bob',2,'Alice',1,'Fast shipping, thanks!','2025-02-26 16:43:16',1),(3,1,'lele cheng1',4,'Alice',1,'12131','2025-02-27 11:12:54',0);
/*!40000 ALTER TABLE `reply_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_table`
--

DROP TABLE IF EXISTS `review_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `from_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_table`
--

LOCK TABLES `review_table` WRITE;
/*!40000 ALTER TABLE `review_table` DISABLE KEYS */;
INSERT INTO `review_table` VALUES (1,1,NULL,1,2,'Great quality, highly recommend!','2025-02-26 18:25:28',1),(2,2,NULL,2,1,'Fast delivery, thank you!','2025-02-26 18:25:28',1);
/*!40000 ALTER TABLE `review_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second_type_table`
--

DROP TABLE IF EXISTS `second_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `second_type_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `first_type_id` (`first_type_id`),
  CONSTRAINT `second_type_table_ibfk_1` FOREIGN KEY (`first_type_id`) REFERENCES `first_type_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second_type_table`
--

LOCK TABLES `second_type_table` WRITE;
/*!40000 ALTER TABLE `second_type_table` DISABLE KEYS */;
INSERT INTO `second_type_table` VALUES (1,1,'Mobile Phones'),(2,2,'T-Shirts');
/*!40000 ALTER TABLE `second_type_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `endDate` datetime DEFAULT NULL,
  `pwd_rireki_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_rireki_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_rireki_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_rireki_4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1,'Alice','1234567890','alice@example.com','hashedpassword1',NULL,'U123','/statics/image/photos/default/default.png',1,5,'female','2025-02-26 16:43:16','2025-04-01 11:49:01',NULL,NULL,NULL,NULL,'2025-02-26 11:51:10'),(2,'Bob','0987654321','bob@example.com','hashedpassword2',NULL,'U456','/statics/image/photos/default/default.png',2,5,'male','2025-02-26 16:43:16','2025-04-01 11:48:58',NULL,NULL,NULL,NULL,'2025-02-26 11:50:54'),(3,'lele cheng','15978451365','3548651@qq.com','67d40201c5ad9d3b6f6ede5248489f7c','e3586490fd3ef4c8aa3230e97dc1238f','4J1u8','/statics/image/photos/default/default.png',101,5,'男','2025-02-26 16:49:27','2025-05-28 00:00:00','e3586490fd3ef4c8aa3230e97dc1238f','43f75f8128fe1046b53257069aa8a239',NULL,NULL,'2025-02-27 16:43:36'),(4,'lele cheng1','15978451366','35486512@qq.com','dc627b580595bd4d31d1520faed20cc4','cd2f6ad6d4fbb3f9198b625f4c4f99dd','3nO5j','/statics/image/photos/default/default.png',102,4,'男','2025-02-27 11:10:10','2025-04-01 11:48:46',NULL,NULL,NULL,NULL,'2025-02-26 11:50:46');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-28 18:25:00
