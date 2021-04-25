CREATE DATABASE  IF NOT EXISTS `336Project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `336Project`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: 336Project
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `isAdmin_Staff` tinyint(1) DEFAULT '0',
  `isCustomer_Rep` tinyint(1) DEFAULT '0',
  `isEnd_User` tinyint(1) DEFAULT '0',
  `Card_num` int DEFAULT NULL,
  `CVC` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('Admin','AdminPass','Admin@gmail',1,1,0,0,NULL,NULL,NULL,'AdminAddress'),('Michael','MichaelPass','Michael@gmail',2,0,1,0,NULL,NULL,NULL,'MichaelAddress'),('CustomerRep1','Rep1','CustomerRep@gmail.com',5,0,1,0,NULL,NULL,NULL,NULL),('cus','cus','cus@gmail.com',6,0,1,0,NULL,NULL,NULL,NULL),('end1','1','end@gmail.com',7,0,0,1,NULL,NULL,'john','new address'),('end3','3','end3@gmail.com',12,0,0,1,NULL,NULL,NULL,NULL),('end2','end2','end2@gmail.com',13,0,0,1,NULL,NULL,NULL,NULL),('cus2','cus2','cus2@gmail.com',15,0,1,0,NULL,NULL,NULL,NULL),('newCus','pass','new@gmail.com',16,0,1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alert`
--

DROP TABLE IF EXISTS `Alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alert` (
  `AccountID` int NOT NULL,
  `AuctionID` int NOT NULL,
  `Alert` varchar(100) NOT NULL,
  PRIMARY KEY (`AccountID`,`AuctionID`),
  KEY `fk_Alert_Auction` (`AuctionID`),
  CONSTRAINT `fk_Alert_Account` FOREIGN KEY (`AccountID`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `fk_Alert_Auction` FOREIGN KEY (`AuctionID`) REFERENCES `Auction` (`AuctionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alert`
--

LOCK TABLES `Alert` WRITE;
/*!40000 ALTER TABLE `Alert` DISABLE KEYS */;
INSERT INTO `Alert` VALUES (12,14,'You have been outbid!'),(12,18,'You have been outbid!'),(12,19,'You have been outbid!'),(13,17,'You won!'),(13,20,'You have been outbid!');
/*!40000 ALTER TABLE `Alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alert_Request`
--

DROP TABLE IF EXISTS `Alert_Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alert_Request` (
  `Type` varchar(30) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `AlertID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `Shirt_Type` varchar(10) DEFAULT NULL,
  `Shirt_size` varchar(10) DEFAULT NULL,
  `Waist_Size` int DEFAULT NULL,
  `Length` int DEFAULT NULL,
  `Shoe_Size` int DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`AlertID`),
  KEY `fk_Alert_Request` (`AccountID`),
  CONSTRAINT `fk_Alert_Request` FOREIGN KEY (`AccountID`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alert_Request`
--

LOCK TABLES `Alert_Request` WRITE;
/*!40000 ALTER TABLE `Alert_Request` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alert_Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Apparel`
--

DROP TABLE IF EXISTS `Apparel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Apparel` (
  `Sex` varchar(1) DEFAULT NULL,
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(30) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `Shirt_Type` varchar(10) DEFAULT NULL,
  `Shirt_size` varchar(10) DEFAULT NULL,
  `Waist_Size` int DEFAULT NULL,
  `Length` int DEFAULT NULL,
  `Shoe_Size` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Apparel`
--

LOCK TABLES `Apparel` WRITE;
/*!40000 ALTER TABLE `Apparel` DISABLE KEYS */;
INSERT INTO `Apparel` VALUES ('F',2,'shoe','red',NULL,NULL,NULL,NULL,7),('M',3,'pant','black',NULL,NULL,31,30,NULL),('M',4,'shirt','black','long','XL',NULL,NULL,NULL),('M',5,'pant','red',NULL,NULL,34,30,NULL),('F',6,'pant','blue',NULL,NULL,29,29,NULL),('M',7,'shoe','black',NULL,NULL,NULL,NULL,12),('M',8,'pant','red',NULL,NULL,28,30,NULL),('M',9,'pant','green',NULL,NULL,33,33,NULL),('M',10,'shoe','pink',NULL,NULL,NULL,NULL,9),('M',11,'shoe','blue',NULL,NULL,NULL,NULL,8),('F',12,'shirt','red','short','L',NULL,NULL,NULL),('M',13,'shirt','green','tank','M',NULL,NULL,NULL),('F',14,'shoe','red',NULL,NULL,NULL,NULL,5),('F',15,'shoe','pink',NULL,NULL,NULL,NULL,11),('M',16,'shirt','blue','sweater','M',NULL,NULL,NULL),('M',17,'shoe','blue',NULL,NULL,NULL,NULL,11),('M',18,'shoe','blue',NULL,NULL,NULL,NULL,8),('M',19,'pant','black',NULL,NULL,28,29,NULL),('F',20,'pant','blue',NULL,NULL,36,33,NULL),('M',21,'shirt','black','tank','XL',NULL,NULL,NULL),('M',22,'pant','red',NULL,NULL,29,31,NULL),('M',23,'shirt','blue','long','S',NULL,NULL,NULL),('M',24,'shoe','blue',NULL,NULL,NULL,NULL,10),('F',25,'pant','blue',NULL,NULL,33,32,NULL);
/*!40000 ALTER TABLE `Apparel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Auction`
--

DROP TABLE IF EXISTS `Auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auction` (
  `CurrentBid` decimal(6,2) DEFAULT '0.00',
  `Increment` int DEFAULT NULL,
  `InitialPrice` decimal(6,2) DEFAULT NULL,
  `Start_Date` datetime DEFAULT NULL,
  `End_Date` datetime DEFAULT NULL,
  `CurrentBuyer` int DEFAULT NULL,
  `AuctionID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `WinningBid` decimal(6,2) DEFAULT NULL,
  `AccountID` int NOT NULL,
  `Reserve` int DEFAULT '0',
  `Sold` int DEFAULT '0',
  PRIMARY KEY (`AuctionID`),
  KEY `fk_Auction_BuyAccount` (`CurrentBuyer`),
  KEY `fk_Auction_Account` (`AccountID`),
  KEY `fk_Auction_Product` (`ProductID`),
  CONSTRAINT `fk_Auction_Account` FOREIGN KEY (`AccountID`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `fk_Auction_Product` FOREIGN KEY (`ProductID`) REFERENCES `Apparel` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auction`
--

LOCK TABLES `Auction` WRITE;
/*!40000 ALTER TABLE `Auction` DISABLE KEYS */;
INSERT INTO `Auction` VALUES (70.00,1,50.00,'2021-04-25 11:27:05','2021-04-25 11:43:11',3,2,2,0.00,7,100,1),(70.00,5,55.00,'2021-04-25 11:27:53','2021-04-25 11:43:11',3,3,3,70.00,7,70,1),(20.00,1,9.99,'2021-04-25 11:28:26','2021-04-25 11:43:11',3,4,4,20.00,7,15,1),(45.00,1,35.00,'2021-04-25 11:29:05','2021-04-25 11:43:11',8,5,5,45.00,7,40,1),(420.00,20,300.00,'2021-04-25 14:43:02','2021-04-25 14:59:22',7,11,11,420.00,12,350,1),(200.00,3,100.00,'2021-04-25 14:50:47','2021-04-25 14:59:22',7,14,14,200.00,13,120,1),(520.00,20,500.00,'2021-04-25 14:57:33','2021-04-25 14:59:22',7,15,15,520.00,12,510,1),(400.00,3,344.00,'2021-04-25 15:02:18','2021-04-25 15:11:10',7,16,16,400.00,13,400,1),(335.00,2,322.00,'2021-04-25 15:09:15','2021-04-25 15:11:10',13,17,17,335.00,12,330,1),(130.00,1,100.00,'2021-04-25 15:12:48','2021-05-26 11:12:12',7,18,18,NULL,13,110,0),(53.00,1,35.00,'2021-04-25 15:13:13','2021-05-26 10:11:11',7,19,19,NULL,13,40,0),(49.00,3,43.00,'2021-04-25 15:13:50','2021-05-26 12:11:11',13,20,20,NULL,12,50,0),(60.00,2,30.00,'2021-04-25 16:55:28','2021-05-26 12:12:12',7,23,23,NULL,12,40,0),(0.00,1,100.00,'2021-04-25 16:58:04','2021-05-26 11:11:11',NULL,24,24,NULL,7,120,0),(0.00,10,200.00,'2021-04-25 16:59:11','2021-05-26 11:11:11',NULL,25,25,NULL,13,230,0);
/*!40000 ALTER TABLE `Auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bid`
--

DROP TABLE IF EXISTS `Bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bid` (
  `BidID` int NOT NULL AUTO_INCREMENT,
  `Upper_Limit` decimal(6,2) DEFAULT NULL,
  `Bid_Price` decimal(6,2) DEFAULT NULL,
  `AccountID` int NOT NULL,
  `AuctionID` int NOT NULL,
  `Bidincrement` int DEFAULT NULL,
  PRIMARY KEY (`BidID`),
  KEY `fk_Bid_Auction` (`AuctionID`),
  KEY `fk_Bid_Account` (`AccountID`),
  CONSTRAINT `fk_Bid_Account` FOREIGN KEY (`AccountID`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `fk_Bid_Auction` FOREIGN KEY (`AuctionID`) REFERENCES `Auction` (`AuctionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid`
--

LOCK TABLES `Bid` WRITE;
/*!40000 ALTER TABLE `Bid` DISABLE KEYS */;
INSERT INTO `Bid` VALUES (18,NULL,350.00,7,11,NULL),(24,NULL,120.00,7,14,NULL),(25,NULL,420.00,7,11,NULL),(26,NULL,140.00,12,14,NULL),(27,NULL,520.00,7,15,NULL),(28,NULL,200.00,7,14,NULL),(29,NULL,335.00,13,17,NULL),(30,NULL,400.00,7,16,NULL),(31,NULL,120.50,12,18,NULL),(32,NULL,40.00,12,19,NULL),(33,NULL,46.00,13,20,NULL),(35,NULL,53.00,7,19,NULL),(37,NULL,130.00,7,18,NULL),(38,NULL,49.00,7,20,NULL),(41,300.00,60.00,7,23,10),(42,NULL,50.00,13,23,NULL);
/*!40000 ALTER TABLE `Bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bid_History`
--

DROP TABLE IF EXISTS `Bid_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bid_History` (
  `AuctionID` int NOT NULL,
  `BidID` int NOT NULL,
  `AccountID` int NOT NULL,
  PRIMARY KEY (`AuctionID`,`BidID`),
  KEY `fk_BidHistory_Account` (`AccountID`),
  KEY `fk_BidHistory_Bid` (`BidID`),
  CONSTRAINT `fk_BidHistory_Account` FOREIGN KEY (`AccountID`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `fk_BidHistory_Auction` FOREIGN KEY (`AuctionID`) REFERENCES `Auction` (`AuctionID`) ON DELETE CASCADE,
  CONSTRAINT `fk_BidHistory_Bid` FOREIGN KEY (`BidID`) REFERENCES `Bid` (`BidID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid_History`
--

LOCK TABLES `Bid_History` WRITE;
/*!40000 ALTER TABLE `Bid_History` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bid_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `askID` int DEFAULT NULL,
  `answerID` int DEFAULT NULL,
  `qtype` varchar(20) DEFAULT NULL,
  `qtext` varchar(200) DEFAULT NULL,
  `atext` varchar(200) DEFAULT NULL,
  `answered` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`qid`),
  KEY `askID` (`askID`),
  KEY `answerID` (`answerID`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`askID`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`answerID`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (3,7,6,'auctionHelp','I have an Auction Question','This is your answer',1),(4,7,NULL,'auctionHelp','Auction2',NULL,0),(5,7,NULL,'auctionHelp','Auction 3',NULL,0),(6,7,NULL,'generalHelp','General 1',NULL,0),(7,7,NULL,'generalHelp','General 2',NULL,0),(8,7,NULL,'accountHelp','Account 1',NULL,0),(11,7,NULL,'generalHelp','ask question (end1)',NULL,0),(12,13,6,'generalHelp','Im confused i need help','This is your solution',1),(13,13,6,'auctionHelp','I need help with auctions','Go to the auction page',1);
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 17:01:33
