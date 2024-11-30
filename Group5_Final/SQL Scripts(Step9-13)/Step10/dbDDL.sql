/*
NaviCat Premium v16.3.8 (64 bit)
MySQL - 8 -log : Database - rent
*********************************************************************
*/

CREATE DATABASE `rent`;
USE `rent`;

/*Table structure for table `apply` */
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

/*Table structure for table `applyout` */
CREATE TABLE `applyout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `checkout` */
CREATE TABLE `checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `agreement` */
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

/*Table structure for table `houselist` */
CREATE TABLE `houselist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*Table structure for table `paid` */
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



/*Table structure for table `schedule` */
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*Table structure for table `solve` */
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


/*Table structure for table `topaid` */
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




/*Table structure for table `user` */
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*Table structure for table `userlist` */
CREATE TABLE `userlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*Table structure for table `wrong` */
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



/*Table structure for table `rentlist` */
CREATE TABLE `rentlist` (
  `rentid` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `userlist_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Triggers
-- Trigger to update house status after adding a new agreement:
CREATE TRIGGER after_insert_agreement
AFTER INSERT ON agreement
FOR EACH ROW
BEGIN
    UPDATE houselist
    SET status = 'Rented'
    WHERE houseid = NEW.house_id;
END;


-- Functions 
-- Procedure to calculate total rent collected for a given house:
CREATE PROCEDURE get_total_rent_collected(IN houseID VARCHAR(255), OUT totalRent DOUBLE)
BEGIN
    SELECT SUM(price)
    INTO totalRent
    FROM paid
    WHERE house_id = houseID;
END;


-- Views
-- View for all rented houses with tenant details:
CREATE VIEW rented_houses AS
SELECT h.houseid, h.address, h.area, h.price, u.name AS tenant_name
FROM houselist h
JOIN rentlist r ON h.houseid = r.house_id
JOIN userlist u ON r.userlist_id = u.id
WHERE h.status = 'Rented';




