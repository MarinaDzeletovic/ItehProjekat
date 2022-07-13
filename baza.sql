/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - prodavnica_tehnike
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prodavnica_tehnike` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `prodavnica_tehnike`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `executed` tinyint(4) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_756f53ab9466eb52a52619ee019` (`userId`),
  CONSTRAINT `FK_756f53ab9466eb52a52619ee019` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cart` */

insert  into `cart`(`id`,`userId`,`executed`,`adress`,`phone`) values 
(12,1,0,'Beogradska 7','0628916761');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`timestamp`,`name`) values 
(1,1616683511479,'createUser1616683511479'),
(2,1616683958546,'createProduct1616683958546'),
(3,1616684092971,'createCart1616684092971'),
(4,1616684169908,'updateOrder1616684169908'),
(5,1617194626270,'AddedUsernameToUserAndExecutedColumnToCart1617194626270'),
(6,1617477082034,'AddedPhoneAndAdressToCart1617477082034');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `ammount` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`cartId`),
  KEY `FK_fe3963d525b2ee03ba471953a7c` (`cartId`),
  CONSTRAINT `FK_88991860e839c6153a7ec878d39` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_fe3963d525b2ee03ba471953a7c` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order` */

insert  into `order`(`ammount`,`productId`,`cartId`) values 
(2,12,12);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `productCategoryId` int(11) DEFAULT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_618194d24a7ea86a165d7ec628e` (`productCategoryId`),
  CONSTRAINT `FK_618194d24a7ea86a165d7ec628e` FOREIGN KEY (`productCategoryId`) REFERENCES `product_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`description`,`price`,`productCategoryId`,`picture`) values 
(12,'Samsung galaxy S10','6GB ram, octa-core ...',70000,2,'download.jpg'),
(13,'Samsung Smart televizor 43\" UE43TU8072UXXH','Dijagolana odličnog smart televizora od 43\"\n4K UHD rezolucija sa 4 puta više piksela\nCrystal 4K procesorska snaga za jasniji prikaz slika\nA klasa energetske efikasnosti\nTizen operativni sistem',50000,1,'download (1).jpg');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_category` */

insert  into `product_category`(`id`,`name`) values 
(1,'televizor'),
(2,'telefon'),
(3,'laptop'),
(4,'slusalice'),
(5,'tastatura');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`firstName`,`lastName`,`category`,`password`,`username`) values 
(1,'a','a','admin','/1rBkZBCSx2I+UGe+UmuVriRDJwWOeh13xo7L6alJlo=','a'),
(2,'','','','/1rBkZBCSx2I+UGe+UmuVg+Tu5Tj7OdyyovAe6mRtCM=','b'),
(3,'c','c','','/1rBkZBCSx2I+UGe+UmuVl/1c+ZBuLvZ8SpOBPaRWNs=','c');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
