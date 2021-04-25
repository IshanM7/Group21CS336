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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('Admin','AdminPass','Admin@gmail',1,1,0,0,NULL,NULL,NULL,'AdminAddress'),('Michael','MichaelPass','Michael@gmail',2,0,1,0,NULL,NULL,NULL,'MichaelAddress'),('ChangeUser','ChangePass','EndUser@gmail.com',3,0,0,1,NULL,NULL,NULL,NULL),('CustomerRep1','Rep1','CustomerRep@gmail.com',5,0,1,0,NULL,NULL,NULL,NULL),('cus','cus','cus@gmail.com',6,0,1,0,NULL,NULL,NULL,NULL),('end1','1','end@gmail.com',7,0,0,1,NULL,NULL,NULL,NULL),('end2','2','aids@gmail.com',8,0,0,1,NULL,NULL,NULL,NULL);
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
INSERT INTO `Alert` VALUES (3,2,'Someone have bidded higher than your upper limit on auction 2'),(3,3,'You won!'),(3,4,'Someone have bidded higher than your upper limit on auction 4'),(3,7,'You won!'),(8,3,'You have been outbid again'),(8,5,'You won!');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Apparel`
--

LOCK TABLES `Apparel` WRITE;
/*!40000 ALTER TABLE `Apparel` DISABLE KEYS */;
INSERT INTO `Apparel` VALUES ('F',2,'shoe','red',NULL,NULL,NULL,NULL,7),('M',3,'pant','black',NULL,NULL,31,30,NULL),('M',4,'shirt','black','long','XL',NULL,NULL,NULL),('M',5,'pant','red',NULL,NULL,34,30,NULL),('F',6,'pant','blue',NULL,NULL,29,29,NULL),('M',7,'shoe','black',NULL,NULL,NULL,NULL,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auction`
--

LOCK TABLES `Auction` WRITE;
/*!40000 ALTER TABLE `Auction` DISABLE KEYS */;
INSERT INTO `Auction` VALUES (70.00,1,50.00,'2021-04-25 11:27:05','2021-04-25 11:43:11',3,2,2,0.00,7,100,1),(70.00,5,55.00,'2021-04-25 11:27:53','2021-04-25 11:43:11',3,3,3,70.00,7,70,1),(20.00,1,9.99,'2021-04-25 11:28:26','2021-04-25 11:43:11',3,4,4,20.00,7,15,1),(45.00,1,35.00,'2021-04-25 11:29:05','2021-04-25 11:43:11',8,5,5,45.00,7,40,1),(90.00,5,60.00,'2021-04-25 11:30:08','2021-04-25 11:43:11',3,7,7,90.00,8,70,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bid`
--

LOCK TABLES `Bid` WRITE;
/*!40000 ALTER TABLE `Bid` DISABLE KEYS */;
INSERT INTO `Bid` VALUES (3,NULL,80.00,7,7,NULL),(4,NULL,90.00,3,7,NULL),(5,NULL,11.50,3,4,NULL),(6,NULL,70.00,3,2,NULL),(7,NULL,65.00,8,3,NULL),(8,NULL,45.00,8,5,NULL),(9,NULL,20.00,3,4,NULL),(10,NULL,70.00,3,3,NULL);
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
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`askID`) REFERENCES `Account` (`AccountID`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`answerID`) REFERENCES `Account` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (3,7,NULL,'auctionHelp','I have an Auction Question',NULL,0),(4,7,NULL,'auctionHelp','Auction2',NULL,0),(5,7,NULL,'auctionHelp','Auction 3',NULL,0),(6,7,NULL,'generalHelp','General 1',NULL,0),(7,7,NULL,'generalHelp','General 2',NULL,0),(8,7,NULL,'accountHelp','Account 1',NULL,0),(9,3,6,'accountHelp','CHANGE USER ACCOUNT QUESTION','Change user your question is answered',1);
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seller_Has_BankInfo`
--

DROP TABLE IF EXISTS `Seller_Has_BankInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seller_Has_BankInfo` (
  `RoutingNumber` int DEFAULT NULL,
  `BankHolderName` varchar(20) DEFAULT NULL,
  `AccountId` int NOT NULL,
  `AccountNumber` int NOT NULL,
  PRIMARY KEY (`AccountNumber`),
  KEY `fk_SellerBankInfo_Account` (`AccountId`),
  CONSTRAINT `fk_SellerBankInfo_Account` FOREIGN KEY (`AccountId`) REFERENCES `Account` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seller_Has_BankInfo`
--

LOCK TABLES `Seller_Has_BankInfo` WRITE;
/*!40000 ALTER TABLE `Seller_Has_BankInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seller_Has_BankInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 11:52:36
