/*
NaviCat Premium v16.3.8 (64 bit)
MySQL - 8 -log : Database - rent
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rent` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rent`;

/*Table structure for table `apply` */

DROP TABLE IF EXISTS `apply`;

CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `apply` */


/*Table structure for table `applyout` */

DROP TABLE IF EXISTS `applyout`;

CREATE TABLE `applyout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `applyout` */

INSERT INTO `applyout`(`id`, `house_id`, `address`, `status`, `userlist_id`) VALUES 
(7, '1', '123 Main Street, Apt 301', 'Approved', 3),
(8, '1', '123 Main Street, Apt 301', 'Approved', 2),
(9, '2', '456 Oak Street, Apt 402', 'Pending', 4),
(10, '3', '789 Pine Avenue, Apt 201', 'Approved', 5),
(11, '4', '101 Maple Street, Apt 501', 'Rejected', 6),
(12, '5', '202 Elm Street, Apt 102', 'Pending', 7),
(13, '6', '303 Birch Road, Apt 203', 'Approved', 8);

/*Table structure for table `checkout` */

DROP TABLE IF EXISTS `checkout`;

CREATE TABLE `checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `checkout` */

INSERT INTO `checkout`(`id`, `house_id`, `address`, `status`, `userlist_id`) VALUES 
(6, '1', '123 Main Street, Apt 301', 'Terminated', 3),
(7, '1', '123 Main Street, Apt 301', 'Terminated', 3),
(8, '1', '123 Main Street, Apt 301', 'Terminated', 3),
(9, '1', '123 Main Street, Apt 301', 'Terminated', 2),
(10, '2', '456 Oak Street, Apt 402', 'Terminated', 4),
(11, '3', '789 Pine Avenue, Apt 201', 'Terminated', 5),
(12, '4', '101 Maple Street, Apt 501', 'Terminated', 6);

/*Table structure for table `agreement` */

DROP TABLE IF EXISTS `agreement`;

CREATE TABLE `agreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lease` varchar(255) DEFAULT NULL,
  `lease_idcard` varchar(255) DEFAULT NULL,
  `tenant` varchar(255) DEFAULT NULL,
  `tenant_idcard` varchar(255) DEFAULT NULL,
  `fromdate` varchar(255) DEFAULT NULL,
  `todate` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `house_id` varchar(255) DEFAULT NULL,
  `payday` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `agreement` */

INSERT INTO `agreement`(`id`, `lease`, `lease_idcard`, `tenant`, `tenant_idcard`, `fromdate`, `todate`, `price`, `address`, `house_id`, `payday`) VALUES 
(14, 'Landlord Me', 'ID00001', 'John Doe', 'ID12345', '2024-01-04', '2025-01-01', 1100, '123 Main Street, Apt 301', '1', 2),
(15, 'Landlord Me', 'ID00001', 'Jane Smith', 'ID67890', '2024-01-04', '2024-10-03', 2500, '456 Oak Street, Apt 201', '3', 2),
(16, 'Landlord Me', 'ID00001', 'Emily Johnson', 'ID23456', '2024-02-01', '2025-02-01', 1100, '456 Oak Street, Apt 402', '2', 2),
(17, 'Landlord Me', 'ID00001', 'Michael Brown', 'ID34567', '2024-03-01', '2025-03-01', 1200, '789 Pine Avenue, Apt 201', '5', 2),
(18, 'Landlord Me', 'ID00001', 'Sarah Davis', 'ID45678', '2024-04-01', '2025-04-01', 1300, '101 Maple Street, Apt 501', '6', 2),
(19, 'Landlord Me', 'ID00001', 'David Wilson', 'ID56789', '2024-05-01', '2025-05-01', 1400, '202 Elm Street, Apt 102', '7', 2),
(20, 'Landlord Me', 'ID00001', 'Laura Miller', 'ID78901', '2024-06-01', '2025-06-01', 1500, '101 Maple Street, Apt 501', '4', 2);  -- Changed house_id from '8' to '4'

/*Table structure for table `houselist` */

DROP TABLE IF EXISTS `houselist`;

CREATE TABLE `houselist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `houselist` */

INSERT INTO `houselist`(`id`, `houseid`, `address`, `area`, `price`, `status`) VALUES 
(1, '1', '123 Main Street, Apt 301', 20, 1000, 'Rented'),
(2, '2', '456 Oak Street, Apt 402', 22, 1100, 'Not Rented'),
(3, '3', '456 Oak Street, Apt 201', 45, 2500, 'Rented'),
(4, '4', '101 Maple Street, Apt 501', 40, 2300, 'Rented'),  -- Updated status to 'Rented'
(5, '5', '789 Pine Avenue, Apt 201', 30, 1200, 'Rented'),
(6, '6', '101 Maple Street, Apt 501', 35, 1300, 'Not Rented'),
(7, '7', '202 Elm Street, Apt 102', 25, 1400, 'Rented');

/*Table structure for table `paid` */

DROP TABLE IF EXISTS `paid`;

CREATE TABLE `paid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `paydate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paid` */

INSERT INTO `paid`(`id`, `house_id`, `address`, `date`, `price`, `paydate`, `name`, `userlist_id`, `status`) VALUES 
(3, '1', '123 Main Street, Apt 301', '2024-01-04', 1100, '2024-01-22', 'John Doe', 2, 'Rent Paid'),
(4, '1', '123 Main Street, Apt 301', '2024-02-02', 1200, '2024-01-22', 'John Doe', 2, 'Rent Paid'),
(5, '3', '456 Oak Street, Apt 201', '2024-01-23', 2500, '2024-01-22', 'Jane Smith', 3, 'Rent Paid'),
(6, '2', '456 Oak Street, Apt 402', '2024-02-01', 1100, '2024-02-15', 'Emily Johnson', 4, 'Rent Paid'),
(7, '5', '789 Pine Avenue, Apt 201', '2024-03-01', 1200, '2024-03-15', 'Michael Brown', 5, 'Rent Paid'),
(8, '7', '202 Elm Street, Apt 102', '2024-04-01', 1400, '2024-04-15', 'David Wilson', 7, 'Rent Paid'),
(9, '5', '789 Pine Avenue, Apt 201', '2024-04-01', 1200, '2024-04-15', 'Michael Brown', 5, 'Rent Paid');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

INSERT INTO `schedule`(`id`, `date`, `content`) VALUES 
(2, '2024-01-04', 'Today is rent collection day'),
(3, '2024-02-01', 'Reminder: Rent collection day'),
(4, '2024-03-01', 'Maintenance check scheduled'),
(5, '2024-04-01', 'Rent collection day'),
(6, '2024-05-01', 'Fire safety inspection'),
(7, '2024-06-01', 'Rent collection day'),
(8, '2024-07-01', 'Community meeting');

/*Table structure for table `solve` */

DROP TABLE IF EXISTS `solve`;

CREATE TABLE `solve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `solve` */

INSERT INTO `solve`(`id`, `house_id`, `address`, `date`, `detail`, `name`, `userlist_id`, `status`) VALUES 
(4, '1', '123 Main Street, Apt 301', '2024-01-24', 'Light is broken', 'John Doe', 2, 'Resolved'),
(6, '1', '123 Main Street, Apt 301', '2024-01-22', 'Faucet is broken', 'John Doe', 2, 'Resolved'),
(7, '1', '123 Main Street, Apt 301', '2024-02-09', 'Door lock is broken', 'John Doe', 2, 'Resolved'),
(8, '2', '456 Oak Street, Apt 402', '2024-02-15', 'Heating not working', 'Emily Johnson', 4, 'Resolved'),
(9, '3', '456 Oak Street, Apt 201', '2024-03-10', 'Water leak', 'Jane Smith', 3, 'Resolved'),
(10, '5', '789 Pine Avenue, Apt 201', '2024-03-20', 'Air conditioner broken', 'Michael Brown', 5, 'Resolved'),
(11, '7', '202 Elm Street, Apt 102', '2024-04-05', 'Broken window', 'David Wilson', 7, 'Resolved');

/*Table structure for table `topaid` */

DROP TABLE IF EXISTS `topaid`;

CREATE TABLE `topaid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `topaid` */


/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

INSERT INTO `user`(`id`, `username`, `password`, `type`) VALUES 
(1, 'admin', 'admin', 'admin'),
(2, 'user', '123456', 'tenant'),
(3, 'johndoe', '123456', 'tenant'),
(4, 'emilyj', '123456', 'tenant'),
(5, 'michaelb', '123456', 'tenant'),
(6, 'sarahd', '123456', 'tenant'),
(7, 'davidw', '123456', 'tenant'),
(8, 'lauram', '123456', 'tenant');

/*Table structure for table `userlist` */

DROP TABLE IF EXISTS `userlist`;

CREATE TABLE `userlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userlist` */

INSERT INTO `userlist`(`id`, `name`, `idcard`, `phone`, `user_id`) VALUES 
(2, 'John Doe', 'ID12345', '12165434090', 3),
(3, 'Jane Smith', 'ID67890', '12165434091', 2),
(4, 'Emily Johnson', 'ID23456', '12165434092', 4),
(5, 'Michael Brown', 'ID34567', '12165434093', 5),
(6, 'Sarah Davis', 'ID45678', '12165434094', 6),
(7, 'David Wilson', 'ID56789', '12165434095', 7),
(8, 'Laura Miller', 'ID78901', '12165434096', 8);

/*Table structure for table `wrong` */

DROP TABLE IF EXISTS `wrong`;

CREATE TABLE `wrong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wrong` */


/*Table structure for table `rentlist` */

DROP TABLE IF EXISTS `rentlist`;

CREATE TABLE `rentlist` (
  `rentid` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rentlist` */

INSERT INTO `rentlist`(`rentid`, `house_id`, `price`, `address`, `userlist_id`, `contract_id`) VALUES 
(11, '1', 1000, '123 Main Street, Apt 301', 2, 14),
(12, '3', 2500, '456 Oak Street, Apt 201', 3, 15),
(13, '2', 1100, '456 Oak Street, Apt 402', 4, 16),
(14, '5', 1200, '789 Pine Avenue, Apt 201', 5, 17),
(15, '6', 1300, '101 Maple Street, Apt 501', 6, 18),
(16, '7', 1400, '202 Elm Street, Apt 102', 7, 19),
(17, '4', 1500, '101 Maple Street, Apt 501', 8, 20);  

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
