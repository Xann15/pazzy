-- MySQL dump 10.13  Distrib 9.1.0, for macos13.7 (x86_64)
--
-- Host: localhost    Database: pazzy_app
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `ch_favorites`
--

DROP TABLE IF EXISTS `ch_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_favorites` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `favorite_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_favorites`
--

LOCK TABLES `ch_favorites` WRITE;
/*!40000 ALTER TABLE `ch_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_messages`
--

DROP TABLE IF EXISTS `ch_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_messages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `to_id` bigint NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_messages`
--

LOCK TABLES `ch_messages` WRITE;
/*!40000 ALTER TABLE `ch_messages` DISABLE KEYS */;
INSERT INTO `ch_messages` VALUES ('463f44cc-8a6c-4372-a33f-4290dbd73d1f',71,1,'p',NULL,0,'2025-07-13 20:42:12','2025-07-13 20:42:12'),('aaba6f72-c363-436d-8697-ef5fb90f8992',70,69,'hi\\',NULL,1,'2025-06-04 10:34:32','2025-06-04 10:34:49'),('b961784b-0e11-467e-b224-b4625e64a491',69,69,'hi',NULL,1,'2025-06-04 10:33:42','2025-06-04 10:34:40'),('ead7b295-70ee-499b-935f-04d7e49391e1',52,52,'Oi',NULL,1,'2025-04-30 00:49:50','2025-04-30 00:50:07');
/*!40000 ALTER TABLE `ch_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_groups`
--

DROP TABLE IF EXISTS `chat_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `max_members` enum('15','35','65','125','225','350','500') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '15',
  `level` enum('basic','bronze','silver','gold','platinum','diamond','love') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_created_by_foreign` (`created_by`),
  CONSTRAINT `groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_groups`
--

LOCK TABLES `chat_groups` WRITE;
/*!40000 ALTER TABLE `chat_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(13,'2025_03_26_125627_add_google_id_to_users_table',2),(18,'2025_04_18_114213_create_groups_table',5),(22,'2014_10_12_100000_create_password_reset_tokens_table',6),(23,'2019_08_19_000000_create_failed_jobs_table',6),(24,'2019_12_14_000001_create_personal_access_tokens_table',6),(25,'2023_03_03_999999_add_active_status_to_users',6),(26,'2023_03_03_999999_add_avatar_to_users',6),(27,'2023_03_03_999999_add_dark_mode_to_users',6),(28,'2023_03_03_999999_add_messenger_color_to_users',6),(29,'2023_03_03_999999_create_chatify_favorites_table',6),(30,'2023_03_03_999999_create_chatify_messages_table',6),(31,'2024_04_24_000001_add_user_social_provider_table',6),(32,'2024_04_24_000002_update_passwords_field_to_be_nullable',6),(33,'2024_05_07_000003_add_two_factor_auth_columns',6),(34,'2025_03_16_132927_create_stories_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `social_provider_user`
--

DROP TABLE IF EXISTS `social_provider_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_provider_user` (
  `user_id` bigint unsigned NOT NULL,
  `provider_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_data` text COLLATE utf8mb4_unicode_ci,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`provider_slug`),
  CONSTRAINT `social_provider_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_provider_user`
--

LOCK TABLES `social_provider_user` WRITE;
/*!40000 ALTER TABLE `social_provider_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_provider_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stories_user_id_foreign` (`user_id`),
  CONSTRAINT `stories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `messenger_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rowland Cummerata','crooks.russ@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'g2H7ETQted','2025-03-24 06:11:06','2025-03-24 06:11:06',0,0,'avatar.png',0,NULL),(2,'Dariana Pollich MD','hackett.jaden@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'rt3WaxH7O0','2025-03-24 06:11:06','2025-03-24 06:11:06',0,0,'avatar.png',0,NULL),(3,'Trent Runolfsdottir','huels.elsie@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'KsfzJk60wg','2025-03-24 06:11:06','2025-03-24 06:11:06',0,0,'avatar.png',0,NULL),(4,'Gwen Huels Jr.','leif74@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'ly8v4p0N7o','2025-03-24 06:11:06','2025-03-24 06:11:06',0,0,'avatar.png',0,NULL),(5,'Sarai Bosco','josephine.yost@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'4NUwYkLc3r','2025-03-24 06:11:06','2025-03-24 06:11:06',0,0,'avatar.png',0,NULL),(6,'Mrs. Malika Wilkinson DDS','colton.hills@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'yQnh7CXMxc','2025-03-24 06:11:06','2025-03-24 06:11:06',0,0,'avatar.png',0,NULL),(7,'Verona Kertzmann','krajcik.randal@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'Ft40amxwQ1','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(8,'Torrey Konopelski','sdach@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'UDBWYN8FJT','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(9,'Brenden Zulauf','hrosenbaum@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'RLNpnrV9bx','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(10,'Dorcas Rippin','mraz.mavis@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'wOUCSMOYaR','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(11,'Prof. Darron Rogahn','timmy21@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'TZcmR5DhgV','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(12,'Regan Lind','hhermiston@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'oOQTWgep13','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(13,'Elmer Weimann','anne.marks@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'4f1iZZg001','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(14,'Ms. Loren Parker','bcassin@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'gHupEbqY59','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(15,'Dr. Glennie Spencer','hmitchell@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'NnaClXg1WM','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(16,'Justus Krajcik','rubye40@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'1z0LpLsuke','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(17,'Mr. Eddie Kessler','dariana40@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'k5mPpS9Yt4','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(18,'Mortimer Kuvalis','trantow.ibrahim@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'2llMAVy5v0','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(19,'Prof. Enid Balistreri IV','deckow.humberto@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'4TVdRH1SDZ','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(20,'Madyson Armstrong','salma.bode@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'qj6gzeb23F','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(21,'Garret Deckow','herta67@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'l0S7fpYgjg','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(22,'Lola Veum','thompson.emmy@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'zvIsISEfhL','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(23,'Sydni Skiles','satterfield.quentin@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'iOhEafKtEY','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(24,'Westley Hackett','sven39@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'HKX9H6AwqQ','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(25,'Creola Corwin','kchamplin@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'qK92ZXAdhp','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(26,'Beth Cassin','rosenbaum.ayana@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'mBrdP3B2Yr','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(27,'Dr. Earnest Kertzmann','patsy.rempel@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'hZF7ANdtun','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(28,'Cristobal Donnelly','otilia.runolfsson@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'pj9Zy99aje','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(29,'Emmy Davis','xkoss@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'hlsHXE5zAm','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(30,'Harley Bauch','jeanette15@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'qV5ELqwBDS','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(31,'Mrs. Adeline Lang PhD','vhalvorson@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'UV1Csil7SN','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(32,'Aniya Flatley DVM','earl.marks@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'Xtc2blj5Tk','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(33,'Prof. Candida Hegmann DVM','dsenger@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'PTxzpu6FF6','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(34,'Adolph Tromp','jane18@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'R2tyAHBUIe','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(35,'Hollie Dickinson','dwuckert@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'FXPhumyEqP','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(36,'Prof. Shaun Monahan','rpfeffer@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'BG2hsWYxlI','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(37,'Mr. Rickie Pouros','cwiegand@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'9iKu67GTkd','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(38,'Lindsey Mills I','werner98@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'GWgZMZJ50w','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(39,'Shakira Ankunding','pacocha.yadira@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'DDFXILIDn1','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(40,'Darion Fritsch','pkling@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'Z260AhzCv6','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(41,'Carol Roberts','lbruen@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'U9KG7GojbJ','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(42,'Prof. Graham Carter','simonis.dangelo@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'ZyoUhxhQTQ','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(43,'Kenny Johns','schaden.juvenal@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'E5Zr8wlKz9','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(44,'Janelle Lind','esta.maggio@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'LVSPuu58yQ','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(45,'Lance Jacobson','carmela.hane@example.org','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'SWGK7zFip0','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(46,'Zetta Nicolas','spencer.loren@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'3vNXI3wMOD','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(47,'Cordell Davis DDS','claudia30@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'ETA6rl2uF6','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(48,'Gwen Schaden','fay.brittany@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'923i0DBrNt','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(49,'Billie Wiegand','jasen19@example.com','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'Oxg3CLWWdq','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(50,'Lina Medhurst','brandon39@example.net','2025-03-24 06:11:06','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,NULL,'buUsMCLXv1','2025-03-24 06:11:07','2025-03-24 06:11:07',0,0,'avatar.png',0,NULL),(51,'Mitsuki','sprucemochicello@hotmail.com',NULL,'$2y$10$QGy7nOX7W9jlj6p5NLBDjeQqgg/TFCc.RDSqAT4TM66hayxiSMfZi',NULL,NULL,NULL,NULL,'2025-03-24 06:38:17','2025-03-24 07:21:01',0,0,'avatar.png',0,NULL),(52,'pandjie','pandjie@gmail.com',NULL,'$2y$10$3Q4xXYKJWn.UFn3NqON0Le32kJMxaWDIzhoWxQ06z6cKK3OXmD7l.',NULL,NULL,NULL,NULL,'2025-03-24 06:38:17','2025-03-25 02:34:01',1,0,'avatar.png',0,NULL),(53,'Tian second acc','christianpandapotans@gmail.com',NULL,'$2y$10$F7NCLHQBjpPBWFLwuY5hZe0HZ77HeesYmDE7E.TGujvIIDLb3L7Yy',NULL,NULL,NULL,NULL,'2025-03-24 06:45:51','2025-03-24 07:23:45',0,0,'avatar.png',0,NULL),(54,'jjn','jjn@gmail.com',NULL,'$2y$10$NgzPMLqHrY/BC3W/ZPzwX.is91fCZfICGr25/vkH.IOLw08hbGFye',NULL,NULL,NULL,NULL,'2025-03-24 07:08:48','2025-03-24 07:31:06',0,0,'avatar.png',0,NULL),(55,'bennxxzz','benxxzz99@gmail.com',NULL,'$2y$10$yjGFDv6blXUBHgU9SybhTO7hglURHwwcajzRYHh9NJWyj.6l4YxdK',NULL,NULL,NULL,NULL,'2025-03-24 07:09:39','2025-03-24 07:14:22',0,0,'avatar.png',0,NULL),(56,'Meme botak','memebotak123@gmail.com',NULL,'$2y$10$VsNZBwhML0Ve9eQsvs0kveuMuuYyA1gpDUS0oULJyV6mRobuHnUWq',NULL,NULL,NULL,NULL,'2025-03-24 07:30:02','2025-03-24 07:47:43',1,0,'avatar.png',0,NULL),(57,'Steven','stevenliu792@gmail.com',NULL,'$2y$10$9xepnRo4zyAkeH.XLhN/M.4VoJ8PWboaYsXv9v88pzRHkKMrQ7yQm',NULL,NULL,NULL,NULL,'2025-03-24 11:09:47','2025-03-24 11:16:10',0,0,'avatar.png',0,NULL),(58,'Putra','ibramovidsyaputra@gmail.com',NULL,'$2y$10$1I3Z6uiBWqbdI5Lt0RVD0ur4XlEwfSPMxOctOLsOOb29OetqMo5Tq',NULL,NULL,NULL,'ED2QmomvIDDVn7OTDgozUT8kQ5vI7X7DAHma29eUe6q7g5JkoZ4PoqPtYn5h','2025-03-24 11:14:55','2025-03-24 11:18:12',0,0,'avatar.png',0,NULL),(62,'Xann','xann@gmail.com',NULL,'$2y$10$7QQNuBBIeic4idbkdC1c8OCQBjf1BX40bFHEfgh9UQX09ZQqQm2zq',NULL,NULL,NULL,NULL,'2025-03-24 15:11:47','2025-03-24 15:13:21',0,0,'avatar.png',0,NULL),(63,'Kelvinn','kelvinhardiansyah2006@gmail.com',NULL,'$2y$10$To73EC1kQNOgRcGIKFyEbueHEWzcC5IRZzaK5MmCX/yj13YQegT06',NULL,NULL,NULL,NULL,'2025-03-25 00:43:42','2025-03-25 01:24:51',0,0,'avatar.png',0,NULL),(64,'','newuser@gmail.com',NULL,'$2y$10$vVc/9D0vIF56NLZ2OfPqnOIGqaGiw0YgZxvF1gQNQ3/yVxXZRNlGi',NULL,NULL,NULL,'sVTzjXPQmN3ve8kG8eLpvbMiTKcq8GxadrolQxUUdMiFHDeqJG6LRrlyjDE0','2025-03-26 06:43:23','2025-03-26 06:43:23',0,0,'avatar.png',0,NULL),(65,'new','new@gmail.com',NULL,'$2y$10$QGGgeHa1xiE5z2ENarVbeO8Kt5UV6vERwhLmMlln/SQbvYa2RuStu',NULL,NULL,NULL,'QhLBoQHSdvjlq0lRQMvCSED81XypNDO1EkB7MLQsOLGSpsFFMUktBXkTsxDO','2025-03-26 06:49:57','2025-03-26 06:49:57',0,0,'avatar.png',0,NULL),(66,'new','news@gmail.com',NULL,'$2y$10$Lx/QFoYkJGqnt7oGXwve2evhUgSJVRudE6jMonuBt9gAWbiaiiUnG',NULL,NULL,NULL,'E18PrTIZgzsYqAFIAJFqNjo89UUTxWwxA5YbwPdk1nywNhrtY2IfyzzMhy5k','2025-03-26 06:53:58','2025-03-26 06:54:24',0,0,'avatar.png',0,NULL),(67,'new','newss@gmail.com',NULL,'$2y$10$LLbkCV1gNs6eekVkNn39zu/LdJQXQUFSi6hFl8XARX.xd5SOncerK',NULL,NULL,NULL,'V3XHqI51SqONPC8kEiXWkB1gD9K3dYJxVbvWdYbZemDJeQy8y8PJhC4hlJxf','2025-03-26 07:00:05','2025-03-26 07:00:05',0,0,'avatar.png',0,NULL),(68,'new','newsss@gmail.com',NULL,'$2y$10$gCNyymHwP5KRq77m3NJDWODP9DJQ/TzfzJbqsrBJmvgSFtnqH9xwW',NULL,NULL,NULL,NULL,'2025-03-26 07:08:14','2025-03-26 07:08:14',0,0,'avatar.png',0,NULL),(69,'xan','xan@gmail.com',NULL,'$2y$10$3xQhS3wk7LmHlquyooq2uuLELzKF5rb8Csn3l7N9uRXmLK8ZfAKuC',NULL,NULL,NULL,'VuOeecZoFpKM9B0tMGIELwRiNYKeUfhQrxeDP87ez71J9KAlJ3In9VaUGel0','2025-06-04 10:33:21','2025-06-04 10:35:34',0,0,'avatar.png',1,NULL),(70,'jn','jn@gmail.com',NULL,'$2y$10$WRvtmaXrASCZSaXLhIon9.eAnLfJ2OebX53LIdvhNzEw/AFtKCqy6',NULL,NULL,NULL,'ah30Nhr2Bqh5it7eo1PCEH43w26omrk7rDwIg3hWsUQMKdtpjhFIXWpI9tGX','2025-06-04 10:34:07','2025-06-04 10:34:07',0,0,'avatar.png',0,NULL),(71,'xans','xans@gmail.com',NULL,'$2y$10$lqDUCxIlg.ra.ZaTQhq07eS3DBQguMQ8ISWt36tMqL7j0R5EpU8Ne',NULL,NULL,NULL,'WgYdaPRTt4OGXsITXqzQjw0OGGuVZkJhoTRNYDd04ugX6KjY9IIjzOuSt9Uh','2025-07-13 20:41:53','2025-07-13 20:41:53',0,0,'avatar.png',0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-14 11:32:34
