-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: kofoos.c16mgeqgsinu.ap-northeast-2.rds.amazonaws.com    Database: kofoos
-- ------------------------------------------------------
-- Server version	8.0.33

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `disliked_material_detail`
--

DROP TABLE IF EXISTS `disliked_material_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disliked_material_detail` (
  `disliked_material_detail_id` int NOT NULL AUTO_INCREMENT,
  `detail_name` varchar(15) NOT NULL,
  `disliked_material_id` int DEFAULT NULL,
  PRIMARY KEY (`disliked_material_detail_id`),
  KEY `dmd_mid_to_dm_id_idx` (`disliked_material_id`),
  CONSTRAINT `dmd_mid_to_dm_id` FOREIGN KEY (`disliked_material_id`) REFERENCES `disliked_material` (`disliked_material_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disliked_material_detail`
--

LOCK TABLES `disliked_material_detail` WRITE;
/*!40000 ALTER TABLE `disliked_material_detail` DISABLE KEYS */;
INSERT INTO `disliked_material_detail` VALUES (1,'분유',0),(2,'유청',0),(3,'밀크',0),(4,'밀키',0),(5,'밀크레진',0),(6,'낙우밀',0),(7,'치즈',0),(8,'소맥분',2),(9,'소맥',2),(10,'밀가루',2),(11,'부침가루',2),(12,'빵가루',2),(13,'글루텐',2),(14,'밀식이섬유',2),(15,'배터용분말',2),(16,'치킨용배터믹스',2),(17,'지미베이스',2),(18,'가라아게배터',2),(19,'통밀',2),(20,'찐밀쌀가루',2),(21,'호밀',2),(22,'밀베이커스믹스',2),(23,'중력분',2),(24,'조미새우분말',2),(25,'그릴시즈닝-22',2),(26,'(밀)',2),(27,'소밀',2),(28,'밀분해액',2),(29,'전분',2),(30,'보리',2),(31,'찰보리',2),(32,'귀리',2),(33,'메밀',12),(34,'고등어',9),(35,'다시육수농축액',9),(36,'가쓰오조미액',9),(37,'다이미엔엠',9),(38,'육수맛내기베이스',9),(39,'굴',10),(40,'조개',10),(41,'바지락',10),(42,'낙지',10),(43,'문어',10),(44,'쭈꾸미',10),(45,'소라',10),(46,'가리비',10),(47,'해물',10),(48,'소정육',7),(49,'소고기',7),(50,'소뼈',7),(51,'소갈비',7),(52,'소기기',7),(53,'비프',7),(54,'한우',7),(55,'우육',7),(56,'소불고기',7),(57,'소양',7),(58,'소사태풍미료',7),(59,'소곱창',7),(60,'소깐양',7),(61,'소목심',7),(62,'소홍창',7),(63,'쇠고기',7),(64,'육우',7),(65,'',7),(66,'윙',11),(67,'닭고기',11),(68,'치킨추출농축액',11),(69,'생닭',11),(70,'닭발',11),(71,'치킨엑기스분말',11),(72,'닭뼈',11),(73,'닭근위',11),(74,'닭다리살',11),(75,'치킨스톡',11),(76,'닭정육',11),(77,'삼계닭',11),(78,'닭육수분말',11),(79,'닭고기조미분말',11),(80,'오리',11),(81,'칠면조육',11),(82,'돼지',6),(83,'돈',6),(84,'포크',6),(85,'족발',6),(86,'삼겹살',6),(87,'베이컨',6),(88,'소시지',6),(89,'햄',6),(90,'땅콩',4),(91,'로스트비터츠',4),(92,'피넛',4),(93,'피넛버터블랜드',4),(94,'로스티드피너츠',4),(95,'호두혼합견과페이스트',4),(96,'',4),(97,'잣',5),(98,'호두',5),(99,'아몬드',5),(100,'헤이즐넛',5),(101,'헤즐넛',5),(102,'헤젤넛',5),(103,'케슈넛',5),(104,'캐쉬넛',5),(105,'넛맥',5),(106,'견과',5),(107,'콩가루',13),(108,'완두콩',13),(109,'렌틸콩',13),(110,'렌틸콩',13),(111,'검은콩',13),(112,'콩나물',13),(113,'두부',13),(114,'강낭콩',13),(115,'앙금',13),(116,'이집트콩',13),(117,'검정콩',13),(118,'콩단백',13),(119,'콩고물',13),(120,'볶은콩',13),(121,'백태',13),(122,'리마콩',13),(123,'두유',13),(124,'메주콩',13),(125,'메주',13),(126,'콩국',13),(127,'된장',13),(128,'간장',13),(129,'춘장',13),(130,'낫또',13),(131,'콩기름',13),(132,'블랙빈',13),(133,'약콩',13),(134,'콩비지',13),(135,'분리대두단백',13),(136,'곡류가공품(대두)',13),(137,'대두분',13),(138,'유단백혼합분말(대두)',13),(139,'대두유',13),(140,'마요네스',13),(141,'유화제',13),(142,'레시틴',13),(143,'마가린',13),(144,'대두단백',13),(145,'탈지대두',13),(146,'콩발효액',13),(147,'서리태',13),(148,'사과',14),(149,'애플엣센스',14),(150,'그린애플',14),(151,'토마토',15),(152,'피자소스',15),(153,'우스타소스',15),(154,'케찹',15),(155,'케첩',15),(156,'칠리소스',15),(157,'복숭아',8),(158,'피치티',8),(159,'바나나',16),(160,'케일',17),(161,'샐러리',18),(162,'겨자',20),(163,'홀그레인',20),(164,'버섯',19);
/*!40000 ALTER TABLE `disliked_material_detail` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-16 11:10:38
