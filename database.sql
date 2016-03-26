-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.21-beta-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema project
--

CREATE DATABASE IF NOT EXISTS project;
USE project;

--
-- Definition of table `bedroommaster`
--

DROP TABLE IF EXISTS `bedroommaster`;
CREATE TABLE `bedroommaster` (
  `iBedroomID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iBedroomNum` varchar(45) NOT NULL,
  `iBedroomStatus` char(1) NOT NULL,
  `sCreatedBy` varchar(50) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedBy` varchar(45) DEFAULT NULL,
  `dModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iBedroomID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bedroommaster`
--

/*!40000 ALTER TABLE `bedroommaster` DISABLE KEYS */;
INSERT INTO `bedroommaster` (`iBedroomID`,`iBedroomNum`,`iBedroomStatus`,`sCreatedBy`,`dCreatedDate`,`sModifiedBy`,`dModifiedDate`) VALUES 
 (1,'1','1','admin','2008-03-09 14:10:55',NULL,NULL),
 (2,'2','2','admin','2008-03-09 14:19:03',NULL,NULL),
 (3,'3','3','admin','2008-03-09 14:19:15',NULL,NULL),
 (4,'4','4','admin','2008-03-09 14:20:12',NULL,NULL),
 (5,'5','5','admin','2008-03-09 14:20:19',NULL,NULL),
 (6,'6','6','admin','2008-03-09 14:20:58',NULL,NULL),
 (7,'7','7','admin','2008-03-09 14:21:08',NULL,NULL),
 (8,'8','8','admin','2008-03-09 14:21:14',NULL,NULL),
 (9,'9','9','admin','2008-03-09 14:21:20',NULL,NULL);
/*!40000 ALTER TABLE `bedroommaster` ENABLE KEYS */;


--
-- Definition of table `budgetmaster`
--

DROP TABLE IF EXISTS `budgetmaster`;
CREATE TABLE `budgetmaster` (
  `iBudgetID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sBudgetName` varchar(50) NOT NULL,
  `iMinBudget` int(10) unsigned NOT NULL,
  `iMaxBudget` int(10) unsigned NOT NULL,
  `sCreatedBy` varchar(45) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedBy` varchar(45) DEFAULT NULL,
  `dModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iBudgetID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `budgetmaster`
--

/*!40000 ALTER TABLE `budgetmaster` DISABLE KEYS */;
INSERT INTO `budgetmaster` (`iBudgetID`,`sBudgetName`,`iMinBudget`,`iMaxBudget`,`sCreatedBy`,`dCreatedDate`,`sModifiedBy`,`dModifiedDate`) VALUES 
 (1,'Below 10 Millions',0,1000000,'admin','2008-08-30 22:09:53',NULL,NULL);
/*!40000 ALTER TABLE `budgetmaster` ENABLE KEYS */;


--
-- Definition of table `citymaster`
--

DROP TABLE IF EXISTS `citymaster`;
CREATE TABLE `citymaster` (
  `iCityID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iCityName` varchar(100) NOT NULL,
  `sCreatedBy` varchar(50) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedBy` varchar(45) DEFAULT NULL,
  `dModifiedDate` datetime DEFAULT NULL,
  `sStatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`iCityID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citymaster`
--

/*!40000 ALTER TABLE `citymaster` DISABLE KEYS */;
INSERT INTO `citymaster` (`iCityID`,`iCityName`,`sCreatedBy`,`dCreatedDate`,`sModifiedBy`,`dModifiedDate`,`sStatus`) VALUES 
 (1,'Johor',NULL,NULL,NULL,NULL,NULL),
 (2,'Kedah',NULL,NULL,'null','2008-08-16 15:32:20',NULL),
 (3,'Kelantan',NULL,NULL,NULL,NULL,NULL),
 (4,'Melaka',NULL,NULL,NULL,NULL,NULL),
 (5,'Negeri Sembilan',NULL,NULL,NULL,NULL,NULL),
 (6,'Pahang',NULL,NULL,NULL,NULL,NULL),
 (7,'Perak',NULL,NULL,NULL,NULL,NULL),
 (8,'Perlis',NULL,NULL,NULL,NULL,NULL),
 (9,'Pulau Pinang',NULL,NULL,NULL,NULL,NULL),
 (10,'Sabah',NULL,NULL,NULL,NULL,NULL),
 (11,'Sarawak',NULL,NULL,NULL,NULL,NULL),
 (12,'Selangor',NULL,NULL,NULL,NULL,NULL),
 (13,'Terengganu',NULL,NULL,NULL,NULL,NULL),
 (14,'Wilayah Persekutuan Labuan',NULL,NULL,NULL,NULL,NULL),
 (15,'Wilayah Persekutuan Putrajaya',NULL,NULL,NULL,NULL,NULL),
 (16,'Wilayah Persekutuan Kuala Lumpur',NULL,NULL,NULL,NULL,NULL),
 (17,'banglore1','admin','2008-08-24 22:26:00','admin','2008-08-24 22:27:02',NULL);
/*!40000 ALTER TABLE `citymaster` ENABLE KEYS */;


--
-- Definition of table `contact_detail`
--

DROP TABLE IF EXISTS `contact_detail`;
CREATE TABLE `contact_detail` (
  `sUserID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sMobileNumber` varchar(45) NOT NULL,
  `sLandlineNumber` varchar(45) NOT NULL,
  `sCreatedBy` varchar(45) NOT NULL,
  `dCreatedDate` datetime NOT NULL,
  `sModifiedBy` varchar(45) NOT NULL,
  `dModofiedDate` datetime NOT NULL,
  PRIMARY KEY (`sUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_detail`
--

/*!40000 ALTER TABLE `contact_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_detail` ENABLE KEYS */;


--
-- Definition of table `countrymaster`
--

DROP TABLE IF EXISTS `countrymaster`;
CREATE TABLE `countrymaster` (
  `iCountryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sCountryName` varchar(70) NOT NULL DEFAULT '',
  `sStatus` char(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`iCountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countrymaster`
--

/*!40000 ALTER TABLE `countrymaster` DISABLE KEYS */;
INSERT INTO `countrymaster` (`iCountryID`,`sCountryName`,`sStatus`) VALUES 
 (1,'india','A'),
 (2,'USA','A');
/*!40000 ALTER TABLE `countrymaster` ENABLE KEYS */;


--
-- Definition of table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `iCurrencyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sCurrencyName` varchar(45) NOT NULL,
  `sSymbol` varchar(45) NOT NULL,
  `sStatus` char(1) NOT NULL,
  PRIMARY KEY (`iCurrencyID`),
  UNIQUE KEY `sCurrencyName` (`sCurrencyName`),
  UNIQUE KEY `sSymbol` (`sSymbol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` (`iCurrencyID`,`sCurrencyName`,`sSymbol`,`sStatus`) VALUES 
 (1,'Dollar','USD','A');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;


--
-- Definition of table `forget_password`
--

DROP TABLE IF EXISTS `forget_password`;
CREATE TABLE `forget_password` (
  `iForgetID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sUserID` varchar(45) DEFAULT NULL,
  `sEmailID` varchar(45) DEFAULT NULL,
  `sStatus` char(1) DEFAULT NULL,
  `sRandPwd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iForgetID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forget_password`
--

/*!40000 ALTER TABLE `forget_password` DISABLE KEYS */;
INSERT INTO `forget_password` (`iForgetID`,`sUserID`,`sEmailID`,`sStatus`,`sRandPwd`) VALUES 
 (1,NULL,'admin@admin.com','P','234281140896906536');
/*!40000 ALTER TABLE `forget_password` ENABLE KEYS */;


--
-- Definition of table `house`
--

DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `iHouseID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sHouseName` varchar(100) NOT NULL,
  `sHouseType` varchar(100) NOT NULL,
  `dHousePrice` double NOT NULL,
  `sHouseLocation` varchar(250) NOT NULL,
  `iQuantityRoom` int(10) unsigned NOT NULL,
  `sDescription` varchar(350) NOT NULL,
  `sCreatedBy` varchar(45) NOT NULL,
  `dCreatedDate` datetime NOT NULL,
  `sModifiedBy` varchar(45) NOT NULL,
  `dModifiedDate` datetime NOT NULL,
  PRIMARY KEY (`iHouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

/*!40000 ALTER TABLE `house` DISABLE KEYS */;
/*!40000 ALTER TABLE `house` ENABLE KEYS */;


--
-- Definition of table `list_approval`
--

DROP TABLE IF EXISTS `list_approval`;
CREATE TABLE `list_approval` (
  `iLAppID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cIsApprovalNeed` char(1) NOT NULL,
  `cIsImageApprovalNeed` char(1) NOT NULL,
  PRIMARY KEY (`iLAppID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_approval`
--

/*!40000 ALTER TABLE `list_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_approval` ENABLE KEYS */;


--
-- Definition of table `list_requirement`
--

DROP TABLE IF EXISTS `list_requirement`;
CREATE TABLE `list_requirement` (
  `iListID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sUserID` varchar(45) DEFAULT NULL,
  `iTransactionType` int(10) unsigned DEFAULT NULL,
  `iPropertyID` int(10) unsigned DEFAULT NULL,
  `sPropertyAddress` varchar(200) DEFAULT NULL,
  `iCityID` varchar(5) DEFAULT NULL,
  `iLocalityID` varchar(5) DEFAULT NULL,
  `iArea` int(10) unsigned DEFAULT NULL,
  `iTotalPrice` int(10) unsigned DEFAULT NULL,
  `iBedRoom` int(10) unsigned DEFAULT NULL,
  `iNFloor` int(10) unsigned DEFAULT NULL,
  `cPriceNegotiable` char(1) DEFAULT NULL,
  `cStatus` char(1) DEFAULT NULL,
  `sCreatedBy` varchar(45) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedBy` varchar(45) DEFAULT NULL,
  `dModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iListID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_requirement`
--

/*!40000 ALTER TABLE `list_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_requirement` ENABLE KEYS */;


--
-- Definition of table `locationmaster`
--

DROP TABLE IF EXISTS `locationmaster`;
CREATE TABLE `locationmaster` (
  `iLocationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iLocationName` varchar(200) NOT NULL,
  `iCityID` int(10) unsigned DEFAULT NULL,
  `iLocationStatus` char(5) DEFAULT NULL,
  `sCreatedBy` varchar(50) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedby` varchar(45) DEFAULT NULL,
  `dModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iLocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locationmaster`
--

/*!40000 ALTER TABLE `locationmaster` DISABLE KEYS */;
INSERT INTO `locationmaster` (`iLocationID`,`iLocationName`,`iCityID`,`iLocationStatus`,`sCreatedBy`,`dCreatedDate`,`sModifiedby`,`dModifiedDate`) VALUES 
 (1,'Johor',8,NULL,NULL,NULL,'admin','2008-08-16 16:16:24'),
 (2,'Batu Pahat',13,NULL,NULL,NULL,'admin','2008-08-16 16:16:55'),
 (3,'Johor Bahru',12,NULL,NULL,NULL,'admin','2008-08-16 16:17:09'),
 (4,'Kluang',13,NULL,NULL,NULL,'admin','2008-08-16 16:17:54'),
 (5,'Kota Tinggi',4,NULL,NULL,NULL,'admin','2008-08-16 16:17:25'),
 (6,'Mersing',NULL,NULL,NULL,NULL,NULL,NULL),
 (7,'Muar',NULL,NULL,NULL,NULL,NULL,NULL),
 (8,'Pontian',NULL,NULL,NULL,NULL,NULL,NULL),
 (9,'Segamat',NULL,NULL,NULL,NULL,NULL,NULL),
 (10,'Kedah',NULL,NULL,NULL,NULL,NULL,NULL),
 (11,'Baling',NULL,NULL,NULL,NULL,NULL,NULL),
 (12,'Bandar Bharu',NULL,NULL,NULL,NULL,NULL,NULL),
 (13,'Kota Setar',NULL,NULL,NULL,NULL,NULL,NULL),
 (14,'Kuala Muda',NULL,NULL,NULL,NULL,NULL,NULL),
 (15,'Kubang Pasu',NULL,NULL,NULL,NULL,NULL,NULL),
 (16,'Kulim',NULL,NULL,NULL,NULL,NULL,NULL),
 (17,'Langkawi',NULL,NULL,NULL,NULL,NULL,NULL),
 (18,'Padang Terap',NULL,NULL,NULL,NULL,NULL,NULL),
 (19,'Pendang',NULL,NULL,NULL,NULL,NULL,NULL),
 (20,'Sik',NULL,NULL,NULL,NULL,NULL,NULL),
 (21,'Yan',NULL,NULL,NULL,NULL,NULL,NULL),
 (22,'Kelantan',NULL,NULL,NULL,NULL,NULL,NULL),
 (23,'Bachok',NULL,NULL,NULL,NULL,NULL,NULL),
 (24,'Jeli',NULL,NULL,NULL,NULL,NULL,NULL),
 (25,'Gua Musang',NULL,NULL,NULL,NULL,NULL,NULL),
 (26,'Kota Bharu',NULL,NULL,NULL,NULL,NULL,NULL),
 (27,'Kuala Krai',NULL,NULL,NULL,NULL,NULL,NULL),
 (28,'Machang',NULL,NULL,NULL,NULL,NULL,NULL),
 (29,'Pasir Mas',NULL,NULL,NULL,NULL,NULL,NULL),
 (30,'Pasir Putih',NULL,NULL,NULL,NULL,NULL,NULL),
 (31,'Tanah Merah',NULL,NULL,NULL,NULL,NULL,NULL),
 (32,'Tumpat',NULL,NULL,NULL,NULL,NULL,NULL),
 (33,'Melaka',NULL,NULL,NULL,NULL,NULL,NULL),
 (34,'Alor Gajah',NULL,NULL,NULL,NULL,NULL,NULL),
 (35,'Bandar Melaka',NULL,NULL,NULL,NULL,NULL,NULL),
 (36,'Jasin',NULL,NULL,NULL,NULL,NULL,NULL),
 (37,'Negeri Sembilan',NULL,NULL,NULL,NULL,NULL,NULL),
 (38,'Seremban',NULL,NULL,NULL,NULL,NULL,NULL),
 (39,'Tampin',NULL,NULL,NULL,NULL,NULL,NULL),
 (40,'Jelebu',NULL,NULL,NULL,NULL,NULL,NULL),
 (41,'Port Dickson',NULL,NULL,NULL,NULL,NULL,NULL),
 (42,'Kuala Pilah',NULL,NULL,NULL,NULL,NULL,NULL),
 (43,'Pahang ',NULL,NULL,NULL,NULL,NULL,NULL),
 (44,'Pekan ',NULL,NULL,NULL,NULL,NULL,NULL),
 (45,'Rompin ',NULL,NULL,NULL,NULL,NULL,NULL),
 (46,'Maran ',NULL,NULL,NULL,NULL,NULL,NULL),
 (47,'Temerloh ',NULL,NULL,NULL,NULL,NULL,NULL),
 (48,'Jerantut ',NULL,NULL,NULL,NULL,NULL,NULL),
 (49,'Bentong ',NULL,NULL,NULL,NULL,NULL,NULL),
 (50,'Raub ',NULL,NULL,NULL,NULL,NULL,NULL),
 (51,'Lipis ',NULL,NULL,NULL,NULL,NULL,NULL),
 (52,'Cameron Highlands',NULL,NULL,NULL,NULL,NULL,NULL),
 (53,'Bera',NULL,NULL,NULL,NULL,NULL,NULL),
 (54,'Perak',NULL,NULL,NULL,NULL,NULL,NULL),
 (55,'Batang Padang',NULL,NULL,NULL,NULL,NULL,NULL),
 (56,'Hilir Perak',NULL,NULL,NULL,NULL,NULL,NULL),
 (57,'Manjung',NULL,NULL,NULL,NULL,NULL,NULL),
 (58,'Perak Tengah',NULL,NULL,NULL,NULL,NULL,NULL),
 (59,'Kinta',NULL,NULL,NULL,NULL,NULL,NULL),
 (60,'Kuala Kangsar',NULL,NULL,NULL,NULL,NULL,NULL),
 (61,'Larut',NULL,NULL,NULL,NULL,NULL,NULL),
 (62,'Matang and Selama',NULL,NULL,NULL,NULL,NULL,NULL),
 (63,'Hulu Perak',NULL,NULL,NULL,NULL,NULL,NULL),
 (64,'Perlis',NULL,NULL,NULL,NULL,NULL,NULL),
 (65,'Kangar',NULL,NULL,NULL,NULL,NULL,NULL),
 (66,'Arau',NULL,NULL,NULL,NULL,NULL,NULL),
 (67,'Padang Besar',NULL,NULL,NULL,NULL,NULL,NULL),
 (68,'Pulau Pinang ',NULL,NULL,NULL,NULL,NULL,NULL),
 (69,'Barat Daya',NULL,NULL,NULL,NULL,NULL,NULL),
 (70,'Seberang Perai Selatan',NULL,NULL,NULL,NULL,NULL,NULL),
 (71,'Seberang Perai Tengah',NULL,NULL,NULL,NULL,NULL,NULL),
 (72,'Seberang Perai Utara',NULL,NULL,NULL,NULL,NULL,NULL),
 (73,'Timur Laut',NULL,NULL,NULL,NULL,NULL,NULL),
 (74,'Sabah ',NULL,NULL,NULL,NULL,NULL,NULL),
 (75,'Kota Kinabalu',NULL,NULL,NULL,NULL,NULL,NULL),
 (76,'Keningau',NULL,NULL,NULL,NULL,NULL,NULL),
 (77,'Papan',NULL,NULL,NULL,NULL,NULL,NULL),
 (78,'Sipitang',NULL,NULL,NULL,NULL,NULL,NULL),
 (79,'Tuaran',NULL,NULL,NULL,NULL,NULL,NULL),
 (80,'Penampang',NULL,NULL,NULL,NULL,NULL,NULL),
 (81,'Lahad Datu',NULL,NULL,NULL,NULL,NULL,NULL),
 (82,'Sandakan',NULL,NULL,NULL,NULL,NULL,NULL),
 (83,'Tawau',NULL,NULL,NULL,NULL,NULL,NULL),
 (84,'Sarawak ',NULL,NULL,NULL,NULL,NULL,NULL),
 (85,'Kuching',NULL,NULL,NULL,NULL,NULL,NULL),
 (86,'Kota Samarahan',NULL,NULL,NULL,NULL,NULL,NULL),
 (87,'Sri Aman',NULL,NULL,NULL,NULL,NULL,NULL),
 (88,'Sarikei',NULL,NULL,NULL,NULL,NULL,NULL),
 (89,'Sibu',NULL,NULL,NULL,NULL,NULL,NULL),
 (90,'Bintulu',NULL,NULL,NULL,NULL,NULL,NULL),
 (91,'Kapit',NULL,NULL,NULL,NULL,NULL,NULL),
 (92,'Miri',NULL,NULL,NULL,NULL,NULL,NULL),
 (93,'Limbang',NULL,NULL,NULL,NULL,NULL,NULL),
 (94,'Selangor ',NULL,NULL,NULL,NULL,NULL,NULL),
 (95,'Gombak',NULL,NULL,NULL,NULL,NULL,NULL),
 (96,'Ulu Langat',NULL,NULL,NULL,NULL,NULL,NULL),
 (97,'Hulu Selangor',NULL,NULL,NULL,NULL,NULL,NULL),
 (98,'Klang',NULL,NULL,NULL,NULL,NULL,NULL),
 (99,'Kuala Langat',NULL,NULL,NULL,NULL,NULL,NULL),
 (100,'Kuala Selangor',NULL,NULL,NULL,NULL,NULL,NULL),
 (101,'Sabak Bernam',NULL,NULL,NULL,NULL,NULL,NULL),
 (102,'Sepang',NULL,NULL,NULL,NULL,NULL,NULL),
 (103,'Petaling',NULL,NULL,NULL,NULL,NULL,NULL),
 (104,'Terengganu ',NULL,NULL,NULL,NULL,NULL,NULL),
 (105,'Besut',NULL,NULL,NULL,NULL,NULL,NULL),
 (106,'Dungun',NULL,NULL,NULL,NULL,NULL,NULL),
 (107,'Hulu Terengganu',NULL,NULL,NULL,NULL,NULL,NULL),
 (108,'Kemaman',NULL,NULL,NULL,NULL,NULL,NULL),
 (109,'Kuala Terengganu',NULL,NULL,NULL,NULL,NULL,NULL),
 (110,'Marang',NULL,NULL,NULL,NULL,NULL,NULL),
 (111,'Setiu',NULL,NULL,NULL,NULL,NULL,NULL),
 (112,'Wilayah Persekutuan',NULL,NULL,NULL,NULL,NULL,NULL),
 (113,'Wilayah Persekutuan center',NULL,NULL,NULL,NULL,NULL,NULL),
 (114,'Wilayah Persekutuan Labuan',NULL,NULL,NULL,NULL,NULL,NULL),
 (115,'Wilayah Persekutuan Kuala Lumpur',NULL,NULL,NULL,NULL,NULL,NULL),
 (116,'Wilayah Persekutuan Putrajaya',NULL,NULL,NULL,NULL,NULL,NULL),
 (117,'aa',4,'A','admin','2008-03-13 21:53:24',NULL,NULL),
 (118,'banga',17,'A','admin','2008-08-24 22:27:31','admin','2008-08-24 22:28:06');
/*!40000 ALTER TABLE `locationmaster` ENABLE KEYS */;


--
-- Definition of table `post_approval`
--

DROP TABLE IF EXISTS `post_approval`;
CREATE TABLE `post_approval` (
  `iPAppID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cIsApprovalNeed` char(1) NOT NULL,
  PRIMARY KEY (`iPAppID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_approval`
--

/*!40000 ALTER TABLE `post_approval` DISABLE KEYS */;
INSERT INTO `post_approval` (`iPAppID`,`cIsApprovalNeed`) VALUES 
 (1,'A');
/*!40000 ALTER TABLE `post_approval` ENABLE KEYS */;


--
-- Definition of table `post_requirement`
--

DROP TABLE IF EXISTS `post_requirement`;
CREATE TABLE `post_requirement` (
  `iPostID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sUserID` varchar(45) DEFAULT NULL,
  `iTransactionType` int(10) unsigned NOT NULL,
  `iPropertyID` int(10) unsigned NOT NULL,
  `iCityID` int(10) unsigned NOT NULL,
  `iLocalityID` int(10) unsigned NOT NULL,
  `iArea` int(10) unsigned NOT NULL,
  `iBudgetID` int(10) unsigned NOT NULL,
  `iBedroom` int(10) unsigned DEFAULT NULL,
  `cStatus` char(1) NOT NULL,
  `sCreatedBy` varchar(45) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedBy` varchar(45) DEFAULT NULL,
  `dModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iPostID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_requirement`
--

/*!40000 ALTER TABLE `post_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_requirement` ENABLE KEYS */;


--
-- Definition of table `propertymaster`
--

DROP TABLE IF EXISTS `propertymaster`;
CREATE TABLE `propertymaster` (
  `iPropertyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sPropertyName` varchar(70) NOT NULL,
  `iTotalPrice` int(10) unsigned DEFAULT NULL,
  `sCreatedBy` varchar(45) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedBy` varchar(45) DEFAULT NULL,
  `dModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iPropertyID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `propertymaster`
--

/*!40000 ALTER TABLE `propertymaster` DISABLE KEYS */;
INSERT INTO `propertymaster` (`iPropertyID`,`sPropertyName`,`iTotalPrice`,`sCreatedBy`,`dCreatedDate`,`sModifiedBy`,`dModifiedDate`) VALUES 
 (1,'Residential Property',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (2,'Apartment',0,'','0000-00-00 00:00:00','me','2008-03-13 20:41:47'),
 (3,'Terrace',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (4,'Bungalow',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (5,'Service/Studio Apartment',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (6,'Commercial Property',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (7,'Land',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (8,'Office',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (9,'Business Centre',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (10,'Warehouse/Godown',0,'','0000-00-00 00:00:00','','0000-00-00 00:00:00'),
 (11,'Shop/office',0,'','0000-00-00 00:00:00','sumit','2008-08-16 13:03:35'),
 (12,'farm',NULL,'admin','2008-08-24 22:31:11','admin','2008-08-30 15:07:04');
/*!40000 ALTER TABLE `propertymaster` ENABLE KEYS */;


--
-- Definition of table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `sUserID` varchar(45) NOT NULL,
  `sRegEmail` varchar(250) NOT NULL,
  `sFirstName` varchar(45) NOT NULL,
  `sLastName` varchar(45) NOT NULL,
  `iDateBirth` datetime NOT NULL,
  `sRegGender` varchar(45) NOT NULL,
  `iCountryID` int(10) unsigned NOT NULL,
  `iCityID` varchar(45) NOT NULL,
  `iLocation` varchar(45) NOT NULL,
  `iUserType` varchar(45) DEFAULT NULL,
  `iUserLevel` varchar(45) DEFAULT NULL,
  `sPassword` varchar(45) NOT NULL,
  `sForgetPassword` varchar(45) DEFAULT NULL,
  `iUserContact` bigint(20) unsigned NOT NULL,
  `sCreatedBy` varchar(45) DEFAULT NULL,
  `dCreatedDate` datetime DEFAULT NULL,
  `sModifiedBy` varchar(45) DEFAULT NULL,
  `sModifiedDate` datetime DEFAULT NULL,
  `sStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`sUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`sUserID`,`sRegEmail`,`sFirstName`,`sLastName`,`iDateBirth`,`sRegGender`,`iCountryID`,`iCityID`,`iLocation`,`iUserType`,`iUserLevel`,`sPassword`,`sForgetPassword`,`iUserContact`,`sCreatedBy`,`dCreatedDate`,`sModifiedBy`,`sModifiedDate`,`sStatus`) VALUES 
 ('admin','admin@admin.com','admin','site','1070-01-20 00:00:00','Male',0,'1','1','1','null','*4ACFE3202A5FF5CF467898FC58AAB1D615029441','*AEC05E5BCC4222A9518E34283137F1F886267822',9090901,'null','2008-08-16 13:15:52','admin','2008-09-01 18:31:14','A'),
 ('sumitkondal','sumitkondal@gmail.com','sumit','kumar','1977-01-24 00:00:00','Male',1,'12','16','3','1','*DE1DB8227E5984E20058AA700853B7E7E199F1EE',NULL,111111111,NULL,'2009-04-24 18:30:03','sumitkondal','2009-04-24 18:32:14','A');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;


--
-- Definition of table `response`
--

DROP TABLE IF EXISTS `response`;
CREATE TABLE `response` (
  `iMessageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sUserID` varchar(45) DEFAULT NULL,
  `iPostID` int(10) unsigned DEFAULT NULL,
  `iListID` int(10) unsigned DEFAULT NULL,
  `sSubject` varchar(200) DEFAULT NULL,
  `tMessage` text,
  `sStatus` char(1) DEFAULT NULL,
  `sRead` char(1) DEFAULT NULL,
  `sCreatedBy` varchar(45) DEFAULT NULL,
  `sCreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`iMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `response`
--

/*!40000 ALTER TABLE `response` DISABLE KEYS */;
/*!40000 ALTER TABLE `response` ENABLE KEYS */;


--
-- Definition of table `selection`
--

DROP TABLE IF EXISTS `selection`;
CREATE TABLE `selection` (
  `iSelID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iHouseID` int(10) unsigned NOT NULL,
  `sLocationID` varchar(250) NOT NULL,
  `sCreatedBy` varchar(45) NOT NULL,
  `dCreatedDate` varchar(45) NOT NULL,
  `sModifiedBy` varchar(45) NOT NULL,
  `dModifiedDate` datetime NOT NULL,
  PRIMARY KEY (`iSelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `selection`
--

/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `selection` ENABLE KEYS */;


--
-- Definition of table `statemaster`
--

DROP TABLE IF EXISTS `statemaster`;
CREATE TABLE `statemaster` (
  `iStateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iCountryID` int(10) unsigned NOT NULL,
  `sStateName` varchar(100) NOT NULL,
  `sStatus` char(1) DEFAULT NULL,
  `sCreatedBy` varchar(45) NOT NULL,
  `dCreatedDate` datetime NOT NULL,
  PRIMARY KEY (`iStateID`),
  UNIQUE KEY `sStateName` (`sStateName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statemaster`
--

/*!40000 ALTER TABLE `statemaster` DISABLE KEYS */;
INSERT INTO `statemaster` (`iStateID`,`iCountryID`,`sStateName`,`sStatus`,`sCreatedBy`,`dCreatedDate`) VALUES 
 (1,1,'punjab','A','admin','2008-08-30 14:56:05'),
 (2,1,'delhi','A','admin','2008-08-30 14:55:29');
/*!40000 ALTER TABLE `statemaster` ENABLE KEYS */;


--
-- Definition of table `user_tracker`
--

DROP TABLE IF EXISTS `user_tracker`;
CREATE TABLE `user_tracker` (
  `iSNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sUserID` varchar(45) NOT NULL,
  `dLoginTime` datetime NOT NULL,
  `dLogoutTime` datetime NOT NULL,
  `sIPAddress` varchar(45) NOT NULL,
  PRIMARY KEY (`iSNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_tracker`
--

/*!40000 ALTER TABLE `user_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tracker` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
