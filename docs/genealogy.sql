# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: repo.triones.org (MySQL 5.5.53-MariaDB)
# Database: tii_genealogy
# Generation Time: 2017-05-03 14:03:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table gy_acl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_acl`;

CREATE TABLE `gy_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `gmt_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_acl_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_acl_group`;

CREATE TABLE `gy_acl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `gmt_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_acl_group_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_acl_group_tokens`;

CREATE TABLE `gy_acl_group_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_acl_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_acl_user`;

CREATE TABLE `gy_acl_user` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gmt_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_acl_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_acl_user_groups`;

CREATE TABLE `gy_acl_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_acl_user_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_acl_user_tokens`;

CREATE TABLE `gy_acl_user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_article`;

CREATE TABLE `gy_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章';



# Dump of table gy_article_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_article_category`;

CREATE TABLE `gy_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_attachment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_attachment`;

CREATE TABLE `gy_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `ext` varchar(32) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `gmt_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`filename`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_clansman
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_clansman`;

CREATE TABLE `gy_clansman` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `seniority_word` varchar(2) NOT NULL DEFAULT '' COMMENT '辈份字',
  `seniority` int(11) NOT NULL DEFAULT '0' COMMENT '世数',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名字',
  `former_name` varchar(255) DEFAULT NULL COMMENT '曾用名（字）',
  `alias_name` varchar(255) DEFAULT NULL COMMENT '号',
  `bron_date` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `bron_place` varchar(255) DEFAULT NULL COMMENT '出生地',
  `dead_date` varchar(255) DEFAULT NULL COMMENT '逝世日期',
  `buried_place` varchar(255) DEFAULT NULL COMMENT '安葬地',
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `ancestral` varchar(255) DEFAULT NULL COMMENT '祖居地',
  `settlement` varchar(255) DEFAULT NULL COMMENT '定居地',
  `temporary_land` varchar(255) DEFAULT NULL COMMENT '暂住地',
  `contact` varchar(1024) DEFAULT NULL COMMENT '联系方式',
  `remark` text COMMENT '备注',
  `adopted_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '出继（出绍给）',
  `preparer` varchar(25) DEFAULT NULL COMMENT '填表人',
  `oraler` varchar(25) DEFAULT NULL COMMENT '口述人',
  `created_date` datetime DEFAULT NULL COMMENT '填表时间',
  `gmt_created` datetime DEFAULT NULL COMMENT '入库时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录每个族人资料';



# Dump of table gy_configure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_configure`;

CREATE TABLE `gy_configure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `gmt_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_oplog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_oplog`;

CREATE TABLE `gy_oplog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `msg` varchar(255) NOT NULL DEFAULT '',
  `extra` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gmt_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gy_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gy_user`;

CREATE TABLE `gy_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL DEFAULT '',
  `salt_hash` varchar(32) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `gmt_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
