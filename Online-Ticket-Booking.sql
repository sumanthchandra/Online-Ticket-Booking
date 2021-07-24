create schema movie;

use movie;

CREATE TABLE `user` (
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `email` varchar(40) NOT NULL,
  `user_password` varchar(25) DEFAULT NULL,
  `creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `event` (
  `eventName` varchar(40) DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `eventTime` time DEFAULT NULL,
  `venue` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(40) DEFAULT NULL,
  `eventName` varchar(40) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `cardNumber` varchar(25) DEFAULT NULL,
  `cardType` varchar(10) DEFAULT NULL,
  `date_of_booking` date DEFAULT NULL,
  `time_of_booking` time DEFAULT NULL,
  `ticket_status` varchar(20) DEFAULT 'BOOKED',
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=100024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `resale` (
  `id` int(11) DEFAULT NULL,
  `seller_email` varchar(40) DEFAULT NULL,
  `eventName` varchar(40) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

