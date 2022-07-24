-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: nodus
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `Nome` varchar(45) NOT NULL,
  `Artista` varchar(45) NOT NULL,
  `Tipo` varchar(45) DEFAULT 'Album',
  `NumeroBrani` int NOT NULL DEFAULT '1',
  `AnnoUscita` int NOT NULL,
  PRIMARY KEY (`Nome`,`Artista`),
  KEY `ArtistaAlbum_idx` (`Artista`),
  CONSTRAINT `ArtistaAlbum` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES ('Comfort Eagle','Cake','Album',4,2001),('Different Class','Pulp','Album',2,1995),('Nilsson Schmilsson','Harry Nilsson','Album',2,1971),('Sinking Ship','Cake','Singolo',1,2018);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `Username` varchar(45) NOT NULL,
  `CasaDiscografica` varchar(45) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Nazionalità` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`),
  KEY `CasaDiscografica_idx` (`CasaDiscografica`),
  CONSTRAINT `CasaDiscograficaArtista` FOREIGN KEY (`CasaDiscografica`) REFERENCES `casadiscografica` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UtenteArtista` FOREIGN KEY (`Username`) REFERENCES `utente` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES ('Cake','Columbia Records','Band','USA'),('Harry Nilsson','RCA Records','Cantante/Compositore','USA'),('Pulp','Fire Records','Band','Regno Unito');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biografia`
--

DROP TABLE IF EXISTS `biografia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biografia` (
  `Artista` varchar(45) NOT NULL,
  `Biografia` text NOT NULL,
  PRIMARY KEY (`Artista`),
  CONSTRAINT `ArtistaBiografia` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biografia`
--

LOCK TABLES `biografia` WRITE;
/*!40000 ALTER TABLE `biografia` DISABLE KEYS */;
INSERT INTO `biografia` VALUES ('Cake','Best-known for their ubiquitous hit \"The Distance,\" Cake epitomized the postmodern, irony-drenched aesthetic of \'90s geek rock. Their sound freely mixed and matched pastiches of widely varying genres -- white-boy funk, hip-hop, country, new wave pop, jazz, college rock, and guitar rock -- with a particular delight in the clashes that resulted. Their songs were filled with lyrical non-sequiturs, pop-culture references, and smirky satire, all delivered with bone-dry detachment by speak/singing frontman John McCrea. Cake\'s music most frequently earned comparisons to Soul Coughing and King Missile, but lacked the downtown New York artiness of those two predecessors; instead, Cake cultivated an image of average guys with no illusions and pretensions about their role as entertainers. At the same time, critics lambasted what they saw as a smugly superior attitude behind the band\'s habitual sarcasm. Perhaps there was something in Cake\'s doggedly spare, low-key presentation that amplified their ironic detachment even when they didn\'t intend it, but most reviewers pegged them as one-hit wonders after the success of \"The Distance.\" Nonetheless, Cake managed a few more alternative radio hits in the years that followed, while largely retaining the same approach.'),('Harry Nilsson','Grammy Award-winner Harry Nilsson, hailed as a genius and recognized by his peers as one of the greatest singer-songwriters of the twentieth century, began life humbly in Brooklyn, New York, June 15 1941. Abandoned by his father (his mother said he had been killed in the war – a story Harry found out many years later was untrue), Harry, along with his mother and half-sister, moved to Southern California. The ensuing years found him uprooted again, bouncing from relative to relative and place to place, finally returning to Los Angeles – this time to stay.'),('Pulp','Most bands hit the big time immediately and fade away, or they build a dedicated following and slowly climb their way to the top. Pulp didn\'t follow either route. For the first 12 years of their existence, Pulp languished in near total obscurity, releasing a handful of albums and singles in the \'80s to barely any attention. At the turn of the decade, the group began to gain an audience, sparking a remarkable turn of events that made the band one of the most popular British groups of the \'90s. By the time Pulp became famous, the band had gone through numerous different incarnations and changes in style, covering nearly every indie rock touchstone from post-punk to dance. Pulp\'s signature sound is a fusion of David Bowie and Roxy Music\'s glam rock, disco, new wave, acid house, Europop, and British indie rock. The group\'s cheap synthesizers and sweeping melodies reflect the lyrical obsessions of lead vocalist Jarvis Cocker, who alternates between sex and sharp, funny portraits of working class misfits. Out of second-hand pop, Pulp fashioned a distinctive, stylish sound that made camp into something grand and glamorous that retained a palpable sense of gritty reality.');
/*!40000 ALTER TABLE `biografia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branipreferiti`
--

DROP TABLE IF EXISTS `branipreferiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branipreferiti` (
  `Utente` varchar(45) NOT NULL,
  `NumeroBrani` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Utente`),
  CONSTRAINT `BranPrefUtente` FOREIGN KEY (`Utente`) REFERENCES `utente` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branipreferiti`
--

LOCK TABLES `branipreferiti` WRITE;
/*!40000 ALTER TABLE `branipreferiti` DISABLE KEYS */;
INSERT INTO `branipreferiti` VALUES ('Utente1','3'),('Utente2','1');
/*!40000 ALTER TABLE `branipreferiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brano`
--

DROP TABLE IF EXISTS `brano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brano` (
  `Nome` varchar(45) NOT NULL,
  `Artista` varchar(45) NOT NULL,
  `Genere` varchar(45) NOT NULL,
  `Durata` int NOT NULL,
  `FileAudio` varchar(45) NOT NULL,
  PRIMARY KEY (`Nome`,`Artista`,`Genere`),
  KEY `ArtistaBrano_idx` (`Artista`),
  KEY `GenereBrano_idx` (`Genere`),
  CONSTRAINT `ArtistaBrano` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `GenereBrano` FOREIGN KEY (`Genere`) REFERENCES `genere` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brano`
--

LOCK TABLES `brano` WRITE;
/*!40000 ALTER TABLE `brano` DISABLE KEYS */;
INSERT INTO `brano` VALUES ('Coconut','Harry Nilsson','Novelty',232,'Coconut.mp3'),('Comfort Eagle','Cake','Alternative Rock',220,'ComfortEagle.mp3'),('Common People','Pulp','British Pop',350,'CommonPeople.mp3'),('Disco 2000','Pulp','Pop Rock',273,'Disco2000.mp3'),('Gotta Get Up','Harry Nilsson','Pop',144,'GottaGetUp.mp3'),('Shadow Stabbing','Cake','Pop Rock',312,'ShadowStabbing.mp3'),('Short Skirt Long Jacket','Cake','Alternative Rock',197,'ShortSkirtLongJacket.mp3'),('Sinking Ship','Cake','Alternative Rock',263,'SinkingShip.mp3'),('World of Two','Cake','Alternative Rock',230,'WorldofTwo.mp3');
/*!40000 ALTER TABLE `brano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casadiscografica`
--

DROP TABLE IF EXISTS `casadiscografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casadiscografica` (
  `Nome` varchar(45) NOT NULL,
  `Stato` varchar(45) NOT NULL,
  `SedePrincipale` varchar(45) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casadiscografica`
--

LOCK TABLES `casadiscografica` WRITE;
/*!40000 ALTER TABLE `casadiscografica` DISABLE KEYS */;
INSERT INTO `casadiscografica` VALUES ('Columbia Records','USA','New York'),('DC. Records','USA','Boston'),('Fire Records','Regno Unito','Londra'),('RCA Records','USA','New York');
/*!40000 ALTER TABLE `casadiscografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodio`
--

DROP TABLE IF EXISTS `episodio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodio` (
  `Utente` varchar(45) NOT NULL,
  `Podcast` varchar(45) NOT NULL,
  `Numero` int NOT NULL,
  `Durata` int NOT NULL,
  `FileAudio` varchar(45) NOT NULL,
  PRIMARY KEY (`Utente`,`Numero`,`Podcast`),
  KEY `PodcEpis_idx` (`Utente`,`Podcast`),
  CONSTRAINT `PodcastEpisodio` FOREIGN KEY (`Utente`, `Podcast`) REFERENCES `podcast` (`Utente`, `Nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodio`
--

LOCK TABLES `episodio` WRITE;
/*!40000 ALTER TABLE `episodio` DISABLE KEYS */;
INSERT INTO `episodio` VALUES ('Utente1','Il Meteo',1,200,'IlMeteo1.mp3'),('Utente1','Il Meteo',2,140,'IlMeteo2.mp3');
/*!40000 ALTER TABLE `episodio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `episodio_AFTER_INSERT` AFTER INSERT ON `episodio` FOR EACH ROW BEGIN
	UPDATE podcast SET NumeroEpisodi = NumeroEpisodi + 1 WHERE Utente = NEW.Utente AND Nome = new.Podcast;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `genere`
--

DROP TABLE IF EXISTS `genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genere` (
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genere`
--

LOCK TABLES `genere` WRITE;
/*!40000 ALTER TABLE `genere` DISABLE KEYS */;
INSERT INTO `genere` VALUES ('Alternative Rock'),('British Pop'),('Novelty'),('Pop'),('Pop Rock'),('Rock'),('Soft Rock');
/*!40000 ALTER TABLE `genere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inclusionealbum`
--

DROP TABLE IF EXISTS `inclusionealbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inclusionealbum` (
  `Album` varchar(45) NOT NULL,
  `Brano` varchar(45) NOT NULL,
  `Artista` varchar(45) NOT NULL,
  PRIMARY KEY (`Album`,`Brano`,`Artista`),
  KEY `BranoAlbum_idx` (`Brano`),
  KEY `ArtistaAlbumBrano_idx` (`Artista`),
  CONSTRAINT `AlbumInclusione` FOREIGN KEY (`Album`) REFERENCES `album` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ArtistaAlbumBrano` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BranoAlbum` FOREIGN KEY (`Brano`) REFERENCES `brano` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inclusionealbum`
--

LOCK TABLES `inclusionealbum` WRITE;
/*!40000 ALTER TABLE `inclusionealbum` DISABLE KEYS */;
INSERT INTO `inclusionealbum` VALUES ('Nilsson Schmilsson','Coconut','Harry Nilsson'),('Comfort Eagle','Comfort Eagle','Cake'),('Different Class','Common People','Pulp'),('Different Class','Disco 2000','Pulp'),('Nilsson Schmilsson','Gotta Get Up','Harry Nilsson'),('Comfort Eagle','Shadow Stabbing','Cake'),('Comfort Eagle','Short Skirt Long Jacket','Cake'),('Sinking Ship','Sinking Ship','Cake'),('Comfort Eagle','World of Two','Cake');
/*!40000 ALTER TABLE `inclusionealbum` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inclusionealbum_AFTER_INSERT` AFTER INSERT ON `inclusionealbum` FOR EACH ROW BEGIN
	 IF (select count(*) from inclusionealbum as ia where ia.Album = NEW.Album) = 1
		THEN UPDATE album AS a SET a.Tipo = "Singolo" WHERE a.Nome = NEW.Album;
	ELSE UPDATE album AS a SET a.Tipo = "Album" WHERE a.Nome = NEW.Album;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inclusionebranipreferiti`
--

DROP TABLE IF EXISTS `inclusionebranipreferiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inclusionebranipreferiti` (
  `Brano` varchar(45) NOT NULL,
  `Artista` varchar(45) NOT NULL,
  `Genere` varchar(45) NOT NULL,
  `Utente` varchar(45) NOT NULL,
  PRIMARY KEY (`Brano`,`Artista`,`Genere`,`Utente`),
  KEY `IncBranPrefUtente_idx` (`Utente`),
  CONSTRAINT `BranPreferBrano` FOREIGN KEY (`Brano`, `Artista`, `Genere`) REFERENCES `brano` (`Nome`, `Artista`, `Genere`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `IncBranPrefUtente` FOREIGN KEY (`Utente`) REFERENCES `utente` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inclusionebranipreferiti`
--

LOCK TABLES `inclusionebranipreferiti` WRITE;
/*!40000 ALTER TABLE `inclusionebranipreferiti` DISABLE KEYS */;
INSERT INTO `inclusionebranipreferiti` VALUES ('Coconut','Harry Nilsson','Novelty','Utente1'),('Comfort Eagle','Cake','Alternative Rock','Utente1'),('Short Skirt Long Jacket','Cake','Alternative Rock','Utente1'),('Common People','Pulp','British Pop','Utente2');
/*!40000 ALTER TABLE `inclusionebranipreferiti` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inclusionebranipreferiti_AFTER_INSERT` AFTER INSERT ON `inclusionebranipreferiti` FOR EACH ROW BEGIN
	
   IF NOT EXISTS (SELECT bp.Utente
		FROM branipreferiti AS bp
        WHERE bp.Utente = NEW.Utente) 
        THEN INSERT INTO branipreferiti (Utente, NumeroBrani) values (new.Utente, 0);
	
	END IF;
    
    UPDATE branipreferiti SET NumeroBrani = NumeroBrani + 1 WHERE Utente = NEW.Utente;
        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inclusionebranipreferiti_AFTER_DELETE` AFTER DELETE ON `inclusionebranipreferiti` FOR EACH ROW BEGIN
	UPDATE branipreferiti SET NumeroBrani = NumeroBrani - 1 WHERE Utente = OLD.Utente;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inclusioneplaylist`
--

DROP TABLE IF EXISTS `inclusioneplaylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inclusioneplaylist` (
  `Brano` varchar(45) NOT NULL,
  `Artista` varchar(45) NOT NULL,
  `Genere` varchar(45) NOT NULL,
  `Utente` varchar(45) NOT NULL,
  `Playlist` varchar(45) NOT NULL,
  PRIMARY KEY (`Brano`,`Playlist`,`Utente`,`Genere`,`Artista`),
  KEY `IncPlaylistBrano_idx` (`Brano`,`Artista`,`Genere`),
  KEY `IncPlaylistPlaylist_idx` (`Utente`,`Playlist`),
  CONSTRAINT `IncPlaylistBrano` FOREIGN KEY (`Brano`, `Artista`, `Genere`) REFERENCES `brano` (`Nome`, `Artista`, `Genere`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `IncPlaylistPlaylist` FOREIGN KEY (`Utente`, `Playlist`) REFERENCES `playlist` (`Utente`, `Nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inclusioneplaylist`
--

LOCK TABLES `inclusioneplaylist` WRITE;
/*!40000 ALTER TABLE `inclusioneplaylist` DISABLE KEYS */;
INSERT INTO `inclusioneplaylist` VALUES ('Common People','Pulp','British Pop','Utente1','Playlist con Pulp'),('Shadow Stabbing','Cake','Pop Rock','Utente1','Viva Cake'),('Comfort Eagle','Cake','Alternative Rock','Utente2','Il Meglio di Cake'),('Short Skirt Long Jacket','Cake','Alternative Rock','Utente2','Il Meglio di Cake');
/*!40000 ALTER TABLE `inclusioneplaylist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Inclusioneplaylist_AFTER_INSERT` AFTER INSERT ON `inclusioneplaylist` FOR EACH ROW BEGIN
	UPDATE playlist SET NumeroBrani = NumeroBrani + 1 WHERE Utente = NEW.Utente AND Nome = new.Playlist;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inclusioneplaylist_AFTER_DELETE` AFTER DELETE ON `inclusioneplaylist` FOR EACH ROW BEGIN
	UPDATE playlist SET NumeroBrani = NumeroBrani - 1 WHERE Utente = OLD.Utente AND Nome = OLD.Playlist;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `partecipazioneartista`
--

DROP TABLE IF EXISTS `partecipazioneartista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partecipazioneartista` (
  `Artista` varchar(45) NOT NULL,
  `NomeP` varchar(45) NOT NULL,
  `CognomeP` varchar(45) NOT NULL,
  PRIMARY KEY (`Artista`,`NomeP`,`CognomeP`),
  KEY `nome_idx` (`NomeP`,`CognomeP`),
  CONSTRAINT `ArtistaPartecipazione` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PersonaArtista` FOREIGN KEY (`NomeP`, `CognomeP`) REFERENCES `persona` (`Nome`, `Cognome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partecipazioneartista`
--

LOCK TABLES `partecipazioneartista` WRITE;
/*!40000 ALTER TABLE `partecipazioneartista` DISABLE KEYS */;
INSERT INTO `partecipazioneartista` VALUES ('Pulp','Candida','Doyle'),('Harry Nilsson','Harry','Nilsson'),('Pulp','Jarvis','Cocker'),('Cake','John','McCrea'),('Pulp','Mark','Webber'),('Pulp','Nick','Banks'),('Pulp','Steve','Mackey'),('Cake','Vince','DiFiore'),('Cake','Xan','McCurdy');
/*!40000 ALTER TABLE `partecipazioneartista` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `partecipazioneartista_AFTER_INSERT` AFTER INSERT ON `partecipazioneartista` FOR EACH ROW BEGIN
	
	 IF (select count(*) from partecipazioneartista as pa where pa.Artista = NEW.Artista) = 1
		THEN UPDATE artista AS ar SET ar.Tipo = "Cantante/Compositore" WHERE ar.Username = NEW.Artista;
	ELSE UPDATE artista AS ar SET ar.Tipo = "Band" WHERE ar.Username = NEW.Artista;
	END IF;


    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`Nome`,`Cognome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('Candida','Doyle'),('Harry','Nilsson'),('Jarvis','Cocker'),('John','McCrea'),('Mark','Webber'),('Nick','Banks'),('Steve','Mackey'),('Vince','DiFiore'),('Xan','McCurdy');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `Utente` varchar(45) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `NumeroBrani` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Utente`,`Nome`),
  CONSTRAINT `PlaylistUtente` FOREIGN KEY (`Utente`) REFERENCES `utente` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES ('Utente1','Playlist con Pulp',1),('Utente1','Viva Cake',1),('Utente2','Il Meglio di Cake',2);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podcast`
--

DROP TABLE IF EXISTS `podcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `podcast` (
  `Utente` varchar(45) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `NumeroEpisodi` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Utente`,`Nome`),
  CONSTRAINT `UtentePodcast` FOREIGN KEY (`Utente`) REFERENCES `utente` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podcast`
--

LOCK TABLES `podcast` WRITE;
/*!40000 ALTER TABLE `podcast` DISABLE KEYS */;
INSERT INTO `podcast` VALUES ('Utente1','Il Meteo',2);
/*!40000 ALTER TABLE `podcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testo`
--

DROP TABLE IF EXISTS `testo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testo` (
  `Brano` varchar(45) NOT NULL,
  `Artista` varchar(45) NOT NULL,
  `Testo` text NOT NULL,
  `Scrittore` text NOT NULL,
  `Storia` text,
  PRIMARY KEY (`Brano`,`Artista`),
  KEY `ArtistaTestoBrano_idx` (`Artista`),
  CONSTRAINT `ArtistaTestoBrano` FOREIGN KEY (`Artista`) REFERENCES `artista` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BranoTesto` FOREIGN KEY (`Brano`) REFERENCES `brano` (`Nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testo`
--

LOCK TABLES `testo` WRITE;
/*!40000 ALTER TABLE `testo` DISABLE KEYS */;
INSERT INTO `testo` VALUES ('Comfort Eagle','Cake','We are building a religion\nWe are building it bigger\nWe are widening the corridors\nAnd adding more lanes\n\nWe are building a religion\nA limited edition\nWe are now accepting callers\nfor these pendant key chains\n\nTo resist it is useless\nIt is useless to resist it\nHis cigarette is burning\nBut he never seems to ash\n\nHe is grooming his poodle\nHe is living comfort eagle\nYou can meet at his location\nBut you better come with cash\n\nNow his hat is on backwards\nHe can show you his tattoos\nHe is in the music business\nHe is calling you \'DUDE!\'\n\nNow today is tomorrow\nAnd tomorrow today\nAnd yesterday is weaving in and out\n\nAnd the fluffy white lines\nThat the airplane leaves behind\nAre drifting right in front\nof the waining of the moon\n\nHe is handling the money\nHe\'s serving the food\nHe knows about your party\nHe is calling you \'DUDE!\'\n\nNow do you believe\nIn the one big sign\nThe doublewide shine\nOn the bootheels of your prime\n\nDoesn\'t matter if you\'re skinny\nDoesn\'t matter if you\'re fat\nYou can dress up like a sultan\nIn your onion head hat\n\nWe are building a religion\nWe are making a brand\nWe\'re the only ones to turn to\nWhen your castles turn to sand\n\nTake a bite of this apple\nMr. corporate events\nTake a walk through the jungle\nOf cardboard shanties and tents\n\nSome people drink Pepsi\nSome people drink Coke\nThe wacky morning DJ\nSays democracy\'s a joke\n\nHe says now do you believe\nIn the one big song\nHe\'s now accepting callers\nWho would like to sing along\n\nShe says, do you believe\nIn the one true edge\nBy fastening your safety belts\nAnd stepping towards the ledge\n\nHe is handling the money\nHe is serving the food\nHe is now accepting callers\nHe is calling me \'DUDE!\'\n\nNow do you believe\nIn the one big sign\nThe doublewide shine\nOn the bootheels of your prime\n\nThere\'s no need to ask directions\nIf you ever lose your mind\nWe\'re behind you\nWe\'re behind you\nAnd let us please remind you\nWe can send a car to find you\nIf you ever lose your way\n\nWe are building a religion\n\nWe are building it bigger\n\nWe are building\n\nA religion\n\nA limited\n\nEdition\n\nWe are now accepting callers...\nFor these beautiful...\nPendant key chains','John McCrea',NULL),('Common People','Pulp','She came from Greece she had a thirst for knowledge\nShe studied sculpture at Saint Martin\'s College\nThat\'s where I\nCaught her eye\nShe told me that her dad was loaded\nI said, in that case I\'ll have rum and Coca-Cola\nShe said fine\nAnd then in thirty seconds time she said\nI wanna live like common people\nI wanna do whatever common people do\nWanna sleep with common people\nI wanna sleep with common people\nLike you\nOh what else could I do\nI said I\'ll, I\'ll see what I can do\nI took her to a supermarket\nI don\'t know why\nBut I had to start it somewhere\nSo it started there\nI said pretend you\'ve got no money\nShe just laughed and said\nOh you\'re so funny\nI said; yeah\nI can\'t see anyone else smiling in here\nAre you sure?\nYou wanna live like common people\nYou wanna see whatever common people see\nWanna sleep with common people\nYou wanna sleep with common people\nLike me\nBut she didn\'t understand\nShe just smiled and held my hand\nRent a flat above a shop\nCut your hair and get a job\nSmoke some fags and play some pool\nPretend you never went to school\nBut still you\'ll never get it right\n\'Cause when you\'re laid in bed at night\nWatching roaches climb the wall\nIf you called your dad he could stop it all, yeah\nYou\'ll never live like common people\nYou\'ll never do whatever common people do\nYou\'ll never fail like common people\nYou\'ll never watch your life slide out of view\nAnd you dance and drink and screw\nBecause there\'s nothing else to do\nSing along with the common people\nSing along and it might just get you through\nLaugh along with the common people\nLaugh along even though they\'re really laughing at you\nAnd the stupid things that you do\nBecause you think that poor is cool\nLike a dog lying in a corner\nThey will bite you and never warn you\nLook out, they\'ll tear your insides out\n\'Cause everybody hates a tourist\nEspecially one who thinks it\'s all such a laugh\nYeah and the chip stains and grease\nWill come out in the bath\nYou will never understand\nHow it feels to live your life\nWith no meaning or control\nAnd with nowhere left to go\nYou are amazed that they exist\nAnd they burn so bright\nWhilst you can only wonder why\nRent a flat above a shop\nCut your hair and get a job\nSmoke some fags and play some pool\nPretend you never went to school\nBut still you\'ll never get it right\n\'Cause when you\'re laid in bed at night\nWatching roaches climb the wall\nIf you called your dad he could stop it all\nYeah\nNever live like common people\nNever do what common people do\nNever fail like common people\nYou\'ll never watch your life slide out of view\nAnd then dance and drink and screw\nBecause there\'s nothing else to do\nWanna live with common people like you\nWanna live with common people like you\nWanna live with common people like you\nWanna live with common people like you\nWanna live with common people like you\nWanna live with common people like you\nI wanna live with common people like you\nOh, la, la, la, la\nOh, la, la, la, la\nOh, la, la, la, la\nOh, la, la, la, la\nOh you\n','Steve Mackey, Russel Senior, Nick Banks',NULL),('Disco 2000','Pulp','Oh, we were born within an hour of each other\nOur mothers said we could be sister and brother\nYour name is Deborah (Deborah)\nIt never suited ya\nAnd they said that when we grew up\nWe\'d get married, and never split up\nOh, we never did it, although I often thought of it\nOh, Deborah, do you recall?\nYour house was very small\nWith wood chip on the wall\nWhen I came \'round to call\nYou didn\'t notice me at all\nAnd I said, \'Let\'s all meet up in the year 2000\nWon\'t it be strange when we\'re all fully grown?\nBe there two o\'clock by the fountain down the road\'\nI never knew that you\'d get married\nI would be living down here on my own\nOn that damp and lonely Thursday years ago\nYou were the first girl at school to get breasts\nAnd Martyn said that you were the best\nOh, the boys all loved you, but I was a mess\nI had to watch them try and get you undressed\nWe were friends, that was as far as it went\nI used to walk you home sometimes but it meant\nOh, it meant nothing to you\n\'Cause you were so popular\nDeborah, do you recall?\nYour house was very small\nWith woodchip on the wall\nWhen I came \'round to call\nYou didn\'t notice me at all\nAnd I said, \'Let\'s all meet up in the year 2000\nWon\'t it be strange when we\'re all fully grown?\nBe there two o\'clock by the fountain down the road\'\nI never knew that you\'d get married\nI would be living down here on my own\nOn that damp and lonely Thursday years ago\nDo it\nOh, yeah\nOh, yeah\nNow Deborah, do you recall?\nOh, your house was very small\nWith wood chip on the wall\nAnd when I came \'round to call\nYou didn\'t notice me at all\nAnd I said, \'Let\'s all meet up in the year 2000\nWon\'t it be strange when we\'re all fully grown?\nBe there two o\'clock by the fountain down the road\'\nI never knew that you\'d get married\nI would be living down here on my own\nOn that damp and lonely Thursday years ago\nOh, what are you doing Sunday, baby?\nWould you like to come and meet me, maybe?\nYou can even bring your baby\nOoh ooh-ooh-ooh-ooh-ooh-ooh\nWhat are you doing Sunday, baby?\nWould you like to come and meet me, maybe?\nYou can even bring your baby\nOoh ooh-ooh-ooh-ooh-ooh-ooh\nOoh-ooh-ooh-ooh-ooh-ooh','Jarvis Branson Cocker, Candida Doyle, Mark Andrew Webber, Nick Banks',NULL),('Gotta Get Up','Harry Nilsson','Gotta get up, gotta get out\nGotta get home before the mornin\' comes\nWhat if I\'m late, gotta big date?\nGotta get home before the sun comes up\nUp and away, got a big day\nSorry can\'t stay, I gotta run, run yeah\nGotta get home, pick up the phone\nI gotta let the people know I\'m gonna be late\nThere was a time when we could dance until a quarter to ten\nWe never thought it would end then\nWe never thought it would end\nWe used to carry on and drink and do the rock and roll\nWe never thought we\'d get older\nWe never thought it\'d grow cold, but now\nGotta get up, gotta get out\nGotta get home before the mornin\' comes\nWhat if I\'m late, gotta big date?\nGotta get home before the sun comes up\nUp and away, got a big day\nSorry can\'t stay, I gotta run, run yeah\nGotta get home, pick up the phone\nI gotta let the people know I\'m gonna be late\nDown by the sea she knew a sailor who had been to war\nShe never even knew a sailor before\nShe never even knew his name\nHe\'d come to town and he would pound her for a couple of days\nAnd then he\'d sail across the bubbly waves\nAnd those were happier days, but now\nGotta get up, gotta get out\nGotta get home before the mornin\' comes\nWhat if I\'m late, gotta big date?\nGotta get home before the sun comes up\nUp and away, got a big day\nSorry can\'t stay, I gotta run, run yeah\nGotta get home, pick up the phone\nI gotta let the people know I\'m gonna be late','Harry Nilsson','\"Gotta Get Up\" is about the transition from carefree youth to adult responsibility. The song was originally attempted in March 1968 as a potential track for Nilsson\'s Aerial Ballet (1968) or Harry (1969). This earlier version of the song is cheerier and more uptempo than the recording that was released on Nilsson Schmilsson. The remake takes on a more serious tone and features an aleatoric crescendo at the end. Producer Richard Perry said that the addition was inspired by the number of takes devoted to the song: \"We had to do so many takes that we got cabin fever and started messing around, and Harry decided to incorporate the craziness in the song.\"[2]'),('Short Skirt Long Jacket','Cake','I want a girl with a mind like a diamond\nI want a girl who knows what\'s best\nI want a girl with shoes that cut\nAnd eyes that burn like cigarettes\n\nI want a girl with the right allocations\nWho\'s fast and thorough\nAnd sharp as a tack\nShe\'s playing with her jewelry\nShe\'s putting up her hair\nShe\'s touring the facility\nAnd picking up slack\n\nI want a girl with a short skirt and a lonnnng jacket......\n\nI want a girl who gets up early\nI want a girl who stays up late\nI want a girl with uninterrupted prosperity\nWho uses a machete to cut through red tape\nWith fingernails that shine like justice\nAnd a voice that is dark like tinted glass\n\nShe is fast and thorough\nAnd sharp as a tack\nShe\'s touring the facility\nAnd picking up slack\n\nI want a girl with a short skirt and a lonnnnng.... lonnng jacket\n\nI want a girl with a smooth liquidation\nI want a girl with good dividends\nAt Citibank we will meet accidentally\nWe\'ll start to talk when she borrows my pen\n\nShe wants a car with a cupholder arm rest\nShe wants a car that will get her there\nShe\'s changing her name from Kitty to Karen\nShe\'s trading her MG for a white Chrysler LeBaron\n\nI want a girl with a short skirt and a lonnnnggggggggg jacket','John McCrea',NULL);
/*!40000 ALTER TABLE `testo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `Username` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('Cake'),('Harry Nilsson'),('Pulp'),('Utente1'),('Utente2'),('Utente3');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nodus'
--

--
-- Dumping routines for database 'nodus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-05 19:05:35
