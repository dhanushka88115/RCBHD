/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - rcbhd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rcbhd` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `rcbhd`;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `roles` */

insert  into `roles`(`role_id`,`role_name`,`description`) values 
(1,'User','Standard user with basic access.'),
(2,'Branch Officer','Responsible for managing requests within a specific branch or team.'),
(3,'Administrative Officer','Manages and reviews requests for administrative tasks.'),
(4,'Assistant Director','Head of the Help Desk, oversees overall request management.'),
(5,'IT Assistant','Handles technical resolutions and collaborates with the Assistant Director.');

/*Table structure for table `subdepartment` */

DROP TABLE IF EXISTS `subdepartment`;

CREATE TABLE `subdepartment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SubDepartmentCode` varchar(5) NOT NULL,
  `SubDepartmentName` varchar(2000) NOT NULL,
  `Address` varchar(2000) DEFAULT NULL,
  `HeadofDepartmentId` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `UpdatedBy` varchar(100) DEFAULT NULL,
  `UpdatedTime` timestamp NULL DEFAULT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `CreatedTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id`),
  KEY `HeadofDepartmentId` (`HeadofDepartmentId`),
  CONSTRAINT `subdepartment_ibfk_1` FOREIGN KEY (`HeadofDepartmentId`) REFERENCES `employee` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `subdepartment` */

insert  into `subdepartment`(`Id`,`SubDepartmentCode`,`SubDepartmentName`,`Address`,`HeadofDepartmentId`,`IsDeleted`,`UpdatedBy`,`UpdatedTime`,`CreatedBy`,`CreatedTime`) values 
(1,'GMR','General Manager Office','Maradana-HQ',1100000,0,'System','2021-03-20 10:55:35','System','2021-03-20 10:55:35'),
(2,'CAR','Chief Accountant of Railways Sub Department','Maradana-HQ',1100000,0,'admin','2021-12-18 00:24:54','System','2021-03-20 10:55:35'),
(3,'COM','Commercial Superintendent Sub Department','Maradana-HQ',1100000,0,'System','2021-03-20 10:55:35','System','2021-03-20 10:55:35'),
(4,'SRS','Superintendent of Railway Stores Sub Department','Maradana-HQ',1100000,0,'System','2021-03-20 10:55:35','System','2021-03-20 10:55:35'),
(5,'OPS','Operating Superintendent Sub Department','Maradana-HQ',1100000,0,'System','2021-09-02 17:47:27','System','2021-03-20 10:55:35'),
(6,'CME','Chief Mechanical Engineer Sub Department','Ratmalana',1100000,0,'System','2021-03-20 10:55:35','System','2021-03-20 10:55:35'),
(7,'CEM','Chief Engineer Motive Power Sub Department','Dematagoda',1100000,0,'System','2021-03-20 10:55:35','System','2021-03-20 10:55:35'),
(8,'CEW','Chief Engineer Way and Works Sub Department','Maradana',1100000,0,'System','2021-09-20 19:25:52','System','2021-03-20 10:55:35'),
(9,'CST','Chief Engineer Signal and Telecommunication Sub Department','Dematagoda',1100000,0,'System','2021-12-07 02:11:18','System','2021-03-20 10:55:35'),
(10,'GTR','German Technical Training Center','Ratmalana',1100000,0,'System','2021-08-24 13:50:05','System','2021-03-20 10:55:35'),
(11,'RPF','Superintendent of Railway Security Office','Colombo Fort',1100000,0,'System','2021-09-02 15:52:13','System','2021-03-20 10:55:35');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`role_id`) values 
(6,'john_doe',1),
(7,'mary_smith',2),
(8,'admin_user',3),
(9,'helpdesk_director',4),
(10,'tech_support',5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
