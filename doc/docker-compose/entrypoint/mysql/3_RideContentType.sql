# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.24-MariaDB-1~jessie)
# Database: ezp
# Generation Time: 2017-06-26 18:32:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ezapprove_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezapprove_items`;

CREATE TABLE `ezapprove_items` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_process_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezbasket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezbasket`;

CREATE TABLE `ezbasket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezbasket_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezbinaryfile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezbinaryfile`;

CREATE TABLE `ezbinaryfile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `download_count` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `mime_type` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcobj_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcobj_state`;

CREATE TABLE `ezcobj_state` (
  `default_language_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_identifier` (`group_id`,`identifier`),
  KEY `ezcobj_state_lmask` (`language_mask`),
  KEY `ezcobj_state_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcobj_state` WRITE;
/*!40000 ALTER TABLE `ezcobj_state` DISABLE KEYS */;

INSERT INTO `ezcobj_state` (`default_language_id`, `group_id`, `id`, `identifier`, `language_mask`, `priority`)
VALUES
	(2,2,1,'not_locked',3,0),
	(2,2,2,'locked',3,1);

/*!40000 ALTER TABLE `ezcobj_state` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcobj_state_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcobj_state_group`;

CREATE TABLE `ezcobj_state_group` (
  `default_language_id` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_group_identifier` (`identifier`),
  KEY `ezcobj_state_group_lmask` (`language_mask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcobj_state_group` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group` DISABLE KEYS */;

INSERT INTO `ezcobj_state_group` (`default_language_id`, `id`, `identifier`, `language_mask`)
VALUES
	(2,2,'ez_lock',3);

/*!40000 ALTER TABLE `ezcobj_state_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcobj_state_group_language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcobj_state_group_language`;

CREATE TABLE `ezcobj_state_group_language` (
  `contentobject_state_group_id` int(11) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  `real_language_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentobject_state_group_id`,`real_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcobj_state_group_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group_language` DISABLE KEYS */;

INSERT INTO `ezcobj_state_group_language` (`contentobject_state_group_id`, `description`, `language_id`, `name`, `real_language_id`)
VALUES
	(2,'',3,'Lock',2);

/*!40000 ALTER TABLE `ezcobj_state_group_language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcobj_state_language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcobj_state_language`;

CREATE TABLE `ezcobj_state_language` (
  `contentobject_state_id` int(11) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcobj_state_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_language` DISABLE KEYS */;

INSERT INTO `ezcobj_state_language` (`contentobject_state_id`, `description`, `language_id`, `name`)
VALUES
	(1,'',3,'Not locked'),
	(2,'',3,'Locked');

/*!40000 ALTER TABLE `ezcobj_state_language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcobj_state_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcobj_state_link`;

CREATE TABLE `ezcobj_state_link` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_state_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentobject_id`,`contentobject_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcobj_state_link` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_link` DISABLE KEYS */;

INSERT INTO `ezcobj_state_link` (`contentobject_id`, `contentobject_state_id`)
VALUES
	(1,1),
	(4,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(41,1),
	(42,1),
	(45,1),
	(49,1),
	(50,1),
	(51,1);

/*!40000 ALTER TABLE `ezcobj_state_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcollab_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_group`;

CREATE TABLE `ezcollab_group` (
  `created` int(11) NOT NULL DEFAULT '0',
  `depth` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_open` int(11) NOT NULL DEFAULT '1',
  `modified` int(11) NOT NULL DEFAULT '0',
  `parent_group_id` int(11) NOT NULL DEFAULT '0',
  `path_string` varchar(255) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcollab_group_depth` (`depth`),
  KEY `ezcollab_group_path` (`path_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_item`;

CREATE TABLE `ezcollab_item` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `data_float1` float NOT NULL DEFAULT '0',
  `data_float2` float NOT NULL DEFAULT '0',
  `data_float3` float NOT NULL DEFAULT '0',
  `data_int1` int(11) NOT NULL DEFAULT '0',
  `data_int2` int(11) NOT NULL DEFAULT '0',
  `data_int3` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `data_text2` longtext NOT NULL,
  `data_text3` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `type_identifier` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_item_group_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_item_group_link`;

CREATE TABLE `ezcollab_item_group_link` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `last_read` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`collaboration_id`,`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_item_message_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_item_message_link`;

CREATE TABLE `ezcollab_item_message_link` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL DEFAULT '0',
  `message_type` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `participant_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_item_participant_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_item_participant_link`;

CREATE TABLE `ezcollab_item_participant_link` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `last_read` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `participant_id` int(11) NOT NULL DEFAULT '0',
  `participant_role` int(11) NOT NULL DEFAULT '1',
  `participant_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`collaboration_id`,`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_item_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_item_status`;

CREATE TABLE `ezcollab_item_status` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `last_read` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`collaboration_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_notification_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_notification_rule`;

CREATE TABLE `ezcollab_notification_rule` (
  `collab_identifier` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_profile`;

CREATE TABLE `ezcollab_profile` (
  `created` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_group` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcollab_simple_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcollab_simple_message`;

CREATE TABLE `ezcollab_simple_message` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `data_float1` float NOT NULL DEFAULT '0',
  `data_float2` float NOT NULL DEFAULT '0',
  `data_float3` float NOT NULL DEFAULT '0',
  `data_int1` int(11) NOT NULL DEFAULT '0',
  `data_int2` int(11) NOT NULL DEFAULT '0',
  `data_int3` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `data_text2` longtext NOT NULL,
  `data_text3` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` varchar(40) NOT NULL DEFAULT '',
  `modified` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcomment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcomment`;

CREATE TABLE `ezcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` bigint(20) NOT NULL,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_key` varchar(32) DEFAULT NULL,
  `ip` varchar(100) NOT NULL,
  `contentobject_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `text` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_session_key_ip` (`user_id`,`session_key`,`ip`),
  KEY `content_parentcomment` (`contentobject_id`,`language_id`,`parent_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcomment_notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcomment_notification`;

CREATE TABLE `ezcomment_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `send_time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcomment_subscriber
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcomment_subscriber`;

CREATE TABLE `ezcomment_subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `hash_string` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcomment_subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcomment_subscription`;

CREATE TABLE `ezcomment_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `subscription_type` varchar(30) NOT NULL,
  `content_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `subscription_time` int(11) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `hash_string` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcontent_language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontent_language`;

CREATE TABLE `ezcontent_language` (
  `disabled` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) NOT NULL DEFAULT '0',
  `locale` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontent_language_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontent_language` WRITE;
/*!40000 ALTER TABLE `ezcontent_language` DISABLE KEYS */;

INSERT INTO `ezcontent_language` (`disabled`, `id`, `locale`, `name`)
VALUES
	(0,2,'eng-GB','English (United Kingdom)');

/*!40000 ALTER TABLE `ezcontent_language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentbrowsebookmark
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentbrowsebookmark`;

CREATE TABLE `ezcontentbrowsebookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcontentbrowsebookmark_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcontentbrowserecent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentbrowserecent`;

CREATE TABLE `ezcontentbrowserecent` (
  `created` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcontentbrowserecent_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcontentclass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentclass`;

CREATE TABLE `ezcontentclass` (
  `always_available` int(11) NOT NULL DEFAULT '0',
  `contentobject_name` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `is_container` int(11) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) NOT NULL DEFAULT '',
  `serialized_description_list` longtext,
  `serialized_name_list` longtext,
  `sort_field` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `url_alias_name` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_version` (`version`),
  KEY `ezcontentclass_identifier` (`identifier`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentclass` WRITE;
/*!40000 ALTER TABLE `ezcontentclass` DISABLE KEYS */;

INSERT INTO `ezcontentclass` (`always_available`, `contentobject_name`, `created`, `creator_id`, `id`, `identifier`, `initial_language_id`, `is_container`, `language_mask`, `modified`, `modifier_id`, `remote_id`, `serialized_description_list`, `serialized_name_list`, `sort_field`, `sort_order`, `url_alias_name`, `version`)
VALUES
	(1,'<short_name|name>',1024392098,14,1,'folder',2,1,2,1448831672,14,'a3d405b81be900468eb153d774f4f0d2','b:0;','a:1:{s:6:\"eng-GB\";s:6:\"Folder\";}',1,1,NULL,0),
	(0,'<short_title|title>',1024392098,14,2,'article',2,1,3,1082454989,14,'c15b600eb9198b1924063b5a68758232',NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Article\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),
	(1,'<name>',1024392098,14,3,'user_group',2,1,3,1048494743,14,'25b4268cdcd01921b808a0d854b877ef',NULL,'a:2:{s:6:\"eng-GB\";s:10:\"User group\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),
	(1,'<first_name> <last_name>',1024392098,14,4,'user',2,0,3,1082018364,14,'40faa822edc579b02c25f6bb7beec3ad',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"User\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),
	(1,'<name>',1031484992,8,5,'image',2,0,3,1048494784,14,'f6df12aa74e36230eb675f364fccd25a',NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),
	(1,'<name>',1052385472,14,12,'file',2,0,3,1052385669,14,'637d58bfddf164627bdfd265733280a0',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),
	(1,'<name>',1498501317,14,13,'ride',2,0,2,1498501865,14,'815ef1f67a433a42d1d578e3eb9454a6','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Ride\";}',2,0,'',0);

/*!40000 ALTER TABLE `ezcontentclass` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentclass_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentclass_attribute`;

CREATE TABLE `ezcontentclass_attribute` (
  `can_translate` int(11) DEFAULT '1',
  `category` varchar(25) NOT NULL DEFAULT '',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `data_float1` double DEFAULT NULL,
  `data_float2` double DEFAULT NULL,
  `data_float3` double DEFAULT NULL,
  `data_float4` double DEFAULT NULL,
  `data_int1` int(11) DEFAULT NULL,
  `data_int2` int(11) DEFAULT NULL,
  `data_int3` int(11) DEFAULT NULL,
  `data_int4` int(11) DEFAULT NULL,
  `data_text1` varchar(50) DEFAULT NULL,
  `data_text2` varchar(50) DEFAULT NULL,
  `data_text3` varchar(50) DEFAULT NULL,
  `data_text4` varchar(255) DEFAULT NULL,
  `data_text5` longtext,
  `data_type_string` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `is_information_collector` int(11) NOT NULL DEFAULT '0',
  `is_required` int(11) NOT NULL DEFAULT '0',
  `is_searchable` int(11) NOT NULL DEFAULT '0',
  `placement` int(11) NOT NULL DEFAULT '0',
  `serialized_data_text` longtext,
  `serialized_description_list` longtext,
  `serialized_name_list` longtext NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_attr_ccid` (`contentclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentclass_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute` DISABLE KEYS */;

INSERT INTO `ezcontentclass_attribute` (`can_translate`, `category`, `contentclass_id`, `data_float1`, `data_float2`, `data_float3`, `data_float4`, `data_int1`, `data_int2`, `data_int3`, `data_int4`, `data_text1`, `data_text2`, `data_text3`, `data_text4`, `data_text5`, `data_type_string`, `id`, `identifier`, `is_information_collector`, `is_required`, `is_searchable`, `placement`, `serialized_data_text`, `serialized_description_list`, `serialized_name_list`, `version`)
VALUES
	(1,'',2,0,0,0,0,255,0,0,0,'New article','','','','','ezstring',1,'title',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Title\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',1,NULL,NULL,NULL,NULL,255,0,NULL,NULL,'Folder',NULL,NULL,NULL,NULL,'ezstring',4,'name',0,1,1,1,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}',0),
	(1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring',6,'name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring',7,'description',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring',8,'first_name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:10:\"First name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring',9,'last_name',0,1,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Last name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(0,'',4,0,0,0,0,0,0,0,0,'','','','','','ezuser',12,'user_account',0,1,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:12:\"User account\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',5,0,0,0,0,150,0,0,0,'','','','',NULL,'ezstring',116,'name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext',117,'caption',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Caption\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezimage',118,'image',0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext',119,'short_description',0,0,1,3,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}',0),
	(1,'',2,0,0,0,0,10,0,0,0,'','','','','','ezrichtext',120,'intro',0,1,1,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Intro\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',2,0,0,0,0,20,0,0,0,'','','','','','ezrichtext',121,'body',0,0,1,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Body\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(0,'',2,0,0,0,0,0,0,0,0,'','','','','','ezboolean',123,'enable_comments',0,0,0,6,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:15:\"Enable comments\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',12,0,0,0,0,0,0,0,0,'New file','','','',NULL,'ezstring',146,'name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',12,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext',147,'description',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',12,0,0,0,0,0,0,0,0,'','','','',NULL,'ezbinaryfile',148,'file',0,1,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',2,0,0,0,0,255,0,0,0,'','','','','','ezstring',152,'short_title',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Short title\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',2,0,0,0,0,0,0,0,0,'','','','','','ezauthor',153,'author',0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:6:\"Author\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',2,0,0,0,0,0,0,0,0,'','','','','','ezobjectrelation',154,'image',0,0,1,7,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',1,NULL,NULL,NULL,NULL,100,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring',155,'short_name',0,0,1,2,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:10:\"Short name\";}',0),
	(1,'',1,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext',156,'description',0,0,1,4,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}',0),
	(1,'',4,0,0,0,0,10,0,0,0,'','','','','','eztext',179,'signature',0,0,1,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Signature\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'',4,0,0,0,0,10,0,0,0,'','','','','','ezimage',180,'image',0,0,0,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),
	(1,'content',13,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring',181,'name',0,1,1,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}',0),
	(0,'content',13,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage',182,'photo',0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Photo\";}',0),
	(1,'content',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext',183,'description',0,1,1,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}',0),
	(0,'content',13,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezselection><options><option id=\"0\" name=\"Beginner\"/><option id=\"1\" name=\"Intermediate\"/><option id=\"2\" name=\"Advanced\"/></options></ezselection>\n','ezselection',184,'level',0,1,1,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:16:\"Difficulty Level\";}',0),
	(0,'content',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation',185,'starting_point',0,1,1,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:14:\"Starting Point\";}',0),
	(0,'content',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezgmaplocation',186,'ending_point',0,1,1,6,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:12:\"Ending Point\";}',0),
	(0,'content',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'ezinteger',187,'length',0,1,1,7,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Length\";}',0),
	(1,'content',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezauthor',188,'author',0,0,1,8,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:6:\"Author\";}',0);

/*!40000 ALTER TABLE `ezcontentclass_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentclass_classgroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentclass_classgroup`;

CREATE TABLE `ezcontentclass_classgroup` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_version` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentclass_classgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_classgroup` DISABLE KEYS */;

INSERT INTO `ezcontentclass_classgroup` (`contentclass_id`, `contentclass_version`, `group_id`, `group_name`)
VALUES
	(1,0,1,'Content'),
	(2,0,1,'Content'),
	(3,0,2,'Users'),
	(4,0,2,'Users'),
	(5,0,3,'Media'),
	(12,0,3,'Media'),
	(13,0,1,'Content');

/*!40000 ALTER TABLE `ezcontentclass_classgroup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentclass_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentclass_name`;

CREATE TABLE `ezcontentclass_name` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_version` int(11) NOT NULL DEFAULT '0',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_locale` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentclass_name` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_name` DISABLE KEYS */;

INSERT INTO `ezcontentclass_name` (`contentclass_id`, `contentclass_version`, `language_id`, `language_locale`, `name`)
VALUES
	(1,0,2,'eng-GB','Folder'),
	(2,0,3,'eng-GB','Article'),
	(3,0,3,'eng-GB','User group'),
	(4,0,3,'eng-GB','User'),
	(5,0,3,'eng-GB','Image'),
	(12,0,3,'eng-GB','File'),
	(13,0,2,'eng-GB','Ride');

/*!40000 ALTER TABLE `ezcontentclass_name` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentclassgroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentclassgroup`;

CREATE TABLE `ezcontentclassgroup` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentclassgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclassgroup` DISABLE KEYS */;

INSERT INTO `ezcontentclassgroup` (`created`, `creator_id`, `id`, `modified`, `modifier_id`, `name`)
VALUES
	(1031216928,14,1,1033922106,14,'Content'),
	(1031216941,14,2,1033922113,14,'Users'),
	(1032009743,14,3,1033922120,14,'Media');

/*!40000 ALTER TABLE `ezcontentclassgroup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentobject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentobject`;

CREATE TABLE `ezcontentobject` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `current_version` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) DEFAULT NULL,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcontentobject_remote_id` (`remote_id`),
  KEY `ezcontentobject_classid` (`contentclass_id`),
  KEY `ezcontentobject_currentversion` (`current_version`),
  KEY `ezcontentobject_lmask` (`language_mask`),
  KEY `ezcontentobject_owner` (`owner_id`),
  KEY `ezcontentobject_pub` (`published`),
  KEY `ezcontentobject_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentobject` WRITE;
/*!40000 ALTER TABLE `ezcontentobject` DISABLE KEYS */;

INSERT INTO `ezcontentobject` (`contentclass_id`, `current_version`, `id`, `initial_language_id`, `language_mask`, `modified`, `name`, `owner_id`, `published`, `remote_id`, `section_id`, `status`)
VALUES
	(1,9,1,2,3,1448889046,'eZ Platform',14,1448889046,'9459d3c29e15006e45197295722c7ade',1,1),
	(3,1,4,2,3,1033917596,'Users',14,1033917596,'f5c88a2209584891056f987fd965b0ba',2,1),
	(4,2,10,2,3,1072180405,'Anonymous User',14,1033920665,'faaeb9be3bd98ed09f606fc16d144eca',2,1),
	(3,1,11,2,3,1033920746,'Guest accounts',14,1033920746,'5f7f0bdb3381d6a461d8c29ff53d908f',2,1),
	(3,1,12,2,3,1033920775,'Administrator users',14,1033920775,'9b47a45624b023b1a76c73b74d704acf',2,1),
	(3,1,13,2,3,1033920794,'Editors',14,1033920794,'3c160cca19fb135f83bd02d911f04db2',2,1),
	(4,3,14,2,3,1301062024,'Administrator User',14,1033920830,'1bb4fe25487f05527efa8bfd394cecc7',2,1),
	(1,1,41,2,3,1060695457,'Media',14,1060695457,'a6e35cbcb7cd6ae4b691f3eee30cd262',3,1),
	(3,1,42,2,3,1072180330,'Anonymous Users',14,1072180330,'15b256dbea2ae72418ff5facc999e8f9',2,1),
	(1,1,45,2,3,1079684190,'Setup',14,1079684190,'241d538ce310074e602f29f49e44e938',4,1),
	(1,1,49,2,3,1080220197,'Images',14,1080220197,'e7ff633c6b8e0fd3531e74c6e712bead',3,1),
	(1,1,50,2,3,1080220220,'Files',14,1080220220,'732a5acd01b51a6fe6eab448ad4138a9',3,1),
	(1,1,51,2,3,1080220233,'Multimedia',14,1080220233,'09082deb98662a104f325aaa8c4933d3',3,1);

/*!40000 ALTER TABLE `ezcontentobject` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentobject_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentobject_attribute`;

CREATE TABLE `ezcontentobject_attribute` (
  `attribute_original_id` int(11) DEFAULT '0',
  `contentclassattribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext,
  `data_type_string` varchar(50) DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(20) NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `sort_key_int` int(11) NOT NULL DEFAULT '0',
  `sort_key_string` varchar(255) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentobject_attribute_co_id_ver_lang_code` (`contentobject_id`,`version`,`language_code`),
  KEY `ezcontentobject_attribute_language_code` (`language_code`),
  KEY `ezcontentobject_classattr_id` (`contentclassattribute_id`),
  KEY `sort_key_int` (`sort_key_int`),
  KEY `sort_key_string` (`sort_key_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentobject_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_attribute` DISABLE KEYS */;

INSERT INTO `ezcontentobject_attribute` (`attribute_original_id`, `contentclassattribute_id`, `contentobject_id`, `data_float`, `data_int`, `data_text`, `data_type_string`, `id`, `language_code`, `language_id`, `sort_key_int`, `sort_key_string`, `version`)
VALUES
	(0,4,1,NULL,NULL,'Welcome to eZ Platform','ezstring',1,'eng-GB',3,0,'welcome to ez platform',9),
	(0,119,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the clean install coming with eZ Platform. It’s a barebone setup of the platform, an excellent foundation to build upon if you want to build from scratch. For more ready to go base designs or demo sites, please check the documentation.</para></section>\n','ezrichtext',2,'eng-GB',3,0,'',9),
	(0,7,4,NULL,NULL,'Main group','ezstring',7,'eng-GB',3,0,'',1),
	(0,6,4,NULL,NULL,'Users','ezstring',8,'eng-GB',3,0,'',1),
	(0,8,10,0,0,'Anonymous','ezstring',19,'eng-GB',3,0,'anonymous',2),
	(0,9,10,0,0,'User','ezstring',20,'eng-GB',3,0,'user',2),
	(0,12,10,0,0,'','ezuser',21,'eng-GB',3,0,'',2),
	(0,6,11,0,0,'Guest accounts','ezstring',22,'eng-GB',3,0,'',1),
	(0,7,11,0,0,'','ezstring',23,'eng-GB',3,0,'',1),
	(0,6,12,0,0,'Administrator users','ezstring',24,'eng-GB',3,0,'',1),
	(0,7,12,0,0,'','ezstring',25,'eng-GB',3,0,'',1),
	(0,6,13,0,0,'Editors','ezstring',26,'eng-GB',3,0,'',1),
	(0,7,13,0,0,'','ezstring',27,'eng-GB',3,0,'',1),
	(0,8,14,0,0,'Administrator','ezstring',28,'eng-GB',3,0,'administrator',3),
	(0,9,14,0,0,'User','ezstring',29,'eng-GB',3,0,'user',3),
	(30,12,14,0,0,'','ezuser',30,'eng-GB',3,0,'',3),
	(0,4,41,0,0,'Media','ezstring',98,'eng-GB',3,0,'',1),
	(0,119,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',99,'eng-GB',3,0,'',1),
	(0,6,42,0,0,'Anonymous Users','ezstring',100,'eng-GB',3,0,'anonymous users',1),
	(0,7,42,0,0,'User group for the anonymous user','ezstring',101,'eng-GB',3,0,'user group for the anonymous user',1),
	(0,155,1,NULL,NULL,'eZ Platform','ezstring',102,'eng-GB',3,0,'ez platform',9),
	(0,155,41,0,0,'','ezstring',103,'eng-GB',3,0,'',1),
	(0,156,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><title ezxhtml:level=\"2\">Welcome to eZ Platform</title><para>Congratulations, you just installed eZ Platform. eZ Platform is the new generation Content Management Platform from eZ Systems and the eZ Community replacing eZ Publish, our previous software.</para><title ezxhtml:level=\"3\">Need some guidance?</title><para>Check out the following resources:</para><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://23\" xlink:show=\"none\">User Manual</link> for eZ Platform (and eZ Studio)</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://24\" xlink:show=\"none\">Technical doc</link> for eZ Platform (and eZ Publish Platform new stack)</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://25\" xlink:show=\"none\">eZ Platform</link> developer tutorial</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://26\" xlink:show=\"none\">Comparison guide</link> between eZ Platform and eZ Publish Platform</title><title ezxhtml:level=\"3\">Contribute to the project?</title><para>Join the community:</para><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://27\" xlink:show=\"none\">Github repositories</link> open to the public</title><title ezxhtml:level=\"4\">Register to the community on <link xlink:href=\"ezurl://28\" xlink:show=\"none\">share.ez.no</link>, the community site, to access forums, tutorials and blogs</title><title ezxhtml:level=\"4\">Join the conversation on <link xlink:href=\"ezurl://29\" xlink:show=\"none\">the eZ Community Slack</link></title><para>Good luck!</para></section>\n','ezrichtext',104,'eng-GB',3,0,'',9),
	(0,156,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',105,'eng-GB',3,0,'',1),
	(0,4,45,0,0,'Setup','ezstring',123,'eng-GB',3,0,'setup',1),
	(0,155,45,0,0,'','ezstring',124,'eng-GB',3,0,'',1),
	(0,119,45,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',125,'eng-GB',3,0,'',1),
	(0,156,45,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',126,'eng-GB',3,0,'',1),
	(0,4,49,0,0,'Images','ezstring',142,'eng-GB',3,0,'images',1),
	(0,155,49,0,0,'','ezstring',143,'eng-GB',3,0,'',1),
	(0,119,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',144,'eng-GB',3,0,'',1),
	(0,156,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',145,'eng-GB',3,0,'',1),
	(0,4,50,0,0,'Files','ezstring',147,'eng-GB',3,0,'files',1),
	(0,155,50,0,0,'','ezstring',148,'eng-GB',3,0,'',1),
	(0,119,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',149,'eng-GB',3,0,'',1),
	(0,156,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',150,'eng-GB',3,0,'',1),
	(0,4,51,0,0,'Multimedia','ezstring',152,'eng-GB',3,0,'multimedia',1),
	(0,155,51,0,0,'','ezstring',153,'eng-GB',3,0,'',1),
	(0,119,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',154,'eng-GB',3,0,'',1),
	(0,156,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',155,'eng-GB',3,0,'',1),
	(0,179,10,0,0,'','eztext',177,'eng-GB',3,0,'',2),
	(0,179,14,0,0,'','eztext',178,'eng-GB',3,0,'',3),
	(0,180,10,0,0,'','ezimage',179,'eng-GB',3,0,'',2),
	(0,180,14,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"\" filename=\"\" suffix=\"\" basename=\"\" dirpath=\"\" url=\"\" original_filename=\"\" mime_type=\"\" width=\"\" height=\"\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1301057722\"><original attribute_id=\"180\" attribute_version=\"3\" attribute_language=\"eng-GB\"/></ezimage>\n','ezimage',180,'eng-GB',3,0,'',3);

/*!40000 ALTER TABLE `ezcontentobject_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentobject_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentobject_link`;

CREATE TABLE `ezcontentobject_link` (
  `contentclassattribute_id` int(11) NOT NULL DEFAULT '0',
  `from_contentobject_id` int(11) NOT NULL DEFAULT '0',
  `from_contentobject_version` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_type` int(11) NOT NULL DEFAULT '1',
  `to_contentobject_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezco_link_from` (`from_contentobject_id`,`from_contentobject_version`,`contentclassattribute_id`),
  KEY `ezco_link_to_co_id` (`to_contentobject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcontentobject_name
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentobject_name`;

CREATE TABLE `ezcontentobject_name` (
  `content_translation` varchar(20) NOT NULL DEFAULT '',
  `content_version` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `real_translation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`,`content_version`,`content_translation`),
  KEY `ezcontentobject_name_cov_id` (`content_version`),
  KEY `ezcontentobject_name_lang_id` (`language_id`),
  KEY `ezcontentobject_name_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentobject_name` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_name` DISABLE KEYS */;

INSERT INTO `ezcontentobject_name` (`content_translation`, `content_version`, `contentobject_id`, `language_id`, `name`, `real_translation`)
VALUES
	('eng-GB',9,1,2,'eZ Platform','eng-GB'),
	('eng-GB',1,4,3,'Users','eng-GB'),
	('eng-GB',2,10,3,'Anonymous User','eng-GB'),
	('eng-GB',1,11,3,'Guest accounts','eng-GB'),
	('eng-GB',1,12,3,'Administrator users','eng-GB'),
	('eng-GB',1,13,3,'Editors','eng-GB'),
	('eng-GB',3,14,3,'Administrator User','eng-GB'),
	('eng-GB',1,41,3,'Media','eng-GB'),
	('eng-GB',1,42,3,'Anonymous Users','eng-GB'),
	('eng-GB',1,45,3,'Setup','eng-GB'),
	('eng-GB',1,49,3,'Images','eng-GB'),
	('eng-GB',1,50,3,'Files','eng-GB'),
	('eng-GB',1,51,3,'Multimedia','eng-GB');

/*!40000 ALTER TABLE `ezcontentobject_name` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentobject_trash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentobject_trash`;

CREATE TABLE `ezcontentobject_trash` (
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  `is_invisible` int(11) NOT NULL DEFAULT '0',
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `parent_node_id` int(11) NOT NULL DEFAULT '0',
  `path_identification_string` longtext,
  `path_string` varchar(255) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`node_id`),
  KEY `ezcobj_trash_co_id` (`contentobject_id`),
  KEY `ezcobj_trash_depth` (`depth`),
  KEY `ezcobj_trash_modified_subnode` (`modified_subnode`),
  KEY `ezcobj_trash_p_node_id` (`parent_node_id`),
  KEY `ezcobj_trash_path` (`path_string`),
  KEY `ezcobj_trash_path_ident` (`path_identification_string`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezcontentobject_tree
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentobject_tree`;

CREATE TABLE `ezcontentobject_tree` (
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_is_published` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  `is_invisible` int(11) NOT NULL DEFAULT '0',
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT '0',
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_node_id` int(11) NOT NULL DEFAULT '0',
  `path_identification_string` longtext,
  `path_string` varchar(255) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`node_id`),
  KEY `ezcontentobject_tree_remote_id` (`remote_id`),
  KEY `ezcontentobject_tree_co_id` (`contentobject_id`),
  KEY `ezcontentobject_tree_depth` (`depth`),
  KEY `ezcontentobject_tree_p_node_id` (`parent_node_id`),
  KEY `ezcontentobject_tree_path` (`path_string`),
  KEY `ezcontentobject_tree_path_ident` (`path_identification_string`(50)),
  KEY `modified_subnode` (`modified_subnode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentobject_tree` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_tree` DISABLE KEYS */;

INSERT INTO `ezcontentobject_tree` (`contentobject_id`, `contentobject_is_published`, `contentobject_version`, `depth`, `is_hidden`, `is_invisible`, `main_node_id`, `modified_subnode`, `node_id`, `parent_node_id`, `path_identification_string`, `path_string`, `priority`, `remote_id`, `sort_field`, `sort_order`)
VALUES
	(0,1,1,0,0,0,1,1448999778,1,1,'','/1/',0,'629709ba256fe317c3ddcee35453a96a',1,1),
	(1,1,9,1,0,0,2,1301073466,2,1,'node_2','/1/2/',0,'f3e90596361e31d496d4026eb624c983',8,1),
	(4,1,1,1,0,0,5,1301062024,5,1,'users','/1/5/',0,'3f6d92f8044aed134f32153517850f5a',1,1),
	(11,1,1,2,0,0,12,1081860719,12,5,'users/guest_accounts','/1/5/12/',0,'602dcf84765e56b7f999eaafd3821dd3',1,1),
	(12,1,1,2,0,0,13,1301062024,13,5,'users/administrator_users','/1/5/13/',0,'769380b7aa94541679167eab817ca893',1,1),
	(13,1,1,2,0,0,14,1081860719,14,5,'users/editors','/1/5/14/',0,'f7dda2854fc68f7c8455d9cb14bd04a9',1,1),
	(14,1,3,3,0,0,15,1301062024,15,13,'users/administrator_users/administrator_user','/1/5/13/15/',0,'e5161a99f733200b9ed4e80f9c16187b',1,1),
	(41,1,1,1,0,0,43,1081860720,43,1,'media','/1/43/',0,'75c715a51699d2d309a924eca6a95145',9,1),
	(42,1,1,2,0,0,44,1081860719,44,5,'users/anonymous_users','/1/5/44/',0,'4fdf0072da953bb276c0c7e0141c5c9b',9,1),
	(10,1,2,3,0,0,45,1081860719,45,44,'users/anonymous_users/anonymous_user','/1/5/44/45/',0,'2cf8343bee7b482bab82b269d8fecd76',9,1),
	(45,1,1,1,0,0,48,1448833726,48,1,'setup2','/1/48/',0,'182ce1b5af0c09fa378557c462ba2617',9,1),
	(49,1,1,2,0,0,51,1081860720,51,43,'media/images','/1/43/51/',0,'1b26c0454b09bb49dfb1b9190ffd67cb',9,1),
	(50,1,1,2,0,0,52,1081860720,52,43,'media/files','/1/43/52/',0,'0b113a208f7890f9ad3c24444ff5988c',9,1),
	(51,1,1,2,0,0,53,1081860720,53,43,'media/multimedia','/1/43/53/',0,'4f18b82c75f10aad476cae5adf98c11f',9,1);

/*!40000 ALTER TABLE `ezcontentobject_tree` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcontentobject_version
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcontentobject_version`;

CREATE TABLE `ezcontentobject_version` (
  `contentobject_id` int(11) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `workflow_event_pos` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcobj_version_creator_id` (`creator_id`),
  KEY `ezcobj_version_status` (`status`),
  KEY `idx_object_version_objver` (`contentobject_id`,`version`),
  KEY `ezcontobj_version_obj_status` (`contentobject_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezcontentobject_version` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_version` DISABLE KEYS */;

INSERT INTO `ezcontentobject_version` (`contentobject_id`, `created`, `creator_id`, `id`, `initial_language_id`, `language_mask`, `modified`, `status`, `user_id`, `version`, `workflow_event_pos`)
VALUES
	(4,0,14,4,2,3,0,1,0,1,1),
	(11,1033920737,14,439,2,3,1033920746,1,0,1,0),
	(12,1033920760,14,440,2,3,1033920775,1,0,1,0),
	(13,1033920786,14,441,2,3,1033920794,1,0,1,0),
	(41,1060695450,14,472,2,3,1060695457,1,0,1,0),
	(42,1072180278,14,473,2,3,1072180330,1,0,1,0),
	(10,1072180337,14,474,2,3,1072180405,1,0,2,0),
	(45,1079684084,14,477,2,3,1079684190,1,0,1,0),
	(49,1080220181,14,488,2,3,1080220197,1,0,1,0),
	(50,1080220211,14,489,2,3,1080220220,1,0,1,0),
	(51,1080220225,14,490,2,3,1080220233,1,0,1,0),
	(14,1301061783,14,499,2,3,1301062024,1,0,3,0),
	(1,1448889045,14,506,2,3,1448889046,1,0,9,0);

/*!40000 ALTER TABLE `ezcontentobject_version` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezcurrencydata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezcurrencydata`;

CREATE TABLE `ezcurrencydata` (
  `auto_rate_value` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `code` varchar(4) NOT NULL DEFAULT '',
  `custom_rate_value` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) NOT NULL DEFAULT '',
  `rate_factor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `status` int(11) NOT NULL DEFAULT '1',
  `symbol` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcurrencydata_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezdfsfile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezdfsfile`;

CREATE TABLE `ezdfsfile` (
  `name` text NOT NULL,
  `name_trunk` text NOT NULL,
  `name_hash` varchar(34) NOT NULL DEFAULT '',
  `datatype` varchar(255) NOT NULL DEFAULT 'application/octet-stream',
  `scope` varchar(25) NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name_hash`),
  KEY `ezdfsfile_name` (`name`(250)),
  KEY `ezdfsfile_name_trunk` (`name_trunk`(250)),
  KEY `ezdfsfile_mtime` (`mtime`),
  KEY `ezdfsfile_expired_name` (`expired`,`name`(250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezdiscountrule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezdiscountrule`;

CREATE TABLE `ezdiscountrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezdiscountsubrule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezdiscountsubrule`;

CREATE TABLE `ezdiscountsubrule` (
  `discount_percent` float DEFAULT NULL,
  `discountrule_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation` char(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezdiscountsubrule_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezdiscountsubrule_value`;

CREATE TABLE `ezdiscountsubrule_value` (
  `discountsubrule_id` int(11) NOT NULL DEFAULT '0',
  `issection` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`discountsubrule_id`,`value`,`issection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezenumobjectvalue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezenumobjectvalue`;

CREATE TABLE `ezenumobjectvalue` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT '0',
  `enumelement` varchar(255) NOT NULL DEFAULT '',
  `enumid` int(11) NOT NULL DEFAULT '0',
  `enumvalue` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_attribute_id`,`contentobject_attribute_version`,`enumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezenumvalue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezenumvalue`;

CREATE TABLE `ezenumvalue` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_attribute_version` int(11) NOT NULL DEFAULT '0',
  `enumelement` varchar(255) NOT NULL DEFAULT '',
  `enumvalue` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placement` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`contentclass_attribute_id`,`contentclass_attribute_version`),
  KEY `ezenumvalue_co_cl_attr_id_co_class_att_ver` (`contentclass_attribute_id`,`contentclass_attribute_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezforgot_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezforgot_password`;

CREATE TABLE `ezforgot_password` (
  `hash_key` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezforgot_password_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezgeneral_digest_user_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezgeneral_digest_user_settings`;

CREATE TABLE `ezgeneral_digest_user_settings` (
  `day` varchar(255) NOT NULL DEFAULT '',
  `digest_type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_digest` int(11) NOT NULL DEFAULT '0',
  `time` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezgeneral_digest_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezgmaplocation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezgmaplocation`;

CREATE TABLE `ezgmaplocation` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_version` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`contentobject_version`),
  KEY `latitude_longitude_key` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezimagefile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezimagefile`;

CREATE TABLE `ezimagefile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `filepath` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `ezimagefile_coid` (`contentobject_attribute_id`),
  KEY `ezimagefile_file` (`filepath`(200))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezinfocollection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezinfocollection`;

CREATE TABLE `ezinfocollection` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) DEFAULT '0',
  `user_identifier` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezinfocollection_co_id_created` (`contentobject_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezinfocollection_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezinfocollection_attribute`;

CREATE TABLE `ezinfocollection_attribute` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attribute_id` int(11) DEFAULT NULL,
  `contentobject_id` int(11) DEFAULT NULL,
  `data_float` float DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informationcollection_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezinfocollection_attr_cca_id` (`contentclass_attribute_id`),
  KEY `ezinfocollection_attr_co_id` (`contentobject_id`),
  KEY `ezinfocollection_attr_coa_id` (`contentobject_attribute_id`),
  KEY `ezinfocollection_attr_ic_id` (`informationcollection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezisbn_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezisbn_group`;

CREATE TABLE `ezisbn_group` (
  `description` varchar(255) NOT NULL DEFAULT '',
  `group_number` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezisbn_group` WRITE;
/*!40000 ALTER TABLE `ezisbn_group` DISABLE KEYS */;

INSERT INTO `ezisbn_group` (`description`, `group_number`, `id`)
VALUES
	('English language',0,1),
	('English language',1,2),
	('French language',2,3),
	('German language',3,4),
	('Japan',4,5),
	('Russian Federation and former USSR',5,6),
	('Iran',600,7),
	('Kazakhstan',601,8),
	('Indonesia',602,9),
	('Saudi Arabia',603,10),
	('Vietnam',604,11),
	('Turkey',605,12),
	('Romania',606,13),
	('Mexico',607,14),
	('Macedonia',608,15),
	('Lithuania',609,16),
	('Thailand',611,17),
	('Peru',612,18),
	('Mauritius',613,19),
	('Lebanon',614,20),
	('Hungary',615,21),
	('Thailand',616,22),
	('Ukraine',617,23),
	('China, People\'s Republic',7,24),
	('Czech Republic and Slovakia',80,25),
	('India',81,26),
	('Norway',82,27),
	('Poland',83,28),
	('Spain',84,29),
	('Brazil',85,30),
	('Serbia and Montenegro',86,31),
	('Denmark',87,32),
	('Italy',88,33),
	('Korea, Republic',89,34),
	('Netherlands',90,35),
	('Sweden',91,36),
	('International NGO Publishers and EC Organizations',92,37),
	('India',93,38),
	('Netherlands',94,39),
	('Argentina',950,40),
	('Finland',951,41),
	('Finland',952,42),
	('Croatia',953,43),
	('Bulgaria',954,44),
	('Sri Lanka',955,45),
	('Chile',956,46),
	('Taiwan',957,47),
	('Colombia',958,48),
	('Cuba',959,49),
	('Greece',960,50),
	('Slovenia',961,51),
	('Hong Kong, China',962,52),
	('Hungary',963,53),
	('Iran',964,54),
	('Israel',965,55),
	('Ukraine',966,56),
	('Malaysia',967,57),
	('Mexico',968,58),
	('Pakistan',969,59),
	('Mexico',970,60),
	('Philippines',971,61),
	('Portugal',972,62),
	('Romania',973,63),
	('Thailand',974,64),
	('Turkey',975,65),
	('Caribbean Community',976,66),
	('Egypt',977,67),
	('Nigeria',978,68),
	('Indonesia',979,69),
	('Venezuela',980,70),
	('Singapore',981,71),
	('South Pacific',982,72),
	('Malaysia',983,73),
	('Bangladesh',984,74),
	('Belarus',985,75),
	('Taiwan',986,76),
	('Argentina',987,77),
	('Hong Kong, China',988,78),
	('Portugal',989,79),
	('Qatar',9927,80),
	('Albania',9928,81),
	('Guatemala',9929,82),
	('Costa Rica',9930,83),
	('Algeria',9931,84),
	('Lao People\'s Democratic Republic',9932,85),
	('Syria',9933,86),
	('Latvia',9934,87),
	('Iceland',9935,88),
	('Afghanistan',9936,89),
	('Nepal',9937,90),
	('Tunisia',9938,91),
	('Armenia',9939,92),
	('Montenegro',9940,93),
	('Georgia',9941,94),
	('Ecuador',9942,95),
	('Uzbekistan',9943,96),
	('Turkey',9944,97),
	('Dominican Republic',9945,98),
	('Korea, P.D.R.',9946,99),
	('Algeria',9947,100),
	('United Arab Emirates',9948,101),
	('Estonia',9949,102),
	('Palestine',9950,103),
	('Kosova',9951,104),
	('Azerbaijan',9952,105),
	('Lebanon',9953,106),
	('Morocco',9954,107),
	('Lithuania',9955,108),
	('Cameroon',9956,109),
	('Jordan',9957,110),
	('Bosnia and Herzegovina',9958,111),
	('Libya',9959,112),
	('Saudi Arabia',9960,113),
	('Algeria',9961,114),
	('Panama',9962,115),
	('Cyprus',9963,116),
	('Ghana',9964,117),
	('Kazakhstan',9965,118),
	('Kenya',9966,119),
	('Kyrgyz Republic',9967,120),
	('Costa Rica',9968,121),
	('Uganda',9970,122),
	('Singapore',9971,123),
	('Peru',9972,124),
	('Tunisia',9973,125),
	('Uruguay',9974,126),
	('Moldova',9975,127),
	('Tanzania',9976,128),
	('Costa Rica',9977,129),
	('Ecuador',9978,130),
	('Iceland',9979,131),
	('Papua New Guinea',9980,132),
	('Morocco',9981,133),
	('Zambia',9982,134),
	('Gambia',9983,135),
	('Latvia',9984,136),
	('Estonia',9985,137),
	('Lithuania',9986,138),
	('Tanzania',9987,139),
	('Ghana',9988,140),
	('Macedonia',9989,141),
	('Bahrain',99901,142),
	('Gabon',99902,143),
	('Mauritius',99903,144),
	('Netherlands Antilles and Aruba',99904,145),
	('Bolivia',99905,146),
	('Kuwait',99906,147),
	('Malawi',99908,148),
	('Malta',99909,149),
	('Sierra Leone',99910,150),
	('Lesotho',99911,151),
	('Botswana',99912,152),
	('Andorra',99913,153),
	('Suriname',99914,154),
	('Maldives',99915,155),
	('Namibia',99916,156),
	('Brunei Darussalam',99917,157),
	('Faroe Islands',99918,158),
	('Benin',99919,159),
	('Andorra',99920,160),
	('Qatar',99921,161),
	('Guatemala',99922,162),
	('El Salvador',99923,163),
	('Nicaragua',99924,164),
	('Paraguay',99925,165),
	('Honduras',99926,166),
	('Albania',99927,167),
	('Georgia',99928,168),
	('Mongolia',99929,169),
	('Armenia',99930,170),
	('Seychelles',99931,171),
	('Malta',99932,172),
	('Nepal',99933,173),
	('Dominican Republic',99934,174),
	('Haiti',99935,175),
	('Bhutan',99936,176),
	('Macau',99937,177),
	('Srpska, Republic of',99938,178),
	('Guatemala',99939,179),
	('Georgia',99940,180),
	('Armenia',99941,181),
	('Sudan',99942,182),
	('Albania',99943,183),
	('Ethiopia',99944,184),
	('Namibia',99945,185),
	('Nepal',99946,186),
	('Tajikistan',99947,187),
	('Eritrea',99948,188),
	('Mauritius',99949,189),
	('Cambodia',99950,190),
	('Congo',99951,191),
	('Mali',99952,192),
	('Paraguay',99953,193),
	('Bolivia',99954,194),
	('Srpska, Republic of',99955,195),
	('Albania',99956,196),
	('Malta',99957,197),
	('Bahrain',99958,198),
	('Luxembourg',99959,199),
	('Malawi',99960,200),
	('El Salvador',99961,201),
	('Mongolia',99962,202),
	('Cambodia',99963,203),
	('Nicaragua',99964,204),
	('Macau',99965,205),
	('Kuwait',99966,206),
	('Paraguay',99967,207),
	('Botswana',99968,208),
	('France',10,209);

/*!40000 ALTER TABLE `ezisbn_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezisbn_group_range
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezisbn_group_range`;

CREATE TABLE `ezisbn_group_range` (
  `from_number` int(11) NOT NULL DEFAULT '0',
  `group_from` varchar(32) NOT NULL DEFAULT '',
  `group_length` int(11) NOT NULL DEFAULT '0',
  `group_to` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezisbn_group_range` WRITE;
/*!40000 ALTER TABLE `ezisbn_group_range` DISABLE KEYS */;

INSERT INTO `ezisbn_group_range` (`from_number`, `group_from`, `group_length`, `group_to`, `id`, `to_number`)
VALUES
	(0,'0',1,'5',1,59999),
	(60000,'600',3,'649',2,64999),
	(70000,'7',1,'7',3,79999),
	(80000,'80',2,'94',4,94999),
	(95000,'950',3,'989',5,98999),
	(99000,'9900',4,'9989',6,99899),
	(99900,'99900',5,'99999',7,99999),
	(10000,'10',2,'10',8,10999);

/*!40000 ALTER TABLE `ezisbn_group_range` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezisbn_registrant_range
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezisbn_registrant_range`;

CREATE TABLE `ezisbn_registrant_range` (
  `from_number` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn_group_id` int(11) NOT NULL DEFAULT '0',
  `registrant_from` varchar(32) NOT NULL DEFAULT '',
  `registrant_length` int(11) NOT NULL DEFAULT '0',
  `registrant_to` varchar(32) NOT NULL DEFAULT '',
  `to_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezisbn_registrant_range` WRITE;
/*!40000 ALTER TABLE `ezisbn_registrant_range` DISABLE KEYS */;

INSERT INTO `ezisbn_registrant_range` (`from_number`, `id`, `isbn_group_id`, `registrant_from`, `registrant_length`, `registrant_to`, `to_number`)
VALUES
	(0,1,1,'00',2,'19',19999),
	(20000,2,1,'200',3,'699',69999),
	(70000,3,1,'7000',4,'8499',84999),
	(85000,4,1,'85000',5,'89999',89999),
	(90000,5,1,'900000',6,'949999',94999),
	(95000,6,1,'9500000',7,'9999999',99999),
	(0,7,2,'00',2,'09',9999),
	(10000,8,2,'100',3,'399',39999),
	(40000,9,2,'4000',4,'5499',54999),
	(55000,10,2,'55000',5,'86979',86979),
	(86980,11,2,'869800',6,'998999',99899),
	(99900,12,2,'9990000',7,'9999999',99999),
	(0,13,3,'00',2,'19',19999),
	(20000,14,3,'200',3,'349',34999),
	(35000,15,3,'35000',5,'39999',39999),
	(40000,16,3,'400',3,'699',69999),
	(70000,17,3,'7000',4,'8399',83999),
	(84000,18,3,'84000',5,'89999',89999),
	(90000,19,3,'900000',6,'949999',94999),
	(95000,20,3,'9500000',7,'9999999',99999),
	(0,21,4,'00',2,'02',2999),
	(3000,22,4,'030',3,'033',3399),
	(3400,23,4,'0340',4,'0369',3699),
	(3700,24,4,'03700',5,'03999',3999),
	(4000,25,4,'04',2,'19',19999),
	(20000,26,4,'200',3,'699',69999),
	(70000,27,4,'7000',4,'8499',84999),
	(85000,28,4,'85000',5,'89999',89999),
	(90000,29,4,'900000',6,'949999',94999),
	(95000,30,4,'9500000',7,'9539999',95399),
	(95400,31,4,'95400',5,'96999',96999),
	(97000,32,4,'9700000',7,'9899999',98999),
	(99000,33,4,'99000',5,'99499',99499),
	(99500,34,4,'99500',5,'99999',99999),
	(0,35,5,'00',2,'19',19999),
	(20000,36,5,'200',3,'699',69999),
	(70000,37,5,'7000',4,'8499',84999),
	(85000,38,5,'85000',5,'89999',89999),
	(90000,39,5,'900000',6,'949999',94999),
	(95000,40,5,'9500000',7,'9999999',99999),
	(0,41,6,'00',2,'19',19999),
	(20000,42,6,'200',3,'420',42099),
	(42100,43,6,'4210',4,'4299',42999),
	(43000,44,6,'430',3,'430',43099),
	(43100,45,6,'4310',4,'4399',43999),
	(44000,46,6,'440',3,'440',44099),
	(44100,47,6,'4410',4,'4499',44999),
	(45000,48,6,'450',3,'699',69999),
	(70000,49,6,'7000',4,'8499',84999),
	(85000,50,6,'85000',5,'89999',89999),
	(90000,51,6,'900000',6,'909999',90999),
	(91000,52,6,'91000',5,'91999',91999),
	(92000,53,6,'9200',4,'9299',92999),
	(93000,54,6,'93000',5,'94999',94999),
	(95000,55,6,'9500000',7,'9500999',95009),
	(95010,56,6,'9501',4,'9799',97999),
	(98000,57,6,'98000',5,'98999',98999),
	(99000,58,6,'9900000',7,'9909999',99099),
	(99100,59,6,'9910',4,'9999',99999),
	(0,60,7,'00',2,'09',9999),
	(10000,61,7,'100',3,'499',49999),
	(50000,62,7,'5000',4,'8999',89999),
	(90000,63,7,'90000',5,'99999',99999),
	(0,64,8,'00',2,'19',19999),
	(20000,65,8,'200',3,'699',69999),
	(70000,66,8,'7000',4,'7999',79999),
	(80000,67,8,'80000',5,'84999',84999),
	(85000,68,8,'85',2,'99',99999),
	(0,69,9,'00',2,'19',19999),
	(20000,70,9,'200',3,'799',79999),
	(80000,71,9,'8000',4,'9499',94999),
	(95000,72,9,'95000',5,'99999',99999),
	(0,73,10,'00',2,'04',4999),
	(5000,74,10,'05',2,'49',49999),
	(50000,75,10,'500',3,'799',79999),
	(80000,76,10,'8000',4,'8999',89999),
	(90000,77,10,'90000',5,'99999',99999),
	(0,78,11,'0',1,'4',49999),
	(50000,79,11,'50',2,'89',89999),
	(90000,80,11,'900',3,'979',97999),
	(98000,81,11,'9800',4,'9999',99999),
	(1000,82,12,'01',2,'09',9999),
	(10000,83,12,'100',3,'399',39999),
	(40000,84,12,'4000',4,'5999',59999),
	(60000,85,12,'60000',5,'89999',89999),
	(90000,86,12,'90',2,'99',99999),
	(0,87,13,'0',1,'0',9999),
	(10000,88,13,'10',2,'49',49999),
	(50000,89,13,'500',3,'799',79999),
	(80000,90,13,'8000',4,'9199',91999),
	(92000,91,13,'92000',5,'99999',99999),
	(0,92,14,'00',2,'39',39999),
	(40000,93,14,'400',3,'749',74999),
	(75000,94,14,'7500',4,'9499',94999),
	(95000,95,14,'95000',5,'99999',99999),
	(0,96,15,'0',1,'0',9999),
	(10000,97,15,'10',2,'19',19999),
	(20000,98,15,'200',3,'449',44999),
	(45000,99,15,'4500',4,'6499',64999),
	(65000,100,15,'65000',5,'69999',69999),
	(70000,101,15,'7',1,'9',99999),
	(0,102,16,'00',2,'39',39999),
	(40000,103,16,'400',3,'799',79999),
	(80000,104,16,'8000',4,'9499',94999),
	(95000,105,16,'95000',5,'99999',99999),
	(0,106,18,'00',2,'29',29999),
	(30000,107,18,'300',3,'399',39999),
	(40000,108,18,'4000',4,'4499',44999),
	(45000,109,18,'45000',5,'49999',49999),
	(50000,110,18,'50',2,'99',99999),
	(0,111,19,'0',1,'9',99999),
	(0,112,20,'00',2,'39',39999),
	(40000,113,20,'400',3,'799',79999),
	(80000,114,20,'8000',4,'9499',94999),
	(95000,115,20,'95000',5,'99999',99999),
	(0,116,21,'00',2,'09',9999),
	(10000,117,21,'100',3,'499',49999),
	(50000,118,21,'5000',4,'7999',79999),
	(80000,119,21,'80000',5,'89999',89999),
	(0,120,22,'00',2,'19',19999),
	(20000,121,22,'200',3,'699',69999),
	(70000,122,22,'7000',4,'8999',89999),
	(90000,123,22,'90000',5,'99999',99999),
	(0,124,23,'00',2,'49',49999),
	(50000,125,23,'500',3,'699',69999),
	(70000,126,23,'7000',4,'8999',89999),
	(90000,127,23,'90000',5,'99999',99999),
	(0,128,24,'00',2,'09',9999),
	(10000,129,24,'100',3,'499',49999),
	(50000,130,24,'5000',4,'7999',79999),
	(80000,131,24,'80000',5,'89999',89999),
	(90000,132,24,'900000',6,'999999',99999),
	(0,133,25,'00',2,'19',19999),
	(20000,134,25,'200',3,'699',69999),
	(70000,135,25,'7000',4,'8499',84999),
	(85000,136,25,'85000',5,'89999',89999),
	(90000,137,25,'900000',6,'999999',99999),
	(0,138,26,'00',2,'19',19999),
	(20000,139,26,'200',3,'699',69999),
	(70000,140,26,'7000',4,'8499',84999),
	(85000,141,26,'85000',5,'89999',89999),
	(90000,142,26,'900000',6,'999999',99999),
	(0,143,27,'00',2,'19',19999),
	(20000,144,27,'200',3,'699',69999),
	(70000,145,27,'7000',4,'8999',89999),
	(90000,146,27,'90000',5,'98999',98999),
	(99000,147,27,'990000',6,'999999',99999),
	(0,148,28,'00',2,'19',19999),
	(20000,149,28,'200',3,'599',59999),
	(60000,150,28,'60000',5,'69999',69999),
	(70000,151,28,'7000',4,'8499',84999),
	(85000,152,28,'85000',5,'89999',89999),
	(90000,153,28,'900000',6,'999999',99999),
	(0,154,29,'00',2,'14',14999),
	(15000,155,29,'15000',5,'19999',19999),
	(20000,156,29,'200',3,'699',69999),
	(70000,157,29,'7000',4,'8499',84999),
	(85000,158,29,'85000',5,'89999',89999),
	(90000,159,29,'9000',4,'9199',91999),
	(92000,160,29,'920000',6,'923999',92399),
	(92400,161,29,'92400',5,'92999',92999),
	(93000,162,29,'930000',6,'949999',94999),
	(95000,163,29,'95000',5,'96999',96999),
	(97000,164,29,'9700',4,'9999',99999),
	(0,165,30,'00',2,'19',19999),
	(20000,166,30,'200',3,'599',59999),
	(60000,167,30,'60000',5,'69999',69999),
	(70000,168,30,'7000',4,'8499',84999),
	(85000,169,30,'85000',5,'89999',89999),
	(90000,170,30,'900000',6,'979999',97999),
	(98000,171,30,'98000',5,'99999',99999),
	(0,172,31,'00',2,'29',29999),
	(30000,173,31,'300',3,'599',59999),
	(60000,174,31,'6000',4,'7999',79999),
	(80000,175,31,'80000',5,'89999',89999),
	(90000,176,31,'900000',6,'999999',99999),
	(0,177,32,'00',2,'29',29999),
	(40000,178,32,'400',3,'649',64999),
	(70000,179,32,'7000',4,'7999',79999),
	(85000,180,32,'85000',5,'94999',94999),
	(97000,181,32,'970000',6,'999999',99999),
	(0,182,33,'00',2,'19',19999),
	(20000,183,33,'200',3,'599',59999),
	(60000,184,33,'6000',4,'8499',84999),
	(85000,185,33,'85000',5,'89999',89999),
	(90000,186,33,'900000',6,'949999',94999),
	(95000,187,33,'95000',5,'99999',99999),
	(0,188,34,'00',2,'24',24999),
	(25000,189,34,'250',3,'549',54999),
	(55000,190,34,'5500',4,'8499',84999),
	(85000,191,34,'85000',5,'94999',94999),
	(95000,192,34,'950000',6,'969999',96999),
	(97000,193,34,'97000',5,'98999',98999),
	(99000,194,34,'990',3,'999',99999),
	(0,195,35,'00',2,'19',19999),
	(20000,196,35,'200',3,'499',49999),
	(50000,197,35,'5000',4,'6999',69999),
	(70000,198,35,'70000',5,'79999',79999),
	(80000,199,35,'800000',6,'849999',84999),
	(85000,200,35,'8500',4,'8999',89999),
	(90000,201,35,'90',2,'90',90999),
	(91000,202,35,'910000',6,'939999',93999),
	(94000,203,35,'94',2,'94',94999),
	(95000,204,35,'950000',6,'999999',99999),
	(0,205,36,'0',1,'1',19999),
	(20000,206,36,'20',2,'49',49999),
	(50000,207,36,'500',3,'649',64999),
	(70000,208,36,'7000',4,'7999',79999),
	(85000,209,36,'85000',5,'94999',94999),
	(97000,210,36,'970000',6,'999999',99999),
	(0,211,37,'0',1,'5',59999),
	(60000,212,37,'60',2,'79',79999),
	(80000,213,37,'800',3,'899',89999),
	(90000,214,37,'9000',4,'9499',94999),
	(95000,215,37,'95000',5,'98999',98999),
	(99000,216,37,'990000',6,'999999',99999),
	(0,217,38,'00',2,'09',9999),
	(10000,218,38,'100',3,'499',49999),
	(50000,219,38,'5000',4,'7999',79999),
	(80000,220,38,'80000',5,'94999',94999),
	(95000,221,38,'950000',6,'999999',99999),
	(0,222,39,'000',3,'599',59999),
	(60000,223,39,'6000',4,'8999',89999),
	(90000,224,39,'90000',5,'99999',99999),
	(0,225,40,'00',2,'49',49999),
	(50000,226,40,'500',3,'899',89999),
	(90000,227,40,'9000',4,'9899',98999),
	(99000,228,40,'99000',5,'99999',99999),
	(0,229,41,'0',1,'1',19999),
	(20000,230,41,'20',2,'54',54999),
	(55000,231,41,'550',3,'889',88999),
	(89000,232,41,'8900',4,'9499',94999),
	(95000,233,41,'95000',5,'99999',99999),
	(0,234,42,'00',2,'19',19999),
	(20000,235,42,'200',3,'499',49999),
	(50000,236,42,'5000',4,'5999',59999),
	(60000,237,42,'60',2,'65',65999),
	(66000,238,42,'6600',4,'6699',66999),
	(67000,239,42,'67000',5,'69999',69999),
	(70000,240,42,'7000',4,'7999',79999),
	(80000,241,42,'80',2,'94',94999),
	(95000,242,42,'9500',4,'9899',98999),
	(99000,243,42,'99000',5,'99999',99999),
	(0,244,43,'0',1,'0',9999),
	(10000,245,43,'10',2,'14',14999),
	(15000,246,43,'150',3,'549',54999),
	(55000,247,43,'55000',5,'59999',59999),
	(60000,248,43,'6000',4,'9499',94999),
	(95000,249,43,'95000',5,'99999',99999),
	(0,250,44,'00',2,'28',28999),
	(29000,251,44,'2900',4,'2999',29999),
	(30000,252,44,'300',3,'799',79999),
	(80000,253,44,'8000',4,'8999',89999),
	(90000,254,44,'90000',5,'92999',92999),
	(93000,255,44,'9300',4,'9999',99999),
	(0,256,45,'0000',4,'1999',19999),
	(20000,257,45,'20',2,'49',49999),
	(50000,258,45,'50000',5,'54999',54999),
	(55000,259,45,'550',3,'799',79999),
	(80000,260,45,'8000',4,'9499',94999),
	(95000,261,45,'95000',5,'99999',99999),
	(0,262,46,'00',2,'19',19999),
	(20000,263,46,'200',3,'699',69999),
	(70000,264,46,'7000',4,'9999',99999),
	(0,265,47,'00',2,'02',2999),
	(3000,266,47,'0300',4,'0499',4999),
	(5000,267,47,'05',2,'19',19999),
	(20000,268,47,'2000',4,'2099',20999),
	(21000,269,47,'21',2,'27',27999),
	(28000,270,47,'28000',5,'30999',30999),
	(31000,271,47,'31',2,'43',43999),
	(44000,272,47,'440',3,'819',81999),
	(82000,273,47,'8200',4,'9699',96999),
	(97000,274,47,'97000',5,'99999',99999),
	(0,275,48,'00',2,'56',56999),
	(57000,276,48,'57000',5,'59999',59999),
	(60000,277,48,'600',3,'799',79999),
	(80000,278,48,'8000',4,'9499',94999),
	(95000,279,48,'95000',5,'99999',99999),
	(0,280,49,'00',2,'19',19999),
	(20000,281,49,'200',3,'699',69999),
	(70000,282,49,'7000',4,'8499',84999),
	(85000,283,49,'85000',5,'99999',99999),
	(0,284,50,'00',2,'19',19999),
	(20000,285,50,'200',3,'659',65999),
	(66000,286,50,'6600',4,'6899',68999),
	(69000,287,50,'690',3,'699',69999),
	(70000,288,50,'7000',4,'8499',84999),
	(85000,289,50,'85000',5,'92999',92999),
	(93000,290,50,'93',2,'93',93999),
	(94000,291,50,'9400',4,'9799',97999),
	(98000,292,50,'98000',5,'99999',99999),
	(0,293,51,'00',2,'19',19999),
	(20000,294,51,'200',3,'599',59999),
	(60000,295,51,'6000',4,'8999',89999),
	(90000,296,51,'90000',5,'94999',94999),
	(0,297,52,'00',2,'19',19999),
	(20000,298,52,'200',3,'699',69999),
	(70000,299,52,'7000',4,'8499',84999),
	(85000,300,52,'85000',5,'86999',86999),
	(87000,301,52,'8700',4,'8999',89999),
	(90000,302,52,'900',3,'999',99999),
	(0,303,53,'00',2,'19',19999),
	(20000,304,53,'200',3,'699',69999),
	(70000,305,53,'7000',4,'8499',84999),
	(85000,306,53,'85000',5,'89999',89999),
	(90000,307,53,'9000',4,'9999',99999),
	(0,308,54,'00',2,'14',14999),
	(15000,309,54,'150',3,'249',24999),
	(25000,310,54,'2500',4,'2999',29999),
	(30000,311,54,'300',3,'549',54999),
	(55000,312,54,'5500',4,'8999',89999),
	(90000,313,54,'90000',5,'96999',96999),
	(97000,314,54,'970',3,'989',98999),
	(99000,315,54,'9900',4,'9999',99999),
	(0,316,55,'00',2,'19',19999),
	(20000,317,55,'200',3,'599',59999),
	(70000,318,55,'7000',4,'7999',79999),
	(90000,319,55,'90000',5,'99999',99999),
	(0,320,56,'00',2,'14',14999),
	(15000,321,56,'1500',4,'1699',16999),
	(17000,322,56,'170',3,'199',19999),
	(20000,323,56,'2000',4,'2999',29999),
	(30000,324,56,'300',3,'699',69999),
	(70000,325,56,'7000',4,'8999',89999),
	(90000,326,56,'90000',5,'99999',99999),
	(0,327,57,'00',2,'00',999),
	(1000,328,57,'0100',4,'0999',9999),
	(10000,329,57,'10000',5,'19999',19999),
	(30000,330,57,'300',3,'499',49999),
	(50000,331,57,'5000',4,'5999',59999),
	(60000,332,57,'60',2,'89',89999),
	(90000,333,57,'900',3,'989',98999),
	(99000,334,57,'9900',4,'9989',99899),
	(99900,335,57,'99900',5,'99999',99999),
	(1000,336,58,'01',2,'39',39999),
	(40000,337,58,'400',3,'499',49999),
	(50000,338,58,'5000',4,'7999',79999),
	(80000,339,58,'800',3,'899',89999),
	(90000,340,58,'9000',4,'9999',99999),
	(0,341,59,'0',1,'1',19999),
	(20000,342,59,'20',2,'39',39999),
	(40000,343,59,'400',3,'799',79999),
	(80000,344,59,'8000',4,'9999',99999),
	(1000,345,60,'01',2,'59',59999),
	(60000,346,60,'600',3,'899',89999),
	(90000,347,60,'9000',4,'9099',90999),
	(91000,348,60,'91000',5,'96999',96999),
	(97000,349,60,'9700',4,'9999',99999),
	(0,350,61,'000',3,'015',1599),
	(1600,351,61,'0160',4,'0199',1999),
	(2000,352,61,'02',2,'02',2999),
	(3000,353,61,'0300',4,'0599',5999),
	(6000,354,61,'06',2,'09',9999),
	(10000,355,61,'10',2,'49',49999),
	(50000,356,61,'500',3,'849',84999),
	(85000,357,61,'8500',4,'9099',90999),
	(91000,358,61,'91000',5,'98999',98999),
	(99000,359,61,'9900',4,'9999',99999),
	(0,360,62,'0',1,'1',19999),
	(20000,361,62,'20',2,'54',54999),
	(55000,362,62,'550',3,'799',79999),
	(80000,363,62,'8000',4,'9499',94999),
	(95000,364,62,'95000',5,'99999',99999),
	(0,365,63,'0',1,'0',9999),
	(10000,366,63,'100',3,'169',16999),
	(17000,367,63,'1700',4,'1999',19999),
	(20000,368,63,'20',2,'54',54999),
	(55000,369,63,'550',3,'759',75999),
	(76000,370,63,'7600',4,'8499',84999),
	(85000,371,63,'85000',5,'88999',88999),
	(89000,372,63,'8900',4,'9499',94999),
	(95000,373,63,'95000',5,'99999',99999),
	(0,374,64,'00',2,'19',19999),
	(20000,375,64,'200',3,'699',69999),
	(70000,376,64,'7000',4,'8499',84999),
	(85000,377,64,'85000',5,'89999',89999),
	(90000,378,64,'90000',5,'94999',94999),
	(95000,379,64,'9500',4,'9999',99999),
	(0,380,65,'00000',5,'01999',1999),
	(2000,381,65,'02',2,'24',24999),
	(25000,382,65,'250',3,'599',59999),
	(60000,383,65,'6000',4,'9199',91999),
	(92000,384,65,'92000',5,'98999',98999),
	(99000,385,65,'990',3,'999',99999),
	(0,386,66,'0',1,'3',39999),
	(40000,387,66,'40',2,'59',59999),
	(60000,388,66,'600',3,'799',79999),
	(80000,389,66,'8000',4,'9499',94999),
	(95000,390,66,'95000',5,'99999',99999),
	(0,391,67,'00',2,'19',19999),
	(20000,392,67,'200',3,'499',49999),
	(50000,393,67,'5000',4,'6999',69999),
	(70000,394,67,'700',3,'999',99999),
	(0,395,68,'000',3,'199',19999),
	(20000,396,68,'2000',4,'2999',29999),
	(30000,397,68,'30000',5,'79999',79999),
	(80000,398,68,'8000',4,'8999',89999),
	(90000,399,68,'900',3,'999',99999),
	(0,400,69,'000',3,'099',9999),
	(10000,401,69,'1000',4,'1499',14999),
	(15000,402,69,'15000',5,'19999',19999),
	(20000,403,69,'20',2,'29',29999),
	(30000,404,69,'3000',4,'3999',39999),
	(40000,405,69,'400',3,'799',79999),
	(80000,406,69,'8000',4,'9499',94999),
	(95000,407,69,'95000',5,'99999',99999),
	(0,408,70,'00',2,'19',19999),
	(20000,409,70,'200',3,'599',59999),
	(60000,410,70,'6000',4,'9999',99999),
	(0,411,71,'00',2,'11',11999),
	(12000,412,71,'1200',4,'1999',19999),
	(20000,413,71,'200',3,'289',28999),
	(29000,414,71,'2900',4,'9999',99999),
	(0,415,72,'00',2,'09',9999),
	(10000,416,72,'100',3,'699',69999),
	(70000,417,72,'70',2,'89',89999),
	(90000,418,72,'9000',4,'9799',97999),
	(98000,419,72,'98000',5,'99999',99999),
	(0,420,73,'00',2,'01',1999),
	(2000,421,73,'020',3,'199',19999),
	(20000,422,73,'2000',4,'3999',39999),
	(40000,423,73,'40000',5,'44999',44999),
	(45000,424,73,'45',2,'49',49999),
	(50000,425,73,'50',2,'79',79999),
	(80000,426,73,'800',3,'899',89999),
	(90000,427,73,'9000',4,'9899',98999),
	(99000,428,73,'99000',5,'99999',99999),
	(0,429,74,'00',2,'39',39999),
	(40000,430,74,'400',3,'799',79999),
	(80000,431,74,'8000',4,'8999',89999),
	(90000,432,74,'90000',5,'99999',99999),
	(0,433,75,'00',2,'39',39999),
	(40000,434,75,'400',3,'599',59999),
	(60000,435,75,'6000',4,'8999',89999),
	(90000,436,75,'90000',5,'99999',99999),
	(0,437,76,'00',2,'11',11999),
	(12000,438,76,'120',3,'559',55999),
	(56000,439,76,'5600',4,'7999',79999),
	(80000,440,76,'80000',5,'99999',99999),
	(0,441,77,'00',2,'09',9999),
	(10000,442,77,'1000',4,'1999',19999),
	(20000,443,77,'20000',5,'29999',29999),
	(30000,444,77,'30',2,'49',49999),
	(50000,445,77,'500',3,'899',89999),
	(90000,446,77,'9000',4,'9499',94999),
	(95000,447,77,'95000',5,'99999',99999),
	(0,448,78,'00',2,'14',14999),
	(15000,449,78,'15000',5,'16999',16999),
	(17000,450,78,'17000',5,'19999',19999),
	(20000,451,78,'200',3,'799',79999),
	(80000,452,78,'8000',4,'9699',96999),
	(97000,453,78,'97000',5,'99999',99999),
	(0,454,79,'0',1,'1',19999),
	(20000,455,79,'20',2,'54',54999),
	(55000,456,79,'550',3,'799',79999),
	(80000,457,79,'8000',4,'9499',94999),
	(95000,458,79,'95000',5,'99999',99999),
	(0,459,80,'00',2,'09',9999),
	(10000,460,80,'100',3,'399',39999),
	(40000,461,80,'4000',4,'4999',49999),
	(0,462,81,'00',2,'09',9999),
	(10000,463,81,'100',3,'399',39999),
	(40000,464,81,'4000',4,'4999',49999),
	(0,465,82,'0',1,'3',39999),
	(40000,466,82,'40',2,'54',54999),
	(55000,467,82,'550',3,'799',79999),
	(80000,468,82,'8000',4,'9999',99999),
	(0,469,83,'00',2,'49',49999),
	(50000,470,83,'500',3,'939',93999),
	(94000,471,83,'9400',4,'9999',99999),
	(0,472,84,'00',2,'29',29999),
	(30000,473,84,'300',3,'899',89999),
	(90000,474,84,'9000',4,'9999',99999),
	(0,475,85,'00',2,'39',39999),
	(40000,476,85,'400',3,'849',84999),
	(85000,477,85,'8500',4,'9999',99999),
	(0,478,86,'0',1,'0',9999),
	(10000,479,86,'10',2,'39',39999),
	(40000,480,86,'400',3,'899',89999),
	(90000,481,86,'9000',4,'9999',99999),
	(0,482,87,'0',1,'0',9999),
	(10000,483,87,'10',2,'49',49999),
	(50000,484,87,'500',3,'799',79999),
	(80000,485,87,'8000',4,'9999',99999),
	(0,486,88,'0',1,'0',9999),
	(10000,487,88,'10',2,'39',39999),
	(40000,488,88,'400',3,'899',89999),
	(90000,489,88,'9000',4,'9999',99999),
	(0,490,89,'0',1,'1',19999),
	(20000,491,89,'20',2,'39',39999),
	(40000,492,89,'400',3,'799',79999),
	(80000,493,89,'8000',4,'9999',99999),
	(0,494,90,'0',1,'2',29999),
	(30000,495,90,'30',2,'49',49999),
	(50000,496,90,'500',3,'799',79999),
	(80000,497,90,'8000',4,'9999',99999),
	(0,498,91,'00',2,'79',79999),
	(80000,499,91,'800',3,'949',94999),
	(95000,500,91,'9500',4,'9999',99999),
	(0,501,92,'0',1,'4',49999),
	(50000,502,92,'50',2,'79',79999),
	(80000,503,92,'800',3,'899',89999),
	(90000,504,92,'9000',4,'9999',99999),
	(0,505,93,'0',1,'1',19999),
	(20000,506,93,'20',2,'49',49999),
	(50000,507,93,'500',3,'899',89999),
	(90000,508,93,'9000',4,'9999',99999),
	(0,509,94,'0',1,'0',9999),
	(10000,510,94,'10',2,'39',39999),
	(40000,511,94,'400',3,'899',89999),
	(90000,512,94,'9000',4,'9999',99999),
	(0,513,95,'00',2,'89',89999),
	(90000,514,95,'900',3,'984',98499),
	(98500,515,95,'9850',4,'9999',99999),
	(0,516,96,'00',2,'29',29999),
	(30000,517,96,'300',3,'399',39999),
	(40000,518,96,'4000',4,'9999',99999),
	(0,519,97,'0000',4,'0999',9999),
	(10000,520,97,'100',3,'499',49999),
	(50000,521,97,'5000',4,'5999',59999),
	(60000,522,97,'60',2,'69',69999),
	(70000,523,97,'700',3,'799',79999),
	(80000,524,97,'80',2,'89',89999),
	(90000,525,97,'900',3,'999',99999),
	(0,526,98,'00',2,'00',999),
	(1000,527,98,'010',3,'079',7999),
	(8000,528,98,'08',2,'39',39999),
	(40000,529,98,'400',3,'569',56999),
	(57000,530,98,'57',2,'57',57999),
	(58000,531,98,'580',3,'849',84999),
	(85000,532,98,'8500',4,'9999',99999),
	(0,533,99,'0',1,'1',19999),
	(20000,534,99,'20',2,'39',39999),
	(40000,535,99,'400',3,'899',89999),
	(90000,536,99,'9000',4,'9999',99999),
	(0,537,100,'0',1,'1',19999),
	(20000,538,100,'20',2,'79',79999),
	(80000,539,100,'800',3,'999',99999),
	(0,540,101,'00',2,'39',39999),
	(40000,541,101,'400',3,'849',84999),
	(85000,542,101,'8500',4,'9999',99999),
	(0,543,102,'0',1,'0',9999),
	(10000,544,102,'10',2,'39',39999),
	(40000,545,102,'400',3,'899',89999),
	(90000,546,102,'9000',4,'9999',99999),
	(0,547,103,'00',2,'29',29999),
	(30000,548,103,'300',3,'849',84999),
	(85000,549,103,'8500',4,'9999',99999),
	(0,550,104,'00',2,'39',39999),
	(40000,551,104,'400',3,'849',84999),
	(85000,552,104,'8500',4,'9999',99999),
	(0,553,105,'0',1,'1',19999),
	(20000,554,105,'20',2,'39',39999),
	(40000,555,105,'400',3,'799',79999),
	(80000,556,105,'8000',4,'9999',99999),
	(0,557,106,'0',1,'0',9999),
	(10000,558,106,'10',2,'39',39999),
	(40000,559,106,'400',3,'599',59999),
	(60000,560,106,'60',2,'89',89999),
	(90000,561,106,'9000',4,'9999',99999),
	(0,562,107,'0',1,'1',19999),
	(20000,563,107,'20',2,'39',39999),
	(40000,564,107,'400',3,'799',79999),
	(80000,565,107,'8000',4,'9999',99999),
	(0,566,108,'00',2,'39',39999),
	(40000,567,108,'400',3,'929',92999),
	(93000,568,108,'9300',4,'9999',99999),
	(0,569,109,'0',1,'0',9999),
	(10000,570,109,'10',2,'39',39999),
	(40000,571,109,'400',3,'899',89999),
	(90000,572,109,'9000',4,'9999',99999),
	(0,573,110,'00',2,'39',39999),
	(40000,574,110,'400',3,'699',69999),
	(70000,575,110,'70',2,'84',84999),
	(85000,576,110,'8500',4,'8799',87999),
	(88000,577,110,'88',2,'99',99999),
	(0,578,111,'0',1,'0',9999),
	(10000,579,111,'10',2,'18',18999),
	(19000,580,111,'1900',4,'1999',19999),
	(20000,581,111,'20',2,'49',49999),
	(50000,582,111,'500',3,'899',89999),
	(90000,583,111,'9000',4,'9999',99999),
	(0,584,112,'0',1,'1',19999),
	(20000,585,112,'20',2,'79',79999),
	(80000,586,112,'800',3,'949',94999),
	(95000,587,112,'9500',4,'9999',99999),
	(0,588,113,'00',2,'59',59999),
	(60000,589,113,'600',3,'899',89999),
	(90000,590,113,'9000',4,'9999',99999),
	(0,591,114,'0',1,'2',29999),
	(30000,592,114,'30',2,'69',69999),
	(70000,593,114,'700',3,'949',94999),
	(95000,594,114,'9500',4,'9999',99999),
	(0,595,115,'00',2,'54',54999),
	(55000,596,115,'5500',4,'5599',55999),
	(56000,597,115,'56',2,'59',59999),
	(60000,598,115,'600',3,'849',84999),
	(85000,599,115,'8500',4,'9999',99999),
	(0,600,116,'0',1,'2',29999),
	(30000,601,116,'30',2,'54',54999),
	(55000,602,116,'550',3,'734',73499),
	(73500,603,116,'7350',4,'7499',74999),
	(75000,604,116,'7500',4,'9999',99999),
	(0,605,117,'0',1,'6',69999),
	(70000,606,117,'70',2,'94',94999),
	(95000,607,117,'950',3,'999',99999),
	(0,608,118,'00',2,'39',39999),
	(40000,609,118,'400',3,'899',89999),
	(90000,610,118,'9000',4,'9999',99999),
	(0,611,119,'000',3,'149',14999),
	(15000,612,119,'1500',4,'1999',19999),
	(20000,613,119,'20',2,'69',69999),
	(70000,614,119,'7000',4,'7499',74999),
	(75000,615,119,'750',3,'959',95999),
	(96000,616,119,'9600',4,'9999',99999),
	(0,617,120,'00',2,'39',39999),
	(40000,618,120,'400',3,'899',89999),
	(90000,619,120,'9000',4,'9999',99999),
	(0,620,121,'00',2,'49',49999),
	(50000,621,121,'500',3,'939',93999),
	(94000,622,121,'9400',4,'9999',99999),
	(0,623,122,'00',2,'39',39999),
	(40000,624,122,'400',3,'899',89999),
	(90000,625,122,'9000',4,'9999',99999),
	(0,626,123,'0',1,'5',59999),
	(60000,627,123,'60',2,'89',89999),
	(90000,628,123,'900',3,'989',98999),
	(99000,629,123,'9900',4,'9999',99999),
	(0,630,124,'00',2,'09',9999),
	(10000,631,124,'1',1,'1',19999),
	(20000,632,124,'200',3,'249',24999),
	(25000,633,124,'2500',4,'2999',29999),
	(30000,634,124,'30',2,'59',59999),
	(60000,635,124,'600',3,'899',89999),
	(90000,636,124,'9000',4,'9999',99999),
	(0,637,125,'00',2,'05',5999),
	(6000,638,125,'060',3,'089',8999),
	(9000,639,125,'0900',4,'0999',9999),
	(10000,640,125,'10',2,'69',69999),
	(70000,641,125,'700',3,'969',96999),
	(97000,642,125,'9700',4,'9999',99999),
	(0,643,126,'0',1,'2',29999),
	(30000,644,126,'30',2,'54',54999),
	(55000,645,126,'550',3,'749',74999),
	(75000,646,126,'7500',4,'9499',94999),
	(95000,647,126,'95',2,'99',99999),
	(0,648,127,'0',1,'0',9999),
	(10000,649,127,'100',3,'399',39999),
	(40000,650,127,'4000',4,'4499',44999),
	(45000,651,127,'45',2,'89',89999),
	(90000,652,127,'900',3,'949',94999),
	(95000,653,127,'9500',4,'9999',99999),
	(0,654,128,'0',1,'5',59999),
	(60000,655,128,'60',2,'89',89999),
	(90000,656,128,'900',3,'989',98999),
	(99000,657,128,'9900',4,'9999',99999),
	(0,658,129,'00',2,'89',89999),
	(90000,659,129,'900',3,'989',98999),
	(99000,660,129,'9900',4,'9999',99999),
	(0,661,130,'00',2,'29',29999),
	(30000,662,130,'300',3,'399',39999),
	(40000,663,130,'40',2,'94',94999),
	(95000,664,130,'950',3,'989',98999),
	(99000,665,130,'9900',4,'9999',99999),
	(0,666,131,'0',1,'4',49999),
	(50000,667,131,'50',2,'64',64999),
	(65000,668,131,'650',3,'659',65999),
	(66000,669,131,'66',2,'75',75999),
	(76000,670,131,'760',3,'899',89999),
	(90000,671,131,'9000',4,'9999',99999),
	(0,672,132,'0',1,'3',39999),
	(40000,673,132,'40',2,'89',89999),
	(90000,674,132,'900',3,'989',98999),
	(99000,675,132,'9900',4,'9999',99999),
	(0,676,133,'00',2,'09',9999),
	(10000,677,133,'100',3,'159',15999),
	(16000,678,133,'1600',4,'1999',19999),
	(20000,679,133,'20',2,'79',79999),
	(80000,680,133,'800',3,'949',94999),
	(95000,681,133,'9500',4,'9999',99999),
	(0,682,134,'00',2,'79',79999),
	(80000,683,134,'800',3,'989',98999),
	(99000,684,134,'9900',4,'9999',99999),
	(80000,685,135,'80',2,'94',94999),
	(95000,686,135,'950',3,'989',98999),
	(99000,687,135,'9900',4,'9999',99999),
	(0,688,136,'00',2,'49',49999),
	(50000,689,136,'500',3,'899',89999),
	(90000,690,136,'9000',4,'9999',99999),
	(0,691,137,'0',1,'4',49999),
	(50000,692,137,'50',2,'79',79999),
	(80000,693,137,'800',3,'899',89999),
	(90000,694,137,'9000',4,'9999',99999),
	(0,695,138,'00',2,'39',39999),
	(40000,696,138,'400',3,'899',89999),
	(90000,697,138,'9000',4,'9399',93999),
	(94000,698,138,'940',3,'969',96999),
	(97000,699,138,'97',2,'99',99999),
	(0,700,139,'00',2,'39',39999),
	(40000,701,139,'400',3,'879',87999),
	(88000,702,139,'8800',4,'9999',99999),
	(0,703,140,'0',1,'2',29999),
	(30000,704,140,'30',2,'54',54999),
	(55000,705,140,'550',3,'749',74999),
	(75000,706,140,'7500',4,'9999',99999),
	(0,707,141,'0',1,'0',9999),
	(10000,708,141,'100',3,'199',19999),
	(20000,709,141,'2000',4,'2999',29999),
	(30000,710,141,'30',2,'59',59999),
	(60000,711,141,'600',3,'949',94999),
	(95000,712,141,'9500',4,'9999',99999),
	(0,713,142,'00',2,'49',49999),
	(50000,714,142,'500',3,'799',79999),
	(80000,715,142,'80',2,'99',99999),
	(0,716,144,'0',1,'1',19999),
	(20000,717,144,'20',2,'89',89999),
	(90000,718,144,'900',3,'999',99999),
	(0,719,145,'0',1,'5',59999),
	(60000,720,145,'60',2,'89',89999),
	(90000,721,145,'900',3,'999',99999),
	(0,722,146,'0',1,'3',39999),
	(40000,723,146,'40',2,'79',79999),
	(80000,724,146,'800',3,'999',99999),
	(0,725,147,'0',1,'2',29999),
	(30000,726,147,'30',2,'59',59999),
	(60000,727,147,'600',3,'699',69999),
	(70000,728,147,'70',2,'89',89999),
	(90000,729,147,'90',2,'94',94999),
	(95000,730,147,'950',3,'999',99999),
	(0,731,148,'0',1,'0',9999),
	(10000,732,148,'10',2,'89',89999),
	(90000,733,148,'900',3,'999',99999),
	(0,734,149,'0',1,'3',39999),
	(40000,735,149,'40',2,'94',94999),
	(95000,736,149,'950',3,'999',99999),
	(0,737,150,'0',1,'2',29999),
	(30000,738,150,'30',2,'89',89999),
	(90000,739,150,'900',3,'999',99999),
	(0,740,151,'00',2,'59',59999),
	(60000,741,151,'600',3,'999',99999),
	(0,742,152,'0',1,'3',39999),
	(40000,743,152,'400',3,'599',59999),
	(60000,744,152,'60',2,'89',89999),
	(90000,745,152,'900',3,'999',99999),
	(0,746,153,'0',1,'2',29999),
	(30000,747,153,'30',2,'35',35999),
	(60000,748,153,'600',3,'604',60499),
	(0,749,154,'0',1,'4',49999),
	(50000,750,154,'50',2,'89',89999),
	(90000,751,154,'900',3,'999',99999),
	(0,752,155,'0',1,'4',49999),
	(50000,753,155,'50',2,'79',79999),
	(80000,754,155,'800',3,'999',99999),
	(0,755,156,'0',1,'2',29999),
	(30000,756,156,'30',2,'69',69999),
	(70000,757,156,'700',3,'999',99999),
	(0,758,157,'0',1,'2',29999),
	(30000,759,157,'30',2,'89',89999),
	(90000,760,157,'900',3,'999',99999),
	(0,761,158,'0',1,'3',39999),
	(40000,762,158,'40',2,'79',79999),
	(80000,763,158,'800',3,'999',99999),
	(0,764,159,'0',1,'2',29999),
	(30000,765,159,'300',3,'399',39999),
	(40000,766,159,'40',2,'69',69999),
	(90000,767,159,'900',3,'999',99999),
	(0,768,160,'0',1,'4',49999),
	(50000,769,160,'50',2,'89',89999),
	(90000,770,160,'900',3,'999',99999),
	(0,771,161,'0',1,'1',19999),
	(20000,772,161,'20',2,'69',69999),
	(70000,773,161,'700',3,'799',79999),
	(80000,774,161,'8',1,'8',89999),
	(90000,775,161,'90',2,'99',99999),
	(0,776,162,'0',1,'3',39999),
	(40000,777,162,'40',2,'69',69999),
	(70000,778,162,'700',3,'999',99999),
	(0,779,163,'0',1,'1',19999),
	(20000,780,163,'20',2,'79',79999),
	(80000,781,163,'800',3,'999',99999),
	(0,782,164,'0',1,'1',19999),
	(20000,783,164,'20',2,'79',79999),
	(80000,784,164,'800',3,'999',99999),
	(0,785,165,'0',1,'3',39999),
	(40000,786,165,'40',2,'79',79999),
	(80000,787,165,'800',3,'999',99999),
	(0,788,166,'0',1,'0',9999),
	(10000,789,166,'10',2,'59',59999),
	(60000,790,166,'600',3,'999',99999),
	(0,791,167,'0',1,'2',29999),
	(30000,792,167,'30',2,'59',59999),
	(60000,793,167,'600',3,'999',99999),
	(0,794,168,'0',1,'0',9999),
	(10000,795,168,'10',2,'79',79999),
	(80000,796,168,'800',3,'999',99999),
	(0,797,169,'0',1,'4',49999),
	(50000,798,169,'50',2,'79',79999),
	(80000,799,169,'800',3,'999',99999),
	(0,800,170,'0',1,'4',49999),
	(50000,801,170,'50',2,'79',79999),
	(80000,802,170,'800',3,'999',99999),
	(0,803,171,'0',1,'4',49999),
	(50000,804,171,'50',2,'79',79999),
	(80000,805,171,'800',3,'999',99999),
	(0,806,172,'0',1,'0',9999),
	(10000,807,172,'10',2,'59',59999),
	(60000,808,172,'600',3,'699',69999),
	(70000,809,172,'7',1,'7',79999),
	(80000,810,172,'80',2,'99',99999),
	(0,811,173,'0',1,'2',29999),
	(30000,812,173,'30',2,'59',59999),
	(60000,813,173,'600',3,'999',99999),
	(0,814,174,'0',1,'1',19999),
	(20000,815,174,'20',2,'79',79999),
	(80000,816,174,'800',3,'999',99999),
	(0,817,175,'0',1,'2',29999),
	(30000,818,175,'30',2,'59',59999),
	(60000,819,175,'600',3,'699',69999),
	(70000,820,175,'7',1,'8',89999),
	(90000,821,175,'90',2,'99',99999),
	(0,822,176,'0',1,'0',9999),
	(10000,823,176,'10',2,'59',59999),
	(60000,824,176,'600',3,'999',99999),
	(0,825,177,'0',1,'1',19999),
	(20000,826,177,'20',2,'59',59999),
	(60000,827,177,'600',3,'999',99999),
	(0,828,178,'0',1,'1',19999),
	(20000,829,178,'20',2,'59',59999),
	(60000,830,178,'600',3,'899',89999),
	(90000,831,178,'90',2,'99',99999),
	(0,832,179,'0',1,'5',59999),
	(60000,833,179,'60',2,'89',89999),
	(90000,834,179,'900',3,'999',99999),
	(0,835,180,'0',1,'0',9999),
	(10000,836,180,'10',2,'69',69999),
	(70000,837,180,'700',3,'999',99999),
	(0,838,181,'0',1,'2',29999),
	(30000,839,181,'30',2,'79',79999),
	(80000,840,181,'800',3,'999',99999),
	(0,841,182,'0',1,'4',49999),
	(50000,842,182,'50',2,'79',79999),
	(80000,843,182,'800',3,'999',99999),
	(0,844,183,'0',1,'2',29999),
	(30000,845,183,'30',2,'59',59999),
	(60000,846,183,'600',3,'999',99999),
	(0,847,184,'0',1,'4',49999),
	(50000,848,184,'50',2,'79',79999),
	(80000,849,184,'800',3,'999',99999),
	(0,850,185,'0',1,'5',59999),
	(60000,851,185,'60',2,'89',89999),
	(90000,852,185,'900',3,'999',99999),
	(0,853,186,'0',1,'2',29999),
	(30000,854,186,'30',2,'59',59999),
	(60000,855,186,'600',3,'999',99999),
	(0,856,187,'0',1,'2',29999),
	(30000,857,187,'30',2,'69',69999),
	(70000,858,187,'700',3,'999',99999),
	(0,859,188,'0',1,'4',49999),
	(50000,860,188,'50',2,'79',79999),
	(80000,861,188,'800',3,'999',99999),
	(0,862,189,'0',1,'1',19999),
	(20000,863,189,'20',2,'89',89999),
	(90000,864,189,'900',3,'999',99999),
	(0,865,190,'0',1,'4',49999),
	(50000,866,190,'50',2,'79',79999),
	(80000,867,190,'800',3,'999',99999),
	(0,868,192,'0',1,'4',49999),
	(50000,869,192,'50',2,'79',79999),
	(80000,870,192,'800',3,'999',99999),
	(0,871,193,'0',1,'2',29999),
	(30000,872,193,'30',2,'79',79999),
	(80000,873,193,'800',3,'939',93999),
	(94000,874,193,'94',2,'99',99999),
	(0,875,194,'0',1,'2',29999),
	(30000,876,194,'30',2,'69',69999),
	(70000,877,194,'700',3,'999',99999),
	(0,878,195,'0',1,'1',19999),
	(20000,879,195,'20',2,'59',59999),
	(60000,880,195,'600',3,'799',79999),
	(80000,881,195,'80',2,'89',89999),
	(90000,882,195,'90',2,'99',99999),
	(0,883,196,'00',2,'59',59999),
	(60000,884,196,'600',3,'859',85999),
	(86000,885,196,'86',2,'99',99999),
	(0,886,197,'0',1,'1',19999),
	(20000,887,197,'20',2,'79',79999),
	(80000,888,197,'800',3,'999',99999),
	(0,889,198,'0',1,'4',49999),
	(50000,890,198,'50',2,'94',94999),
	(95000,891,198,'950',3,'999',99999),
	(0,892,199,'0',1,'2',29999),
	(30000,893,199,'30',2,'59',59999),
	(60000,894,199,'600',3,'999',99999),
	(0,895,200,'0',1,'0',9999),
	(10000,896,200,'10',2,'94',94999),
	(95000,897,200,'950',3,'999',99999),
	(0,898,201,'0',1,'3',39999),
	(40000,899,201,'40',2,'89',89999),
	(90000,900,201,'900',3,'999',99999),
	(0,901,202,'0',1,'4',49999),
	(50000,902,202,'50',2,'79',79999),
	(80000,903,202,'800',3,'999',99999),
	(0,904,203,'00',2,'49',49999),
	(50000,905,203,'500',3,'999',99999),
	(0,906,204,'0',1,'1',19999),
	(20000,907,204,'20',2,'79',79999),
	(80000,908,204,'800',3,'999',99999),
	(0,909,205,'0',1,'3',39999),
	(40000,910,205,'40',2,'79',79999),
	(80000,911,205,'800',3,'999',99999),
	(0,912,206,'0',1,'2',29999),
	(30000,913,206,'30',2,'69',69999),
	(70000,914,206,'700',3,'799',79999),
	(0,915,207,'0',1,'1',19999),
	(20000,916,207,'20',2,'59',59999),
	(60000,917,207,'600',3,'899',89999),
	(0,918,208,'0',1,'3',39999),
	(40000,919,208,'400',3,'599',59999),
	(60000,920,208,'60',2,'89',89999),
	(90000,921,208,'900',3,'999',99999),
	(0,922,209,'00',2,'19',19999),
	(20000,923,209,'200',3,'699',69999),
	(70000,924,209,'7000',4,'8999',89999),
	(90000,925,209,'90000',5,'97599',97599),
	(97600,926,209,'976000',6,'999999',99999);

/*!40000 ALTER TABLE `ezisbn_registrant_range` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezkeyword
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezkeyword`;

CREATE TABLE `ezkeyword` (
  `class_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezkeyword_attribute_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezkeyword_attribute_link`;

CREATE TABLE `ezkeyword_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  `objectattribute_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezkeyword_attr_link_kid_oaid` (`keyword_id`,`objectattribute_id`),
  KEY `ezkeyword_attr_link_oaid` (`objectattribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezm_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezm_block`;

CREATE TABLE `ezm_block` (
  `id` char(32) NOT NULL,
  `zone_id` char(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `node_id` int(10) unsigned NOT NULL,
  `overflow_id` char(32) DEFAULT NULL,
  `last_update` int(10) unsigned DEFAULT '0',
  `block_type` varchar(255) DEFAULT NULL,
  `fetch_params` longtext,
  `rotation_type` int(10) unsigned DEFAULT NULL,
  `rotation_interval` int(10) unsigned DEFAULT NULL,
  `is_removed` int(2) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezm_block__is_removed` (`is_removed`),
  KEY `ezm_block__node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezm_pool
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezm_pool`;

CREATE TABLE `ezm_pool` (
  `block_id` char(32) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned DEFAULT '0',
  `ts_publication` int(11) DEFAULT '0',
  `ts_visible` int(10) unsigned DEFAULT '0',
  `ts_hidden` int(10) unsigned DEFAULT '0',
  `rotation_until` int(10) unsigned DEFAULT '0',
  `moved_to` char(32) DEFAULT NULL,
  PRIMARY KEY (`block_id`,`object_id`),
  KEY `ezm_pool__block_id__ts_publication__priority` (`block_id`,`ts_publication`,`priority`),
  KEY `ezm_pool__block_id__ts_visible` (`block_id`,`ts_visible`),
  KEY `ezm_pool__block_id__ts_hidden` (`block_id`,`ts_hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezmedia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezmedia`;

CREATE TABLE `ezmedia` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `controls` varchar(50) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `has_controller` int(11) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `is_autoplay` int(11) DEFAULT '0',
  `is_loop` int(11) DEFAULT '0',
  `mime_type` varchar(50) NOT NULL DEFAULT '',
  `original_filename` varchar(255) NOT NULL DEFAULT '',
  `pluginspage` varchar(255) DEFAULT NULL,
  `quality` varchar(50) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezmessage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezmessage`;

CREATE TABLE `ezmessage` (
  `body` longtext,
  `destination_address` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_sent` int(11) NOT NULL DEFAULT '0',
  `send_method` varchar(50) NOT NULL DEFAULT '',
  `send_time` varchar(50) NOT NULL DEFAULT '',
  `send_weekday` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezmodule_run
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezmodule_run`;

CREATE TABLE `ezmodule_run` (
  `function_name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_data` longtext,
  `module_name` varchar(255) DEFAULT NULL,
  `workflow_process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezmodule_run_workflow_process_id_s` (`workflow_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezmultipricedata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezmultipricedata`;

CREATE TABLE `ezmultipricedata` (
  `contentobject_attr_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attr_version` int(11) NOT NULL DEFAULT '0',
  `currency_code` varchar(4) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `ezmultipricedata_coa_id` (`contentobject_attr_id`),
  KEY `ezmultipricedata_coa_version` (`contentobject_attr_version`),
  KEY `ezmultipricedata_currency_code` (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table eznode_assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eznode_assignment`;

CREATE TABLE `eznode_assignment` (
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `from_node_id` int(11) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_main` int(11) NOT NULL DEFAULT '0',
  `op_code` int(11) NOT NULL DEFAULT '0',
  `parent_node` int(11) DEFAULT NULL,
  `parent_remote_id` varchar(100) NOT NULL DEFAULT '',
  `remote_id` varchar(100) NOT NULL DEFAULT '0',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eznode_assignment_co_version` (`contentobject_version`),
  KEY `eznode_assignment_coid_cov` (`contentobject_id`,`contentobject_version`),
  KEY `eznode_assignment_is_main` (`is_main`),
  KEY `eznode_assignment_parent_node` (`parent_node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `eznode_assignment` WRITE;
/*!40000 ALTER TABLE `eznode_assignment` DISABLE KEYS */;

INSERT INTO `eznode_assignment` (`contentobject_id`, `contentobject_version`, `from_node_id`, `id`, `is_main`, `op_code`, `parent_node`, `parent_remote_id`, `remote_id`, `sort_field`, `sort_order`, `priority`, `is_hidden`)
VALUES
	(8,2,0,4,1,2,5,'','0',1,1,0,0),
	(42,1,0,5,1,2,5,'','0',9,1,0,0),
	(10,2,-1,6,1,2,44,'','0',9,1,0,0),
	(4,1,0,7,1,2,1,'','0',1,1,0,0),
	(12,1,0,8,1,2,5,'','0',1,1,0,0),
	(13,1,0,9,1,2,5,'','0',1,1,0,0),
	(41,1,0,11,1,2,1,'','0',1,1,0,0),
	(11,1,0,12,1,2,5,'','0',1,1,0,0),
	(45,1,-1,16,1,2,1,'','0',9,1,0,0),
	(49,1,0,27,1,2,43,'','0',9,1,0,0),
	(50,1,0,28,1,2,43,'','0',9,1,0,0),
	(51,1,0,29,1,2,43,'','0',9,1,0,0),
	(52,1,0,30,1,2,48,'','0',1,1,0,0),
	(56,1,0,34,1,2,1,'','0',2,0,0,0),
	(14,3,-1,38,1,2,13,'','0',1,1,0,0),
	(54,2,-1,39,1,2,58,'','0',1,1,0,0);

/*!40000 ALTER TABLE `eznode_assignment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table eznotificationcollection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eznotificationcollection`;

CREATE TABLE `eznotificationcollection` (
  `data_subject` longtext NOT NULL,
  `data_text` longtext NOT NULL,
  `event_id` int(11) NOT NULL DEFAULT '0',
  `handler` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transport` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table eznotificationcollection_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eznotificationcollection_item`;

CREATE TABLE `eznotificationcollection_item` (
  `address` varchar(255) NOT NULL DEFAULT '',
  `collection_id` int(11) NOT NULL DEFAULT '0',
  `event_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table eznotificationevent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eznotificationevent`;

CREATE TABLE `eznotificationevent` (
  `data_int1` int(11) NOT NULL DEFAULT '0',
  `data_int2` int(11) NOT NULL DEFAULT '0',
  `data_int3` int(11) NOT NULL DEFAULT '0',
  `data_int4` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `data_text2` longtext NOT NULL,
  `data_text3` longtext NOT NULL,
  `data_text4` longtext NOT NULL,
  `event_type_string` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezoperation_memento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezoperation_memento`;

CREATE TABLE `ezoperation_memento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` int(11) NOT NULL DEFAULT '0',
  `main_key` varchar(32) NOT NULL DEFAULT '',
  `memento_data` longtext NOT NULL,
  `memento_key` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`memento_key`),
  KEY `ezoperation_memento_memento_key_main` (`memento_key`,`main`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezorder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezorder`;

CREATE TABLE `ezorder` (
  `account_identifier` varchar(100) NOT NULL DEFAULT 'default',
  `created` int(11) NOT NULL DEFAULT '0',
  `data_text_1` longtext,
  `data_text_2` longtext,
  `email` varchar(150) DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ignore_vat` int(11) NOT NULL DEFAULT '0',
  `is_archived` int(11) NOT NULL DEFAULT '0',
  `is_temporary` int(11) NOT NULL DEFAULT '1',
  `order_nr` int(11) NOT NULL DEFAULT '0',
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) DEFAULT '0',
  `status_modified` int(11) DEFAULT '0',
  `status_modifier_id` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_is_archived` (`is_archived`),
  KEY `ezorder_is_tmp` (`is_temporary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezorder_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezorder_item`;

CREATE TABLE `ezorder_item` (
  `description` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_vat_inc` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `price` float DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `vat_value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_item_order_id` (`order_id`),
  KEY `ezorder_item_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezorder_nr_incr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezorder_nr_incr`;

CREATE TABLE `ezorder_nr_incr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezorder_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezorder_status`;

CREATE TABLE `ezorder_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `status_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_status_active` (`is_active`),
  KEY `ezorder_status_name` (`name`),
  KEY `ezorder_status_sid` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezorder_status` WRITE;
/*!40000 ALTER TABLE `ezorder_status` DISABLE KEYS */;

INSERT INTO `ezorder_status` (`id`, `is_active`, `name`, `status_id`)
VALUES
	(1,1,'Pending',1),
	(2,1,'Processing',2),
	(3,1,'Delivered',3);

/*!40000 ALTER TABLE `ezorder_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezorder_status_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezorder_status_history`;

CREATE TABLE `ezorder_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_status_history_mod` (`modified`),
  KEY `ezorder_status_history_oid` (`order_id`),
  KEY `ezorder_status_history_sid` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezpackage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpackage`;

CREATE TABLE `ezpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `install_date` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `version` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezpackage` WRITE;
/*!40000 ALTER TABLE `ezpackage` DISABLE KEYS */;

INSERT INTO `ezpackage` (`id`, `install_date`, `name`, `version`)
VALUES
	(1,1301057838,'plain_site_data','1.0-1');

/*!40000 ALTER TABLE `ezpackage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezpaymentobject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpaymentobject`;

CREATE TABLE `ezpaymentobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `payment_string` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `workflowprocess_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezpdf_export
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpdf_export`;

CREATE TABLE `ezpdf_export` (
  `created` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `export_classes` varchar(255) DEFAULT NULL,
  `export_structure` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intro_text` longtext,
  `modified` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `pdf_filename` varchar(255) DEFAULT NULL,
  `show_frontpage` int(11) DEFAULT NULL,
  `site_access` varchar(255) DEFAULT NULL,
  `source_node_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sub_text` longtext,
  `title` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezpending_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpending_actions`;

CREATE TABLE `ezpending_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `created` int(11) DEFAULT NULL,
  `param` longtext,
  PRIMARY KEY (`id`),
  KEY `ezpending_actions_action` (`action`),
  KEY `ezpending_actions_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezpolicy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpolicy`;

CREATE TABLE `ezpolicy` (
  `function_name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) DEFAULT NULL,
  `original_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_original_id` (`original_id`),
  KEY `ezpolicy_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;

INSERT INTO `ezpolicy` (`function_name`, `id`, `module_name`, `original_id`, `role_id`)
VALUES
	('*',317,'content',0,3),
	('login',319,'user',0,3),
	('read',328,'content',0,1),
	('login',331,'user',0,1),
	('*',332,'*',0,2),
	('read',333,'content',0,4);

/*!40000 ALTER TABLE `ezpolicy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezpolicy_limitation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpolicy_limitation`;

CREATE TABLE `ezpolicy_limitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `policy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;

INSERT INTO `ezpolicy_limitation` (`id`, `identifier`, `policy_id`)
VALUES
	(251,'Section',328),
	(252,'Section',329),
	(253,'SiteAccess',331),
	(254,'Class',333),
	(255,'Owner',333);

/*!40000 ALTER TABLE `ezpolicy_limitation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezpolicy_limitation_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpolicy_limitation_value`;

CREATE TABLE `ezpolicy_limitation_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_limitation_value_val` (`value`),
  KEY `ezpolicy_limit_value_limit_id` (`limitation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezpolicy_limitation_value` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation_value` DISABLE KEYS */;

INSERT INTO `ezpolicy_limitation_value` (`id`, `limitation_id`, `value`)
VALUES
	(477,251,'1'),
	(478,252,'1'),
	(479,253,'1766001124'),
	(480,254,'4'),
	(481,255,'1');

/*!40000 ALTER TABLE `ezpolicy_limitation_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpreferences`;

CREATE TABLE `ezpreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `ezpreferences_name` (`name`),
  KEY `ezpreferences_user_id_idx` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezprest_authcode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezprest_authcode`;

CREATE TABLE `ezprest_authcode` (
  `client_id` varchar(200) NOT NULL DEFAULT '',
  `expirytime` bigint(20) NOT NULL DEFAULT '0',
  `id` varchar(200) NOT NULL DEFAULT '',
  `scope` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `authcode_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezprest_authorized_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezprest_authorized_clients`;

CREATE TABLE `ezprest_authorized_clients` (
  `created` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rest_client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_user` (`rest_client_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezprest_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezprest_clients`;

CREATE TABLE `ezprest_clients` (
  `client_id` varchar(200) DEFAULT NULL,
  `client_secret` varchar(200) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `description` longtext,
  `endpoint_uri` varchar(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `updated` int(11) NOT NULL DEFAULT '0',
  `version` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id_unique` (`client_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezprest_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezprest_token`;

CREATE TABLE `ezprest_token` (
  `client_id` varchar(200) NOT NULL DEFAULT '',
  `expirytime` bigint(20) NOT NULL DEFAULT '0',
  `id` varchar(200) NOT NULL DEFAULT '',
  `refresh_token` varchar(200) NOT NULL DEFAULT '',
  `scope` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezproductcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezproductcategory`;

CREATE TABLE `ezproductcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezproductcollection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezproductcollection`;

CREATE TABLE `ezproductcollection` (
  `created` int(11) DEFAULT NULL,
  `currency_code` varchar(4) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezproductcollection_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezproductcollection_item`;

CREATE TABLE `ezproductcollection_item` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `discount` float DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_vat_inc` int(11) DEFAULT NULL,
  `item_count` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` float DEFAULT '0',
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `vat_value` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezproductcollection_item_contentobject_id` (`contentobject_id`),
  KEY `ezproductcollection_item_productcollection_id` (`productcollection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezproductcollection_item_opt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezproductcollection_item_opt`;

CREATE TABLE `ezproductcollection_item_opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `object_attribute_id` int(11) DEFAULT NULL,
  `option_item_id` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezproductcollection_item_opt_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezpublishingqueueprocesses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezpublishingqueueprocesses`;

CREATE TABLE `ezpublishingqueueprocesses` (
  `created` int(11) DEFAULT NULL,
  `ezcontentobject_version_id` int(11) NOT NULL DEFAULT '0',
  `finished` int(11) DEFAULT NULL,
  `pid` int(8) DEFAULT NULL,
  `started` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`ezcontentobject_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezrole`;

CREATE TABLE `ezrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` char(1) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezrole` WRITE;
/*!40000 ALTER TABLE `ezrole` DISABLE KEYS */;

INSERT INTO `ezrole` (`id`, `is_new`, `name`, `value`, `version`)
VALUES
	(1,0,'Anonymous','',0),
	(2,0,'Administrator','0',0),
	(3,0,'Editor','',0),
	(4,0,'Member','',0);

/*!40000 ALTER TABLE `ezrole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezrss_export
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezrss_export`;

CREATE TABLE `ezrss_export` (
  `access_url` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `description` longtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `main_node_only` int(11) NOT NULL DEFAULT '1',
  `modified` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `number_of_objects` int(11) NOT NULL DEFAULT '0',
  `rss_version` varchar(255) DEFAULT NULL,
  `site_access` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezrss_export_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezrss_export_item`;

CREATE TABLE `ezrss_export_item` (
  `category` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enclosure` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssexport_id` int(11) DEFAULT NULL,
  `source_node_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `subnodes` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`status`),
  KEY `ezrss_export_rsseid` (`rssexport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezrss_import
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezrss_import`;

CREATE TABLE `ezrss_import` (
  `active` int(11) DEFAULT NULL,
  `class_description` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `class_title` varchar(255) DEFAULT NULL,
  `class_url` varchar(255) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `destination_node_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_description` longtext NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `object_owner_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `url` longtext,
  PRIMARY KEY (`id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezscheduled_script
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezscheduled_script`;

CREATE TABLE `ezscheduled_script` (
  `command` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_report_timestamp` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `process_id` int(11) NOT NULL DEFAULT '0',
  `progress` int(3) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezscheduled_script_timestamp` (`last_report_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezsearch_object_word_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsearch_object_word_link`;

CREATE TABLE `ezsearch_object_word_link` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `frequency` float NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `integer_value` int(11) NOT NULL DEFAULT '0',
  `next_word_id` int(11) NOT NULL DEFAULT '0',
  `placement` int(11) NOT NULL DEFAULT '0',
  `prev_word_id` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `word_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsearch_object_word_link_frequency` (`frequency`),
  KEY `ezsearch_object_word_link_identifier` (`identifier`),
  KEY `ezsearch_object_word_link_integer_value` (`integer_value`),
  KEY `ezsearch_object_word_link_object` (`contentobject_id`),
  KEY `ezsearch_object_word_link_word` (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezsearch_object_word_link` WRITE;
/*!40000 ALTER TABLE `ezsearch_object_word_link` DISABLE KEYS */;

INSERT INTO `ezsearch_object_word_link` (`contentclass_attribute_id`, `contentclass_id`, `contentobject_id`, `frequency`, `id`, `identifier`, `integer_value`, `next_word_id`, `placement`, `prev_word_id`, `published`, `section_id`, `word_id`)
VALUES
	(4,1,1,0,4699,'name',0,970,0,0,1448889046,1,969),
	(4,1,1,0,4700,'name',0,971,1,969,1448889046,1,970),
	(4,1,1,0,4701,'name',0,972,2,970,1448889046,1,971),
	(4,1,1,0,4702,'name',0,973,3,971,1448889046,1,972),
	(119,1,1,0,4703,'short_description',0,974,4,972,1448889046,1,973),
	(119,1,1,0,4704,'short_description',0,975,5,973,1448889046,1,974),
	(119,1,1,0,4705,'short_description',0,976,6,974,1448889046,1,975),
	(119,1,1,0,4706,'short_description',0,977,7,975,1448889046,1,976),
	(119,1,1,0,4707,'short_description',0,978,8,976,1448889046,1,977),
	(119,1,1,0,4708,'short_description',0,979,9,977,1448889046,1,978),
	(119,1,1,0,4709,'short_description',0,971,10,978,1448889046,1,979),
	(119,1,1,0,4710,'short_description',0,972,11,979,1448889046,1,971),
	(119,1,1,0,4711,'short_description',0,980,12,971,1448889046,1,972),
	(119,1,1,0,4712,'short_description',0,981,13,972,1448889046,1,980),
	(119,1,1,0,4713,'short_description',0,982,14,980,1448889046,1,981),
	(119,1,1,0,4714,'short_description',0,983,15,981,1448889046,1,982),
	(119,1,1,0,4715,'short_description',0,984,16,982,1448889046,1,983),
	(119,1,1,0,4716,'short_description',0,985,17,983,1448889046,1,984),
	(119,1,1,0,4717,'short_description',0,975,18,984,1448889046,1,985),
	(119,1,1,0,4718,'short_description',0,972,19,985,1448889046,1,975),
	(119,1,1,0,4719,'short_description',0,986,20,975,1448889046,1,972),
	(119,1,1,0,4720,'short_description',0,987,21,972,1448889046,1,986),
	(119,1,1,0,4721,'short_description',0,988,22,986,1448889046,1,987),
	(119,1,1,0,4722,'short_description',0,970,23,987,1448889046,1,988),
	(119,1,1,0,4723,'short_description',0,989,24,988,1448889046,1,970),
	(119,1,1,0,4724,'short_description',0,990,25,970,1448889046,1,989),
	(119,1,1,0,4725,'short_description',0,991,26,989,1448889046,1,990),
	(119,1,1,0,4726,'short_description',0,992,27,990,1448889046,1,991),
	(119,1,1,0,4727,'short_description',0,993,28,991,1448889046,1,992),
	(119,1,1,0,4728,'short_description',0,970,29,992,1448889046,1,993),
	(119,1,1,0,4729,'short_description',0,989,30,993,1448889046,1,970),
	(119,1,1,0,4730,'short_description',0,994,31,970,1448889046,1,989),
	(119,1,1,0,4731,'short_description',0,995,32,989,1448889046,1,994),
	(119,1,1,0,4732,'short_description',0,996,33,994,1448889046,1,995),
	(119,1,1,0,4733,'short_description',0,997,34,995,1448889046,1,996),
	(119,1,1,0,4734,'short_description',0,998,35,996,1448889046,1,997),
	(119,1,1,0,4735,'short_description',0,970,36,997,1448889046,1,998),
	(119,1,1,0,4736,'short_description',0,999,37,998,1448889046,1,970),
	(119,1,1,0,4737,'short_description',0,1000,38,970,1448889046,1,999),
	(119,1,1,0,4738,'short_description',0,1001,39,999,1448889046,1,1000),
	(119,1,1,0,4739,'short_description',0,1002,40,1000,1448889046,1,1001),
	(119,1,1,0,4740,'short_description',0,1003,41,1001,1448889046,1,1002),
	(119,1,1,0,4741,'short_description',0,1004,42,1002,1448889046,1,1003),
	(119,1,1,0,4742,'short_description',0,1005,43,1003,1448889046,1,1004),
	(119,1,1,0,4743,'short_description',0,1006,44,1004,1448889046,1,1005),
	(119,1,1,0,4744,'short_description',0,975,45,1005,1448889046,1,1006),
	(119,1,1,0,4745,'short_description',0,1007,46,1006,1448889046,1,975),
	(119,1,1,0,4746,'short_description',0,971,47,975,1448889046,1,1007),
	(155,1,1,0,4747,'short_name',0,972,48,1007,1448889046,1,971),
	(155,1,1,0,4748,'short_name',0,969,49,971,1448889046,1,972),
	(156,1,1,0,4749,'description',0,970,50,972,1448889046,1,969),
	(156,1,1,0,4750,'description',0,971,51,969,1448889046,1,970),
	(156,1,1,0,4751,'description',0,972,52,970,1448889046,1,971),
	(156,1,1,0,4752,'description',0,1008,53,971,1448889046,1,972),
	(156,1,1,0,4753,'description',0,992,54,972,1448889046,1,1008),
	(156,1,1,0,4754,'description',0,1009,55,1008,1448889046,1,992),
	(156,1,1,0,4755,'description',0,1010,56,992,1448889046,1,1009),
	(156,1,1,0,4756,'description',0,971,57,1009,1448889046,1,1010),
	(156,1,1,0,4757,'description',0,972,58,1010,1448889046,1,971),
	(156,1,1,0,4758,'description',0,971,59,971,1448889046,1,972),
	(156,1,1,0,4759,'description',0,972,60,972,1448889046,1,971),
	(156,1,1,0,4760,'description',0,974,61,971,1448889046,1,972),
	(156,1,1,0,4761,'description',0,975,62,972,1448889046,1,974),
	(156,1,1,0,4762,'description',0,1011,63,974,1448889046,1,975),
	(156,1,1,0,4763,'description',0,1012,64,975,1448889046,1,1011),
	(156,1,1,0,4764,'description',0,1013,65,1011,1448889046,1,1012),
	(156,1,1,0,4765,'description',0,1014,66,1012,1448889046,1,1013),
	(156,1,1,0,4766,'description',0,972,67,1013,1448889046,1,1014),
	(156,1,1,0,4767,'description',0,994,68,1014,1448889046,1,972),
	(156,1,1,0,4768,'description',0,971,69,972,1448889046,1,994),
	(156,1,1,0,4769,'description',0,1015,70,994,1448889046,1,971),
	(156,1,1,0,4770,'description',0,1016,71,971,1448889046,1,1015),
	(156,1,1,0,4771,'description',0,975,72,1015,1448889046,1,1016),
	(156,1,1,0,4772,'description',0,971,73,1016,1448889046,1,975),
	(156,1,1,0,4773,'description',0,1017,74,975,1448889046,1,971),
	(156,1,1,0,4774,'description',0,1018,75,971,1448889046,1,1017),
	(156,1,1,0,4775,'description',0,971,76,1017,1448889046,1,1018),
	(156,1,1,0,4776,'description',0,1019,77,1018,1448889046,1,971),
	(156,1,1,0,4777,'description',0,1020,78,971,1448889046,1,1019),
	(156,1,1,0,4778,'description',0,1021,79,1019,1448889046,1,1020),
	(156,1,1,0,4779,'description',0,1022,80,1020,1448889046,1,1021),
	(156,1,1,0,4780,'description',0,1023,81,1021,1448889046,1,1022),
	(156,1,1,0,4781,'description',0,1024,82,1022,1448889046,1,1023),
	(156,1,1,0,4782,'description',0,1025,83,1023,1448889046,1,1024),
	(156,1,1,0,4783,'description',0,1006,84,1024,1448889046,1,1025),
	(156,1,1,0,4784,'description',0,1026,85,1025,1448889046,1,1006),
	(156,1,1,0,4785,'description',0,975,86,1006,1448889046,1,1026),
	(156,1,1,0,4786,'description',0,1027,87,1026,1448889046,1,975),
	(156,1,1,0,4787,'description',0,1028,88,975,1448889046,1,1027),
	(156,1,1,0,4788,'description',0,1029,89,1027,1448889046,1,1028),
	(156,1,1,0,4789,'description',0,1030,90,1028,1448889046,1,1029),
	(156,1,1,0,4790,'description',0,996,91,1029,1448889046,1,1030),
	(156,1,1,0,4791,'description',0,971,92,1030,1448889046,1,996),
	(156,1,1,0,4792,'description',0,972,93,996,1448889046,1,971),
	(156,1,1,0,4793,'description',0,1016,94,971,1448889046,1,972),
	(156,1,1,0,4794,'description',0,971,95,972,1448889046,1,1016),
	(156,1,1,0,4795,'description',0,1031,96,1016,1448889046,1,971),
	(156,1,1,0,4796,'description',0,1032,97,971,1448889046,1,1031),
	(156,1,1,0,4797,'description',0,1033,98,1031,1448889046,1,1032),
	(156,1,1,0,4798,'description',0,996,99,1032,1448889046,1,1033),
	(156,1,1,0,4799,'description',0,971,100,1033,1448889046,1,996),
	(156,1,1,0,4800,'description',0,972,101,996,1448889046,1,971),
	(156,1,1,0,4801,'description',0,1016,102,971,1448889046,1,972),
	(156,1,1,0,4802,'description',0,971,103,972,1448889046,1,1016),
	(156,1,1,0,4803,'description',0,1019,104,1016,1448889046,1,971),
	(156,1,1,0,4804,'description',0,972,105,971,1448889046,1,1019),
	(156,1,1,0,4805,'description',0,1011,106,1019,1448889046,1,972),
	(156,1,1,0,4806,'description',0,1034,107,972,1448889046,1,1011),
	(156,1,1,0,4807,'description',0,971,108,1011,1448889046,1,1034),
	(156,1,1,0,4808,'description',0,972,109,1034,1448889046,1,971),
	(156,1,1,0,4809,'description',0,1035,110,971,1448889046,1,972),
	(156,1,1,0,4810,'description',0,1036,111,972,1448889046,1,1035),
	(156,1,1,0,4811,'description',0,1037,112,1035,1448889046,1,1036),
	(156,1,1,0,4812,'description',0,1038,113,1036,1448889046,1,1037),
	(156,1,1,0,4813,'description',0,1039,114,1037,1448889046,1,1038),
	(156,1,1,0,4814,'description',0,971,115,1038,1448889046,1,1039),
	(156,1,1,0,4815,'description',0,972,116,1039,1448889046,1,971),
	(156,1,1,0,4816,'description',0,1016,117,971,1448889046,1,972),
	(156,1,1,0,4817,'description',0,971,118,972,1448889046,1,1016),
	(156,1,1,0,4818,'description',0,1019,119,1016,1448889046,1,971),
	(156,1,1,0,4819,'description',0,972,120,971,1448889046,1,1019),
	(156,1,1,0,4820,'description',0,1040,121,1019,1448889046,1,972),
	(156,1,1,0,4821,'description',0,970,122,972,1448889046,1,1040),
	(156,1,1,0,4822,'description',0,975,123,1040,1448889046,1,970),
	(156,1,1,0,4823,'description',0,1041,124,970,1448889046,1,975),
	(156,1,1,0,4824,'description',0,1042,125,975,1448889046,1,1041),
	(156,1,1,0,4825,'description',0,975,126,1041,1448889046,1,1042),
	(156,1,1,0,4826,'description',0,1017,127,1042,1448889046,1,975),
	(156,1,1,0,4827,'description',0,1043,128,975,1448889046,1,1017),
	(156,1,1,0,4828,'description',0,1044,129,1017,1448889046,1,1043),
	(156,1,1,0,4829,'description',0,1045,130,1043,1448889046,1,1044),
	(156,1,1,0,4830,'description',0,970,131,1044,1448889046,1,1045),
	(156,1,1,0,4831,'description',0,975,132,1045,1448889046,1,970),
	(156,1,1,0,4832,'description',0,1046,133,970,1448889046,1,975),
	(156,1,1,0,4833,'description',0,1047,134,975,1448889046,1,1046),
	(156,1,1,0,4834,'description',0,970,135,1046,1448889046,1,1047),
	(156,1,1,0,4835,'description',0,975,136,1047,1448889046,1,970),
	(156,1,1,0,4836,'description',0,1017,137,970,1448889046,1,975),
	(156,1,1,0,4837,'description',0,1048,138,975,1448889046,1,1017),
	(156,1,1,0,4838,'description',0,1049,139,1017,1448889046,1,1048),
	(156,1,1,0,4839,'description',0,971,140,1048,1448889046,1,1049),
	(156,1,1,0,4840,'description',0,1050,141,1049,1448889046,1,971),
	(156,1,1,0,4841,'description',0,975,142,971,1448889046,1,1050),
	(156,1,1,0,4842,'description',0,1017,143,1050,1448889046,1,975),
	(156,1,1,0,4843,'description',0,1051,144,975,1448889046,1,1017),
	(156,1,1,0,4844,'description',0,970,145,1017,1448889046,1,1051),
	(156,1,1,0,4845,'description',0,1052,146,1051,1448889046,1,970),
	(156,1,1,0,4846,'description',0,1053,147,970,1448889046,1,1052),
	(156,1,1,0,4847,'description',0,1054,148,1052,1448889046,1,1053),
	(156,1,1,0,4848,'description',0,1016,149,1053,1448889046,1,1054),
	(156,1,1,0,4849,'description',0,1055,150,1054,1448889046,1,1016),
	(156,1,1,0,4850,'description',0,1042,151,1016,1448889046,1,1055),
	(156,1,1,0,4851,'description',0,975,152,1055,1448889046,1,1042),
	(156,1,1,0,4852,'description',0,1056,153,1042,1448889046,1,975),
	(156,1,1,0,4853,'description',0,1048,154,975,1448889046,1,1056),
	(156,1,1,0,4854,'description',0,975,155,1056,1448889046,1,1048),
	(156,1,1,0,4855,'description',0,971,156,1048,1448889046,1,975),
	(156,1,1,0,4856,'description',0,1017,157,975,1448889046,1,971),
	(156,1,1,0,4857,'description',0,1057,158,971,1448889046,1,1017),
	(156,1,1,0,4858,'description',0,1058,159,1017,1448889046,1,1057),
	(156,1,1,0,4859,'description',0,1059,160,1057,1448889046,1,1058),
	(156,1,1,0,4860,'description',0,0,161,1058,1448889046,1,1059),
	(7,3,4,0,4861,'description',0,1061,0,0,1033917596,2,1060),
	(7,3,4,0,4862,'description',0,1062,1,1060,1033917596,2,1061),
	(6,3,4,0,4863,'name',0,0,2,1061,1033917596,2,1062),
	(8,4,10,0,4864,'first_name',0,1029,0,0,1033920665,2,1063),
	(9,4,10,0,4865,'last_name',0,0,1,1063,1033920665,2,1029),
	(6,3,11,0,4866,'name',0,1065,0,0,1033920746,2,1064),
	(6,3,11,0,4867,'name',0,0,1,1064,1033920746,2,1065),
	(6,3,12,0,4868,'name',0,1062,0,0,1033920775,2,1066),
	(6,3,12,0,4869,'name',0,0,1,1066,1033920775,2,1062),
	(6,3,13,0,4870,'name',0,0,0,0,1033920794,2,1067),
	(8,4,14,0,4871,'first_name',0,1029,0,0,1033920830,2,1066),
	(9,4,14,0,4872,'last_name',0,0,1,1066,1033920830,2,1029),
	(4,1,41,0,4873,'name',0,0,0,0,1060695457,3,1068),
	(6,3,42,0,4874,'name',0,1062,0,0,1072180330,2,1063),
	(6,3,42,0,4875,'name',0,1029,1,1063,1072180330,2,1062),
	(7,3,42,0,4876,'description',0,1061,2,1062,1072180330,2,1029),
	(7,3,42,0,4877,'description',0,996,3,1029,1072180330,2,1061),
	(7,3,42,0,4878,'description',0,975,4,1061,1072180330,2,996),
	(7,3,42,0,4879,'description',0,1063,5,996,1072180330,2,975),
	(7,3,42,0,4880,'description',0,1029,6,975,1072180330,2,1063),
	(7,3,42,0,4881,'description',0,0,7,1063,1072180330,2,1029),
	(4,1,45,0,4882,'name',0,0,0,0,1079684190,4,984),
	(4,1,49,0,4883,'name',0,0,0,0,1080220197,3,1069),
	(4,1,50,0,4884,'name',0,0,0,0,1080220220,3,1070),
	(4,1,51,0,4885,'name',0,0,0,0,1080220233,3,1071);

/*!40000 ALTER TABLE `ezsearch_object_word_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezsearch_return_count
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsearch_return_count`;

CREATE TABLE `ezsearch_return_count` (
  `count` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsearch_return_cnt_ph_id_cnt` (`phrase_id`,`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezsearch_search_phrase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsearch_search_phrase`;

CREATE TABLE `ezsearch_search_phrase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` varchar(250) DEFAULT NULL,
  `phrase_count` int(11) DEFAULT '0',
  `result_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezsearch_search_phrase_phrase` (`phrase`),
  KEY `ezsearch_search_phrase_count` (`phrase_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezsearch_word
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsearch_word`;

CREATE TABLE `ezsearch_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_count` int(11) NOT NULL DEFAULT '0',
  `word` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezsearch_word_obj_count` (`object_count`),
  KEY `ezsearch_word_word_i` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezsearch_word` WRITE;
/*!40000 ALTER TABLE `ezsearch_word` DISABLE KEYS */;

INSERT INTO `ezsearch_word` (`id`, `object_count`, `word`)
VALUES
	(969,1,'welcome'),
	(970,1,'to'),
	(971,1,'ez'),
	(972,1,'platform'),
	(973,1,'this'),
	(974,1,'is'),
	(975,2,'the'),
	(976,1,'clean'),
	(977,1,'install'),
	(978,1,'coming'),
	(979,1,'with'),
	(980,1,'it'),
	(981,1,'s'),
	(982,1,'a'),
	(983,1,'barebone'),
	(984,2,'setup'),
	(985,1,'of'),
	(986,1,'an'),
	(987,1,'excellent'),
	(988,1,'foundation'),
	(989,1,'build'),
	(990,1,'upon'),
	(991,1,'if'),
	(992,1,'you'),
	(993,1,'want'),
	(994,1,'from'),
	(995,1,'scratch'),
	(996,2,'for'),
	(997,1,'more'),
	(998,1,'ready'),
	(999,1,'go'),
	(1000,1,'base'),
	(1001,1,'designs'),
	(1002,1,'or'),
	(1003,1,'demo'),
	(1004,1,'sites'),
	(1005,1,'please'),
	(1006,1,'check'),
	(1007,1,'documentation'),
	(1008,1,'congratulations'),
	(1009,1,'just'),
	(1010,1,'installed'),
	(1011,1,'new'),
	(1012,1,'generation'),
	(1013,1,'content'),
	(1014,1,'management'),
	(1015,1,'systems'),
	(1016,1,'and'),
	(1017,1,'community'),
	(1018,1,'replacing'),
	(1019,1,'publish'),
	(1020,1,'our'),
	(1021,1,'previous'),
	(1022,1,'software'),
	(1023,1,'need'),
	(1024,1,'some'),
	(1025,1,'guidance'),
	(1026,1,'out'),
	(1027,1,'following'),
	(1028,1,'resources'),
	(1029,4,'user'),
	(1030,1,'manual'),
	(1031,1,'studio'),
	(1032,1,'technical'),
	(1033,1,'doc'),
	(1034,1,'stack'),
	(1035,1,'developer'),
	(1036,1,'tutorial'),
	(1037,1,'comparison'),
	(1038,1,'guide'),
	(1039,1,'between'),
	(1040,1,'contribute'),
	(1041,1,'project'),
	(1042,1,'join'),
	(1043,1,'github'),
	(1044,1,'repositories'),
	(1045,1,'open'),
	(1046,1,'public'),
	(1047,1,'register'),
	(1048,1,'on'),
	(1049,1,'share'),
	(1050,1,'no'),
	(1051,1,'site'),
	(1052,1,'access'),
	(1053,1,'forums'),
	(1054,1,'tutorials'),
	(1055,1,'blogs'),
	(1056,1,'conversation'),
	(1057,1,'slack'),
	(1058,1,'good'),
	(1059,1,'luck'),
	(1060,1,'main'),
	(1061,2,'group'),
	(1062,3,'users'),
	(1063,2,'anonymous'),
	(1064,1,'guest'),
	(1065,1,'accounts'),
	(1066,2,'administrator'),
	(1067,1,'editors'),
	(1068,1,'media'),
	(1069,1,'images'),
	(1070,1,'files'),
	(1071,1,'multimedia');

/*!40000 ALTER TABLE `ezsearch_word` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezsection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsection`;

CREATE TABLE `ezsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `navigation_part_identifier` varchar(100) DEFAULT 'ezcontentnavigationpart',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezsection` WRITE;
/*!40000 ALTER TABLE `ezsection` DISABLE KEYS */;

INSERT INTO `ezsection` (`id`, `identifier`, `locale`, `name`, `navigation_part_identifier`)
VALUES
	(1,'standard','','Standard','ezcontentnavigationpart'),
	(2,'users','','Users','ezusernavigationpart'),
	(3,'media','','Media','ezmedianavigationpart'),
	(4,'setup','','Setup','ezsetupnavigationpart'),
	(5,'design','','Design','ezvisualnavigationpart');

/*!40000 ALTER TABLE `ezsection` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezsession
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsession`;

CREATE TABLE `ezsession` (
  `data` longtext NOT NULL,
  `expiration_time` int(11) NOT NULL DEFAULT '0',
  `session_key` varchar(32) NOT NULL DEFAULT '',
  `user_hash` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_key`),
  KEY `expiration_time` (`expiration_time`),
  KEY `ezsession_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezsite_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsite_data`;

CREATE TABLE `ezsite_data` (
  `name` varchar(60) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezsite_data` WRITE;
/*!40000 ALTER TABLE `ezsite_data` DISABLE KEYS */;

INSERT INTO `ezsite_data` (`name`, `value`)
VALUES
	('ezpublish-release','1'),
	('ezpublish-version','6.4.0');

/*!40000 ALTER TABLE `ezsite_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezstarrating
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezstarrating`;

CREATE TABLE `ezstarrating` (
  `contentobject_id` int(11) NOT NULL,
  `contentobject_attribute_id` int(11) NOT NULL,
  `rating_average` float NOT NULL,
  `rating_count` int(11) NOT NULL,
  PRIMARY KEY (`contentobject_id`,`contentobject_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezstarrating_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezstarrating_data`;

CREATE TABLE `ezstarrating_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_key` varchar(32) NOT NULL,
  `rating` float NOT NULL,
  `contentobject_id` int(11) NOT NULL,
  `contentobject_attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_session_key` (`user_id`,`session_key`),
  KEY `contentobject_id_contentobject_attribute_id` (`contentobject_id`,`contentobject_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezsubtree_notification_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezsubtree_notification_rule`;

CREATE TABLE `ezsubtree_notification_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT '0',
  `use_digest` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsubtree_notification_rule_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table eztipafriend_counter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eztipafriend_counter`;

CREATE TABLE `eztipafriend_counter` (
  `count` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `requested` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`node_id`,`requested`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table eztipafriend_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eztipafriend_request`;

CREATE TABLE `eztipafriend_request` (
  `created` int(11) NOT NULL DEFAULT '0',
  `email_receiver` varchar(100) NOT NULL DEFAULT '',
  KEY `eztipafriend_request_created` (`created`),
  KEY `eztipafriend_request_email_rec` (`email_receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table eztrigger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eztrigger`;

CREATE TABLE `eztrigger` (
  `connect_type` char(1) NOT NULL DEFAULT '',
  `function_name` varchar(200) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eztrigger_def_id` (`module_name`(50),`function_name`(50),`connect_type`),
  KEY `eztrigger_fetch` (`name`(25),`module_name`(50),`function_name`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezurl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezurl`;

CREATE TABLE `ezurl` (
  `created` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_valid` int(11) NOT NULL DEFAULT '1',
  `last_checked` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `original_url_md5` varchar(32) NOT NULL DEFAULT '',
  `url` longtext,
  PRIMARY KEY (`id`),
  KEY `ezurl_url` (`url`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezurl` WRITE;
/*!40000 ALTER TABLE `ezurl` DISABLE KEYS */;

INSERT INTO `ezurl` (`created`, `id`, `is_valid`, `last_checked`, `modified`, `original_url_md5`, `url`)
VALUES
	(1448832197,23,1,0,1448832197,'f76e41d421b2a72232264943026a6ee5','https://doc.ez.no/display/USER/'),
	(1448832277,24,1,0,1448832277,'5ebaee4017bab35ed0157379fdeff0af','https://doc.ez.no/display/DEVELOPER/'),
	(1448832412,25,1,0,1448832412,'2657dfe060c0d56aca8ef8193e17ecf9','https://doc.ez.no/display/DEVELOPER/Building+a+Bicycle+Route+Tracker+in+eZ+Platform'),
	(1448832436,26,1,0,1448832436,'180577afbb87b0e2cfcb6758c62dfd5f','https://doc.ez.no/display/MAIN/Transitioning+from+eZ+Publish+to+eZ+Platform+and+eZ+Studio%3A+Feature+Comparison'),
	(1448832661,27,1,0,1448832661,'f9bf96304c434139d0ff5773b6eee157','https://github.com/ezsystems'),
	(1448832661,28,1,0,1448832661,'265d537bfba0e5ed4e85fbcd7f30ea84','http://share.ez.no'),
	(1448832661,29,1,0,1448832661,'7441963094866aa9d1cbb8a59cca541c','http://ez-community-on-slack.herokuapp.com/');

/*!40000 ALTER TABLE `ezurl` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezurl_object_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezurl_object_link`;

CREATE TABLE `ezurl_object_link` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  KEY `ezurl_ol_coa_id` (`contentobject_attribute_id`),
  KEY `ezurl_ol_coa_version` (`contentobject_attribute_version`),
  KEY `ezurl_ol_url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezurl_object_link` WRITE;
/*!40000 ALTER TABLE `ezurl_object_link` DISABLE KEYS */;

INSERT INTO `ezurl_object_link` (`contentobject_attribute_id`, `contentobject_attribute_version`, `url_id`)
VALUES
	(104,9,23),
	(104,9,24),
	(104,9,25),
	(104,9,26),
	(104,9,27),
	(104,9,28),
	(104,9,29),
	(104,9,23),
	(104,9,24),
	(104,9,25),
	(104,9,26),
	(104,9,27),
	(104,9,28),
	(104,9,29);

/*!40000 ALTER TABLE `ezurl_object_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezurlalias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezurlalias`;

CREATE TABLE `ezurlalias` (
  `destination_url` longtext NOT NULL,
  `forward_to_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_imported` int(11) NOT NULL DEFAULT '0',
  `is_internal` int(11) NOT NULL DEFAULT '1',
  `is_wildcard` int(11) NOT NULL DEFAULT '0',
  `source_md5` varchar(32) DEFAULT NULL,
  `source_url` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurlalias_desturl` (`destination_url`(200)),
  KEY `ezurlalias_forward_to_id` (`forward_to_id`),
  KEY `ezurlalias_imp_wcard_fwd` (`is_imported`,`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_source_md5` (`source_md5`),
  KEY `ezurlalias_source_url` (`source_url`(255)),
  KEY `ezurlalias_wcard_fwd` (`is_wildcard`,`forward_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezurlalias` WRITE;
/*!40000 ALTER TABLE `ezurlalias` DISABLE KEYS */;

INSERT INTO `ezurlalias` (`destination_url`, `forward_to_id`, `id`, `is_imported`, `is_internal`, `is_wildcard`, `source_md5`, `source_url`)
VALUES
	('content/view/full/2',0,12,1,1,0,'d41d8cd98f00b204e9800998ecf8427e',''),
	('content/view/full/5',0,13,1,1,0,'9bc65c2abec141778ffaa729489f3e87','users'),
	('content/view/full/12',0,15,1,1,0,'02d4e844e3a660857a3f81585995ffe1','users/guest_accounts'),
	('content/view/full/13',0,16,1,1,0,'1b1d79c16700fd6003ea7be233e754ba','users/administrator_users'),
	('content/view/full/14',0,17,1,1,0,'0bb9dd665c96bbc1cf36b79180786dea','users/editors'),
	('content/view/full/15',0,18,1,1,0,'f1305ac5f327a19b451d82719e0c3f5d','users/administrator_users/administrator_user'),
	('content/view/full/43',0,20,1,1,0,'62933a2951ef01f4eafd9bdf4d3cd2f0','media'),
	('content/view/full/44',0,21,1,1,0,'3ae1aac958e1c82013689d917d34967a','users/anonymous_users'),
	('content/view/full/45',0,22,1,1,0,'aad93975f09371695ba08292fd9698db','users/anonymous_users/anonymous_user'),
	('content/view/full/48',0,25,1,1,0,'a0f848942ce863cf53c0fa6cc684007d','setup'),
	('content/view/full/51',0,28,1,1,0,'38985339d4a5aadfc41ab292b4527046','media/images'),
	('content/view/full/52',0,29,1,1,0,'ad5a8c6f6aac3b1b9df267fe22e7aef6','media/files'),
	('content/view/full/53',0,30,1,1,0,'562a0ac498571c6c3529173184a2657c','media/multimedia');

/*!40000 ALTER TABLE `ezurlalias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezurlalias_ml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezurlalias_ml`;

CREATE TABLE `ezurlalias_ml` (
  `action` longtext NOT NULL,
  `action_type` varchar(32) NOT NULL DEFAULT '',
  `alias_redirects` int(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL DEFAULT '0',
  `is_alias` int(11) NOT NULL DEFAULT '0',
  `is_original` int(11) NOT NULL DEFAULT '0',
  `lang_mask` bigint(20) NOT NULL DEFAULT '0',
  `link` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `text_md5` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent`,`text_md5`),
  KEY `ezurlalias_ml_act_org` (`action`(32),`is_original`),
  KEY `ezurlalias_ml_actt_org_al` (`action_type`,`is_original`,`is_alias`),
  KEY `ezurlalias_ml_id` (`id`),
  KEY `ezurlalias_ml_par_act_id_lnk` (`action`(32),`id`,`link`,`parent`),
  KEY `ezurlalias_ml_par_lnk_txt` (`parent`,`text`(32),`link`),
  KEY `ezurlalias_ml_text` (`text`(32),`id`,`link`),
  KEY `ezurlalias_ml_text_lang` (`text`(32),`lang_mask`,`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezurlalias_ml` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml` DISABLE KEYS */;

INSERT INTO `ezurlalias_ml` (`action`, `action_type`, `alias_redirects`, `id`, `is_alias`, `is_original`, `lang_mask`, `link`, `parent`, `text`, `text_md5`)
VALUES
	('eznode:48','eznode',1,13,0,1,3,13,0,'Setup2','475e97c0146bfb1c490339546d9e72ee'),
	('nop:','nop',1,17,0,0,1,17,0,'media2','50e2736330de124f6edea9b008556fe6'),
	('eznode:43','eznode',1,9,0,1,3,9,0,'Media','62933a2951ef01f4eafd9bdf4d3cd2f0'),
	('nop:','nop',1,21,0,0,1,21,0,'setup3','732cefcf28bf4547540609fb1a786a30'),
	('nop:','nop',1,3,0,0,1,3,0,'users2','86425c35a33507d479f71ade53a669aa'),
	('eznode:5','eznode',1,2,0,1,3,2,0,'Users','9bc65c2abec141778ffaa729489f3e87'),
	('eznode:2','eznode',1,1,0,1,3,1,0,'','d41d8cd98f00b204e9800998ecf8427e'),
	('eznode:14','eznode',1,6,0,1,3,6,2,'Editors','a147e136bfa717592f2bd70bd4b53b17'),
	('eznode:44','eznode',1,10,0,1,3,10,2,'Anonymous-Users','c2803c3fa1b0b5423237b4e018cae755'),
	('eznode:12','eznode',1,4,0,1,3,4,2,'Guest-accounts','e57843d836e3af8ab611fde9e2139b3a'),
	('eznode:13','eznode',1,5,0,1,3,5,2,'Administrator-users','f89fad7f8a3abc8c09e1deb46a420007'),
	('nop:','nop',1,11,0,0,1,11,3,'anonymous_users2','505e93077a6dde9034ad97a14ab022b1'),
	('eznode:12','eznode',1,26,0,0,1,4,3,'guest_accounts','70bb992820e73638731aa8de79b3329e'),
	('eznode:14','eznode',1,29,0,0,1,6,3,'editors','a147e136bfa717592f2bd70bd4b53b17'),
	('nop:','nop',1,7,0,0,1,7,3,'administrator_users2','a7da338c20bf65f9f789c87296379c2a'),
	('eznode:13','eznode',1,27,0,0,1,5,3,'administrator_users','aeb8609aa933b0899aa012c71139c58c'),
	('eznode:44','eznode',1,30,0,0,1,10,3,'anonymous_users','e9e5ad0c05ee1a43715572e5cc545926'),
	('eznode:15','eznode',1,8,0,1,3,8,5,'Administrator-User','5a9d7b0ec93173ef4fedee023209cb61'),
	('eznode:15','eznode',1,28,0,0,0,8,7,'administrator_user','a3cca2de936df1e2f805710399989971'),
	('eznode:53','eznode',1,20,0,1,3,20,9,'Multimedia','2e5bc8831f7ae6a29530e7f1bbf2de9c'),
	('eznode:52','eznode',1,19,0,1,3,19,9,'Files','45b963397aa40d4a0063e0d85e4fe7a1'),
	('eznode:51','eznode',1,18,0,1,3,18,9,'Images','59b514174bffe4ae402b3d63aad79fe0'),
	('eznode:45','eznode',1,12,0,1,3,12,10,'Anonymous-User','ccb62ebca03a31272430bc414bd5cd5b'),
	('eznode:45','eznode',1,31,0,0,1,12,11,'anonymous_user','c593ec85293ecb0e02d50d4c5c6c20eb'),
	('nop:','nop',1,15,0,0,1,15,14,'images','59b514174bffe4ae402b3d63aad79fe0'),
	('eznode:53','eznode',1,34,0,0,1,20,17,'multimedia','2e5bc8831f7ae6a29530e7f1bbf2de9c'),
	('eznode:52','eznode',1,33,0,0,1,19,17,'files','45b963397aa40d4a0063e0d85e4fe7a1'),
	('eznode:51','eznode',1,32,0,0,1,18,17,'images','59b514174bffe4ae402b3d63aad79fe0');

/*!40000 ALTER TABLE `ezurlalias_ml` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezurlalias_ml_incr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezurlalias_ml_incr`;

CREATE TABLE `ezurlalias_ml_incr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezurlalias_ml_incr` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml_incr` DISABLE KEYS */;

INSERT INTO `ezurlalias_ml_incr` (`id`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37);

/*!40000 ALTER TABLE `ezurlalias_ml_incr` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezurlwildcard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezurlwildcard`;

CREATE TABLE `ezurlwildcard` (
  `destination_url` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_url` longtext NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezuser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezuser`;

CREATE TABLE `ezuser` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(150) NOT NULL DEFAULT '',
  `login` varchar(150) NOT NULL DEFAULT '',
  `password_hash` varchar(50) DEFAULT NULL,
  `password_hash_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`contentobject_id`),
  UNIQUE KEY `ezuser_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezuser` WRITE;
/*!40000 ALTER TABLE `ezuser` DISABLE KEYS */;

INSERT INTO `ezuser` (`contentobject_id`, `email`, `login`, `password_hash`, `password_hash_type`)
VALUES
	(10,'nospam@ez.no','anonymous','4e6f6184135228ccd45f8233d72a0363',2),
	(14,'nospam@ez.no','admin','c78e3b0f3d9244ed8c6d1c29464bdff9',2);

/*!40000 ALTER TABLE `ezuser` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezuser_accountkey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezuser_accountkey`;

CREATE TABLE `ezuser_accountkey` (
  `hash_key` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash_key` (`hash_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezuser_discountrule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezuser_discountrule`;

CREATE TABLE `ezuser_discountrule` (
  `contentobject_id` int(11) DEFAULT NULL,
  `discountrule_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezuser_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezuser_role`;

CREATE TABLE `ezuser_role` (
  `contentobject_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_identifier` varchar(255) DEFAULT '',
  `limit_value` varchar(255) DEFAULT '',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezuser_role_contentobject_id` (`contentobject_id`),
  KEY `ezuser_role_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezuser_role` WRITE;
/*!40000 ALTER TABLE `ezuser_role` DISABLE KEYS */;

INSERT INTO `ezuser_role` (`contentobject_id`, `id`, `limit_identifier`, `limit_value`, `role_id`)
VALUES
	(11,28,'','',1),
	(42,31,'','',1),
	(13,32,'Subtree','/1/2/',3),
	(13,33,'Subtree','/1/43/',3),
	(12,34,'','',2),
	(13,35,'','',4);

/*!40000 ALTER TABLE `ezuser_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezuser_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezuser_setting`;

CREATE TABLE `ezuser_setting` (
  `is_enabled` int(11) NOT NULL DEFAULT '0',
  `max_login` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezuser_setting` WRITE;
/*!40000 ALTER TABLE `ezuser_setting` DISABLE KEYS */;

INSERT INTO `ezuser_setting` (`is_enabled`, `max_login`, `user_id`)
VALUES
	(1,1000,10),
	(1,10,14);

/*!40000 ALTER TABLE `ezuser_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezuservisit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezuservisit`;

CREATE TABLE `ezuservisit` (
  `current_visit_timestamp` int(11) NOT NULL DEFAULT '0',
  `failed_login_attempts` int(11) NOT NULL DEFAULT '0',
  `last_visit_timestamp` int(11) NOT NULL DEFAULT '0',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `ezuservisit_co_visit_count` (`current_visit_timestamp`,`login_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezuservisit` WRITE;
/*!40000 ALTER TABLE `ezuservisit` DISABLE KEYS */;

INSERT INTO `ezuservisit` (`current_visit_timestamp`, `failed_login_attempts`, `last_visit_timestamp`, `login_count`, `user_id`)
VALUES
	(1301057720,0,1301057720,0,14);

/*!40000 ALTER TABLE `ezuservisit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezvatrule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezvatrule`;

CREATE TABLE `ezvatrule` (
  `country_code` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezvatrule_product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezvatrule_product_category`;

CREATE TABLE `ezvatrule_product_category` (
  `product_category_id` int(11) NOT NULL DEFAULT '0',
  `vatrule_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vatrule_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezvattype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezvattype`;

CREATE TABLE `ezvattype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezvattype` WRITE;
/*!40000 ALTER TABLE `ezvattype` DISABLE KEYS */;

INSERT INTO `ezvattype` (`id`, `name`, `percentage`)
VALUES
	(1,'Std',0);

/*!40000 ALTER TABLE `ezvattype` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezview_counter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezview_counter`;

CREATE TABLE `ezview_counter` (
  `count` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezwaituntildatevalue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezwaituntildatevalue`;

CREATE TABLE `ezwaituntildatevalue` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_event_id` int(11) NOT NULL DEFAULT '0',
  `workflow_event_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`workflow_event_id`,`workflow_event_version`),
  KEY `ezwaituntildateevalue_wf_ev_id_wf_ver` (`workflow_event_id`,`workflow_event_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezwishlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezwishlist`;

CREATE TABLE `ezwishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezworkflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezworkflow`;

CREATE TABLE `ezworkflow` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_enabled` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  `workflow_type_string` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezworkflow_assign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezworkflow_assign`;

CREATE TABLE `ezworkflow_assign` (
  `access_type` int(11) NOT NULL DEFAULT '0',
  `as_tree` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT '0',
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezworkflow_event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezworkflow_event`;

CREATE TABLE `ezworkflow_event` (
  `data_int1` int(11) DEFAULT NULL,
  `data_int2` int(11) DEFAULT NULL,
  `data_int3` int(11) DEFAULT NULL,
  `data_int4` int(11) DEFAULT NULL,
  `data_text1` varchar(255) DEFAULT NULL,
  `data_text2` varchar(255) DEFAULT NULL,
  `data_text3` varchar(255) DEFAULT NULL,
  `data_text4` varchar(255) DEFAULT NULL,
  `data_text5` longtext,
  `description` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placement` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  `workflow_type_string` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`),
  KEY `wid_version_placement` (`workflow_id`,`version`,`placement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezworkflow_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezworkflow_group`;

CREATE TABLE `ezworkflow_group` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ezworkflow_group` WRITE;
/*!40000 ALTER TABLE `ezworkflow_group` DISABLE KEYS */;

INSERT INTO `ezworkflow_group` (`created`, `creator_id`, `id`, `modified`, `modifier_id`, `name`)
VALUES
	(1024392098,14,1,1024392098,14,'Standard');

/*!40000 ALTER TABLE `ezworkflow_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ezworkflow_group_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezworkflow_group_link`;

CREATE TABLE `ezworkflow_group_link` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(255) DEFAULT NULL,
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  `workflow_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflow_id`,`group_id`,`workflow_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table ezworkflow_process
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ezworkflow_process`;

CREATE TABLE `ezworkflow_process` (
  `activation_date` int(11) DEFAULT NULL,
  `content_id` int(11) NOT NULL DEFAULT '0',
  `content_version` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `event_id` int(11) NOT NULL DEFAULT '0',
  `event_position` int(11) NOT NULL DEFAULT '0',
  `event_state` int(11) DEFAULT NULL,
  `event_status` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_event_id` int(11) NOT NULL DEFAULT '0',
  `last_event_position` int(11) NOT NULL DEFAULT '0',
  `last_event_status` int(11) NOT NULL DEFAULT '0',
  `memento_key` varchar(32) DEFAULT NULL,
  `modified` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `parameters` longtext,
  `process_key` varchar(32) NOT NULL DEFAULT '',
  `session_key` varchar(32) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezworkflow_process_process_key` (`process_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
