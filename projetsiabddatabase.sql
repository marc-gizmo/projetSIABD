-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 19 Janvier 2013 à 16:41
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `projetsiabddatabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnesdbs`
--

DROP TABLE IF EXISTS `abonnesdbs`;
CREATE TABLE IF NOT EXISTS `abonnesdbs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `theme` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `theme` (`theme`),
  KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `commentsdbs`
--

DROP TABLE IF EXISTS `commentsdbs`;
CREATE TABLE IF NOT EXISTS `commentsdbs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `messageId` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `content` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `messageId` (`messageId`),
  KEY `author` (`author`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `likesdbs`
--

DROP TABLE IF EXISTS `likesdbs`;
CREATE TABLE IF NOT EXISTS `likesdbs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `messageApproved` int(11) NOT NULL,
  `liker` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `messageApproved` (`messageApproved`),
  KEY `liker` (`liker`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Structure de la table `messagesdbs`
--

DROP TABLE IF EXISTS `messagesdbs`;
CREATE TABLE IF NOT EXISTS `messagesdbs` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `author` int(11) DEFAULT NULL,
  `content` varchar(1000) NOT NULL,
  `theme` int(11) DEFAULT NULL,
  `censored` int(11) NOT NULL,
  `important` int(11) NOT NULL,
  PRIMARY KEY (`messageID`),
  KEY `author` (`author`),
  KEY `theme` (`theme`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_applications`
--

DROP TABLE IF EXISTS `my_aspnet_applications`;
CREATE TABLE IF NOT EXISTS `my_aspnet_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `my_aspnet_applications`
--

INSERT INTO `my_aspnet_applications` (`id`, `name`, `description`) VALUES
(1, '/', 'MySQL Role provider');

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_membership`
--

DROP TABLE IF EXISTS `my_aspnet_membership`;
CREATE TABLE IF NOT EXISTS `my_aspnet_membership` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `Email` varchar(128) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `Password` varchar(128) NOT NULL,
  `PasswordKey` char(32) DEFAULT NULL,
  `PasswordFormat` tinyint(4) DEFAULT NULL,
  `PasswordQuestion` varchar(255) DEFAULT NULL,
  `PasswordAnswer` varchar(255) DEFAULT NULL,
  `IsApproved` tinyint(1) DEFAULT NULL,
  `LastActivityDate` datetime DEFAULT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  `LastPasswordChangedDate` datetime DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `IsLockedOut` tinyint(1) DEFAULT NULL,
  `LastLockedOutDate` datetime DEFAULT NULL,
  `FailedPasswordAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAttemptWindowStart` datetime DEFAULT NULL,
  `FailedPasswordAnswerAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAnswerAttemptWindowStart` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='2';

--
-- Contenu de la table `my_aspnet_membership`
--

INSERT INTO `my_aspnet_membership` (`userId`, `Email`, `Comment`, `Password`, `PasswordKey`, `PasswordFormat`, `PasswordQuestion`, `PasswordAnswer`, `IsApproved`, `LastActivityDate`, `LastLoginDate`, `LastPasswordChangedDate`, `CreationDate`, `IsLockedOut`, `LastLockedOutDate`, `FailedPasswordAttemptCount`, `FailedPasswordAttemptWindowStart`, `FailedPasswordAnswerAttemptCount`, `FailedPasswordAnswerAttemptWindowStart`) VALUES
(0, 'delete', '', '28E9dVFPzQ2/ILHxKz7kO5Q7nBTkwhdqvBvQRnPHb24=', '1GlGKTyWiUZtoMJXhluyHA==', 1, NULL, NULL, 1, '2013-01-19 17:31:33', '2013-01-19 17:31:33', '2013-01-19 17:31:33', '2013-01-19 17:31:33', 1, '2013-01-19 17:31:33', 0, '2013-01-19 17:31:33', 0, '2013-01-19 17:31:33'),
(1, 'admin@coucou.net', NULL, 'qiqgUuvMpK2bUGlzT7YhDXnKuRWqQoOjAy3awL+/xJg=', 'FFoJSPR/AwDNw1lYZ6xHmw==', 1, NULL, NULL, 1, '2013-01-19 17:36:15', '2013-01-19 17:36:15', '2013-01-09 16:30:49', '2013-01-09 16:30:49', 0, '2013-01-09 16:30:49', 0, '2013-01-09 16:30:49', 0, '2013-01-09 16:30:49'),
(2, 'patron@coucou.net', NULL, 'mN8Vujgu0PNO+2ivcju3YedSzfyG08kSg3xNL6AoqYE=', '08VoizB/MW9DLlr5HBJIKQ==', 1, NULL, NULL, 1, '2013-01-18 23:13:10', '2013-01-18 23:13:10', '2013-01-09 16:33:01', '2013-01-09 16:33:01', 0, '2013-01-09 16:33:01', 0, '2013-01-09 16:33:01', 0, '2013-01-09 16:33:01'),
(3, 'User1@coucou.net', '', 'OO2Y76febxIGUD2MBba2VjscaM8BIzPg2/AQCSeQWRY=', 'WZui3o+Pg8rlAiu/gTaXGA==', 1, NULL, NULL, 1, '2013-01-09 16:33:47', '2013-01-09 16:33:47', '2013-01-09 16:33:47', '2013-01-09 16:33:47', 0, '2013-01-09 16:33:47', 3, '2013-01-19 16:12:37', 0, '2013-01-09 16:33:47'),
(4, 'user2@coucou.net', NULL, 'OO2Y76febxIGUD2MBba2VjscaM8BIzPg2/AQCSeQWRY=', 'WZui3o+Pg8rlAiu/gTaXGA==', 1, NULL, NULL, 1, '2013-01-09 16:34:12', '2013-01-09 16:34:12', '2013-01-09 16:34:12', '2013-01-09 16:34:12', 0, '2013-01-09 16:34:12', 0, '2013-01-09 16:34:12', 0, '2013-01-09 16:34:12');

--
-- Déclencheurs `my_aspnet_membership`
--
DROP TRIGGER IF EXISTS `delete_user`;
DELIMITER //
CREATE TRIGGER `delete_user` BEFORE DELETE ON `my_aspnet_membership`
 FOR EACH ROW BEGIN
UPDATE messagesdbs SET author = 0 WHERE author=OLD.userId;
UPDATE commentsdbs SET author = 0 WHERE author=OLD.userId;
UPDATE likesdbs SET liker = 0 WHERE liker=OLD.userId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_profiles`
--

DROP TABLE IF EXISTS `my_aspnet_profiles`;
CREATE TABLE IF NOT EXISTS `my_aspnet_profiles` (
  `userId` int(11) NOT NULL,
  `valueindex` longtext,
  `stringdata` longtext,
  `binarydata` longblob,
  `lastUpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_roles`
--

DROP TABLE IF EXISTS `my_aspnet_roles`;
CREATE TABLE IF NOT EXISTS `my_aspnet_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- Contenu de la table `my_aspnet_roles`
--

INSERT INTO `my_aspnet_roles` (`id`, `applicationId`, `name`) VALUES
(1, 1, 'Administrateur'),
(2, 1, 'Boss');

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_schemaversion`
--

DROP TABLE IF EXISTS `my_aspnet_schemaversion`;
CREATE TABLE IF NOT EXISTS `my_aspnet_schemaversion` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `my_aspnet_schemaversion`
--

INSERT INTO `my_aspnet_schemaversion` (`version`) VALUES
(8),
(8),
(8);

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_sessioncleanup`
--

DROP TABLE IF EXISTS `my_aspnet_sessioncleanup`;
CREATE TABLE IF NOT EXISTS `my_aspnet_sessioncleanup` (
  `LastRun` datetime NOT NULL,
  `IntervalMinutes` int(11) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  PRIMARY KEY (`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_sessions`
--

DROP TABLE IF EXISTS `my_aspnet_sessions`;
CREATE TABLE IF NOT EXISTS `my_aspnet_sessions` (
  `SessionId` varchar(191) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  `Created` datetime NOT NULL,
  `Expires` datetime NOT NULL,
  `LockDate` datetime NOT NULL,
  `LockId` int(11) NOT NULL,
  `Timeout` int(11) NOT NULL,
  `Locked` tinyint(1) NOT NULL,
  `SessionItems` longblob,
  `Flags` int(11) NOT NULL,
  PRIMARY KEY (`SessionId`,`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_users`
--

DROP TABLE IF EXISTS `my_aspnet_users`;
CREATE TABLE IF NOT EXISTS `my_aspnet_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `isAnonymous` tinyint(1) NOT NULL DEFAULT '1',
  `lastActivityDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `my_aspnet_users`
--

INSERT INTO `my_aspnet_users` (`id`, `applicationId`, `name`, `isAnonymous`, `lastActivityDate`) VALUES
(0, 1, 'Utilisateur Supprimé', 0, '2013-01-19 17:31:33'),
(1, 1, 'Administrateur', 0, '2013-01-19 17:36:15'),
(2, 1, 'Patron', 0, '2013-01-18 23:13:10'),
(3, 1, 'User1', 0, '2013-01-09 16:33:47'),
(4, 1, 'User2', 0, '2013-01-09 16:34:12');

-- --------------------------------------------------------

--
-- Structure de la table `my_aspnet_usersinroles`
--

DROP TABLE IF EXISTS `my_aspnet_usersinroles`;
CREATE TABLE IF NOT EXISTS `my_aspnet_usersinroles` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Contenu de la table `my_aspnet_usersinroles`
--

INSERT INTO `my_aspnet_usersinroles` (`userId`, `roleId`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `themesdbs`
--

DROP TABLE IF EXISTS `themesdbs`;
CREATE TABLE IF NOT EXISTS `themesdbs` (
  `themeId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`themeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `my_aspnet_usersinroles`
--

INSERT INTO `themesdbs` (`themeId`, `name`) VALUES
(1, 'defaut');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `abonnesdbs`
--
ALTER TABLE `abonnesdbs`
  ADD CONSTRAINT `abonnesdbs_ibfk_1` FOREIGN KEY (`theme`) REFERENCES `themesdbs` (`themeId`) ON DELETE CASCADE,
  ADD CONSTRAINT `abonnesdbs_ibfk_2` FOREIGN KEY (`user`) REFERENCES `my_aspnet_membership` (`userId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commentsdbs`
--
ALTER TABLE `commentsdbs`
  ADD CONSTRAINT `commentsdbs_ibfk_3` FOREIGN KEY (`author`) REFERENCES `my_aspnet_membership` (`userId`) ON DELETE SET NULL,
  ADD CONSTRAINT `commentsdbs_ibfk_1` FOREIGN KEY (`messageId`) REFERENCES `messagesdbs` (`messageID`) ON DELETE CASCADE;

--
-- Contraintes pour la table `likesdbs`
--
ALTER TABLE `likesdbs`
  ADD CONSTRAINT `likesdbs_ibfk_6` FOREIGN KEY (`messageApproved`) REFERENCES `messagesdbs` (`messageID`) ON DELETE CASCADE,
  ADD CONSTRAINT `likesdbs_ibfk_5` FOREIGN KEY (`liker`) REFERENCES `my_aspnet_membership` (`userId`) ON DELETE SET NULL;

--
-- Contraintes pour la table `messagesdbs`
--
ALTER TABLE `messagesdbs`
  ADD CONSTRAINT `messagesdbs_ibfk_3` FOREIGN KEY (`author`) REFERENCES `my_aspnet_membership` (`userId`) ON DELETE SET NULL,
  ADD CONSTRAINT `messagesdbs_ibfk_2` FOREIGN KEY (`theme`) REFERENCES `themesdbs` (`themeId`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
