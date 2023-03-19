-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: artemis    Database: recappt
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `number` int NOT NULL DEFAULT '0',
  `icon_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Aardappels',4,'cookie'),(2,'Pasta',5,'bacon'),(3,'Salade',1,'seedling'),(4,'Brood',2,'bread-slice'),(5,'Ei',3,'egg'),(6,'Rijst',6,'bowl-rice'),(7,'Zoet',7,'cheese');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_seq`
--

DROP TABLE IF EXISTS `categories_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_seq`
--

LOCK TABLES `categories_seq` WRITE;
/*!40000 ALTER TABLE `categories_seq` DISABLE KEYS */;
INSERT INTO `categories_seq` VALUES (1);
/*!40000 ALTER TABLE `categories_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_category`
--

DROP TABLE IF EXISTS `recipe_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_category_FK_1` (`category_id`),
  KEY `recipe_category_FK_2` (`recipe_id`),
  CONSTRAINT `recipe_category_FK_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_category_FK_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_category`
--

LOCK TABLES `recipe_category` WRITE;
/*!40000 ALTER TABLE `recipe_category` DISABLE KEYS */;
INSERT INTO `recipe_category` VALUES (1,1,1),(2,2,2),(3,2,3),(4,3,3),(5,4,4),(6,5,4),(7,6,4),(8,7,4),(9,12,5),(10,11,5),(11,10,4),(12,9,4),(13,8,4),(14,14,1),(15,13,1),(16,15,2),(17,16,2),(18,17,2),(19,18,2),(20,19,2),(21,20,2),(22,21,6),(23,22,6),(24,23,7),(25,24,7),(26,25,7),(27,26,7),(28,27,7),(30,29,7),(31,30,2),(32,30,6),(33,31,7),(34,28,7),(35,32,7),(36,33,7),(37,34,7),(38,35,7),(39,36,1);
/*!40000 ALTER TABLE `recipe_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `unit_of_measurement` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `recipe_ingredients_FK` (`recipe_id`),
  CONSTRAINT `recipe_ingredients_FK` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,450,'g','aardappelpartjes','in schil'),(2,1,1,'','rode ui',''),(3,1,400,'g','broccoli','in roosjes'),(4,1,4,'el','olijfolie',''),(5,1,2,'el','ras el hanout',''),(6,1,140,'g','gerookte kipreepjes',''),(7,2,15,'g','basilicum',''),(8,2,0.5,'teen','knoflook','geperst'),(9,2,7,'el','olijfolie',''),(10,2,1,'tl','zout',''),(11,2,8,'','tomaten','in plakken'),(12,2,400,'g','mozzarell','in plakken'),(13,2,250,'g','lasagnebladen','(1 pak)'),(14,2,75,'g','rucola',''),(15,3,75,'g','veldsla',''),(16,3,150,'g','kersen',''),(17,3,125,'g','mozzarella',''),(18,3,0,'','saladecroutons',''),(19,3,0,'','olijfolie',''),(20,4,200,'g','zuurkool',''),(21,4,1,'blik','hotdogs','(8 hotdogs)'),(22,4,8,'plakjes','katenspek',''),(23,4,2,'el','olie',''),(24,4,4,'','pistolets',''),(25,4,2,'el','Zaanse mosterd',''),(26,5,1,'','ciabatta','of 4 ciabattina\'s'),(27,5,0,'','olijfolie',''),(28,5,2,'','tomaten','in plakken'),(29,5,200,'g','mozzarella','in plakken'),(30,5,0,'','Italiaanse kruiden',''),(31,6,8,'sneetjes','brood','eventueel zonder korst'),(32,6,0.5,'l','melk',''),(33,6,1,'','ei',''),(34,6,0,'','citroensap',''),(35,6,75,'g','krenten en rozijnen',''),(36,6,75,'g','suiker','(50 g voor de pap, 25 g voor de korst)'),(37,6,45,'g','boter','(40 g voor de pap, 5 g voor het invetten van de ovenschaal)'),(38,6,0,'','paneermeel',''),(39,6,0,'','kaneel',''),(40,7,200,'g','achterham',''),(41,7,1,'','rode ui',''),(42,7,3,'','tomaten',''),(43,7,3,'el','olijfolie',''),(44,7,400,'g','andijvie','gesneden'),(45,7,1,'el','Provençaalse kruiden',''),(46,7,1,'','stokbrood',''),(47,7,175,'g','geraspte kaas',''),(48,12,3,'','preien','gewassen en in ringen'),(49,12,5,'plakjes','hartige taartdeeg','ontdooid'),(50,12,100,'g','rauwe ham',''),(51,12,2,'tl','Provençaalse kruiden',''),(52,12,5,'','eieren',''),(53,12,250,'g','ricotta',''),(54,12,100,'g','Parmezaanse kaas','geraspt'),(55,11,200,'g','bloem',''),(56,11,1,'tl','paprikapoeder',''),(57,11,1,'','ei',''),(58,11,400,'ml','melk',''),(59,11,175,'g','geraspte kaas',''),(60,11,3,'','bosuitjes',''),(61,11,300,'g','maïskorrels',''),(62,11,1,'krop','sla',''),(63,11,250,'g','hamblokjes',''),(64,11,2,'el','olie',''),(65,11,0,'','yoghurtdressing',''),(66,10,450,'g','spinazie','deelblokjes diepvries'),(67,10,1,'','ui',''),(68,10,3,'el','olie',''),(69,10,500,'g','rundergehakt',''),(70,10,8,'','tortilla\'s',''),(71,10,0,'','burrito seasoning mix',''),(72,10,150,'g','geraspte kaas',''),(73,10,4,'','tomaten','in stukjes'),(74,10,125,'ml','zure room',''),(75,10,0,'','salsasaus',''),(76,9,75,'g','Gruyère kaas',''),(77,9,75,'g','Parmezaanse kaas',''),(78,9,100,'g','jonge kaas',''),(79,9,1,'','rode ui','in ringen'),(80,9,25,'g','rucola',''),(81,9,8,'','kleine, zachte taco\'s','Gorditas'),(82,9,0,'','zwarte peper',''),(83,8,0.25,'zakje','gist',''),(84,8,0.5,'tl','suiker',''),(85,8,125,'g','bloem',''),(86,8,1.5,'el','olie',''),(87,8,0,'','pizzabeleg',''),(88,1,0,'','peper',''),(89,1,0,'','zout',''),(90,14,150,'g','kipfilet',''),(91,14,0.5,'','Chinese kool',''),(92,14,1,'tl','kerriepoeder',''),(93,14,4,'','röstirondjes',''),(94,13,1,'','aardappel','groot'),(95,13,0.5,'el','boter','gesmolten'),(96,13,0.5,'el','geraspte kaas',''),(97,13,0.25,'el','paneermeel',''),(98,15,1,'','rode peper',''),(99,15,160,'g','pancetta','fijngesneden'),(100,15,1,'','ui','gesnipperd'),(101,15,1,'kg','Romatomaten','in blokken'),(102,15,0,'','pasta',''),(103,15,0,'','geraspte kaas',''),(104,16,125,'ml','slagroom',''),(105,16,2,'','eieren',''),(106,16,75,'g','geraspte kaas',''),(107,16,125,'g','spekreepjes',''),(108,16,2,'teentjes','knoflook',''),(109,16,0,'','peterselie',''),(110,16,0,'','zout',''),(111,16,0,'','peper',''),(112,16,0,'','pasta',''),(113,17,159,'g','spaghetti',''),(114,17,400,'g','witlof',''),(115,17,125,'g','hamblokjes',''),(116,17,75,'ml','slagroom',''),(117,17,0,'','geraspte kaas',''),(118,18,1,'teentje','knoflook',''),(119,18,1,'','ui',''),(120,18,150,'g','spekreepjes',''),(121,18,450,'g','spinazie',''),(122,18,200,'ml','crème fraîche',''),(123,18,0,'','zout',''),(124,18,0,'','peper',''),(125,18,0,'','Italiaanse kruiden',''),(126,18,250,'g','Spätzle',''),(127,19,250,'g','penne',''),(128,19,200,'g','kipfilet',''),(129,19,125,'g','champignons',''),(130,19,1,'','ui',''),(131,19,0.5,'','courgette',''),(132,19,2,'teentjes','knoflook',''),(133,19,0.5,'blokje','kippenbouillon',''),(134,19,75,'g','roomkaas',''),(135,19,100,'g','geraspte kaas',''),(136,19,50,'g','groene curry woksaus',''),(137,19,0,'','peterselie','fijn gehakt'),(138,20,300,'g','gehakt',''),(139,20,2,'teentjes','knoflook','fijngesneden'),(140,20,450,'g','spinazie','deelblokjes diepvries'),(141,20,250,'g','verse lasagnebladen',''),(142,20,200,'g','geraspte kaas',''),(143,20,125,'ml','slagroom',''),(144,22,350,'g','kipfilet',''),(145,22,0,'','bloem',''),(146,22,0,'','zout',''),(147,22,0,'','peper',''),(148,22,0,'','paprikapoeder',''),(149,22,0,'','peterselie',''),(150,22,0,'','Provençaalse kruiden',''),(151,22,4,'el','citroensap',''),(152,22,8,'el','boter',''),(153,22,0,'','rijst',''),(154,21,750,'g','varkensfilet',''),(155,21,0,'','zout',''),(156,21,0,'','peper',''),(157,21,2,'blikken','perzikhelften',''),(158,21,125,'g','geraspte kaas',''),(159,21,200,'g','crème fraîche',''),(160,21,1,'','ei',''),(161,21,1,'el','sausbindmiddel','maïzena'),(162,21,1,'el','oregano',''),(163,21,0,'','rijst',''),(164,23,550,'g','bloem',''),(165,23,1,'tl','zout',''),(166,23,1,'tl','bakpoeder',''),(167,23,1,'tl','vanille-extract',''),(168,23,180,'g','kristalsuiker',''),(169,23,180,'g','donkere basterdsuiker',''),(170,23,350,'g','pure chocolade',''),(171,23,2,'','eieren',''),(172,23,250,'g','boter','kamertemperatuur'),(173,24,1,'','ei',''),(174,24,150,'g','boter','koud'),(175,24,100,'g','witte basterdsuiker',''),(176,24,200,'g','bloem',''),(177,25,1,'vel','bladerdeeg op rol',''),(178,25,3,'','appels',''),(179,25,2,'el','citroensap',''),(180,25,7,'el','suiker',''),(181,25,2,'tl','kaneel',''),(182,25,0,'','poedersuiker',''),(183,26,150,'g','boter',''),(184,26,308,'g','Oreo\'s',''),(185,26,4,'','eieren',''),(186,26,200,'g','poedersuiker',''),(187,26,2,'el','maizena',''),(188,26,2,'tl','vanillearoma',''),(189,26,165,'g','kokos','gemalen'),(190,26,150,'g','witte chocolade',''),(191,29,250,'g','tarwebloem',''),(192,29,2,'tl','bakpoeder',''),(193,29,1,'tl','kaneel',''),(194,29,1,'mespunt','zout',''),(195,29,300,'g','bananen',''),(196,29,100,'g','boter',''),(197,29,200,'g','witte basterdsuiker',''),(198,29,8,'g','vanillesuiker',''),(199,29,2,'','eieren',''),(200,29,125,'ml','crème fraîche',''),(201,30,600,'g','goulashvlees',''),(202,30,400,'ml','runderbouillon',''),(203,30,300,'g','sjalotten',''),(204,30,200,'ml','droge rode wijn',''),(205,30,40,'g','tomatenpuree',''),(206,30,3,'el','boter',''),(207,30,1,'teentje','knoflook',''),(208,30,1,'tl','citroenrasp',''),(209,30,2,'tl','paprikapoeder',''),(210,30,0.5,'tl','oregano',''),(211,30,1,'mespunt','cayennepeper',''),(212,30,0,'','zout',''),(213,31,100,'g','zelfrijzend bakmeel',''),(214,31,50,'g','bruine basterdsuiker',''),(215,31,40,'g','roomboter',''),(216,31,2,'el','melk',''),(217,31,1,'tl','speculaaskruiden',''),(218,31,1,'mespunt','zout',''),(219,27,200,'g','kristalbloem',''),(220,27,1,'snufje','zout',''),(221,27,1,'el','olie',''),(222,27,100,'ml','water','lauwwarm'),(223,27,3,'el','citroensap',''),(224,27,75,'g','rozijnen',''),(225,27,4,'el','rum',''),(226,27,1.5,'kg','appels','zuur'),(227,27,150,'g','boter',''),(228,27,100,'g','paneermeel',''),(229,27,175,'g','suiker',''),(230,27,1,'tl','kaneel',''),(231,27,0,'','poedersuiker',''),(232,28,300,'ml','melk',''),(233,28,250,'ml','slagroom',''),(234,28,1,'','vanillestokje',''),(235,28,80,'g','suiker',''),(236,28,20,'g','maizena',''),(237,28,3,'','eidooiers',''),(238,32,200,'g','boter',''),(239,32,150,'g','poedersuiker',''),(240,32,0,'','zout',''),(241,32,4,'','eieren',''),(242,32,0,'','citroenrasp',''),(243,32,200,'g','bloem',''),(244,32,0.5,'zakje','bakpoeder',''),(245,32,1,'zakje','vanillesuiker',''),(246,32,250,'g','kersen',''),(247,32,0,'','poedersuiker','om te bestrooien'),(248,33,250,'g','boter','op kamertemperatuur'),(249,33,125,'g','poedersuiker',''),(250,33,1,'zakje','vanillesuiker',''),(251,33,7,'','eieren','eidooiers en eiwitten gesplitst'),(252,33,75,'g','suiker',''),(253,33,50,'g','maizena',''),(254,33,1,'tl','bakpoeder',''),(255,33,75,'g','hagelslag','of chocoladestukjes'),(256,33,125,'g','pure chocolade','voor het glazuur'),(257,33,125,'g','boter','voor het glazuur'),(258,34,375,'g','bloem',''),(259,34,0.5,'zakje','gist',''),(260,34,125,'g','roomboter','op kamertemperatuur'),(261,34,275,'g','suiker',''),(262,34,1,'','ei',''),(263,34,100,'ml','melk','op kamertemperatuur'),(264,34,500,'g','handappels',''),(265,34,500,'g','abrikozen','vers of uit blik'),(266,35,200,'g','roomboter','op kamertemperatuur'),(267,35,225,'g','suiker',''),(268,35,1,'zakje','vanillesuiker',''),(269,35,1,'','ei',''),(270,35,400,'g','zelfrijzend bakmeel','gezeefd'),(271,35,250,'g','moesappels',''),(272,35,150,'g','bosbossen',''),(273,35,1,'tl','kaneel',''),(274,36,2,'','pofaardappels',''),(275,36,150,'g','baconreepjes',''),(276,36,125,'g','zure room',''),(277,36,0,'','cheddar','geraspt'),(278,36,0,'','peterselie',''),(279,36,2,'el','bakboter','');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients_seq`
--

DROP TABLE IF EXISTS `recipe_ingredients_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients_seq`
--

LOCK TABLES `recipe_ingredients_seq` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients_seq` DISABLE KEYS */;
INSERT INTO `recipe_ingredients_seq` VALUES (1);
/*!40000 ALTER TABLE `recipe_ingredients_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_steps`
--

DROP TABLE IF EXISTS `recipe_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_steps` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recipe_id` bigint NOT NULL,
  `number` int NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_steps_FK` (`recipe_id`),
  CONSTRAINT `recipe_steps_FK` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_steps`
--

LOCK TABLES `recipe_steps` WRITE;
/*!40000 ALTER TABLE `recipe_steps` DISABLE KEYS */;
INSERT INTO `recipe_steps` VALUES (1,1,1,'Verwarm de oven voor op 200 °C (hetelucht). Snijd de uien in ringen.'),(2,1,2,'Verdeel de aardappel en ui over een met bakpapier beklede bakplaat. Besprenkel met 2 eetlepels olie en breng op smaak met peper en zout. Schep om en bak 10 minuten in de oven.'),(3,1,4,'Meng 2 eetlepels olie met 1 eetlepel ras el hanout. Schep de kruidenolie door de gerookte-kipreepjes.'),(4,1,7,'Haal de traybake uit de oven en verdeel over de borden.'),(5,2,2,'Maak in een ruime schaal een marinade van het basilicum, de knoflook, 6 el olie en het zout. Voeg de tomaten en mozzarella toe en schep om.'),(6,2,3,'Breng een pan water met wat zout en 1 el olie aan de kook en kook de lasagne­bladen in 8 min. beetgaar. Giet af.'),(7,2,1,'Snijd de tomaten en mozzarella in plakken. Pers de knoflook.'),(8,2,4,'Leg op 4 borden 1 lasagneblad en bedek met van de tomaat en mozzarella. Leg er wat rucola op en dek af met 1 lasagnevel. Maak zo nog 2 lagen, eindig met een lasagnevel. Schep de achtergebleven marinade over de lasagne. Lekker met geschaafde Parmezaanse kaas.'),(9,3,1,'Snijd de veldsla, kersen en mozzarella. Meng alles door elkaar.'),(10,3,2,'Dresseer de salade met olijfolie en Italiaanse kruiden. Serveer met croutons.'),(11,4,1,'Doe de zuurkool in een pan. Breng aan de kook. Laat op laag vuur 10 min. koken en laat uitlekken in een vergiet.'),(12,4,2,'Omwikkel ondertussen de hotdogs elk met 1 plakje spek. Verhit de olie in een koekenpan en bak de worsten in 4 min. goudbruin. Keer regelmatig.'),(13,4,3,'Snijd de pistolets overlangs doormidden en besmeer de onderste helften met de mosterd. Verdeel de zuurkool erover. Leg hierop 2 hotdogs. Leg de bovenkanten van de pistolets erop en serveer.'),(14,5,1,'Verwarm de oven voor op 200 °C.'),(15,5,2,'Leg de ciabatta in de oven totdat hij mooi bruin en knapperig is. Snijd ondertussen de tomaten en mozzarella in plakken.'),(16,5,3,'Snijd de ciabatta overlangs doormidden. Besprenkel beide helften met olijfolie. Leg de tomaten en mozzarella om en om op de ciabatta. Strooi er Italiaanse kruiden overheen. Serveer.'),(17,6,1,'Verwarm de oven voor op 180 °C.'),(18,6,2,'Verwarm de melk en maak hierin het brood fijn.'),(19,6,3,'Splits het ei. Voeg de eidooier samen met de krenten, rozijnen, 50 g suiker en 40 g boter toe aan de pap. Voeg enkele druppels citroensap toe.'),(20,6,4,'Klop het eiwit stijf. Haal de pap van het vuur en schep het eiwit er luchtig doorheen.'),(21,6,5,'Doe de pap in een met boter ingevette ovenschaal. Bestrooi het met paneermeel, suiker en kaneel. Leg er hier en daar een klontje boter op. Zet het in het midden van de oven totdat het een bruine korst heeft.'),(22,7,1,'Verwarm de oven voor op 180 °C. Snijd de ham in reepjes, de ui in ringen en de tomaten in plakken. Verhit de olie in een wok en roerbak de ham en ui 2 min. Voeg de tomaten, andijvie en kruiden toe en roerbak nog 8 min. Verdeel over de ovenschaal.'),(23,7,2,'Snijd het stokbrood in sneetjes van 1½ cm breed en dek de schotel daarmee dakpansgewijs af. Bestrooi met de kaas en bak in ca. 25 min. in het midden van de oven goudbruin.'),(24,12,1,'Verwarm de oven voor op 200 ºC. Leg de plakjes hartige taartdeeg op het aanrecht om te ontdooien. Was de prei en snij deze in ringen.'),(25,12,2,'Kook de prei 4 minuten in water. Giet het af en laat het uitlekken in een vergiet.'),(26,12,3,'Bekleed ondertussen een ingevette quichevorm met het hartige taartdeeg. Prik er met een vork gaatjes in. Zet het hartige taartdeeg voor 5 minuten in de oven.'),(27,12,4,'Klop ondertussen de eieren los in een kom. Meng de ricotta, Parmezaanse kaas, peper en Provençaalse kruiden erdoor. Schep de prei door dit mengsel.'),(28,12,5,'Haal de quichevorm uit de oven. Beleg de bodem met de helft van de ham. Giet de helft van het mengsel eroverheen. Beleg het mengsel met de rest van de ham en giet de rest van het mengsel eroverheen. Bak de taart in de oven goudbruin en gaar.'),(29,11,1,'Roer in een ruime schaal bloem met 1 tl zout, 1/2 theelepel peper, 1 tl paprikapoeder, 1 ei en 200 ml melk tot een dik beslag.'),(30,11,2,'Voeg nogmaals 200 ml melk en 100 ml water beetje voor beetje toe.'),(31,11,3,'Roer de kaas door het beslag heen.'),(32,11,4,'Maak de bosuitjes schoon en snijd ze in ringen. Laat de maïskorrels uitlekken. Maak de sla schoon en snijd deze in repen. Let op: bewaar nog een aantal hele slabladeren.'),(33,11,5,'Meng de bosuitjes, maïs, reepjes sla, ham en 1/2 tl peper in een ruime schaal.'),(34,11,6,'Verhit in koekenpannen wat olie. Schep een sauslepel beslag in elke pan en laat het beslag over de bodem lopen totdat de bodem bedekt is. Bak de flensjes aan beide kanten bruin.'),(35,11,7,'Leg op elk flensje een slablad, een paar lepels van het mengsel en 1 el dressing. Rol de flensjes op of vouw ze dubbel.'),(36,10,1,'Ontdooi de spinazie volgens de aanwijzingen op de verpakking. Verwarm de oven voor op 200 ºC.'),(37,10,2,'Snipper de ui. Verhit de olie in een braadpan en fruit de ui 1 min. Voeg het gehakt toe en bak in ca. 3 min. rul. Voeg de seasoningmix (uit de doos) en het water toe. Laat de spinazie in een zeef uitlekken. Druk met een lepel het vocht eruit. Schep de spinazie door het gehaktmengsel. Schep de kaas erdoor. Was de tomaten en snijd in stukjes.'),(38,10,3,'Verdeel het gehaktmengsel en de tomaat over de tortilla\'s en rol op. Vet de ovenschaal in. Leg de tortilla\'s in de ovenschaal, verdeel de room erover en bestrooi met de rest van de kaas. Laat de burrito\'s in ca. 15 min. in de oven bruin kleuren. Serveer met salsa (uit doos).'),(39,9,1,'Snijd de ui in ringen. Rasp de kaas en snij de kaas in kleine, dunne blokjes.'),(40,9,2,'Verdeel de drie soorten kaas, uiringen en rucola over 4 taco\'s. Bestrooi ze met wat peper. Dek ze af met de resterende taco\'s en druk ze goed aan.'),(41,9,3,'Verwarm de taco\'s in de magnetron, in een grillpan of op de barbecue totdat de kaas gesmolten is.'),(42,8,1,'Verwarm de oven voor op 200 ºC.'),(43,8,2,'Los in een kommetje de gist en de suiker op in 25 ml handwarm water. Roer het mengsel glad.'),(44,8,3,'Meng de bloem en het zout in een beslagkom door elkaar. Maak een kuiltje in het midden en schenk hierin de gistoplossing. Schenk de olie en 50 ml handwarm water erbij.'),(45,8,4,'Meng het pizzadeeg met de hand tot een samenhangende massa die van de wand van de kom loslaat. Het deeg is goed als het nog enigszins plakkerig aanvoelt (als een post-it). Te plakkerig = bloem toevoegen, te droog = water toevoegen.'),(46,8,5,'Maak van het deeg een bal en laat hem afgedekt 1 uur rijzen op een warme plek.'),(47,8,6,'Rol het pizzadeeg uit tot een cirkel met een diameter van 20 cm. Leg het pizzadeeg op de bakplaat en maak de randen iets dikker.'),(48,8,7,'Beleg de pizza naar wens en bak hem 15 minuten.'),(49,1,5,'Haal de traybake na 10 minuten uit de oven. Voeg de broccoliroosjes en 1 eetlepel ras el hanout toe en schep om. Bak nogmaals 10 minuten in de oven.'),(50,1,6,'Haal na 10 minuten de traybake weer uit de oven. Verdeel de kipreepjes erover en bak nog ca. 15 minuten.'),(51,14,1,'Bereid de röstirondjes volgens de gebruiksaanwijzing op de verpakking.'),(52,14,2,'Snijd de kipfilet en Chinese kool in stukjes.'),(53,14,3,'Verhit olijfolie in een wok. Bak de kipfilet gaar en voeg daarna de Chinese kool en kerriepoeder toe. Bak de kool in 3-5 minuten beetgaar.'),(54,13,1,'Verwarm de oven voor op 220 ºC.'),(55,13,2,'Schil de aardappel en leg hem even in een kom met koud water. Haal de aardappel uit het water, leg aan beide kanten van de aardappel een verhoging (bijvoorbeeld eetstokjes) en maak met een scherp mes inkepingen in de aardappel tot aan deze verhoging. De aardappel wordt dus niet volledig doorgesneden.'),(56,13,3,'Leg de aardappel met de gesneden kant naar boven in een ovenschaal. Verspreid de helft van de boter erover. Breng het op smaak met zout en peper.'),(57,13,4,'Bak de aardappel in de oven. Haal na 35-40 minuten de aardappel uit de oven en verdeel de resterende boter erover. Strooi de kaas en paneermeel over de aardappel. Leg de aardappel terug in de oven en bak hem nogmaals 20 minuten tot hij goudbruin is.'),(58,15,1,'Snijd het steeltje van de rode peper. Halveer de peper in de lengte en verwijder met een scherp mesje de zaadlijsten. Snijd het vruchtvlees in kleine stukjes. Snipper de ui. Snijd de pancetta in stukjes.'),(59,15,2,'Verhit olie in een hapjespan en bak de rode peper, pancetta en ui op middelhoog vuur 5 minuten.'),(60,15,3,'Snijd ondertussen de tomaten in blokken. Voeg de tomaten toe aan de hapjespan en laat op middelhoog vuur 30 minuten koken. Roer regelmatig. Breng op smaak met peper en zout.'),(61,16,1,'Klop de slagroom met de eieren door elkaar met peper, zout en peterselie.'),(62,16,2,'Bak de spekreepjes en de fijngesneden knoflook in een koekenpan. Laat de pan daarna iets afkoelen.'),(63,16,3,'Voeg op laag vuur het slagroommengsel en de geraspte kaas toe. Roer tot het ei licht stolt.'),(64,17,1,'Kook de spaghetti volgens de aanwijzingen op de verpakking beetgaar en giet af.'),(65,17,2,'Snijd ondertussen de onderkant van de witlof, halveer het lof in de lengte en verwijder de harde kern. Snijd de blaadjes in de lengte in repen van 1 cm breed.'),(66,17,3,'Verhit olijfolie en bak de hamblokjes 2 minuten. Voeg het lof toe en bak 2 minuten. Schenk de slagroom erbij en laat het 4 minuten zachtjes koken. Breng eventueel op smaak met peper en zout.'),(67,17,4,'Schep de \'saus\' door de spaghetti. Bestrooi de spaghetti met de kaas.'),(68,18,1,'Snijd en was de spinazie.'),(69,18,2,'Kook de Spätzle volgens de aanwijzingen op de verpakking.'),(70,18,3,'Fruit de knoflook en ui. Voeg de spekreepjes toe en bak ze gaar. Voeg de spinazie toe. Voeg op het laatst de crème fraîche toe en breng op smaak met zout, peper en Italiaanse kruiden.'),(71,19,1,'Verwarm de oven voor op 200 ºC.'),(72,19,2,'Kook de pasta beetgaar.'),(73,19,3,'Snijd de kipfilet in stukjes. Snijd de ui, champignons, paprika, courgette en knoflook in kleine stukjes. Verhit olijfolie in een koekenpan en bak hierin de kipstukjes en de gesneden groenten.'),(74,19,4,'Voeg het blokje bouillon toe en laat dit inkoken tot het vocht bijna weg is.'),(75,19,5,'Voeg de room, woksaus en peterselie toe.'),(76,19,6,'Meng de pasta met de rest van de ingrediënten en schep het mengsel in de ovenschaal. Bestrooi het geheel met geraspte kaas. Bak de ovenschotel totdat de kaas goudbruin is gekleurd.'),(77,20,1,'Verwarm de oven voor op 200 ºC. Snijd de knoflook fijn. Ontdooi de spinazie en laat deze zoveel mogelijk uitlekken in een zeef.'),(78,20,2,'Bak het gehakt in 8 minuten rul. Bak de knoflook 1 minuut. Voeg de spinazie toe. Let hierbij op de verhouding van het gehakt en de spinazie! Voeg ook nog wat kaas toe.'),(79,20,3,'Snijd de lasagnebladen in de breedte doormidden. Verdeel een beetje spinazie-gehaktmengsel over elk blad en rol op.'),(80,20,4,'Leg de rolletjes in een ingevette ovenschaal. Schenk de slagroom eroverheen en bestrooi het met de kaas. Dek het af met aluminiumfolie. Bak de cannelloni 20 minuten in het midden van de oven. Verwijder het folie en bak nog 10 minuten tot de cannelloni goudbruin is.'),(81,22,1,'Maak de kipfilets plat. Bestrooi ze met zout, peper en paprikapoeder. Wentel ze door de bloem.'),(82,22,2,'Verhit boter in een koekenpan en bak de kipfilets ongeveer 5 minuten tot ze gaar zijn. Haal ze uit de pan.'),(83,22,3,'Smelt ongeveer 8 eetlepels boter in de pan. Bak de peterselie en Provençaalse kruiden kort in de boter. Roer het citroensap erdoor en breng het mengsel aan de kook.'),(84,22,4,'Schep wat van de citroenboter door de rijst. Leg de kipfilets in de rest van de citroenboter.'),(85,21,1,'Verwarm de oven voor op 200 ºC.'),(86,21,2,'Snijd de varkensfilet in 3 cm dikke schijven en druk de schijven plat. Verwarm wat boter in een pan. Braad de varkensvleesstukken aan elke kant 1 minuut. Breng ze op smaak met zout en peper. Leg ze in een ovenschaal.'),(87,21,3,'Laat de perziken uitlekken, maar vang het sap op. Leg de perziken op de varkensvleesstukken in de ovenschaal.'),(88,21,4,'Klop 3 eetlepels crème fraîche met het ei. Breng de rest van de crème fraîche aan de kook met 1/8 van het opgevangen perzikensap. Roer hier sausbindmiddel doorheen. Breng het op smaak met zout, peper en oregano. Roer er tot slot het eimengsel en 2/3 van de kaas door. Giet de saus over de perziken.'),(89,21,5,'Strooi de rest van de kaas over de ovenschotel. Zet het geheel in het midden van de oven voor 15 tot 20 minuten.'),(90,23,1,'Verwarm de oven voor op 190 ºC. Hak de chocoladerepen in kleine stukjes. Meng de bloem, bakpoeder en het zout in een kom.'),(91,23,2,'Doe de boter, basterdsuiker, kristalsuiker en het vanille-extract in een kom en mix tot het mengsel romig is. Voeg daarna één voor één de eieren toe en mix na elk ei het mengsel goed door. Voeg vervolgens beetje bij beetje het bloemmengsel toe. Voeg als laatste de chocoladestukjes toe.'),(92,23,3,'Vorm met 2 lepels platte koekjes op het bakpapier (op een rooster of bakplaat). Laat wel ruimte tussen de koekjes, want deze lopen nog een beetje uit.'),(93,23,4,'Bak de koekjes 8 tot 10 minuten. Als ze klaar zijn, voelen ze heel zacht. Als ze afgekoeld zijn, worden ze harder, dus overschrijd de baktijd niet. (Tenzij je heel grote koekjes hebt.)'),(94,24,1,'Splits het ei en gebruik alleen de eidooier. Meng vervolgens alle ingrediënten met een mixer met deeghaken tot het deeg een korrelige structuur heeft. Kneed de deegkruimels met koele handen tot een samenhangend deeg. Rol tot een bal en verpak in vershoudfolie. Laat het 30 minuten in de koelkast rusten.'),(95,24,2,'Verwarm de oven voor op 175 ºC. Bestuif het werkblad met wat bloem en rol het deeg uit tot een lap van ca. 40 x 40 cm en 3-4 mm dik. Steek met behulp van uitsteekvormpjes of een glas koekjes uit het deeg. Kneed het resterende deeg tot een bal en rol opnieuw uit tot al het deeg gebruikt is. Leg de koekjes op enige afstand van elkaar op een met bakpapier beklede bakplaat.'),(96,24,3,'Bak de koekjes in het midden van de oven in 15-20 minuten lichtbruin en gaar. Neem ze van de bakplaat en laat afkoelen, bij voorkeur op een rooster.'),(97,25,1,'Verwarm de oven voor op 220 ºC.'),(98,25,2,'Was de appels, snijd ze doormidden en snijd het klokhuis weg. Snijd de appels in zo dun mogelijke schijfjes.'),(99,25,3,'Breng 1 liter water aan de kook samen met 3 eetlepels suiker en 2 eetlepels citroensap. Voeg de appelschijfjes toe zodra het water kookt. Kook de schijfjes 2 minuten totdat je ze makkelijk kunt buigen. Giet de schijfjes af in een vergiet en laat ze afkoelen. Laat de afgekoelde appelschijfjes op keukenpapier uitlekken.'),(100,25,4,'Spreid het bladerdeeg uit op een met bloem bestrooide ondergrond. Snijd het deeg in repen van ca. 2 cm met een pizzames. Mix 4 eetlepels suiker met de kaneel en verspreid het mengsel zo gelijk mogelijk over het bladerdeeg. Je kunt wat mengsel overhouden. Druk het mengsel zacht aan met je vingers.'),(101,25,5,'Verdeel de appelschijfjes over de deegstroken. Laat aan de korte kanten van de strook wat deeg vrij. Zorg ervoor dat de schijfjes elkaar een beetje overlappen en boven de lange kant van de strook uitsteken.'),(102,25,6,'Rol de deegstroken met de appelschijfjes zo strak mogelijk op. Leg de roosjes op een bakplaat die bekleed is met bakpapier en bak ze ongeveer 25 minuten totdat ze lichtbruin zijn gekleurd. Bestrooi de roosjes naar wens met poedersuiker.'),(103,26,1,'Verwarm de oven voor op 160 ºC. Vet de taarvorm in met wat boter. Smelt de boter in een steelpan. Maal de koekjes fijn en schenk de gesmolten boter erbij. Verdeel het mengsel gelijkmatig over de bodem van de taartvorm en druk aan met de bolle kant van een lepel.'),(104,26,2,'Splits de eieren, doe de eiwitten in een vetvrije kom. De eidooiers worden niet gebruikt. Klop de eiwitten met een mixer stijf. Voeg al kloppend lepel voor lepel de poedersuiker toe. Blijf, als alle suiker is toegevoegd, doorkloppen tot het eiwit glanst en stijve pieken vormt (5 minuten). Spatel de maizena, het vanillearoma en de kokos voorzichtig door het eiwit.'),(105,26,3,'Laat de chocolade smelten (au bain-marie).'),(106,26,4,'Spatel door het eiwitmengsel. Schep dit mengsel gelijkmatig op de koekjesbodem en strijk glad. Bak ca. 25 minuten in het midden van de oven. Neem uit de oven en laat in 2 uur afkoelen in de vorm. Snijd de kokos-chocoladetaart in 12 repen.'),(107,29,1,'Verwarm de oven voor op 160 ºC (boven- en onderwarmte). Vet de cakevorm in en bekleed met bakpapier.'),(108,29,2,'Zeef in een grote kom de bloem, het bakpoeder, de kaneel en het zout. Mix de boter, basterd- en vanillesuiker in een keukenmachine tot een bijna glad mengsel. Voeg daarna tijdens het mixen één voor één de eieren en de crème fraîche toe. Schep door het bloemmengsel.'),(109,29,3,'Pel en prak de banaan. Schep de bananenpuree door het beslag. Verdeel het beslag over de cakevorm en bak het bananenbrood goudbruin en gaar. Gebruik de \'gering stoom\'-stand van de oven. Controleer na 50 minuten op gaarheid met een satéprikker. Als deze er schoon uitkomt, is het bananenbrood gaar. Laat het bananenbrood eerst 30 minuten afkoelen in de vorm en daarna 60 minuten op een rooster.'),(110,30,1,'Haal het goulashvlees een halfuur van tevoren uit de koelkast. Snijd het vlees in blokken van 3 x 3 cm.'),(111,30,2,'Pel de sjalotten en halveer ze. Erg grote sjalotten kun je in kwarten snijden. Verhit 1 eetlepel boter in een braadpan en bak de sjalotten goudgeel. Haal ze uit de pan en zet ze opzij.'),(112,30,3,'Verhit weer 1 eetlepel boter in een braadpan. Schroei het vlees op hoge temperatuur dicht. Let op: het gaat beter als je het in porties bakt! Draai het vlees pas na 1 minuut om, zodat er niet teveel hitte van de bodem verloren gaat. '),(113,30,4,'Voeg in de braadpan het vlees, de sjalotten en 40 g tomatenpuree samen. Roer het goed door.'),(114,30,5,'Blus af met 200 ml droge rode wijn. Laat de rode wijn 2/3 wegkoken. Reduceer het geheel dus tot 1/3. '),(115,30,6,'Pers de knoflook erbij als de rode wijn voor 2/3 is weggekookt. Voeg 2 theelepels paprikapoeder, 1/2 theelepel oregano en 1 mespuntje cayennepeper toe. Voeg eventueel 1-2 theelepels citroenrasp toe. Roer het door.'),(116,30,7,'Blus het vlees met 400 ml runderbouillon. Laat het met de deksel erop ongever 1,5 uur bij matige temperatuur stoven. Kijk na 1 uur of het niet droogkookt. Als het nog vloeibaar genoeg is, kun je de deksel van de pan afhalen.'),(117,31,1,'Doe alles tegelijkertijd in een kom en meng het tot het deeg stevig is en donkerbruin kleurt. Het laatste stukje kneed je met de hand tot een bal. Wikkel het deeg in folie en laat het minstens 2 uur in de koelkast rusten. Je kunt het deeg ook al een dag van tevoren maken.'),(118,31,2,'Verwarm de oven voor op 250 ºC (boven- en onderwarmte).'),(119,31,3,'Smeer het plankje in met olie. Bestuif hem met bloem. Klop het bloem er weer af, zodat het niet in de kieren gaat zitten. Dit gaat namelijk ten koste van de print in het speculaas.'),(120,31,4,'Neem een bolletje van het deeg en vorm dit al iets naar de vorm in de plank. Druk het deeg goed aan in de vorm. Ga hierbij over de randjes heen. Met een goed scherp mes snijd je het overtollige deeg weg.'),(121,31,5,'Sla met de rand van het plankje op het aanrecht tot de randjes los komen te zitten. Haal voorzichtig het figuur los. Houd hierbij het plankje zo horizontaal mogelijk en dicht bij het aanrecht of je hand. Let op: Als het deeg te warm wordt, komt het lastiger uit de vorm. Leg het in dat geval weer even terug in de koelkast zodat het wat steviger wordt.'),(122,31,6,'Leg de figuren op bakpapier op de bakplaat of het rooster. Bak ze voor 14-18 minuten in de oven.'),(123,27,1,'Vermeng 200 g kristalbloem, 1 snufje zout, 1 eetlepel olie en 100 ml lauwwarm water tot een zeer glad deeg. Dit duurt ongeveer 10 minuten.'),(124,27,2,'Bestrijk het deeg rondom met olie en leg het op een bord.'),(125,27,3,'Giet kokend water in een keramische schaal en laat het kort staan. Haal het water uit de schaal en zet de schaal op de kop over het deeg. Laat het deeg 30 minuten staan.'),(126,27,4,'Doe ondertussen het citroensap in een grote kom. Week de rozijnen in rum. Was en schil de appels en verdeel ze in kwarten. De kwarten dan in 1 mm dikke schijven snijden. Meng de appelschijven met het citroensap, zodat ze niet bruin worden.'),(127,27,5,'Smelt 50 g boter in een pan en bak het paneermeel langzaam (!) bruin. Wees voorzichtig, want het brandt snel aan. Vermeng het gebruinde paneermeel met suiker en kaneel. Meng het met de appelschijven. Voeg de rozijnen toe.'),(128,27,6,'Leg een grote, schone theedoek op het aanrecht en bestuif deze met bloem. Doe eventueel je ringen af; deze kunnen gaten in het deeg veroorzaken.'),(129,27,7,'Druk het deeg plat op de theedoek en bestuif het met bloem. Trek het voorzichtig vanuit het midden uit elkaar, totdat het zo groot is als een pizzabord. Druk nu met de hand het deeg nog voorzichtig beetje bij beetje uit elkaar. Zodra het deeg groter is dan de theedoek, is het klaar. Je kunt er een krant doorheen lezen. Snijd de dikke randen met een mes weg.'),(130,27,8,'Smelt 100 g boter. Bestrijk het Strudeldeeg met de gesmolten boter.'),(131,27,9,'Verdeel de appelvulling over het onderste derde deel van het deeg. Vouw de zijranden van het deeg eroverheen.'),(132,27,10,'Rol met behulp van de theedoek de Strudel strak op. Draai de sluitzijde naar de onderkant. Leg de Strudel op een met bakpapier beklede bakplaat.'),(133,27,11,'Bestrijk de Strudel met gesmolten boter. Verwarm de oven op 220 ºC (boven- en onderwarmte). Bak de Strudel in 40-45 minuten krokant.'),(134,27,12,'Bestrooi de Strudel met poedersuiker en serveer met ijs of vanillesaus.'),(135,28,1,'Vermeng melk en slagroom. Doe 2/3 daarvan in een pan.'),(136,28,2,'Snijd de vanillestokjes via de lange kant doormidden. Schraap met een mes de vanille uit het stokje. Voeg de vanille, de stokhelften en de suiker toe aan de melk. Verhit de melk langzaam.'),(137,28,3,'Vermeng de maizena en het eigeel met de rest van de melk.'),(138,28,4,'Voeg het maizenamengsel toe aan de vanillemelk zodra de laatste kookt. Roer het met de garde krachtig door.'),(139,28,5,'Haal de pan van het vuur en haal de vanillestokjes eruit. Mix eventueel de saus met een pureerstaaf, zodat de saus schuimig wordt.'),(140,32,1,'Verwarm de oven voor op 175 ºC (boven- en onderwarmte). Vet een ronde bakvorm met een diameter van ongeveer 25 cm in.'),(141,32,2,'Klop de boter met de poedersuiker en 1 snufje zout schuimig. Meng de eieren er één voor één bij.'),(142,32,3,'Vermeng de bloem met het bakpoeder, de vanillesuiker en de citroenrasp. Roer dit kort door.'),(143,32,4,'Giet de massa in de bakvorm en strijk het glad.'),(144,32,5,'Ontpit de kersen en verdeel ze over de taart. Bak de taart in de oven in ca. 30 minuten goudgeel. Laat de taart afkoelen. Bestrooi met poedersuiker.'),(145,33,1,'Verwarm de oven voor op 175 ºC (boven- en onderwarmte).'),(146,33,2,'Klop de boter met de poedersuiker en vanillesuiker wit-schuimig. Voeg daarna één voor één de eidooiers toe.'),(147,33,3,'Meng in een tweede kom de eiwitten met suiker tot een crèmige schuim.'),(148,33,4,'Vermeng in een derde kom de maizena, de bloem en het bakpoeder. Meng dit en het eiwitmengsel afwisselend door de botermassa.'),(149,33,5,'Voeg op het einde de hagelslag toe. Giet het deeg in een ingevette tulbandvorm. Bak het 50-60 minuten in de oven.'),(150,33,6,'Voor het glazuur: smelt de chocolade en de boter op middelhoge temperatuur. Giet en strijk het over de taart.'),(151,34,1,'Strooi een beetje zout in een kom. Zeef 275 gram bloem erboven. Maak een kuiltje in het midden van de bloem en strooi de gist erin. Voeg 50 gram boter, 25 gram suiker en het ei toe. Schenk de melk erbij en kneed met de mixer, in de keukenmachine of met de hand tot een soepel deeg. Voeg eventueel extra bloem toe als het deeg plakt. Vorm er een bal van. Laat het gistdeeg afgedekt op kamertemperatuur 1 uur rijzen.'),(152,34,2,'Schil de appels. Snijd de appels en abrikozen in stukjes. Kook het fruit met 150 gram suiker en 50 ml water in 15 minuten tot een dikke compote. Laat deze vlaaivulling afkoelen.'),(153,34,3,'Kneed met de mixer of in de keukenmachine van de resterende 100 gram bloem, 100 gram suiker en 75 gram boter een samenhangend deeg. Leg het deeg in vershoudfolie verpakt in de koelkast.'),(154,34,4,'Verwarm de oven voor tot 200 ºC (boven- en onderwarmte). Rol het gistdeeg uit tot een ronde lap van 28-30 cm doorsnede, die dus ruim over de vorm van 20 cm doorsnede hangt. Leg het deeg in de vorm en druk het in de hoek goed aan. Laat het deeg nog een paar minuten rusten en snijd dan het overtollige deeg langs de rand weg.'),(155,34,5,'Schep de vulling op het deeg. Verkruimel het kruimeldeeg tussen de vingers boven de vlaai. Bak de vlaai in de voorverwarmde oven in ongeveer 30 minuten gaar.'),(156,35,1,'Verwarm de oven voor tot 200 ºC (boven- en onderwarmte). Leg een vel bakpapier op de bodem van een springvorm van 24 cm diameter. Sluit de springvorm. Klop in de keukenmachine of met de mixer met deeghaken de boter met 200 gram suiker, de vanillesuiker en wat zout zacht. Meng het ei erdoor. Voeg in 2-3 porties het bakmeel toe en kneed verder tot een kruimelig maar goed gemengd deeg. Druk tweederde van het deeg uit op de bodem van de springvorm.'),(157,35,2,'Schil de appels en snijd ze in schijfjes. Meng in een kom de appel met de bosbessen, 25 gram suiker en de kaneel. Verdeel het mengsel over de deegbodem. Verkruimel de rest van het deeg tussen de vingers boven de taart.'),(158,35,3,'Bak de taart in de voorverwarmde oven in ongeveer 45 minuten goudbruin en gaar. Laat de taart afkoelen en verwijder dan de vorm.'),(159,36,2,'Leg de aardappels in een ovenschaal. Snijd ze één keer in de lengte in. Snijd ze daarna over de breedte meerdere keren in. Let op: snijd ze niet helemaal door!'),(160,36,3,'Bestrijk de aardappels met vloeibare bakboter. Breng op smaak met peper en zout. Zet de schaal met aardappels in de oven voor 35 minuten.'),(161,36,1,'Verwarm de oven voor op 200 ºC (hetelucht).'),(162,36,4,'Bak na 25 minuten de baconreepjes knapperig in een pan. Dit duurt ongeveer 10 minuten.'),(163,36,5,'Haal de aardappels uit de oven. Leg ze op de borden. Bestrijk ze middels een eetlepel met zure room. Verspreid de baconreepjes over de aardappels. Bestrooi met cheddar en een snufje peterselie.'),(164,36,6,'Genieten maar!'),(165,1,3,'Snijd ondertussen de broccoli in roosjes.');
/*!40000 ALTER TABLE `recipe_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_steps_seq`
--

DROP TABLE IF EXISTS `recipe_steps_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_steps_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_steps_seq`
--

LOCK TABLES `recipe_steps_seq` WRITE;
/*!40000 ALTER TABLE `recipe_steps_seq` DISABLE KEYS */;
INSERT INTO `recipe_steps_seq` VALUES (1);
/*!40000 ALTER TABLE `recipe_steps_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL DEFAULT '',
  `servings_people` int NOT NULL DEFAULT '0',
  `servings_pieces` int NOT NULL DEFAULT '0',
  `time_prep_in_minutes` int NOT NULL DEFAULT '0',
  `time_wait_in_minutes` int NOT NULL DEFAULT '0',
  `time_oven_in_minutes` int NOT NULL DEFAULT '0',
  `comment` varchar(300) NOT NULL DEFAULT '',
  `image_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'2023-03-08 09:19:19','Aardappel-broccoli traybake met gerookte kip','Dit is een specialiteit van chefkok Robbie. Succes gegarandeerd.',2,0,15,0,35,'','1.jpg'),(2,'2023-03-08 09:36:19','Lasagnesalade','',4,0,25,0,0,'Lekker met geschaafde Parmezaanse kaas.','2.jpg'),(3,'2023-03-08 09:46:23','Salade met kersen en mozzarella','',2,0,15,0,0,'Ook te serveren met basilicumblaadjes en walnoten/hazelnoten.','3.jpg'),(4,'2023-03-08 09:46:23','Pistolet hotdog, zuurkool en katenspek','Stevige lunch: zuurkool en worst op een knapperig broodje.',2,0,15,0,0,'','4.jpg'),(5,'2023-03-08 09:53:34','Ciabatta tomaat-mozzarella','',2,0,15,0,0,'In plaats van Italiaanse kruiden kan er ook verse basilicum worden gebruikt.','5.jpg'),(6,'2023-03-08 09:58:27','Broodpap','',1,0,15,0,25,'',''),(7,'2023-03-08 10:05:35','Broodschotel andijvie, ham en kaas','Een kwartiertje voorbereiden, de oven doet de rest!',4,0,15,0,25,'Je kunt dit gerecht 1 dag van tevoren bereiden. Laat afkoelen tot kamertemperatuur en bewaar afgedekt in de koelkast. Verwarm 30 min. in de oven op 180 °C.','7.jpg'),(8,'2023-03-11 08:50:56','Pizza(bodem)','',1,0,15,60,15,'','8.jpg'),(9,'2023-03-11 08:50:56','Quesdadilla met drie kazen en rucola','',2,0,15,0,0,'','9.jpg'),(10,'2023-03-11 08:50:56','Spinazieburrito\'s uit de oven','We vervangen de klassiekers in burrito\'s een keer voor spinazie. Ook lekker!',4,0,25,0,15,'Lekker met salade van friséesla en yoghurtdressing.','10.jpg'),(11,'2023-03-11 08:50:56','Kaasflensjes met maïs, sla en ham','',3,12,25,0,0,'','11.jpg'),(12,'2023-03-11 08:50:56','Preitaart','',3,0,20,0,35,'','12.jpg'),(13,'2023-03-12 13:28:54','Hasselback aardappels','Adri\'s specialiteit voor de mannenkookdag.',1,0,20,0,50,'','13.jpg'),(14,'2023-03-12 13:28:54','Chinese kool met kip en röstirondjes','',1,0,20,0,0,'',''),(15,'2023-03-12 13:37:49','Zelfgemaakte pastasaus','',2,0,45,0,0,'Serveren met pasta en geraspte kaas.','15.jpg'),(16,'2023-03-12 13:37:49','Carbonarasaus','',2,0,15,0,0,'Serveren met pasta.','16.jpg'),(17,'2023-03-12 13:37:49','Spaghetti met romige witlof','',2,0,20,0,0,'','17.jpg'),(18,'2023-03-12 13:38:27','Romige Spätzle met spinazie','',2,0,20,0,0,'',''),(19,'2023-03-12 13:39:00','Pastaovenschotel met groene currysaus','',2,0,30,0,20,'','19.jpg'),(20,'2023-03-12 13:39:24','Cannelloni met spinazie en gehakt','',2,0,30,0,30,'','20.jpg'),(21,'2023-03-12 13:59:46','Perzikengratin met varkensvlees','',4,0,40,0,15,'Serveren met rijst.',''),(22,'2023-03-12 13:59:46','Citroenkip','',2,0,20,0,0,'Serveren met rijst.',''),(23,'2023-03-14 13:46:15','American cookies','',0,25,15,0,10,'','23.jpg'),(24,'2023-03-14 13:48:52','Zandkoekjes','',0,20,25,30,20,'','24.jpg'),(25,'2023-03-14 13:48:52','Appelroosjes van bladerdeeg','',0,11,75,0,25,'','25.jpg'),(26,'2023-03-14 13:48:52','Kokos-chocotaart','',0,12,20,0,25,'','26.jpg'),(27,'2023-03-14 13:48:52','Apfelstrudel','Herinneringen aan Oostenrijk.',0,8,30,30,40,'Serveren met vanillesaus.','27.jpg'),(28,'2023-03-14 14:00:19','Vanillesaus','Speciaal voor de Apfelstrudel.',0,0,15,0,0,'','28.jpg'),(29,'2023-03-14 14:00:19','Bananenbrood','Past precies in een kleine tulband. Lekker, leuk en makkelijk te snijden.',0,10,15,0,60,'','29.jpg'),(30,'2023-03-14 15:01:57','Klassieke rundergoulash','',4,0,30,90,0,'','30.jpg'),(31,'2023-03-14 15:23:35','Speculaas','Superleuk met de notenkrakerspeculaasplank!',0,2,20,120,15,'In een trommel 2 weken houdbaar.','31.jpg'),(32,'2023-03-14 16:16:37','Kirschkuchen','Op de Oostenrijkse manier. Snel om te maken en heel lekker!',0,10,15,0,30,'','DSC_0876.JPG'),(33,'2023-03-14 17:10:48','Ameisenkuchen','',0,10,20,0,50,'','DSC_0025_2.JPG'),(34,'2023-03-14 17:53:21','Appel-abrikoos kruimelvlaai','',8,0,45,60,30,'Alleen appel? Een appelkruimelvlaai maak je met 1 kilo appels. Je kunt de kruimelvlaai ook in een laag vlaaiblik van 30 cm doorsnede maken. De hoeveelheid gistdeeg en vulling is voldoende. Maak wel een dubbele portie kruimeldeeg om over het grotere oppervlak te strooien.','DSC_0285.jpg'),(35,'2023-03-14 18:07:28','Appelkruimeltaart met bosbessen','',10,0,20,0,45,'Extra lekker met kaneelsuiker: meng 1 theelepel kaneel met 1 eetlepel poedersuiker. Strooi de kaneelsuiker met een cacaostrooier of theezeefje over de taart.','DSC_0358.jpg'),(36,'2023-03-16 20:07:48','Loaded potato','Robbie\'s specialiteit voor de mannenkookdag.',2,0,20,0,35,'','36.jpg');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_seq`
--

DROP TABLE IF EXISTS `recipes_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_seq`
--

LOCK TABLES `recipes_seq` WRITE;
/*!40000 ALTER TABLE `recipes_seq` DISABLE KEYS */;
INSERT INTO `recipes_seq` VALUES (1);
/*!40000 ALTER TABLE `recipes_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'recappt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-19 18:15:35
