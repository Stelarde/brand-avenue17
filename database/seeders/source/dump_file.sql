-- MySQL dump 10.13  Distrib 5.7.27-30, for Linux (x86_64)
--
-- Host: localhost    Database: u1837183_default
-- ------------------------------------------------------
-- Server version	5.7.27-30

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci,
  `seo_desc` text COLLATE utf8mb4_unicode_ci,
  `views` int(11) NOT NULL DEFAULT '0',
  `show_in_menu` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (24,'1668692225.jpg','Базовый гардероб',NULL,'bazovyy-garderob',NULL,NULL,20,1,'2022-11-17 13:37:06','2023-04-02 08:50:06'),(25,'1668692235.jpg','Пальто /куртки',NULL,'palto-kurtki',NULL,NULL,54,1,'2022-11-17 13:37:15','2023-04-04 06:13:30'),(26,'1668692265.jpg','Пиджаки',NULL,'pidzhaki',NULL,NULL,36,1,'2022-11-17 13:37:45','2023-04-03 04:30:18'),(27,'1668692211.jpg','Платья / комбинезоны',NULL,'platya-kombinezony',NULL,NULL,30,1,'2022-11-17 13:36:51','2023-04-03 04:30:30'),(28,'1668692225.jpg','Трикотаж',NULL,'trikotazh',NULL,NULL,43,1,'2022-11-17 13:37:06','2023-04-02 08:43:44'),(29,'1668692235.jpg','Кашемир',NULL,'kashemir',NULL,NULL,27,1,'2022-11-17 13:37:15','2023-03-30 12:06:00'),(30,'1669295200.jpg','Рубашки / блузы',NULL,'rubashki-bluzy',NULL,NULL,27,1,'2022-11-24 10:06:40','2023-03-27 08:34:32'),(31,'1669295210.jpg','Топы',NULL,'topy',NULL,NULL,23,1,'2022-11-24 10:06:50','2023-03-10 22:45:16'),(32,'1669295217.jpg','Футболки',NULL,'futbolki',NULL,NULL,31,1,'2022-11-24 10:06:57','2023-04-03 13:10:09'),(33,'1669295224.jpg','Брюки',NULL,'bryuki',NULL,NULL,28,1,'2022-11-24 10:07:04','2023-03-26 20:15:45'),(34,'1669295232.jpg','Юбки /шорты',NULL,'yubki-shorty',NULL,NULL,29,1,'2022-11-24 10:07:12','2023-04-04 06:10:46'),(35,'1669295243.jpg','Джинсы',NULL,'dzhinsy',NULL,NULL,46,1,'2022-11-24 10:07:23','2023-04-01 04:13:36'),(36,'1669295251.jpg','Спортивные комплекты',NULL,'sportivnye-komplekty',NULL,NULL,21,1,'2022-11-24 10:07:31','2023-03-19 19:25:05'),(37,'1669295261.jpg','Total look',NULL,'total-look',NULL,NULL,27,1,'2022-11-24 10:07:41','2023-04-01 14:31:36');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(6,'2022_10_25_134824_create_categories_table',2),(9,'2022_10_25_220019_create_products_table',3),(10,'2022_10_25_220125_create_product_to_categories_table',3),(11,'2022_11_02_152829_create_product_sizes_table',3),(13,'2022_11_02_182159_create_sizes_table',4),(15,'2022_11_02_153149_create_product_images_table',5),(17,'2022_11_08_133742_create_settings_table',6),(18,'2022_11_09_121226_add_file_to_settings_table',7),(19,'2022_11_09_124626_create_promocodes_table',8),(26,'2022_11_24_083452_create_orders_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `payment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Создан',
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `summ` int(11) NOT NULL,
  `promocode_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_promocode_id_foreign` (`promocode_id`),
  CONSTRAINT `orders_promocode_id_foreign` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (5,'Иван','Иванов','test@mail.ru','+79991234567','Самовывоз','г.  Москва, ул. Ленина','15','16','Тестовый заказ','Наличными при получении','Создан','[{\"product\":{\"id\":50,\"name\":\"свитер зеленый\",\"price\":4790,\"desc\":\"Состав: 100% Полиэстер\\r\\nПодкладка: 100% Полиэстер\\r\\nУтеплитель: 100% Полиэстер\\r\\nПараметры модели: 173/83/64/90\\r\\nНа модели размер: S\\r\\nТемпературный режим: до -15 °C\",\"color\":\"Зеленый\",\"article\":\"115552\",\"slug\":\"sviter-green\",\"seo_title\":null,\"seo_desc\":null,\"views\":2,\"created_at\":\"2022-11-17T13:40:37.000000Z\",\"updated_at\":\"2022-11-24T12:20:32.000000Z\",\"images\":{\"id\":11,\"product_id\":50,\"img1\":\"16686924371.png\",\"img2\":\"16692002332.png\",\"img3\":\"16692002333.png\",\"img4\":\"16692002334.png\",\"img5\":\"16692002335.png\",\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-17T13:40:37.000000Z\",\"updated_at\":\"2022-11-23T10:43:53.000000Z\"},\"sizes\":[{\"id\":105,\"product_id\":50,\"name\":\"S\",\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"},{\"id\":106,\"product_id\":50,\"name\":\"M\",\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"},{\"id\":107,\"product_id\":50,\"name\":\"L\",\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"}],\"categories\":[{\"id\":62,\"product_id\":50,\"category_id\":27,\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"}]},\"size\":\"M\",\"quantity\":1},{\"product\":{\"id\":50,\"name\":\"свитер зеленый\",\"price\":4790,\"desc\":\"Состав: 100% Полиэстер\\r\\nПодкладка: 100% Полиэстер\\r\\nУтеплитель: 100% Полиэстер\\r\\nПараметры модели: 173/83/64/90\\r\\nНа модели размер: S\\r\\nТемпературный режим: до -15 °C\",\"color\":\"Зеленый\",\"article\":\"115552\",\"slug\":\"sviter-green\",\"seo_title\":null,\"seo_desc\":null,\"views\":2,\"created_at\":\"2022-11-17T13:40:37.000000Z\",\"updated_at\":\"2022-11-24T12:20:32.000000Z\",\"images\":{\"id\":11,\"product_id\":50,\"img1\":\"16686924371.png\",\"img2\":\"16692002332.png\",\"img3\":\"16692002333.png\",\"img4\":\"16692002334.png\",\"img5\":\"16692002335.png\",\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-17T13:40:37.000000Z\",\"updated_at\":\"2022-11-23T10:43:53.000000Z\"},\"sizes\":[{\"id\":105,\"product_id\":50,\"name\":\"S\",\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"},{\"id\":106,\"product_id\":50,\"name\":\"M\",\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"},{\"id\":107,\"product_id\":50,\"name\":\"L\",\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"}],\"categories\":[{\"id\":62,\"product_id\":50,\"category_id\":27,\"created_at\":\"2022-11-23T14:53:25.000000Z\",\"updated_at\":\"2022-11-23T14:53:25.000000Z\"}]},\"size\":\"S\",\"quantity\":3}]',17244,1,'2022-11-24 12:22:09','2022-11-24 12:22:09'),(6,'fdsfsdf','fsdfsfds','jhghjghjghjg@hgjhgjhgjhg.ru','5555','Курьер','dfghnjm','fdgdg','egegg',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":65,\"name\":\"Пальто шинель\",\"price\":25900,\"desc\":\"Состав: 95% шерсть, 5% кашемир\",\"color\":\"MOPO\",\"article\":\"TZ0006\",\"slug\":\"pal-to-shinelшинель\",\"seo_title\":\"Пальто моро VICOLO\",\"seo_desc\":null,\"views\":6,\"created_at\":\"2022-11-28T14:13:59.000000Z\",\"updated_at\":\"2022-12-28T11:40:36.000000Z\",\"images\":{\"id\":26,\"product_id\":65,\"img1\":\"16696448391.jpg\",\"img2\":\"16696448392.jpg\",\"img3\":\"16696448393.jpg\",\"img4\":\"16696448394.jpg\",\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T14:13:59.000000Z\",\"updated_at\":\"2022-11-28T14:13:59.000000Z\"},\"sizes\":[{\"id\":116,\"product_id\":65,\"name\":\"M\",\"created_at\":\"2022-11-28T14:13:59.000000Z\",\"updated_at\":\"2022-11-28T14:13:59.000000Z\"},{\"id\":117,\"product_id\":65,\"name\":\"L\",\"created_at\":\"2022-11-28T14:13:59.000000Z\",\"updated_at\":\"2022-11-28T14:13:59.000000Z\"}],\"categories\":[{\"id\":70,\"product_id\":65,\"category_id\":25,\"created_at\":\"2022-11-28T14:13:59.000000Z\",\"updated_at\":\"2022-11-28T14:13:59.000000Z\"}]},\"size\":\"M\",\"quantity\":1}]',25900,NULL,'2022-12-28 08:41:44','2022-12-28 08:41:44'),(7,'1','1','1','1','Курьер','1','1','1',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":90,\"name\":\"Джинсы темно-серые\",\"price\":10500,\"desc\":\"Состав: 100% хлопок.\",\"color\":\"серый\",\"article\":\"DZ5140\",\"slug\":\"dzhinsy-temno-seryeNTV\",\"seo_title\":\"Джинсы темно-серые VICOLO\",\"seo_desc\":null,\"views\":8,\"created_at\":\"2022-12-08T13:42:29.000000Z\",\"updated_at\":\"2022-12-28T11:42:21.000000Z\",\"images\":{\"id\":51,\"product_id\":90,\"img1\":\"16705069491.jpg\",\"img2\":\"16705069492.jpg\",\"img3\":\"16705069493.jpg\",\"img4\":\"16705069494.jpg\",\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-12-08T13:42:29.000000Z\",\"updated_at\":\"2022-12-08T13:42:29.000000Z\"},\"sizes\":[{\"id\":170,\"product_id\":90,\"name\":\"XS\",\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"},{\"id\":171,\"product_id\":90,\"name\":\"S\",\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"},{\"id\":172,\"product_id\":90,\"name\":\"M\",\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"}],\"categories\":[{\"id\":97,\"product_id\":90,\"category_id\":35,\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"}]},\"size\":\"M\",\"quantity\":4}]',42000,NULL,'2022-12-28 08:43:58','2022-12-28 08:43:58'),(8,'Антон','Чуркин','AIChurkin@1cbit.ru','+7 (981) 686-69-15','Курьер','Ивановская','5','236','Тест Антон Чуркин','Наличными при получении','Создан','[{\"product\":{\"id\":89,\"name\":\"Свитер шерсть\",\"price\":10900,\"desc\":\"Состав: 100% шерсть.\",\"color\":\"желтый\",\"article\":\"33034z\",\"slug\":\"sviter-sherstжел\",\"seo_title\":\"Свитер шерсть желтый\",\"seo_desc\":null,\"views\":6,\"created_at\":\"2022-12-08T13:33:21.000000Z\",\"updated_at\":\"2022-12-28T11:41:51.000000Z\",\"images\":{\"id\":50,\"product_id\":89,\"img1\":\"16705064011.jpg\",\"img2\":\"16705064012.jpg\",\"img3\":\"16705064013.jpg\",\"img4\":\"16705064014.jpg\",\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-12-08T13:33:21.000000Z\",\"updated_at\":\"2022-12-08T13:33:21.000000Z\"},\"sizes\":[{\"id\":169,\"product_id\":89,\"name\":\"ONE SIZE\",\"created_at\":\"2022-12-08T13:40:06.000000Z\",\"updated_at\":\"2022-12-08T13:40:06.000000Z\"}],\"categories\":[{\"id\":96,\"product_id\":89,\"category_id\":28,\"created_at\":\"2022-12-08T13:40:06.000000Z\",\"updated_at\":\"2022-12-08T13:40:06.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',10900,NULL,'2022-12-28 08:44:37','2022-12-28 08:44:37'),(9,'Egor','drozdovsky','edrozdovskiy@gmail.com','89955962753','Курьер','test','1','1',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":62,\"name\":\"Футболка оверсайз\",\"price\":3700,\"desc\":null,\"color\":\"Чёрный\",\"article\":\"UZ0042\",\"slug\":\"futbolka-oversayzчерн\",\"seo_title\":\"Футболка черная оверсайз VICOLO\",\"seo_desc\":null,\"views\":8,\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2023-01-03T11:50:57.000000Z\",\"images\":{\"id\":23,\"product_id\":62,\"img1\":\"16696439091.jpg\",\"img2\":\"16696439092.jpg\",\"img3\":\"16696439093.jpg\",\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2022-11-28T13:58:29.000000Z\"},\"sizes\":[{\"id\":113,\"product_id\":62,\"name\":\"ONE SIZE\",\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2022-11-28T13:58:29.000000Z\"}],\"categories\":[{\"id\":68,\"product_id\":62,\"category_id\":32,\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2022-11-28T13:58:29.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1},{\"product\":{\"id\":61,\"name\":\"Свитер в полоску\",\"price\":6700,\"desc\":\"Состав: 40% вискоза , 30% полиамид, 25% шерсть, 5% кашемир.\",\"color\":\"Синий\",\"article\":\"22118Z\",\"slug\":\"sviter-v-poloskuсиний\",\"seo_title\":\"Свитер в полоску VICOLO\",\"seo_desc\":null,\"views\":9,\"created_at\":\"2022-11-28T13:53:07.000000Z\",\"updated_at\":\"2023-01-10T14:56:11.000000Z\",\"images\":{\"id\":22,\"product_id\":61,\"img1\":\"16696435871.jpg\",\"img2\":\"16696435872.jpg\",\"img3\":null,\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:53:07.000000Z\",\"updated_at\":\"2022-11-28T13:53:07.000000Z\"},\"sizes\":[{\"id\":112,\"product_id\":61,\"name\":\"ONE SIZE\",\"created_at\":\"2022-11-28T13:53:48.000000Z\",\"updated_at\":\"2022-11-28T13:53:48.000000Z\"}],\"categories\":[{\"id\":67,\"product_id\":61,\"category_id\":28,\"created_at\":\"2022-11-28T13:53:48.000000Z\",\"updated_at\":\"2022-11-28T13:53:48.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',10400,NULL,'2023-01-10 11:56:34','2023-01-10 11:56:34'),(10,'test','test','test@gmail.com','89991234567','Курьер','1','1','1',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":62,\"name\":\"Футболка оверсайз\",\"price\":3700,\"desc\":null,\"color\":\"Чёрный\",\"article\":\"UZ0042\",\"slug\":\"futbolka-oversayzчерн\",\"seo_title\":\"Футболка черная оверсайз VICOLO\",\"seo_desc\":null,\"views\":8,\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2023-01-03T11:50:57.000000Z\",\"images\":{\"id\":23,\"product_id\":62,\"img1\":\"16696439091.jpg\",\"img2\":\"16696439092.jpg\",\"img3\":\"16696439093.jpg\",\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2022-11-28T13:58:29.000000Z\"},\"sizes\":[{\"id\":113,\"product_id\":62,\"name\":\"ONE SIZE\",\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2022-11-28T13:58:29.000000Z\"}],\"categories\":[{\"id\":68,\"product_id\":62,\"category_id\":32,\"created_at\":\"2022-11-28T13:58:29.000000Z\",\"updated_at\":\"2022-11-28T13:58:29.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1},{\"product\":{\"id\":61,\"name\":\"Свитер в полоску\",\"price\":6700,\"desc\":\"Состав: 40% вискоза , 30% полиамид, 25% шерсть, 5% кашемир.\",\"color\":\"Синий\",\"article\":\"22118Z\",\"slug\":\"sviter-v-poloskuсиний\",\"seo_title\":\"Свитер в полоску VICOLO\",\"seo_desc\":null,\"views\":9,\"created_at\":\"2022-11-28T13:53:07.000000Z\",\"updated_at\":\"2023-01-10T14:56:11.000000Z\",\"images\":{\"id\":22,\"product_id\":61,\"img1\":\"16696435871.jpg\",\"img2\":\"16696435872.jpg\",\"img3\":null,\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:53:07.000000Z\",\"updated_at\":\"2022-11-28T13:53:07.000000Z\"},\"sizes\":[{\"id\":112,\"product_id\":61,\"name\":\"ONE SIZE\",\"created_at\":\"2022-11-28T13:53:48.000000Z\",\"updated_at\":\"2022-11-28T13:53:48.000000Z\"}],\"categories\":[{\"id\":67,\"product_id\":61,\"category_id\":28,\"created_at\":\"2022-11-28T13:53:48.000000Z\",\"updated_at\":\"2022-11-28T13:53:48.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":2}]',17100,NULL,'2023-01-10 12:09:53','2023-01-10 12:09:53'),(11,'test','test','test@mail.ru','89991234567','Курьер','1','1','1',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":60,\"name\":\"Свитер в полоску\",\"price\":6700,\"desc\":\"Состав: 40% вискоза, 30% полиамид, 25% шерсть, 5% кашемир.\",\"color\":\"Салатовый\",\"article\":\"22118Z\",\"slug\":\"sviter-v-poloskuсалат\",\"seo_title\":\"Свитер в полоску VICOLO\",\"seo_desc\":null,\"views\":6,\"created_at\":\"2022-11-28T13:46:55.000000Z\",\"updated_at\":\"2023-01-10T15:10:18.000000Z\",\"images\":{\"id\":21,\"product_id\":60,\"img1\":\"16696432151.jpg\",\"img2\":\"16696432972.jpg\",\"img3\":\"16696432973.jpg\",\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:46:55.000000Z\",\"updated_at\":\"2022-11-28T13:48:17.000000Z\"},\"sizes\":[{\"id\":110,\"product_id\":60,\"name\":\"ONE SIZE\",\"created_at\":\"2022-11-28T13:51:26.000000Z\",\"updated_at\":\"2022-11-28T13:51:26.000000Z\"}],\"categories\":[{\"id\":65,\"product_id\":60,\"category_id\":28,\"created_at\":\"2022-11-28T13:51:26.000000Z\",\"updated_at\":\"2022-11-28T13:51:26.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',6700,NULL,'2023-01-10 12:11:06','2023-01-10 12:11:06'),(12,'Елена','Гатунок','Avenue.Italy@yandex.ru','+79532064819','Самовывоз','парковвая','1','11',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":90,\"name\":\"Джинсы темно-серые\",\"price\":10500,\"desc\":\"Состав: 100% хлопок.\",\"color\":\"серый\",\"article\":\"DZ5140\",\"slug\":\"dzhinsy-temno-seryeNTV\",\"seo_title\":\"Джинсы темно-серые VICOLO\",\"seo_desc\":null,\"views\":11,\"created_at\":\"2022-12-08T13:42:29.000000Z\",\"updated_at\":\"2023-01-23T10:02:41.000000Z\",\"images\":{\"id\":51,\"product_id\":90,\"img1\":\"16705069491.jpg\",\"img2\":\"16705069492.jpg\",\"img3\":\"16705069493.jpg\",\"img4\":\"16705069494.jpg\",\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-12-08T13:42:29.000000Z\",\"updated_at\":\"2022-12-08T13:42:29.000000Z\"},\"sizes\":[{\"id\":170,\"product_id\":90,\"name\":\"XS\",\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"},{\"id\":171,\"product_id\":90,\"name\":\"S\",\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"},{\"id\":172,\"product_id\":90,\"name\":\"M\",\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"}],\"categories\":[{\"id\":97,\"product_id\":90,\"category_id\":35,\"created_at\":\"2022-12-08T13:43:59.000000Z\",\"updated_at\":\"2022-12-08T13:43:59.000000Z\"}]},\"size\":\"XS\",\"quantity\":1}]',10500,NULL,'2023-01-23 07:03:16','2023-01-23 07:03:16'),(13,'Милена','Юшева','mopo3no@yandex.ru','+79532064819','Курьер','парковвая','1','115191, г. Москва, вн.тер.г. муниципальный округ Донской, пер Духовской, д. 17, стр. 18, этаж 4,5',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":88,\"name\":\"Свитер шерсть\",\"price\":10900,\"desc\":\"Состав: 100% шерсть\",\"color\":\"Оранжевый\",\"article\":\"55114z\",\"slug\":\"sviter-sherst\",\"seo_title\":\"Свитер шерсть оранжевый\",\"seo_desc\":null,\"views\":16,\"created_at\":\"2022-12-08T13:31:01.000000Z\",\"updated_at\":\"2023-01-23T10:04:17.000000Z\",\"images\":{\"id\":49,\"product_id\":88,\"img1\":\"16705062611.jpg\",\"img2\":\"16705062612.jpg\",\"img3\":\"16705062613.jpg\",\"img4\":\"16705062614.jpg\",\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-12-08T13:31:01.000000Z\",\"updated_at\":\"2022-12-08T13:31:01.000000Z\"},\"sizes\":[{\"id\":167,\"product_id\":88,\"name\":\"ONE SIZE\",\"created_at\":\"2022-12-08T13:31:01.000000Z\",\"updated_at\":\"2022-12-08T13:31:01.000000Z\"}],\"categories\":[{\"id\":94,\"product_id\":88,\"category_id\":28,\"created_at\":\"2022-12-08T13:31:01.000000Z\",\"updated_at\":\"2022-12-08T13:31:01.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',10900,NULL,'2023-01-23 07:04:41','2023-01-23 07:04:41'),(14,'test','tst','test@test.ru','89123456788','Самовывоз','tst','tst','1',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":82,\"name\":\"Свитер врань\",\"price\":6700,\"desc\":\"Состав: 40% вискоза 25% шерсть 25% полиамид 5% кашемир 5% ангора.\",\"color\":\"Салатовый\",\"article\":\"22101Z\",\"slug\":\"sviter-vran\",\"seo_title\":\"Свитер врань салатовый VICOLO\",\"seo_desc\":null,\"views\":11,\"created_at\":\"2022-12-01T13:09:55.000000Z\",\"updated_at\":\"2023-01-23T13:07:47.000000Z\",\"images\":{\"id\":43,\"product_id\":82,\"img1\":\"16699001951.jpg\",\"img2\":\"16699001952.jpg\",\"img3\":\"16699001953.jpg\",\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-12-01T13:09:55.000000Z\",\"updated_at\":\"2022-12-01T13:09:55.000000Z\"},\"sizes\":[{\"id\":157,\"product_id\":82,\"name\":\"ONE SIZE\",\"created_at\":\"2022-12-01T13:09:55.000000Z\",\"updated_at\":\"2022-12-01T13:09:55.000000Z\"}],\"categories\":[{\"id\":86,\"product_id\":82,\"category_id\":28,\"created_at\":\"2022-12-01T13:09:55.000000Z\",\"updated_at\":\"2022-12-01T13:09:55.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',6700,NULL,'2023-01-23 10:08:17','2023-01-23 10:08:17'),(15,'милена','левицкая','mopo3no@yandex.ru','89612674648','Самовывоз','дмитровское ш','70','2',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":60,\"name\":\"Свитер в полоску\",\"price\":100,\"desc\":\"Состав: 40% вискоза, 30% полиамид, 25% шерсть, 5% кашемир.\",\"color\":\"Салатовый\",\"article\":\"22118Z\",\"slug\":\"sviter-v-poloskuсалат\",\"seo_title\":\"Свитер в полоску VICOLO\",\"seo_desc\":null,\"views\":7,\"created_at\":\"2022-11-28T13:46:55.000000Z\",\"updated_at\":\"2023-01-27T13:42:19.000000Z\",\"images\":{\"id\":21,\"product_id\":60,\"img1\":\"16696432151.jpg\",\"img2\":\"16696432972.jpg\",\"img3\":\"16696432973.jpg\",\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:46:55.000000Z\",\"updated_at\":\"2022-11-28T13:48:17.000000Z\"},\"sizes\":[{\"id\":173,\"product_id\":60,\"name\":\"ONE SIZE\",\"created_at\":\"2023-01-27T13:41:54.000000Z\",\"updated_at\":\"2023-01-27T13:41:54.000000Z\"}],\"categories\":[{\"id\":98,\"product_id\":60,\"category_id\":28,\"created_at\":\"2023-01-27T13:41:54.000000Z\",\"updated_at\":\"2023-01-27T13:41:54.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',100,NULL,'2023-01-27 10:43:40','2023-01-27 10:43:40'),(16,'Иван','Куликов','ioannkul20@gmail.com','89169431307','Курьер','Победы','6','52',NULL,'Банковской картой','Создан','[{\"product\":{\"id\":61,\"name\":\"Свитер в полоску\",\"price\":6700,\"desc\":\"Состав: 40% вискоза , 30% полиамид, 25% шерсть, 5% кашемир.\",\"color\":\"Синий\",\"article\":\"22118Z\",\"slug\":\"sviter-v-poloskuсиний\",\"seo_title\":\"Свитер в полоску VICOLO\",\"seo_desc\":null,\"views\":14,\"created_at\":\"2022-11-28T13:53:07.000000Z\",\"updated_at\":\"2023-03-04T07:10:35.000000Z\",\"images\":{\"id\":22,\"product_id\":61,\"img1\":\"16696435871.jpg\",\"img2\":\"16696435872.jpg\",\"img3\":null,\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:53:07.000000Z\",\"updated_at\":\"2022-11-28T13:53:07.000000Z\"},\"sizes\":[{\"id\":112,\"product_id\":61,\"name\":\"ONE SIZE\",\"created_at\":\"2022-11-28T13:53:48.000000Z\",\"updated_at\":\"2022-11-28T13:53:48.000000Z\"}],\"categories\":[{\"id\":67,\"product_id\":61,\"category_id\":28,\"created_at\":\"2022-11-28T13:53:48.000000Z\",\"updated_at\":\"2022-11-28T13:53:48.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',6700,NULL,'2023-03-04 04:11:41','2023-03-04 04:11:41'),(17,'Elena','Gatunok','Lena2008-08@inbox.ru','89532064819','Курьер','Духовской','19','8',NULL,'Наличными при получении','Отменен','[{\"product\":{\"id\":60,\"name\":\"Свитер в полоску\",\"price\":6500,\"desc\":\"Состав: 40% вискоза, 30% полиамид, 25% шерсть, 5% кашемир.\",\"color\":\"Салатовый\",\"article\":\"22118Z\",\"slug\":\"sviter-v-poloskuсалат\",\"seo_title\":\"Свитер в полоску VICOLO\",\"seo_desc\":null,\"views\":12,\"created_at\":\"2022-11-28T13:46:55.000000Z\",\"updated_at\":\"2023-03-05T04:45:22.000000Z\",\"images\":{\"id\":21,\"product_id\":60,\"img1\":\"16696432151.jpg\",\"img2\":\"16696432972.jpg\",\"img3\":\"16696432973.jpg\",\"img4\":null,\"img5\":null,\"img6\":null,\"img7\":null,\"img8\":null,\"img9\":null,\"img10\":null,\"created_at\":\"2022-11-28T13:46:55.000000Z\",\"updated_at\":\"2022-11-28T13:48:17.000000Z\"},\"sizes\":[{\"id\":175,\"product_id\":60,\"name\":\"ONE SIZE\",\"created_at\":\"2023-01-27T13:45:30.000000Z\",\"updated_at\":\"2023-01-27T13:45:30.000000Z\"}],\"categories\":[{\"id\":100,\"product_id\":60,\"category_id\":28,\"created_at\":\"2023-01-27T13:45:30.000000Z\",\"updated_at\":\"2023-01-27T13:45:30.000000Z\"}]},\"size\":\"ONE SIZE\",\"quantity\":1}]',6500,NULL,'2023-03-05 01:46:59','2023-03-11 13:06:13');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `img1` text COLLATE utf8mb4_unicode_ci,
  `img2` text COLLATE utf8mb4_unicode_ci,
  `img3` text COLLATE utf8mb4_unicode_ci,
  `img4` text COLLATE utf8mb4_unicode_ci,
  `img5` text COLLATE utf8mb4_unicode_ci,
  `img6` text COLLATE utf8mb4_unicode_ci,
  `img7` text COLLATE utf8mb4_unicode_ci,
  `img8` text COLLATE utf8mb4_unicode_ci,
  `img9` text COLLATE utf8mb4_unicode_ci,
  `img10` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (21,60,'16696432151.jpg','16696432972.jpg','16696432973.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 10:46:55','2022-11-28 10:48:17'),(22,61,'16696435871.jpg','16696435872.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 10:53:07','2022-11-28 10:53:07'),(23,62,'16696439091.jpg','16696439092.jpg','16696439093.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 10:58:29','2022-11-28 10:58:29'),(24,63,'16696441531.jpg','16696441532.jpg','16696441533.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:02:33','2022-11-28 11:02:33'),(25,64,'16696444791.jpg','16696444792.jpg','16696444793.jpg','16696444794.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:07:59','2022-11-28 11:07:59'),(26,65,'16696448391.jpg','16696448392.jpg','16696448393.jpg','16696448394.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:13:59','2022-11-28 11:13:59'),(27,66,'16696453891.jpg','16696453892.jpg','16696453893.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:23:09','2022-11-28 11:23:09'),(28,67,'16696454911.jpg','16696454912.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:24:51','2022-11-28 11:24:51'),(29,68,'16696456561.jpg','16696456562.jpg','16696456563.jpg','16696456564.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:27:36','2022-11-28 11:27:36'),(30,69,'16696460801.jpg','16696460802.jpg','16696460803.jpg','16696460804.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:34:40','2022-11-28 11:34:40'),(31,70,'16696464011.jpg','16696464012.jpg','16696464013.jpg','16696464014.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-28 11:40:01','2022-11-28 11:40:01'),(32,71,'16698164611.jpg','16698164612.jpg','16698164613.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 10:54:21','2022-11-30 10:54:21'),(33,72,'16698165991.jpg','16698165992.jpg','16698165993.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 10:56:39','2022-11-30 10:56:39'),(34,73,'16698168711.jpg','16698168712.jpg','16698168713.jpg','16698168714.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 11:01:11','2022-11-30 11:01:11'),(35,74,'16698171651.jpg','16698171652.jpg','16698171653.jpg','16698171654.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 11:06:05','2022-11-30 11:06:05'),(36,75,'16698181761.jpg','16698181762.jpg','16698181763.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 11:22:56','2022-11-30 11:22:56'),(37,76,'16698183351.jpg','16698183352.jpg','16698183353.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 11:25:35','2022-11-30 11:25:35'),(38,77,'16698184771.jpg','16698184772.jpg','16698184773.jpg','16698184774.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 11:27:57','2022-11-30 11:27:57'),(39,78,'16698185831.jpg','16698185832.jpg','16698185833.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-30 11:29:43','2022-11-30 11:29:43'),(40,79,'16698986241.jpg','16698986242.jpg','16698986243.jpg','16698986244.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 09:43:44','2022-12-01 09:43:44'),(41,80,'16698998511.jpg','16698998512.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 10:04:11','2022-12-01 10:04:11'),(42,81,'16699000381.jpg','16699000382.jpg','16699000383.jpg','16699000384.jpg','16699000385.jpg',NULL,NULL,NULL,NULL,NULL,'2022-12-01 10:07:18','2022-12-01 10:07:18'),(43,82,'16699001951.jpg','16699001952.jpg','16699001953.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 10:09:55','2022-12-01 10:09:55'),(44,83,'16699003181.jpg','16699003182.jpg','16699003183.jpg','16699003184.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 10:11:58','2022-12-01 10:11:58'),(45,84,'16699007671.jpg','16699007672.jpg','16699007673.jpg','16699007674.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 10:19:27','2022-12-01 10:19:27'),(46,85,'16699017671.jpg','16699017672.jpg','16699017673.jpg','16699017674.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 10:36:07','2022-12-01 10:36:07'),(47,86,'16699041951.jpg','16699041952.jpg','16699041953.jpg','16699041954.jpg','16699041955.jpg',NULL,NULL,NULL,NULL,NULL,'2022-12-01 11:16:35','2022-12-01 11:16:35'),(48,87,'16699045041.jpg','16699045042.jpg','16699045043.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-01 11:21:44','2022-12-01 11:21:44'),(49,88,'16705062611.jpg','16705062612.jpg','16705062613.jpg','16705062614.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 10:31:01','2022-12-08 10:31:01'),(50,89,'16705064011.jpg','16705064012.jpg','16705064013.jpg','16705064014.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 10:33:21','2022-12-08 10:33:21'),(51,90,'16705069491.jpg','16705069492.jpg','16705069493.jpg','16705069494.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-12-08 10:42:29','2022-12-08 10:42:29');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_sizes_product_id_foreign` (`product_id`),
  CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (112,61,'ONE SIZE','2022-11-28 10:53:48','2022-11-28 10:53:48'),(113,62,'ONE SIZE','2022-11-28 10:58:29','2022-11-28 10:58:29'),(114,64,'S','2022-11-28 11:07:59','2022-11-28 11:07:59'),(115,64,'M','2022-11-28 11:07:59','2022-11-28 11:07:59'),(116,65,'M','2022-11-28 11:13:59','2022-11-28 11:13:59'),(117,65,'L','2022-11-28 11:13:59','2022-11-28 11:13:59'),(118,66,'ONE SIZE','2022-11-28 11:23:09','2022-11-28 11:23:09'),(119,67,'ONE SIZE','2022-11-28 11:24:51','2022-11-28 11:24:51'),(120,69,'XS','2022-11-28 11:34:40','2022-11-28 11:34:40'),(121,69,'S','2022-11-28 11:34:40','2022-11-28 11:34:40'),(122,69,'M','2022-11-28 11:34:40','2022-11-28 11:34:40'),(123,69,'L','2022-11-28 11:34:40','2022-11-28 11:34:40'),(124,70,'S','2022-11-28 11:40:01','2022-11-28 11:40:01'),(125,70,'M','2022-11-28 11:40:01','2022-11-28 11:40:01'),(126,70,'L','2022-11-28 11:40:01','2022-11-28 11:40:01'),(127,71,'S','2022-11-30 10:54:21','2022-11-30 10:54:21'),(128,71,'M','2022-11-30 10:54:21','2022-11-30 10:54:21'),(129,71,'L','2022-11-30 10:54:21','2022-11-30 10:54:21'),(130,72,'S','2022-11-30 10:56:39','2022-11-30 10:56:39'),(131,72,'M','2022-11-30 10:56:39','2022-11-30 10:56:39'),(132,72,'L','2022-11-30 10:56:39','2022-11-30 10:56:39'),(133,74,'XS','2022-11-30 11:06:05','2022-11-30 11:06:05'),(134,74,'S','2022-11-30 11:06:05','2022-11-30 11:06:05'),(135,74,'M','2022-11-30 11:06:05','2022-11-30 11:06:05'),(136,74,'L','2022-11-30 11:06:05','2022-11-30 11:06:05'),(137,75,'S','2022-11-30 11:22:56','2022-11-30 11:22:56'),(138,75,'M','2022-11-30 11:22:56','2022-11-30 11:22:56'),(139,75,'L','2022-11-30 11:22:56','2022-11-30 11:22:56'),(140,76,'S','2022-11-30 11:25:35','2022-11-30 11:25:35'),(141,76,'M','2022-11-30 11:25:35','2022-11-30 11:25:35'),(142,76,'L','2022-11-30 11:25:35','2022-11-30 11:25:35'),(143,77,'S','2022-11-30 11:27:57','2022-11-30 11:27:57'),(144,77,'M','2022-11-30 11:27:57','2022-11-30 11:27:57'),(145,77,'L','2022-11-30 11:27:57','2022-11-30 11:27:57'),(146,78,'S','2022-11-30 11:29:43','2022-11-30 11:29:43'),(147,78,'M','2022-11-30 11:29:43','2022-11-30 11:29:43'),(148,78,'L','2022-11-30 11:29:43','2022-11-30 11:29:43'),(149,79,'S','2022-12-01 09:43:44','2022-12-01 09:43:44'),(150,79,'M','2022-12-01 09:43:44','2022-12-01 09:43:44'),(151,80,'XS','2022-12-01 10:04:11','2022-12-01 10:04:11'),(152,80,'S','2022-12-01 10:04:11','2022-12-01 10:04:11'),(153,80,'M','2022-12-01 10:04:11','2022-12-01 10:04:11'),(154,81,'S','2022-12-01 10:07:18','2022-12-01 10:07:18'),(155,81,'M','2022-12-01 10:07:18','2022-12-01 10:07:18'),(156,81,'L','2022-12-01 10:07:18','2022-12-01 10:07:18'),(157,82,'ONE SIZE','2022-12-01 10:09:55','2022-12-01 10:09:55'),(158,83,'ONE SIZE','2022-12-01 10:11:58','2022-12-01 10:11:58'),(159,84,'M','2022-12-01 10:19:27','2022-12-01 10:19:27'),(160,84,'L','2022-12-01 10:19:27','2022-12-01 10:19:27'),(161,85,'ONE SIZE','2022-12-01 10:36:07','2022-12-01 10:36:07'),(162,86,'S','2022-12-01 11:16:35','2022-12-01 11:16:35'),(163,86,'M','2022-12-01 11:16:35','2022-12-01 11:16:35'),(164,87,'XS','2022-12-01 11:21:44','2022-12-01 11:21:44'),(165,87,'S','2022-12-01 11:21:44','2022-12-01 11:21:44'),(166,87,'L','2022-12-01 11:21:44','2022-12-01 11:21:44'),(167,88,'ONE SIZE','2022-12-08 10:31:01','2022-12-08 10:31:01'),(169,89,'ONE SIZE','2022-12-08 10:40:06','2022-12-08 10:40:06'),(170,90,'XS','2022-12-08 10:43:59','2022-12-08 10:43:59'),(171,90,'S','2022-12-08 10:43:59','2022-12-08 10:43:59'),(172,90,'M','2022-12-08 10:43:59','2022-12-08 10:43:59'),(175,60,'ONE SIZE','2023-01-27 10:45:30','2023-01-27 10:45:30');
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_to_categories`
--

DROP TABLE IF EXISTS `product_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_to_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_to_categories_product_id_foreign` (`product_id`),
  KEY `product_to_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_to_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `product_to_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_to_categories`
--

LOCK TABLES `product_to_categories` WRITE;
/*!40000 ALTER TABLE `product_to_categories` DISABLE KEYS */;
INSERT INTO `product_to_categories` VALUES (67,61,28,'2022-11-28 10:53:48','2022-11-28 10:53:48'),(68,62,32,'2022-11-28 10:58:29','2022-11-28 10:58:29'),(69,64,25,'2022-11-28 11:07:59','2022-11-28 11:07:59'),(70,65,25,'2022-11-28 11:13:59','2022-11-28 11:13:59'),(71,66,27,'2022-11-28 11:23:09','2022-11-28 11:23:09'),(72,67,27,'2022-11-28 11:24:51','2022-11-28 11:24:51'),(73,69,35,'2022-11-28 11:34:40','2022-11-28 11:34:40'),(74,70,25,'2022-11-28 11:40:01','2022-11-28 11:40:01'),(75,71,25,'2022-11-30 10:54:21','2022-11-30 10:54:21'),(76,72,25,'2022-11-30 10:56:39','2022-11-30 10:56:39'),(77,74,35,'2022-11-30 11:06:05','2022-11-30 11:06:05'),(78,75,25,'2022-11-30 11:22:56','2022-11-30 11:22:56'),(79,76,25,'2022-11-30 11:25:35','2022-11-30 11:25:35'),(80,77,25,'2022-11-30 11:27:57','2022-11-30 11:27:57'),(81,78,25,'2022-11-30 11:29:43','2022-11-30 11:29:43'),(82,63,32,'2022-11-30 11:40:52','2022-11-30 11:40:52'),(83,79,35,'2022-12-01 09:43:44','2022-12-01 09:43:44'),(84,80,35,'2022-12-01 10:04:11','2022-12-01 10:04:11'),(85,81,35,'2022-12-01 10:07:18','2022-12-01 10:07:18'),(86,82,28,'2022-12-01 10:09:55','2022-12-01 10:09:55'),(87,83,28,'2022-12-01 10:11:58','2022-12-01 10:11:58'),(88,73,26,'2022-12-01 10:17:49','2022-12-01 10:17:49'),(89,84,26,'2022-12-01 10:19:27','2022-12-01 10:19:27'),(90,85,28,'2022-12-01 10:36:07','2022-12-01 10:36:07'),(91,85,29,'2022-12-01 10:36:07','2022-12-01 10:36:07'),(92,86,25,'2022-12-01 11:16:35','2022-12-01 11:16:35'),(93,87,35,'2022-12-01 11:21:44','2022-12-01 11:21:44'),(94,88,28,'2022-12-08 10:31:01','2022-12-08 10:31:01'),(96,89,28,'2022-12-08 10:40:06','2022-12-08 10:40:06'),(97,90,35,'2022-12-08 10:43:59','2022-12-08 10:43:59'),(100,60,28,'2023-01-27 10:45:30','2023-01-27 10:45:30');
/*!40000 ALTER TABLE `product_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `color` text COLLATE utf8mb4_unicode_ci,
  `article` text COLLATE utf8mb4_unicode_ci,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` text COLLATE utf8mb4_unicode_ci,
  `seo_desc` text COLLATE utf8mb4_unicode_ci,
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (60,'Свитер в полоску',6500,'Состав: 40% вискоза, 30% полиамид, 25% шерсть, 5% кашемир.','Салатовый','22118Z','sviter-v-poloskuсалат','Свитер в полоску VICOLO',NULL,14,'2022-11-28 10:46:55','2023-03-21 20:21:41'),(61,'Свитер в полоску',6700,'Состав: 40% вискоза , 30% полиамид, 25% шерсть, 5% кашемир.','Синий','22118Z','sviter-v-poloskuсиний','Свитер в полоску VICOLO',NULL,17,'2022-11-28 10:53:07','2023-03-27 07:29:43'),(62,'Футболка оверсайз',3700,NULL,'Чёрный','UZ0042','futbolka-oversayzчерн','Футболка черная оверсайз VICOLO',NULL,10,'2022-11-28 10:58:29','2023-03-04 19:09:04'),(63,'Футболка оверсайз',3700,'Состав: 100% хлопок','Белый','UZ0042','futbolka-oversayzбелая','Футболка белая оверсайз VICOLO',NULL,12,'2022-11-28 11:02:33','2023-04-02 08:43:48'),(64,'Пальто халат',25900,'Состав: 50% шерсть. 50% кашемир.','Фуксия','TZ0011','pal-to-halat','Пальто халат фуксия VICOLO',NULL,12,'2022-11-28 11:07:59','2023-03-05 07:56:11'),(65,'Пальто шинель',25900,'Состав: 95% шерсть, 5% кашемир','MOPO','TZ0006','pal-to-shinelшинель','Пальто моро VICOLO',NULL,21,'2022-11-28 11:13:59','2023-03-02 09:55:35'),(66,'Платье-сорочка',6500,'Состав: 100% полиэстер','Чёрный','TZ0253','plat-e-sorochkaчерн','Платье-сорочка чёрная VICOLO',NULL,10,'2022-11-28 11:23:09','2023-03-02 09:07:23'),(67,'Платье-сорочка',6500,'Состав: 100% полиэстер','Фуксия','TZ0253','plat-e-sorochkaФУК','Платье-сорочка фуксия VICOLO',NULL,15,'2022-11-28 11:24:51','2023-04-02 08:44:00'),(68,'Платье-сорочка',6500,'Состав: 100% полиэстер.','Зеленый','TZ0253','plat-e-sorochkaзелен','Платье-сорочка зеленый VICOLO',NULL,4,'2022-11-28 11:27:36','2023-02-12 01:05:29'),(69,'Джинсы скинни',8500,'Состав: 79% хлопок, 14% лайкра, 7% эластан.','Синий','DZ5016','dzhinsy-skinni','Джинсы скинни VICOLO',NULL,10,'2022-11-28 11:34:40','2023-04-05 05:50:04'),(70,'Пальто халат',25900,'Состав: 50% шерсть. 50% кашемир.','Бежевый','TZ0011','pal-to-halatБЕЖ','Пальто халат бежевый VICOLO',NULL,3,'2022-11-28 11:40:01','2023-01-29 16:28:18'),(71,'Полупальто апероль',21000,'Состав: 50% ШЕРСТЬ 50% ПОЛИЭСТЕР','Оранжевый','TZ0012','polupal-to-aperol','Полупальто апероль VICOLO',NULL,3,'2022-11-30 10:54:21','2023-01-29 16:28:16'),(72,'Полупальто зелёное',21000,'Состав: , 50% ШЕРСТЬ 50% ПОЛИЭСТЕР.','Зеленый','TZ0012','polupal-to-zeljonoe','Полупальто зелёное VICOLO',NULL,10,'2022-11-30 10:56:39','2023-03-27 21:05:13'),(73,'Костюм кэмел',14500,'Состав: 69% ПОЛИЭСТЕР 28% ВИСКОЗА 3%ЭЛАСТАН.','Бежевый','TZ0783','kostyum-kemel','Костюм кэмел VICOLO',NULL,11,'2022-11-30 11:01:11','2023-03-06 05:11:16'),(74,'Джинсы push-up',9600,'Состав: ЧЕРНЫЙ, 97% ХЛОПОК 3% ЭЛАСТАН','Чёрный','DZ5119','dzhinsy-push-up','Джинсы push-up VICOLO',NULL,9,'2022-11-30 11:06:05','2023-03-11 13:13:02'),(75,'Пальто кокон чёрный',25900,'Состав: 50% ШЕРСТЬ 50% ПОЛИЭСТЕР','Чёрный','TZ0070','pal-to-kokon-chjornyy','Пальто кокон чёрный VICOLO',NULL,15,'2022-11-30 11:22:56','2023-03-27 17:01:15'),(76,'Пальто кокон фуксия',25900,'Состав: ФУКСИЯ, 50% ШЕРСТЬ 50% ПОЛИЭСТЕР.','Фуксия','TZ0070','pal-to-kokon-fuksiya','Пальто кокон фуксия VICOLO',NULL,17,'2022-11-30 11:25:35','2023-03-27 08:57:28'),(77,'Пальто кокон бежевый',25900,'Состав: 50% ШЕРСТЬ 50% ПОЛИЭСТЕР.','Бежевый','TZ0070','pal-to-kokon-bezhevyy','Пальто кокон бежевый VICOLO',NULL,13,'2022-11-30 11:27:57','2023-03-13 02:39:38'),(78,'Пальто кокон зеленый',25900,'Состав: 50% ШЕРСТЬ 50% ПОЛИЭСТЕР','Зеленый','TZ0070','pal-to-kokon-zelenyy','Пальто кокон зеленый VICOLO',NULL,9,'2022-11-30 11:29:43','2023-03-13 02:40:40'),(79,'Джинсы MOM',9600,'Состав: 100% хлопок.','Голубой','DZ5072','dzhinsy-mom','Джинсы MOM VICOLO',NULL,15,'2022-12-01 09:43:44','2023-03-05 03:29:32'),(80,'Джинсы скинни',8500,'Состав: 92% ХЛОПОК 8% ЭЛАСТАН','Чёрный','DZ5065','dzhinsy-skinniчерн','Джинсы скинни VICOLO',NULL,14,'2022-12-01 10:04:11','2023-03-29 15:09:05'),(81,'Джинсы трубы',9600,'Состав: 100% хлопок.','Синий','DZ5125','dzhinsy-truby','Джинсы трубы VICOLO',NULL,16,'2022-12-01 10:07:18','2023-04-05 07:56:08'),(82,'Свитер врань',6700,'Состав: 40% вискоза 25% шерсть 25% полиамид 5% кашемир 5% ангора.','Салатовый','22101Z','sviter-vran','Свитер врань салатовый VICOLO',NULL,25,'2022-12-01 10:09:55','2023-04-02 08:43:47'),(83,'Свитер врань',6700,'Состав: 40% вискоза 25% шерсть 25% полиамид 5% кашемир 5% ангора.','Молочный','22101Z','sviter-vranМОЛОЧ','Свитер врань молочный VICOLO',NULL,17,'2022-12-01 10:11:58','2023-03-16 16:57:33'),(84,'Костюм мята',14500,'Состав: 69% ПОЛИЭСТЕР 28% ВИСКОЗА 3%ЭЛАСТАН.','Мятный','Артикул: TZ0783','kostyum-myata','Костюм мята VICOLO',NULL,12,'2022-12-01 10:19:27','2023-04-04 03:45:54'),(85,'Свитер кашемир',8100,'Состав: 55% ШЕРСТЬ 45% КАШЕМИР','Чёрный','22053Z','sviter-kashemir','Свитер кашемир VICOLO',NULL,23,'2022-12-01 10:36:07','2023-03-29 19:38:31'),(86,'Пальто с капюшоном',26320,'Состав: 50% ШЕРСТЬ 50% ПОЛИЭСТЕР','Чёрный','TZ0024','pal-to-s-kapyushonom','Пальто с капюшоном VICOLO',NULL,10,'2022-12-01 11:16:35','2023-02-12 02:30:59'),(87,'Джинсы клеш',9400,'Состав:  79% ХЛОПОК 15% ЛИОЦЕЛЛ 6% ЭЛАСТАН','Синий','DZ5015','dzhinsy-klesh','Джинсы клеш VICOLO',NULL,12,'2022-12-01 11:21:44','2023-03-27 08:37:06'),(88,'Свитер шерсть',10900,'Состав: 100% шерсть','Оранжевый','55114z','sviter-sherst','Свитер шерсть оранжевый',NULL,25,'2022-12-08 10:31:01','2023-03-11 13:04:19'),(89,'Свитер шерсть',10900,'Состав: 100% шерсть.','желтый','33034z','sviter-sherstжел','Свитер шерсть желтый',NULL,25,'2022-12-08 10:33:21','2023-04-03 04:53:45'),(90,'Джинсы темно-серые',10500,'Состав: 100% хлопок.','серый','DZ5140','dzhinsy-temno-seryeNTV','Джинсы темно-серые VICOLO',NULL,22,'2022-12-08 10:42:29','2023-04-01 10:22:10');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodes`
--

DROP TABLE IF EXISTS `promocodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `uses` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodes`
--

LOCK TABLES `promocodes` WRITE;
/*!40000 ALTER TABLE `promocodes` DISABLE KEYS */;
INSERT INTO `promocodes` VALUES (1,'1x5r43e',10,1000,'2022-11-09 13:06:08','2022-11-09 13:19:01');
/*!40000 ALTER TABLE `promocodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'email','Email','Avenue.Italy@yandex.ru',NULL,'2022-11-09 11:58:01',0),(2,'phone','Телефон','+79532064819',NULL,'2022-11-28 07:06:10',0),(3,'address','Адрес магазина','Москва. Ул Русаковская 31  ТЦ СОКОЛЬНИКИ , «Телеграф»',NULL,'2022-11-09 11:58:11',0),(4,'instagram','Instagram','https://instagram.com/avenue___17?igshid=YTY2NzY3YTc=',NULL,'2022-11-28 07:06:10',0),(5,'vk','VK','https://vk.com/',NULL,'2022-11-09 14:09:50',0),(6,'facebook','Facebook','https://ru-ru.facebook.com/',NULL,'2022-11-09 14:09:50',0),(7,'telegram','Telegram',NULL,NULL,'2022-11-28 07:06:10',0),(8,'banner','Баннер','1667997854banner.jpg',NULL,'2022-11-09 12:44:14',1),(9,'philosophy','Философия','1667997926philosophy.png',NULL,'2022-11-09 12:45:27',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizes`
--

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;
INSERT INTO `sizes` VALUES (3,'XS','2022-11-02 18:55:20','2022-11-02 18:55:20'),(4,'S','2022-11-02 18:55:23','2022-11-02 18:55:23'),(5,'M','2022-11-02 18:55:27','2022-11-02 18:55:27'),(6,'L','2022-11-02 18:55:33','2022-11-02 18:55:33'),(7,'XL','2022-11-02 18:55:39','2022-11-02 18:55:39'),(8,'XXL','2022-11-02 18:55:44','2022-11-02 18:55:44'),(9,'XXS','2022-11-02 18:58:03','2022-11-02 18:58:03'),(11,'ONE SIZE','2022-11-28 10:43:42','2022-11-28 10:43:42');
/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@mail.ru',NULL,'$2y$10$09QRsIGtXH93fg6KodHNNeDdaywANpO6fnb538dyl/DTOZv.KtBne','L2PiRkrxKK55VODSx0WPY93uYaCAyjOJAY8i6jjytpA4G4aenbrwGFmH9WoX','2022-10-25 13:34:16','2023-03-05 07:11:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-05 20:07:27
