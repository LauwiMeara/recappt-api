-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: recappt
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
INSERT INTO `categories` VALUES (1,'Aardappels',4,'cookie'),(2,'Pasta',5,'bacon'),(3,'Salade',1,'carrot'),(4,'Brood',2,'bread-slice'),(5,'Ei',3,'egg'),(6,'Rijst',6,'bowl-rice'),(7,'Zoet',7,'cheese');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_category`
--

LOCK TABLES `recipe_category` WRITE;
/*!40000 ALTER TABLE `recipe_category` DISABLE KEYS */;
INSERT INTO `recipe_category` VALUES (1,1,1),(2,2,2),(3,2,3),(4,3,3),(5,4,4),(6,5,4),(7,6,4),(8,7,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,1,'kg','aardappels','vastkokend'),(2,1,4,'','uien','middelgroot'),(3,1,500,'g','broccoli',''),(4,1,4,'el','olijfolie',''),(5,1,3,'el','ras el hanout',''),(6,1,150,'g','gerookte kipreepjes',''),(7,2,15,'g','basilicum',''),(8,2,0.5,'teen','knoflook','geperst'),(9,2,7,'el','olijfolie',''),(10,2,1,'tl','zout',''),(11,2,8,'','tomaten','in plakken'),(12,2,400,'g','mozzarell','in plakken'),(13,2,250,'g','lasagnebladen','(1 pak)'),(14,2,75,'g','rucola',''),(15,3,75,'g','veldsla',''),(16,3,150,'g','kersen',''),(17,3,125,'g','mozzarella',''),(18,3,0,'','saladecroutons',''),(19,3,0,'','olijfolie',''),(20,4,200,'g','zuurkool',''),(21,4,1,'blik','hotdogs','(8 hotdogs)'),(22,4,8,'plakjes','katenspek',''),(23,4,2,'el','olie',''),(24,4,4,'','pistolets',''),(25,4,2,'el','Zaanse mosterd',''),(26,5,1,'','ciabatta','of 4 ciabattina\'s'),(27,5,0,'','olijfolie',''),(28,5,2,'','tomaten','in plakken'),(29,5,200,'g','mozzarella','in plakken'),(30,5,0,'','Italiaanse kruiden',''),(31,6,8,'sneetjes','brood','eventueel zonder korst'),(32,6,0.5,'l','melk',''),(33,6,1,'','ei',''),(34,6,0,'','citroensap',''),(35,6,75,'g','krenten en rozijnen',''),(36,6,75,'g','suiker','(50 g voor de pap, 25 g voor de korst)'),(37,6,45,'g','boter','(40 g voor de pap, 5 g voor het invetten van de ovenschaal)'),(38,6,0,'','paneermeel',''),(39,6,0,'','kaneel',''),(40,7,200,'g','achterham',''),(41,7,1,'','rode ui',''),(42,7,3,'','tomaten',''),(43,7,3,'el','olijfolie',''),(44,7,400,'g','andijvie','gesneden'),(45,7,1,'el','Provençaalse kruiden',''),(46,7,1,'','stokbrood',''),(47,7,175,'g','geraspte kaas','');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_steps`
--

LOCK TABLES `recipe_steps` WRITE;
/*!40000 ALTER TABLE `recipe_steps` DISABLE KEYS */;
INSERT INTO `recipe_steps` VALUES (1,1,1,'Verwarm de oven voor op 220 °C. Snijd de ongeschilde aardappelen in parten van 2 cm. Snijd de uien in kwarten. Snijd de broccoli in roosjes, snijd de stronk in stukjes van 2 cm.'),(2,1,2,'Verdeel de aardappel, ui en broccoli over een met bakpapier beklede bakplaat. Besprenkel met ⅓ van de olie, breng op smaak met peper en eventueel zout, schep om en bak in de oven in ca. 35 min. goudgeel en knapperig.'),(3,1,3,'Meng ondertussen de rest van de olie met de helft van de ras el hanout, peper en eventueel zout. Schep de kruidenolie door de gerookte-kipreepjes. Neem de traybake na 20 min. uit de oven. Schep de aardappelen en groente om met de rest van de ras el hanout. Verdeel de kipreepjes erover en bak nog ca. 10 min.'),(4,1,4,'Haal de traybake uit de oven en verdeel over de borden.'),(5,2,2,'Maak in een ruime schaal een marinade van het basilicum, de knoflook, 6 el olie en het zout. Voeg de tomaten en mozzarella toe en schep om.'),(6,2,3,'Breng een pan water met wat zout en 1 el olie aan de kook en kook de lasagne­bladen in 8 min. beetgaar. Giet af.'),(7,2,1,'Snijd de tomaten en mozzarella in plakken. Pers de knoflook.'),(8,2,4,'Leg op 4 borden 1 lasagneblad en bedek met van de tomaat en mozzarella. Leg er wat rucola op en dek af met 1 lasagnevel. Maak zo nog 2 lagen, eindig met een lasagnevel. Schep de achtergebleven marinade over de lasagne. Lekker met geschaafde Parmezaanse kaas.'),(9,3,1,'Snijd de veldsla, kersen en mozzarella. Meng alles door elkaar.'),(10,3,2,'Dresseer de salade met olijfolie en Italiaanse kruiden. Serveer met croutons.'),(11,4,1,'Doe de zuurkool in een pan. Breng aan de kook. Laat op laag vuur 10 min. koken en laat uitlekken in een vergiet.'),(12,4,2,'Omwikkel ondertussen de hotdogs elk met 1 plakje spek. Verhit de olie in een koekenpan en bak de worsten in 4 min. goudbruin. Keer regelmatig.'),(13,4,3,'Snijd de pistolets overlangs doormidden en besmeer de onderste helften met de mosterd. Verdeel de zuurkool erover. Leg hierop 2 hotdogs. Leg de bovenkanten van de pistolets erop en serveer.'),(14,5,1,'Verwarm de oven voor op 200 °C.'),(15,5,2,'Leg de ciabatta in de oven totdat hij mooi bruin en knapperig is. Snijd ondertussen de tomaten en mozzarella in plakken.'),(16,5,3,'Snijd de ciabatta overlangs doormidden. Besprenkel beide helften met olijfolie. Leg de tomaten en mozzarella om en om op de ciabatta. Strooi er Italiaanse kruiden overheen. Serveer.'),(17,6,1,'Verwarm de oven voor op 180 °C.'),(18,6,2,'Verwarm de melk en maak hierin het brood fijn.'),(19,6,3,'Splits het ei. Voeg de eidooier samen met de krenten, rozijnen, 50 g suiker en 40 g boter toe aan de pap. Voeg enkele druppels citroensap toe.'),(20,6,4,'Klop het eiwit stijf. Haal de pap van het vuur en schep het eiwit er luchtig doorheen.'),(21,6,5,'Doe de pap in een met boter ingevette ovenschaal. Bestrooi het met paneermeel, suiker en kaneel. Leg er hier en daar een klontje boter op. Zet het in het midden van de oven totdat het een bruine korst heeft.'),(22,7,1,'Verwarm de oven voor op 180 °C. Snijd de ham in reepjes, de ui in ringen en de tomaten in plakken. Verhit de olie in een wok en roerbak de ham en ui 2 min. Voeg de tomaten, andijvie en kruiden toe en roerbak nog 8 min. Verdeel over de ovenschaal.'),(23,7,2,'Snijd het stokbrood in sneetjes van 1½ cm breed en dek de schotel daarmee dakpansgewijs af. Bestrooi met de kaas en bak in ca. 25 min. in het midden van de oven goudbruin.');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'2023-03-08 09:19:19','Aardappel-broccoli traybake met gerookte kip','Neem als basis een altijd-goed aardappel-broccoli traybake en voeg daar gerookte kip aan toe. Succes gegarandeerd.',4,0,15,0,35,''),(2,'2023-03-08 09:36:19','Lasagnesalade','',4,0,25,0,0,'Lekker met geschaafde Parmezaanse kaas.'),(3,'2023-03-08 09:46:23','Salade met kersen en mozzarella','',2,0,15,0,0,'Ook te serveren met walnoten.'),(4,'2023-03-08 09:46:23','Pistolet hotdog, zuurkool en katenspek','Stevige lunch: zuurkool en worst op een knapperig broodje.',2,0,15,0,0,''),(5,'2023-03-08 09:53:34','Ciabatta tomaat-mozzarella','',2,0,15,0,0,'In plaats van Italiaanse kruiden kan er ook verse basilicum worden gebruikt.'),(6,'2023-03-08 09:58:27','Broodpap','',1,0,15,0,25,''),(7,'2023-03-08 10:05:35','Broodschotel andijvie, ham en kaas','Een kwartiertje voorbereiden, de oven doet de rest!',4,0,15,0,25,'Je kunt dit gerecht 1 dag van tevoren bereiden. Laat afkoelen tot kamertemperatuur en bewaar afgedekt in de koelkast. Verwarm 30 min. in de oven op 180 °C.');
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

-- Dump completed on 2023-03-10 21:25:38
