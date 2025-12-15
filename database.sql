-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: nest
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'x6E7P8UMLspW87RLXpudKAvXM5BYWU7b',1,'2025-06-29 06:23:15','2025-06-29 06:23:15','2025-06-29 06:23:15');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Everyday Fresh','2030-06-29 00:00:00','not_set','IZ6WU8KUALYD','promotion/1.png','/products',0,1,'published','2025-06-29 06:23:22','2025-06-29 06:23:22',1,NULL,NULL,NULL,NULL),(2,'Make your Breakfast','2030-06-29 00:00:00','not_set','ILSFJVYFGCPZ','promotion/2.png','/products',0,2,'published','2025-06-29 06:23:22','2025-06-29 06:23:22',1,NULL,NULL,NULL,NULL),(3,'The best Organic','2030-06-29 00:00:00','not_set','ILSDKVYFGXPH','promotion/3.png','/products',0,3,'published','2025-06-29 06:23:22','2025-06-29 06:23:22',1,NULL,NULL,NULL,NULL),(4,'Bring nature into your home','2030-06-29 00:00:00','not_set','IZ6WU8KUALYG','promotion/4.png','/products',0,4,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(5,'Delivered to your home','2030-06-29 00:00:00','not_set','IZ6WU8KUALYH','promotion/5.png','/products',0,5,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(6,'Save 17% on Oganic Juice','2030-06-29 00:00:00','not_set','IZ6WU8KUALYI','promotion/6.png','/products',0,6,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(7,'Everyday Fresh & Clean with Our Products','2030-06-29 00:00:00','not_set','IZ6WU8KUALYJ','promotion/7.png','/products',0,7,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(8,'The best Organic Products Online','2030-06-29 00:00:00','not_set','IZ6WU8KUALYK','promotion/8.png','/products',0,8,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(9,'Everyday Fresh with Our Products','2030-06-29 00:00:00','not_set','IZ6WU8KUALYL','promotion/9.png',NULL,0,9,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(10,'100% guaranteed all Fresh items','2030-06-29 00:00:00','not_set','IZ6WU8KUALYM','promotion/10.png',NULL,0,10,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(11,'Special grocery sale off this month','2030-06-29 00:00:00','not_set','IZ6WU8KUALYN','promotion/11.png',NULL,0,11,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL),(12,'Enjoy 15% OFF for all vegetable and fruit','2030-06-29 00:00:00','not_set','IZ6WU8KUALYO','promotion/12.png',NULL,0,12,'published','2025-06-29 06:23:23','2025-06-29 06:23:23',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Neque aut atque vitae et. Reiciendis dolorum corrupti consequuntur ut ut eligendi et. Assumenda molestiae debitis dolorem delectus autem eum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(2,'Fashion',0,'Quo reiciendis natus autem at nihil non. Perferendis aut dolorem et quis. Quisquam quis nostrum quo beatae inventore id.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(3,'Electronic',0,'Ut soluta eum dignissimos et quod voluptatum. Maiores molestias non modi sunt ipsa cupiditate sed. Molestiae labore dolorem et aut minima voluptatibus. Iure dolores sint perferendis illo.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(4,'Commercial',0,'Occaecati occaecati quia odio enim tempora incidunt. Doloremque suscipit tempora qui quia.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-06-29 06:23:14','2025-06-29 06:23:14');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Perxsion',NULL,NULL,NULL,'published',0,1,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(2,'Hiching',NULL,NULL,NULL,'published',1,1,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(3,'Kepslo',NULL,NULL,NULL,'published',2,1,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(4,'Groneba',NULL,NULL,NULL,'published',3,1,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(5,'Babian',NULL,NULL,NULL,'published',4,1,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(6,'Valorant',NULL,NULL,NULL,'published',5,1,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(7,'Pure',NULL,NULL,NULL,'published',6,1,'2025-06-29 06:22:47','2025-06-29 06:22:47');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(2,'EUR','€',0,2,1,0,0.84,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(3,'VND','₫',0,0,2,0,23203,'2025-06-29 06:22:47','2025-06-29 06:22:47'),(4,'NGN','₦',1,2,2,0,895.52,'2025-06-29 06:22:47','2025-06-29 06:22:47');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'Prof. Jairo Volkman','customer@botble.com','+13808705965','SS','Minnesota','East Lester','742 Ashly Point',1,1,'2025-06-29 06:23:03','2025-06-29 06:23:03','65303-7271'),(2,'Prof. Jairo Volkman','customer@botble.com','+14426130198','BD','District of Columbia','Chelseyborough','93828 Pinkie Stravenue Suite 516',1,0,'2025-06-29 06:23:03','2025-06-29 06:23:03','96273-7023'),(3,'Shanna Dicki','vendor@botble.com','+15597707042','GF','Alabama','East Ambrosemouth','28255 Montana Shoals',2,1,'2025-06-29 06:23:03','2025-06-29 06:23:03','46566'),(4,'Shanna Dicki','vendor@botble.com','+14759148140','ER','Illinois','Sharonville','731 Bailey Fields Suite 563',2,0,'2025-06-29 06:23:03','2025-06-29 06:23:03','23706-3885'),(5,'Carolyn Feeney','corine.kuphal@example.org','+17698572594','AQ','Washington','Bridiefort','18357 Faye Glens Apt. 895',3,1,'2025-06-29 06:23:04','2025-06-29 06:23:04','16894'),(6,'Terence Ebert','tanya01@example.org','+18607469830','LV','Missouri','West Will','52236 Wilkinson Shores Apt. 834',4,1,'2025-06-29 06:23:04','2025-06-29 06:23:04','12051-5989'),(7,'Eusebio Boyer','cconsidine@example.org','+14795412301','AE','Tennessee','South Lue','50407 McKenzie Green',5,1,'2025-06-29 06:23:04','2025-06-29 06:23:04','06041-1811'),(8,'Raven Cole','dickinson.sydney@example.net','+13645821697','GQ','North Carolina','East Broderickstad','718 Madelynn Camp',6,1,'2025-06-29 06:23:05','2025-06-29 06:23:05','89022'),(9,'Myriam Oberbrunner','zwolf@example.org','+15139304933','PT','Louisiana','North Taryn','9094 Kenna Ville',7,1,'2025-06-29 06:23:05','2025-06-29 06:23:05','90332'),(10,'Connie Breitenberg','plarkin@example.net','+18707830349','SS','New York','East Madilyn','4199 VonRueden Harbors Apt. 096',8,1,'2025-06-29 06:23:06','2025-06-29 06:23:06','57613'),(11,'Dr. Jermain Kunze','lysanne.prosacco@example.org','+14044015013','CD','Wyoming','Nienowfurt','795 Goldner Squares',9,1,'2025-06-29 06:23:06','2025-06-29 06:23:06','32555'),(12,'Freddie Leuschke','cassidy99@example.net','+15407767252','RS','Washington','North Micaela','43615 Declan Ports Apt. 516',10,1,'2025-06-29 06:23:07','2025-06-29 06:23:07','52093-5991');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_used_coupons`
--

DROP TABLE IF EXISTS `ec_customer_used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_used_coupons`
--

LOCK TABLES `ec_customer_used_coupons` WRITE;
/*!40000 ALTER TABLE `ec_customer_used_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  `block_reason` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_verified_at` datetime DEFAULT NULL,
  `stripe_account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'Prof. Jairo Volkman','customer@botble.com','$2y$12$j.FfIoUtQp2PsJA1KXgzFuwfRMUpM3/gnZJSUE.Ar66HWVk2BDKJ2','customers/10.jpg','2003-06-21','+16784399364',NULL,'2025-06-29 06:23:03','2025-06-29 06:23:03','2025-06-29 13:23:03',NULL,'activated',NULL,NULL,0,NULL,NULL,0),(2,'Shanna Dicki','vendor@botble.com','$2y$12$AR0v7sOAtdAozGCFd3ngoek6XExqu4SkT.lCCk.yXdKihdFrOF7MS','customers/8.jpg','1983-06-12','+13025032196',NULL,'2025-06-29 06:23:03','2025-06-29 06:23:25','2025-06-29 13:23:03',NULL,'activated',NULL,NULL,1,'2025-06-29 13:23:25',NULL,0),(3,'Carolyn Feeney','corine.kuphal@example.org','$2y$12$78F9Xz/MavzVxqs1FTLu6.YcqmvqRoHvVHqC8CosCksAA6/xB6Kny','customers/1.jpg','1999-06-09','+13853054730',NULL,'2025-06-29 06:23:04','2025-06-29 06:23:25','2025-06-29 13:23:04',NULL,'activated',NULL,NULL,1,'2025-06-29 13:23:25',NULL,0),(4,'Terence Ebert','tanya01@example.org','$2y$12$sNtqe01T6c.LAS4dUEeLwO5V2xXWLpHiD2oFMJqaDQOlg8SItI14y','customers/2.jpg','1985-06-26','+15628878241',NULL,'2025-06-29 06:23:04','2025-06-29 06:23:26','2025-06-29 13:23:04',NULL,'activated',NULL,NULL,1,'2025-06-29 13:23:26',NULL,0),(5,'Eusebio Boyer','cconsidine@example.org','$2y$12$7680e/BR3yzI9aY0EThsUe/tzCbWTKmt7iAbwLNb0NtbEx6KybKYm','customers/3.jpg','1981-06-19','+15512421169',NULL,'2025-06-29 06:23:04','2025-06-29 06:23:26','2025-06-29 13:23:04',NULL,'activated',NULL,NULL,1,'2025-06-29 13:23:26',NULL,0),(6,'Raven Cole','dickinson.sydney@example.net','$2y$12$rE22ie1y4PRpeu7rb6k9bubDKtT3MtwOZBaBOXK2q5.FooI3nCZVO','customers/4.jpg','1996-06-05','+15755679884',NULL,'2025-06-29 06:23:05','2025-06-29 06:23:26','2025-06-29 13:23:05',NULL,'activated',NULL,NULL,1,'2025-06-29 13:23:26',NULL,0),(7,'Myriam Oberbrunner','zwolf@example.org','$2y$12$romwG.P1s7MzvWvVLH/wJO/q0k5tcvtmYhfEjL3JFdWgeclkfKaMa','customers/5.jpg','1993-06-12','+16803977934',NULL,'2025-06-29 06:23:05','2025-06-29 06:23:05','2025-06-29 13:23:05',NULL,'activated',NULL,NULL,0,NULL,NULL,0),(8,'Connie Breitenberg','plarkin@example.net','$2y$12$pXJQXrY0.VM6P3BugHd7xOsiae2dRSfjgAScd8ZnLz07LVZ7mKSy.','customers/6.jpg','1981-06-22','+16155967118',NULL,'2025-06-29 06:23:06','2025-06-29 06:23:27','2025-06-29 13:23:06',NULL,'activated',NULL,NULL,1,'2025-06-29 13:23:27',NULL,0),(9,'Dr. Jermain Kunze','lysanne.prosacco@example.org','$2y$12$yg5MJQNvf5HdFTeBZc91iOvjBvJHZab/0qjcoeeGNKHBDPk.KclA2','customers/7.jpg','2002-06-25','+14848202458',NULL,'2025-06-29 06:23:06','2025-06-29 06:23:06','2025-06-29 13:23:06',NULL,'activated',NULL,NULL,0,NULL,NULL,0),(10,'Freddie Leuschke','cassidy99@example.net','$2y$12$3zUXAzD/7mjN0PbY0hEziOxJ/.fLZLe/y0.cSHO5cuYKtvWFZC0Y6','customers/8.jpg','1978-06-02','+18162595295',NULL,'2025-06-29 06:23:07','2025-06-29 06:23:27','2025-06-29 13:23:07',NULL,'activated',NULL,NULL,1,'2025-06-29 13:23:27',NULL,0);
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_categories`
--

DROP TABLE IF EXISTS `ec_discount_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint unsigned NOT NULL,
  `product_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_categories`
--

LOCK TABLES `ec_discount_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint unsigned NOT NULL,
  `product_collection_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `can_use_with_flash_sale` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT '0',
  `display_at_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
INSERT INTO `ec_discounts` VALUES (1,'Discount 1','5VK3TGPUWF08','2025-06-28 13:23:08','2025-07-09 13:23:08',NULL,0,50,'coupon',0,0,NULL,NULL,'percentage','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(2,'Discount 2','KLOJUA6SQPXY','2025-06-28 13:23:08',NULL,NULL,0,997,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(3,'Discount 3','NVL0PJVLHZBG','2025-06-28 13:23:08','2025-07-15 13:23:08',NULL,0,675,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(4,'Discount 4','LYIAMG2X3D5Q','2025-06-28 13:23:08',NULL,NULL,0,601,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(5,'Discount 5','LAGXEBVQ9EQP','2025-06-28 13:23:08',NULL,NULL,0,585,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(6,'Discount 6','DPKTIOJXUQCS','2025-06-28 13:23:08','2025-07-05 13:23:08',NULL,0,316,'coupon',0,0,NULL,NULL,'same-price','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(7,'Discount 7','WXFMY2M3SZBB','2025-06-28 13:23:08','2025-07-01 13:23:08',NULL,0,981,'coupon',0,0,NULL,NULL,'same-price','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(8,'Discount 8','GZYEBXYHDMBM','2025-06-28 13:23:08',NULL,NULL,0,54,'coupon',0,0,NULL,NULL,'percentage','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(9,'Discount 9','CPK8V1TWIIB5','2025-06-28 13:23:08',NULL,NULL,0,298,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL),(10,'Discount 10','JEOTW4MGPRNW','2025-06-28 13:23:08',NULL,NULL,0,76,'coupon',0,0,NULL,NULL,'percentage','all-orders',NULL,0,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,NULL);
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,9,532.1,6,5),(2,20,819.192,17,5),(3,14,115.9,15,1),(4,1,294.44,10,5),(5,24,331.08,8,1),(5,1,658.16,10,3),(5,2,68.4,11,2),(5,3,1031.52,16,1),(5,4,667.59,14,4),(5,5,206.4,8,5);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Deal of the Day','2025-07-16 00:00:00','published','2025-06-29 06:23:08','2025-06-29 06:23:08'),(2,'Winter Sale','2025-07-19 00:00:00','published','2025-06-29 06:23:08','2025-06-29 06:23:08'),(3,'Gadgets &amp; Accessories','2025-07-26 00:00:00','published','2025-06-29 06:23:08','2025-06-29 06:23:08'),(4,'Hot products','2025-08-15 00:00:00','published','2025-06-29 06:23:08','2025-06-29 06:23:08'),(5,'Best sale items','2025-07-31 00:00:00','published','2025-06-29 06:23:08','2025-06-29 06:23:08');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,1,'1 Year',0,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(2,1,'2 Year',10,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(3,1,'3 Year',20,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(4,2,'4GB',0,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(5,2,'8GB',10,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(6,2,'16GB',20,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(7,3,'Core i5',0,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(8,3,'Core i7',10,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(9,3,'Core i9',20,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(10,4,'128GB',0,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(11,4,'256GB',10,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(12,4,'512GB',20,9999,0,'2025-06-29 06:23:23','2025-06-29 06:23:23');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value_translations`
--

DROP TABLE IF EXISTS `ec_global_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value_translations`
--

LOCK TABLES `ec_global_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(2,'RAM','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(3,'CPU','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-06-29 06:23:23','2025-06-29 06:23:23'),(4,'HDD','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,'2025-06-29 06:23:23','2025-06-29 06:23:23');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options_translations`
--

DROP TABLE IF EXISTS `ec_global_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_options_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options_translations`
--

LOCK TABLES `ec_global_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` bigint unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value_translations`
--

DROP TABLE IF EXISTS `ec_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value_translations`
--

LOCK TABLES `ec_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint unsigned NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options_translations`
--

DROP TABLE IF EXISTS `ec_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_options_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options_translations`
--

LOCK TABLES `ec_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double DEFAULT '0',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  `license_code` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloaded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_histories`
--

DROP TABLE IF EXISTS `ec_order_return_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_return_id` bigint unsigned NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_histories`
--

LOCK TABLES `ec_order_return_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_return_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` bigint unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint unsigned NOT NULL COMMENT 'Order product id',
  `product_id` bigint unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL COMMENT 'Order ID',
  `store_id` bigint unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_tax_information`
--

DROP TABLE IF EXISTS `ec_order_tax_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_tax_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_tax_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_tax_information_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_tax_information`
--

LOCK TABLES `ec_order_tax_information` WRITE;
/*!40000 ALTER TABLE `ec_order_tax_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_tax_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `cancellation_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_reason_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `proof_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Weight','weight','text',1,1,1,'published',0,'2025-06-29 06:22:51','2025-06-29 06:22:51',0),(2,'Boxes','boxes','text',1,1,1,'published',1,'2025-06-29 06:22:51','2025-06-29 06:22:51',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` bigint unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_set_status_index` (`attribute_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'1KG','1kg',NULL,NULL,1,1,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(2,1,'2KG','2kg',NULL,NULL,0,2,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(3,1,'3KG','3kg',NULL,NULL,0,3,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(4,1,'4KG','4kg',NULL,NULL,0,4,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(5,1,'5KG','5kg',NULL,NULL,0,5,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(6,2,'1 Box','1-box',NULL,NULL,1,1,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(7,2,'2 Boxes','2-boxes',NULL,NULL,0,2,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(8,2,'3 Boxes','3-boxes',NULL,NULL,0,3,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(9,2,'4 Boxes','4-boxes',NULL,NULL,0,4,'2025-06-29 06:22:51','2025-06-29 06:22:51'),(10,2,'5 Boxes','5-boxes',NULL,NULL,0,5,'2025-06-29 06:22:51','2025-06-29 06:22:51');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Milks and Dairies',0,NULL,'published',0,'product-categories/image-1.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-1.png'),(2,'Clothing & beauty',0,NULL,'published',1,'product-categories/image-2.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-2.png'),(3,'Pet Toy',0,NULL,'published',2,'product-categories/image-3.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-3.png'),(4,'Baking material',0,NULL,'published',3,'product-categories/image-4.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-4.png'),(5,'Fresh Fruit',0,NULL,'published',4,'product-categories/image-5.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-5.png'),(6,'Wines & Drinks',0,NULL,'published',5,'product-categories/image-6.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-6.png'),(7,'Fresh Seafood',0,NULL,'published',6,'product-categories/image-7.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-7.png'),(8,'Fast food',0,NULL,'published',7,'product-categories/image-8.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-8.png'),(9,'Vegetables',0,NULL,'published',8,'product-categories/image-9.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-9.png'),(10,'Bread and Juice',0,NULL,'published',9,'product-categories/image-10.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-10.png'),(11,'Cake & Milk',0,NULL,'published',10,'product-categories/image-11.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-11.png'),(12,'Coffee & Teas',0,NULL,'published',11,'product-categories/image-12.png',1,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-12.png'),(13,'Pet Foods',0,NULL,'published',12,'product-categories/image-13.png',0,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-13.png'),(14,'Diet Foods',0,NULL,'published',13,'product-categories/image-14.png',0,'2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'product-categories/icon-14.png');
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categorizables`
--

DROP TABLE IF EXISTS `ec_product_categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  KEY `ec_product_categorizables_category_id_index` (`category_id`),
  KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  KEY `ec_product_categorizables_reference_type_index` (`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categorizables`
--

LOCK TABLES `ec_product_categorizables` WRITE;
/*!40000 ALTER TABLE `ec_product_categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,2),(1,3),(1,5),(1,8),(1,16),(1,22),(2,1),(2,5),(2,7),(2,9),(2,10),(2,20),(3,3),(3,6),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,19),(3,20),(3,23),(4,2),(4,5),(4,10),(4,18),(4,22),(4,24),(5,2),(5,7),(5,12),(5,23),(6,4),(6,6),(6,7),(6,11),(6,12),(6,17),(6,21),(7,1),(7,4),(7,5),(7,10),(7,13),(7,17),(7,18),(7,19),(7,20),(8,2),(8,4),(8,6),(8,8),(8,11),(8,14),(8,15),(8,22),(8,24),(9,1),(9,3),(9,13),(9,14),(9,17),(9,19),(9,21),(9,24),(10,1),(10,8),(10,9),(10,13),(10,15),(11,7),(11,12),(11,21),(11,22),(11,23),(12,8),(12,9),(12,11),(12,14),(12,16),(12,18),(12,19),(13,3),(13,9),(13,10),(13,15),(13,18),(13,21),(13,24),(14,4),(14,6),(14,11),(14,16),(14,20),(14,23);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`product_collection_id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,1),(1,2),(1,3),(1,6),(1,7),(1,8),(1,11),(1,12),(1,24),(2,5),(2,9),(2,10),(2,13),(2,17),(2,19),(2,20),(2,21),(3,4),(3,14),(3,15),(3,16),(3,18),(3,22),(3,23);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,10,0,0.00,'fixed',1),(1,11,0,0.00,'fixed',1),(1,12,0,0.00,'fixed',1),(1,15,0,0.00,'fixed',1),(1,18,0,0.00,'fixed',1),(1,22,0,0.00,'fixed',1),(1,24,0,0.00,'fixed',1),(2,8,0,0.00,'fixed',1),(2,11,0,0.00,'fixed',1),(2,19,0,0.00,'fixed',1),(2,21,0,0.00,'fixed',1),(2,22,0,0.00,'fixed',1),(2,24,0,0.00,'fixed',1),(3,6,0,0.00,'fixed',1),(3,7,0,0.00,'fixed',1),(3,12,0,0.00,'fixed',1),(3,16,0,0.00,'fixed',1),(3,17,0,0.00,'fixed',1),(3,18,0,0.00,'fixed',1),(4,2,0,0.00,'fixed',1),(4,6,0,0.00,'fixed',1),(4,11,0,0.00,'fixed',1),(4,15,0,0.00,'fixed',1),(4,22,0,0.00,'fixed',1),(4,24,0,0.00,'fixed',1),(5,7,0,0.00,'fixed',1),(5,9,0,0.00,'fixed',1),(5,10,0,0.00,'fixed',1),(5,11,0,0.00,'fixed',1),(5,14,0,0.00,'fixed',1),(5,16,0,0.00,'fixed',1),(5,24,0,0.00,'fixed',1),(6,1,0,0.00,'fixed',1),(6,2,0,0.00,'fixed',1),(6,9,0,0.00,'fixed',1),(6,19,0,0.00,'fixed',1),(6,20,0,0.00,'fixed',1),(6,24,0,0.00,'fixed',1),(7,8,0,0.00,'fixed',1),(7,10,0,0.00,'fixed',1),(7,18,0,0.00,'fixed',1),(7,23,0,0.00,'fixed',1),(8,4,0,0.00,'fixed',1),(8,5,0,0.00,'fixed',1),(8,10,0,0.00,'fixed',1),(8,11,0,0.00,'fixed',1),(8,13,0,0.00,'fixed',1),(8,14,0,0.00,'fixed',1),(8,20,0,0.00,'fixed',1),(9,2,0,0.00,'fixed',1),(9,3,0,0.00,'fixed',1),(9,14,0,0.00,'fixed',1),(9,16,0,0.00,'fixed',1),(9,23,0,0.00,'fixed',1),(9,24,0,0.00,'fixed',1),(10,5,0,0.00,'fixed',1),(10,6,0,0.00,'fixed',1),(10,7,0,0.00,'fixed',1),(10,11,0,0.00,'fixed',1),(10,12,0,0.00,'fixed',1),(10,17,0,0.00,'fixed',1),(10,21,0,0.00,'fixed',1),(11,4,0,0.00,'fixed',1),(11,6,0,0.00,'fixed',1),(11,18,0,0.00,'fixed',1),(11,20,0,0.00,'fixed',1),(11,21,0,0.00,'fixed',1),(12,2,0,0.00,'fixed',1),(12,5,0,0.00,'fixed',1),(12,6,0,0.00,'fixed',1),(12,10,0,0.00,'fixed',1),(12,13,0,0.00,'fixed',1),(12,17,0,0.00,'fixed',1),(12,19,0,0.00,'fixed',1),(13,8,0,0.00,'fixed',1),(13,14,0,0.00,'fixed',1),(13,15,0,0.00,'fixed',1),(13,21,0,0.00,'fixed',1),(13,23,0,0.00,'fixed',1),(14,1,0,0.00,'fixed',1),(14,2,0,0.00,'fixed',1),(14,10,0,0.00,'fixed',1),(14,12,0,0.00,'fixed',1),(14,15,0,0.00,'fixed',1),(14,17,0,0.00,'fixed',1),(15,2,0,0.00,'fixed',1),(15,3,0,0.00,'fixed',1),(15,10,0,0.00,'fixed',1),(15,13,0,0.00,'fixed',1),(15,18,0,0.00,'fixed',1),(15,22,0,0.00,'fixed',1),(15,24,0,0.00,'fixed',1),(16,4,0,0.00,'fixed',1),(16,6,0,0.00,'fixed',1),(16,9,0,0.00,'fixed',1),(16,12,0,0.00,'fixed',1),(16,21,0,0.00,'fixed',1),(16,24,0,0.00,'fixed',1),(17,1,0,0.00,'fixed',1),(17,2,0,0.00,'fixed',1),(17,15,0,0.00,'fixed',1),(17,18,0,0.00,'fixed',1),(17,19,0,0.00,'fixed',1),(17,23,0,0.00,'fixed',1),(18,2,0,0.00,'fixed',1),(18,3,0,0.00,'fixed',1),(18,9,0,0.00,'fixed',1),(18,20,0,0.00,'fixed',1),(18,23,0,0.00,'fixed',1),(18,24,0,0.00,'fixed',1),(19,2,0,0.00,'fixed',1),(19,4,0,0.00,'fixed',1),(19,7,0,0.00,'fixed',1),(19,8,0,0.00,'fixed',1),(19,9,0,0.00,'fixed',1),(19,13,0,0.00,'fixed',1),(19,14,0,0.00,'fixed',1),(20,3,0,0.00,'fixed',1),(20,5,0,0.00,'fixed',1),(20,7,0,0.00,'fixed',1),(20,11,0,0.00,'fixed',1),(20,13,0,0.00,'fixed',1),(20,22,0,0.00,'fixed',1),(20,24,0,0.00,'fixed',1),(21,1,0,0.00,'fixed',1),(21,10,0,0.00,'fixed',1),(21,12,0,0.00,'fixed',1),(21,13,0,0.00,'fixed',1),(21,16,0,0.00,'fixed',1),(21,18,0,0.00,'fixed',1),(21,24,0,0.00,'fixed',1),(22,2,0,0.00,'fixed',1),(22,10,0,0.00,'fixed',1),(22,12,0,0.00,'fixed',1),(22,17,0,0.00,'fixed',1),(22,18,0,0.00,'fixed',1),(22,19,0,0.00,'fixed',1),(22,23,0,0.00,'fixed',1),(23,3,0,0.00,'fixed',1),(23,5,0,0.00,'fixed',1),(23,7,0,0.00,'fixed',1),(23,10,0,0.00,'fixed',1),(23,12,0,0.00,'fixed',1),(23,16,0,0.00,'fixed',1),(23,21,0,0.00,'fixed',1),(24,1,0,0.00,'fixed',1),(24,2,0,0.00,'fixed',1),(24,11,0,0.00,'fixed',1),(24,15,0,0.00,'fixed',1),(24,22,0,0.00,'fixed',1);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
INSERT INTO `ec_product_files` VALUES (1,4,'ecommerce/digital-product-files/4.jpg','{\"filename\":\"4.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"4\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(2,4,'ecommerce/digital-product-files/4-1.jpg','{\"filename\":\"4-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"4-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(3,8,'ecommerce/digital-product-files/8.jpg','{\"filename\":\"8.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"8\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(4,8,'ecommerce/digital-product-files/8-1.jpg','{\"filename\":\"8-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"8-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(5,12,'ecommerce/digital-product-files/12.jpg','{\"filename\":\"12.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"12\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(6,12,'ecommerce/digital-product-files/12-1.jpg','{\"filename\":\"12-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"12-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(7,16,'ecommerce/digital-product-files/16.jpg','{\"filename\":\"16.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"16\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(8,16,'ecommerce/digital-product-files/16-1.jpg','{\"filename\":\"16-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"16-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(9,20,'ecommerce/digital-product-files/20.jpg','{\"filename\":\"20.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"20\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(10,20,'ecommerce/digital-product-files/20-1.jpg','{\"filename\":\"20-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"20-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(11,24,'ecommerce/digital-product-files/24.jpg','{\"filename\":\"24.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"24\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(12,24,'ecommerce/digital-product-files/24-1.jpg','{\"filename\":\"24-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"24-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(13,49,'ecommerce/digital-product-files/16-1.jpg','{\"filename\":\"16-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"16-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(14,50,'ecommerce/digital-product-files/16-2.jpg','{\"filename\":\"16-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"16-2\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(15,51,'ecommerce/digital-product-files/16-3.jpg','{\"filename\":\"16-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"16-3\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01'),(16,62,'ecommerce/digital-product-files/20-1.jpg','{\"filename\":\"20-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-06-29 13:23:01\",\"name\":\"20-1\",\"extension\":\"jpg\"}','2025-06-29 06:23:01','2025-06-29 06:23:01');
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (1,9),(1,12),(1,15),(1,18),(1,21),(2,24),(3,3),(3,6);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text_color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#d71e2d','published','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL),(2,'New','#02856e','published','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL),(3,'Sale','#fe9931','published','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL);
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_license_codes`
--

DROP TABLE IF EXISTS `ec_product_license_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_license_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `license_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `assigned_order_product_id` bigint unsigned DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_license_codes_license_code_unique` (`license_code`),
  KEY `ec_product_license_codes_product_id_status_index` (`product_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_license_codes`
--

LOCK TABLES `ec_product_license_codes` WRITE;
/*!40000 ALTER TABLE `ec_product_license_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_license_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_specification_attribute`
--

DROP TABLE IF EXISTS `ec_product_specification_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_specification_attribute` (
  `product_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_specification_attribute`
--

LOCK TABLES `ec_product_specification_attribute` WRITE;
/*!40000 ALTER TABLE `ec_product_specification_attribute` DISABLE KEYS */;
INSERT INTO `ec_product_specification_attribute` VALUES (1,1,'91.09 cm',0,0),(1,2,'58.44 cm',0,0),(1,3,'68.45 cm',0,0),(1,4,'1.54 cm',0,0),(1,5,'62.53 cm',0,0),(2,1,'29.53 cm',0,0),(2,2,'63.88 cm',0,0),(2,3,'42.96 cm',0,0),(2,4,'19.99 cm',0,0),(2,5,'43.05 cm',0,0),(3,6,'50.42 cm',0,0),(3,7,'43.36 cm',0,0),(3,8,'2560x1440',0,0),(4,1,'18.34 cm',0,0),(4,2,'32.28 cm',0,0),(4,3,'30.32 cm',0,0),(4,4,'20.04 cm',0,0),(4,5,'29.95 cm',0,0),(5,1,'33.04 cm',0,0),(5,2,'98.51 cm',0,0),(5,3,'74.51 cm',0,0),(5,4,'63.68 cm',0,0),(5,5,'62.56 cm',0,0),(6,6,'99.25 cm',0,0),(6,7,'45.26 cm',0,0),(6,8,'2560x1440',0,0),(7,6,'25.45 cm',0,0),(7,7,'48.28 cm',0,0),(7,8,'3840x2160',0,0),(8,6,'46.11 cm',0,0),(8,7,'59.23 cm',0,0),(8,8,'1920x1080',0,0),(9,6,'4.56 cm',0,0),(9,7,'25.69 cm',0,0),(9,8,'1920x1080',0,0),(10,6,'99.8 cm',0,0),(10,7,'28.88 cm',0,0),(10,8,'3840x2160',0,0),(11,1,'22.96 cm',0,0),(11,2,'63.69 cm',0,0),(11,3,'91.42 cm',0,0),(11,4,'45.65 cm',0,0),(11,5,'81.99 cm',0,0),(12,6,'10.33 cm',0,0),(12,7,'33.58 cm',0,0),(12,8,'1920x1080',0,0),(13,6,'89.27 cm',0,0),(13,7,'11.64 cm',0,0),(13,8,'3840x2160',0,0),(14,1,'38.21 cm',0,0),(14,2,'68.06 cm',0,0),(14,3,'69.49 cm',0,0),(14,4,'38.38 cm',0,0),(14,5,'11.63 cm',0,0),(15,6,'99.68 cm',0,0),(15,7,'44.96 cm',0,0),(15,8,'2560x1440',0,0),(16,6,'30.14 cm',0,0),(16,7,'96.45 cm',0,0),(16,8,'2560x1440',0,0),(17,6,'56.31 cm',0,0),(17,7,'99.94 cm',0,0),(17,8,'2560x1440',0,0),(18,6,'42.83 cm',0,0),(18,7,'36.1 cm',0,0),(18,8,'2560x1440',0,0),(19,1,'32.94 cm',0,0),(19,2,'79.06 cm',0,0),(19,3,'95.91 cm',0,0),(19,4,'11.7 cm',0,0),(19,5,'63 cm',0,0),(20,1,'5.17 cm',0,0),(20,2,'43.69 cm',0,0),(20,3,'9.03 cm',0,0),(20,4,'3.48 cm',0,0),(20,5,'56.42 cm',0,0),(21,1,'90.51 cm',0,0),(21,2,'30.49 cm',0,0),(21,3,'71.01 cm',0,0),(21,4,'91.47 cm',0,0),(21,5,'19.58 cm',0,0),(22,6,'65.19 cm',0,0),(22,7,'40.02 cm',0,0),(22,8,'2560x1440',0,0),(23,6,'55.34 cm',0,0),(23,7,'72.65 cm',0,0),(23,8,'2560x1440',0,0),(24,1,'84.59 cm',0,0),(24,2,'66.28 cm',0,0),(24,3,'99.39 cm',0,0),(24,4,'85.32 cm',0,0),(24,5,'2.8 cm',0,0);
/*!40000 ALTER TABLE `ec_product_specification_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,1),(1,2),(1,5),(2,1),(2,4),(2,5),(3,1),(3,3),(3,5),(4,2),(4,3),(4,4),(5,2),(5,4),(5,5),(6,1),(6,2),(6,5),(7,2),(7,4),(7,5),(8,2),(8,4),(8,5),(9,3),(9,4),(9,5),(10,1),(10,3),(10,4),(11,3),(11,4),(11,5),(12,3),(12,4),(12,5),(13,1),(13,3),(13,5),(14,1),(14,2),(14,5),(15,2),(15,3),(15,4),(16,1),(16,2),(16,5),(17,2),(17,3),(17,5),(18,2),(18,4),(18,5),(19,1),(19,2),(19,5),(20,1),(20,3),(20,4),(21,1),(21,2),(21,5),(22,1),(22,3),(22,5),(23,1),(23,2),(23,5),(24,1),(24,3),(24,4);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Wallet',NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51'),(2,'Bags',NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51'),(3,'Shoes',NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51'),(4,'Clothes',NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51'),(5,'Hand bag',NULL,'published','2025-06-29 06:22:51','2025-06-29 06:22:51');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variation_items_attribute_id_variation_id_unique` (`attribute_id`,`variation_id`),
  KEY `attribute_variation_index` (`attribute_id`,`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (13,1,7),(21,1,11),(43,1,22),(45,1,23),(47,1,24),(49,1,25),(57,1,29),(7,2,4),(15,2,8),(29,2,15),(39,2,20),(67,2,34),(73,2,37),(3,3,2),(9,3,5),(11,3,6),(17,3,9),(41,3,21),(65,3,33),(75,3,38),(77,3,39),(5,4,3),(31,4,16),(33,4,17),(55,4,28),(63,4,32),(69,4,35),(1,5,1),(19,5,10),(23,5,12),(25,5,13),(27,5,14),(35,5,18),(37,5,19),(51,5,26),(53,5,27),(59,5,30),(61,5,31),(71,5,36),(16,6,8),(18,6,9),(22,6,11),(28,6,14),(48,6,24),(60,6,30),(68,6,34),(72,6,36),(2,7,1),(10,7,5),(14,7,7),(20,7,10),(24,7,12),(52,7,26),(54,7,27),(66,7,33),(76,7,38),(4,8,2),(6,8,3),(32,8,16),(58,8,29),(62,8,31),(74,8,37),(12,9,6),(30,9,15),(34,9,17),(36,9,18),(38,9,19),(42,9,21),(46,9,23),(50,9,25),(56,9,28),(70,9,35),(78,9,39),(8,10,4),(26,10,13),(40,10,20),(44,10,22),(64,10,32);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `configurable_product_id` bigint unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variations_product_id_configurable_product_id_unique` (`product_id`,`configurable_product_id`),
  KEY `configurable_product_index` (`product_id`,`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,25,3,1),(2,26,3,0),(3,27,3,0),(4,28,5,1),(5,29,5,0),(6,30,6,1),(7,31,6,0),(8,32,6,0),(9,33,6,0),(10,34,6,0),(11,35,7,1),(12,36,7,0),(13,37,7,0),(14,38,9,1),(15,39,9,0),(16,40,9,0),(17,41,9,0),(18,42,11,1),(19,43,11,0),(20,44,11,0),(21,45,14,1),(22,46,15,1),(23,47,15,0),(24,48,15,0),(25,49,16,1),(26,50,16,0),(27,51,16,0),(28,52,17,1),(29,53,17,0),(30,54,17,0),(31,55,17,0),(32,56,18,1),(33,57,18,0),(34,58,18,0),(35,59,19,1),(36,60,19,0),(37,61,19,0),(38,62,20,1),(39,63,23,1);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_views`
--

DROP TABLE IF EXISTS `ec_product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `views` int NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '2025-06-29',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  KEY `ec_product_views_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_views`
--

LOCK TABLES `ec_product_views` WRITE;
/*!40000 ALTER TABLE `ec_product_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,3,0),(2,3,0),(1,5,0),(2,5,0),(1,6,0),(2,6,0),(1,7,0),(2,7,0),(1,9,0),(2,9,0),(1,11,0),(2,11,0),(1,14,0),(2,14,0),(1,15,0),(2,15,0),(1,16,0),(2,16,0),(1,17,0),(2,17,0),(1,18,0),(2,18,0),(1,19,0),(2,19,0),(1,20,0),(2,20,0),(1,23,0),(2,23,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `video_media` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `brand_id` bigint unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double DEFAULT NULL,
  `wide` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by_id` bigint unsigned DEFAULT '0',
  `created_by_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `generate_license_code` tinyint(1) NOT NULL DEFAULT '0',
  `license_code_type` enum('auto_generate','pick_from_list') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auto_generate',
  `minimum_order_quantity` int unsigned DEFAULT '0',
  `maximum_order_quantity` int unsigned DEFAULT '0',
  `notify_attachment_updated` tinyint(1) NOT NULL DEFAULT '0',
  `specification_table_id` bigint unsigned DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `approved_by` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `sale_type_index` (`sale_type`),
  KEY `start_date_index` (`start_date`),
  KEY `end_date_index` (`end_date`),
  KEY `sale_price_index` (`sale_price`),
  KEY `is_variation_index` (`is_variation`),
  KEY `ec_products_sku_index` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Seeds of Change Organic Quinoe','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/1.jpg\",\"products\\/1-1.jpg\"]',NULL,'HC-179',0,17,0,1,'in_stock',1,4,0,0,1231,866,NULL,NULL,10,20,17,780,NULL,187660,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','4290530347010',NULL,0,'auto_generate',0,0,0,1,4,0),(2,'All Natural Italian-Style Chicken Meatballs','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\"]',NULL,'TM-155',0,10,0,1,'in_stock',1,7,0,0,1979,171,NULL,NULL,16,18,11,780,NULL,56516,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','4831748318708',NULL,0,'auto_generate',0,0,0,1,2,0),(3,'Angie’s Boomchickapop Sweet &amp; Salty Kettle Corn','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/3.jpg\",\"products\\/3-1.jpg\"]',NULL,'M7-122-A1',0,11,0,1,'in_stock',1,1,0,0,2456,NULL,NULL,NULL,18,14,20,522,NULL,89619,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','3305495015131',NULL,0,'auto_generate',0,0,0,2,3,0),(4,'Foster Farms Takeout Crispy Classic (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\"]',NULL,'OF-136',0,15,0,1,'in_stock',1,2,0,0,2220,1309,NULL,NULL,10,18,15,854,NULL,72088,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'digital','8167625678235',NULL,0,'auto_generate',0,0,0,1,7,0),(5,'Blue Diamond Almonds Lightly','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\"]',NULL,'1Z-192-A1',0,18,0,1,'in_stock',1,2,0,0,430,NULL,NULL,NULL,13,12,17,745,NULL,145981,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','8298037299333',NULL,0,'auto_generate',0,0,0,1,4,0),(6,'Chobani Complete Vanilla Greek','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/6.jpg\",\"products\\/6-1.jpg\"]',NULL,'YU-170-A1',0,15,0,1,'in_stock',1,3,0,0,1002,NULL,NULL,NULL,11,12,15,795,NULL,187435,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','0907883155448',NULL,0,'auto_generate',0,0,0,2,7,0),(7,'Canada Dry Ginger Ale – 2 L Bottle','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/7.jpg\",\"products\\/7-1.jpg\"]',NULL,'MP-199-A1',0,13,0,1,'in_stock',1,1,0,0,1253,NULL,NULL,NULL,17,17,18,546,NULL,174774,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','8367400864215',NULL,0,'auto_generate',0,0,0,2,4,0),(8,'Encore Seafoods Stuffed Alaskan (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/8.jpg\",\"products\\/8-1.jpg\"]',NULL,'6Y-181',0,11,0,1,'in_stock',1,4,0,0,1723,1057,NULL,NULL,13,14,11,860,NULL,85839,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'digital','6656474874438',NULL,0,'auto_generate',0,0,0,2,1,0),(9,'Gorton’s Beer Battered Fish Fillets','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/9.jpg\",\"products\\/9-1.jpg\"]',NULL,'VX-120-A1',0,16,0,1,'in_stock',1,6,0,0,626,NULL,NULL,NULL,14,11,14,598,NULL,149635,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','7268678120366',NULL,0,'auto_generate',0,0,0,2,2,0),(10,'Haagen-Dazs Caramel Cone Ice Cream','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/10.jpg\",\"products\\/10-1.jpg\"]',NULL,'AD-169',0,15,0,1,'in_stock',1,3,0,0,2063,835,NULL,NULL,13,15,14,619,NULL,62061,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','6969090041154',NULL,0,'auto_generate',0,0,0,2,7,0),(11,'Nestle Original Coffee-Mate Coffee Creamer','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/11.jpg\",\"products\\/11-1.jpg\"]',NULL,'KB-191-A1',0,15,0,1,'in_stock',1,2,0,0,1629,NULL,NULL,NULL,16,15,20,507,NULL,119170,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','8565516320735',NULL,0,'auto_generate',0,0,0,1,5,0),(12,'Naturally Flavored Cinnamon Vanilla Light Roast Coffee (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/12.jpg\",\"products\\/12-1.jpg\"]',NULL,'RH-161',0,11,0,1,'in_stock',1,2,0,0,442,148,NULL,NULL,11,19,15,612,NULL,153503,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'digital','0943399254084',NULL,0,'auto_generate',0,0,0,2,1,0),(13,'Pepperidge Farm Farmhouse Hearty White Bread','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]',NULL,'2X-120',0,11,0,1,'in_stock',1,6,0,0,1038,496,NULL,NULL,16,11,19,504,NULL,74748,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','5085797167650',NULL,0,'auto_generate',0,0,0,2,6,0),(14,'Organic Frozen Triple Berry Blend','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/14.jpg\",\"products\\/14-1.jpg\"]',NULL,'M2-133-A1',0,15,0,1,'in_stock',1,6,0,0,305,NULL,NULL,NULL,13,16,14,794,NULL,185319,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','4539587096930',NULL,0,'auto_generate',0,0,0,1,2,0),(15,'Oroweat Country Buttermilk Bread','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]',NULL,'17-172-A1',0,19,0,1,'in_stock',1,4,0,0,1019,NULL,NULL,NULL,13,11,19,822,NULL,29745,'2025-06-29 06:22:59','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','6579298610641',NULL,0,'auto_generate',0,0,0,2,7,0),(16,'Foster Farms Takeout Crispy Classic Buffalo Wings (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/16.jpg\",\"products\\/16-1.jpg\",\"products\\/16-2.jpg\",\"products\\/16-3.jpg\",\"products\\/16-4.jpg\",\"products\\/16-5.jpg\",\"products\\/16-6.jpg\"]',NULL,'FJ-100-A1',0,18,0,1,'in_stock',1,1,0,0,1075,849.25,NULL,NULL,20,17,18,609,NULL,141578,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'digital','2243324473039',NULL,0,'auto_generate',0,0,0,2,2,0),(17,'Angie’s Boomchickapop Sweet &amp; Salty Kettle Corn','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/17.jpg\",\"products\\/17-1.jpg\"]',NULL,'5C-122-A1',0,20,0,1,'in_stock',1,2,0,0,1682,NULL,NULL,NULL,20,14,19,552,NULL,22871,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','9925025093435',NULL,0,'auto_generate',0,0,0,2,3,0),(18,'All Natural Italian-Style Chicken Meatballs','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/18.jpg\",\"products\\/18-1.jpg\"]',NULL,'78-116-A1',0,18,0,1,'in_stock',1,3,0,0,2042,NULL,NULL,NULL,12,15,10,804,NULL,143935,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','0853127857312',NULL,0,'auto_generate',0,0,0,2,5,0),(19,'Simply Lemonade with Raspberry Juice','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/19.jpg\",\"products\\/19-1.jpg\"]',NULL,'BO-133-A1',0,16,0,1,'in_stock',1,6,0,0,723,NULL,NULL,NULL,10,14,20,608,NULL,120022,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','4490729830457',NULL,0,'auto_generate',0,0,0,1,3,0),(20,'Perdue Simply Smart Organics Gluten Free (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/20.jpg\",\"products\\/20-1.jpg\"]',NULL,'GC-144-A1',0,13,0,1,'in_stock',1,2,0,0,1712,1489.44,NULL,NULL,16,16,18,576,NULL,57880,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'digital','3072585073905',NULL,0,'auto_generate',0,0,0,1,7,0),(21,'Chen Watermelon','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/21.jpg\",\"products\\/21-1.jpg\"]',NULL,'81-128',0,15,0,1,'in_stock',1,3,0,0,353,336,NULL,NULL,11,18,15,767,NULL,164673,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','0859594357362',NULL,0,'auto_generate',0,0,0,1,3,0),(22,'Organic Cage-Free Grade A Large Brown Eggs','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/22.jpg\",\"products\\/22-1.jpg\"]',NULL,'VP-117',0,19,0,1,'in_stock',1,3,0,0,653,562,NULL,NULL,20,17,13,873,NULL,18984,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','6480524816471',NULL,0,'auto_generate',0,0,0,2,7,0),(23,'Colorful Banana','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/23.jpg\",\"products\\/23-1.jpg\"]',NULL,'WC-131-A1',0,15,0,1,'in_stock',1,4,0,0,1518,NULL,NULL,NULL,17,17,13,542,NULL,98231,'2025-06-29 06:22:59','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','3732897213160',NULL,0,'auto_generate',0,0,0,2,7,0),(24,'Signature Wood-Fired Mushroom and Caramelized (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline.</p>\n<p><img src=\"/storage/general/clock.png\" alt=\"icon\" style=\"height:15px;\">  1 Year AL Jazeera Brand Warranty\n</p>\n<p><img src=\"/storage/general/paper-plane.png\" alt=\"icon\" style=\"height:15px;\">   30 Day Return Policy</p>\n<p><img src=\"/storage/general/credit-card.png\" alt=\"icon\" style=\"height:15px;\">  Cash on Delivery available\n</p>\n','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string\n    detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in\n    cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic\n    silhouette and utilitarian design details.</p>\n<p>- Casual unisex fit</p>\n\n<p>- 64% polyester, 36% polyurethane</p>\n\n<p>- Water column pressure: 4000 mm</p>\n\n<p>- Model is 187cm tall and wearing a size S / M</p>\n\n<p>- Unisex fit</p>\n\n<p>- Drawstring hood with built-in cap</p>\n\n<p>- Front placket with snap buttons</p>\n\n<p>- Ventilation under armpit</p>\n\n<p>- Adjustable cuffs</p>\n\n<p>- Double welted front pockets</p>\n\n<p>- Adjustable elastic string at hempen</p>\n\n<p>- Ultrasonically welded seams</p>\n\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing\n    information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean\n    and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising\n    from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody-\n    but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy\n    days, issuing an invitation to explore even in the most mercurial weather.</p>\n','published','[\"products\\/24.jpg\",\"products\\/24-1.jpg\"]',NULL,'TQ-101',0,19,0,1,'in_stock',1,6,0,0,1483,1068,NULL,NULL,14,19,13,877,NULL,121900,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'digital','8359116075207',NULL,0,'auto_generate',0,0,0,1,2,0),(25,'Angie’s Boomchickapop Sweet & Salty Kettle Corn',NULL,NULL,'published','[\"products\\/3-1.jpg\"]',NULL,'M7-122-A1',0,11,0,1,'in_stock',0,1,1,0,2456,NULL,NULL,NULL,18,14,20,522,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','4146099440054',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(26,'Angie’s Boomchickapop Sweet & Salty Kettle Corn',NULL,NULL,'published','[\"products\\/3.jpg\"]',NULL,'M7-122-A1-A2',0,11,0,1,'in_stock',0,1,1,0,2456,NULL,NULL,NULL,18,14,20,522,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','8924640570094',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(27,'Angie’s Boomchickapop Sweet & Salty Kettle Corn',NULL,NULL,'published','[\"products\\/3.jpg\"]',NULL,'M7-122-A1-A3',0,11,0,1,'in_stock',0,1,1,0,2456,NULL,NULL,NULL,18,14,20,522,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','4689290900472',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(28,'Blue Diamond Almonds Lightly',NULL,NULL,'published','[\"products\\/5-1.jpg\"]',NULL,'1Z-192-A1',0,18,0,1,'in_stock',0,2,1,0,430,NULL,NULL,NULL,13,12,17,745,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','8617623300756',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(29,'Blue Diamond Almonds Lightly',NULL,NULL,'published','[\"products\\/5.jpg\"]',NULL,'1Z-192-A1-A2',0,18,0,1,'in_stock',0,2,1,0,430,NULL,NULL,NULL,13,12,17,745,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','0573331089919',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(30,'Chobani Complete Vanilla Greek',NULL,NULL,'published','[\"products\\/6-1.jpg\"]',NULL,'YU-170-A1',0,15,0,1,'in_stock',0,3,1,0,1002,NULL,NULL,NULL,11,12,15,795,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','8684312188476',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(31,'Chobani Complete Vanilla Greek',NULL,NULL,'published','[\"products\\/6.jpg\"]',NULL,'YU-170-A1-A2',0,15,0,1,'in_stock',0,3,1,0,1002,NULL,NULL,NULL,11,12,15,795,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','6831223628115',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(32,'Chobani Complete Vanilla Greek',NULL,NULL,'published','[\"products\\/6.jpg\"]',NULL,'YU-170-A1-A3',0,15,0,1,'in_stock',0,3,1,0,1002,NULL,NULL,NULL,11,12,15,795,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','5064239887684',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(33,'Chobani Complete Vanilla Greek',NULL,NULL,'published','[\"products\\/6.jpg\"]',NULL,'YU-170-A1-A4',0,15,0,1,'in_stock',0,3,1,0,1002,NULL,NULL,NULL,11,12,15,795,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','5927939802343',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(34,'Chobani Complete Vanilla Greek',NULL,NULL,'published','[\"products\\/6.jpg\"]',NULL,'YU-170-A1-A5',0,15,0,1,'in_stock',0,3,1,0,1002,NULL,NULL,NULL,11,12,15,795,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','8938590193159',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(35,'Canada Dry Ginger Ale – 2 L Bottle',NULL,NULL,'published','[\"products\\/7-1.jpg\"]',NULL,'MP-199-A1',0,13,0,1,'in_stock',0,1,1,0,1253,NULL,NULL,NULL,17,17,18,546,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','7877698971706',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(36,'Canada Dry Ginger Ale – 2 L Bottle',NULL,NULL,'published','[\"products\\/7.jpg\"]',NULL,'MP-199-A1-A2',0,13,0,1,'in_stock',0,1,1,0,1253,NULL,NULL,NULL,17,17,18,546,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','7416214431135',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(37,'Canada Dry Ginger Ale – 2 L Bottle',NULL,NULL,'published','[\"products\\/7.jpg\"]',NULL,'MP-199-A1-A3',0,13,0,1,'in_stock',0,1,1,0,1253,NULL,NULL,NULL,17,17,18,546,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','4600001480946',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(38,'Gorton’s Beer Battered Fish Fillets',NULL,NULL,'published','[\"products\\/9-1.jpg\"]',NULL,'VX-120-A1',0,16,0,1,'in_stock',0,6,1,0,626,NULL,NULL,NULL,14,11,14,598,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','5575560431380',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(39,'Gorton’s Beer Battered Fish Fillets',NULL,NULL,'published','[\"products\\/9.jpg\"]',NULL,'VX-120-A1-A2',0,16,0,1,'in_stock',0,6,1,0,626,NULL,NULL,NULL,14,11,14,598,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','0122914200199',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(40,'Gorton’s Beer Battered Fish Fillets',NULL,NULL,'published','[\"products\\/9.jpg\"]',NULL,'VX-120-A1-A3',0,16,0,1,'in_stock',0,6,1,0,626,NULL,NULL,NULL,14,11,14,598,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','0256548114765',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(41,'Gorton’s Beer Battered Fish Fillets',NULL,NULL,'published','[\"products\\/9.jpg\"]',NULL,'VX-120-A1-A4',0,16,0,1,'in_stock',0,6,1,0,626,NULL,NULL,NULL,14,11,14,598,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','0695980902552',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(42,'Nestle Original Coffee-Mate Coffee Creamer',NULL,NULL,'published','[\"products\\/11-1.jpg\"]',NULL,'KB-191-A1',0,15,0,1,'in_stock',0,2,1,0,1629,NULL,NULL,NULL,16,15,20,507,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','6292990200148',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(43,'Nestle Original Coffee-Mate Coffee Creamer',NULL,NULL,'published','[\"products\\/11.jpg\"]',NULL,'KB-191-A1-A2',0,15,0,1,'in_stock',0,2,1,0,1629,NULL,NULL,NULL,16,15,20,507,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','0356729184430',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(44,'Nestle Original Coffee-Mate Coffee Creamer',NULL,NULL,'published','[\"products\\/11.jpg\"]',NULL,'KB-191-A1-A3',0,15,0,1,'in_stock',0,2,1,0,1629,NULL,NULL,NULL,16,15,20,507,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','1705416277990',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(45,'Organic Frozen Triple Berry Blend',NULL,NULL,'published','[\"products\\/14-1.jpg\"]',NULL,'M2-133-A1',0,15,0,1,'in_stock',0,6,1,0,305,NULL,NULL,NULL,13,16,14,794,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','5845728720343',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(46,'Oroweat Country Buttermilk Bread',NULL,NULL,'published','[\"products\\/15-1.jpg\"]',NULL,'17-172-A1',0,19,0,1,'in_stock',0,4,1,0,1019,NULL,NULL,NULL,13,11,19,822,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','4116207755059',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(47,'Oroweat Country Buttermilk Bread',NULL,NULL,'published','[\"products\\/15.jpg\"]',NULL,'17-172-A1-A2',0,19,0,1,'in_stock',0,4,1,0,1019,NULL,NULL,NULL,13,11,19,822,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','1016557895685',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(48,'Oroweat Country Buttermilk Bread',NULL,NULL,'published','[\"products\\/15.jpg\"]',NULL,'17-172-A1-A3',0,19,0,1,'in_stock',0,4,1,0,1019,NULL,NULL,NULL,13,11,19,822,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:27',0,'Botble\\ACL\\Models\\User',NULL,'physical','6344490823041',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(49,'Foster Farms Takeout Crispy Classic Buffalo Wings (Digital)',NULL,NULL,'published','[\"products\\/16-1.jpg\"]',NULL,'FJ-100-A1',0,18,0,1,'in_stock',0,1,1,0,1075,849.25,NULL,NULL,20,17,18,609,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'digital','1855742801625',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(50,'Foster Farms Takeout Crispy Classic Buffalo Wings (Digital)',NULL,NULL,'published','[\"products\\/16-2.jpg\"]',NULL,'FJ-100-A1-A2',0,18,0,1,'in_stock',0,1,1,0,1075,892.25,NULL,NULL,20,17,18,609,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'digital','4237829600647',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(51,'Foster Farms Takeout Crispy Classic Buffalo Wings (Digital)',NULL,NULL,'published','[\"products\\/16-3.jpg\"]',NULL,'FJ-100-A1-A3',0,18,0,1,'in_stock',0,1,1,0,1075,752.5,NULL,NULL,20,17,18,609,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'digital','9029564330874',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(52,'Angie’s Boomchickapop Sweet & Salty Kettle Corn',NULL,NULL,'published','[\"products\\/17-1.jpg\"]',NULL,'5C-122-A1',0,20,0,1,'in_stock',0,2,1,0,1682,NULL,NULL,NULL,20,14,19,552,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','3866130213300',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(53,'Angie’s Boomchickapop Sweet & Salty Kettle Corn',NULL,NULL,'published','[\"products\\/17.jpg\"]',NULL,'5C-122-A1-A2',0,20,0,1,'in_stock',0,2,1,0,1682,NULL,NULL,NULL,20,14,19,552,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','9646449479840',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(54,'Angie’s Boomchickapop Sweet & Salty Kettle Corn',NULL,NULL,'published','[\"products\\/17.jpg\"]',NULL,'5C-122-A1-A3',0,20,0,1,'in_stock',0,2,1,0,1682,NULL,NULL,NULL,20,14,19,552,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','0559257974232',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(55,'Angie’s Boomchickapop Sweet & Salty Kettle Corn',NULL,NULL,'published','[\"products\\/17.jpg\"]',NULL,'5C-122-A1-A4',0,20,0,1,'in_stock',0,2,1,0,1682,NULL,NULL,NULL,20,14,19,552,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','5663413686626',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(56,'All Natural Italian-Style Chicken Meatballs',NULL,NULL,'published','[\"products\\/18-1.jpg\"]',NULL,'78-116-A1',0,18,0,1,'in_stock',0,3,1,0,2042,NULL,NULL,NULL,12,15,10,804,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','2092577926164',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(57,'All Natural Italian-Style Chicken Meatballs',NULL,NULL,'published','[\"products\\/18.jpg\"]',NULL,'78-116-A1-A2',0,18,0,1,'in_stock',0,3,1,0,2042,NULL,NULL,NULL,12,15,10,804,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','4198706949603',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(58,'All Natural Italian-Style Chicken Meatballs',NULL,NULL,'published','[\"products\\/18.jpg\"]',NULL,'78-116-A1-A3',0,18,0,1,'in_stock',0,3,1,0,2042,NULL,NULL,NULL,12,15,10,804,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','3958235810208',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(59,'Simply Lemonade with Raspberry Juice',NULL,NULL,'published','[\"products\\/19-1.jpg\"]',NULL,'BO-133-A1',0,16,0,1,'in_stock',0,6,1,0,723,NULL,NULL,NULL,10,14,20,608,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','4689299636693',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(60,'Simply Lemonade with Raspberry Juice',NULL,NULL,'published','[\"products\\/19.jpg\"]',NULL,'BO-133-A1-A2',0,16,0,1,'in_stock',0,6,1,0,723,NULL,NULL,NULL,10,14,20,608,NULL,0,'2025-06-29 06:23:00','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','1474380616424',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(61,'Simply Lemonade with Raspberry Juice',NULL,NULL,'published','[\"products\\/19.jpg\"]',NULL,'BO-133-A1-A3',0,16,0,1,'in_stock',0,6,1,0,723,NULL,NULL,NULL,10,14,20,608,NULL,0,'2025-06-29 06:23:01','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','3864301365612',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(62,'Perdue Simply Smart Organics Gluten Free (Digital)',NULL,NULL,'published','[\"products\\/20-1.jpg\"]',NULL,'GC-144-A1',0,13,0,1,'in_stock',0,2,1,0,1712,1489.44,NULL,NULL,16,16,18,576,NULL,0,'2025-06-29 06:23:01','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'digital','9264620410101',NULL,0,'auto_generate',0,0,0,NULL,NULL,0),(63,'Colorful Banana',NULL,NULL,'published','[\"products\\/23-1.jpg\"]',NULL,'WC-131-A1',0,15,0,1,'in_stock',0,4,1,0,1518,NULL,NULL,NULL,17,17,13,542,NULL,0,'2025-06-29 06:23:01','2025-06-29 06:23:28',0,'Botble\\ACL\\Models\\User',NULL,'physical','8692322861937',NULL,0,'auto_generate',0,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_review_replies`
--

DROP TABLE IF EXISTS `ec_review_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_review_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `review_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_review_replies_review_id_user_id_unique` (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_review_replies`
--

LOCK TABLES `ec_review_replies` WRITE;
/*!40000 ALTER TABLE `ec_review_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_review_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `star` double NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `review_relation_index` (`product_id`,`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,9,NULL,NULL,24,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/17-1.jpg\"]'),(2,7,NULL,NULL,13,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3-1.jpg\",\"products\\/20-1.jpg\"]'),(3,10,NULL,NULL,17,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12-1.jpg\",\"products\\/13-1.jpg\",\"products\\/14.jpg\"]'),(4,9,NULL,NULL,10,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3.jpg\",\"products\\/6-1.jpg\",\"products\\/17.jpg\",\"products\\/19-1.jpg\"]'),(5,4,NULL,NULL,13,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\",\"products\\/15-1.jpg\",\"products\\/19-1.jpg\",\"products\\/21.jpg\"]'),(6,3,NULL,NULL,10,1,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\"]'),(7,10,NULL,NULL,4,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12.jpg\"]'),(8,4,NULL,NULL,8,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3.jpg\",\"products\\/13-1.jpg\",\"products\\/24.jpg\"]'),(9,1,NULL,NULL,15,4,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13.jpg\",\"products\\/16-1.jpg\",\"products\\/16-3.jpg\",\"products\\/18-1.jpg\"]'),(10,3,NULL,NULL,6,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5.jpg\",\"products\\/8-1.jpg\"]'),(11,1,NULL,NULL,6,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10.jpg\",\"products\\/14-1.jpg\",\"products\\/22-1.jpg\"]'),(12,10,NULL,NULL,22,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/6-1.jpg\",\"products\\/12.jpg\",\"products\\/22.jpg\"]'),(13,9,NULL,NULL,6,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/11.jpg\",\"products\\/13-1.jpg\",\"products\\/16-2.jpg\",\"products\\/16-6.jpg\"]'),(14,3,NULL,NULL,19,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6-1.jpg\",\"products\\/6.jpg\",\"products\\/16-5.jpg\",\"products\\/22.jpg\"]'),(15,10,NULL,NULL,1,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9.jpg\",\"products\\/15.jpg\",\"products\\/16-5.jpg\"]'),(16,10,NULL,NULL,9,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9.jpg\"]'),(17,8,NULL,NULL,7,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7.jpg\",\"products\\/16-1.jpg\",\"products\\/17-1.jpg\"]'),(18,5,NULL,NULL,14,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/24-1.jpg\"]'),(19,1,NULL,NULL,19,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\",\"products\\/10.jpg\",\"products\\/13-1.jpg\"]'),(20,2,NULL,NULL,18,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8.jpg\",\"products\\/16.jpg\",\"products\\/20.jpg\",\"products\\/22.jpg\"]'),(21,4,NULL,NULL,7,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/15-1.jpg\",\"products\\/17-1.jpg\",\"products\\/21-1.jpg\"]'),(22,8,NULL,NULL,17,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3-1.jpg\",\"products\\/4-1.jpg\",\"products\\/15-1.jpg\",\"products\\/19-1.jpg\"]'),(23,9,NULL,NULL,19,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/10-1.jpg\",\"products\\/10.jpg\",\"products\\/11-1.jpg\"]'),(24,4,NULL,NULL,16,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/8.jpg\",\"products\\/16-1.jpg\",\"products\\/18-1.jpg\"]'),(25,2,NULL,NULL,9,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6-1.jpg\",\"products\\/10-1.jpg\",\"products\\/14-1.jpg\"]'),(26,8,NULL,NULL,8,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/10.jpg\"]'),(27,1,NULL,NULL,16,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3-1.jpg\",\"products\\/6-1.jpg\",\"products\\/7-1.jpg\",\"products\\/9-1.jpg\"]'),(28,9,NULL,NULL,23,2,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/4.jpg\",\"products\\/12.jpg\",\"products\\/15.jpg\"]'),(29,5,NULL,NULL,2,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/24-1.jpg\"]'),(30,6,NULL,NULL,8,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16.jpg\",\"products\\/19-1.jpg\",\"products\\/21-1.jpg\"]'),(31,3,NULL,NULL,3,1,'Good app, good backup service and support. Good documentation.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/20-1.jpg\",\"products\\/20.jpg\",\"products\\/21.jpg\"]'),(32,6,NULL,NULL,13,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3-1.jpg\",\"products\\/9-1.jpg\",\"products\\/16-2.jpg\"]'),(33,1,NULL,NULL,18,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5.jpg\"]'),(34,8,NULL,NULL,5,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\"]'),(35,3,NULL,NULL,7,1,'Good app, good backup service and support. Good documentation.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/4.jpg\",\"products\\/13.jpg\",\"products\\/24.jpg\"]'),(36,1,NULL,NULL,20,5,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\"]'),(37,2,NULL,NULL,14,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-1.jpg\",\"products\\/22-1.jpg\"]'),(38,5,NULL,NULL,1,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/4-1.jpg\",\"products\\/16-6.jpg\",\"products\\/19-1.jpg\"]'),(39,6,NULL,NULL,3,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/19-1.jpg\"]'),(40,5,NULL,NULL,18,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-1.jpg\"]'),(41,7,NULL,NULL,12,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\"]'),(43,3,NULL,NULL,22,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6.jpg\",\"products\\/10-1.jpg\"]'),(44,9,NULL,NULL,22,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\",\"products\\/24.jpg\"]'),(45,10,NULL,NULL,24,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/24.jpg\"]'),(46,9,NULL,NULL,1,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\",\"products\\/16.jpg\",\"products\\/24.jpg\"]'),(47,6,NULL,NULL,1,1,'Good app, good backup service and support. Good documentation.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\"]'),(48,8,NULL,NULL,3,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/4.jpg\",\"products\\/18-1.jpg\"]'),(49,2,NULL,NULL,15,2,'Clean & perfect source code','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-1.jpg\"]'),(50,4,NULL,NULL,19,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/6-1.jpg\",\"products\\/10-1.jpg\",\"products\\/14-1.jpg\"]'),(51,9,NULL,NULL,18,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10-1.jpg\"]'),(52,3,NULL,NULL,23,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/15.jpg\"]'),(53,9,NULL,NULL,7,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\"]'),(54,1,NULL,NULL,9,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/9.jpg\",\"products\\/16-5.jpg\"]'),(55,4,NULL,NULL,22,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/9-1.jpg\",\"products\\/11-1.jpg\"]'),(56,6,NULL,NULL,11,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/8.jpg\",\"products\\/22.jpg\",\"products\\/23.jpg\"]'),(57,8,NULL,NULL,10,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12-1.jpg\",\"products\\/12.jpg\",\"products\\/13-1.jpg\",\"products\\/16-2.jpg\"]'),(58,3,NULL,NULL,12,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/9-1.jpg\",\"products\\/11-1.jpg\",\"products\\/20-1.jpg\"]'),(59,10,NULL,NULL,14,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/14.jpg\",\"products\\/15-1.jpg\"]'),(60,4,NULL,NULL,4,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\",\"products\\/14.jpg\",\"products\\/16-5.jpg\",\"products\\/18-1.jpg\"]'),(61,9,NULL,NULL,16,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/14-1.jpg\",\"products\\/16-5.jpg\"]'),(66,1,NULL,NULL,17,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3.jpg\",\"products\\/7-1.jpg\",\"products\\/14.jpg\"]'),(68,3,NULL,NULL,1,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6.jpg\",\"products\\/23-1.jpg\"]'),(69,6,NULL,NULL,7,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/21-1.jpg\"]'),(70,8,NULL,NULL,20,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\",\"products\\/18-1.jpg\"]'),(71,4,NULL,NULL,1,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/3.jpg\",\"products\\/20.jpg\",\"products\\/22-1.jpg\"]'),(72,9,NULL,NULL,13,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\",\"products\\/16-5.jpg\"]'),(75,9,NULL,NULL,2,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\",\"products\\/14-1.jpg\",\"products\\/21-1.jpg\",\"products\\/22-1.jpg\"]'),(77,10,NULL,NULL,13,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/16.jpg\"]'),(78,8,NULL,NULL,11,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/15.jpg\"]'),(79,5,NULL,NULL,24,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/13.jpg\"]'),(80,4,NULL,NULL,11,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/5-1.jpg\",\"products\\/6-1.jpg\",\"products\\/20.jpg\"]'),(82,5,NULL,NULL,20,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7.jpg\",\"products\\/15-1.jpg\",\"products\\/24-1.jpg\"]'),(83,7,NULL,NULL,18,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/16-3.jpg\",\"products\\/16-5.jpg\"]'),(84,8,NULL,NULL,24,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/6.jpg\",\"products\\/17-1.jpg\",\"products\\/19.jpg\"]'),(85,7,NULL,NULL,21,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/8-1.jpg\",\"products\\/10-1.jpg\",\"products\\/16-2.jpg\"]'),(86,8,NULL,NULL,15,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-6.jpg\",\"products\\/21-1.jpg\"]'),(87,1,NULL,NULL,10,1,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/10.jpg\",\"products\\/23-1.jpg\",\"products\\/24-1.jpg\"]'),(88,5,NULL,NULL,6,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/6-1.jpg\",\"products\\/16-1.jpg\",\"products\\/23.jpg\"]'),(89,7,NULL,NULL,2,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13.jpg\",\"products\\/22-1.jpg\"]'),(90,6,NULL,NULL,20,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/7.jpg\",\"products\\/21.jpg\"]'),(92,3,NULL,NULL,14,1,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\",\"products\\/23-1.jpg\",\"products\\/24-1.jpg\"]'),(93,4,NULL,NULL,14,1,'Clean & perfect source code','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12-1.jpg\"]'),(94,6,NULL,NULL,9,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8.jpg\",\"products\\/14-1.jpg\",\"products\\/21-1.jpg\",\"products\\/22-1.jpg\"]'),(95,2,NULL,NULL,8,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/21-1.jpg\"]'),(96,7,NULL,NULL,22,1,'Clean & perfect source code','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-1.jpg\",\"products\\/17-1.jpg\"]'),(99,2,NULL,NULL,19,4,'Good app, good backup service and support. Good documentation.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12.jpg\",\"products\\/16-3.jpg\"]'),(104,9,NULL,NULL,17,4,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/22-1.jpg\"]'),(106,3,NULL,NULL,8,1,'Good app, good backup service and support. Good documentation.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-6.jpg\"]'),(108,2,NULL,NULL,13,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/14-1.jpg\",\"products\\/21.jpg\",\"products\\/22.jpg\"]'),(109,2,NULL,NULL,1,1,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9.jpg\",\"products\\/18-1.jpg\",\"products\\/24.jpg\"]'),(110,5,NULL,NULL,19,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10-1.jpg\",\"products\\/14-1.jpg\"]'),(111,2,NULL,NULL,21,5,'Clean & perfect source code','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/3.jpg\",\"products\\/12.jpg\",\"products\\/14.jpg\"]'),(112,5,NULL,NULL,10,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/6.jpg\",\"products\\/20.jpg\"]'),(113,9,NULL,NULL,4,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/11.jpg\",\"products\\/16-4.jpg\"]'),(114,2,NULL,NULL,6,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-2.jpg\"]'),(115,10,NULL,NULL,7,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/23-1.jpg\",\"products\\/24.jpg\"]'),(117,6,NULL,NULL,5,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3.jpg\"]'),(118,10,NULL,NULL,8,4,'Clean & perfect source code','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/23-1.jpg\"]'),(119,7,NULL,NULL,5,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5.jpg\",\"products\\/7-1.jpg\"]'),(120,5,NULL,NULL,12,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10.jpg\"]'),(122,6,NULL,NULL,23,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/10-1.jpg\",\"products\\/16-6.jpg\"]'),(123,7,NULL,NULL,17,4,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/11.jpg\"]'),(124,1,NULL,NULL,8,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8.jpg\",\"products\\/23.jpg\"]'),(125,6,NULL,NULL,14,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/14-1.jpg\",\"products\\/18.jpg\",\"products\\/23.jpg\"]'),(126,6,NULL,NULL,17,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\",\"products\\/11.jpg\",\"products\\/17.jpg\",\"products\\/21-1.jpg\"]'),(128,5,NULL,NULL,21,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9.jpg\",\"products\\/11.jpg\",\"products\\/22.jpg\",\"products\\/23.jpg\"]'),(130,9,NULL,NULL,5,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/9.jpg\",\"products\\/13.jpg\"]'),(131,3,NULL,NULL,16,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/7-1.jpg\",\"products\\/10.jpg\",\"products\\/23-1.jpg\"]'),(132,5,NULL,NULL,16,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\"]'),(134,10,NULL,NULL,3,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/10.jpg\"]'),(135,5,NULL,NULL,4,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/11-1.jpg\",\"products\\/13.jpg\",\"products\\/17-1.jpg\",\"products\\/24-1.jpg\"]'),(136,6,NULL,NULL,22,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10.jpg\",\"products\\/13.jpg\",\"products\\/16-4.jpg\"]'),(142,1,NULL,NULL,1,2,'Good app, good backup service and support. Good documentation.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/14-1.jpg\"]'),(145,3,NULL,NULL,5,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/20-1.jpg\"]'),(146,1,NULL,NULL,7,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/4.jpg\",\"products\\/16-4.jpg\",\"products\\/16.jpg\"]'),(147,3,NULL,NULL,2,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/15-1.jpg\",\"products\\/18-1.jpg\"]'),(148,3,NULL,NULL,20,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/14.jpg\",\"products\\/17-1.jpg\",\"products\\/20.jpg\"]'),(149,9,NULL,NULL,8,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/22.jpg\"]'),(151,10,NULL,NULL,2,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13.jpg\",\"products\\/18.jpg\",\"products\\/23-1.jpg\"]'),(155,6,NULL,NULL,18,3,'Clean & perfect source code','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/7-1.jpg\",\"products\\/8.jpg\",\"products\\/16.jpg\"]'),(156,7,NULL,NULL,7,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10-1.jpg\",\"products\\/12-1.jpg\",\"products\\/20.jpg\"]'),(158,1,NULL,NULL,24,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-2.jpg\"]'),(162,6,NULL,NULL,15,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\",\"products\\/19.jpg\",\"products\\/20.jpg\"]'),(168,7,NULL,NULL,3,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/5-1.jpg\",\"products\\/9-1.jpg\",\"products\\/18-1.jpg\"]'),(170,8,NULL,NULL,23,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/2-1.jpg\",\"products\\/19-1.jpg\",\"products\\/22.jpg\"]'),(171,1,NULL,NULL,5,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\"]'),(175,7,NULL,NULL,15,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/22-1.jpg\"]'),(176,10,NULL,NULL,19,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\"]'),(180,5,NULL,NULL,23,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\",\"products\\/9-1.jpg\",\"products\\/21.jpg\"]'),(181,8,NULL,NULL,13,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/5-1.jpg\",\"products\\/19-1.jpg\",\"products\\/20.jpg\"]'),(185,3,NULL,NULL,24,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\"]'),(187,3,NULL,NULL,13,2,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/15-1.jpg\",\"products\\/16-3.jpg\"]'),(189,3,NULL,NULL,4,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/14.jpg\",\"products\\/16.jpg\"]'),(191,7,NULL,NULL,14,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/3-1.jpg\",\"products\\/15-1.jpg\",\"products\\/23.jpg\"]'),(193,5,NULL,NULL,11,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12.jpg\",\"products\\/13.jpg\",\"products\\/14.jpg\"]'),(195,10,NULL,NULL,20,2,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6-1.jpg\",\"products\\/16-5.jpg\",\"products\\/23.jpg\"]'),(196,1,NULL,NULL,12,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8.jpg\",\"products\\/12.jpg\",\"products\\/15.jpg\",\"products\\/20-1.jpg\"]'),(197,1,NULL,NULL,13,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5.jpg\",\"products\\/6.jpg\",\"products\\/18-1.jpg\",\"products\\/22.jpg\"]'),(199,5,NULL,NULL,7,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10-1.jpg\",\"products\\/14.jpg\",\"products\\/16-6.jpg\"]'),(200,7,NULL,NULL,6,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\"]'),(202,7,NULL,NULL,11,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/15.jpg\",\"products\\/22.jpg\"]'),(204,7,NULL,NULL,4,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/20.jpg\"]'),(205,5,NULL,NULL,22,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/14-1.jpg\",\"products\\/22-1.jpg\"]'),(208,1,NULL,NULL,2,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10.jpg\",\"products\\/13-1.jpg\",\"products\\/24.jpg\"]'),(211,4,NULL,NULL,20,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/15-1.jpg\",\"products\\/16-6.jpg\",\"products\\/24-1.jpg\"]'),(212,10,NULL,NULL,5,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-1.jpg\",\"products\\/20-1.jpg\",\"products\\/23-1.jpg\"]'),(214,2,NULL,NULL,10,1,'Clean & perfect source code','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/19-1.jpg\"]'),(215,5,NULL,NULL,9,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3.jpg\",\"products\\/14-1.jpg\",\"products\\/22.jpg\",\"products\\/23.jpg\"]'),(217,2,NULL,NULL,16,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/9-1.jpg\",\"products\\/15-1.jpg\",\"products\\/17-1.jpg\"]'),(222,4,NULL,NULL,18,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6.jpg\",\"products\\/7.jpg\",\"products\\/18.jpg\",\"products\\/19.jpg\"]'),(227,10,NULL,NULL,10,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/18-1.jpg\"]'),(229,4,NULL,NULL,5,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-6.jpg\",\"products\\/24-1.jpg\"]'),(231,10,NULL,NULL,21,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/3.jpg\",\"products\\/16-6.jpg\",\"products\\/22.jpg\"]'),(234,9,NULL,NULL,9,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\",\"products\\/16-3.jpg\",\"products\\/20-1.jpg\"]'),(237,6,NULL,NULL,4,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\"]'),(241,2,NULL,NULL,12,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/17.jpg\"]'),(242,6,NULL,NULL,21,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13.jpg\",\"products\\/16-4.jpg\"]'),(250,9,NULL,NULL,15,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6.jpg\",\"products\\/24-1.jpg\"]'),(253,7,NULL,NULL,16,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/11.jpg\"]'),(256,4,NULL,NULL,24,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12-1.jpg\",\"products\\/13-1.jpg\"]'),(257,10,NULL,NULL,16,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13.jpg\"]'),(259,2,NULL,NULL,4,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/9-1.jpg\",\"products\\/16-6.jpg\"]'),(260,2,NULL,NULL,3,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13.jpg\",\"products\\/17.jpg\",\"products\\/18.jpg\",\"products\\/19-1.jpg\"]'),(263,10,NULL,NULL,12,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/14.jpg\"]'),(265,8,NULL,NULL,1,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/17.jpg\",\"products\\/23.jpg\"]'),(266,9,NULL,NULL,3,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6-1.jpg\",\"products\\/12-1.jpg\",\"products\\/16-2.jpg\",\"products\\/16-4.jpg\"]'),(267,5,NULL,NULL,3,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/18-1.jpg\"]'),(274,6,NULL,NULL,6,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\"]'),(278,8,NULL,NULL,6,4,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10-1.jpg\",\"products\\/16-3.jpg\"]'),(281,7,NULL,NULL,20,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\",\"products\\/15.jpg\",\"products\\/23-1.jpg\"]'),(282,4,NULL,NULL,6,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/18.jpg\",\"products\\/21.jpg\"]'),(294,9,NULL,NULL,20,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-1.jpg\"]'),(304,4,NULL,NULL,10,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/11.jpg\",\"products\\/16-3.jpg\"]'),(309,10,NULL,NULL,23,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/6-1.jpg\",\"products\\/7-1.jpg\",\"products\\/13-1.jpg\"]'),(312,3,NULL,NULL,11,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/19.jpg\",\"products\\/20-1.jpg\",\"products\\/23.jpg\"]'),(313,1,NULL,NULL,14,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/8.jpg\"]'),(316,7,NULL,NULL,9,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/21.jpg\"]'),(320,2,NULL,NULL,24,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/16-1.jpg\"]'),(325,4,NULL,NULL,3,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/22-1.jpg\"]'),(332,7,NULL,NULL,8,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\",\"products\\/9-1.jpg\"]'),(334,5,NULL,NULL,15,1,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5.jpg\",\"products\\/12.jpg\",\"products\\/15-1.jpg\"]'),(342,5,NULL,NULL,13,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-3.jpg\"]'),(346,4,NULL,NULL,12,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\"]'),(351,1,NULL,NULL,22,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\"]'),(355,3,NULL,NULL,18,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/12-1.jpg\",\"products\\/19-1.jpg\",\"products\\/20-1.jpg\"]'),(357,2,NULL,NULL,20,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\"]'),(362,4,NULL,NULL,15,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/16-2.jpg\"]'),(365,8,NULL,NULL,9,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12-1.jpg\",\"products\\/15-1.jpg\",\"products\\/16.jpg\",\"products\\/21.jpg\"]'),(371,8,NULL,NULL,19,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7.jpg\",\"products\\/16-3.jpg\"]'),(373,9,NULL,NULL,11,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3.jpg\",\"products\\/12.jpg\",\"products\\/18-1.jpg\",\"products\\/19.jpg\"]'),(376,1,NULL,NULL,21,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/22.jpg\"]'),(377,5,NULL,NULL,17,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/11-1.jpg\",\"products\\/16-1.jpg\",\"products\\/21-1.jpg\",\"products\\/22.jpg\"]'),(380,4,NULL,NULL,23,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\",\"products\\/17-1.jpg\",\"products\\/23.jpg\",\"products\\/24.jpg\"]'),(385,9,NULL,NULL,21,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-1.jpg\",\"products\\/19-1.jpg\",\"products\\/23.jpg\"]'),(388,6,NULL,NULL,16,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/6-1.jpg\",\"products\\/10.jpg\"]'),(390,8,NULL,NULL,18,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/6.jpg\",\"products\\/16-5.jpg\"]'),(392,2,NULL,NULL,2,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/22-1.jpg\"]'),(396,3,NULL,NULL,17,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10.jpg\",\"products\\/15.jpg\"]'),(402,3,NULL,NULL,15,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/12-1.jpg\",\"products\\/17.jpg\",\"products\\/18.jpg\"]'),(403,6,NULL,NULL,2,2,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/22.jpg\",\"products\\/23.jpg\"]'),(411,5,NULL,NULL,5,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/12.jpg\"]'),(412,2,NULL,NULL,23,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/17-1.jpg\"]'),(421,9,NULL,NULL,12,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3-1.jpg\",\"products\\/10.jpg\",\"products\\/13-1.jpg\"]'),(430,8,NULL,NULL,12,2,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/16-6.jpg\",\"products\\/17.jpg\"]'),(435,8,NULL,NULL,21,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/7.jpg\",\"products\\/12-1.jpg\",\"products\\/14.jpg\"]'),(436,2,NULL,NULL,7,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4-1.jpg\",\"products\\/8-1.jpg\",\"products\\/10.jpg\"]'),(449,3,NULL,NULL,21,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/6-1.jpg\",\"products\\/8.jpg\",\"products\\/20-1.jpg\"]'),(450,8,NULL,NULL,4,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\"]'),(455,4,NULL,NULL,21,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/13-1.jpg\",\"products\\/18.jpg\"]'),(462,6,NULL,NULL,10,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/6-1.jpg\",\"products\\/14-1.jpg\",\"products\\/15.jpg\"]'),(464,8,NULL,NULL,16,3,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/9-1.jpg\",\"products\\/16.jpg\",\"products\\/22-1.jpg\"]'),(478,1,NULL,NULL,11,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\",\"products\\/21-1.jpg\"]'),(482,2,NULL,NULL,11,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/14-1.jpg\"]'),(492,1,NULL,NULL,3,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/5-1.jpg\",\"products\\/16-1.jpg\"]'),(526,5,NULL,NULL,8,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/9.jpg\",\"products\\/13-1.jpg\"]'),(543,2,NULL,NULL,17,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/9-1.jpg\",\"products\\/10-1.jpg\",\"products\\/11.jpg\"]'),(554,7,NULL,NULL,1,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/19.jpg\"]'),(572,7,NULL,NULL,23,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9-1.jpg\",\"products\\/15.jpg\",\"products\\/16-1.jpg\",\"products\\/24.jpg\"]'),(578,3,NULL,NULL,9,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2-1.jpg\",\"products\\/11.jpg\",\"products\\/12.jpg\"]'),(580,4,NULL,NULL,9,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/16-5.jpg\"]'),(587,10,NULL,NULL,18,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/22.jpg\"]'),(594,2,NULL,NULL,22,1,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/19.jpg\"]'),(609,7,NULL,NULL,24,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/8-1.jpg\",\"products\\/10.jpg\",\"products\\/11-1.jpg\",\"products\\/16-6.jpg\"]'),(611,4,NULL,NULL,17,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/6-1.jpg\",\"products\\/16-2.jpg\",\"products\\/16.jpg\"]'),(633,6,NULL,NULL,19,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/3-1.jpg\",\"products\\/5-1.jpg\",\"products\\/15.jpg\",\"products\\/24.jpg\"]'),(640,10,NULL,NULL,6,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/11-1.jpg\",\"products\\/12.jpg\",\"products\\/15.jpg\",\"products\\/16-6.jpg\"]'),(641,8,NULL,NULL,22,3,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/2.jpg\",\"products\\/14-1.jpg\",\"products\\/15.jpg\",\"products\\/16-2.jpg\"]'),(696,1,NULL,NULL,23,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1.jpg\",\"products\\/10-1.jpg\",\"products\\/12-1.jpg\"]'),(723,7,NULL,NULL,10,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/11.jpg\",\"products\\/16-6.jpg\"]'),(730,10,NULL,NULL,15,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/7-1.jpg\",\"products\\/20.jpg\",\"products\\/21-1.jpg\",\"products\\/23.jpg\"]'),(756,8,NULL,NULL,14,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/4.jpg\",\"products\\/14-1.jpg\"]'),(776,9,NULL,NULL,14,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/5-1.jpg\",\"products\\/15.jpg\"]'),(789,6,NULL,NULL,24,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/1-1.jpg\",\"products\\/5.jpg\",\"products\\/14.jpg\",\"products\\/24.jpg\"]'),(902,4,NULL,NULL,2,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/9.jpg\",\"products\\/19-1.jpg\",\"products\\/21.jpg\"]'),(919,8,NULL,NULL,2,2,'Best ecommerce CMS online store!','published','2025-06-29 06:23:07','2025-06-29 06:23:07','[\"products\\/10-1.jpg\",\"products\\/21-1.jpg\"]');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shared_wishlists`
--

DROP TABLE IF EXISTS `ec_shared_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shared_wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_shared_wishlists_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shared_wishlists`
--

LOCK TABLES `ec_shared_wishlists` WRITE;
/*!40000 ALTER TABLE `ec_shared_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shared_wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipment_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `weight` double DEFAULT '0',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `customer_delivered_confirmed_at` timestamp NULL DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2025-06-29 06:23:07','2025-06-29 06:23:07');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint unsigned NOT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free delivery',1,'based_on_price',1000.00,NULL,0.00,'2025-06-29 06:23:07','2025-06-29 06:23:07'),(2,'Flat Rate',1,'based_on_price',0.00,NULL,20.00,'2025-06-29 06:23:07','2025-06-29 06:23:07'),(3,'Local Pickup',1,'based_on_price',0.00,NULL,0.00,'2025-06-29 06:23:07','2025-06-29 06:23:07');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes`
--

DROP TABLE IF EXISTS `ec_specification_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_attributes_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes`
--

LOCK TABLES `ec_specification_attributes` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes` DISABLE KEYS */;
INSERT INTO `ec_specification_attributes` VALUES (1,1,'Height','text',NULL,NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(2,1,'Width','text',NULL,NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(3,1,'Weight','text',NULL,NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(4,2,'Power','text',NULL,NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(5,2,'Speed','text',NULL,NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(6,3,'Battery Life','text',NULL,NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(7,4,'Screen Size','text',NULL,NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(8,4,'Resolution','select','[\"1920x1080\",\"2560x1440\",\"3840x2160\"]',NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes_translations`
--

DROP TABLE IF EXISTS `ec_specification_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_attributes_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes_translations`
--

LOCK TABLES `ec_specification_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_groups`
--

DROP TABLE IF EXISTS `ec_specification_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_groups_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_groups`
--

LOCK TABLES `ec_specification_groups` WRITE;
/*!40000 ALTER TABLE `ec_specification_groups` DISABLE KEYS */;
INSERT INTO `ec_specification_groups` VALUES (1,'Dimensions',NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(2,'Performance',NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(3,'Battery',NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(4,'Display',NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_groups_translations`
--

DROP TABLE IF EXISTS `ec_specification_groups_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_groups_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_groups_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_groups_translations`
--

LOCK TABLES `ec_specification_groups_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_groups_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_groups_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_table_group`
--

DROP TABLE IF EXISTS `ec_specification_table_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_table_group` (
  `table_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`table_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_table_group`
--

LOCK TABLES `ec_specification_table_group` WRITE;
/*!40000 ALTER TABLE `ec_specification_table_group` DISABLE KEYS */;
INSERT INTO `ec_specification_table_group` VALUES (1,1,0),(1,2,0),(2,3,0),(2,4,0);
/*!40000 ALTER TABLE `ec_specification_table_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_tables`
--

DROP TABLE IF EXISTS `ec_specification_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_tables_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_tables`
--

LOCK TABLES `ec_specification_tables` WRITE;
/*!40000 ALTER TABLE `ec_specification_tables` DISABLE KEYS */;
INSERT INTO `ec_specification_tables` VALUES (1,'General Specification',NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL),(2,'Technical Specification',NULL,'2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_tables_translations`
--

DROP TABLE IF EXISTS `ec_specification_tables_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_tables_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_tables_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_tables_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_tables_translations`
--

LOCK TABLES `ec_specification_tables_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_tables_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_tables_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'Nest','sales@botble.com','18006268','North Link Building, 10 Admiralty Street','SG','Singapore','Singapore',1,1,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL);
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_products`
--

DROP TABLE IF EXISTS `ec_tax_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_products` (
  `tax_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tax_id`),
  KEY `ec_tax_products_tax_id_index` (`tax_id`),
  KEY `ec_tax_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_products`
--

LOCK TABLES `ec_tax_products` WRITE;
/*!40000 ALTER TABLE `ec_tax_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_rules`
--

DROP TABLE IF EXISTS `ec_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_rules`
--

LOCK TABLES `ec_tax_rules` WRITE;
/*!40000 ALTER TABLE `ec_tax_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10,1,'published','2025-06-29 06:23:01','2025-06-29 06:23:01'),(2,'None',0,2,'published','2025-06-29 06:23:01','2025-06-29 06:23:01'),(3,'Import Tax',15,3,'published','2025-06-29 06:23:01','2025-06-29 06:23:01');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes_translations`
--

DROP TABLE IF EXISTS `ec_taxes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_taxes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_taxes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes_translations`
--

LOCK TABLES `ec_taxes_translations` WRITE;
/*!40000 ALTER TABLE `ec_taxes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_taxes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`product_id`),
  KEY `wishlist_relation_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Shipping',0,'published','2025-06-29 06:22:47','2025-06-29 06:22:47',NULL),(2,'Payment',1,'published','2025-06-29 06:22:47','2025-06-29 06:22:47',NULL),(3,'Order &amp; Returns',2,'published','2025-06-29 06:22:47','2025-06-29 06:22:47',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2025-06-29 06:22:47','2025-06-29 06:22:47'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2025-06-29 06:22:47','2025-06-29 06:22:47');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','f792ae49506521deceaae37d63b8d58e',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'en_US','707cb96c825fed6f7ad4ecd95492d717',2,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(3,'en_US','c66e99abda027f9f951a44ed5dfced58',3,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(4,'en_US','4e0330db299523d8d3139291cb8e99f9',4,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(5,'en_US','720d9e0ae88c5906dfca4d6b0695c2ca',5,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(6,'en_US','79ea034923fb864521ecb1dd42274ca6',6,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(7,'en_US','a5569edcc7ef97123bd0837b977ae2c2',7,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(8,'en_US','a96d5231317a0ddc19a1b73f929235f0',1,'Botble\\Menu\\Models\\MenuLocation'),(9,'en_US','2365ec0a18f9899a682d4fc9924711e1',1,'Botble\\Menu\\Models\\Menu'),(10,'en_US','4be3ee489f5f727e2fc6bb656494cae2',2,'Botble\\Menu\\Models\\MenuLocation'),(11,'en_US','8d979cfe80702e0eadf3d45fb290e5f2',2,'Botble\\Menu\\Models\\Menu'),(12,'en_US','a350f1bd897248b5ba91371cdbf9b145',3,'Botble\\Menu\\Models\\Menu'),(13,'en_US','b4b642f600376de081d06acb74a8e6b3',4,'Botble\\Menu\\Models\\Menu'),(14,'en_US','f16660150815f22ae702e5ff56d4ead3',5,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'icon-1','icon-1',1,'image/png',5327,'product-categories/icon-1.png','[]','2025-06-29 06:22:47','2025-06-29 06:22:47',NULL,'public'),(2,0,'icon-10','icon-10',1,'image/png',5327,'product-categories/icon-10.png','[]','2025-06-29 06:22:47','2025-06-29 06:22:47',NULL,'public'),(3,0,'icon-11','icon-11',1,'image/png',5327,'product-categories/icon-11.png','[]','2025-06-29 06:22:47','2025-06-29 06:22:47',NULL,'public'),(4,0,'icon-12','icon-12',1,'image/png',5327,'product-categories/icon-12.png','[]','2025-06-29 06:22:47','2025-06-29 06:22:47',NULL,'public'),(5,0,'icon-13','icon-13',1,'image/png',5327,'product-categories/icon-13.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(6,0,'icon-14','icon-14',1,'image/png',5327,'product-categories/icon-14.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(7,0,'icon-2','icon-2',1,'image/png',5327,'product-categories/icon-2.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(8,0,'icon-3','icon-3',1,'image/png',5327,'product-categories/icon-3.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(9,0,'icon-4','icon-4',1,'image/png',5327,'product-categories/icon-4.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(10,0,'icon-5','icon-5',1,'image/png',5327,'product-categories/icon-5.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(11,0,'icon-6','icon-6',1,'image/png',5327,'product-categories/icon-6.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(12,0,'icon-7','icon-7',1,'image/png',5327,'product-categories/icon-7.png','[]','2025-06-29 06:22:48','2025-06-29 06:22:48',NULL,'public'),(13,0,'icon-8','icon-8',1,'image/png',5327,'product-categories/icon-8.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(14,0,'icon-9','icon-9',1,'image/png',5327,'product-categories/icon-9.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(15,0,'image-1','image-1',1,'image/png',5327,'product-categories/image-1.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(16,0,'image-10','image-10',1,'image/png',5327,'product-categories/image-10.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(17,0,'image-11','image-11',1,'image/png',5327,'product-categories/image-11.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(18,0,'image-12','image-12',1,'image/png',5327,'product-categories/image-12.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(19,0,'image-13','image-13',1,'image/png',5327,'product-categories/image-13.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(20,0,'image-14','image-14',1,'image/png',5327,'product-categories/image-14.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(21,0,'image-15','image-15',1,'image/png',5327,'product-categories/image-15.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(22,0,'image-2','image-2',1,'image/png',5327,'product-categories/image-2.png','[]','2025-06-29 06:22:49','2025-06-29 06:22:49',NULL,'public'),(23,0,'image-3','image-3',1,'image/png',5327,'product-categories/image-3.png','[]','2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'public'),(24,0,'image-4','image-4',1,'image/png',5327,'product-categories/image-4.png','[]','2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'public'),(25,0,'image-5','image-5',1,'image/png',5327,'product-categories/image-5.png','[]','2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'public'),(26,0,'image-6','image-6',1,'image/png',5327,'product-categories/image-6.png','[]','2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'public'),(27,0,'image-7','image-7',1,'image/png',5327,'product-categories/image-7.png','[]','2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'public'),(28,0,'image-8','image-8',1,'image/png',5327,'product-categories/image-8.png','[]','2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'public'),(29,0,'image-9','image-9',1,'image/png',5327,'product-categories/image-9.png','[]','2025-06-29 06:22:50','2025-06-29 06:22:50',NULL,'public'),(30,0,'1-1','1-1',2,'image/jpeg',9803,'products/1-1.jpg','[]','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL,'public'),(31,0,'1','1',2,'image/jpeg',9803,'products/1.jpg','[]','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL,'public'),(32,0,'10-1','10-1',2,'image/jpeg',9803,'products/10-1.jpg','[]','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL,'public'),(33,0,'10','10',2,'image/jpeg',9803,'products/10.jpg','[]','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL,'public'),(34,0,'11-1','11-1',2,'image/jpeg',9803,'products/11-1.jpg','[]','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL,'public'),(35,0,'11','11',2,'image/jpeg',9803,'products/11.jpg','[]','2025-06-29 06:22:51','2025-06-29 06:22:51',NULL,'public'),(36,0,'12-1','12-1',2,'image/jpeg',9803,'products/12-1.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(37,0,'12','12',2,'image/jpeg',9803,'products/12.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(38,0,'13-1','13-1',2,'image/jpeg',9803,'products/13-1.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(39,0,'13','13',2,'image/jpeg',9803,'products/13.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(40,0,'14-1','14-1',2,'image/jpeg',9803,'products/14-1.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(41,0,'14','14',2,'image/jpeg',9803,'products/14.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(42,0,'15-1','15-1',2,'image/jpeg',9803,'products/15-1.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(43,0,'15','15',2,'image/jpeg',9803,'products/15.jpg','[]','2025-06-29 06:22:52','2025-06-29 06:22:52',NULL,'public'),(44,0,'16-1','16-1',2,'image/jpeg',9803,'products/16-1.jpg','[]','2025-06-29 06:22:53','2025-06-29 06:22:53',NULL,'public'),(45,0,'16-2','16-2',2,'image/jpeg',9803,'products/16-2.jpg','[]','2025-06-29 06:22:53','2025-06-29 06:22:53',NULL,'public'),(46,0,'16-3','16-3',2,'image/jpeg',9803,'products/16-3.jpg','[]','2025-06-29 06:22:53','2025-06-29 06:22:53',NULL,'public'),(47,0,'16-4','16-4',2,'image/jpeg',9803,'products/16-4.jpg','[]','2025-06-29 06:22:53','2025-06-29 06:22:53',NULL,'public'),(48,0,'16-5','16-5',2,'image/jpeg',9803,'products/16-5.jpg','[]','2025-06-29 06:22:53','2025-06-29 06:22:53',NULL,'public'),(49,0,'16-6','16-6',2,'image/jpeg',9803,'products/16-6.jpg','[]','2025-06-29 06:22:53','2025-06-29 06:22:53',NULL,'public'),(50,0,'16','16',2,'image/jpeg',9803,'products/16.jpg','[]','2025-06-29 06:22:54','2025-06-29 06:22:54',NULL,'public'),(51,0,'17-1','17-1',2,'image/jpeg',9803,'products/17-1.jpg','[]','2025-06-29 06:22:54','2025-06-29 06:22:54',NULL,'public'),(52,0,'17','17',2,'image/jpeg',9803,'products/17.jpg','[]','2025-06-29 06:22:54','2025-06-29 06:22:54',NULL,'public'),(53,0,'18-1','18-1',2,'image/jpeg',9803,'products/18-1.jpg','[]','2025-06-29 06:22:54','2025-06-29 06:22:54',NULL,'public'),(54,0,'18','18',2,'image/jpeg',9803,'products/18.jpg','[]','2025-06-29 06:22:54','2025-06-29 06:22:54',NULL,'public'),(55,0,'19-1','19-1',2,'image/jpeg',9803,'products/19-1.jpg','[]','2025-06-29 06:22:54','2025-06-29 06:22:54',NULL,'public'),(56,0,'19','19',2,'image/jpeg',9803,'products/19.jpg','[]','2025-06-29 06:22:55','2025-06-29 06:22:55',NULL,'public'),(57,0,'2-1','2-1',2,'image/jpeg',9803,'products/2-1.jpg','[]','2025-06-29 06:22:55','2025-06-29 06:22:55',NULL,'public'),(58,0,'2','2',2,'image/jpeg',9803,'products/2.jpg','[]','2025-06-29 06:22:55','2025-06-29 06:22:55',NULL,'public'),(59,0,'20-1','20-1',2,'image/jpeg',9803,'products/20-1.jpg','[]','2025-06-29 06:22:55','2025-06-29 06:22:55',NULL,'public'),(60,0,'20','20',2,'image/jpeg',9803,'products/20.jpg','[]','2025-06-29 06:22:55','2025-06-29 06:22:55',NULL,'public'),(61,0,'21-1','21-1',2,'image/jpeg',9803,'products/21-1.jpg','[]','2025-06-29 06:22:55','2025-06-29 06:22:55',NULL,'public'),(62,0,'21','21',2,'image/jpeg',9803,'products/21.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(63,0,'22-1','22-1',2,'image/jpeg',9803,'products/22-1.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(64,0,'22','22',2,'image/jpeg',9803,'products/22.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(65,0,'23-1','23-1',2,'image/jpeg',9803,'products/23-1.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(66,0,'23','23',2,'image/jpeg',9803,'products/23.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(67,0,'24-1','24-1',2,'image/jpeg',9803,'products/24-1.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(68,0,'24','24',2,'image/jpeg',9803,'products/24.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(69,0,'3-1','3-1',2,'image/jpeg',9803,'products/3-1.jpg','[]','2025-06-29 06:22:56','2025-06-29 06:22:56',NULL,'public'),(70,0,'3','3',2,'image/jpeg',9803,'products/3.jpg','[]','2025-06-29 06:22:57','2025-06-29 06:22:57',NULL,'public'),(71,0,'4-1','4-1',2,'image/jpeg',9803,'products/4-1.jpg','[]','2025-06-29 06:22:57','2025-06-29 06:22:57',NULL,'public'),(72,0,'4','4',2,'image/jpeg',9803,'products/4.jpg','[]','2025-06-29 06:22:57','2025-06-29 06:22:57',NULL,'public'),(73,0,'5-1','5-1',2,'image/jpeg',9803,'products/5-1.jpg','[]','2025-06-29 06:22:57','2025-06-29 06:22:57',NULL,'public'),(74,0,'5','5',2,'image/jpeg',9803,'products/5.jpg','[]','2025-06-29 06:22:57','2025-06-29 06:22:57',NULL,'public'),(75,0,'6-1','6-1',2,'image/jpeg',9803,'products/6-1.jpg','[]','2025-06-29 06:22:57','2025-06-29 06:22:57',NULL,'public'),(76,0,'6','6',2,'image/jpeg',9803,'products/6.jpg','[]','2025-06-29 06:22:57','2025-06-29 06:22:57',NULL,'public'),(77,0,'7-1','7-1',2,'image/jpeg',9803,'products/7-1.jpg','[]','2025-06-29 06:22:58','2025-06-29 06:22:58',NULL,'public'),(78,0,'7','7',2,'image/jpeg',9803,'products/7.jpg','[]','2025-06-29 06:22:58','2025-06-29 06:22:58',NULL,'public'),(79,0,'8-1','8-1',2,'image/jpeg',9803,'products/8-1.jpg','[]','2025-06-29 06:22:58','2025-06-29 06:22:58',NULL,'public'),(80,0,'8','8',2,'image/jpeg',9803,'products/8.jpg','[]','2025-06-29 06:22:58','2025-06-29 06:22:58',NULL,'public'),(81,0,'9-1','9-1',2,'image/jpeg',9803,'products/9-1.jpg','[]','2025-06-29 06:22:58','2025-06-29 06:22:58',NULL,'public'),(82,0,'9','9',2,'image/jpeg',9803,'products/9.jpg','[]','2025-06-29 06:22:58','2025-06-29 06:22:58',NULL,'public'),(83,0,'1','1',3,'image/jpeg',9803,'customers/1.jpg','[]','2025-06-29 06:23:01','2025-06-29 06:23:01',NULL,'public'),(84,0,'10','10',3,'image/jpeg',9803,'customers/10.jpg','[]','2025-06-29 06:23:01','2025-06-29 06:23:01',NULL,'public'),(85,0,'2','2',3,'image/jpeg',9803,'customers/2.jpg','[]','2025-06-29 06:23:01','2025-06-29 06:23:01',NULL,'public'),(86,0,'3','3',3,'image/jpeg',9803,'customers/3.jpg','[]','2025-06-29 06:23:01','2025-06-29 06:23:01',NULL,'public'),(87,0,'4','4',3,'image/jpeg',9803,'customers/4.jpg','[]','2025-06-29 06:23:01','2025-06-29 06:23:01',NULL,'public'),(88,0,'5','5',3,'image/jpeg',9803,'customers/5.jpg','[]','2025-06-29 06:23:02','2025-06-29 06:23:02',NULL,'public'),(89,0,'6','6',3,'image/jpeg',9803,'customers/6.jpg','[]','2025-06-29 06:23:02','2025-06-29 06:23:02',NULL,'public'),(90,0,'7','7',3,'image/jpeg',9803,'customers/7.jpg','[]','2025-06-29 06:23:02','2025-06-29 06:23:02',NULL,'public'),(91,0,'8','8',3,'image/jpeg',9803,'customers/8.jpg','[]','2025-06-29 06:23:02','2025-06-29 06:23:02',NULL,'public'),(92,0,'9','9',3,'image/jpeg',9803,'customers/9.jpg','[]','2025-06-29 06:23:02','2025-06-29 06:23:02',NULL,'public'),(93,0,'1','1',4,'image/png',17727,'flash-sales/1.png','[]','2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,'public'),(94,0,'2','2',4,'image/png',12278,'flash-sales/2.png','[]','2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,'public'),(95,0,'3','3',4,'image/png',12278,'flash-sales/3.png','[]','2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,'public'),(96,0,'4','4',4,'image/png',12278,'flash-sales/4.png','[]','2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,'public'),(97,0,'5','5',4,'image/png',12278,'flash-sales/5.png','[]','2025-06-29 06:23:08','2025-06-29 06:23:08',NULL,'public'),(98,0,'1-1','1-1',5,'image/png',28526,'sliders/1-1.png','[]','2025-06-29 06:23:09','2025-06-29 06:23:09',NULL,'public'),(99,0,'1-2','1-2',5,'image/png',28526,'sliders/1-2.png','[]','2025-06-29 06:23:09','2025-06-29 06:23:09',NULL,'public'),(100,0,'2-1','2-1',5,'image/png',15581,'sliders/2-1.png','[]','2025-06-29 06:23:09','2025-06-29 06:23:09',NULL,'public'),(101,0,'2-2','2-2',5,'image/png',15581,'sliders/2-2.png','[]','2025-06-29 06:23:09','2025-06-29 06:23:09',NULL,'public'),(102,0,'3-1','3-1',5,'image/png',28526,'sliders/3-1.png','[]','2025-06-29 06:23:10','2025-06-29 06:23:10',NULL,'public'),(103,0,'3-2','3-2',5,'image/png',28526,'sliders/3-2.png','[]','2025-06-29 06:23:10','2025-06-29 06:23:10',NULL,'public'),(104,0,'4-1','4-1',5,'image/png',28526,'sliders/4-1.png','[]','2025-06-29 06:23:10','2025-06-29 06:23:10',NULL,'public'),(105,0,'4-2','4-2',5,'image/png',28526,'sliders/4-2.png','[]','2025-06-29 06:23:11','2025-06-29 06:23:11',NULL,'public'),(106,0,'5-1','5-1',5,'image/png',23916,'sliders/5-1.png','[]','2025-06-29 06:23:11','2025-06-29 06:23:11',NULL,'public'),(107,0,'5-2','5-2',5,'image/png',23916,'sliders/5-2.png','[]','2025-06-29 06:23:11','2025-06-29 06:23:11',NULL,'public'),(108,0,'banner-1','banner-1',5,'image/png',212534,'sliders/banner-1.png','[]','2025-06-29 06:23:12','2025-06-29 06:23:12',NULL,'public'),(109,0,'thumbnail-1','thumbnail-1',5,'image/jpeg',9803,'sliders/thumbnail-1.jpg','[]','2025-06-29 06:23:12','2025-06-29 06:23:12',NULL,'public'),(110,0,'thumbnail-2','thumbnail-2',5,'image/jpeg',9803,'sliders/thumbnail-2.jpg','[]','2025-06-29 06:23:12','2025-06-29 06:23:12',NULL,'public'),(111,0,'thumbnail-3','thumbnail-3',5,'image/jpeg',9803,'sliders/thumbnail-3.jpg','[]','2025-06-29 06:23:12','2025-06-29 06:23:12',NULL,'public'),(112,0,'thumbnail-4','thumbnail-4',5,'image/jpeg',9803,'sliders/thumbnail-4.jpg','[]','2025-06-29 06:23:12','2025-06-29 06:23:12',NULL,'public'),(113,0,'thumbnail-5','thumbnail-5',5,'image/jpeg',9803,'sliders/thumbnail-5.jpg','[]','2025-06-29 06:23:12','2025-06-29 06:23:12',NULL,'public'),(114,0,'thumbnail-6','thumbnail-6',5,'image/jpeg',9803,'sliders/thumbnail-6.jpg','[]','2025-06-29 06:23:13','2025-06-29 06:23:13',NULL,'public'),(115,0,'1','1',6,'image/png',9803,'news/1.png','[]','2025-06-29 06:23:13','2025-06-29 06:23:13',NULL,'public'),(116,0,'10','10',6,'image/png',9803,'news/10.png','[]','2025-06-29 06:23:13','2025-06-29 06:23:13',NULL,'public'),(117,0,'11','11',6,'image/png',9803,'news/11.png','[]','2025-06-29 06:23:13','2025-06-29 06:23:13',NULL,'public'),(118,0,'2','2',6,'image/png',9803,'news/2.png','[]','2025-06-29 06:23:13','2025-06-29 06:23:13',NULL,'public'),(119,0,'3','3',6,'image/png',9803,'news/3.png','[]','2025-06-29 06:23:13','2025-06-29 06:23:13',NULL,'public'),(120,0,'4','4',6,'image/png',9803,'news/4.png','[]','2025-06-29 06:23:13','2025-06-29 06:23:13',NULL,'public'),(121,0,'5','5',6,'image/png',9803,'news/5.png','[]','2025-06-29 06:23:14','2025-06-29 06:23:14',NULL,'public'),(122,0,'6','6',6,'image/png',9803,'news/6.png','[]','2025-06-29 06:23:14','2025-06-29 06:23:14',NULL,'public'),(123,0,'7','7',6,'image/png',9803,'news/7.png','[]','2025-06-29 06:23:14','2025-06-29 06:23:14',NULL,'public'),(124,0,'8','8',6,'image/png',9803,'news/8.png','[]','2025-06-29 06:23:14','2025-06-29 06:23:14',NULL,'public'),(125,0,'9','9',6,'image/png',9803,'news/9.png','[]','2025-06-29 06:23:14','2025-06-29 06:23:14',NULL,'public'),(126,0,'app-store','app-store',7,'image/jpeg',1928,'general/app-store.jpg','[]','2025-06-29 06:23:15','2025-06-29 06:23:15',NULL,'public'),(127,0,'category-1','category-1',7,'image/png',1070,'general/category-1.png','[]','2025-06-29 06:23:15','2025-06-29 06:23:15',NULL,'public'),(128,0,'clock','clock',7,'image/png',4405,'general/clock.png','[]','2025-06-29 06:23:15','2025-06-29 06:23:15',NULL,'public'),(129,0,'contact-img','contact-img',7,'image/jpeg',35441,'general/contact-img.jpg','[]','2025-06-29 06:23:15','2025-06-29 06:23:15',NULL,'public'),(130,0,'credit-card','credit-card',7,'image/png',1455,'general/credit-card.png','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(131,0,'facebook','facebook',7,'image/png',804,'general/facebook.png','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(132,0,'favicon','favicon',7,'image/png',5383,'general/favicon.png','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(133,0,'google-play','google-play',7,'image/jpeg',1928,'general/google-play.jpg','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(134,0,'header-bg','header-bg',7,'image/png',36758,'general/header-bg.png','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(135,0,'home-6','home-6',7,'image/jpeg',103307,'general/home-6.jpeg','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(136,0,'icon-1','icon-1',7,'image/png',3143,'general/icon-1.png','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(137,0,'icon-2','icon-2',7,'image/png',5389,'general/icon-2.png','[]','2025-06-29 06:23:16','2025-06-29 06:23:16',NULL,'public'),(138,0,'icon-3','icon-3',7,'image/png',3452,'general/icon-3.png','[]','2025-06-29 06:23:17','2025-06-29 06:23:17',NULL,'public'),(139,0,'icon-4','icon-4',7,'image/png',3369,'general/icon-4.png','[]','2025-06-29 06:23:17','2025-06-29 06:23:17',NULL,'public'),(140,0,'icon-5','icon-5',7,'image/png',4435,'general/icon-5.png','[]','2025-06-29 06:23:17','2025-06-29 06:23:17',NULL,'public'),(141,0,'instagram','instagram',7,'image/png',2935,'general/instagram.png','[]','2025-06-29 06:23:17','2025-06-29 06:23:17',NULL,'public'),(142,0,'loading','loading',7,'image/gif',23986,'general/loading.gif','[]','2025-06-29 06:23:17','2025-06-29 06:23:17',NULL,'public'),(143,0,'login-1','login-1',7,'image/png',20332,'general/login-1.png','[]','2025-06-29 06:23:18','2025-06-29 06:23:18',NULL,'public'),(144,0,'logo','logo',7,'image/png',16069,'general/logo.png','[]','2025-06-29 06:23:18','2025-06-29 06:23:18',NULL,'public'),(145,0,'newsletter-background-image','newsletter-background-image',7,'image/png',58306,'general/newsletter-background-image.png','[]','2025-06-29 06:23:18','2025-06-29 06:23:18',NULL,'public'),(146,0,'newsletter-image','newsletter-image',7,'image/png',14191,'general/newsletter-image.png','[]','2025-06-29 06:23:18','2025-06-29 06:23:18',NULL,'public'),(147,0,'open-graph-image','open-graph-image',7,'image/png',387270,'general/open-graph-image.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(148,0,'paper-plane','paper-plane',7,'image/png',5184,'general/paper-plane.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(149,0,'payment-methods','payment-methods',7,'image/png',476,'general/payment-methods.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(150,0,'pinterest','pinterest',7,'image/png',2430,'general/pinterest.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(151,0,'twitter','twitter',7,'image/png',2058,'general/twitter.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(152,0,'youtube','youtube',7,'image/png',1296,'general/youtube.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(153,0,'cod','cod',8,'image/png',12121,'payments/cod.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(154,0,'bank-transfer','bank-transfer',8,'image/png',29089,'payments/bank-transfer.png','[]','2025-06-29 06:23:19','2025-06-29 06:23:19',NULL,'public'),(155,0,'stripe','stripe',8,'image/webp',7516,'payments/stripe.webp','[]','2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,'public'),(156,0,'paypal','paypal',8,'image/png',3001,'payments/paypal.png','[]','2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,'public'),(157,0,'mollie','mollie',8,'image/png',8968,'payments/mollie.png','[]','2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,'public'),(158,0,'paystack','paystack',8,'image/png',31015,'payments/paystack.png','[]','2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,'public'),(159,0,'razorpay','razorpay',8,'image/png',8489,'payments/razorpay.png','[]','2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,'public'),(160,0,'sslcommerz','sslcommerz',8,'image/png',3482,'payments/sslcommerz.png','[]','2025-06-29 06:23:20','2025-06-29 06:23:20',NULL,'public'),(161,0,'1','1',9,'image/png',11540,'promotion/1.png','[]','2025-06-29 06:23:21','2025-06-29 06:23:21',NULL,'public'),(162,0,'10','10',9,'image/png',7883,'promotion/10.png','[]','2025-06-29 06:23:21','2025-06-29 06:23:21',NULL,'public'),(163,0,'11','11',9,'image/png',7883,'promotion/11.png','[]','2025-06-29 06:23:21','2025-06-29 06:23:21',NULL,'public'),(164,0,'12','12',9,'image/png',7883,'promotion/12.png','[]','2025-06-29 06:23:21','2025-06-29 06:23:21',NULL,'public'),(165,0,'2','2',9,'image/png',11540,'promotion/2.png','[]','2025-06-29 06:23:21','2025-06-29 06:23:21',NULL,'public'),(166,0,'3','3',9,'image/png',11540,'promotion/3.png','[]','2025-06-29 06:23:21','2025-06-29 06:23:21',NULL,'public'),(167,0,'4','4',9,'image/png',13954,'promotion/4.png','[]','2025-06-29 06:23:21','2025-06-29 06:23:21',NULL,'public'),(168,0,'5','5',9,'image/png',26326,'promotion/5.png','[]','2025-06-29 06:23:22','2025-06-29 06:23:22',NULL,'public'),(169,0,'6','6',9,'image/png',26326,'promotion/6.png','[]','2025-06-29 06:23:22','2025-06-29 06:23:22',NULL,'public'),(170,0,'7','7',9,'image/png',14402,'promotion/7.png','[]','2025-06-29 06:23:22','2025-06-29 06:23:22',NULL,'public'),(171,0,'8','8',9,'image/png',7028,'promotion/8.png','[]','2025-06-29 06:23:22','2025-06-29 06:23:22',NULL,'public'),(172,0,'9','9',9,'image/png',7883,'promotion/9.png','[]','2025-06-29 06:23:22','2025-06-29 06:23:22',NULL,'public'),(173,0,'1','1',10,'image/png',5327,'stores/1.png','[]','2025-06-29 06:23:23','2025-06-29 06:23:23',NULL,'public'),(174,0,'10','10',10,'image/png',5327,'stores/10.png','[]','2025-06-29 06:23:23','2025-06-29 06:23:23',NULL,'public'),(175,0,'11','11',10,'image/png',5327,'stores/11.png','[]','2025-06-29 06:23:23','2025-06-29 06:23:23',NULL,'public'),(176,0,'12','12',10,'image/png',5327,'stores/12.png','[]','2025-06-29 06:23:23','2025-06-29 06:23:23',NULL,'public'),(177,0,'13','13',10,'image/png',5327,'stores/13.png','[]','2025-06-29 06:23:23','2025-06-29 06:23:23',NULL,'public'),(178,0,'14','14',10,'image/png',5327,'stores/14.png','[]','2025-06-29 06:23:23','2025-06-29 06:23:23',NULL,'public'),(179,0,'15','15',10,'image/png',5327,'stores/15.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(180,0,'16','16',10,'image/png',5327,'stores/16.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(181,0,'17','17',10,'image/png',5327,'stores/17.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(182,0,'2','2',10,'image/png',5327,'stores/2.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(183,0,'3','3',10,'image/png',5327,'stores/3.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(184,0,'4','4',10,'image/png',5327,'stores/4.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(185,0,'5','5',10,'image/png',5327,'stores/5.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(186,0,'6','6',10,'image/png',5327,'stores/6.png','[]','2025-06-29 06:23:24','2025-06-29 06:23:24',NULL,'public'),(187,0,'7','7',10,'image/png',5327,'stores/7.png','[]','2025-06-29 06:23:25','2025-06-29 06:23:25',NULL,'public'),(188,0,'8','8',10,'image/png',5327,'stores/8.png','[]','2025-06-29 06:23:25','2025-06-29 06:23:25',NULL,'public'),(189,0,'9','9',10,'image/png',5327,'stores/9.png','[]','2025-06-29 06:23:25','2025-06-29 06:23:25',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'product-categories',NULL,'product-categories',0,'2025-06-29 06:22:47','2025-06-29 06:22:47',NULL),(2,0,'products',NULL,'products',0,'2025-06-29 06:22:51','2025-06-29 06:22:51',NULL),(3,0,'customers',NULL,'customers',0,'2025-06-29 06:23:01','2025-06-29 06:23:01',NULL),(4,0,'flash-sales',NULL,'flash-sales',0,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL),(5,0,'sliders',NULL,'sliders',0,'2025-06-29 06:23:08','2025-06-29 06:23:08',NULL),(6,0,'news',NULL,'news',0,'2025-06-29 06:23:13','2025-06-29 06:23:13',NULL),(7,0,'general',NULL,'general',0,'2025-06-29 06:23:15','2025-06-29 06:23:15',NULL),(8,0,'payments',NULL,'payments',0,'2025-06-29 06:23:19','2025-06-29 06:23:19',NULL),(9,0,'promotion',NULL,'promotion',0,'2025-06-29 06:23:21','2025-06-29 06:23:21',NULL),(10,0,'stores',NULL,'stores',0,'2025-06-29 06:23:23','2025-06-29 06:23:23',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-06-29 06:23:28','2025-06-29 06:23:28'),(2,2,'header-navigation','2025-06-29 06:23:28','2025-06-29 06:23:28');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/','fi-rs-home',0,'Home',NULL,'_self',1,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(2,1,1,1,'Botble\\Page\\Models\\Page','/',NULL,0,'Home 1',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(3,1,1,2,'Botble\\Page\\Models\\Page','/homepage-2',NULL,1,'Home 2',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(4,1,1,3,'Botble\\Page\\Models\\Page','/homepage-3',NULL,2,'Home 3',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(5,1,1,4,'Botble\\Page\\Models\\Page','/homepage-4',NULL,3,'Home 4',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(6,1,1,16,'Botble\\Page\\Models\\Page','/homepage-5',NULL,4,'Home 5',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(7,1,1,17,'Botble\\Page\\Models\\Page','/homepage-6',NULL,5,'Home 6',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(8,1,0,NULL,NULL,'/products',NULL,1,'Shop',NULL,'_self',1,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(9,1,8,NULL,NULL,'/products',NULL,0,'Shop Grid - Full Width',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(10,1,8,NULL,NULL,'/products?layout=product-right-sidebar',NULL,1,'Shop Grid - Right Sidebar',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(11,1,8,NULL,NULL,'/products?layout=product-left-sidebar',NULL,2,'Shop Grid - Left Sidebar',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(12,1,8,1,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,3,'Products Of Category',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(13,1,0,NULL,NULL,'/stores',NULL,2,'Stores',NULL,'_self',1,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(14,1,13,NULL,NULL,'/stores',NULL,0,'Stores - Grid',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(15,1,13,NULL,NULL,'/stores?layout=stores-list',NULL,1,'Stores - List',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(16,1,13,NULL,NULL,'',NULL,2,'Store - Detail',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(17,1,0,NULL,NULL,'',NULL,3,'Product',NULL,'_self',1,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(18,1,17,NULL,NULL,'',NULL,0,'Product Right Sidebar',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(19,1,17,NULL,NULL,'',NULL,1,'Product Left Sidebar',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(20,1,17,NULL,NULL,'',NULL,2,'Product Full Width',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(21,1,0,5,'Botble\\Page\\Models\\Page',NULL,NULL,4,'Blog',NULL,'_self',1,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(22,1,21,5,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Blog Grid',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(23,1,21,13,'Botble\\Page\\Models\\Page',NULL,NULL,1,'Blog List',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(24,1,21,14,'Botble\\Page\\Models\\Page',NULL,NULL,2,'Blog Big',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(25,1,21,15,'Botble\\Page\\Models\\Page',NULL,NULL,3,'Blog Wide',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(26,1,21,NULL,NULL,'',NULL,4,'Single Post',NULL,'_self',1,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(27,1,26,NULL,NULL,'',NULL,0,'Single Post Right Sidebar',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(28,1,26,NULL,NULL,'',NULL,1,'Single Post Left Sidebar',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(29,1,26,NULL,NULL,'',NULL,2,'Single Post Full Width',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(30,1,26,NULL,NULL,'',NULL,3,'Single Post with Product Listing',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(31,1,0,18,'Botble\\Page\\Models\\Page',NULL,NULL,5,'FAQ',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(32,1,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,6,'Contact',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(33,2,0,7,'Botble\\Page\\Models\\Page',NULL,NULL,0,'About Us',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(34,2,0,NULL,NULL,'/orders/tracking',NULL,1,'Order Tracking',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(35,3,0,1,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,0,'Milks and Dairies',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(36,3,0,2,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,1,'Clothing & beauty',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(37,3,0,3,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,2,'Pet Toy',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(38,3,0,4,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,3,'Baking material',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(39,3,0,5,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,4,'Fresh Fruit',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(40,3,0,6,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,5,'Wines & Drinks',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(41,4,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Contact Us',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(42,4,0,7,'Botble\\Page\\Models\\Page',NULL,NULL,1,'About Us',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(43,4,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,2,'Cookie Policy',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(44,4,0,9,'Botble\\Page\\Models\\Page',NULL,NULL,3,'Terms & Conditions',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(45,4,0,10,'Botble\\Page\\Models\\Page',NULL,NULL,4,'Returns & Exchanges',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(46,4,0,11,'Botble\\Page\\Models\\Page',NULL,NULL,5,'Shipping & Delivery',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(47,4,0,12,'Botble\\Page\\Models\\Page',NULL,NULL,6,'Privacy Policy',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(48,5,0,7,'Botble\\Page\\Models\\Page',NULL,NULL,0,'About us',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(49,5,0,NULL,NULL,'#',NULL,1,'Affiliate',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(50,5,0,NULL,NULL,'#',NULL,2,'Career',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28'),(51,5,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,3,'Contact us',NULL,'_self',0,'2025-06-29 06:23:28','2025-06-29 06:23:28');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-06-29 06:23:28','2025-06-29 06:23:28'),(2,'Header menu','header-menu','published','2025-06-29 06:23:28','2025-06-29 06:23:28'),(3,'Product categories','product-categories','published','2025-06-29 06:23:28','2025-06-29 06:23:28'),(4,'Information','information','published','2025-06-29 06:23:28','2025-06-29 06:23:28'),(5,'Company','company','published','2025-06-29 06:23:28','2025-06-29 06:23:28');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'background_color','[\"#F2FCE4\"]',1,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(2,'background_color','[\"#FFFCEB\"]',2,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(3,'background_color','[\"#ECFFEC\"]',3,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(4,'background_color','[\"#FEEFEA\"]',4,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(5,'background_color','[\"#FFF3EB\"]',5,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(6,'background_color','[\"#FFF3FF\"]',6,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(7,'background_color','[\"#F2FCE4\"]',7,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(8,'background_color','[\"#FFFCEB\"]',8,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(9,'background_color','[\"#ECFFEC\"]',9,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(10,'background_color','[\"#FEEFEA\"]',10,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(11,'background_color','[\"#FFF3EB\"]',11,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(12,'background_color','[\"#FFF3FF\"]',12,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(13,'background_color','[\"#F2FCE4\"]',13,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(14,'background_color','[\"#FFFCEB\"]',14,'Botble\\Ecommerce\\Models\\ProductCategory','2025-06-29 06:22:50','2025-06-29 06:22:50'),(15,'layout','[\"product-right-sidebar\"]',1,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(16,'is_popular','[\"1\"]',1,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(17,'faq_ids','[[2,4,5,6,10]]',1,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(18,'layout','[\"product-left-sidebar\"]',2,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(19,'faq_ids','[[1,2,6,7,9]]',2,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(20,'layout','[\"product-full-width\"]',3,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(21,'is_popular','[\"1\"]',3,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(22,'faq_ids','[[4,5,6,8,10]]',3,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(23,'faq_ids','[[1,3,7,8,10]]',4,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(24,'is_popular','[\"1\"]',5,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(25,'faq_ids','[[1,5,6,7,9]]',5,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(26,'faq_ids','[[1,2,3,8,10]]',6,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(27,'is_popular','[\"1\"]',7,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(28,'faq_ids','[[1,2,5,9,10]]',7,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(29,'faq_ids','[[3,4,6,8,9]]',8,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(30,'is_popular','[\"1\"]',9,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(31,'faq_ids','[[3,4,5,8,10]]',9,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(32,'faq_ids','[[2,5,7,8,9]]',10,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(33,'is_popular','[\"1\"]',11,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(34,'faq_ids','[[1,2,4,5,6]]',11,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(35,'faq_ids','[[2,4,6,9,10]]',12,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(36,'is_popular','[\"1\"]',13,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(37,'faq_ids','[[4,5,8,9,10]]',13,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(38,'faq_ids','[[3,5,7,8,9]]',14,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(39,'is_popular','[\"1\"]',15,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(40,'faq_ids','[[4,5,6,7,9]]',15,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(41,'faq_ids','[[1,4,5,8,9]]',16,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(42,'is_popular','[\"1\"]',17,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(43,'faq_ids','[[1,4,6,7,9]]',17,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(44,'faq_ids','[[2,3,4,6,9]]',18,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(45,'is_popular','[\"1\"]',19,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(46,'faq_ids','[[2,3,4,6,10]]',19,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(47,'faq_ids','[[1,3,4,6,7]]',20,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(48,'is_popular','[\"1\"]',21,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(49,'faq_ids','[[4,5,6,8,9]]',21,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(50,'faq_ids','[[6,7,8,9,10]]',22,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:22:59','2025-06-29 06:22:59'),(51,'is_popular','[\"1\"]',23,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:23:00','2025-06-29 06:23:00'),(52,'faq_ids','[[2,3,4,6,8]]',23,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:23:00','2025-06-29 06:23:00'),(53,'faq_ids','[[2,3,7,8,9]]',24,'Botble\\Ecommerce\\Models\\Product','2025-06-29 06:23:00','2025-06-29 06:23:00'),(54,'image','[\"flash-sales\\/1.png\"]',1,'Botble\\Ecommerce\\Models\\FlashSale','2025-06-29 06:23:08','2025-06-29 06:23:08'),(55,'image','[\"flash-sales\\/2.png\"]',2,'Botble\\Ecommerce\\Models\\FlashSale','2025-06-29 06:23:08','2025-06-29 06:23:08'),(56,'image','[\"flash-sales\\/3.png\"]',3,'Botble\\Ecommerce\\Models\\FlashSale','2025-06-29 06:23:08','2025-06-29 06:23:08'),(57,'image','[\"flash-sales\\/4.png\"]',4,'Botble\\Ecommerce\\Models\\FlashSale','2025-06-29 06:23:08','2025-06-29 06:23:08'),(58,'image','[\"flash-sales\\/5.png\"]',5,'Botble\\Ecommerce\\Models\\FlashSale','2025-06-29 06:23:08','2025-06-29 06:23:08'),(59,'simple_slider_style','[\"style-4\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSlider','2025-06-29 06:23:13','2025-06-29 06:23:13'),(60,'simple_slider_style','[\"style-2\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSlider','2025-06-29 06:23:13','2025-06-29 06:23:13'),(61,'simple_slider_style','[\"style-3\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSlider','2025-06-29 06:23:13','2025-06-29 06:23:13'),(62,'simple_slider_style','[\"style-1\"]',4,'Botble\\SimpleSlider\\Models\\SimpleSlider','2025-06-29 06:23:13','2025-06-29 06:23:13'),(63,'simple_slider_style','[\"style-5\"]',5,'Botble\\SimpleSlider\\Models\\SimpleSlider','2025-06-29 06:23:13','2025-06-29 06:23:13'),(64,'simple_slider_style','[\"style-6\"]',6,'Botble\\SimpleSlider\\Models\\SimpleSlider','2025-06-29 06:23:13','2025-06-29 06:23:13'),(65,'simple_slider_style','[\"style-1\"]',7,'Botble\\SimpleSlider\\Models\\SimpleSlider','2025-06-29 06:23:13','2025-06-29 06:23:13'),(66,'header_style','[\"header-style-5\"]',16,'Botble\\Page\\Models\\Page','2025-06-29 06:23:15','2025-06-29 06:23:15'),(67,'header_style','[\"header-style-5\"]',17,'Botble\\Page\\Models\\Page','2025-06-29 06:23:15','2025-06-29 06:23:15'),(68,'button_text','[\"Shop now\"]',1,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:22','2025-06-29 06:23:22'),(69,'subtitle','[\"Everyday Fresh & \\nClean with Our \\nProducts\"]',1,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:22','2025-06-29 06:23:22'),(70,'button_text','[\"Shop now\"]',2,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:22','2025-06-29 06:23:22'),(71,'subtitle','[\"Make your Breakfast Healthy and Easy\"]',2,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:22','2025-06-29 06:23:22'),(72,'button_text','[\"Shop now\"]',3,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:22','2025-06-29 06:23:22'),(73,'subtitle','[\"The best Organic Products Online\"]',3,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(74,'button_text','[\"Shop now\"]',4,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(75,'subtitle','[\"Bring nature into your home\"]',4,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(76,'button_text','[\"Shop now\"]',5,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(77,'subtitle','[\"Delivered to your home\"]',5,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(78,'button_text','[\"Shop now\"]',6,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(79,'subtitle','[\"Save 17% <br \\/>on Oganic <br \\/>Juice\"]',6,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(80,'button_text','[\"Shop now\"]',7,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(81,'subtitle','[\"Everyday Fresh & Clean with Our Products\"]',7,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(82,'button_text','[\"Shop now\"]',8,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(83,'subtitle','[\"The best Organic Products Online\"]',8,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(84,'button_text','[\"Go to supplier\"]',9,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(85,'subtitle','[\"Everyday Fresh with\\n Our Products\"]',9,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(86,'button_text','[\"Go to supplier\"]',10,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(87,'subtitle','[\"100% guaranteed all\\n Fresh items\"]',10,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(88,'button_text','[\"Go to supplier\"]',11,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(89,'subtitle','[\"Special grocery sale\\n off this month\"]',11,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(90,'button_text','[\"Go to supplier\"]',12,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(91,'subtitle','[\"Enjoy 15% OFF for all\\n vegetable and fruit\"]',12,'Botble\\Ads\\Models\\Ads','2025-06-29 06:23:23','2025-06-29 06:23:23'),(92,'social_links','[{\"facebook\":\"botble\",\"twitter\":\"botble\"}]',1,'Botble\\Marketplace\\Models\\Store','2025-06-29 06:23:27','2025-06-29 06:23:27'),(93,'social_links','[{\"facebook\":\"botble\",\"twitter\":\"botble\"}]',2,'Botble\\Marketplace\\Models\\Store','2025-06-29 06:23:27','2025-06-29 06:23:27'),(94,'social_links','[{\"facebook\":\"botble\",\"twitter\":\"botble\"}]',3,'Botble\\Marketplace\\Models\\Store','2025-06-29 06:23:27','2025-06-29 06:23:27'),(95,'social_links','[{\"facebook\":\"botble\",\"twitter\":\"botble\"}]',4,'Botble\\Marketplace\\Models\\Store','2025-06-29 06:23:27','2025-06-29 06:23:27'),(96,'social_links','[{\"facebook\":\"botble\",\"twitter\":\"botble\"}]',5,'Botble\\Marketplace\\Models\\Store','2025-06-29 06:23:27','2025-06-29 06:23:27'),(97,'social_links','[{\"facebook\":\"botble\",\"twitter\":\"botble\"}]',6,'Botble\\Marketplace\\Models\\Store','2025-06-29 06:23:27','2025-06-29 06:23:27'),(98,'social_links','[{\"facebook\":\"botble\",\"twitter\":\"botble\"}]',7,'Botble\\Marketplace\\Models\\Store','2025-06-29 06:23:27','2025-06-29 06:23:27');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_01_07_072057_update_theme_option_for_login_page',1),(34,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(35,'2024_04_25_021317_remove_wrong_widget',1),(36,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(37,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(38,'2024_07_12_100000_change_random_hash_for_media',1),(39,'2024_09_30_024515_create_sessions_table',1),(40,'2024_12_19_000001_create_device_tokens_table',1),(41,'2024_12_19_000002_create_push_notifications_table',1),(42,'2024_12_19_000003_create_push_notification_recipients_table',1),(43,'2020_11_18_150916_ads_create_ads_table',2),(44,'2021_12_02_035301_add_ads_translations_table',2),(45,'2023_04_17_062645_add_open_in_new_tab',2),(46,'2023_11_07_023805_add_tablet_mobile_image',2),(47,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',2),(48,'2025_04_21_000000_add_tablet_mobile_image_to_ads_translations_table',2),(49,'2024_04_27_100730_improve_analytics_setting',3),(50,'2015_06_29_025744_create_audit_history',4),(51,'2023_11_14_033417_change_request_column_in_table_audit_histories',4),(52,'2025_05_05_000001_add_user_type_to_audit_histories_table',4),(53,'2015_06_18_033822_create_blog_table',5),(54,'2021_02_16_092633_remove_default_value_for_author_type',5),(55,'2021_12_03_030600_create_blog_translations',5),(56,'2022_04_19_113923_add_index_to_table_posts',5),(57,'2023_08_29_074620_make_column_author_id_nullable',5),(58,'2024_07_30_091615_fix_order_column_in_categories_table',5),(59,'2025_01_06_033807_add_default_value_for_categories_author_type',5),(60,'2016_06_17_091537_create_contacts_table',6),(61,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',6),(62,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',6),(63,'2024_03_25_000001_update_captcha_settings_for_contact',6),(64,'2024_04_19_063914_create_custom_fields_table',6),(65,'2020_03_05_041139_create_ecommerce_tables',7),(66,'2021_01_01_044147_ecommerce_create_flash_sale_table',7),(67,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',7),(68,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',7),(69,'2021_02_18_073505_update_table_ec_reviews',7),(70,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',7),(71,'2021_03_10_025153_change_column_tax_amount',7),(72,'2021_03_20_033103_add_column_availability_to_table_ec_products',7),(73,'2021_04_28_074008_ecommerce_create_product_label_table',7),(74,'2021_05_31_173037_ecommerce_create_ec_products_translations',7),(75,'2021_08_17_105016_remove_column_currency_id_in_some_tables',7),(76,'2021_08_30_142128_add_images_column_to_ec_reviews_table',7),(77,'2021_10_04_030050_add_column_created_by_to_table_ec_products',7),(78,'2021_10_05_122616_add_status_column_to_ec_customers_table',7),(79,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',7),(80,'2021_11_23_071403_correct_languages_for_product_variations',7),(81,'2021_11_28_031808_add_product_tags_translations',7),(82,'2021_12_01_031123_add_featured_image_to_ec_products',7),(83,'2022_01_01_033107_update_table_ec_shipments',7),(84,'2022_02_16_042457_improve_product_attribute_sets',7),(85,'2022_03_22_075758_correct_product_name',7),(86,'2022_04_19_113334_add_index_to_ec_products',7),(87,'2022_04_28_144405_remove_unused_table',7),(88,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',7),(89,'2022_05_18_143720_add_index_to_table_ec_product_categories',7),(90,'2022_06_16_095633_add_index_to_some_tables',7),(91,'2022_06_30_035148_create_order_referrals_table',7),(92,'2022_07_24_153815_add_completed_at_to_ec_orders_table',7),(93,'2022_08_14_032836_create_ec_order_returns_table',7),(94,'2022_08_14_033554_create_ec_order_return_items_table',7),(95,'2022_08_15_040324_add_billing_address',7),(96,'2022_08_30_091114_support_digital_products_table',7),(97,'2022_09_13_095744_create_options_table',7),(98,'2022_09_13_104347_create_option_value_table',7),(99,'2022_10_05_163518_alter_table_ec_order_product',7),(100,'2022_10_12_041517_create_invoices_table',7),(101,'2022_10_12_142226_update_orders_table',7),(102,'2022_10_13_024916_update_table_order_returns',7),(103,'2022_10_21_030830_update_columns_in_ec_shipments_table',7),(104,'2022_10_28_021046_update_columns_in_ec_shipments_table',7),(105,'2022_11_16_034522_update_type_column_in_ec_shipping_rules_table',7),(106,'2022_11_19_041643_add_ec_tax_product_table',7),(107,'2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table',7),(108,'2022_12_17_041532_fix_address_in_order_invoice',7),(109,'2022_12_26_070329_create_ec_product_views_table',7),(110,'2023_01_04_033051_fix_product_categories',7),(111,'2023_01_09_050400_add_ec_global_options_translations_table',7),(112,'2023_01_10_093754_add_missing_option_value_id',7),(113,'2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table',7),(114,'2023_01_26_021854_add_ec_customer_used_coupons_table',7),(115,'2023_02_08_015900_update_options_column_in_ec_order_product_table',7),(116,'2023_02_27_095752_remove_duplicate_reviews',7),(117,'2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table',7),(118,'2023_04_21_082427_create_ec_product_categorizables_table',7),(119,'2023_05_03_011331_add_missing_column_price_into_invoice_items_table',7),(120,'2023_05_17_025812_fix_invoice_issue',7),(121,'2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields',7),(122,'2023_05_27_144611_fix_exchange_rate_setting',7),(123,'2023_06_22_084331_add_generate_license_code_to_ec_products_table',7),(124,'2023_06_30_042512_create_ec_order_tax_information_table',7),(125,'2023_07_14_022724_remove_column_id_from_ec_product_collection_products',7),(126,'2023_08_09_012940_remove_column_status_in_ec_product_attributes',7),(127,'2023_08_15_064505_create_ec_tax_rules_table',7),(128,'2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable',7),(129,'2023_08_22_094114_drop_unique_for_barcode',7),(130,'2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table',7),(131,'2023_09_07_094312_add_index_to_product_sku_and_translations',7),(132,'2023_09_19_024955_create_discount_product_categories_table',7),(133,'2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table',7),(134,'2023_11_22_154643_add_unique_in_table_ec_products_variations',7),(135,'2023_11_27_032313_add_price_columns_to_ec_product_cross_sale_relations_table',7),(136,'2023_12_06_023945_add_display_on_checkout_column_to_ec_discounts_table',7),(137,'2023_12_25_040604_ec_create_review_replies_table',7),(138,'2023_12_26_090340_add_private_notes_column_to_ec_customers_table',7),(139,'2024_01_16_070706_fix_translation_tables',7),(140,'2024_01_23_075227_add_proof_file_to_ec_orders_table',7),(141,'2024_03_26_041531_add_cancel_reason_to_ec_orders_table',7),(142,'2024_03_27_062402_create_ec_customer_deletion_requests_table',7),(143,'2024_03_29_042242_migrate_old_captcha_settings',7),(144,'2024_03_29_093946_create_ec_order_return_histories_table',7),(145,'2024_04_01_063523_add_customer_columns_to_ec_reviews_table',7),(146,'2024_04_15_092654_migrate_ecommerce_google_tag_manager_code_setting',7),(147,'2024_04_16_035713_add_min_max_order_quantity_columns_to_products_table',7),(148,'2024_05_07_073153_improve_table_wishlist',7),(149,'2024_05_07_093703_add_missing_zip_code_into_table_store_locators',7),(150,'2024_05_15_021503_fix_invoice_path',7),(151,'2024_06_20_160724_create_ec_shared_wishlists_table',7),(152,'2024_06_28_025104_add_notify_attachment_updated_column_to_ec_products_table',7),(153,'2024_07_03_030900_add_downloaded_at_column_to_ec_order_product_table',7),(154,'2024_07_14_071826_make_customer_email_nullable',7),(155,'2024_07_15_104916_add_video_media_column_to_ec_products_table',7),(156,'2024_07_26_052530_add_percentage_to_tax_rules_table',7),(157,'2024_08_14_123028_add_customer_delivered_confirmed_at_column_to_ec_shipments_table',7),(158,'2024_08_19_132849_create_specification_tables',7),(159,'2024_09_07_060744_add_author_column_to_specification_tables',7),(160,'2024_09_14_064023_add_can_use_with_flash_sale_column_to_ec_discounts_table',7),(161,'2024_09_25_073928_remove_wrong_product_slugs',7),(162,'2025_01_15_050230_migrate_old_theme_options',7),(163,'2025_01_17_082713_correct_column_barcode_and_cost_per_item_to_product_table',7),(164,'2025_01_24_044641_migrate_old_country_data',7),(165,'2025_01_28_233602_add_private_notes_into_ec_orders_table',7),(166,'2025_02_13_021247_add_tax_translations',7),(167,'2025_02_24_152621_add_text_color_to_product_labels_table',7),(168,'2025_04_12_000001_add_payment_fee_to_ec_orders_table',7),(169,'2025_04_12_000002_add_payment_fee_to_ec_invoices_table',7),(170,'2025_05_05_092036_make_user_id_and_tax_amount_nullable',7),(171,'2025_05_15_082342_drop_email_unique_index_in_ec_customers_table',7),(172,'2025_06_07_081731_add_translations_for_specification_groups_and_tables',7),(173,'2025_06_17_091813_increase_note_in_shipments_table',7),(174,'2025_06_24_000001_create_ec_product_license_codes_table',7),(175,'2025_06_24_080427_add_license_code_type_to_products_table',7),(176,'2018_07_09_221238_create_faq_table',8),(177,'2021_12_03_082134_create_faq_translations',8),(178,'2023_11_17_063408_add_description_column_to_faq_categories_table',8),(179,'2016_10_03_032336_create_languages_table',9),(180,'2023_09_14_022423_add_index_for_language_table',9),(181,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(182,'2021_12_03_075608_create_page_translations',10),(183,'2023_07_06_011444_create_slug_translations_table',10),(184,'2019_11_18_061011_create_country_table',11),(185,'2021_12_03_084118_create_location_translations',11),(186,'2021_12_03_094518_migrate_old_location_data',11),(187,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',11),(188,'2022_01_16_085908_improve_plugin_location',11),(189,'2022_08_04_052122_delete_location_backup_tables',11),(190,'2023_04_23_061847_increase_state_translations_abbreviation_column',11),(191,'2023_07_26_041451_add_more_columns_to_location_table',11),(192,'2023_07_27_041451_add_more_columns_to_location_translation_table',11),(193,'2023_08_15_073307_drop_unique_in_states_cities_translations',11),(194,'2023_10_21_065016_make_state_id_in_table_cities_nullable',11),(195,'2024_08_17_094600_add_image_into_countries',11),(196,'2025_01_08_093652_add_zip_code_to_cities',11),(197,'2021_07_06_030002_create_marketplace_table',12),(198,'2021_09_04_150137_add_vendor_verified_at_to_ec_customers_table',12),(199,'2021_10_04_033903_add_column_approved_by_into_table_ec_products',12),(200,'2021_10_06_124943_add_transaction_id_column_to_mp_customer_withdrawals_table',12),(201,'2021_10_10_054216_add_columns_to_mp_customer_revenues_table',12),(202,'2021_12_06_031304_update_table_mp_customer_revenues',12),(203,'2022_10_19_152916_add_columns_to_mp_stores_table',12),(204,'2022_10_20_062849_create_mp_category_sale_commissions_table',12),(205,'2022_11_02_071413_add_more_info_for_store',12),(206,'2022_11_02_080444_add_tax_info',12),(207,'2023_02_01_062030_add_store_translations',12),(208,'2023_02_13_032133_update_fee_column_mp_customer_revenues_table',12),(209,'2023_02_17_023648_fix_store_prefix',12),(210,'2024_04_03_062451_add_cover_image_to_table_mp_stores',12),(211,'2024_05_07_082630_create_mp_messages_table',12),(212,'2024_07_19_131849_add_documents_to_mp_stores_table',12),(213,'2024_08_18_083119_add_tax_id_column_to_mp_stores_table',12),(214,'2024_08_27_141244_add_block_reason_to_ec_customers_table',12),(215,'2024_09_17_125408_add_square_logo_to_stores_table',12),(216,'2017_10_24_154832_create_newsletter_table',13),(217,'2024_03_25_000001_update_captcha_settings_for_newsletter',13),(218,'2017_05_18_080441_create_payment_tables',14),(219,'2021_03_27_144913_add_customer_type_into_table_payments',14),(220,'2021_05_24_034720_make_column_currency_nullable',14),(221,'2021_08_09_161302_add_metadata_column_to_payments_table',14),(222,'2021_10_19_020859_update_metadata_field',14),(223,'2022_06_28_151901_activate_paypal_stripe_plugin',14),(224,'2022_07_07_153354_update_charge_id_in_table_payments',14),(225,'2024_07_04_083133_create_payment_logs_table',14),(226,'2025_04_12_000003_add_payment_fee_to_payments_table',14),(227,'2025_05_22_000001_add_payment_fee_type_to_settings_table',14),(228,'2017_07_11_140018_create_simple_slider_table',15),(229,'2025_04_08_040931_create_social_logins_table',16),(230,'2024_09_14_100108_add_stripe_connect_details_to_ec_customers_table',17),(231,'2016_10_07_193005_create_translations_table',18),(232,'2023_12_12_105220_drop_translations_table',18);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_category_sale_commissions`
--

DROP TABLE IF EXISTS `mp_category_sale_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_category_sale_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint unsigned NOT NULL,
  `commission_percentage` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp_category_sale_commissions_product_category_id_unique` (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_category_sale_commissions`
--

LOCK TABLES `mp_category_sale_commissions` WRITE;
/*!40000 ALTER TABLE `mp_category_sale_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_category_sale_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_revenues`
--

DROP TABLE IF EXISTS `mp_customer_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_revenues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `sub_amount` decimal(15,2) unsigned DEFAULT '0.00',
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_revenues`
--

LOCK TABLES `mp_customer_revenues` WRITE;
/*!40000 ALTER TABLE `mp_customer_revenues` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_withdrawals`
--

DROP TABLE IF EXISTS `mp_customer_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_withdrawals`
--

LOCK TABLES `mp_customer_withdrawals` WRITE;
/*!40000 ALTER TABLE `mp_customer_withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_messages`
--

DROP TABLE IF EXISTS `mp_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_messages`
--

LOCK TABLES `mp_messages` WRITE;
/*!40000 ALTER TABLE `mp_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores`
--

DROP TABLE IF EXISTS `mp_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_square` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `vendor_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `government_id_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores`
--

LOCK TABLES `mp_stores` WRITE;
/*!40000 ALTER TABLE `mp_stores` DISABLE KEYS */;
INSERT INTO `mp_stores` VALUES (1,'GoPro','rowe.haskell@example.net','+12699002946','83810 Claude Keys','GN','Kentucky','New Ova',2,'stores/1.png',NULL,NULL,'Aut possimus dolore libero est non.','Assumenda labore ipsa voluptatem non. Ut et non incidunt non magni molestiae molestias.','published',NULL,'2025-06-29 06:23:27','2025-06-29 06:23:27',NULL,NULL,NULL,NULL,NULL),(2,'Global Office','treva.okeefe@example.com','+16512047885','458 Myah Spring','TN','Tennessee','Hudsontown',3,'stores/2.png',NULL,NULL,'Illum soluta voluptate omnis tenetur est vel.','Libero quibusdam tenetur illo cumque itaque. Veritatis voluptas voluptas asperiores et omnis quam quam. Quia quis tempore ut sit non mollitia.','published',NULL,'2025-06-29 06:23:27','2025-06-29 06:23:27',NULL,NULL,NULL,NULL,NULL),(3,'Young Shop','lora.berge@example.com','+13805462547','926 Wilderman Way','EE','District of Columbia','Wildermanfurt',4,'stores/3.png',NULL,NULL,'Provident ea quia ipsum maiores in ut similique.','Assumenda praesentium eaque perspiciatis mollitia ab. Dignissimos rerum tenetur consequatur. Nobis labore quibusdam commodi sit dolor dolor.','published',NULL,'2025-06-29 06:23:27','2025-06-29 06:23:27',NULL,NULL,NULL,NULL,NULL),(4,'Global Store','isaac.trantow@example.net','+14583412402','98125 Pouros Ramp','TO','Iowa','East Cecil',5,'stores/4.png',NULL,NULL,'Totam numquam placeat adipisci.','Labore et ipsam repudiandae. Qui quia sunt a similique ipsum. Nihil eum recusandae iure. Ea error quaerat eaque quam eligendi et et.','published',NULL,'2025-06-29 06:23:27','2025-06-29 06:23:27',NULL,NULL,NULL,NULL,NULL),(5,'Robert’s Store','randy95@example.com','+15347624574','41114 Skye Drive Apt. 370','AG','Louisiana','Jalynfort',6,'stores/5.png',NULL,NULL,'Aspernatur earum voluptatum sed.','Ea exercitationem ut reiciendis qui. Saepe et aperiam aliquam et perferendis necessitatibus. Sed ea nemo sunt et.','published',NULL,'2025-06-29 06:23:27','2025-06-29 06:23:27',NULL,NULL,NULL,NULL,NULL),(6,'Stouffer','malvina.schiller@example.net','+12026398943','98700 Rigoberto Stream','BA','Tennessee','Pricemouth',8,'stores/6.png',NULL,NULL,'Consequuntur tempora commodi aut aut beatae et.','Laudantium enim qui cumque dolor sed odit. Autem libero consequatur sunt voluptates dolores. Consectetur sunt impedit unde sed autem.','published',NULL,'2025-06-29 06:23:27','2025-06-29 06:23:27',NULL,NULL,NULL,NULL,NULL),(7,'StarKist','reese67@example.net','+12675038802','32768 Fisher Island Apt. 412','BJ','Idaho','North Presley',10,'stores/7.png',NULL,NULL,'Saepe et quos commodi qui eveniet.','Esse neque nulla porro non aspernatur. Mollitia unde voluptatem qui id vitae delectus. Optio sed architecto excepturi quia.','published',NULL,'2025-06-29 06:23:27','2025-06-29 06:23:27',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores_translations`
--

DROP TABLE IF EXISTS `mp_stores_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_stores_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`mp_stores_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores_translations`
--

LOCK TABLES `mp_stores_translations` WRITE;
/*!40000 ALTER TABLE `mp_stores_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_stores_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_vendor_info`
--

DROP TABLE IF EXISTS `mp_vendor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_vendor_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL DEFAULT '0',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_revenue` decimal(15,2) NOT NULL DEFAULT '0.00',
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payout_payment_method` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT 'bank_transfer',
  `tax_info` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_vendor_info`
--

LOCK TABLES `mp_vendor_info` WRITE;
/*!40000 ALTER TABLE `mp_vendor_info` DISABLE KEYS */;
INSERT INTO `mp_vendor_info` VALUES (1,2,0.00,0.00,0.00,'$2y$12$CD/G0WSVxp7ssHMgecpN..Cku4Vgh76JgEpruDxKDn5SlzbW.XJ/C','{\"name\":\"Ms. Frances Trantow\",\"number\":\"+19253307032\",\"full_name\":\"Shanon Hansen\",\"description\":\"Alivia Walsh\"}','2025-06-29 06:23:25','2025-06-29 06:23:25','bank_transfer',NULL),(2,3,0.00,0.00,0.00,'$2y$12$3ebMg5N5dbL0z8S5tZ43zu2O5U6VQXD.M5wetsV9sowPz6VHPk0P.','{\"name\":\"Lewis Paucek\",\"number\":\"+19134281518\",\"full_name\":\"Brayan Gusikowski\",\"description\":\"Emil Herman\"}','2025-06-29 06:23:26','2025-06-29 06:23:26','bank_transfer',NULL),(3,4,0.00,0.00,0.00,'$2y$12$1Vg8X1db11EpSLVZgjc4juLHdan8RcEB3dp6fWqBthsiibBarcqoy','{\"name\":\"Kaela Rodriguez II\",\"number\":\"+14843846051\",\"full_name\":\"Miss Mittie Abernathy MD\",\"description\":\"Rosina Blick\"}','2025-06-29 06:23:26','2025-06-29 06:23:26','bank_transfer',NULL),(4,5,0.00,0.00,0.00,'$2y$12$NboAJASuJ/bp8BfadKgUIusxPa.Cjw6sGSvNHneDWQYXDOC/WvdTy','{\"name\":\"Adele Hyatt\",\"number\":\"+15869121113\",\"full_name\":\"Christopher Runolfsson\",\"description\":\"Milton Hirthe\"}','2025-06-29 06:23:26','2025-06-29 06:23:26','bank_transfer',NULL),(5,6,0.00,0.00,0.00,'$2y$12$n9PXkfH/vRZJsoh2eMH73O0S1fib37ryGIr8T2hBKrjz6cx2fHkVS','{\"name\":\"Dayana Barrows\",\"number\":\"+13153351590\",\"full_name\":\"Dr. Jacey Gutkowski III\",\"description\":\"Layla McKenzie\"}','2025-06-29 06:23:27','2025-06-29 06:23:27','bank_transfer',NULL),(6,8,0.00,0.00,0.00,'$2y$12$hw.lGtjcjsNxCxpp2RsFYO00hdh5arODVFhwVQtjLBiN5qXi7mzUO','{\"name\":\"Tyrese Okuneva\",\"number\":\"+18318441339\",\"full_name\":\"Dario Swaniawski\",\"description\":\"Barry Collier Sr.\"}','2025-06-29 06:23:27','2025-06-29 06:23:27','bank_transfer',NULL),(7,10,0.00,0.00,0.00,'$2y$12$5g6QBgl0zTF8op66Am4RmuyR32sW3gu7B.Aapgl8MUJ6vBL1nDpcG','{\"name\":\"Virgie Little II\",\"number\":\"+13805363803\",\"full_name\":\"Jovanny Dooley\",\"description\":\"Mable Bayer\"}','2025-06-29 06:23:27','2025-06-29 06:23:27','bank_transfer',NULL);
/*!40000 ALTER TABLE `mp_vendor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[simple-slider key=\"home-slider-1\" show_newsletter_form=\"yes\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\"][/featured-product-categories]</div><div>[theme-ads ads_1=\"IZ6WU8KUALYD\" ads_2=\"ILSFJVYFGCPZ\" ads_3=\"ILSDKVYFGXPH\"][/theme-ads]</div><div>[popular-products title=\"Popular Products\" per_row=\"5\" limit=\"10\" enable_lazy_loading=\"yes\"][/popular-products]</div><div>[best-flash-sale title=\"Daily Best Sells\" flash_sale_id=\"5\" ads=\"IZ6WU8KUALYG\"][/best-flash-sale]</div><div>[flash-sale flash_sale_1=\"1\" flash_sale_2=\"2\" flash_sale_3=\"3\" flash_sale_4=\"4\" title=\"Deals Of The Day\" flash_sale_popup_id=\"1\"][/flash-sale]</div><div>[top-products-group tabs=\"top-selling,trending-products,recent-added,top-rated\" top_selling_in_days=\"365\" enable_lazy_loading=\"yes\"][/top-products-group]</div>',1,NULL,'homepage',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(2,'Homepage 2','<div>[simple-slider key=\"home-slider-2\" ads_1=\"IZ6WU8KUALYH\" show_newsletter_form=\"yes\" cover_image=\"sliders/banner-1.png\"][/simple-slider]</div><div>[theme-ads ads_1=\"IZ6WU8KUALYD\" ads_2=\"ILSFJVYFGCPZ\" ads_3=\"ILSDKVYFGXPH\"][/theme-ads]</div><div>[popular-products title=\"Popular Products\" per_row=\"5\" limit=\"10\" enable_lazy_loading=\"yes\"][/popular-products]</div><div>[best-flash-sale title=\"Daily Best Sells\" flash_sale_id=\"5\" ads=\"IZ6WU8KUALYG\"][/best-flash-sale]</div><div>[flash-sale flash_sale_1=\"1\" flash_sale_2=\"2\" flash_sale_3=\"3\" flash_sale_4=\"4\" title=\"Deals Of The Day\" flash_sale_popup_id=\"1\"][/flash-sale]</div><div>[top-products-group tabs=\"top-selling,trending-products,recent-added,top-rated\" top_selling_in_days=\"365\" enable_lazy_loading=\"yes\"][/top-products-group]</div><div>[product-categories title=\"Shop by Categories\"][/product-categories]</div>',1,NULL,'homepage',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(3,'Homepage 3','<div>[simple-slider key=\"home-slider-1\" show_newsletter_form=\"yes\"][/simple-slider]</div><div>[popular-products title=\"Popular Products\" per_row=\"5\" limit=\"10\" enable_lazy_loading=\"yes\"][/popular-products]</div><div>[flash-sale flash_sale_1=\"1\" flash_sale_2=\"2\" flash_sale_3=\"3\" flash_sale_4=\"4\" title=\"Deals Of The Day\" flash_sale_popup_id=\"1\"][/flash-sale]</div><div>[theme-ads ads_1=\"IZ6WU8KUALYD\" ads_2=\"ILSFJVYFGCPZ\" ads_3=\"ILSDKVYFGXPH\"][/theme-ads]</div><div>[product-categories title=\"Shop by Categories\"][/product-categories]</div><div>[top-products-group tabs=\"top-selling,trending-products,recent-added,top-rated\" top_selling_in_days=\"365\" enable_lazy_loading=\"yes\"][/top-products-group]</div>',1,NULL,'homepage',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(4,'Homepage 4','<div>[simple-slider key=\"home-slider-4\" show_newsletter_form=\"yes\"][/simple-slider]</div><div>[popular-products title=\"Popular Products\" per_row=\"5\" limit=\"10\" enable_lazy_loading=\"yes\"][/popular-products]</div><div>[flash-sale flash_sale_1=\"1\" flash_sale_2=\"2\" flash_sale_3=\"3\" flash_sale_4=\"4\" title=\"Deals Of The Day\" flash_sale_popup_id=\"1\"][/flash-sale]</div><div>[theme-ads ads_1=\"IZ6WU8KUALYD\" ads_2=\"ILSFJVYFGCPZ\" ads_3=\"ILSDKVYFGXPH\"][/theme-ads]</div><div>[product-categories title=\"Shop by Categories\"][/product-categories]</div><div>[top-products-group tabs=\"top-selling,trending-products,recent-added,top-rated\" top_selling_in_days=\"365\" enable_lazy_loading=\"yes\"][/top-products-group]</div>',1,NULL,'homepage',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(5,'Blog','<p>---</p>',1,NULL,'blog-grid',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(6,'Contact','<p>[google-map]502 New Street, Brighton VIC, Australia[/google-map]</p><p>[our-offices][/our-offices]</p><p>[contact-form][/contact-form]</p>',1,NULL,'default',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(7,'About us','<p>The Mouse only growled in reply. \'That\'s right!\' shouted the Queen, \'Really, my dear, I think?\' \'I had NOT!\' cried the Gryphon, \'you first form into a large crowd collected round it: there were three gardeners instantly jumped up, and there was a different person then.\' \'Explain all that,\' he said in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to remark. \'Tut, tut, child!\' said the Queen, who had been would have this cat removed!\' The Queen smiled and passed on. \'Who ARE you talking to?\'.</p><p>Alice could not remember ever having seen such a nice little dog near our house I should think you\'ll feel it a bit, if you drink much from a Caterpillar The Caterpillar and Alice was a real nose; also its eyes were nearly out of its mouth, and addressed her in an undertone, \'important--unimportant--unimportant--important--\' as if she had gone through that day. \'No, no!\' said the Cat. \'I don\'t know what it was done. They had not noticed before, and behind them a new pair of gloves and the cool.</p><p>Dormouse denied nothing, being fast asleep. \'After that,\' continued the King. \'It began with the name \'W. RABBIT\' engraved upon it. She stretched herself up and straightening itself out again, so she went on again:-- \'You may not have lived much under the hedge. In another minute there was generally a ridge or furrow in the after-time, be herself a grown woman; and how she would catch a bad cold if she had known them all her riper years, the simple and loving heart of her or of anything to put.</p><p>Alice. \'But you\'re so easily offended!\' \'You\'ll get used to say \'I once tasted--\' but checked herself hastily. \'I don\'t see,\' said the King, the Queen, in a solemn tone, \'For the Duchess. \'I make you dry enough!\' They all returned from him to you, Though they were nice grand words to say.) Presently she began thinking over all the time she went on again:-- \'You may go,\' said the White Rabbit, \'but it doesn\'t matter much,\' thought Alice, as she went on at last, and managed to swallow a morsel.</p>',1,NULL,'right-sidebar',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(8,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(9,'Terms &amp; Conditions','<p>It was so long that they had any dispute with the words did not feel encouraged to ask any more HERE.\' \'But then,\' thought she, \'what would become of me? They\'re dreadfully fond of beheading people here; the great concert given by the pope, was soon submitted to by the way to fly up into the darkness as hard as he shook his grey locks, \'I kept all my life, never!\' They had not got into it), and handed back to the Queen, the royal children; there were a Duck and a scroll of parchment in the.</p><p>First, she tried the effect of lying down with wonder at the March Hare went on. Her listeners were perfectly quiet till she had put on her lap as if he thought it would,\' said the Queen. \'I haven\'t the least idea what Latitude or Longitude either, but thought they were playing the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice began to repeat it, but her voice close to them, they were nowhere to be a great thistle, to keep back the wandering hair that curled all over crumbs.\'.</p><p>IS it to the end of half those long words, and, what\'s more, I don\'t want to see the Mock Turtle replied; \'and then the other, saying, in a twinkling! Half-past one, time for dinner!\' (\'I only wish it was,\' the March Hare will be the right way of speaking to it,\' she said to herself; \'the March Hare meekly replied. \'Yes, but some crumbs must have got altered.\' \'It is a very deep well. Either the well was very nearly getting up and throw us, with the bread-and-butter getting so used to know.</p><p>THE KING AND QUEEN OF HEARTS. Alice was so much contradicted in her hands, and was coming back to her: first, because the chimneys were shaped like the tone of the way down one side and then quietly marched off after the others. \'We must burn the house of the other side of the sort. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Caterpillar. Alice said very politely, \'if I had.</p>',1,NULL,'default',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(10,'Returns &amp; Exchanges','<p>MINE,\' said the Mock Turtle said: \'no wise fish would go anywhere without a cat! It\'s the most confusing thing I ever was at the moment, \'My dear! I shall see it pop down a very small cake, on which the March Hare, \'that \"I breathe when I got up very sulkily and crossed over to the other, trying every door, she ran off at once crowded round her at the house, and found quite a crowd of little Alice herself, and once again the tiny hands were clasped upon her face. \'Wake up, Alice dear!\' said.</p><p>Pigeon. \'I can see you\'re trying to invent something!\' \'I--I\'m a little girl or a serpent?\' \'It matters a good deal worse off than before, as the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice for some time in silence: at last she spread out her hand on the shingle--will you come to the jury. \'Not yet, not yet!\' the Rabbit say, \'A barrowful of WHAT?\' thought Alice; \'only, as it\'s asleep, I suppose it were white, but there was no \'One, two, three, and away,\'.</p><p>Alice remained looking thoughtfully at the other was sitting between them, fast asleep, and the Queen had only one way of expressing yourself.\' The baby grunted again, and did not wish to offend the Dormouse began in a trembling voice, \'--and I hadn\'t mentioned Dinah!\' she said this, she came suddenly upon an open place, with a lobster as a partner!\' cried the Gryphon, with a round face, and was just possible it had gone. \'Well! I\'ve often seen them at last, and they walked off together. Alice.</p><p>Alice heard it say to itself in a voice she had to leave it behind?\' She said the Hatter, \'or you\'ll be telling me next that you couldn\'t cut off a bit hurt, and she trembled till she had found her way through the doorway; \'and even if my head would go through,\' thought poor Alice, who always took a minute or two, it was good practice to say which), and they sat down, and was going to happen next. The first thing she heard a little more conversation with her head!\' about once in the lap of her.</p>',1,NULL,'default',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(11,'Shipping &amp; Delivery','<p>The Cat seemed to be a footman in livery, with a whiting. Now you know.\' It was, no doubt: only Alice did not wish to offend the Dormouse shook its head down, and nobody spoke for some time without hearing anything more: at last the Mouse, who seemed too much frightened to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it puzzled her a good many little girls of her own child-life, and the words have got in your knocking,\' the Footman went on to her daughter \'Ah, my dear! I shall see it again, but it.</p><p>However, she got into the darkness as hard as it can\'t possibly make me smaller, I suppose.\' So she was shrinking rapidly; so she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty?\' he asked. \'Begin at the White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' said the youth, \'one would hardly suppose That your eye was as steady as ever; Yet you turned a back-somersault in at the place of the Shark, But, when the Rabbit noticed Alice, as she went on.</p><p>Gryphon whispered in reply, \'for fear they should forget them before the trial\'s begun.\' \'They\'re putting down their names,\' the Gryphon in an undertone, \'important--unimportant--unimportant--important--\' as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the Gryphon, and, taking Alice by the English, who wanted leaders, and had come to an end! \'I wonder what they said. The executioner\'s argument was, that her neck from being run over; and the Mock Turtle.</p><p>Alice looked at it, busily painting them red. Alice thought she had to pinch it to the fifth bend, I think?\' he said in a moment to be done, I wonder?\' And here Alice began to get hold of this rope--Will the roof bear?--Mind that loose slate--Oh, it\'s coming down! Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, I fancy--Who\'s to go down--Here, Bill! the master says you\'re to go down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go down--Here, Bill! the.</p>',1,NULL,'default',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(12,'Privacy Policy','<p>Queen. \'It proves nothing of tumbling down stairs! How brave they\'ll all think me at all.\' \'In that case,\' said the Cat. \'--so long as I used--and I don\'t like them!\' When the procession moved on, three of her knowledge. \'Just think of what work it would be the best plan.\' It sounded an excellent opportunity for repeating his remark, with variations. \'I shall sit here,\' he said, \'on and off, for days and days.\' \'But what did the archbishop find?\' The Mouse looked at Alice, and looking at it.</p><p>Alice ventured to ask. \'Suppose we change the subject. \'Go on with the day of the earth. Let me think: was I the same thing a bit!\' said the White Rabbit: it was indeed: she was now, and she felt that there was mouth enough for it now, I suppose, by being drowned in my kitchen AT ALL. Soup does very well as the door and went on at last, with a T!\' said the King: \'however, it may kiss my hand if it likes.\' \'I\'d rather finish my tea,\' said the Mock Turtle, capering wildly about. \'Change lobsters.</p><p>Alice looked at the Lizard as she spoke. (The unfortunate little Bill had left off staring at the cook, to see the Hatter and the three gardeners who were all shaped like ears and whiskers, how late it\'s getting!\' She was moving them about as she spoke. \'I must be a great hurry. An enormous puppy was looking down with wonder at the Queen, tossing her head on her spectacles, and began staring at the bottom of a well?\' The Dormouse had closed its eyes again, to see if she was quite silent for a.</p><p>King, and the baby at her hands, wondering if anything would EVER happen in a helpless sort of use in saying anything more till the puppy\'s bark sounded quite faint in the pool rippling to the Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish it was,\' said the Mock Turtle yet?\' \'No,\' said the Gryphon: and it set to work nibbling at the righthand bit again, and did not appear, and after a fashion, and this he handed.</p>',1,NULL,'default',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(13,'Blog List','<p>[blog-posts paginate=\"12\"][/blog-posts]</p>',1,NULL,'blog-list',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(14,'Blog Big','<p>[blog-posts paginate=\"12\"][/blog-posts]</p>',1,NULL,'blog-big',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(15,'Blog Wide','<p>[blog-posts paginate=\"12\"][/blog-posts]</p>',1,NULL,'blog-wide',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(16,'Homepage 5','<div>[simple-slider key=\"home-slider-5\" ads_1=\"IZ6WU8KUALYJ\" ads_2=\"IZ6WU8KUALYK\" show_newsletter_form=\"yes\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\"][/featured-product-categories]</div><div>[theme-ads ads_1=\"IZ6WU8KUALYD\" ads_2=\"ILSFJVYFGCPZ\" ads_3=\"ILSDKVYFGXPH\"][/theme-ads]</div><div>[popular-products title=\"Popular Products\" per_row=\"5\" limit=\"10\" enable_lazy_loading=\"yes\"][/popular-products]</div><div>[theme-ads ads_1=\"IZ6WU8KUALYL\" ads_2=\"IZ6WU8KUALYM\" ads_3=\"IZ6WU8KUALYN\" ads_4=\"IZ6WU8KUALYO\" style=\"style-5\"][/theme-ads]</div><div>[best-flash-sale title=\"Daily Best Sells\" flash_sale_id=\"5\" ads=\"IZ6WU8KUALYG\"][/best-flash-sale]</div><div>[flash-sale flash_sale_1=\"1\" flash_sale_2=\"2\" flash_sale_3=\"3\" flash_sale_4=\"4\" title=\"Deals Of The Day\" flash_sale_popup_id=\"1\"][/flash-sale]</div><div>[top-products-group tabs=\"top-selling,trending-products,recent-added,top-rated\" top_selling_in_days=\"365\" enable_lazy_loading=\"yes\"][/top-products-group]</div>',1,NULL,'homepage',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(17,'Homepage 6','<div>[big-banner cover_image=\"general/home-6.jpeg\" show_newsletter_form=\"yes\" number_display_featured_categories=\"4\" title=\"What are you looking for?\"][/big-banner]</div><div>[trending-products title=\"Trending items\" per_row=\"5\" limit=\"20\"][/trending-products]</div><div>[flash-sale flash_sale_1=\"1\" flash_sale_2=\"2\" flash_sale_3=\"3\" flash_sale_4=\"4\" title=\"Deals Of The Day\" flash_sale_popup_id=\"1\"][/flash-sale]</div><div>[top-products-group tabs=\"top-selling,trending-products,recent-added,top-rated\" top_selling_in_days=\"365\" enable_lazy_loading=\"yes\"][/top-products-group]</div>',1,NULL,'homepage',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(18,'Faq','<div>[faqs][/faqs]</div>',1,NULL,'default',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15'),(19,'Coming Soon','[coming-soon title=\"Get Notified When We Launch\" countdown_time=\"2026-01-15\" address=\" 58 Street Commercial Road Fratton, Australia\" hotline=\"+123456789\" business_hours=\"Mon – Sat: 8 am – 5 pm, Sunday: CLOSED\" show_social_links=\"1\" image=\"general/contact-img.jpg\"][/coming-soon]',1,NULL,'without-layout',NULL,'published','2025-06-29 06:23:15','2025-06-29 06:23:15');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(4,1),(1,2),(4,2),(1,3),(3,3),(2,4),(4,4),(2,5),(4,5),(1,6),(4,6),(2,7),(3,7),(2,8),(4,8),(1,9),(3,9),(2,10),(4,10),(1,11),(3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(3,9),(4,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.png',783,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(2,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.png',2081,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.png',1886,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n[featured-products title=\"Shop The Look\" limit=\"6\"][/featured-products]\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.png',559,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.png',146,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.png',1251,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/7.png',1162,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/8.png',1982,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/9.png',2304,NULL,'2025-06-29 06:23:14','2025-06-29 06:23:14'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/10.png',931,NULL,'2025-06-29 06:23:15','2025-06-29 06:23:15'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.png\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.png\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'news/11.png',1333,NULL,'2025-06-29 06:23:15','2025-06-29 06:23:15');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"ecommerce.product-prices.index\":true,\"ecommerce.product-prices.edit\":true,\"ecommerce.product-inventory.index\":true,\"ecommerce.product-inventory.edit\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.settings\":true,\"ecommerce.settings.general\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"ecommerce.settings.product-specification\":true,\"product-categories.export\":true,\"product-categories.import\":true,\"orders.export\":true,\"ecommerce.product-specification.index\":true,\"ecommerce.specification-groups.index\":true,\"ecommerce.specification-groups.create\":true,\"ecommerce.specification-groups.edit\":true,\"ecommerce.specification-groups.destroy\":true,\"ecommerce.specification-attributes.index\":true,\"ecommerce.specification-attributes.create\":true,\"ecommerce.specification-attributes.edit\":true,\"ecommerce.specification-attributes.destroy\":true,\"ecommerce.specification-tables.index\":true,\"ecommerce.specification-tables.create\":true,\"ecommerce.specification-tables.edit\":true,\"ecommerce.specification-tables.destroy\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"marketplace.index\":true,\"marketplace.store.index\":true,\"marketplace.store.create\":true,\"marketplace.store.edit\":true,\"marketplace.store.destroy\":true,\"marketplace.store.view\":true,\"marketplace.store.revenue.create\":true,\"marketplace.withdrawal.index\":true,\"marketplace.withdrawal.edit\":true,\"marketplace.withdrawal.destroy\":true,\"marketplace.withdrawal.invoice\":true,\"marketplace.vendors.index\":true,\"marketplace.unverified-vendors.index\":true,\"marketplace.vendors.control\":true,\"marketplace.unverified-vendors.edit\":true,\"marketplace.reports\":true,\"marketplace.settings\":true,\"marketplace.messages.index\":true,\"marketplace.messages.edit\":true,\"marketplace.messages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"simple-slider.settings\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-06-29 06:23:15','2025-06-29 06:23:15');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','199ca5cb60cb9779f15972d94be99d65',NULL,'2025-06-29 06:23:23'),(2,'api_enabled','0',NULL,'2025-06-29 06:23:23'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"bottom-bar-menu\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"marketplace\",\"mollie\",\"newsletter\",\"payment\",\"paypal\",\"paypal-payout\",\"paystack\",\"razorpay\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"stripe-connect\",\"translation\"]',NULL,'2025-06-29 06:23:23'),(4,'analytics_dashboard_widgets','0','2025-06-29 06:22:42','2025-06-29 06:22:42'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-06-29 06:22:42','2025-06-29 06:22:42'),(6,'api_layer_api_key','',NULL,'2025-06-29 06:23:23'),(9,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2025-06-29 06:22:46','2025-06-29 06:22:46'),(10,'payment_cod_fee_type','fixed',NULL,'2025-06-29 06:23:23'),(11,'payment_bank_transfer_fee_type','fixed',NULL,'2025-06-29 06:23:23'),(12,'theme','nest',NULL,'2025-06-29 06:23:23'),(13,'show_admin_bar','1',NULL,'2025-06-29 06:23:23'),(14,'language_hide_default','1',NULL,'2025-06-29 06:23:23'),(15,'language_switcher_display','dropdown',NULL,'2025-06-29 06:23:23'),(16,'language_display','all',NULL,'2025-06-29 06:23:23'),(17,'language_hide_languages','[]',NULL,'2025-06-29 06:23:23'),(18,'ecommerce_store_name','Nest',NULL,NULL),(19,'ecommerce_store_phone','18006268',NULL,NULL),(20,'ecommerce_store_address','North Link Building, 10 Admiralty Street',NULL,NULL),(21,'ecommerce_store_state','Singapore',NULL,NULL),(22,'ecommerce_store_city','Singapore',NULL,NULL),(23,'ecommerce_store_country','SG',NULL,NULL),(24,'admin_favicon','general/favicon.png',NULL,'2025-06-29 06:23:23'),(25,'admin_logo','general/logo.png',NULL,'2025-06-29 06:23:23'),(26,'payment_cod_status','1',NULL,'2025-06-29 06:23:23'),(27,'payment_bank_transfer_status','1',NULL,'2025-06-29 06:23:23'),(28,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2025-06-29 06:23:23'),(29,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2025-06-29 06:23:23'),(30,'payment_stripe_payment_type','stripe_checkout',NULL,'2025-06-29 06:23:23'),(31,'plugins_ecommerce_customer_new_order_status','0',NULL,'2025-06-29 06:23:23'),(32,'plugins_ecommerce_admin_new_order_status','0',NULL,'2025-06-29 06:23:23'),(33,'ecommerce_is_enabled_support_digital_products','1',NULL,'2025-06-29 06:23:23'),(34,'ecommerce_enable_license_codes_for_digital_products','1',NULL,'2025-06-29 06:23:23'),(35,'ecommerce_auto_complete_digital_orders_after_payment','1',NULL,'2025-06-29 06:23:23'),(36,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,'2025-06-29 06:23:23'),(37,'ecommerce_product_sku_format','SF-2443-%s%s%s%s',NULL,'2025-06-29 06:23:23'),(38,'ecommerce_store_order_prefix','SF',NULL,'2025-06-29 06:23:23'),(39,'ecommerce_enable_product_specification','1',NULL,'2025-06-29 06:23:23'),(40,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,'2025-06-29 06:23:23'),(41,'payment_cod_logo','payments/cod.png',NULL,'2025-06-29 06:23:23'),(42,'payment_bank_transfer_logo','payments/bank-transfer.png',NULL,'2025-06-29 06:23:23'),(43,'payment_stripe_logo','payments/stripe.webp',NULL,'2025-06-29 06:23:23'),(44,'payment_paypal_logo','payments/paypal.png',NULL,'2025-06-29 06:23:23'),(45,'payment_mollie_logo','payments/mollie.png',NULL,'2025-06-29 06:23:23'),(46,'payment_paystack_logo','payments/paystack.png',NULL,'2025-06-29 06:23:23'),(47,'payment_razorpay_logo','payments/razorpay.png',NULL,'2025-06-29 06:23:23'),(48,'payment_sslcommerz_logo','payments/sslcommerz.png',NULL,'2025-06-29 06:23:23'),(49,'permalink-botble-blog-models-post','blog',NULL,'2025-06-29 06:23:23'),(50,'permalink-botble-blog-models-category','blog',NULL,'2025-06-29 06:23:23'),(51,'theme-nest-site_title','Nest - Laravel Multipurpose eCommerce Script',NULL,NULL),(52,'theme-nest-seo_description','Nest is an attractive Laravel multi-vendor eCommerce script specially designed for the multipurpose shops like mega store, grocery store, supermarket, organic shop, and online stores selling products like beverages, vegetables, fruits, ice creams, paste, herbs, juice, meat, cold drinks, sausages, cocktails, soft drinks, cookies…',NULL,NULL),(53,'theme-nest-copyright','Copyright © %Y Nest all rights reserved. Powered by Botble.',NULL,NULL),(54,'theme-nest-favicon','general/favicon.png',NULL,NULL),(55,'theme-nest-logo','general/logo.png',NULL,NULL),(56,'theme-nest-seo_og_image','general/open-graph-image.png',NULL,NULL),(57,'theme-nest-address','562 Wellington Road, Street 32, San Francisco',NULL,NULL),(58,'theme-nest-hotline','1900 - 888',NULL,NULL),(59,'theme-nest-hotline_subtitle_text','24/7 Support Center',NULL,NULL),(60,'theme-nest-phone','+01 2222 365 /(+91) 01 2345 6789',NULL,NULL),(61,'theme-nest-working_hours','10:00 - 18:00, Mon - Sat',NULL,NULL),(62,'theme-nest-homepage_id','1',NULL,NULL),(63,'theme-nest-blog_page_id','5',NULL,NULL),(64,'theme-nest-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(65,'theme-nest-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(66,'theme-nest-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(67,'theme-nest-payment_methods','general/payment-methods.png',NULL,NULL),(68,'theme-nest-number_of_cross_sale_product','4',NULL,NULL),(69,'theme-nest-mobile-header-message','<span>Grand opening, <strong>up to 15%</strong> off all items. Only <strong>3 days</strong> left</span>',NULL,NULL),(70,'theme-nest-blog_page_background','general/header-bg.png',NULL,NULL),(71,'theme-nest-blog_page_icon','general/category-1.png',NULL,NULL),(72,'theme-nest-login_background','general/login-1.png',NULL,NULL),(73,'theme-nest-number_of_products_per_page','12',NULL,NULL),(74,'theme-nest-preloader_enabled','yes',NULL,NULL),(75,'theme-nest-preloader_version','v2',NULL,NULL),(76,'theme-nest-preloader_image','general/loading.gif',NULL,NULL),(77,'theme-nest-sticky_header_content_position','middle',NULL,NULL),(78,'theme-nest-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"general\\/facebook.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"general\\/twitter.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"general\\/instagram.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"general\\/pinterest.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"general\\/youtube.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\"}]]',NULL,NULL),(79,'theme-nest-header_messages','[[{\"key\":\"icon\",\"value\":\"fi-rs-bell\"},{\"key\":\"message\",\"value\":\"<b class=\\\"text-success\\\"> Trendy 25<\\/b> silver jewelry, save up 35% off today\"},{\"key\":\"link\",\"value\":\"\\/products\"},{\"key\":\"link_text\",\"value\":\"Shop now\"}],[{\"key\":\"icon\",\"value\":\"fi-rs-asterisk\"},{\"key\":\"message\",\"value\":\"<b class=\\\"text-danger\\\">Super Value Deals<\\/b> - Save more with coupons\"},{\"key\":\"link\",\"value\":\"\\/products\"},{\"key\":\"link_text\",\"value\":null}],[{\"key\":\"icon\",\"value\":\"fi-rs-angle-double-right\"},{\"key\":\"message\",\"value\":\"Get great devices up to 50% off\"},{\"key\":\"link\",\"value\":\"\\/products\"},{\"key\":\"link_text\",\"value\":\"View details\"}]]',NULL,NULL),(80,'theme-nest-contact_info_boxes','[[{\"key\":\"name\",\"value\":\"Head Office\"},{\"key\":\"address\",\"value\":\"205 North Michigan Avenue, Suite 810, Chicago, 60601, USA\"},{\"key\":\"phone\",\"value\":\"(+01) 234 567\"},{\"key\":\"email\",\"value\":\"office@botble.com\"}],[{\"key\":\"name\",\"value\":\"Our Studio\"},{\"key\":\"address\",\"value\":\"205 North Michigan Avenue, Suite 810, Chicago, 60601, USA\"},{\"key\":\"phone\",\"value\":\"(+01) 234 567\"},{\"key\":\"email\",\"value\":\"studio@botble.com\"}],[{\"key\":\"name\",\"value\":\"Our Shop\"},{\"key\":\"address\",\"value\":\"205 North Michigan Avenue, Suite 810, Chicago, 60601, USA\"},{\"key\":\"phone\",\"value\":\"(+01) 234 567\"},{\"key\":\"email\",\"value\":\"shop@botble.com\"}]]',NULL,NULL),(81,'theme-nest-number_of_products_per_row','5',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Don’t miss amazing<br> grocery deals','sliders/1-1.png','/products','Sign up for the daily newsletter',1,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(2,1,'Fresh Vegetables<br>\n										Big discount','sliders/1-2.png','/products','Save up to 50% off on your first order',2,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(3,2,'Don’t miss amazing<br> grocery deals','sliders/2-1.png','/products','Sign up for the daily newsletter',1,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(4,2,'Fresh Vegetables<br>\n										Big discount','sliders/2-2.png','/products','Save up to 50% off on your first order',2,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(5,3,'Don’t miss amazing<br> grocery deals','sliders/3-1.png','/products','Sign up for the daily newsletter',1,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(6,3,'Fresh Vegetables<br>\n										Big discount','sliders/3-2.png','/products','Save up to 50% off on your first order',2,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(7,4,'Don’t miss amazing<br> grocery deals','sliders/4-1.png','/products','Sign up for the daily newsletter',1,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(8,4,'Fresh Vegetables<br>\n										Big discount','sliders/4-2.png','/products','Save up to 50% off on your first order',2,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(9,5,'Don’t miss amazing<br> grocery deals','sliders/5-1.png','/products','Sign up for the daily newsletter',1,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(10,5,'Fresh Vegetables<br>\n										Big discount','sliders/5-2.png','/products','Save up to 50% off on your first order',2,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(11,6,'Don’t miss amazing<br> grocery deals','sliders/6-1.png','/products','Sign up for the daily newsletter',1,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(12,7,NULL,'sliders/thumbnail-1.jpg',NULL,NULL,1,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(13,7,NULL,'sliders/thumbnail-2.jpg',NULL,NULL,2,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(14,7,NULL,'sliders/thumbnail-3.jpg',NULL,NULL,3,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(15,7,NULL,'sliders/thumbnail-4.jpg',NULL,NULL,4,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(16,7,NULL,'sliders/thumbnail-5.jpg',NULL,NULL,5,'2025-06-29 06:23:13','2025-06-29 06:23:13'),(17,7,NULL,'sliders/thumbnail-6.jpg',NULL,NULL,6,'2025-06-29 06:23:13','2025-06-29 06:23:13');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider 1','home-slider-1',NULL,'published','2025-06-29 06:23:13','2025-06-29 06:23:13'),(2,'Home slider 2','home-slider-2',NULL,'published','2025-06-29 06:23:13','2025-06-29 06:23:13'),(3,'Home slider 3','home-slider-3',NULL,'published','2025-06-29 06:23:13','2025-06-29 06:23:13'),(4,'Home slider 4','home-slider-4',NULL,'published','2025-06-29 06:23:13','2025-06-29 06:23:13'),(5,'Home slider 5','home-slider-5',NULL,'published','2025-06-29 06:23:13','2025-06-29 06:23:13'),(6,'Home slider 6','home-slider-6',NULL,'published','2025-06-29 06:23:13','2025-06-29 06:23:13'),(7,'Blog slider 1','blog-slider-1',NULL,'published','2025-06-29 06:23:13','2025-06-29 06:23:13');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'perxsion',1,'Botble\\Ecommerce\\Models\\Brand','brands','2025-06-29 06:22:47','2025-06-29 06:22:47'),(2,'hiching',2,'Botble\\Ecommerce\\Models\\Brand','brands','2025-06-29 06:22:47','2025-06-29 06:22:47'),(3,'kepslo',3,'Botble\\Ecommerce\\Models\\Brand','brands','2025-06-29 06:22:47','2025-06-29 06:22:47'),(4,'groneba',4,'Botble\\Ecommerce\\Models\\Brand','brands','2025-06-29 06:22:47','2025-06-29 06:22:47'),(5,'babian',5,'Botble\\Ecommerce\\Models\\Brand','brands','2025-06-29 06:22:47','2025-06-29 06:22:47'),(6,'valorant',6,'Botble\\Ecommerce\\Models\\Brand','brands','2025-06-29 06:22:47','2025-06-29 06:22:47'),(7,'pure',7,'Botble\\Ecommerce\\Models\\Brand','brands','2025-06-29 06:22:47','2025-06-29 06:22:47'),(8,'milks-and-dairies',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(9,'clothing-beauty',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(10,'pet-toy',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(11,'baking-material',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(12,'fresh-fruit',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(13,'wines-drinks',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(14,'fresh-seafood',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(15,'fast-food',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(16,'vegetables',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(17,'bread-and-juice',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(18,'cake-milk',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(19,'coffee-teas',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(20,'pet-foods',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(21,'diet-foods',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-06-29 06:22:50','2025-06-29 06:22:50'),(22,'wallet',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-06-29 06:22:51','2025-06-29 06:22:51'),(23,'bags',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-06-29 06:22:51','2025-06-29 06:22:51'),(24,'shoes',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-06-29 06:22:51','2025-06-29 06:22:51'),(25,'clothes',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-06-29 06:22:51','2025-06-29 06:22:51'),(26,'hand-bag',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-06-29 06:22:51','2025-06-29 06:22:51'),(27,'seeds-of-change-organic-quinoe',1,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(28,'all-natural-italian-style-chicken-meatballs',2,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(29,'angies-boomchickapop-sweet-salty-kettle-corn',3,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(30,'foster-farms-takeout-crispy-classic-digital',4,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:23:28'),(31,'blue-diamond-almonds-lightly',5,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(32,'chobani-complete-vanilla-greek',6,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(33,'canada-dry-ginger-ale-2-l-bottle',7,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(34,'encore-seafoods-stuffed-alaskan-digital',8,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:23:28'),(35,'gortons-beer-battered-fish-fillets',9,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(36,'haagen-dazs-caramel-cone-ice-cream',10,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(37,'nestle-original-coffee-mate-coffee-creamer',11,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(38,'naturally-flavored-cinnamon-vanilla-light-roast-coffee-digital',12,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:23:28'),(39,'pepperidge-farm-farmhouse-hearty-white-bread',13,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(40,'organic-frozen-triple-berry-blend',14,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(41,'oroweat-country-buttermilk-bread',15,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(42,'foster-farms-takeout-crispy-classic-buffalo-wings-digital',16,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:23:28'),(43,'angies-boomchickapop-sweet-salty-kettle-corn',17,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(44,'all-natural-italian-style-chicken-meatballs',18,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(45,'simply-lemonade-with-raspberry-juice',19,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(46,'perdue-simply-smart-organics-gluten-free-digital',20,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:23:28'),(47,'chen-watermelon',21,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(48,'organic-cage-free-grade-a-large-brown-eggs',22,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:22:59','2025-06-29 06:22:59'),(49,'colorful-banana',23,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:00','2025-06-29 06:23:00'),(50,'signature-wood-fired-mushroom-and-caramelized-digital',24,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:00','2025-06-29 06:23:28'),(51,'ecommerce',1,'Botble\\Blog\\Models\\Category','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(52,'fashion',2,'Botble\\Blog\\Models\\Category','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(53,'electronic',3,'Botble\\Blog\\Models\\Category','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(54,'commercial',4,'Botble\\Blog\\Models\\Category','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(55,'general',1,'Botble\\Blog\\Models\\Tag','tag','2025-06-29 06:23:14','2025-06-29 06:23:14'),(56,'design',2,'Botble\\Blog\\Models\\Tag','tag','2025-06-29 06:23:14','2025-06-29 06:23:14'),(57,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2025-06-29 06:23:14','2025-06-29 06:23:14'),(58,'branding',4,'Botble\\Blog\\Models\\Tag','tag','2025-06-29 06:23:14','2025-06-29 06:23:14'),(59,'modern',5,'Botble\\Blog\\Models\\Tag','tag','2025-06-29 06:23:14','2025-06-29 06:23:14'),(60,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(61,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(62,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(63,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(64,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(65,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(66,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(67,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:14','2025-06-29 06:23:20'),(68,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:15','2025-06-29 06:23:20'),(69,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:15','2025-06-29 06:23:20'),(70,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','blog','2025-06-29 06:23:15','2025-06-29 06:23:20'),(71,'homepage',1,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(72,'homepage-2',2,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(73,'homepage-3',3,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(74,'homepage-4',4,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(75,'blog',5,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(76,'contact',6,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(77,'about-us',7,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(78,'cookie-policy',8,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(79,'terms-conditions',9,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(80,'returns-exchanges',10,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(81,'shipping-delivery',11,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(82,'privacy-policy',12,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(83,'blog-list',13,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(84,'blog-big',14,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(85,'blog-wide',15,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(86,'homepage-5',16,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(87,'homepage-6',17,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(88,'faq',18,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(89,'coming-soon',19,'Botble\\Page\\Models\\Page','','2025-06-29 06:23:15','2025-06-29 06:23:15'),(90,'gopro',1,'Botble\\Marketplace\\Models\\Store','stores','2025-06-29 06:23:27','2025-06-29 06:23:27'),(91,'global-office',2,'Botble\\Marketplace\\Models\\Store','stores','2025-06-29 06:23:27','2025-06-29 06:23:27'),(92,'young-shop',3,'Botble\\Marketplace\\Models\\Store','stores','2025-06-29 06:23:27','2025-06-29 06:23:27'),(93,'global-store',4,'Botble\\Marketplace\\Models\\Store','stores','2025-06-29 06:23:27','2025-06-29 06:23:27'),(94,'roberts-store',5,'Botble\\Marketplace\\Models\\Store','stores','2025-06-29 06:23:27','2025-06-29 06:23:27'),(95,'stouffer',6,'Botble\\Marketplace\\Models\\Store','stores','2025-06-29 06:23:27','2025-06-29 06:23:27'),(96,'starkist',7,'Botble\\Marketplace\\Models\\Store','stores','2025-06-29 06:23:27','2025-06-29 06:23:27'),(97,'angies-boomchickapop-sweet-salty-kettle-corn',25,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(98,'angies-boomchickapop-sweet-salty-kettle-corn',26,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(99,'angies-boomchickapop-sweet-salty-kettle-corn',27,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(100,'blue-diamond-almonds-lightly',28,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(101,'blue-diamond-almonds-lightly',29,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(102,'chobani-complete-vanilla-greek',30,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(103,'chobani-complete-vanilla-greek',31,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(104,'chobani-complete-vanilla-greek',32,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(105,'chobani-complete-vanilla-greek',33,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(106,'chobani-complete-vanilla-greek',34,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(107,'canada-dry-ginger-ale-2-l-bottle',35,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(108,'canada-dry-ginger-ale-2-l-bottle',36,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(109,'canada-dry-ginger-ale-2-l-bottle',37,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(110,'gortons-beer-battered-fish-fillets',38,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(111,'gortons-beer-battered-fish-fillets',39,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(112,'gortons-beer-battered-fish-fillets',40,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(113,'gortons-beer-battered-fish-fillets',41,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(114,'nestle-original-coffee-mate-coffee-creamer',42,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(115,'nestle-original-coffee-mate-coffee-creamer',43,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(116,'nestle-original-coffee-mate-coffee-creamer',44,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(117,'organic-frozen-triple-berry-blend',45,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(118,'oroweat-country-buttermilk-bread',46,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(119,'oroweat-country-buttermilk-bread',47,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(120,'oroweat-country-buttermilk-bread',48,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(121,'foster-farms-takeout-crispy-classic-buffalo-wings-digital',49,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(122,'foster-farms-takeout-crispy-classic-buffalo-wings-digital',50,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(123,'foster-farms-takeout-crispy-classic-buffalo-wings-digital',51,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(124,'angies-boomchickapop-sweet-salty-kettle-corn',52,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(125,'angies-boomchickapop-sweet-salty-kettle-corn',53,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(126,'angies-boomchickapop-sweet-salty-kettle-corn',54,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(127,'angies-boomchickapop-sweet-salty-kettle-corn',55,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(128,'all-natural-italian-style-chicken-meatballs',56,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(129,'all-natural-italian-style-chicken-meatballs',57,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(130,'all-natural-italian-style-chicken-meatballs',58,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(131,'simply-lemonade-with-raspberry-juice',59,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(132,'simply-lemonade-with-raspberry-juice',60,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(133,'simply-lemonade-with-raspberry-juice',61,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(134,'perdue-simply-smart-organics-gluten-free-digital',62,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28'),(135,'colorful-banana',63,'Botble\\Ecommerce\\Models\\Product','products','2025-06-29 06:23:28','2025-06-29 06:23:28');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-29 06:23:14','2025-06-29 06:23:14'),(2,'Design',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-29 06:23:14','2025-06-29 06:23:14'),(3,'Fashion',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-29 06:23:14','2025-06-29 06:23:14'),(4,'Branding',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-29 06:23:14','2025-06-29 06:23:14'),(5,'Modern',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-29 06:23:14','2025-06-29 06:23:14');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'margarett59@boehm.info',NULL,'$2y$12$5Aqr4vEaF1fwUA18Ka74mOsSASlW13qD0Yh4C/MSTqO65wSnKWJ0.',NULL,'2025-06-29 06:23:15','2025-06-29 06:23:15','Dion','Jaskolski','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SiteInfoWidget','footer_sidebar','nest',0,'{\"id\":\"SiteInfoWidget\",\"name\":\"Site information\",\"about\":\"Awesome grocery store website template\",\"phone\":\"(+91) - 540-025-124553\",\"address\":\"5171 W Campbell Ave undefined Kent, Utah 53127 United States\",\"email\":\"sale@Nest.com\",\"working_hours\":\"10:00 - 18:00, Mon - Sat\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(2,'CustomMenuWidget','footer_sidebar','nest',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(3,'CustomMenuWidget','footer_sidebar','nest',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Categories\",\"menu_id\":\"product-categories\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(4,'CustomMenuWidget','footer_sidebar','nest',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Information\",\"menu_id\":\"information\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(5,'InstallAppWidget','footer_sidebar','nest',3,'{\"id\":\"InstallAppWidget\",\"name\":\"Install App\",\"apps_description\":\"From App Store or Google Play\",\"ios_app_url\":\"#\",\"ios_app_image\":\"general\\/app-store.jpg\",\"android_app_url\":\"#\",\"android_app_image\":\"general\\/google-play.jpg\",\"payment_gateway_description\":\"Secured Payment Gateways\",\"payment_gateway_image\":\"general\\/payment-methods.png\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(6,'BlogSearchWidget','primary_sidebar','nest',0,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(7,'ProductCategoriesWidget','primary_sidebar','nest',1,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Categories\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(8,'TrendingProductsWidget','primary_sidebar','nest',2,'{\"id\":\"TrendingProductsWidget\",\"name\":\"Trending Now\",\"number_display\":4}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(9,'TagsWidget','primary_sidebar','nest',4,'{\"id\":\"TagsWidget\",\"name\":\"Popular Tags\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(10,'AdsWidget','primary_sidebar','nest',5,'{\"id\":\"AdsWidget\",\"name\":\"Organic\",\"ads_key\":\"IZ6WU8KUALYI\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(11,'ProductCategoriesWidget','product_sidebar','nest',1,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Categories\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(12,'NewProductsWidget','product_sidebar','nest',3,'{\"id\":\"NewProductsWidget\",\"name\":\"New products\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(13,'AdsWidget','product_sidebar','nest',4,'{\"id\":\"AdsWidget\",\"name\":\"Oganic\",\"ads_key\":\"IZ6WU8KUALYI\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(14,'NewsletterWidget','pre_footer_sidebar','nest',0,'{\"id\":\"NewsletterWidget\",\"title\":\"Stay home & get your daily <br \\/>needs from our shop\",\"subtitle\":\"Start Your Daily Shopping with <span>Nest Mart<\\/span>\",\"image\":\"general\\/newsletter-image.png\",\"background_image\":\"general\\/newsletter-background-image.png\"}','2025-06-29 06:23:23','2025-06-29 06:23:23'),(15,'SiteFeaturesWidget','pre_footer_sidebar','nest',1,'{\"id\":\"SiteFeaturesWidget\",\"title\":\"Site Features\",\"data\":{\"1\":{\"icon\":\"general\\/icon-1.png\",\"title\":\"Best prices & offers\",\"subtitle\":\"Orders $50 or more\"},\"2\":{\"icon\":\"general\\/icon-2.png\",\"title\":\"Free delivery\",\"subtitle\":\"24\\/7 amazing services\"},\"3\":{\"icon\":\"general\\/icon-3.png\",\"title\":\"Great daily deal\",\"subtitle\":\"When you sign up\"},\"4\":{\"icon\":\"general\\/icon-4.png\",\"title\":\"Wide assortment\",\"subtitle\":\"Mega Discounts\"},\"5\":{\"icon\":\"general\\/icon-5.png\",\"title\":\"Easy returns\",\"subtitle\":\"Within 30 days\"}}}','2025-06-29 06:23:23','2025-06-29 06:23:23');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-29 20:23:31
