-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: od
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `logidrone`
--

DROP TABLE IF EXISTS `logidrone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logidrone` (
  `id_logidrone` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `alt_rel` varchar(255) DEFAULT NULL,
  `alt_abs` varchar(255) DEFAULT NULL,
  `voltage_bat` varchar(255) DEFAULT NULL,
  `current_bat` varchar(255) DEFAULT NULL,
  `level_bat` varchar(255) DEFAULT NULL,
  `pitch` varchar(255) DEFAULT NULL,
  `yaw` varchar(255) DEFAULT NULL,
  `roll` varchar(255) DEFAULT NULL,
  `vx` varchar(255) DEFAULT NULL,
  `vy` varchar(255) DEFAULT NULL,
  `vz` varchar(255) DEFAULT NULL,
  `fixtype` varchar(255) DEFAULT NULL,
  `satellitesvisible` varchar(255) DEFAULT NULL,
  `eph` varchar(255) DEFAULT NULL,
  `epv` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `groundspeed` varchar(255) DEFAULT NULL,
  `airspeed` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `system-status` varchar(255) DEFAULT NULL,
  `armed` varchar(255) DEFAULT NULL,
  `is-armable` varchar(255) DEFAULT NULL,
  `ekf-ok` varchar(255) DEFAULT NULL,
  `routeidrone_id_routeidrone` bigint(20) NOT NULL,
  `routeidrone_user_id_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id_logidrone`,`routeidrone_id_routeidrone`,`routeidrone_user_id_user`),
  KEY `fk_logidrone_routeidrone1_idx` (`routeidrone_id_routeidrone`,`routeidrone_user_id_user`),
  CONSTRAINT `fk_logidrone_routeidrone1` FOREIGN KEY (`routeidrone_id_routeidrone`, `routeidrone_user_id_user`) REFERENCES `routeidrone` (`id_routeidrone`, `user_id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=772608 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-09 18:26:51
