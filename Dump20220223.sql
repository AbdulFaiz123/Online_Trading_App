CREATE DATABASE  IF NOT EXISTS `demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demo`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlogin` (
  `userid` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES ('admin@gmail.com','12345');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartId` int NOT NULL AUTO_INCREMENT,
  `ProductId` int DEFAULT NULL,
  `ProductName` varchar(50) DEFAULT NULL,
  `ProductCost` decimal(10,2) DEFAULT NULL,
  `ProductImage` varchar(100) DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CartId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (17,4,NULL,NULL,NULL,1,'yourmail@gmail.com'),(18,1,NULL,NULL,NULL,1,'yourmail@gmail.com'),(19,1,NULL,NULL,NULL,1,'yourmail@gmail.com');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  `CategoryDescription` varchar(400) NOT NULL,
  `CategoryImage` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Telecom','Airtel','unnamed.png'),(2,'Oil','Petrol Disel Etc','oil.jfif'),(3,'IT','IT industry','ITIMAGE.jpg'),(4,'AutoMobile','Cars','toyota.png'),(5,'Oil','petrol','oil.jfif');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `EmailID` varchar(50) NOT NULL,
  `FeedbackText` varchar(500) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `OrderId` int NOT NULL,
  `ProductId` int DEFAULT NULL,
  `ProductName` varchar(45) DEFAULT NULL,
  `Price` decimal(12,2) DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  `Total` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `OrderAmount` decimal(12,2) DEFAULT NULL,
  `OrderStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-02-17',NULL,0.00,'Dispatched'),(2,'2022-02-17',NULL,0.00,'Paid'),(3,'2022-02-21',NULL,0.00,'Paid'),(4,'2022-02-23',NULL,0.00,'Paid'),(5,'2022-02-23',NULL,0.00,'Paid'),(6,'2022-02-23',NULL,0.00,'Paid'),(7,'2022-02-23',NULL,0.00,'Paid'),(8,'2022-02-23',NULL,0.00,'Paid'),(9,'2022-02-23',NULL,0.00,'Paid'),(10,'2022-02-23',NULL,0.00,'Paid'),(11,'2022-02-23',NULL,0.00,'Paid'),(12,'2022-02-23',NULL,0.00,'Dispatched'),(13,'2022-02-23',NULL,0.00,'Paid'),(14,'2022-02-23',NULL,0.00,'Paid'),(15,'2022-02-23',NULL,0.00,'Paid'),(16,'2022-02-23',NULL,0.00,'Paid'),(17,'2022-02-23',NULL,0.00,'Paid'),(18,'2022-02-23',NULL,0.00,'Paid'),(19,'2022-02-23',NULL,0.00,'Paid');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) NOT NULL,
  `ProductDescription` varchar(400) NOT NULL,
  `CategoryId` int DEFAULT NULL,
  `ProductCost` decimal(10,2) NOT NULL,
  `ProductQty` int DEFAULT NULL,
  `ProductImage` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Airtel','Bharti Airtel',1,719.00,112,'download.gif'),(2,'Reliance','Reliance Jio',1,1223.00,1356,'download12.png'),(3,'ONGC','Oil Industry',2,2236.00,9863,'ONGC.png'),(4,'Indian Oil','Best Indian Oil',2,633.00,5600,'Indian Oil.jfif'),(5,'TCS','TATA INDUSTRY',3,3678.00,5036,'TCS.jfif'),(6,'Infosys','Infosys ',3,2356.00,10003,'infosys.png'),(7,'Toyota','Car Brand',4,3600.00,1236,'toyota.png'),(9,'irfan hukkire ','Sfasfd',1,456.00,458,'wallpapertip_wallpaper-komputer_115783.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `secQ` varchar(100) NOT NULL,
  `secA` varchar(50) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (2,'hardik','india','6587965427','hardik.ch14@gmail.com','admin','What is your pet name?','jon'),(3,'abdul','india','9130212903','n9164257182@gmail.com','1234','What is your city?','banglore'),(4,'sai reddy','india','9130212903','gsaireddy305@gmail.com','1234','What is your last name?','reddy'),(5,'Izharulhak Bagwan','india','9130212903','bagwanizhar63@gmail.com','1234','What is your last name?','bagwan'),(6,'ravi','india','7822266221','kumar.ravi0539@gmail.com','1234','What is your pet name?','dog');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-23 14:47:30
