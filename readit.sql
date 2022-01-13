-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: readit
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_email_348850e2_uniq` (`email`),
  UNIQUE KEY `accounts_account_phone_8ea3ea59_uniq` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account`
--

LOCK TABLES `accounts_account` WRITE;
/*!40000 ALTER TABLE `accounts_account` DISABLE KEYS */;
INSERT INTO `accounts_account` VALUES (1,'pbkdf2_sha256$260000$E2BBnCKmcXGc4yneNqMpTX$ys2Dc71VSG697qPncbGqWOCkKhSdXATpDcxkq3dYgAM=','abhishek','abhisheknairav@gmail.com','+919526091463','2021-12-13 13:27:22.560392','2022-01-08 10:50:09.056688',1,0,0,0),(5,'pbkdf2_sha256$260000$tBouLOhpjfiWDund7GAc6q$WhFk7Sdtm84PGoMqvv8if9MFM8O9Xt/oDkiemXWrBmc=','','admin@readit.com','','2021-12-14 06:21:14.285267','2022-01-12 15:00:11.854098',1,1,1,1),(7,'pbkdf2_sha256$260000$7jFZ3hmCumFRGbjWkOhVh0$m8nf4DFRD2hVLQEtImJegu029xyxtAdL9IKAMRIDsD0=','akhil mohan','akhilmohan@gmail.com','+919526091421','2021-12-14 06:27:38.508935','2021-12-14 06:27:48.711504',1,0,0,0),(8,'pbkdf2_sha256$260000$268pkEkVCznEI69siVsi7J$jJDrdwIuD9SO+BeJd4OW1jBU/FyiXEU4Mqeykvk/JWs=','Mansoor Ali','mansoor@gmail.com','+917558967627','2021-12-14 13:40:09.325737','2021-12-25 10:03:29.131666',1,0,0,0),(9,'pbkdf2_sha256$260000$j8qa3gAVGNiujzfmV80xP4$h37AYFmBiq6G4DOXJb0cIQxHTc2k+VqZBdUTC8M8OXk=','Sharath','sharath@gmail.com','+919645653429','2021-12-15 14:16:05.906555','2021-12-15 15:44:06.445714',1,0,0,0),(10,'pbkdf2_sha256$260000$7F1MKy5t9Po4NicLaidnJW$9lk85dun/JkJ5Z9GcGoVwrwhXJUVikRUUfZGFb5Cbss=','Arif','arif@gmail.com','+917306882706','2021-12-16 13:03:50.000742','2021-12-16 13:09:23.721858',1,0,0,0),(11,'pbkdf2_sha256$260000$Bpl6Yc50kXA56I5uT1lwAj$137keuMZmhvk/Tt5sJzcFxp6MAB+guBoeVR0/oK2lVo=','Ajil','ajil@gmail.com','+919207323067','2021-12-16 13:24:16.990373','2021-12-16 13:24:16.990435',1,0,0,0),(12,'pbkdf2_sha256$260000$wYY5Qzn90ydorV7UbEds2w$7GHYmaIQLmuVZr5ucpLCVXqXRv9RBdMGZ5LSE6XTlUU=','Ajil','ajil123@gmail.com','+919207323060','2021-12-16 13:25:24.249074','2021-12-16 13:25:24.249150',1,0,0,0),(13,'pbkdf2_sha256$260000$OxITowIEJBk2U2B2bFrwQQ$r5wdwmnwPuJ+eQVCliq6eQS7kVju2paJBt8gB1eVaxY=','Elena Silviya','elenasilviya@gmail.com','+918075959984','2021-12-16 13:30:39.990629','2021-12-16 13:30:39.990685',1,0,0,0),(15,'pbkdf2_sha256$260000$j1ZwHVjcAm6MRd3WeusOZr$FHYLXyuO7R1E6D4/sHe9NROSb1x51A7m4yJzD2OVVvc=','','admin1@gmail.com','+917326826734','2021-12-17 08:15:21.471264','2021-12-17 08:15:21.471337',1,1,1,1),(16,'pbkdf2_sha256$260000$bPo8E3R0b1P5e03qdXHX7X$lWkgvxuUO63fWSx6PsDUUbOJNgvFi5ay8iRXwuuJTMY=','sharath','sharath123@gmail.com','+917736873733','2021-12-17 12:25:47.726533','2021-12-17 12:25:47.726621',1,0,0,0),(17,'pbkdf2_sha256$260000$NT4fAsnjYmaJfS0nOERcn9$5FZCc/h1vmsz8OP/uJLo1YAB9MFQN3WxLTcJNNLYgm4=','john doe','johndoe@gmail.com','+919113877137','2021-12-21 06:44:13.887936','2022-01-08 10:50:56.496819',1,0,0,0),(18,'pbkdf2_sha256$260000$iZBYTprcYiPgAPB57dPrHI$Gf+qYOciGSjG/0Q5agp1Zwobj9n9LscmMdhf66Xy7QU=','Ashwin av','aswinav@gmail.com','+919539115577','2021-12-24 07:44:05.478692','2021-12-24 11:43:03.932818',1,0,0,0),(19,'pbkdf2_sha256$260000$U4HsLq0adwEzcXlKBZdPWF$0qT+5pjCuM80w8EKJNEfa8uhrG32BIShXkErwBPjFHo=','Elena silviya','elenaelu@gmail.com','+919947189872','2021-12-29 09:20:29.803999','2021-12-29 09:21:50.100860',1,0,0,0),(20,'pbkdf2_sha256$260000$eL9TjWXDhNX4skDNC2meIx$Nvz+lupOiK6+5H5pPejFeX0NfIZrkjmdQuHZUc0RIt4=','Akhil','akhil123@gmail.com','+917025464177','2022-01-03 05:30:50.223830','2022-01-03 05:30:50.795544',1,0,0,0),(21,'pbkdf2_sha256$260000$AG3eUeJHKBUKfRqYQPZ3jF$Yd2JQK9Hh1S5Wvf890sSN+DjRIkfre/IjDrQk4xDCJs=','john doe','johndoe999@gmail.com','+919526091470','2022-01-07 06:14:29.134381','2022-01-07 06:14:29.397633',1,0,0,0),(22,'pbkdf2_sha256$260000$0GTnR17efkfhWQOn5e9qoM$6RNHowqyFwZ6P5fDaMF45K5oUpHclquLkWGBp43gNpw=','Abhijith','abhijith12@gmail.com','+918593035173','2022-01-08 06:41:14.320093','2022-01-08 06:41:42.064070',1,0,0,0),(23,'pbkdf2_sha256$260000$4kzCysh0BxsE5zXWwPXYpR$Ulexq0EibC99tURaygRXzBCit4OoujoMzz3ac8h3gfA=','new guestuser','newguest@gmail.com','+919526041235','2022-01-12 06:08:13.509024','2022-01-12 06:08:14.234864',1,0,0,0),(24,'pbkdf2_sha256$260000$8KaueDkNMqXpIVbIljtUFh$ebEp9OctHZFVpsB6c0yw8kR/PuU/sGHbNQDGkjHEh4A=','mansoor ali khan','mansoor321@gmail.com','+917473829312','2022-01-12 06:42:19.529651','2022-01-12 06:42:20.078873',1,0,0,0);
/*!40000 ALTER TABLE `accounts_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_account_groups`
--

DROP TABLE IF EXISTS `accounts_account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_groups_account_id_group_id_f64165b0_uniq` (`account_id`,`group_id`),
  KEY `accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_account_gro_account_id_52f14852_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `accounts_account_groups_group_id_7c6a6bd1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_groups`
--

LOCK TABLES `accounts_account_groups` WRITE;
/*!40000 ALTER TABLE `accounts_account_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_account_user_permissions`
--

DROP TABLE IF EXISTS `accounts_account_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_account_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_user_pe_account_id_permission_id_9af93c14_uniq` (`account_id`,`permission_id`),
  KEY `accounts_account_use_permission_id_24620205_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_account_use_account_id_816f9bde_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `accounts_account_use_permission_id_24620205_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_account_user_permissions`
--

LOCK TABLES `accounts_account_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_account_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_account_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_address`
--

DROP TABLE IF EXISTS `accounts_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `zip` int NOT NULL,
  `address` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_address_user_id_c8c74ddf_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `accounts_address_user_id_c8c74ddf_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_address`
--

LOCK TABLES `accounts_address` WRITE;
/*!40000 ALTER TABLE `accounts_address` DISABLE KEYS */;
INSERT INTO `accounts_address` VALUES (1,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',7,'Abhishek'),(2,'kerala','kottayam',686511,'erumeli po\r\nkanjirappalli','+91708464177',7,'Akhil'),(3,'kerala','kannur',670142,'Krishnakripa house\r\nkoyyam PO','+919645653414',7,'Vishnu'),(4,'kerala','ernakulam',671752,'moovattupuzha\r\nkattadimukk','+919526095444',7,'Adhil'),(6,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',8,'Abhishek'),(8,'kerala','kannur',670142,'Krishnakripa house\r\nkoyyam PO','+919645653414',8,'Vishnu'),(10,'keralam','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',10,'Abhishek'),(12,'kerala','kochi',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',16,'sharath'),(13,'kerala','kannur',670142,'Krishnakripa house\r\nkoyyam PO','+919645653414',16,'Vishnu'),(15,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',1,'Abhishek'),(18,'kerala','kochi',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',1,'sharath'),(19,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',17,'Abhishek'),(20,'kerala','malappuram',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',8,'mansoor'),(21,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',18,'Abhishek'),(22,'kerala','kottayam',686511,'erumeli po\r\nkanjirappalli','+91708464177',18,'Akhil'),(23,'karnataka','bangalore',686511,'pallimukk\r\nkadavantra po','+919113877137',19,'Elena silviya'),(24,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',21,'john doe'),(25,'kerala','kottayam',686511,'erumeli po\r\nkanjirappalli','+91708464177',21,'Akhil'),(26,'kerala','kannur',670142,'Krishnakripa house\r\nkoyyam PO','+919645653414',1,'Vishnu'),(27,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',22,'Abhishek'),(30,'kerala','kasaragod',671314,'uthirchamkavu house\r\nkalichanadukkam po','+919526091463',24,'Abhishek A V');
/*!40000 ALTER TABLE `accounts_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpanel_authors`
--

DROP TABLE IF EXISTS `adminpanel_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_authors`
--

LOCK TABLES `adminpanel_authors` WRITE;
/*!40000 ALTER TABLE `adminpanel_authors` DISABLE KEYS */;
INSERT INTO `adminpanel_authors` VALUES (6,'DEEPA NISANTH','2021-12-11 07:05:39.722394'),(7,'OSHO','2021-12-11 10:22:06.765816'),(8,'MATTHEW REILLY','2021-12-11 10:27:25.630806'),(9,'SHASHI THAROOR','2021-12-11 10:30:39.580528'),(10,'T S UNNIKRISHNAN NAIR','2021-12-11 11:01:33.587788'),(11,'BINEESH PUTHUPPANAM','2021-12-14 17:53:13.649857'),(12,'GOPINATH MUTHUKAD','2021-12-14 18:04:47.440474'),(14,'ULLOOR S PARAMESWARA IYER','2021-12-15 13:23:49.726534'),(15,'K R MEERA','2021-12-15 13:27:39.566043'),(16,'BASHARAT PEER','2021-12-15 13:31:00.875894'),(17,'J R R Tolkien','2021-12-31 09:16:15.263893'),(18,'HARPER LEE','2022-01-02 17:30:17.510590');
/*!40000 ALTER TABLE `adminpanel_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpanel_books`
--

DROP TABLE IF EXISTS `adminpanel_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `author_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `desc` longtext NOT NULL,
  `discount` double NOT NULL,
  `price` double NOT NULL,
  `language` longtext NOT NULL,
  `publisher` longtext NOT NULL,
  `stock` int NOT NULL,
  `sprice` double NOT NULL,
  `image1` varchar(100) DEFAULT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `is_catoffer` int NOT NULL,
  `newoffer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adminpanel_books_author_id_64853b64` (`author_id`),
  KEY `adminpanel_books_genre_id_29c5db0d` (`genre_id`),
  CONSTRAINT `adminpanel_books_author_id_64853b64_fk_adminpanel_authors_id` FOREIGN KEY (`author_id`) REFERENCES `adminpanel_authors` (`id`),
  CONSTRAINT `adminpanel_books_genre_id_29c5db0d_fk_adminpanel_category_id` FOREIGN KEY (`genre_id`) REFERENCES `adminpanel_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_books`
--

LOCK TABLES `adminpanel_books` WRITE;
/*!40000 ALTER TABLE `adminpanel_books` DISABLE KEYS */;
INSERT INTO `adminpanel_books` VALUES (11,'JEEVITHAM ORU MONALISACHIRIYANU','2021121107081910846524956774-JEEVITHAM-ORU-MONALIZACHIRIYANU-ED-1-COVER-2000-COPIES.jpg',6,8,'\'\'കാലങ്ങളായി അളന്നിട്ടും പഠിച്ചിട്ടും നിരീക്ഷിച്ചിട്ടും ഇനിയും കണ്ടുപിടിക്കാനാവാത്ത മോണാലിസയുടെ നിഗൂഡമായ മുഖം പോലെ ഈ വരികള്‍ക്കിടയില്‍ ഒളിച്ചു കിടക്കുന്ന വികാരം ചിരിയോ കരച്ചിലോ വേദനയോ നൊമ്പരമോ എന്നറിയാന്‍ കഴിയാനാവാത്തതിന്റെ ഒരു വശ്യത ഈ കുറിപ്പുകളില്‍ ഓരോന്നിലും ഉറങ്ങിക്കിടക്കുന്നുമുണ്ട്. അങ്ങനെയാണ് ഈ പുസ്തകത്തിനു ജീവിതം ഒരു മോണാലിസച്ചിരിയാണ് എന്ന പേര് അത്രമാത്രം അര്‍ത്ഥവത്താകുന്നത് .\'\' -- ബെന്യാമിന്‍',14,199,'Malayalam','DC BOOKS',49,169.15,'','',1,15),(12,'JALAMEVIDE CHANDRABIMBAMEVIDE','20211211102604bk_6581.jpg',7,9,'സെന്‍ കഥകളെ അടിസ്ഥാനമാക്കി ഓഷോയുടെ പ്രഭാഷണങ്ങള്‍ അവതരിപ്പിക്കുന്ന പുസ്തകം.',10,140,'Malayalam','DC BOOKS',0,126,'','',0,0),(13,'THE TWO LOST MOUNTAINS','2021121110300693269669688162-MATTHEW-REILLY.jpg',8,10,'AN INCREDIBLE VICTORY AT A TERRIBLE PRICE Against all the odds, Jack West found the Three Secret Cities - but at a heartbreaking cost. TO THE MOUNTAINS AND THE FALL Still reeling from his loss, Jack must now get to one of the five iron mountains - two of which have never been found - and perform a mysterious feat known only as \'The Fall\'. A NEW PLAYER ARRIVES Amid all this, Jack will discover that a new player has entered the race, a general so feared by the four legendary kingdoms they had him locked away in their deepest dungeon. Only now this general has escaped and he has a horrifying plan of his own',10,699,'English','ORION BOOKS',56,629.1,NULL,NULL,0,0),(14,'PRIDE PREJUDICE AND PUNDITRY','20211211103305938348070124-PRIDE-PREJUDICE.jpg',9,10,'PRIDE, PREJUDICE AND PUNDITRY: THE ESSENTIAL SHASHI THAROOR',10,900,'English','ALEPH BOOK COMPANY',15,810,NULL,NULL,0,0),(15,'NANANJU THEERTHA MAZHAKAL','2021121110345810662558076592-Capture.png',6,8,'ഓർമ്മകൾക്ക് പല നിർവ്വചനങ്ങളുണ്ട്. ഉച്ചാടനം അതിലൊന്നാണ്. ഒരു കാലത്തെ മറികടക്കലാണ് ഓർമ്മയെഴുത്ത്. കരൾ പിളർന്നുകൊണ്ടാണെങ്കിലും കാലത്തെ ഓർമ്മയുടെ ഉളികൊണ്ട് പലരും കൊത്തിവയ്ക്കുന്നത് അതുകൊണ്ടാണ്. കൊത്തിക്കഴിയുമ്പോൾശില്പം എല്ലാരുടേതുമാകുന്നു...',25,199,'Malayalam','DC BOOKS',9,149.25,NULL,NULL,0,0),(16,'OTTAMARAPPEYTHU','20211211105248123.jpg',6,8,'ഓര്‍മ്മകള്‍ സ്വപ്‌നത്തെക്കാള്‍ മനോഹരമാണെന്ന് ഓര്‍മ്മപ്പെടുത്തുന്നു ഈ പുസ്തകത്തിനുള്ളിലെ കുറിപ്പുകള്‍. അനുഭവങ്ങള്‍ എത്ര തീവ്രമാണെങ്കിലും സ്വപ്‌നത്തിലെന്നപോലെ കടന്നുപോകുന്ന ഒരു എഴുത്തുകാരിയെ ദീപാനിശാന്തില്‍ വായിക്കാം. വെയിലില്‍ മാത്രമല്ല തീയിലും വാടാത്ത നിശ്ചയദാര്‍ഢ്യവും ധീരതയും ആ എഴുത്തുകള്‍ക്ക് പുതിയൊരു ചാരുത സമ്മാനിക്കുന്നു. ഇതിലെ ഭാഷ ലളിതവും തെളിമയുള്ളതുമാണ്. സാഹിത്യഭാഷയുടെ ചമത്കാരങ്ങളും ധ്വനികളുമില്ല. ഋജുവായി, സരളമായി അവ നമ്മോടു സംവദിക്കുന്നു.',10,150,'Malayalam','DC BOOKS',17,127.5,'','',1,15),(17,'SRIMAD BHAGAVATHAM 4 VOLUMES','202112111105366662876536830-bagavadgeetha-1-.jpg',10,11,'സവിശേഷതകള്‍ #നിത്യപാരായണത്തിനും സപ്താഹത്തിനും പ്രയോജനപ്പെടുന്ന രീതിയില്‍ തയ്യാറാക്കിയതാണ് ഡി സി ബുക്‌സ് പ്രസിദ്ധീകരിക്കുന്ന ശ്രീമദ് ഭാഗവതം. #മൂലം മാത്രം വായിച്ചുപോകേണ്ടവര്‍ക്ക് അതിനുതകുന്ന രീതിയിലാണ് പേജുകള്‍ സജ്ജീകരിച്ചിരിക്കുന്നത്. #മൂലത്തോടൊപ്പം വ്യാഖ്യാനവും അറിയേണ്ടവര്‍ക്ക് അതിനുള്ള സൗകര്യമുണ്ട്. ഭാഗവതകഥകള്‍ അറിയേണ്ടവര്‍ക്ക് തുടര്‍ച്ചയായി അത് വായിച്ചുപോകാനും സാധിക്കും. #പ്രായം ചെന്നവര്‍ക്കും വായിക്കാനുള്ള സൗകര്യത്തിന് വലിയ അക്ഷരത്തില്‍ മൂലം നല്കിയിരിക്കുന്നു. #കുട്ടികള്‍ക്കും മുതിര്‍ന്നവര്‍ക്കും മനസ്സിലാകുന്നതരത്തില്‍ ലളിതമായ ഭാഷയിലാണ് വ്യാഖ്യാനം നല്കിയിരിക്കുന്നത്. #സാധാരണ പുസ്തകത്തിന്റെ ഇരട്ടിവലിപ്പത്തില്‍ (ഡിമൈ 1/4 സൈസ്) ആണ് 4 വാല്യങ്ങളിലായിപുസ്തകങ്ങള്‍ തയ്യാറാക്കിയിട്ടുള്ളത്. #600 ഓളം പേജുകള്‍ വരുന്ന 4 വാല്യങ്ങള്‍ ഉള്ളതിനാല്‍ സപ്താഹത്തിന് കൊണ്ടുപോകുന്നതിനും കൈയിലെടുത്ത് പാരായണം ചെയ്യുന്നതിനും സൗകര്യപ്രദമാണ്. #വളരെക്കാലം ഉപയോഗിക്കാവുന്ന വിധത്തില്‍ കട്ടിക്കവറും മേനിക്കടലാസുമാണ് പുസ്തകങ്ങള്‍ക്കുള്ളത്. #നാലു വാല്യങ്ങളും സൂക്ഷിച്ചു വയ്ക്കാവുന്ന പെട്ടിയും ഇതോടൊപ്പമുണ്ട്',33,4500,'Malayalam','DC BOOKS',47,3015,'','',0,35),(18,'PREMANAGARAM','2021121417580812.jpg',11,12,'പ്രേമവും രതിയും ദർശനവും ആത്മബോധവുമെല്ലാം ഇഴചേർന്ന നോവലാണ് പ്രേമനഗരം.നീലുവും മാധവും തമ്മിലുള്ള അനശ്വര പ്രേമകഥയിലൂടെ നിരുപാധിക സ്നേഹത്തിൻ്റെ പൊരുൾ തേടുന്നു. ഒപ്പം സ്ത്രീ പുരുഷ ബന്ധത്തിൻ്റെ ആഴവും പരപ്പും ആവോളം ആവിഷ്ക്കരിക്കുന്നു. ഒരു ഭാഗത്ത് പുരോഗമനവും മറുഭാഗത്ത് കനത്ത അന്ധവിശ്വാസവും തമ്മിൽ കെട്ടുപിണഞ്ഞു കിടക്കുന്ന കേരളത്തിൻ്റെ ദ്വന്ദ്വ മുഖത്തെ നോവൽ വെളിപ്പെടുത്തുന്നുണ്ട്. വായനാരസത്തിൻ്റെ മുകുളങ്ങളാൽ ഒറ്റയിരുപ്പിൽ വായിക്കാവുന്ന മനോഹര പുസ്തകം.',20,170,'Malayalam','DC BOOKS',44,119,NULL,NULL,0,0),(19,'INDIA MY SPELLBOUND LOVE','2021121418070753203744065206-Capture.png',12,13,'What started as an escape to Delhi in November 2000, owing to a failed ‘Propeller Escape’ magic act, led to a path breaking life experience for the renowned magician Gopinath Muthukad and his team. Boarding a train to Delhi for the first time away from frenzied eyes of the media, Gopinath Muthukad sets a trail towards national integrity through his India voyages. This book is a memoir and travel account of the wonderful national trips undertaken by Muthukad and his team. It mirrors rural India and its frail attempts to survive this fast growing hectic world.An inspiring book, with anecdotes from great lives of Gandhi, Tagore and Dr. APJ Abdul Kalam.',10,399,'English','DC BOOKS',36,359.1,NULL,NULL,0,0),(21,'KERALASAHITHYA CHARITHRAM','20211215132655ahbs.jpg',14,15,'കാൽനൂറ്റാണ്ടിലേറെക്കാലത്തെ ഗവേഷണ പഠനങ്ങളിലൂടെ സമഗ്രമായി പരിഷ്‌കരിച്ച പതിപ്പ് . പിൽക്കാലത്ത് കണ്ടെടുക്കപ്പെട്ട കൃതികളെക്കുറിച്ചുള്ള വിശകലനങ്ങൾ $ ഉള്ളൂർ സാഹിത്യചരിത്രത്തിൽ വിട്ടുകളഞ്ഞ സമകാലികരുടെയും ഉള്ളൂരിന്റെയും കൃതികളെക്കുറിച്ചുള്ള വിശകലനങ്ങൾ $ ഉള്ളൂർ സാഹിത്യചരിത്രത്തിൽ പരാമർശിക്കുന്നതും എന്നാൽ അന്ന് കണ്ടെടുക്ക പ്പെട്ടിട്ടില്ലാത്തതുമായ താളിയോലകൾ, പിൽക്കാല പ്രസിദ്ധീകരണങ്ങൾ എന്നിവയെ വിശദമായി പരാമർശിക്കുന്നു $ സാഹിത്യചരിത്രത്തിൽ പരാമർശിക്കുന്ന പുസ്തകങ്ങൾ, മാസികകൾ, പത്രങ്ങൾ തുടങ്ങിയവയുടെ ചിത്രങ്ങളും എഴുത്തുകാരുടെ ഫോട്ടോകളും $ സാ ഹി ത്യ ച രി ത്ര ത ത ് പ രർക്കും ഗ വേ ഷ കർക്കും പ്ര യോ ജ ന പ്ര ദമാ യ രീ തി യിൽ കാലോചിതമായ പരിഷ്‌കാരങ്ങൾ വരുത്തിയത് $ വിട്ടുപോയ കണ്ണികൾ കണ്ടെടുത്ത് നല്കിയിരിക്കുന്നു $ കൊല്ലവർഷത്തോടൊപ്പം ഇംഗ്ലിഷ് വർഷങ്ങളും തീയതികളും $ പില്ക്കാല സാഹിത്യചരിത്രങ്ങളുടെ വിശദാംശങ്ങൾ',42,3500,'Malayalam','DC BOOKS',99,2800,NULL,NULL,0,0),(23,'NIZHALVEENA RAATHRIKAL','2021121513435477299206082664-NIZHALVEENA-1.jpg',16,8,'കാശ്മീരില്‍ ജനിച്ചു വളര്‍ന്ന ഒരു യുവാവിന്റെ തീവ്രമായ അനു ഭവങ്ങളുടെ ആഖ്യാനം. കാശ്മീര്‍ താഴ്‌വരയില്‍ ദിനംപ്രതിയെന്നോണം വിഘടനവാദികള്‍ പൊട്ടിമുളയ്ക്കുകയും ശക്തിയാര്‍ജിക്കുകയും ഒട്ടനവധി യുവാക്കള്‍ നിയന്ത്രണരേഖതാണ്ടി പാകിസ്ഥാനി പ്രദേശങ്ങളിലേക്കു കടന്ന് സായുധ പരിശീലനം നേടി തിരിച്ചു വരികയും ചെയ്തുകൊണ്ടിരുന്ന എണ്‍പതുകളുടെ അവസാന നാളുകളില്‍ തന്റെ കൗമാരകാലം കാശ്മീരില്‍ ചെലവഴിച്ച ബഷാരത്ത് പീറിന്റെ സ്മരണകള്‍. കലാപഭീതിയും താഴ്‌വരയിലെ വിദ്യാഭ്യാസ പരിമിതികളും ബഷാരത്തിനെ ജന്മനാട്ടില്‍നിന്നും അകറ്റി. എന്നാല്‍ കൂടുതല്‍ ക്രുദ്ധരാകുകയും അക്രമണോത്സുകരാകുകയും നിസ്സഹായരാകുകയും ചെയ്ത കാശ്മീര്‍ ജനത ഒരിക്കലും അവനില്‍നിന്ന് അകന്നിരുന്നില്ല. ചരിത്രവും വസ്തുതാവിവരണവും ചേർത്തുവെച്ചുകൊണ്ടു സമീപകാല ചരിത്രത്തിലെ ഏറ്റവും പരിതാപക രമായ സംഘര്‍ഷാവസ്ഥയുടെ ചിത്രം കോറിയിടുന്ന രചന.',50,160,'Malayalam','DC BOOKS',45,80,NULL,NULL,0,0),(25,'DESIYATHAYUDE UTHKANDA','2021121513530735821555161958-cover.jpg',9,16,'ഇന്ത്യയിൽ നാമിന്നു കാണുന്ന പ്രധാന പോരാട്ടം മതത്തിലൂന്നിയ ദേശീയതയും സാംസ്‌കാരികതയിൽ ഊന്നിയ ദേശീയതയും തമ്മിലുള്ളതാണ്. ഇന്ത്യ എന്ന രാജ്യത്തിന്റെ നെടുംതൂണുകളായ ബഹുസ്വരതയും മതേതരത്വവും അട്ടിമറികളുടെ ഭീഷണിയിൽപ്പെട്ടുഴലുന്നു. ഭരണഘടനയെ ചവിട്ടടിയിലാക്കിയും ഐതിഹ്യങ്ങളെ ചരിത്രമാക്കിയും ന്യൂനപക്ഷങ്ങളെ ഭയാശങ്കരാക്കിയും മതാധിഷ്ഠിത ദേശീയത അതിന്റെ കരിനിഴൽ നമ്മളുടെമേൽ പടർത്തുന്നു. സ്വന്തം രാജ്യത്തിനും അവകാശങ്ങൾക്കുമായി ഇന്ത്യാക്കാർ പോരാടേണ്ടിവരുന്നു. ഈ പ്രതിസന്ധിഘട്ടത്തിൽ ആരാണ് യഥാർത്ഥ ഇന്ത്യാക്കാർ? എന്താണ് ശരിയായ ദേശീയത, ദേശസ്‌നേഹം? ',10,555,'Malayalam','DC BOOKS',50,499.5,NULL,NULL,0,0),(26,'The Lord of the Rings','202112310921107db81f40-04f6-47b3-9b7b-81505ea24d07.jpeg',17,17,'The Lord of the Rings is an epic high-fantasy novel by English author and scholar J. R. R. Tolkien. Set in Middle-earth, intended to be Earth at some distant time in the past, the story began as a sequel to Tolkien\'s 1937 children\'s book The Hobbit, but eventually developed into a much larger work. Written in stages between 1937 and 1949, The Lord of the Rings is one of the best-selling books ever written, with over 150 million copies sold.',10,329,'English','Allen & Unwin',37,296.1,NULL,NULL,0,0),(27,'To Kill A Mocking Bird','20220102173418800px-To_Kill_a_Mockingbird_first_edition_cover.jpg',18,12,'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools. To Kill a Mockingbird has become a classic of modern American literature, winning the Pulitzer Prize. The plot and characters are loosely based on Lee\'s observations of her family, her neighbors and an event that occurred near her hometown of Monroeville, Alabama, in 1936, when she was ten.',20,540,'English','J. B. Lippincott & Co.',78,378,NULL,NULL,0,0),(28,'New book','20220108065223flying.jpeg',10,12,'description here',10,399,'Malayalam','DC BOOKS',2,279.3,'','',0,0),(35,'new book cropped','20220111105512new_book_cropped1.png',11,9,'nkdnfisdfk',12,433,'malayalam','dc books',123,381.04,'20220111105512new_book_cropped2.png','20220111105512new_book_cropped3.png',0,0);
/*!40000 ALTER TABLE `adminpanel_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpanel_category`
--

DROP TABLE IF EXISTS `adminpanel_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_category`
--

LOCK TABLES `adminpanel_category` WRITE;
/*!40000 ALTER TABLE `adminpanel_category` DISABLE KEYS */;
INSERT INTO `adminpanel_category` VALUES (8,'Memoirs','2021-12-11 07:06:15.710059'),(9,'Philosophy','2021-12-11 10:23:53.460986'),(10,'Literary Fiction','2021-12-11 10:27:45.114644'),(11,'Religion','2021-12-11 11:01:55.028870'),(12,'Novel','2021-12-14 17:53:40.204363'),(13,'Travel & Travelogue','2021-12-14 18:05:07.857538'),(15,'Literature','2021-12-15 13:24:24.292093'),(16,'Society & Culture','2021-12-15 13:51:09.865107'),(17,'Adventure','2021-12-31 09:16:43.479414');
/*!40000 ALTER TABLE `adminpanel_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpanel_offer`
--

DROP TABLE IF EXISTS `adminpanel_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminpanel_offer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adminpanel_offer_category_id_f0cf65d6_fk_adminpanel_category_id` (`category_id`),
  CONSTRAINT `adminpanel_offer_category_id_f0cf65d6_fk_adminpanel_category_id` FOREIGN KEY (`category_id`) REFERENCES `adminpanel_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpanel_offer`
--

LOCK TABLES `adminpanel_offer` WRITE;
/*!40000 ALTER TABLE `adminpanel_offer` DISABLE KEYS */;
INSERT INTO `adminpanel_offer` VALUES (5,30,12),(9,32,11),(10,15,8),(11,25,15);
/*!40000 ALTER TABLE `adminpanel_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add account',1,'add_account'),(2,'Can change account',1,'change_account'),(3,'Can delete account',1,'delete_account'),(4,'Can view account',1,'view_account'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add authors',8,'add_authors'),(30,'Can change authors',8,'change_authors'),(31,'Can delete authors',8,'delete_authors'),(32,'Can view authors',8,'view_authors'),(33,'Can add genres',9,'add_genres'),(34,'Can change genres',9,'change_genres'),(35,'Can delete genres',9,'delete_genres'),(36,'Can view genres',9,'view_genres'),(37,'Can add books',10,'add_books'),(38,'Can change books',10,'change_books'),(39,'Can delete books',10,'delete_books'),(40,'Can view books',10,'view_books'),(41,'Can add Twilio SMS Device',11,'add_twiliosmsdevice'),(42,'Can change Twilio SMS Device',11,'change_twiliosmsdevice'),(43,'Can delete Twilio SMS Device',11,'delete_twiliosmsdevice'),(44,'Can view Twilio SMS Device',11,'view_twiliosmsdevice'),(45,'Can add category',9,'add_category'),(46,'Can change category',9,'change_category'),(47,'Can delete category',9,'delete_category'),(48,'Can view category',9,'view_category'),(49,'Can add address',12,'add_address'),(50,'Can change address',12,'change_address'),(51,'Can delete address',12,'delete_address'),(52,'Can view address',12,'view_address'),(53,'Can add wishlist',13,'add_wishlist'),(54,'Can change wishlist',13,'change_wishlist'),(55,'Can delete wishlist',13,'delete_wishlist'),(56,'Can view wishlist',13,'view_wishlist'),(57,'Can add cart',14,'add_cart'),(58,'Can change cart',14,'change_cart'),(59,'Can delete cart',14,'delete_cart'),(60,'Can view cart',14,'view_cart'),(61,'Can add order',15,'add_order'),(62,'Can change order',15,'change_order'),(63,'Can delete order',15,'delete_order'),(64,'Can view order',15,'view_order'),(65,'Can add order items',16,'add_orderitems'),(66,'Can change order items',16,'change_orderitems'),(67,'Can delete order items',16,'delete_orderitems'),(68,'Can view order items',16,'view_orderitems'),(69,'Can add payment',17,'add_payment'),(70,'Can change payment',17,'change_payment'),(71,'Can delete payment',17,'delete_payment'),(72,'Can view payment',17,'view_payment'),(73,'Can add coupon_entry',18,'add_coupon_entry'),(74,'Can change coupon_entry',18,'change_coupon_entry'),(75,'Can delete coupon_entry',18,'delete_coupon_entry'),(76,'Can view coupon_entry',18,'view_coupon_entry'),(77,'Can add coupon',19,'add_coupon'),(78,'Can change coupon',19,'change_coupon'),(79,'Can delete coupon',19,'delete_coupon'),(80,'Can view coupon',19,'view_coupon'),(81,'Can add coupon orders',20,'add_couponorders'),(82,'Can change coupon orders',20,'change_couponorders'),(83,'Can delete coupon orders',20,'delete_couponorders'),(84,'Can view coupon orders',20,'view_couponorders'),(85,'Can add buy now',21,'add_buynow'),(86,'Can change buy now',21,'change_buynow'),(87,'Can delete buy now',21,'delete_buynow'),(88,'Can view buy now',21,'view_buynow'),(89,'Can add offers',22,'add_offers'),(90,'Can change offers',22,'change_offers'),(91,'Can delete offers',22,'delete_offers'),(92,'Can view offers',22,'view_offers'),(93,'Can add offer',22,'add_offer'),(94,'Can change offer',22,'change_offer'),(95,'Can delete offer',22,'delete_offer'),(96,'Can view offer',22,'view_offer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$9tjdj4HokQY7$qbEal+UptxF/HsmJaO/cyusssRB74x2bnpBWAWl/bQo=','2021-12-07 08:01:03.228756',1,'abhishek','','','abhi@readit.com',1,1,'2021-12-07 08:00:04.846819'),(2,'pbkdf2_sha256$150000$MgMzXHVXeSX6$eIUTksS3+mNWj6PwZJLQm9rB95o5TR6y51oqNUQ5joc=',NULL,0,'akhil','','','',0,1,'2021-12-07 08:03:07.845397');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-12-07 08:03:08.150353','2','akhil',1,'[{\"added\": {}}]',5,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'accounts','account'),(12,'accounts','address'),(2,'admin','logentry'),(8,'adminpanel','authors'),(10,'adminpanel','books'),(9,'adminpanel','category'),(22,'adminpanel','offer'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(11,'otp_twilio','twiliosmsdevice'),(7,'sessions','session'),(21,'store','buynow'),(14,'store','cart'),(19,'store','coupon'),(18,'store','coupon_entry'),(20,'store','couponorders'),(15,'store','order'),(16,'store','orderitems'),(17,'store','payment'),(13,'store','wishlist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2021-12-07 06:26:51.665130'),(2,'contenttypes','0001_initial','2021-12-07 06:26:53.564395'),(3,'auth','0001_initial','2021-12-07 06:26:58.853148'),(4,'admin','0001_initial','2021-12-07 06:27:17.644896'),(5,'admin','0002_logentry_remove_auto_add','2021-12-07 06:27:22.144908'),(6,'admin','0003_logentry_add_action_flag_choices','2021-12-07 06:27:22.302640'),(7,'contenttypes','0002_remove_content_type_name','2021-12-07 06:27:26.492318'),(8,'auth','0002_alter_permission_name_max_length','2021-12-07 06:27:28.941303'),(9,'auth','0003_alter_user_email_max_length','2021-12-07 06:27:29.401750'),(10,'auth','0004_alter_user_username_opts','2021-12-07 06:27:29.558479'),(11,'auth','0005_alter_user_last_login_null','2021-12-07 06:27:31.366971'),(12,'auth','0006_require_contenttypes_0002','2021-12-07 06:27:31.815369'),(13,'auth','0007_alter_validators_add_error_messages','2021-12-07 06:27:31.940442'),(14,'auth','0008_alter_user_username_max_length','2021-12-07 06:27:34.332866'),(15,'auth','0009_alter_user_last_name_max_length','2021-12-07 06:27:36.358734'),(16,'auth','0010_alter_group_name_max_length','2021-12-07 06:27:36.916178'),(17,'auth','0011_update_proxy_permissions','2021-12-07 06:27:37.155069'),(18,'sessions','0001_initial','2021-12-07 06:27:38.200901'),(19,'accounts','0002_auto_20211207_0651','2021-12-07 06:51:23.305855'),(20,'accounts','0003_auto_20211207_0833','2021-12-07 08:33:25.460580'),(21,'accounts','0004_auto_20211207_1116','2021-12-07 11:16:30.585121'),(22,'accounts','0005_auto_20211207_1127','2021-12-07 11:27:10.911027'),(23,'adminpanel','0001_initial','2021-12-08 08:25:54.475578'),(24,'adminpanel','0002_books','2021-12-08 13:32:53.273539'),(25,'adminpanel','0003_auto_20211208_1335','2021-12-08 13:35:20.639774'),(26,'adminpanel','0004_auto_20211209_0433','2021-12-09 04:33:46.695636'),(27,'adminpanel','0005_auto_20211209_0740','2021-12-09 07:40:55.007167'),(28,'otp_twilio','0001_initial','2021-12-10 12:18:34.081767'),(29,'otp_twilio','0002_last_t','2021-12-10 12:18:40.456283'),(30,'otp_twilio','0003_longer_number','2021-12-10 12:18:40.978382'),(31,'otp_twilio','0004_sidechanneldevice','2021-12-10 12:18:50.265502'),(32,'auth','0012_alter_user_first_name_max_length','2021-12-10 14:13:27.060479'),(33,'adminpanel','0006_auto_20211211_0534','2021-12-11 05:35:06.414059'),(34,'adminpanel','0007_auto_20211211_0629','2021-12-11 06:29:22.095763'),(35,'adminpanel','0008_rename_genres_category','2021-12-11 07:02:49.550466'),(36,'accounts','0006_auto_20211213_1319','2021-12-13 13:19:42.438569'),(37,'accounts','0007_alter_account_phone','2021-12-13 13:24:01.039564'),(38,'accounts','0008_alter_account_is_active','2021-12-13 13:26:49.045313'),(39,'accounts','0009_auto_20211214_0343','2021-12-14 03:43:45.820344'),(40,'accounts','0010_account_is_staff','2021-12-14 06:19:01.963423'),(41,'accounts','0011_address','2021-12-14 06:55:13.064481'),(42,'accounts','0012_address_name','2021-12-14 07:46:25.761692'),(43,'store','0001_initial','2021-12-14 12:23:41.452617'),(44,'adminpanel','0009_books_sprice','2021-12-15 05:42:26.874932'),(45,'store','0002_cart','2021-12-15 08:12:51.040037'),(46,'store','0003_cart_qty','2021-12-15 08:12:51.848365'),(47,'store','0004_alter_cart_qty','2021-12-15 08:13:41.408798'),(48,'store','0005_cart_price','2021-12-15 10:46:26.128880'),(49,'store','0006_order','2021-12-20 12:22:23.648262'),(50,'store','0007_orderitems_payment','2021-12-21 05:46:56.028293'),(51,'store','0008_order_date_added','2021-12-21 07:23:45.235589'),(52,'store','0009_order_is_active','2021-12-22 10:43:06.170515'),(53,'store','0010_coupon_coupon_entry','2021-12-28 05:48:51.913214'),(54,'store','0011_auto_20211228_0616','2021-12-28 06:16:49.727884'),(55,'store','0012_cart_is_coupon','2021-12-28 07:59:05.292726'),(56,'store','0013_cart_category','2021-12-28 10:55:24.239859'),(57,'store','0014_alter_cart_book','2021-12-28 10:55:27.395418'),(58,'store','0015_alter_cart_category','2021-12-28 10:55:30.161111'),(59,'store','0016_remove_cart_category','2021-12-28 10:55:32.652841'),(60,'store','0017_cart_category','2021-12-28 10:56:44.714569'),(61,'store','0018_coupon_entry_discount_price','2021-12-29 04:01:05.421620'),(62,'store','0019_auto_20211229_0805','2021-12-29 08:05:56.907901'),(63,'store','0020_buynow','2021-12-29 11:33:41.231965'),(64,'store','0021_buynow_is_coupon','2021-12-29 12:03:31.708010'),(65,'store','0022_auto_20220102_0857','2022-01-02 08:57:48.212152'),(66,'store','0023_couponorders_user','2022-01-02 09:35:55.565437'),(67,'store','0024_alter_couponorders_user','2022-01-02 09:35:58.574289'),(68,'store','0025_delete_buynow','2022-01-02 14:54:54.329657'),(69,'adminpanel','0010_auto_20220102_1515','2022-01-02 15:16:07.399896'),(70,'adminpanel','0011_rename_offers_offer','2022-01-02 15:28:01.613733'),(71,'adminpanel','0012_category_newoffer','2022-01-02 16:26:36.699110'),(72,'adminpanel','0013_rename_category_offer_category','2022-01-02 16:31:03.295654'),(73,'store','0026_alter_order_status','2022-01-07 11:59:02.252464'),(74,'adminpanel','0014_auto_20220108_0922','2022-01-08 09:22:42.221771'),(75,'adminpanel','0015_auto_20220110_1024','2022-01-10 10:24:46.215840'),(76,'store','0027_auto_20220112_0528','2022-01-12 05:28:51.630207'),(77,'store','0028_wishlist_guest_user','2022-01-12 07:19:49.202462'),(78,'store','0029_alter_wishlist_user','2022-01-12 07:25:32.719862'),(79,'store','0030_alter_order_date_added','2022-01-12 11:02:03.709333'),(80,'store','0031_alter_order_date_added','2022-01-12 11:03:10.800401');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0fz81abaudcdg5xnd94js4ntmljabd90','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n3e9O:6oS55bq8HxXvVenLglREXTQZZtqosiaiBt4h8cA9OZY','2022-01-15 13:10:22.059468'),('3ezwdn2oz246ppxdr5np9wehhnqtssdx','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n5iph:l0EwrpANTQogpRU8Pbz0IdbWiihpc6cHdkqXPRkAT4M','2022-01-21 06:34:37.032413'),('5w0s65fqri276c48i4m33vsntedeo1tv','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n0F43:fTo96ErrBfwtBX2mtEJrZEwVxHoYlpAWZ7DWYD2DwHY','2022-01-06 03:46:47.566686'),('86uda9xci4v17i47nvpf70qsmjzvy0af','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n6nWB:RCMtVNhrfWN-PWeAKhewuMXHgrxrPofo45_Xt3QN8og','2022-01-24 05:46:55.650733'),('9y5e45z9f65hd34jbzojyvtyq32nkcvw','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1mxByn:jZQJUcZQOLFN_aefKiGs-qOAodVH7IHZ5bws_O4OdSI','2021-12-28 17:52:45.537643'),('awhnanwnj7pn2gq9af1sfowdsg8yfiiv','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n7C3Q:Olnb5dQhhLHLiAP2PHuzf8GRg-pOsdDUlvt_Gdiy1-4','2022-01-25 07:58:52.723938'),('aykgof7jolnhl5cq2fgqiweypro3mcwh','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1mzuyo:9hLe1uGSmP9X0ezFC1jF3UGSKI0Drt6HyuSDO_jibJ4','2022-01-05 06:20:02.343305'),('bp23rhwunav7a2lmzcq0kq3x1d1xnllq','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n6SrU:TmeKjhf3sGND5-CoSBm2-yBuBkq32mDwxN859ZQsUTo','2022-01-23 07:43:32.732446'),('c6f7p1k5ojqoi5c0kf78hvpmsntdmhq3','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1mxORa:z16EXA2RWtr0itf176f_xEv23_GP3OFwAN94S9vM5lM','2021-12-29 07:11:18.301801'),('fztu6hfsbz9perkmftlfsvtehbcg8w7k','.eJxVjMESgiAURf_lbXMcAUFp1bTvG5gHPINKbEDbNP17Wm3annPufcI9TIlMWkZLGfaw00xLrhrNWiWggljMg3IcInnYz3mhCpbyKdGGWAJdE8aMj8N5xHir3TTCt4hrzyowuMzBbMBsBBj8MYvuSmkT_oLpPK0Hac7R1ltS_2ypT5On2_HX_h0ELGFd295i77lz3qEnJTnXQnFyjWReWtHLxpGiduikaBg61EPbtVrpTgxKeEbwegOIEldG:1n3HFZ:u-ryT6SoVnpzchfLMqmYJtmC39N6vRLkuc-8KyfDMM8','2022-01-14 12:43:13.347635'),('goolyzowsywy5p9eb5a8ulhq5zy64kpz','eyJwaG9uZV9udW1iZXIiOiIrOTE5NTI2MDkxNDYzIiwiaXNfdmVyaWZpZWQiOnRydWV9:1mxqAp:gJxEBlP6IvawE6WVZNjanTmua9URY86c1RgCiiz3a2M','2021-12-30 12:47:51.962848'),('holbnx4x2d5lbffr5mvi6xb9qoavkq2h','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n4FyQ:H-SI11znqSdMIkB0v6CeoXMdS4GAqQa2HxmbnA2xY7s','2022-01-17 05:33:34.535244'),('ibzjsdw9lq3m0htufssxl8nez32s6bd5','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n3wtj:TcwK_xgKT5ZK88MFg6n-uKL5PWrAaLWoeBPLLqypdNs','2022-01-16 09:11:27.989449'),('igsw5fgd5zmpy2gjac1pd6t2msn88xgo','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n0eDg:QjI3X5fzBlbqyi9SBg-Sv0sjtd8u9_XmwQ1Dy1YAKGE','2022-01-07 06:38:24.373656'),('it81v8vhh9o7yuumf5doetb3ib49wqux','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n2T57:8F1tsYM-bQIKzSJkBZ2KiTopqKyD1pjtO9SnbM7y91o','2022-01-12 07:09:05.953381'),('jwrnza1pyvpxxzqxa194pb8c09pi5z9k','.eJxVjjsOgzAQRO_iOiAbr70mVZQ-Z0Brew0kASQ-VZS7B0c0VCPN52k-ot14WcVVgEyQNENRS1QFVKSL2qEpWEtP7KUjX4mLaGhbu2ZbeG76uM_M2fMUXjzmID5pbKcyTOM6977MlfJIl_IxRX7fj-4J0NHS5TUYrxHBGsCQbASpAhollYbEkZkpIeyHsaqdktpiVA4UaMeBrA4ZSnHoxx3119vMFPt1vzOI7w_kl0z3:1n7f6i:o_pCdF0KtXY5ka-YdP9KJ_4wck8sccSz-D0jz9vqtjc','2022-01-26 15:00:12.229215'),('k4rvdb6x5tq7iqk1fro9fcjcrpu153kz','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n2pyF:cWbp6YOsYhrbWqKUvbYdnko9oDIL0TjHTHUrnRzaRDY','2022-01-13 07:35:31.688114'),('k5prj5k1l4hfsr2ru7l7iby3u0dqbcm8','eyJhZG1pbiI6MX0:1mvgUu:vIzBeKh4tkGUBU8Hh1WdeIsLiZc3pNf-1xCVvw5r1FY','2021-12-24 14:03:40.904814'),('mc9p77zbj3cimv3d72f92b9btstagqsn','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n3Bpf:I_F3zK9vGl9b5WAheWgg7XatStQB4BFxF72PdH9ke0M','2022-01-14 06:56:07.394537'),('mx5kf4ih3r97q9y5unamajdli5gvj2l6','.eJxVjksOgzAMRO-SdUEEO3Hoquq-Z0AmcYC2gMRnVfXuDRUbVpY8M0_vo9pNllVdlXUOEE2TcUOUYUTMKg02cxa0GIhSCqmLqnlbu3pbZK77kGbm_GvYv2Tcg_DksZ1yP43r3Df5XsmPdMkfU5D3_eieAB0v3b5OJkCE1iD5aAMW2pPRhQaMEkSEIyXHSGXldAGWgnaoEZx4tuB3KIehHxPqf2-zcOjXpDOo7w-GyUyG:1n7X9C:XbSyctCRHiV-rlcFzE1-nXNzSRDVR1T8YG3xrR-jHHQ','2022-01-26 06:30:14.043687'),('udt4nlrsc8snvc9qcq1u33inzphwedk9','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n2tb5:LZMRUFwzWyC1Cpxz0mWSQvLGz0uzcsFV0cF2aF0KQhY','2022-01-13 11:27:51.175493'),('uzh5s720iz179f2dpysh2dmpajywr5k1','.eJxVjMESgiAURf_lbXMcAUFp1bTvG5gHPINKbEDbNP17Wm3annPufcI9TIlMWkZLGfaw00xLrhrNWiWggljMg3IcInnYz3mhCpbyKdGGWAJdE8aMj8N5xHir3TTCt4hrzyowuMzBbMBsBBj8MYvuSmkT_oLpPK0Hac7R1ltS_2ypT5On2_HX_h0ELGFd295i77lz3qEnJTnXQnFyjWReWtHLxpGiduikaBg61EPbtVrpTgxKeEbwegOIEldG:1n4jNQ:mdADi1U1bvSMbPBu8SdFJe-XeIRYEMxqfx1t4SoyFj4','2022-01-18 12:57:20.515316'),('vipfdos43h6r4mruwdrsx50z1b9c70vd','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n664Y:Uh7xNpkVE9TX_II3D2PuOc4u7hzQwLM4oa21NWg0rHQ','2022-01-22 07:23:30.939019'),('y3ojqrdkd4xpomux90dhk871xcz8exg2','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n23ft:cpPUp8KeGHalENenFStsgyU5OGWq8DgEvv3PJryffVg','2022-01-11 04:01:21.567297'),('y4mx21esq36rajygkwlyvakfbo7s0hcm','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n4aan:D5pT09MUm-fh5q1ktFw2z9HsHubZt_VUbRLWNkrSpNA','2022-01-18 03:34:33.865073'),('yw9fe1sabcv4dxk9sa34nc6rftjhj2qg','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n25MR:KxoPU-oMjp4qmbLWb90MDA-qeA6qS6T3bcA7h1KaQP0','2022-01-11 05:49:23.994811'),('z1rcktrmtc8987w9v4ihdanpjk902ndd','.eJxVjjsOwjAQRO_iGlkxXnsDFUrPGaKNd00MxJHyqRB3J0YpoBppPk_zUi2tS9-us0xtYnVWTh1-vY7CQ3IJ-E75Nuow5mVKnS4Vvaezvo4sz2bv_gF6mvuyBtdZRPAOMETPUJmAzlTGQhQWEYoIESIeT7WprEc2NRiwtQTyNhQo8ZDyhvrqZRLitGx3BvX-ACOrQKY:1n14fI:JHp2x_XpiCQXgX2r4ZWvGNcvy3el0sChb6Y6BJpVM-c','2022-01-08 10:52:40.410326'),('zi5dic0r24f9ori326rzodb8x3ibevhd','.eJxVjMESgiAURf_lbXMcAUFp1bTvG5gHPINKbEDbNP17Wm3annPufcI9TIlMWkZLGfaw00xLrhrNWiWggljMg3IcInnYz3mhCpbyKdGGWAJdE8aMj8N5xHir3TTCt4hrzyowuMzBbMBsBBj8MYvuSmkT_oLpPK0Hac7R1ltS_2ypT5On2_HX_h0ELGFd295i77lz3qEnJTnXQnFyjWReWtHLxpGiduikaBg61EPbtVrpTgxKeEbwegOIEldG:1mzeAi:y1HH2hRCGlK9eI9xxbMPKjTnvR4cM9ZY1o5akyY5Vu8','2022-01-04 12:23:12.574763');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_twilio_twiliosmsdevice`
--

DROP TABLE IF EXISTS `otp_twilio_twiliosmsdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_twilio_twiliosmsdevice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `number` varchar(30) NOT NULL,
  `user_id` int NOT NULL,
  `throttling_failure_count` int unsigned NOT NULL,
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL,
  `token` varchar(16) DEFAULT NULL,
  `valid_until` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `otp_twilio_twiliosms_user_id_b8898b03_fk_accounts_` (`user_id`),
  CONSTRAINT `otp_twilio_twiliosms_user_id_b8898b03_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_twilio_twiliosmsdevice`
--

LOCK TABLES `otp_twilio_twiliosmsdevice` WRITE;
/*!40000 ALTER TABLE `otp_twilio_twiliosmsdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_twilio_twiliosmsdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cart`
--

DROP TABLE IF EXISTS `store_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime(6) NOT NULL,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `qty` int NOT NULL,
  `price` double NOT NULL,
  `is_coupon` tinyint(1) NOT NULL,
  `guest_user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_cart_book_id_c4eaa881_fk_adminpanel_books_id` (`book_id`),
  KEY `store_cart_user_id_99e99107_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `store_cart_book_id_c4eaa881_fk_adminpanel_books_id` FOREIGN KEY (`book_id`) REFERENCES `adminpanel_books` (`id`),
  CONSTRAINT `store_cart_user_id_99e99107_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cart`
--

LOCK TABLES `store_cart` WRITE;
/*!40000 ALTER TABLE `store_cart` DISABLE KEYS */;
INSERT INTO `store_cart` VALUES (41,'2021-12-31 04:19:04.418645',18,19,1,136,0,'True'),(94,'2022-01-03 05:32:41.968035',15,20,1,149.25,0,'True'),(117,'2022-01-07 12:41:16.170187',19,1,1,359.1,0,'True'),(168,'2022-01-12 05:31:32.421689',17,1,1,3015,0,'6883445b-ab77-4f44-9136-8631e53fe2e7'),(185,'2022-01-12 06:39:00.256947',11,24,1,169.15,0,'True'),(186,'2022-01-12 06:40:09.940311',26,24,1,296.1,0,'True'),(187,'2022-01-12 07:00:12.936231',15,1,2,298.5,0,'40f4f3e4-9071-42a3-9875-e30baeb08ab2');
/*!40000 ALTER TABLE `store_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon`
--

DROP TABLE IF EXISTS `store_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `discount` double NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon`
--

LOCK TABLES `store_coupon` WRITE;
/*!40000 ALTER TABLE `store_coupon` DISABLE KEYS */;
INSERT INTO `store_coupon` VALUES (5,'TRAVEL20',20,1),(6,'DEEPA20',20,1),(7,'REL50',50,1),(8,'TRAVEL15',15,1),(10,'TRAVEL50',50,1),(11,'READIT25',25,1),(13,'BOOK30',30,1),(14,'QWERTY123',90,1);
/*!40000 ALTER TABLE `store_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_coupon_entry`
--

DROP TABLE IF EXISTS `store_coupon_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_coupon_entry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime(6) NOT NULL,
  `coupon_id` int NOT NULL,
  `user_id` int NOT NULL,
  `discount_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_coupon_entry_coupon_id_cdb25913_fk_store_coupon_id` (`coupon_id`),
  KEY `store_coupon_entry_user_id_3cfded86_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `store_coupon_entry_coupon_id_cdb25913_fk_store_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `store_coupon` (`id`),
  CONSTRAINT `store_coupon_entry_user_id_3cfded86_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_coupon_entry`
--

LOCK TABLES `store_coupon_entry` WRITE;
/*!40000 ALTER TABLE `store_coupon_entry` DISABLE KEYS */;
INSERT INTO `store_coupon_entry` VALUES (79,'2021-12-30 09:42:47.958310',5,19,71.82),(80,'2021-12-30 11:28:48.368243',6,19,29.85),(86,'2021-12-31 05:29:38.295915',6,1,35.82),(92,'2021-12-31 07:40:28.363046',5,1,71.82),(103,'2022-01-02 10:16:01.485175',10,1,405),(104,'2022-01-02 10:21:49.928038',10,1,1507.5),(105,'2022-01-02 10:23:14.742080',10,1,1507.5),(106,'2022-01-02 10:25:00.363693',10,1,1507.5),(107,'2022-01-02 10:26:20.278491',10,1,1507.5),(108,'2022-01-02 10:26:56.581416',10,1,1507.5),(109,'2022-01-02 10:28:17.781720',7,1,40),(110,'2022-01-02 17:36:05.160245',11,1,94.5),(114,'2022-01-07 11:53:23.224746',13,1,161.4),(116,'2022-01-08 07:21:08.101415',14,22,399.03),(123,'2022-01-10 05:00:05.891920',14,17,566.19),(124,'2022-01-10 05:00:07.509064',14,17,566.19),(129,'2022-01-10 05:12:03.765928',14,17,566.19);
/*!40000 ALTER TABLE `store_coupon_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_couponorders`
--

DROP TABLE IF EXISTS `store_couponorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_couponorders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_couponorders_coupon_id_af95c953_fk_store_coupon_id` (`coupon_id`),
  KEY `store_couponorders_order_id_7ad6cdef_fk_store_order_id` (`order_id`),
  KEY `store_couponorders_user_id_b45b17f3_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `store_couponorders_coupon_id_af95c953_fk_store_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `store_coupon` (`id`),
  CONSTRAINT `store_couponorders_order_id_7ad6cdef_fk_store_order_id` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`id`),
  CONSTRAINT `store_couponorders_user_id_b45b17f3_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_couponorders`
--

LOCK TABLES `store_couponorders` WRITE;
/*!40000 ALTER TABLE `store_couponorders` DISABLE KEYS */;
INSERT INTO `store_couponorders` VALUES (7,5,7,1),(8,6,8,1),(13,10,23,1),(14,7,24,1),(15,11,25,1),(16,13,37,1),(17,14,39,22),(18,14,43,17);
/*!40000 ALTER TABLE `store_couponorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mode` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total` double NOT NULL,
  `address_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `is_active` int NOT NULL,
  `is_coupon` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_order_address_id_a7250f1a_fk_accounts_address_id` (`address_id`),
  KEY `store_order_user_id_ae5f7a5f_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `store_order_address_id_a7250f1a_fk_accounts_address_id` FOREIGN KEY (`address_id`) REFERENCES `accounts_address` (`id`),
  CONSTRAINT `store_order_user_id_ae5f7a5f_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
INSERT INTO `store_order` VALUES (1,'Pay on Delivery','Delivered',808.2,19,17,'2021-12-29 00:00:00.000000',1,1),(2,'Pay on Delivery','Delivered',305.1,19,17,'2021-12-29 00:00:00.000000',1,1),(3,'Pay on Delivery','Delivered',206.25,19,17,'2021-12-29 00:00:00.000000',1,1),(4,'Pay on Delivery','Delivered',143.28,19,17,'2021-12-29 00:00:00.000000',1,1),(5,'Razorpay','Delivered',815.8,23,19,'2021-12-30 00:00:00.000000',1,1),(7,'Razorpay','Delivered',287.28,23,19,'2021-12-30 00:00:00.000000',1,1),(8,'Razorpay','Cancelled',119.4,23,19,'2021-12-30 00:00:00.000000',0,1),(9,'Pay on Delivery','Dispatched',136,23,19,'2021-12-30 00:00:00.000000',1,0),(10,'Pay on Delivery','Delivered',179.1,18,1,'2021-12-31 00:00:00.000000',1,0),(11,'Razorpay','Delivered',179.1,15,1,'2021-12-31 00:00:00.000000',1,0),(12,'Paypal','Placed',126,18,1,'2021-12-31 00:00:00.000000',1,0),(13,'Pay on Delivery','Placed',136,18,1,'2021-12-31 00:00:00.000000',1,0),(14,'Pay on Delivery','Placed',270,18,1,'2021-12-31 00:00:00.000000',1,0),(15,'Pay on Delivery','Placed',296.1,18,1,'2022-01-01 00:00:00.000000',1,0),(16,'Razorpay','Cancelled',314.55,18,1,'2022-01-01 00:00:00.000000',0,0),(17,'Razorpay','Placed',405,18,1,'2022-01-02 00:00:00.000000',1,1),(18,'Razorpay','Cancelled',135,18,1,'2022-01-02 00:00:00.000000',0,0),(19,'Pay on Delivery','Delivered',1507.5,18,1,'2022-01-02 00:00:00.000000',1,1),(20,'Pay on Delivery','Placed',1507.5,18,1,'2022-01-02 00:00:00.000000',1,1),(21,'Pay on Delivery','Delivered',1507.5,18,1,'2022-01-02 00:00:00.000000',1,1),(22,'Pay on Delivery','Cancelled',1507.5,18,1,'2022-01-02 00:00:00.000000',0,1),(23,'Pay on Delivery','Delivered',1507.5,18,1,'2022-01-02 00:00:00.000000',1,1),(24,'Pay on Delivery','Cancelled',40,18,1,'2022-01-02 00:00:00.000000',0,1),(25,'Razorpay','Delivered',283.5,15,1,'2022-01-02 00:00:00.000000',1,1),(26,'Paypal','Delivered',80,18,1,'2022-01-03 00:00:00.000000',1,0),(27,'Razorpay','Delivered',2800,18,1,'2022-01-03 00:00:00.000000',1,0),(28,'Pay on Delivery','Dispatched',2800,18,1,'2022-01-04 00:00:00.000000',1,0),(29,'Pay on Delivery','Placed',2800,18,1,'2022-01-04 00:00:00.000000',1,0),(30,'Pay on Delivery','Placed',5600,18,1,'2022-01-04 00:00:00.000000',1,0),(31,'Paypal','Delivered',238,18,1,'2022-01-04 00:00:00.000000',1,0),(32,'Pay on Delivery','Delivered',2800,18,1,'2022-01-04 00:00:00.000000',1,0),(33,'Pay on Delivery','Placed',9045,18,1,'2022-01-04 00:00:00.000000',1,0),(34,'Pay on Delivery','Delivered',378,18,1,'2022-01-04 00:00:00.000000',1,0),(35,'Razorpay','Delivered',592.2,18,1,'2022-01-04 00:00:00.000000',1,0),(36,'Pay on Delivery','Placed',140.096,25,21,'2022-01-07 00:00:00.000000',1,0),(37,'Paypal','Dispatched',376.6,18,1,'2022-01-07 00:00:00.000000',1,1),(38,'Razorpay','Cancelled',2473.8,27,22,'2022-01-08 00:00:00.000000',0,0),(39,'Razorpay','Placed',44.33699999999999,27,22,'2022-01-08 00:00:00.000000',0,1),(40,'Razorpay','Delivered',2157.3,19,17,'2022-01-09 00:00:00.000000',1,0),(41,'Razorpay','Placed',378,19,17,'2022-01-09 00:00:00.000000',1,0),(42,'Razorpay','Placed',9324.3,19,17,'2022-01-09 00:00:00.000000',1,0),(43,'Pay on Delivery','Delivered',62.91,19,17,'2022-01-10 00:00:00.000000',1,1),(44,'Pay on Delivery','Placed',80,19,17,'2022-01-10 00:00:00.000000',1,0),(45,'Pay on Delivery','Placed',80,19,17,'2022-01-10 00:00:00.000000',1,0);
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_orderitems`
--

DROP TABLE IF EXISTS `store_orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_orderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `price` double NOT NULL,
  `book_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_orderitems_book_id_15ebf18e_fk_adminpanel_books_id` (`book_id`),
  KEY `store_orderitems_order_id_78989df1_fk_store_order_id` (`order_id`),
  CONSTRAINT `store_orderitems_book_id_15ebf18e_fk_adminpanel_books_id` FOREIGN KEY (`book_id`) REFERENCES `adminpanel_books` (`id`),
  CONSTRAINT `store_orderitems_order_id_78989df1_fk_store_order_id` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_orderitems`
--

LOCK TABLES `store_orderitems` WRITE;
/*!40000 ALTER TABLE `store_orderitems` DISABLE KEYS */;
INSERT INTO `store_orderitems` VALUES (1,1,152.23,11,1),(2,1,629.1,13,1),(3,1,179.1,11,2),(4,1,63,12,2),(6,1,143.28,11,4),(7,1,359.1,19,5),(8,3,456.7,11,5),(10,1,287.28,19,7),(11,1,119.4,15,8),(12,1,136,18,9),(13,1,179.1,11,10),(14,1,179.1,11,11),(15,1,126,12,12),(16,1,136,18,13),(17,2,270,16,14),(18,1,296.1,26,15),(19,1,135,16,16),(20,1,359.1,19,16),(21,1,810,14,17),(22,1,135,16,18),(23,1,3015,17,19),(24,1,3015,17,20),(25,1,3015,17,21),(26,1,3015,17,22),(27,1,3015,17,23),(28,1,80,23,24),(29,1,378,27,25),(30,1,80,23,26),(31,1,2800,21,27),(32,1,2800,21,28),(33,1,2800,21,29),(34,2,5600,21,30),(35,2,238,18,31),(36,1,2800,21,32),(37,3,9045,17,33),(38,3,378,12,34),(39,2,592.2,26,35),(40,1,175.12,11,36),(41,2,160,23,37),(42,1,378,27,37),(43,3,1077.3,19,38),(44,5,1396.5,28,38),(45,1,175.12,11,39),(46,1,149.25,15,39),(47,1,119,18,39),(48,3,1887.3,13,40),(49,2,270,16,40),(50,1,378,27,41),(51,3,9045,17,42),(52,1,279.3,28,42),(53,1,629.1,13,43),(54,1,80,23,44),(55,1,80,23,45);
/*!40000 ALTER TABLE `store_orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_payment`
--

DROP TABLE IF EXISTS `store_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mode` varchar(50) NOT NULL,
  `status` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_payment_order_id_b5ee0383_fk_store_order_id` (`order_id`),
  CONSTRAINT `store_payment_order_id_b5ee0383_fk_store_order_id` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_payment`
--

LOCK TABLES `store_payment` WRITE;
/*!40000 ALTER TABLE `store_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_wishlist`
--

DROP TABLE IF EXISTS `store_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` datetime(6) NOT NULL,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `guest_user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_wishlist_book_id_550184a7_fk_adminpanel_books_id` (`book_id`),
  KEY `store_wishlist_user_id_afcc4e88_fk_accounts_account_id` (`user_id`),
  CONSTRAINT `store_wishlist_book_id_550184a7_fk_adminpanel_books_id` FOREIGN KEY (`book_id`) REFERENCES `adminpanel_books` (`id`),
  CONSTRAINT `store_wishlist_user_id_afcc4e88_fk_accounts_account_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_wishlist`
--

LOCK TABLES `store_wishlist` WRITE;
/*!40000 ALTER TABLE `store_wishlist` DISABLE KEYS */;
INSERT INTO `store_wishlist` VALUES (1,'2021-12-14 12:56:11.375637',15,7,'True'),(2,'2021-12-14 13:28:50.489148',11,7,'True'),(3,'2021-12-14 13:29:11.891639',14,7,'True'),(4,'2021-12-14 13:39:20.502902',12,7,'True'),(17,'2021-12-17 12:30:51.516193',19,16,'True'),(18,'2021-12-17 12:31:16.324489',18,16,'True'),(24,'2021-12-25 06:30:35.003622',15,18,'True'),(40,'2022-01-09 13:49:46.846424',15,17,'True');
/*!40000 ALTER TABLE `store_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-13  1:22:11
