/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.33 : Database - gym_managment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gym_managment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gym_managment`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login_table',7,'add_login_table'),
(26,'Can change login_table',7,'change_login_table'),
(27,'Can delete login_table',7,'delete_login_table'),
(28,'Can view login_table',7,'view_login_table'),
(29,'Can add product_table',8,'add_product_table'),
(30,'Can change product_table',8,'change_product_table'),
(31,'Can delete product_table',8,'delete_product_table'),
(32,'Can view product_table',8,'view_product_table'),
(33,'Can add trainer_table',9,'add_trainer_table'),
(34,'Can change trainer_table',9,'change_trainer_table'),
(35,'Can delete trainer_table',9,'delete_trainer_table'),
(36,'Can view trainer_table',9,'view_trainer_table'),
(37,'Can add video_table',10,'add_video_table'),
(38,'Can change video_table',10,'change_video_table'),
(39,'Can delete video_table',10,'delete_video_table'),
(40,'Can view video_table',10,'view_video_table'),
(41,'Can add user_table',11,'add_user_table'),
(42,'Can change user_table',11,'change_user_table'),
(43,'Can delete user_table',11,'delete_user_table'),
(44,'Can view user_table',11,'view_user_table'),
(45,'Can add timeschedule_table',12,'add_timeschedule_table'),
(46,'Can change timeschedule_table',12,'change_timeschedule_table'),
(47,'Can delete timeschedule_table',12,'delete_timeschedule_table'),
(48,'Can view timeschedule_table',12,'view_timeschedule_table'),
(49,'Can add schedule_booking',13,'add_schedule_booking'),
(50,'Can change schedule_booking',13,'change_schedule_booking'),
(51,'Can delete schedule_booking',13,'delete_schedule_booking'),
(52,'Can view schedule_booking',13,'view_schedule_booking'),
(53,'Can add rating_table',14,'add_rating_table'),
(54,'Can change rating_table',14,'change_rating_table'),
(55,'Can delete rating_table',14,'delete_rating_table'),
(56,'Can view rating_table',14,'view_rating_table'),
(57,'Can add order_table',15,'add_order_table'),
(58,'Can change order_table',15,'change_order_table'),
(59,'Can delete order_table',15,'delete_order_table'),
(60,'Can view order_table',15,'view_order_table'),
(61,'Can add order_details',16,'add_order_details'),
(62,'Can change order_details',16,'change_order_details'),
(63,'Can delete order_details',16,'delete_order_details'),
(64,'Can view order_details',16,'view_order_details'),
(65,'Can add fee_table',17,'add_fee_table'),
(66,'Can change fee_table',17,'change_fee_table'),
(67,'Can delete fee_table',17,'delete_fee_table'),
(68,'Can view fee_table',17,'view_fee_table'),
(69,'Can add attendance_table',18,'add_attendance_table'),
(70,'Can change attendance_table',18,'change_attendance_table'),
(71,'Can delete attendance_table',18,'delete_attendance_table'),
(72,'Can view attendance_table',18,'view_attendance_table'),
(73,'Can add diatchart',19,'add_diatchart'),
(74,'Can change diatchart',19,'change_diatchart'),
(75,'Can delete diatchart',19,'delete_diatchart'),
(76,'Can view diatchart',19,'view_diatchart'),
(77,'Can add foodhistory',20,'add_foodhistory'),
(78,'Can change foodhistory',20,'change_foodhistory'),
(79,'Can delete foodhistory',20,'delete_foodhistory'),
(80,'Can view foodhistory',20,'view_foodhistory'),
(81,'Can add diet_ details',21,'add_diet_details'),
(82,'Can change diet_ details',21,'change_diet_details'),
(83,'Can delete diet_ details',21,'delete_diet_details'),
(84,'Can view diet_ details',21,'view_diet_details');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$600000$p4KlVGk5u0gNMdClRk7LLK$7Wn2xFYAXj6zGVyli9CmELDmYD+RdgLKTEZJzSzeUg8=','2024-03-11 10:52:25.109664',1,'admin','','','admin@gmail.com',1,1,'2024-03-04 13:49:54.474952');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(18,'gym','attendance_table'),
(19,'gym','diatchart'),
(21,'gym','diet_details'),
(17,'gym','fee_table'),
(20,'gym','foodhistory'),
(7,'gym','login_table'),
(16,'gym','order_details'),
(15,'gym','order_table'),
(8,'gym','product_table'),
(14,'gym','rating_table'),
(13,'gym','schedule_booking'),
(12,'gym','timeschedule_table'),
(9,'gym','trainer_table'),
(11,'gym','user_table'),
(10,'gym','video_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-02-28 12:48:38.654277'),
(2,'auth','0001_initial','2024-02-28 12:48:38.951150'),
(3,'admin','0001_initial','2024-02-28 12:48:39.013657'),
(4,'admin','0002_logentry_remove_auto_add','2024-02-28 12:48:39.029277'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-02-28 12:48:39.029277'),
(6,'contenttypes','0002_remove_content_type_name','2024-02-28 12:48:39.076151'),
(7,'auth','0002_alter_permission_name_max_length','2024-02-28 12:48:39.107400'),
(8,'auth','0003_alter_user_email_max_length','2024-02-28 12:48:39.123026'),
(9,'auth','0004_alter_user_username_opts','2024-02-28 12:48:39.138654'),
(10,'auth','0005_alter_user_last_login_null','2024-02-28 12:48:39.169902'),
(11,'auth','0006_require_contenttypes_0002','2024-02-28 12:48:39.169902'),
(12,'auth','0007_alter_validators_add_error_messages','2024-02-28 12:48:39.185472'),
(13,'auth','0008_alter_user_username_max_length','2024-02-28 12:48:39.216777'),
(14,'auth','0009_alter_user_last_name_max_length','2024-02-28 12:48:39.279302'),
(15,'auth','0010_alter_group_name_max_length','2024-02-28 12:48:39.294814'),
(16,'auth','0011_update_proxy_permissions','2024-02-28 12:48:39.310529'),
(17,'auth','0012_alter_user_first_name_max_length','2024-02-28 12:48:39.341691'),
(18,'gym','0001_initial','2024-02-28 12:48:39.919806'),
(19,'sessions','0001_initial','2024-02-28 12:48:39.951067'),
(20,'gym','0002_order_details_quantity','2024-02-28 13:28:59.549348'),
(21,'gym','0003_diatchart','2024-02-28 13:49:50.024327'),
(22,'gym','0004_foodhistory','2024-02-29 17:25:16.331355'),
(23,'gym','0005_fee_table_schedule','2024-03-01 03:59:37.225349'),
(24,'gym','0006_diet_details','2024-03-04 13:21:25.201914');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('3wd2jchvqrw47sqd8xa18ehbv0givc1p','.eJxVjrEOgzAMRP8lcxUlhsS4Y_d-Awq2U2gRSASmqv9ekBja9d7d071Nm7a1b7eiSzuIuRpvLr9Zl_il0wHkmabHbHme1mXo7FGxJy32PouOt7P7J-hT6fd1VQfPjWZFlxpwsWIkAQ1AzOCaKmn0TOjAZYcgFKgTjUxeMWOs8y4dj3_w-QKTYjmZ:1rjdGb:eYIwoWqt9t2MDvsvYzJl4HxzU9IPT-u-twe9U2Ey838','2024-03-25 10:52:25.121624'),
('kh5hs018w3h7erf0xjdjzyx1uwvrkxci','.eJxVjMsOwiAQRf-FtSEwlJdL934DgWGQqoGktCvjv2uTLnR7zzn3xULc1hq2QUuYMzszyU6_W4r4oLaDfI_t1jn2ti5z4rvCDzr4tWd6Xg7376DGUb-1mrRER4WsiA6EUWh9BtLgEUE4FclI9FaAKMJC9tqnTAa9JFusmQp7fwDPeDeE:1rhTmO:SnVGaSf5uQsUX0Ooz-z9QfPaK_67S1XNcpuvD2l76sA','2024-03-19 12:20:20.525752'),
('qgh5owin6nvstzho49bixfzyho4qzu9s','eyJhdCI6MSwibGlkIjoyfQ:1rfkDz:TaI4s_yI9t3OwJQQRX5ollCqtYLuXeXhSo0mSeWsBLM','2024-03-14 17:29:39.214858');

/*Table structure for table `gym_attendance_table` */

DROP TABLE IF EXISTS `gym_attendance_table`;

CREATE TABLE `gym_attendance_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `attendance` varchar(100) NOT NULL,
  `trainers_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_attendance_table_trainers_id_a55f4f69_fk_gym_train` (`trainers_id`),
  KEY `gym_attendance_table_user_id_1fba4929_fk_gym_user_table_id` (`user_id`),
  CONSTRAINT `gym_attendance_table_trainers_id_a55f4f69_fk_gym_train` FOREIGN KEY (`trainers_id`) REFERENCES `gym_trainer_table` (`id`),
  CONSTRAINT `gym_attendance_table_user_id_1fba4929_fk_gym_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `gym_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_attendance_table` */

insert  into `gym_attendance_table`(`id`,`date`,`attendance`,`trainers_id`,`user_id`) values 
(1,'2024-03-04','1',1,1),
(2,'2024-03-11','1',1,1),
(3,'2024-03-11','1',1,2);

/*Table structure for table `gym_diatchart` */

DROP TABLE IF EXISTS `gym_diatchart`;

CREATE TABLE `gym_diatchart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `height` int NOT NULL,
  `weight` int NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(100) NOT NULL,
  `plan` longtext NOT NULL,
  `diat` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_diatchart_user_id_63288b4b_fk_gym_user_table_id` (`user_id`),
  CONSTRAINT `gym_diatchart_user_id_63288b4b_fk_gym_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `gym_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_diatchart` */

insert  into `gym_diatchart`(`id`,`height`,`weight`,`age`,`gender`,`plan`,`diat`,`status`,`user_id`) values 
(1,160,45,22,'1','hgfhgc','2.jpg','pending',2);

/*Table structure for table `gym_diet_details` */

DROP TABLE IF EXISTS `gym_diet_details`;

CREATE TABLE `gym_diet_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `diet` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `food_allowed` longtext NOT NULL,
  `food_not_allowed` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_diet_details` */

insert  into `gym_diet_details`(`id`,`diet`,`desc`,`food_allowed`,`food_not_allowed`) values 
(1,'dfghj','ghjkghjk','fvgbhjk','vgbhnjk\r\n'),
(2,'hgfhgc','fhgfgfhjgfgjvghv\r\n','jgiuyyiugiugiu','kjhiughiuhiuhiuh'),
(3,'jhgikgkugb ','hohoihoihiohoihi','lknmlkmlkmlkm ','lkjbkjbkjgkugiu');

/*Table structure for table `gym_fee_table` */

DROP TABLE IF EXISTS `gym_fee_table`;

CREATE TABLE `gym_fee_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  `schedule_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_fee_table_user_id_bd5c8850_fk_gym_user_table_id` (`user_id`),
  KEY `gym_fee_table_schedule_id_bc39c27d_fk_gym_schedule_booking_id` (`schedule_id`),
  CONSTRAINT `gym_fee_table_schedule_id_bc39c27d_fk_gym_schedule_booking_id` FOREIGN KEY (`schedule_id`) REFERENCES `gym_schedule_booking` (`id`),
  CONSTRAINT `gym_fee_table_user_id_bd5c8850_fk_gym_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `gym_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_fee_table` */

insert  into `gym_fee_table`(`id`,`date`,`amount`,`status`,`user_id`,`schedule_id`) values 
(1,'2024-03-11',1000,'paid',2,25),
(2,'2024-03-11',1000,'paid',2,25);

/*Table structure for table `gym_foodhistory` */

DROP TABLE IF EXISTS `gym_foodhistory`;

CREATE TABLE `gym_foodhistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `food` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_foodhistory_user_id_ccc07fed_fk_gym_user_table_id` (`user_id`),
  CONSTRAINT `gym_foodhistory_user_id_ccc07fed_fk_gym_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `gym_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_foodhistory` */

insert  into `gym_foodhistory`(`id`,`date`,`time`,`food`,`user_id`) values 
(1,'2024-03-04','10:00:00.000000','protien',2),
(2,'2024-03-11','11:00:00.000000','pejdhd',2);

/*Table structure for table `gym_login_table` */

DROP TABLE IF EXISTS `gym_login_table`;

CREATE TABLE `gym_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_login_table` */

insert  into `gym_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'naja','naja','trainer'),
(3,'rasha','rasha','user'),
(4,'sana','sana','user');

/*Table structure for table `gym_order_details` */

DROP TABLE IF EXISTS `gym_order_details`;

CREATE TABLE `gym_order_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_order_details_order_id_7bb2ab8c_fk_gym_order_table_id` (`order_id`),
  KEY `gym_order_details_product_id_12310dc6_fk_gym_product_table_id` (`product_id`),
  CONSTRAINT `gym_order_details_order_id_7bb2ab8c_fk_gym_order_table_id` FOREIGN KEY (`order_id`) REFERENCES `gym_order_table` (`id`),
  CONSTRAINT `gym_order_details_product_id_12310dc6_fk_gym_product_table_id` FOREIGN KEY (`product_id`) REFERENCES `gym_product_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_order_details` */

insert  into `gym_order_details`(`id`,`status`,`date`,`order_id`,`product_id`,`quantity`) values 
(2,'order','2024-03-04',2,1,2),
(3,'order','2024-03-11',3,1,2),
(4,'order','2024-03-11',1,1,1);

/*Table structure for table `gym_order_table` */

DROP TABLE IF EXISTS `gym_order_table`;

CREATE TABLE `gym_order_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_order_table_user_id_4500d49c_fk_gym_user_table_id` (`user_id`),
  CONSTRAINT `gym_order_table_user_id_4500d49c_fk_gym_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `gym_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_order_table` */

insert  into `gym_order_table`(`id`,`amount`,`date`,`status`,`user_id`) values 
(1,0,'2024-03-04','cart',2),
(2,2000,'2024-03-04','order',2),
(3,2000,'2024-03-11','order',2);

/*Table structure for table `gym_product_table` */

DROP TABLE IF EXISTS `gym_product_table`;

CREATE TABLE `gym_product_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `productname` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  `details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_product_table` */

insert  into `gym_product_table`(`id`,`productname`,`image`,`price`,`stock`,`details`) values 
(1,'protien powder','notify.png',1000,5,'sedrfgthyjukl');

/*Table structure for table `gym_rating_table` */

DROP TABLE IF EXISTS `gym_rating_table`;

CREATE TABLE `gym_rating_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `reviews` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `trainers_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_rating_table_trainers_id_a042b775_fk_gym_trainer_table_id` (`trainers_id`),
  KEY `gym_rating_table_user_id_8ef68ac6_fk_gym_user_table_id` (`user_id`),
  CONSTRAINT `gym_rating_table_trainers_id_a042b775_fk_gym_trainer_table_id` FOREIGN KEY (`trainers_id`) REFERENCES `gym_trainer_table` (`id`),
  CONSTRAINT `gym_rating_table_user_id_8ef68ac6_fk_gym_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `gym_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_rating_table` */

insert  into `gym_rating_table`(`id`,`rating`,`reviews`,`date`,`trainers_id`,`user_id`) values 
(1,2,'bxndj','2024-03-04',1,2);

/*Table structure for table `gym_schedule_booking` */

DROP TABLE IF EXISTS `gym_schedule_booking`;

CREATE TABLE `gym_schedule_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `status` varchar(100) NOT NULL,
  `timeschedule_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_schedule_booking_timeschedule_id_5b377528_fk_gym_times` (`timeschedule_id`),
  KEY `gym_schedule_booking_user_id_e2363fb2_fk_gym_user_table_id` (`user_id`),
  CONSTRAINT `gym_schedule_booking_timeschedule_id_5b377528_fk_gym_times` FOREIGN KEY (`timeschedule_id`) REFERENCES `gym_timeschedule_table` (`id`),
  CONSTRAINT `gym_schedule_booking_user_id_e2363fb2_fk_gym_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `gym_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_schedule_booking` */

insert  into `gym_schedule_booking`(`id`,`date`,`time`,`status`,`timeschedule_id`,`user_id`) values 
(1,'2024-03-04','11:21:32.701531','accept',1,2),
(2,'2024-03-04','17:23:01.180777','pending',1,1),
(3,'2024-03-04','17:23:22.778826','pending',1,1),
(4,'2024-03-04','17:26:58.585512','pending',1,1),
(5,'2024-03-04','17:57:34.818074','pending',1,2),
(6,'2024-03-04','17:57:47.196958','pending',1,2),
(7,'2024-03-04','17:59:24.887115','pending',1,2),
(8,'2024-03-04','18:00:55.432072','pending',1,2),
(9,'2024-03-04','18:01:27.154021','pending',1,2),
(10,'2024-03-04','18:03:08.444994','pending',1,2),
(11,'2024-03-04','18:10:25.061274','pending',1,2),
(12,'2024-03-04','18:31:57.110764','pending',1,2),
(13,'2024-03-04','18:32:24.144237','pending',1,2),
(14,'2024-03-04','18:33:50.699948','pending',1,2),
(15,'2024-03-04','18:42:27.669689','pending',1,2),
(16,'2024-03-04','18:44:57.675279','pending',1,2),
(17,'2024-03-11','12:11:25.741968','pending',1,1),
(18,'2024-03-11','12:37:25.215228','pending',1,2),
(19,'2024-03-11','12:37:44.635099','pending',1,2),
(20,'2024-03-11','12:39:50.594475','pending',1,2),
(21,'2024-03-11','15:24:15.708061','pending',1,2),
(22,'2024-03-11','15:35:12.676489','pending',1,2),
(23,'2024-03-11','15:40:32.484556','pending',1,2),
(24,'2024-03-11','15:42:32.315150','pending',1,2),
(25,'2024-03-11','16:13:29.191779','pending',1,2);

/*Table structure for table `gym_timeschedule_table` */

DROP TABLE IF EXISTS `gym_timeschedule_table`;

CREATE TABLE `gym_timeschedule_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `starttime` time(6) NOT NULL,
  `endtime` time(6) NOT NULL,
  `day` varchar(100) NOT NULL,
  `trainers_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_timeschedule_tab_trainers_id_5ca9257f_fk_gym_train` (`trainers_id`),
  CONSTRAINT `gym_timeschedule_tab_trainers_id_5ca9257f_fk_gym_train` FOREIGN KEY (`trainers_id`) REFERENCES `gym_trainer_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_timeschedule_table` */

insert  into `gym_timeschedule_table`(`id`,`starttime`,`endtime`,`day`,`trainers_id`) values 
(1,'18:26:00.000000','06:26:00.000000','Sunday',1);

/*Table structure for table `gym_trainer_table` */

DROP TABLE IF EXISTS `gym_trainer_table`;

CREATE TABLE `gym_trainer_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `achievements` varchar(100) NOT NULL,
  `work_experience` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `pin` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_trainer_table_login_id_ed8af0e3_fk_gym_login_table_id` (`login_id`),
  CONSTRAINT `gym_trainer_table_login_id_ed8af0e3_fk_gym_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `gym_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_trainer_table` */

insert  into `gym_trainer_table`(`id`,`photo`,`phone`,`firstname`,`lastname`,`achievements`,`work_experience`,`place`,`post`,`gender`,`pin`,`email`,`login_id`) values 
(1,'hostmatch.jpg',9876541098,'Naja','cp','turflogo.jpg','1 year','calicut','calicut','female',878787,'naja@gmail.com',2);

/*Table structure for table `gym_user_table` */

DROP TABLE IF EXISTS `gym_user_table`;

CREATE TABLE `gym_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_user_table_login_id_39df1564_fk_gym_login_table_id` (`login_id`),
  CONSTRAINT `gym_user_table_login_id_39df1564_fk_gym_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `gym_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_user_table` */

insert  into `gym_user_table`(`id`,`firstname`,`lastname`,`photo`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`login_id`) values 
(1,'rasha','cp','fghjkl','female','fghjk','ghjk',56789,34567890,'dfghjk',3),
(2,'sana','kp','Screenshot_20240302-155035_CASA_CARE.jpg','Female','calicut ','calicut ',987654,9876544567,'sana@gmail.com',4);

/*Table structure for table `gym_video_table` */

DROP TABLE IF EXISTS `gym_video_table`;

CREATE TABLE `gym_video_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `trainer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_video_table_trainer_id_b4acd21d_fk_gym_trainer_table_id` (`trainer_id`),
  CONSTRAINT `gym_video_table_trainer_id_b4acd21d_fk_gym_trainer_table_id` FOREIGN KEY (`trainer_id`) REFERENCES `gym_trainer_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gym_video_table` */

insert  into `gym_video_table`(`id`,`video`,`subject`,`date`,`trainer_id`) values 
(1,'ghjk','rtyuio','2024-03-04',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
