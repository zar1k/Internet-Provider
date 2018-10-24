--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;

CREATE TABLE `contact_details` (
  `id` int(11) NOT NULL,
  `city` varchar(45) CHARACTER SET utf8 NOT NULL,
  `street` varchar(45) CHARACTER SET utf8 NOT NULL,
  `home` varchar(45) CHARACTER SET utf8 NOT NULL,
  `apartment` varchar(45) CHARACTER SET utf8 NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

--
-- Table structure for table `tariffs`
--

DROP TABLE IF EXISTS `tariffs`;

CREATE TABLE `tariffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `services_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tariffs_services1_idx` (`services_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `blocked` tinyint(4) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `contact_details_id` int(11) NOT NULL,
  `accounts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_users_roles_idx` (`roles_id`),
  KEY `fk_users_contact_details1_idx` (`contact_details_id`),
  KEY `fk_users_accounts1_idx` (`accounts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `users_has_tariffs`
--

DROP TABLE IF EXISTS `users_has_tariffs`;

CREATE TABLE `users_has_tariffs` (
  `users_id` int(11) NOT NULL,
  `tariffs_id` int(11) NOT NULL,
  PRIMARY KEY (`users_id`,`tariffs_id`),
  KEY `fk_users_has_tariffs_tariffs1_idx` (`tariffs_id`),
  KEY `fk_users_has_tariffs_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
