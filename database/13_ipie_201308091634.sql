-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Ago 09, 2013 alle 16:34
-- Versione del server: 5.5.16
-- Versione PHP: 5.3.8

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `13_ipie`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_assets`
--

DROP TABLE IF EXISTS `ipie_assets`;
CREATE TABLE IF NOT EXISTS `ipie_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dump dei dati per la tabella `ipie_assets`
--

INSERT INTO `ipie_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 71, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 20, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 21, 22, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 23, 24, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 25, 26, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 27, 28, 1, 'com_login', 'com_login', '{}'),
(13, 1, 29, 30, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 31, 32, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 33, 34, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 35, 36, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 37, 38, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 39, 40, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 41, 44, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 45, 46, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 47, 48, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 49, 50, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 51, 52, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 53, 56, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 57, 60, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 61, 62, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 42, 43, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 58, 59, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 54, 55, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 63, 64, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 65, 66, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 67, 68, 1, 'com_ipie', 'ipie', '{}'),
(36, 1, 69, 70, 1, 'com_falang', 'com_falang', '{}');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_associations`
--

DROP TABLE IF EXISTS `ipie_associations`;
CREATE TABLE IF NOT EXISTS `ipie_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_banners`
--

DROP TABLE IF EXISTS `ipie_banners`;
CREATE TABLE IF NOT EXISTS `ipie_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_banner_clients`
--

DROP TABLE IF EXISTS `ipie_banner_clients`;
CREATE TABLE IF NOT EXISTS `ipie_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_banner_tracks`
--

DROP TABLE IF EXISTS `ipie_banner_tracks`;
CREATE TABLE IF NOT EXISTS `ipie_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_categories`
--

DROP TABLE IF EXISTS `ipie_categories`;
CREATE TABLE IF NOT EXISTS `ipie_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `ipie_categories`
--

INSERT INTO `ipie_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 13, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'non-categorizzato', 'com_content', 'Non categorizzato', 'non-categorizzato', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'non-categorizzato', 'com_banners', 'Non categorizzato', 'non-categorizzato', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'non-categorizzato', 'com_contact', 'Non categorizzato', 'non-categorizzato', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'non-categorizzato', 'com_newsfeeds', 'Non categorizzato', 'non-categorizzato', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'non-categorizzato', 'com_weblinks', 'Non categorizzato', 'non-categorizzato', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 11, 12, 1, 'non-categorizzato', 'com_users', 'Non categorizzato', 'non-categorizzato', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_contact_details`
--

DROP TABLE IF EXISTS `ipie_contact_details`;
CREATE TABLE IF NOT EXISTS `ipie_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_content`
--

DROP TABLE IF EXISTS `ipie_content`;
CREATE TABLE IF NOT EXISTS `ipie_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_content_frontpage`
--

DROP TABLE IF EXISTS `ipie_content_frontpage`;
CREATE TABLE IF NOT EXISTS `ipie_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_content_rating`
--

DROP TABLE IF EXISTS `ipie_content_rating`;
CREATE TABLE IF NOT EXISTS `ipie_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_core_log_searches`
--

DROP TABLE IF EXISTS `ipie_core_log_searches`;
CREATE TABLE IF NOT EXISTS `ipie_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_dbcache`
--

DROP TABLE IF EXISTS `ipie_dbcache`;
CREATE TABLE IF NOT EXISTS `ipie_dbcache` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `groupname` varchar(32) NOT NULL DEFAULT '',
  `expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`id`,`groupname`),
  KEY `expire` (`expire`,`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_extensions`
--

DROP TABLE IF EXISTS `ipie_extensions`;
CREATE TABLE IF NOT EXISTS `ipie_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10005 ;

--
-- Dump dei dati per la tabella `ipie_extensions`
--

INSERT INTO `ipie_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"it-IT","site":"it-IT"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"1","sendpassword":"1","useractivation":"2","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"11.4","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2013","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.4.1","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"2","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"it","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%d-%m-%Y","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{"detect_browser":"1","automatic_change":"1","menu_associations":"0","remove_default_prefix":"0","lang_cookie":"1","alternate_meta":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0);
INSERT INTO `ipie_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"2.5.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.10","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.10","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(602, 'Italian Language Pack', 'package', 'pkg_it-IT', '', 0, 1, 1, 0, '{"legacy":false,"name":"Italian Language Pack","type":"package","creationDate":"25 luglio 2013","author":"Italian translation team : joomla.it","copyright":"Copyright (C) 2005 - 2012 joomla.it e Open Source Matters. Tutti i diritti riservati","authorEmail":"info@joomla.it","authorUrl":"www.joomla.it","version":"2.5.13.1","description":"Joomla! 2.5 Full Italian (it-IT) Language Package - Version 2.5.13v1","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(603, 'Italian (IT)', 'language', 'it-IT', '', 1, 1, 0, 0, '{"legacy":false,"name":"Italian (IT)","type":"language","creationDate":"2013-07-25","author":"Italian Translation Team ","copyright":"Copyright (C) 2005 - 2012 Open Source Matters and Joomla.it. All rights reserved.","authorEmail":"info@joomla.it","authorUrl":"www.joomla.it","version":"2.5.13.1","description":"Italian admin language for Joomla 2.5","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(604, 'Italian (IT)', 'language', 'it-IT', '', 0, 1, 0, 0, '{"legacy":false,"name":"Italian (IT)","type":"language","creationDate":"2013-07-25","author":"Italian Translation Team","copyright":"Copyright (C) 2005 - 2012 Open Source Matters and Joomla.it. All rights reserved.","authorEmail":"info@joomla.it","authorUrl":"www.joomla.it","version":"2.5.13.1","description":"Italian site language for Joomla 2.5","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(605, 'TinyMCE lingua IT', 'file', 'TinyMCE_it-IT', '', 0, 1, 0, 0, '{"legacy":false,"name":"TinyMCE lingua IT","type":"file","creationDate":"20 giugno 2012","author":"Italian translation team : joomla.it","copyright":"(C) 2005-2012 Italian Translation Team","authorEmail":"info@joomla.it","authorUrl":"www.joomla.it","version":"3.5.2","description":"\\t\\t\\n\\t\\t<h3>Installazione del pacchetto lingua per TinyMCE 3.5.2 per  Joomla 2.5 effettuato correttamente<\\/h3>\\n \\u00a0 \\u00a0 \\u00a0 \\u00a0<div style=\\"font-weight:normal\\">\\n \\t\\tNon dimenticare di selezionare la lingua IT nella\\n \\t\\t<a href=\\"index.php?option=com_plugins&view=plugins&filter_search=TinyMCE\\"><strong>gestione del plug-in TinyMCE<\\/strong><\\/a><br \\/>\\n<\\/div>\\t\\t\\n\\t\\t\\n\\t","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"July 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.13","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(800, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'ipie', 'component', 'com_ipie', '', 1, 1, 0, 0, '{"legacy":false,"name":"IPie","type":"component","creationDate":"August 2013","author":"Cristiano Cucco","copyright":"","authorEmail":"cristiano.cucco@gmail.com","authorUrl":"","version":"1.0.0","description":"Innovative Piemonte","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'com_falang', 'component', 'com_falang', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_falang","type":"component","creationDate":"December 2012","author":"St\\u00e9phane Bouey","copyright":"2011-2013, Faboba","authorEmail":"stephane.bouey@faboba.com","authorUrl":"www.faboba.com","version":"1.3.1","description":"COM_FALANG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'mod_falang', 'module', 'mod_falang', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_falang","type":"module","creationDate":"December 2012","author":"St\\u00e9phane Bouey","copyright":"2011-2013, Faboba","authorEmail":"stephane.bouey@faboba.com","authorUrl":"www.faboba.com","version":"1.3.0","description":"MOD_FALANG_XML_DESCRIPTION","group":""}', '{"dropdown":"0","image":"1","inline":"1","show_active":"1","full_name":"1","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'plg_system_falangdriver', 'plugin', 'falangdriver', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_falangdriver","type":"plugin","creationDate":"December 2012","author":"St\\u00e9phane Bouey","copyright":"2011-2013, Faboba","authorEmail":"stephane.bouey@faboba.com","authorUrl":"http:\\/\\/www.faboba.com","version":"1.3.0","description":"PLG_SYSTEM_FALANGDRIVER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'falang', 'package', 'pkg_falang', '', 0, 1, 1, 0, '{"legacy":false,"name":"FaLang Package","type":"package","creationDate":"December 2012","author":"St\\u00e9phane Bouey","copyright":"","authorEmail":"","authorUrl":"","version":"1.3.1","description":"FaLang! Installer Package.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_falang_content`
--

DROP TABLE IF EXISTS `ipie_falang_content`;
CREATE TABLE IF NOT EXISTS `ipie_falang_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `reference_table` varchar(100) NOT NULL DEFAULT '',
  `reference_field` varchar(100) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `original_value` varchar(255) DEFAULT NULL,
  `original_text` mediumtext NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idxFalang1` (`reference_id`,`reference_field`,`reference_table`),
  KEY `falangContent` (`language_id`,`reference_id`,`reference_table`),
  KEY `falangContentLanguage` (`reference_id`,`reference_field`,`reference_table`,`language_id`),
  KEY `reference_id` (`reference_id`),
  KEY `language_id` (`language_id`),
  KEY `reference_table` (`reference_table`),
  KEY `reference_field` (`reference_field`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `ipie_falang_content`
--

INSERT INTO `ipie_falang_content` (`id`, `language_id`, `reference_id`, `reference_table`, `reference_field`, `value`, `original_value`, `original_text`, `modified`, `modified_by`, `published`) VALUES
(1, 1, 1, 'ipie_factor', 'description', 'Creativity', 'c4cc67b6a9cf7ba7e7c0b86ca2784808', 'bhbhhbhbhbhb', '2013-08-01 15:45:07', 828, 1),
(2, 1, 2, 'ipie_factor', 'description', 'Geniality', 'ce72a207438b4c197aadff29ebe56357', 'jfjfkjfkjkfjkf', '2013-08-01 15:45:18', 828, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_falang_tableinfo`
--

DROP TABLE IF EXISTS `ipie_falang_tableinfo`;
CREATE TABLE IF NOT EXISTS `ipie_falang_tableinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joomlatablename` varchar(100) NOT NULL DEFAULT '',
  `tablepkID` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

--
-- Dump dei dati per la tabella `ipie_falang_tableinfo`
--

INSERT INTO `ipie_falang_tableinfo` (`id`, `joomlatablename`, `tablepkID`) VALUES
(158, 'banners', 'id'),
(159, 'categories', 'id'),
(160, 'contact_details', 'id'),
(161, 'content', 'id'),
(162, 'ipie_company', 'company_id'),
(163, 'ipie_factor', 'factor_id'),
(164, 'ipie_sector', 'sector_id'),
(165, 'ipie_subsector', 'subsector_id'),
(166, 'k2_attachments', 'id'),
(167, 'k2_categories', 'id'),
(168, 'k2_extra_fields', 'id'),
(169, 'k2_items', 'id'),
(170, 'k2_tags', 'id'),
(171, 'k2_users', 'id'),
(172, 'menu', 'id'),
(173, 'modules', 'id'),
(174, 'weblinks', 'id');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_filters`
--

DROP TABLE IF EXISTS `ipie_finder_filters`;
CREATE TABLE IF NOT EXISTS `ipie_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links`
--

DROP TABLE IF EXISTS `ipie_finder_links`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms0`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms0`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms1`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms1`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms2`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms2`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms3`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms3`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms4`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms4`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms5`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms5`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms6`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms6`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms7`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms7`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms8`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms8`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_terms9`
--

DROP TABLE IF EXISTS `ipie_finder_links_terms9`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_termsa`
--

DROP TABLE IF EXISTS `ipie_finder_links_termsa`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_termsb`
--

DROP TABLE IF EXISTS `ipie_finder_links_termsb`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_termsc`
--

DROP TABLE IF EXISTS `ipie_finder_links_termsc`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_termsd`
--

DROP TABLE IF EXISTS `ipie_finder_links_termsd`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_termse`
--

DROP TABLE IF EXISTS `ipie_finder_links_termse`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_links_termsf`
--

DROP TABLE IF EXISTS `ipie_finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `ipie_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_taxonomy`
--

DROP TABLE IF EXISTS `ipie_finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `ipie_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `ipie_finder_taxonomy`
--

INSERT INTO `ipie_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `ipie_finder_taxonomy_map`;
CREATE TABLE IF NOT EXISTS `ipie_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_terms`
--

DROP TABLE IF EXISTS `ipie_finder_terms`;
CREATE TABLE IF NOT EXISTS `ipie_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_terms_common`
--

DROP TABLE IF EXISTS `ipie_finder_terms_common`;
CREATE TABLE IF NOT EXISTS `ipie_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ipie_finder_terms_common`
--

INSERT INTO `ipie_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_tokens`
--

DROP TABLE IF EXISTS `ipie_finder_tokens`;
CREATE TABLE IF NOT EXISTS `ipie_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `ipie_finder_tokens_aggregate`;
CREATE TABLE IF NOT EXISTS `ipie_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_finder_types`
--

DROP TABLE IF EXISTS `ipie_finder_types`;
CREATE TABLE IF NOT EXISTS `ipie_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_city`
--

DROP TABLE IF EXISTS `ipie_ipie_city`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_city` (
  `city_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(20) unsigned NOT NULL,
  `istat` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `latitudine` float(10,6) NOT NULL,
  `longitudine` float(10,6) NOT NULL,
  `published` int(1) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `id_provincia` (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=1240 ;

--
-- Dump dei dati per la tabella `ipie_ipie_city`
--

INSERT INTO `ipie_ipie_city` (`city_id`, `province_id`, `istat`, `name`, `latitudine`, `longitudine`, `published`) VALUES
(1, 6, '001219', 'Rivoli', 45.070366, 7.519853, 1),
(8, 3, '096035', 'Mongrando', 45.529221, 8.008296, 1),
(9, 1, '006003', 'Alessandria', 44.913216, 8.616951, 1),
(11, 2, '005005', 'Asti', 44.900864, 8.206813, 1),
(12, 3, '096004', 'Biella', 45.562836, 8.058270, 1),
(14, 4, '004078', 'Cuneo', 44.388798, 7.547111, 1),
(15, 5, '003106', 'Novara', 45.445080, 8.618670, 1),
(16, 7, '103072', 'Verbania', 45.921509, 8.551560, 1),
(17, 8, '002158', 'Vercelli', 45.321060, 8.426393, 1),
(18, 6, '001272', 'Torino', 45.070602, 7.686710, 1),
(19, 4, '004003', 'Alba', 44.700863, 8.035259, 1),
(20, 4, '004029', 'Bra', 44.697819, 7.854536, 1),
(21, 4, '004203', 'Saluzzo', 44.644592, 7.492604, 1),
(25, 4, '004130', 'Mondovì', 44.389580, 7.820600, 1),
(30, 4, '004089', 'Fossano', 44.550007, 7.723773, 1),
(31, 6, '001022', 'Bardonecchia', 45.078766, 6.704287, 1),
(32, 6, '001074', 'Cesana Torinese', 44.953053, 6.793751, 1),
(33, 6, '001191', 'Pinerolo', 44.884632, 7.330867, 1),
(34, 6, '001201', 'Pragelato', 45.015526, 6.942049, 1),
(35, 6, '001259', 'Sauze d''Oulx', 44.941723, 6.860167, 1),
(36, 6, '001263', 'Sestriere', 44.956890, 6.880107, 1),
(38, 4, '004040', 'Caraglio', 44.420483, 7.434074, 1),
(39, 7, '103064', 'Stresa', 45.884556, 8.532981, 1),
(40, 6, '001100', 'Exilles', 45.098610, 6.930315, 1),
(41, 6, '001156', 'Moncalieri', 44.999363, 7.680064, 1),
(42, 1, '006174', 'Tortona', 44.897171, 8.865485, 1),
(43, 4, '004159', 'Pamparato', 44.277714, 7.913561, 1),
(44, 4, '004043', 'Carrù', 44.479568, 7.877070, 1),
(45, 6, '001270', 'Susa', 45.138485, 7.048414, 1),
(46, 6, '001086', 'Ciriè', 45.233559, 7.604550, 1),
(47, 6, '001292', 'Venaria Reale', 45.145103, 7.613111, 1),
(49, 6, '001275', 'Torre Pellice', 44.820576, 7.223696, 1),
(50, 1, '006114', 'Novi Ligure', 44.761795, 8.786101, 1),
(52, 4, '004067', 'Cherasco', 44.651653, 7.858252, 1),
(53, 6, '001125', 'Ivrea', 45.466606, 7.875945, 1),
(54, 6, '001271', 'Tavagnasco', 45.546001, 7.823867, 1),
(55, 1, '006001', 'Acqui Terme', 44.675526, 8.470669, 1),
(56, 5, '003008', 'Arona', 45.756981, 8.559950, 1),
(58, 2, '005001', 'Agliano Terme', 44.791466, 8.249714, 1),
(59, 2, '005002', 'Albugnano', 45.077980, 7.971250, 1),
(60, 2, '005003', 'Antignano', 44.844986, 8.135851, 1),
(61, 2, '005004', 'Aramengo', 45.100121, 8.001092, 1),
(62, 2, '005008', 'Belveglio', 44.830944, 8.329556, 1),
(64, 2, '005010', 'Bruno', 44.793945, 8.441015, 1),
(65, 2, '005011', 'Bubbio', 44.664219, 8.294975, 1),
(66, 2, '005012', 'Buttigliera d''Asti', 45.022316, 7.950727, 1),
(67, 2, '005013', 'Calamandrana', 44.738129, 8.339852, 1),
(68, 2, '005014', 'Calliano', 45.009457, 8.255831, 1),
(69, 2, '005015', 'Calosso', 44.739346, 8.228081, 1),
(70, 2, '005016', 'Camerano Casasco', 44.992516, 8.090890, 1),
(71, 2, '005017', 'Canelli', 44.719288, 8.287012, 1),
(72, 3, '096002', 'Andorno Micca', 45.612167, 8.056297, 1),
(73, 3, '096003', 'Benna', 45.514038, 8.126299, 1),
(74, 3, '096005', 'Bioglio', 45.616280, 8.137204, 1),
(75, 3, '096008', 'Callabiana', 45.631645, 8.099417, 1),
(76, 3, '096009', 'Camandona', 45.644794, 8.099633, 1),
(77, 3, '096010', 'Camburzano', 45.543648, 8.003565, 1),
(78, 8, '002002', 'Alagna Valsesia', 45.854244, 7.937364, 1),
(79, 8, '002003', 'Albano Vercellese', 45.427204, 8.380736, 1),
(80, 8, '002004', 'Alice Castello', 45.366280, 8.074074, 1),
(81, 8, '002006', 'Arborio', 45.495945, 8.386407, 1),
(82, 8, '002007', 'Asigliano Vercellese', 45.262520, 8.409704, 1),
(83, 8, '002009', 'Balocco', 45.456261, 8.281259, 1),
(84, 8, '002011', 'Bianzè', 45.309559, 8.123780, 1),
(85, 8, '002014', 'Boccioleto', 45.830215, 8.113028, 1),
(86, 8, '002015', 'Borgo d''Ale', 45.352669, 8.051889, 1),
(87, 8, '002017', 'Borgovercelli', 45.358925, 8.464246, 1),
(88, 7, '103006', 'Baceno', 46.261314, 8.318878, 1),
(89, 7, '103007', 'Bannio Anzino', 45.983532, 8.146019, 1),
(90, 7, '103008', 'Baveno', 45.909389, 8.500796, 1),
(91, 7, '103010', 'Belgirate', 45.839848, 8.572511, 1),
(92, 7, '103011', 'Beura Cardezza', 46.080647, 8.300963, 1),
(93, 7, '103012', 'Bognanco', 46.127377, 8.202137, 1),
(94, 7, '103013', 'Brovello Carpugnino', 45.843445, 8.532815, 1),
(95, 7, '103014', 'Calasca Castiglione', 46.020565, 8.214614, 1),
(96, 4, '004001', 'Acceglio', 44.475174, 6.990710, 1),
(98, 4, '004002', 'Aisone', 44.313492, 7.219117, 1),
(99, 4, '004004', 'Albaretto della Torre', 44.596809, 8.064511, 1),
(100, 4, '004005', 'Alto', 44.108879, 8.002788, 1),
(101, 4, '004006', 'Argentera', 44.396263, 6.938113, 1),
(102, 4, '004008', 'Bagnasco', 44.307293, 8.046251, 1),
(103, 4, '004010', 'Baldissero d''Alba', 44.763939, 7.908610, 1),
(104, 4, '004009', 'Bagnolo Piemonte', 44.761555, 7.314969, 1),
(105, 4, '004011', 'Barbaresco', 44.725044, 8.080868, 1),
(106, 4, '004012', 'Barge', 44.725277, 7.324214, 1),
(107, 4, '004014', 'Bastia Mondovì', 44.442982, 7.895650, 1),
(108, 4, '004016', 'Beinette', 44.365963, 7.647815, 1),
(109, 4, '004017', 'Bellino', 44.580536, 7.017237, 1),
(110, 4, '004019', 'Bene Vagienna', 44.544388, 7.829556, 1),
(111, 4, '004021', 'Bergolo', 44.548790, 8.184256, 1),
(112, 4, '004034', 'Busca', 44.519241, 7.475481, 1),
(113, 1, '006004', 'Alfiano Natta', 45.047588, 8.208302, 1),
(114, 1, '006007', 'Altavilla Monferrato', 44.994537, 8.377037, 1),
(115, 1, '006011', 'Balzola', 45.184536, 8.404537, 1),
(116, 1, '006012', 'Basaluzzo', 44.768578, 8.702260, 1),
(117, 1, '006014', 'Belforte Monferrato', 44.626133, 8.661113, 1),
(118, 1, '006017', 'Bistagno', 44.661278, 8.371407, 1),
(119, 1, '006018', 'Borghetto di Borbera', 44.730679, 8.943802, 1),
(120, 1, '006020', 'Borgo San Martino', 45.088699, 8.523765, 1),
(121, 1, '006021', 'Bosco Marengo', 44.824463, 8.677599, 1),
(122, 1, '006024', 'Brignano Frascata', 44.813896, 9.041037, 1),
(123, 1, '006025', 'Cabella Ligure', 44.674870, 9.096889, 1),
(124, 1, '006026', 'Camagna Monferrato', 45.018780, 8.430963, 1),
(125, 1, '006027', 'Camino', 45.160011, 8.292033, 1),
(128, 4, '004013', 'Barolo', 44.610428, 7.942577, 1),
(129, 4, '004025', 'Borgo San Dalmazzo', 44.329575, 7.488494, 1),
(130, 4, '004028', 'Boves', 44.329182, 7.551827, 1),
(131, 4, '004053', 'Castelmagno', 44.408775, 7.212171, 1),
(132, 4, '004055', 'Castiglione Falletto', 44.623611, 7.976407, 1),
(133, 4, '004065', 'Cervere', 44.636406, 7.793148, 1),
(134, 4, '004073', 'Cortemilia', 44.579792, 8.191282, 1),
(135, 4, '004066', 'Ceva', 44.387367, 8.035003, 1),
(136, 4, '004071', 'Clavesana', 44.483356, 7.901754, 1),
(137, 4, '004090', 'Frabosa Soprana', 44.288704, 7.806230, 1),
(138, 4, '004099', 'Govone', 44.805107, 8.095051, 1),
(139, 6, '001006', 'Almese', 45.116913, 7.395387, 1),
(140, 6, '001008', 'Alpignano', 45.094269, 7.524406, 1),
(141, 6, '001009', 'Andezeno', 45.037277, 7.873140, 1),
(142, 6, '001010', 'Andrate', 45.528461, 7.881407, 1),
(143, 6, '001013', 'Avigliana', 45.079281, 7.396676, 1),
(144, 6, '001032', 'Borgone Susa', 45.121212, 7.239770, 1),
(145, 6, '001034', 'Brandizzo', 45.178295, 7.838926, 1),
(146, 6, '001047', 'Caluso', 45.305943, 7.896889, 1),
(147, 6, '001048', 'Cambiano', 44.969391, 7.773130, 1),
(148, 5, '003001', 'Agrate Conturbia', 45.677399, 8.558370, 1),
(149, 5, '003002', 'Ameno', 45.789700, 8.442040, 1),
(150, 5, '003006', 'Armeno', 45.822552, 8.440000, 1),
(151, 5, '003012', 'Barengo', 45.577061, 8.515170, 1),
(152, 5, '003018', 'Biandrate', 45.453781, 8.463610, 1),
(153, 2, '005022', 'Castagnole Delle Lanze', 44.752205, 8.151426, 1),
(154, 2, '005023', 'Castagnole Monferrato', 44.959957, 8.304802, 1),
(155, 2, '005031', 'Castelnuovo Don Bosco', 45.040981, 7.964332, 1),
(156, 2, '005040', 'Cisterna D''Asti', 44.825096, 8.003838, 1),
(157, 2, '005042', 'Cocconato', 45.088604, 8.039461, 1),
(158, 2, '005046', 'Cortanze', 45.015316, 8.089241, 1),
(159, 2, '005047', 'Cortazzone', 44.979809, 8.061845, 1),
(160, 2, '005050', 'Costigliole d''Asti', 44.785019, 8.182037, 1),
(161, 2, '005058', 'Incisa Scapaccino', 44.808773, 8.375134, 1),
(162, 2, '005059', 'Isola D''Asti', 44.829109, 8.177766, 1),
(163, 2, '005065', 'Mombaruzzo', 44.772076, 8.448432, 1),
(164, 2, '005069', 'Moncalvo', 45.051266, 8.266417, 1),
(165, 2, '005070', 'Moncucco Torinese', 45.064892, 7.933142, 1),
(166, 2, '005075', 'Montechiaro d''Asti', 45.008286, 8.112348, 1),
(167, 2, '005077', 'Montemagno', 44.982166, 8.323390, 1),
(168, 2, '005078', 'Montiglio', 45.066235, 8.098436, 1),
(169, 2, '005080', 'Nizza Monferrato', 44.774853, 8.355000, 1),
(170, 2, '005094', 'Roccaverano', 44.592537, 8.272038, 1),
(171, 2, '005096', 'Rocchetta Tanaro', 44.859577, 8.344789, 1),
(172, 2, '005112', 'Valfenera', 44.903004, 7.967398, 1),
(173, 2, '005115', 'Viarigi', 44.981300, 8.357944, 1),
(174, 2, '005118', 'Villanova d''Asti', 44.942234, 7.937689, 1),
(175, 3, '096012', 'Candelo', 45.544998, 8.109307, 1),
(176, 3, '096116', 'Cavaglià', 45.408436, 8.094616, 1),
(177, 3, '096026', 'Gaglianico', 45.538700, 8.073160, 1),
(178, 3, '096028', 'Graglia', 45.559536, 7.979241, 1),
(179, 3, '096032', 'Masserano', 45.597980, 8.217815, 1),
(180, 3, '096047', 'Ponderano', 45.537521, 8.054835, 1),
(181, 3, '096050', 'Pray', 45.675381, 8.205397, 1),
(182, 3, '096054', 'Roppolo', 45.421574, 8.070963, 1),
(183, 3, '096063', 'Sordevolo', 45.574554, 7.974537, 1),
(184, 3, '096070', 'Trivero', 45.667400, 8.179073, 1),
(185, 3, '096080', 'Viverone', 45.424843, 8.054392, 1),
(186, 6, '001001', 'Agliè', 45.368149, 7.768150, 1),
(187, 6, '001003', 'Ala di Stura', 45.315384, 7.302593, 1),
(188, 6, '001015', 'Bairo', 45.387035, 7.756407, 1),
(189, 6, '001019', 'Balme', 45.302174, 7.218066, 1),
(190, 6, '001024', 'Beinasco', 45.022808, 7.587822, 1),
(191, 6, '001025', 'Bibiana', 44.800018, 7.289389, 1),
(194, 4, '004095', 'Garessio', 44.206169, 8.015295, 1),
(195, 4, '004100', 'Grinzane Cavour', 44.656631, 7.981727, 1),
(196, 4, '004101', 'Guarene', 44.740746, 8.034143, 1),
(197, 4, '004105', 'La Morra', 44.639557, 7.933778, 1),
(198, 4, '004110', 'Limone Piemonte', 44.201389, 7.576201, 1),
(199, 4, '004115', 'Mango', 44.686684, 8.151790, 1),
(200, 4, '004132', 'Monforte d''Alba', 44.583069, 7.967824, 1),
(201, 4, '004140', 'Monteu Roero', 44.780315, 7.937500, 1),
(202, 4, '004145', 'Murazzano', 44.473995, 8.020460, 1),
(203, 6, '001028', 'Borgaro Torinese', 45.151711, 7.657761, 1),
(204, 6, '001030', 'Borgofranco d''Ivrea', 45.513927, 7.859241, 1),
(205, 6, '001045', 'Buttigliera Alta', 45.070965, 7.429537, 1),
(206, 6, '001046', 'Cafasse', 45.246086, 7.518420, 1),
(207, 4, '004116', 'Manta', 44.616890, 7.488130, 1),
(208, 4, '004148', 'Neive', 44.726437, 8.115762, 1),
(209, 4, '004155', 'Ormea', 44.148548, 7.913575, 1),
(210, 4, '004163', 'Peveragno', 44.332500, 7.620944, 1),
(211, 4, '004166', 'Piasco', 44.564075, 7.455018, 1),
(212, 4, '004179', 'Racconigi', 44.771076, 7.684098, 1),
(213, 4, '004189', 'Rocca de'' Baldi', 44.424316, 7.761944, 1),
(214, 4, '004180', 'Revello', 44.655628, 7.392667, 1),
(215, 4, '004212', 'Santa Vittoria d''Alba', 44.510017, 7.723444, 1),
(216, 4, '004213', 'Santo Stefano Belbo', 44.708477, 8.230245, 1),
(217, 4, '004215', 'Savigliano', 44.648037, 7.658365, 1),
(218, 4, '004218', 'Serralunga d''Alba', 44.611111, 8.000648, 1),
(219, 4, '004223', 'Sommariva Perno', 44.746742, 7.901722, 1),
(220, 4, '004233', 'Valdieri', 44.278778, 7.398759, 1),
(221, 4, '004239', 'Vernante', 44.245033, 7.534520, 1),
(222, 4, '004242', 'Vicoforte', 44.362946, 7.863622, 1),
(223, 1, '006009', 'Arquata Scrivia', 44.687988, 8.885708, 1),
(224, 1, '006043', 'Cassine', 44.750942, 8.528907, 1),
(225, 1, '006053', 'Castelnuovo Scrivia', 44.981407, 8.882352, 1),
(226, 1, '006056', 'Cella Monte', 45.075001, 8.392667, 1),
(227, 1, '006072', 'Frassinello Monferrato', 45.033039, 8.386868, 1),
(228, 1, '006081', 'Gavi', 44.688663, 8.802880, 1),
(229, 1, '006039', 'Casale Monferrato', 45.137157, 8.450886, 1),
(230, 1, '006091', 'Masio', 44.870628, 8.408926, 1),
(231, 1, '006113', 'Murisengo', 45.082813, 8.136111, 1),
(232, 1, '006121', 'Ovada', 44.637486, 8.646483, 1),
(233, 1, '006147', 'Rocca Grimalda', 44.672520, 8.649537, 1),
(234, 1, '006160', 'Serravalle Scrivia', 44.722549, 8.857209, 1),
(235, 1, '006161', 'Sezzadio', 44.785961, 8.573778, 1),
(236, 1, '006168', 'Strevi', 44.699005, 8.523309, 1),
(237, 1, '006179', 'Vignale Monferrato', 45.012371, 8.397370, 1),
(238, 1, '006188', 'Volpedo', 44.891098, 8.981881, 1),
(239, 5, '003016', 'Bellinzago Novarese', 45.569870, 8.644390, 1),
(240, 5, '003025', 'Borgo Ticino', 45.690331, 8.602980, 1),
(241, 5, '003024', 'Borgomanero', 45.698700, 8.462570, 1),
(242, 5, '003027', 'Briona', 45.543442, 8.480960, 1),
(244, 5, '003030', 'Caltignaga', 45.519939, 8.589860, 1),
(245, 5, '003032', 'Cameri', 45.504219, 8.663910, 1),
(246, 5, '003036', 'Carpignano Sesia', 45.535332, 8.419540, 1),
(247, 5, '003040', 'Casalino', 45.359390, 8.525000, 1),
(248, 7, '103026', 'Crodo', 46.222729, 8.323438, 1),
(249, 7, '103039', 'Macugnaga', 45.968281, 7.968295, 1),
(250, 6, '001057', 'Carema', 45.584538, 7.811889, 1),
(251, 6, '001058', 'Carignano', 44.907982, 7.674389, 1),
(252, 6, '001059', 'Carmagnola', 44.845486, 7.719197, 1),
(253, 6, '001063', 'Caselle Torinese', 45.177364, 7.647452, 1),
(254, 6, '001066', 'Castellamonte', 45.382980, 7.713296, 1),
(255, 6, '001073', 'Ceresole Reale', 45.432484, 7.236147, 1),
(256, 6, '001078', 'Chieri', 45.011562, 7.822578, 1),
(257, 6, '001082', 'Chivasso', 45.189880, 7.884258, 1),
(258, 6, '001090', 'Collegno', 45.077747, 7.570379, 1),
(259, 6, '001103', 'Fenestrelle', 45.034485, 7.052230, 1),
(260, 6, '001120', 'Grugliasco', 45.062321, 7.578284, 1),
(261, 6, '001128', 'Lanzo Torinese', 45.274147, 7.481198, 1),
(262, 6, '001139', 'Luserna San Giovanni', 44.813831, 7.245294, 1),
(263, 6, '001143', 'Maglione', 45.347668, 8.014556, 1),
(264, 6, '001164', 'Nichelino', 44.995060, 7.647063, 1),
(265, 6, '001169', 'Novalesa', 45.191170, 7.014799, 1),
(266, 6, '001178', 'Pancalieri', 44.834557, 7.587037, 1),
(267, 6, '001195', 'Piscina', 44.919868, 7.426407, 1),
(268, 6, '001203', 'Pralormo', 44.860798, 7.902500, 1),
(269, 6, '001246', 'San Giusto Canavese', 45.316277, 7.810333, 1),
(270, 6, '001255', 'Sant''Ambrogio di Torino', 46.136112, 8.463444, 1),
(271, 6, '001257', 'Santena', 44.949024, 7.772754, 1),
(272, 6, '001309', 'Vinovo', 44.948174, 7.633767, 1),
(273, 6, '001313', 'Viù', 45.238911, 7.376600, 1),
(274, 8, '002156', 'Varallo', 45.813831, 8.253510, 1),
(275, 7, '103033', 'Ghiffa', 45.959240, 8.618148, 1),
(276, 7, '103028', 'Domodossola', 46.114838, 8.291528, 1),
(277, 6, '001287', 'Valperga', 45.370125, 7.657863, 1),
(278, 3, '096011', 'Campiglia Cervo', 45.663414, 7.999847, 1),
(279, 4, '004068', 'Chiusa Pesio', 44.323502, 7.677029, 1),
(280, 5, '003134', 'San Nazzaro Sesia', 45.438931, 8.425480, 1),
(281, 8, '002148', 'Trino', 45.193150, 8.297370, 1),
(282, 8, '002016', 'Borgosesia', 45.715343, 8.277202, 1),
(283, 6, '001056', 'Caravino', 45.399223, 7.961407, 1),
(284, 5, '003112', 'Orta San Giulio', 45.798931, 8.419870, 1),
(285, 6, '001148', 'Mazzè', 45.301262, 7.933930, 1),
(286, 6, '001179', 'Parella', 45.430294, 7.794183, 1),
(287, 6, '001181', 'Pavone Canavese', 45.435459, 7.852923, 1),
(288, 6, '001216', 'Rivara', 45.333450, 7.625790, 1),
(289, 6, '001031', 'Borgomasino', 45.364223, 7.988778, 1),
(290, 6, '001110', 'Frossasco', 44.934074, 7.351278, 1),
(291, 3, '096020', 'Cossato', 45.569275, 8.180239, 1),
(292, 3, '096031', 'Massazza', 45.492352, 8.165630, 1),
(293, 4, '004104', 'Lagnasco', 44.626110, 7.555944, 1),
(294, 4, '004131', 'Monesiglio', 44.465694, 8.118851, 1),
(295, 4, '004142', 'Monticello d''Alba', 44.718971, 7.943776, 1),
(296, 4, '004201', 'Saliceto', 44.414391, 8.169870, 1),
(297, 5, '003068', 'Galliate', 45.478062, 8.696040, 1),
(298, 2, '005025', 'Castell''Alfero', 44.982372, 8.210162, 1),
(299, 2, '005084', 'Piea', 45.023228, 8.068086, 1),
(300, 2, '005107', 'Soglio', 44.997372, 8.079537, 1),
(301, 7, '103016', 'Cannero Riviera', 46.022320, 8.679362, 1),
(302, 1, '006077', 'Gabiano', 45.157833, 8.196426, 1),
(303, 1, '006169', 'Tagliolo Monferrato', 44.639065, 8.668667, 1),
(304, 7, '103077', 'Vogogna', 46.010452, 8.290956, 1),
(305, 7, '103034', 'Gignese', 45.861740, 8.511111, 1),
(306, 5, '003133', 'San Maurizio d''Opaglio', 45.772202, 8.398760, 1),
(307, 8, '002108', 'Quinto Vercellese', 45.380630, 8.362815, 1),
(308, 1, '006033', 'Carpeneto', 44.678986, 8.605388, 1),
(309, 1, '006119', 'Orsara Bormida', 44.691277, 8.563926, 1),
(310, 1, '006130', 'Piovera', 44.959557, 8.737037, 1),
(311, 1, '006153', 'San Giorgio Monferrato', 45.107922, 8.414163, 1),
(314, 1, '006138', 'Pozzolo Formigaro', 44.796280, 8.785944, 1),
(315, 2, '005068', 'Monastero Bormida', 44.648678, 8.325753, 1),
(316, 4, '004194', 'Roddi', 44.680630, 7.976574, 1),
(317, 8, '002079', 'Moncrivello', 45.333462, 7.996741, 1),
(318, 8, '002122', 'Rovasenda', 45.539871, 8.318778, 1),
(319, 6, '001244', 'San Giorgio Canavese', 45.335167, 7.797981, 1),
(323, 3, '096001', 'Ailoche', 45.699764, 8.222153, 1),
(324, 6, '001002', 'Airasca', 44.918156, 7.485470, 1),
(325, 1, '006002', 'Albera Ligure', 44.703175, 9.066029, 1),
(326, 6, '001004', 'Albiano d''Ivrea', 45.433907, 7.951722, 1),
(327, 1, '006005', 'Alice Bel Colle', 44.727036, 8.451889, 1),
(328, 6, '001005', 'Alice Superiore', 45.459915, 7.777477, 1),
(329, 1, '006006', 'Alluvioni Cambiò', 45.002369, 8.796260, 1),
(330, 6, '001007', 'Alpette', 45.410549, 7.580774, 1),
(331, 1, '006008', 'Alzano Scrivia', 45.019073, 8.881722, 1),
(332, 6, '001011', 'Angrogna', 44.843807, 7.224643, 1),
(333, 7, '103001', 'Antrona Schieranco', 46.061195, 8.115095, 1),
(334, 7, '103002', 'Anzola d''Ossola', 45.990017, 8.345630, 1),
(335, 4, '004007', 'Arguello', 44.583103, 8.108608, 1),
(336, 6, '001012', 'Arignano', 45.043812, 7.901090, 1),
(337, 7, '103003', 'Arizzano', 45.956036, 8.582134, 1),
(338, 7, '103004', 'Arola', 45.809555, 8.358130, 1),
(339, 7, '103005', 'Aurano', 45.999931, 8.589027, 1),
(340, 1, '006010', 'Avolasca', 44.803722, 8.965650, 1),
(341, 6, '001014', 'Azeglio', 45.424557, 7.995000, 1),
(342, 2, '005006', 'Azzano d''Asti', 44.875454, 8.267968, 1),
(343, 6, '001016', 'Balangero', 45.271408, 7.518611, 1),
(344, 2, '005007', 'Baldichieri d''Asti', 44.905457, 8.090815, 1),
(345, 6, '001017', 'Baldissero Canavese', 45.411259, 7.745315, 1),
(346, 6, '001018', 'Baldissero Torinese', 45.068527, 7.817025, 1),
(347, 8, '002008', 'Balmuccia', 45.818897, 8.142656, 1),
(348, 6, '001020', 'Banchette', 45.454536, 7.857518, 1),
(349, 6, '001021', 'Barbania', 45.292370, 7.631407, 1),
(350, 6, '001023', 'Barone Canavese', 45.326721, 7.874537, 1),
(351, 1, '006013', 'Bassignana', 45.002205, 8.732037, 1),
(352, 4, '004015', 'Battifollo', 44.321491, 8.007075, 1),
(353, 7, '103009', 'Bee', 45.961903, 8.580481, 1),
(354, 4, '004018', 'Belvedere Langhe', 44.494629, 7.972079, 1),
(355, 4, '004020', 'Benevello', 44.630962, 8.105333, 1),
(356, 1, '006015', 'Bergamasco', 44.828297, 8.455963, 1),
(357, 4, '004022', 'Bernezzo', 44.386330, 7.436598, 1),
(358, 2, '005009', 'Berzano di San Pietro', 45.095245, 7.953071, 1),
(359, 1, '006016', 'Berzano di Tortona', 44.876656, 8.950927, 1),
(361, 6, '001026', 'Bobbio Pellice', 44.807842, 7.117817, 1),
(362, 5, '003019', 'Boca', 45.679630, 8.409310, 1),
(363, 5, '003021', 'Bogogno', 45.664459, 8.535700, 1),
(364, 6, '001027', 'Bollengo', 45.470306, 7.946610, 1),
(365, 5, '003022', 'Bolzano Novarese', 45.765018, 8.446110, 1),
(366, 4, '004023', 'Bonvicino', 44.504700, 8.017107, 1),
(367, 6, '001029', 'Borgiallo', 45.418148, 7.669704, 1),
(368, 5, '003023', 'Borgolavezzaro', 45.320629, 8.700630, 1),
(369, 4, '004024', 'Borgomale', 44.621510, 8.132402, 1),
(370, 1, '006019', 'Borgoratto Alessandrino', 44.837372, 8.539704, 1),
(371, 3, '096006', 'Borriana', 45.502972, 8.039304, 1),
(372, 6, '001033', 'Bosconero', 45.267982, 7.764074, 1),
(373, 4, '004026', 'Bosia', 44.602493, 8.147947, 1),
(374, 1, '006022', 'Bosio', 44.650795, 8.793907, 1),
(375, 4, '004027', 'Bossolasco', 44.529217, 8.052104, 1),
(376, 1, '006023', 'Bozzole', 45.071053, 8.607104, 1),
(377, 8, '002019', 'Breia', 45.766701, 8.310817, 1),
(378, 4, '004030', 'Briaglia', 44.395084, 7.876943, 1),
(379, 6, '001035', 'Bricherasio', 44.824535, 7.306574, 1),
(380, 4, '004031', 'Briga Alta', 44.083355, 7.749462, 1),
(381, 5, '003026', 'Briga Novarese', 45.733280, 8.450910, 1),
(382, 4, '004032', 'Brondello', 44.601723, 7.407037, 1),
(383, 4, '004033', 'Brossasco', 44.569702, 7.362815, 1),
(384, 6, '001036', 'Brosso', 45.493988, 7.803909, 1),
(385, 6, '001037', 'Brozolo', 45.117733, 8.072537, 1),
(386, 6, '001038', 'Bruino', 45.021160, 7.464584, 1),
(387, 6, '001039', 'Brusasco', 45.155830, 8.059529, 1),
(388, 3, '096007', 'Brusnengo', 45.603870, 8.248856, 1),
(389, 6, '001040', 'Bruzolo', 45.143394, 7.193776, 1),
(390, 6, '001041', 'Buriasco', 44.874702, 7.411407, 1),
(391, 6, '001042', 'Burolo', 45.482204, 7.935000, 1),
(392, 8, '002021', 'Buronzo', 45.481888, 8.268296, 1),
(393, 6, '001043', 'Busano', 45.333130, 7.657070, 1),
(394, 6, '001044', 'Bussoleno', 45.141426, 7.147500, 1),
(395, 7, '103015', 'Cambiasca', 45.963398, 8.544969, 1),
(396, 4, '004035', 'Camerana', 44.422791, 8.140629, 1),
(397, 4, '004036', 'Camo', 44.695442, 8.194880, 1),
(398, 8, '002025', 'Campertogno', 45.799870, 8.033296, 1),
(399, 6, '001049', 'Campiglione Fenile', 44.802670, 7.324765, 1),
(400, 4, '004037', 'Canale', 44.799538, 7.998444, 1),
(401, 6, '001050', 'Candia Canavese', 45.328758, 7.886259, 1),
(402, 6, '001051', 'Candiolo', 44.960335, 7.602815, 1),
(403, 6, '001052', 'Canischio', 45.374527, 7.595830, 1),
(404, 7, '103017', 'Cannobio', 46.060631, 8.697500, 1),
(405, 4, '004038', 'Canosio', 44.455585, 7.082381, 1),
(406, 6, '001053', 'Cantalupa', 44.947056, 7.331407, 1),
(407, 1, '006028', 'Cantalupo Ligure', 44.719242, 9.046111, 1),
(408, 2, '005018', 'Cantarana', 44.902645, 8.028259, 1),
(409, 6, '001054', 'Cantoira', 45.339527, 7.387041, 1),
(410, 4, '004039', 'Caprauna', 44.106880, 7.970549, 1),
(411, 7, '103018', 'Caprezzo', 45.981979, 8.562360, 1),
(412, 1, '006029', 'Capriata d''Orba', 44.728813, 8.689513, 1),
(413, 6, '001055', 'Caprie', 45.119850, 7.333148, 1),
(414, 2, '005019', 'Capriglio', 45.004513, 8.009507, 1),
(415, 3, '096013', 'Caprile', 45.689087, 8.215482, 1),
(416, 4, '004041', 'Caramagna Piemonte', 44.780273, 7.738973, 1),
(417, 1, '006030', 'Carbonara Scrivia', 44.850166, 8.870963, 1),
(418, 8, '002029', 'Carcoforo', 45.908333, 8.049702, 1),
(419, 4, '004042', 'Cardè', 44.745480, 7.478760, 1),
(420, 1, '006031', 'Carentino', 44.828133, 8.470074, 1),
(421, 8, '002030', 'Caresana', 45.221889, 8.506426, 1),
(422, 8, '002031', 'Caresanablot', 45.358463, 8.393130, 1),
(423, 1, '006032', 'Carezzano', 44.808167, 8.901324, 1),
(424, 8, '002032', 'Carisio', 45.410316, 8.200167, 1),
(425, 1, '006034', 'Carrega Ligure', 44.619179, 9.175846, 1),
(426, 1, '006035', 'Carrosio', 44.659222, 8.832667, 1),
(427, 4, '004044', 'Cartignano', 44.478886, 7.286134, 1),
(428, 1, '006036', 'Cartosio', 44.591259, 8.421722, 1),
(429, 1, '006037', 'Casal Cermelli', 44.835239, 8.625584, 1),
(430, 5, '003037', 'Casalbeltrame', 45.438801, 8.466270, 1),
(431, 6, '001060', 'Casalborgone', 45.131222, 7.941392, 1),
(432, 7, '103019', 'Casale Corte Cerro', 45.916328, 8.414145, 1),
(433, 1, '006038', 'Casaleggio Boiro', 44.634537, 8.731574, 1),
(434, 5, '003039', 'Casaleggio Novara', 45.489868, 8.493150, 1),
(435, 4, '004045', 'Casalgrasso', 44.818298, 7.625974, 1),
(436, 1, '006040', 'Casalnoceto', 44.914074, 8.983296, 1),
(437, 5, '003041', 'Casalvolone', 45.401741, 8.464530, 1),
(438, 8, '002033', 'Casanova Elvo', 45.402054, 8.294704, 1),
(439, 3, '096014', 'Casapinta', 45.616741, 8.197037, 1),
(440, 1, '006041', 'Casasco', 44.828892, 9.006027, 1),
(441, 6, '001061', 'Cascinette d''Ivrea', 45.481277, 7.906722, 1),
(442, 6, '001062', 'Caselette', 45.105797, 7.482056, 1),
(443, 2, '005020', 'Casorzo', 45.023445, 8.338130, 1),
(444, 1, '006042', 'Cassano Spinola', 44.763355, 8.861468, 1),
(445, 2, '005021', 'Cassinasco', 44.689465, 8.301832, 1),
(446, 1, '006044', 'Cassinelle', 44.602501, 8.564537, 1),
(447, 6, '001064', 'Castagneto Po', 45.160332, 7.890648, 1),
(448, 4, '004046', 'Castagnito', 44.756409, 8.032518, 1),
(449, 6, '001065', 'Castagnole Piemonte', 44.899242, 7.567370, 1),
(450, 2, '005024', 'Castel Boglione', 44.722980, 8.381111, 1),
(451, 2, '005032', 'Castel Rocchero', 44.719578, 8.414929, 1),
(452, 4, '004047', 'Casteldelfino', 44.590630, 7.070944, 1),
(453, 1, '006045', 'Castellania', 44.798424, 8.929796, 1),
(454, 4, '004048', 'Castellar', 44.621700, 7.437344, 1),
(455, 1, '006046', 'Castellar Guidobono', 44.905975, 8.947144, 1),
(456, 1, '006047', 'Castellazzo Bormida', 44.846111, 8.578463, 1),
(457, 5, '003042', 'Castellazzo Novarese', 45.514389, 8.488150, 1),
(458, 2, '005026', 'Castellero', 44.925671, 8.074340, 1),
(459, 3, '096015', 'Castelletto Cervo', 45.520626, 8.224836, 1),
(460, 1, '006048', 'Castelletto d''Erro', 44.627369, 8.394870, 1),
(461, 1, '006049', 'Castelletto d''Orba', 44.685570, 8.704521, 1),
(462, 1, '006050', 'Castelletto Merli', 45.074837, 8.241286, 1),
(463, 2, '005027', 'Castelletto Molina', 44.751045, 8.432476, 1),
(464, 1, '006051', 'Castelletto Monferrato', 44.982204, 8.565630, 1),
(465, 5, '003043', 'Castelletto sopra Ticino', 45.718712, 8.636850, 1),
(466, 4, '004049', 'Castelletto Stura', 44.443874, 7.639286, 1),
(467, 4, '004050', 'Castelletto Uzzone', 44.499039, 8.187880, 1),
(468, 4, '004051', 'Castellinaldo', 44.775963, 8.030963, 1),
(469, 4, '004052', 'Castellino Tanaro', 44.428108, 7.981292, 1),
(470, 2, '005028', 'Castello di Annone', 44.879246, 8.313776, 1),
(471, 2, '005029', 'Castelnuovo Belbo', 44.800610, 8.411562, 1),
(472, 1, '006052', 'Castelnuovo Bormida', 44.743706, 8.546682, 1),
(473, 2, '005030', 'Castelnuovo Calcea', 44.789249, 8.285097, 1),
(474, 4, '004054', 'Castelnuovo di Ceva', 44.354149, 8.129309, 1),
(475, 6, '001067', 'Castelnuovo Nigra', 45.439240, 7.695796, 1),
(476, 1, '006054', 'Castelspina', 44.807205, 8.584222, 1),
(477, 4, '004056', 'Castiglione Tinella', 44.726425, 8.191259, 1),
(478, 6, '001068', 'Castiglione Torinese', 45.120205, 7.815466, 1),
(479, 4, '004057', 'Castino', 44.618927, 8.183611, 1),
(480, 5, '003044', 'Cavaglietto', 45.603130, 8.503300, 1),
(481, 5, '003045', 'Cavaglio d''Agogna', 45.614239, 8.487370, 1),
(482, 7, '103020', 'Cavaglio Spoccia', 46.071529, 8.607038, 1),
(483, 6, '001069', 'Cavagnolo', 45.152870, 8.050135, 1),
(484, 4, '004058', 'Cavallerleone', 44.741280, 7.665000, 1),
(485, 4, '004059', 'Cavallermaggiore', 44.710964, 7.687518, 1),
(486, 5, '003047', 'Cavallirio', 45.664391, 8.395630, 1),
(487, 1, '006055', 'Cavatore', 44.631241, 8.452276, 1),
(488, 6, '001070', 'Cavour', 44.785732, 7.375018, 1),
(489, 2, '005033', 'Cellarengo', 44.865124, 7.945127, 1),
(490, 4, '004060', 'Celle di Macra', 44.482857, 7.180646, 1),
(491, 2, '005034', 'Celle Enomondo', 44.857815, 8.124852, 1),
(492, 8, '002038', 'Cellio', 45.757099, 8.311744, 1),
(493, 4, '004061', 'Centallo', 44.503628, 7.586407, 1),
(494, 7, '103021', 'Ceppo Morelli', 45.971470, 8.068527, 1),
(495, 5, '003049', 'Cerano', 45.412060, 8.781280, 1),
(496, 6, '001071', 'Cercenasco', 44.860550, 7.504891, 1),
(497, 6, '001072', 'Ceres', 45.313038, 7.388882, 1),
(498, 1, '006057', 'Cereseto', 45.088177, 8.318534, 1),
(499, 4, '004062', 'Ceresole Alba', 44.800568, 7.824197, 1),
(500, 3, '096017', 'Cerreto Castello', 45.566986, 8.153618, 1),
(501, 2, '005035', 'Cerreto d''Asti', 45.049564, 8.036730, 1),
(502, 1, '006058', 'Cerreto Grue', 44.843613, 8.931407, 1),
(503, 4, '004063', 'Cerretto Langhe', 44.575386, 8.095378, 1),
(504, 1, '006059', 'Cerrina Monferrato', 45.120354, 8.215573, 1),
(505, 3, '096018', 'Cerrione', 45.469391, 8.069222, 1),
(506, 2, '005036', 'Cerro Tanaro', 44.873878, 8.359654, 1),
(507, 4, '004064', 'Cervasca', 44.382057, 7.472352, 1),
(508, 8, '002041', 'Cervatto', 45.883053, 8.162100, 1),
(509, 7, '103022', 'Cesara', 45.835480, 8.367500, 1),
(510, 2, '005037', 'Cessole', 44.650070, 8.245399, 1),
(511, 6, '001075', 'Chialamberto', 45.364071, 7.340620, 1),
(512, 6, '001076', 'Chianocco', 45.148289, 7.168709, 1),
(513, 6, '001077', 'Chiaverano', 45.498577, 7.904836, 1),
(514, 6, '001079', 'Chiesanuova', 45.418446, 7.656741, 1),
(515, 6, '001080', 'Chiomonte', 45.119232, 6.981540, 1),
(516, 6, '001081', 'Chiusa di San Michele', 45.105331, 7.328296, 1),
(517, 2, '005038', 'Chiusano d''Asti', 44.984959, 8.118092, 1),
(518, 6, '001083', 'Ciconio', 45.331261, 7.759704, 1),
(519, 8, '002042', 'Cigliano', 45.309387, 8.022204, 1),
(520, 4, '004069', 'Cigliè', 44.437500, 7.927670, 1),
(521, 2, '005039', 'Cinaglio', 44.976257, 8.101278, 1),
(522, 6, '001084', 'Cintano', 45.428516, 7.690262, 1),
(523, 6, '001085', 'Cinzano', 45.095333, 7.926722, 1),
(524, 4, '004070', 'Cissone', 44.562500, 8.030760, 1),
(525, 8, '002043', 'Civiasco', 45.806934, 8.293152, 1),
(526, 6, '001087', 'Claviere', 44.938797, 6.750335, 1),
(527, 6, '001088', 'Coassolo Torinese', 45.298759, 7.461574, 1),
(528, 6, '001089', 'Coazze', 45.055649, 7.308148, 1),
(529, 2, '005041', 'Coazzolo', 44.728275, 8.145487, 1),
(530, 3, '096019', 'Coggiola', 45.685257, 8.184722, 1),
(531, 5, '003051', 'Colazza', 45.793610, 8.501410, 1),
(532, 6, '001091', 'Colleretto Castelnuovo', 45.423462, 7.680944, 1),
(533, 6, '001092', 'Colleretto Giacosa', 45.433926, 7.799704, 1),
(534, 8, '002045', 'Collobiano', 45.396954, 8.349333, 1),
(535, 5, '003052', 'Comignago', 45.715881, 8.565170, 1),
(536, 6, '001093', 'Condove', 45.118462, 7.308759, 1),
(537, 1, '006060', 'Coniolo', 45.147167, 8.372467, 1),
(538, 1, '006061', 'Conzano', 45.021294, 8.454272, 1),
(539, 6, '001094', 'Corio', 45.314869, 7.533463, 1),
(540, 4, '004072', 'Corneliano d''Alba', 44.737206, 7.958463, 1),
(541, 2, '005044', 'Corsione', 45.002979, 8.145953, 1),
(542, 2, '005045', 'Cortandone', 44.960011, 8.057427, 1),
(543, 2, '005048', 'Cortiglione', 44.823475, 8.358284, 1),
(544, 4, '004074', 'Cossano Belbo', 44.669807, 8.199325, 1),
(545, 6, '001095', 'Cossano Canavese', 45.388760, 7.992667, 1),
(546, 7, '103023', 'Cossogno', 45.961933, 8.504479, 1),
(547, 2, '005049', 'Cossombrato', 44.992741, 8.136549, 1),
(548, 1, '006062', 'Costa Vescovato', 44.817135, 8.927344, 1),
(549, 8, '002047', 'Costanzana', 45.237255, 8.371067, 1),
(550, 4, '004075', 'Costigliole Saluzzo', 44.565647, 7.486574, 1),
(551, 8, '002048', 'Cravagliana', 45.848522, 8.203047, 1),
(552, 4, '004076', 'Cravanzana', 44.573593, 8.128428, 1),
(553, 7, '103024', 'Craveggia', 46.140766, 8.489540, 1),
(554, 1, '006063', 'Cremolino', 44.637054, 8.586426, 1),
(555, 8, '002049', 'Crescentino', 45.191406, 8.101111, 1),
(556, 5, '003055', 'Cressa', 45.649220, 8.510170, 1),
(557, 3, '096021', 'Crevacuore', 45.685440, 8.246681, 1),
(558, 7, '103025', 'Crevoladossola', 46.147015, 8.296352, 1),
(559, 4, '004077', 'Crissolo', 44.698586, 7.158658, 1),
(560, 3, '096022', 'Crosa', 45.610245, 8.186283, 1),
(561, 8, '002052', 'Crova', 45.331741, 8.212056, 1),
(562, 1, '006064', 'Cuccaro Monferrato', 44.993217, 8.456890, 1),
(563, 6, '001096', 'Cuceglio', 45.360443, 7.816347, 1),
(564, 6, '001097', 'Cumiana', 44.980797, 7.377815, 1),
(565, 2, '005051', 'Cunico', 45.040394, 8.096889, 1),
(566, 6, '001098', 'Cuorgnè', 45.390720, 7.649630, 1),
(567, 5, '003058', 'Cureggio', 45.675961, 8.460960, 1),
(568, 3, '096023', 'Curino', 45.628201, 8.237078, 1),
(569, 7, '103027', 'Cursolo-Orasso', 46.097790, 8.566786, 1),
(570, 4, '004079', 'Demonte', 44.315113, 7.295374, 1),
(571, 1, '006065', 'Denice', 44.599640, 8.333285, 1),
(572, 1, '006066', 'Dernice', 44.767502, 9.051407, 1),
(573, 8, '002054', 'Desana', 45.270630, 8.360963, 1),
(574, 4, '004080', 'Diano d''Alba', 44.651104, 8.028440, 1),
(575, 5, '003060', 'Divignano', 45.663460, 8.602830, 1),
(576, 4, '004081', 'Dogliani', 44.530628, 7.945908, 1),
(577, 3, '096024', 'Donato', 45.527943, 7.909415, 1),
(578, 5, '003062', 'Dormelletto', 45.727219, 8.580310, 1),
(579, 3, '096025', 'Dorzano', 45.426502, 8.098573, 1),
(580, 4, '004082', 'Dronero', 44.466721, 7.352518, 1),
(581, 6, '001099', 'Druento', 45.134346, 7.576462, 1),
(582, 7, '103029', 'Druogno', 46.135963, 8.437204, 1),
(583, 2, '005052', 'Dusino San Michele', 44.922836, 7.973754, 1),
(584, 4, '004083', 'Elva', 44.539875, 7.089808, 1),
(585, 4, '004084', 'Entracque', 44.240589, 7.397581, 1),
(586, 4, '004085', 'Envie', 44.683296, 7.372370, 1),
(587, 1, '006067', 'Fabbrica Curone', 44.784885, 9.147591, 1),
(588, 7, '103030', 'Falmenta', 46.072193, 8.590983, 1),
(589, 5, '003065', 'Fara Novarese', 45.552830, 8.459870, 1),
(590, 4, '004086', 'Farigliano', 44.511238, 7.916219, 1),
(591, 4, '004087', 'Faule', 44.807011, 7.582348, 1),
(592, 6, '001101', 'Favria', 45.332203, 7.691722, 1),
(593, 4, '004088', 'Feisoglio', 44.544868, 8.106111, 1),
(594, 6, '001102', 'Feletto', 45.304852, 7.745963, 1),
(595, 1, '006068', 'Felizzano', 44.900314, 8.437056, 1),
(596, 2, '005053', 'Ferrere', 44.879837, 7.994270, 1),
(597, 6, '001104', 'Fiano', 45.217815, 7.523926, 1),
(598, 6, '001105', 'Fiorano Canavese', 45.468758, 7.834852, 1),
(599, 8, '002057', 'Fobello', 45.890213, 8.157788, 1),
(600, 6, '001106', 'Foglizzo', 45.272980, 7.820944, 1),
(601, 5, '003066', 'Fontaneto d''Agogna', 45.644550, 8.482060, 1),
(602, 8, '002058', 'Fontanetto Po', 45.194248, 8.192749, 1),
(603, 2, '005054', 'Fontanile', 44.753906, 8.422518, 1),
(604, 7, '103031', 'Formazza', 46.378296, 8.425372, 1),
(605, 8, '002059', 'Formigliana', 45.429436, 8.292821, 1),
(606, 6, '001107', 'Forno Canavese', 45.346424, 7.592204, 1),
(607, 4, '004091', 'Frabosa Sottana', 44.301880, 7.797946, 1),
(608, 1, '006069', 'Fraconalto', 44.591877, 8.877872, 1),
(609, 1, '006070', 'Francavilla Bisio', 44.735630, 8.732352, 1),
(610, 1, '006071', 'Frascaro', 44.827518, 8.533463, 1),
(611, 1, '006073', 'Frassineto Po', 45.134705, 8.535481, 1),
(612, 6, '001108', 'Frassinetto', 45.437817, 7.607815, 1),
(613, 4, '004092', 'Frassino', 44.572666, 7.277204, 1),
(614, 1, '006074', 'Fresonara', 44.783909, 8.687370, 1),
(615, 2, '005055', 'Frinco', 45.004879, 8.171918, 1),
(616, 6, '001109', 'Front', 45.281914, 7.664062, 1),
(617, 1, '006075', 'Frugarolo', 44.838131, 8.682667, 1),
(618, 1, '006076', 'Fubine', 44.965824, 8.426910, 1),
(619, 4, '004093', 'Gaiola', 44.336258, 7.408148, 1),
(620, 1, '006078', 'Gamalero', 44.809860, 8.541817, 1),
(621, 4, '004094', 'Gambasca', 44.629871, 7.348444, 1),
(622, 1, '006079', 'Garbagna', 44.781406, 8.998907, 1),
(623, 5, '003069', 'Garbagna Novarese', 45.385090, 8.660770, 1),
(624, 5, '003070', 'Gargallo', 45.729870, 8.426410, 1),
(625, 6, '001111', 'Garzigliana', 44.837135, 7.374135, 1),
(626, 6, '001112', 'Gassino Torinese', 45.129776, 7.824298, 1),
(627, 5, '003071', 'Gattico', 45.708130, 8.521280, 1),
(628, 8, '002061', 'Gattinara', 45.618927, 8.368611, 1),
(629, 1, '006080', 'Gavazzana', 44.776726, 8.885697, 1),
(630, 4, '004096', 'Genola', 44.589634, 7.665363, 1),
(631, 6, '001113', 'Germagnano', 45.264851, 7.470630, 1),
(632, 7, '103032', 'Germagno', 45.891800, 8.387999, 1),
(633, 5, '003073', 'Ghemme', 45.600651, 8.422670, 1),
(634, 8, '002062', 'Ghislarengo', 45.529999, 8.386259, 1),
(635, 6, '001114', 'Giaglione', 45.136215, 7.008699, 1),
(636, 1, '006082', 'Giarole', 45.061573, 8.567667, 1),
(637, 6, '001115', 'Giaveno', 45.041771, 7.352521, 1),
(638, 3, '096027', 'Gifflenga', 45.493408, 8.231883, 1),
(639, 6, '001116', 'Givoletto', 45.160858, 7.494986, 1),
(640, 4, '004097', 'Gorzegno', 44.512421, 8.134552, 1),
(641, 4, '004098', 'Gottasecca', 44.461391, 8.168433, 1),
(642, 5, '003076', 'Gozzano', 45.747520, 8.437820, 1),
(643, 2, '005056', 'Grana', 44.999390, 8.300648, 1),
(644, 5, '003077', 'Granozzo con Monticello', 45.361279, 8.574560, 1),
(645, 7, '103035', 'Gravellona Toce', 45.931278, 8.432352, 1),
(646, 6, '001117', 'Gravere', 45.126743, 7.019002, 1),
(647, 2, '005057', 'Grazzano Badoglio', 45.040436, 8.312027, 1),
(648, 8, '002065', 'Greggio', 45.451740, 8.384241, 1),
(649, 1, '006083', 'Gremiasco', 44.796925, 9.105945, 1),
(650, 5, '003079', 'Grignasco', 45.680801, 8.344240, 1),
(651, 1, '006084', 'Grognardo', 44.631363, 8.493459, 1),
(652, 1, '006085', 'Grondona', 44.697178, 8.965968, 1),
(653, 6, '001118', 'Groscavallo', 45.368385, 7.259140, 1),
(654, 6, '001119', 'Grosso', 45.257519, 7.558444, 1),
(655, 8, '002066', 'Guardabosone', 45.702007, 8.249332, 1),
(656, 1, '006086', 'Guazzora', 45.014706, 8.852500, 1),
(657, 7, '103036', 'Gurro', 46.086124, 8.566597, 1),
(658, 4, '004102', 'Igliano', 44.443783, 8.013723, 1),
(659, 6, '001121', 'Ingria', 45.466282, 7.571243, 1),
(660, 7, '103037', 'Intragna', 45.992928, 8.573580, 1),
(661, 6, '001122', 'Inverso Pinasca', 44.945045, 7.218059, 1),
(662, 5, '003082', 'Invorio', 45.757870, 8.489470, 1),
(663, 4, '004103', 'Isasca', 44.587437, 7.380860, 1),
(664, 1, '006087', 'Isola Sant''Antonio', 45.030704, 8.850178, 1),
(665, 6, '001123', 'Isolabella', 44.907516, 7.910167, 1),
(666, 6, '001124', 'Issiglio', 45.446331, 7.755256, 1),
(667, 6, '001126', 'La Cassa', 45.181427, 7.517518, 1),
(668, 6, '001127', 'La Loggia', 44.958759, 7.668444, 1),
(669, 8, '002067', 'Lamporo', 45.230556, 8.097435, 1),
(670, 5, '003083', 'Landiona', 45.497520, 8.423440, 1),
(671, 6, '001129', 'Lauriano', 45.159222, 7.992833, 1),
(672, 6, '001130', 'Leinì', 45.183762, 7.715320, 1),
(673, 6, '001131', 'Lemie', 45.228897, 7.294234, 1),
(674, 8, '002068', 'Lenta', 45.556000, 8.383588, 1),
(675, 4, '004106', 'Lequio Berria', 44.607468, 8.098094, 1),
(676, 4, '004107', 'Lequio Tanaro', 44.560135, 7.884706, 1),
(677, 1, '006088', 'Lerma', 44.636505, 8.715280, 1),
(678, 5, '003084', 'Lesa', 45.824100, 8.560870, 1),
(679, 4, '004108', 'Lesegno', 44.401691, 7.965581, 1),
(680, 6, '001132', 'Lessolo', 45.476097, 7.813732, 1),
(681, 3, '096029', 'Lessona', 45.586376, 8.196429, 1),
(682, 4, '004109', 'Levice', 44.538807, 8.156237, 1),
(683, 6, '001133', 'Levone', 45.317665, 7.607518, 1),
(684, 8, '002070', 'Lignana', 45.287037, 8.345000, 1),
(685, 4, '004111', 'Lisio', 44.307796, 7.978510, 1),
(686, 8, '002071', 'Livorno Ferraris', 45.285000, 8.078611, 1),
(687, 2, '005060', 'Loazzolo', 44.669777, 8.258215, 1),
(688, 6, '001134', 'Locana', 45.416348, 7.459982, 1),
(689, 6, '001135', 'Lombardore', 45.236408, 7.741407, 1),
(690, 6, '001136', 'Lombriasco', 44.842152, 7.636725, 1),
(691, 6, '001137', 'Loranzè', 45.442669, 7.813930, 1),
(692, 7, '103038', 'Loreglia', 45.907574, 8.372271, 1),
(693, 8, '002072', 'Lozzolo', 45.626499, 8.323988, 1),
(694, 1, '006089', 'Lu', 45.002518, 8.485796, 1),
(695, 6, '001138', 'Lugnacco', 45.444462, 7.781776, 1),
(696, 6, '001140', 'Lusernetta', 44.802486, 7.248666, 1),
(697, 6, '001141', 'Lusigliè', 45.319561, 7.765800, 1),
(698, 6, '001142', 'Macello', 44.850601, 7.400965, 1),
(699, 4, '004112', 'Macra', 44.501278, 7.180630, 1),
(700, 7, '103040', 'Madonna del Sasso', 45.792145, 8.371534, 1),
(701, 5, '003088', 'Maggiora', 45.690311, 8.423440, 1),
(702, 4, '004113', 'Magliano Alfieri', 44.770332, 8.071259, 1),
(703, 4, '004114', 'Magliano Alpi', 44.460629, 7.806407, 1),
(704, 3, '096030', 'Magnano', 45.464352, 8.003302, 1),
(705, 7, '103041', 'Malesco', 46.126995, 8.500148, 1),
(706, 1, '006090', 'Malvicino', 44.559177, 8.414370, 1),
(707, 5, '003090', 'Mandello Vitta', 45.496738, 8.460950, 1),
(708, 5, '003091', 'Marano Ticino', 45.630959, 8.632830, 1),
(709, 2, '005061', 'Maranzana', 44.760513, 8.478721, 1),
(710, 4, '004117', 'Marene', 44.662666, 7.733463, 1),
(711, 6, '001144', 'Marentino', 45.056278, 7.878130, 1),
(712, 2, '005062', 'Maretto', 44.945347, 8.034808, 1),
(713, 4, '004118', 'Margarita', 44.404556, 7.686111, 1),
(714, 4, '004119', 'Marmora', 44.458115, 7.093515, 1),
(715, 4, '004120', 'Marsaglia', 44.453926, 7.981111, 1),
(716, 4, '004121', 'Martiniana Po', 44.627388, 7.367307, 1),
(717, 7, '103042', 'Masera', 46.140945, 8.324537, 1),
(718, 6, '001145', 'Massello', 44.958633, 7.056606, 1),
(719, 5, '003093', 'Massino Visconti', 45.822231, 8.539980, 1),
(720, 7, '103043', 'Massiola', 45.912273, 8.320035, 1),
(721, 6, '001146', 'Mathi', 45.256279, 7.543130, 1),
(722, 6, '001147', 'Mattie', 45.119240, 7.116259, 1),
(723, 6, '001149', 'Meana di Susa', 45.123127, 7.062924, 1),
(724, 5, '003095', 'Meina', 45.789871, 8.540020, 1),
(725, 1, '006092', 'Melazzo', 44.645020, 8.426111, 1),
(726, 4, '004122', 'Melle', 44.562729, 7.321448, 1),
(727, 1, '006093', 'Merana', 44.518795, 8.298022, 1),
(728, 6, '001150', 'Mercenasco', 45.357498, 7.881259, 1),
(729, 7, '103044', 'Mergozzo', 45.962372, 8.450630, 1),
(730, 6, '001151', 'Meugliano', 45.490414, 7.779508, 1),
(731, 3, '096033', 'Mezzana Mortigliengo', 45.626743, 8.189786, 1),
(732, 6, '001152', 'Mezzenile', 45.295959, 7.396715, 1),
(733, 5, '003097', 'Mezzomerico', 45.619701, 8.606740, 1),
(734, 3, '096034', 'Miagliano', 45.614315, 8.045802, 1),
(735, 5, '003098', 'Miasino', 45.802979, 8.430960, 1),
(736, 7, '103045', 'Miazzina', 45.977898, 8.516151, 1),
(737, 1, '006094', 'Mirabello Monferrato', 45.036575, 8.524389, 1),
(738, 2, '005063', 'Moasca', 44.763084, 8.278673, 1),
(739, 4, '004123', 'Moiola', 44.322498, 7.390242, 1),
(740, 1, '006095', 'Molare', 44.619705, 8.601741, 1),
(741, 1, '006096', 'Molino dei Torti', 45.025333, 8.894870, 1),
(742, 8, '002078', 'Mollia', 45.815128, 8.030791, 1),
(743, 2, '005064', 'Mombaldone', 44.572109, 8.336552, 1),
(744, 4, '004124', 'Mombarcaro', 44.468212, 8.086699, 1),
(745, 4, '004125', 'Mombasiglio', 44.367668, 7.969074, 1),
(746, 6, '001153', 'Mombello di Torino', 45.046429, 7.921199, 1),
(747, 1, '006097', 'Mombello Monferrato', 45.133926, 8.251407, 1),
(748, 2, '005066', 'Mombercelli', 44.817352, 8.294400, 1),
(749, 5, '003100', 'Momo', 45.576569, 8.554540, 1),
(750, 6, '001154', 'Mompantero', 45.148598, 7.041884, 1),
(751, 1, '006098', 'Momperone', 44.838875, 9.035320, 1),
(752, 2, '005067', 'Monale', 44.935276, 8.072747, 1),
(753, 6, '001155', 'Monastero di Lanzo', 45.301552, 7.440395, 1),
(754, 4, '004126', 'Monastero di Vasco', 44.340782, 7.822846, 1),
(755, 4, '004127', 'Monasterolo Casotto', 44.325504, 7.945504, 1),
(756, 4, '004128', 'Monasterolo di Savigliano', 44.687351, 7.620630, 1),
(757, 6, '001157', 'Moncenisio', 45.203278, 6.984269, 1),
(758, 1, '006099', 'Moncestino', 45.155628, 8.162500, 1),
(759, 4, '004129', 'Monchiero', 44.572914, 7.917053, 1),
(760, 2, '005071', 'Mongardino', 44.848686, 8.217822, 1),
(761, 1, '006100', 'Mongiardino Ligure', 44.639133, 9.060212, 1),
(763, 1, '006101', 'Monleale', 44.885315, 8.975000, 1),
(764, 4, '004133', 'Montà', 44.814701, 7.958460, 1),
(765, 2, '005072', 'Montabone', 44.698814, 8.390117, 1),
(766, 1, '006102', 'Montacuto', 44.766705, 9.105061, 1),
(767, 2, '005073', 'Montafia', 44.989735, 8.024127, 1),
(768, 1, '006103', 'Montaldeo', 44.668068, 8.730013, 1),
(769, 1, '006104', 'Montaldo Bormida', 44.683777, 8.588907, 1),
(770, 4, '004134', 'Montaldo di Mondovì', 44.319462, 7.865330, 1),
(771, 4, '004135', 'Montaldo Roero', 44.769390, 7.925944, 1),
(772, 2, '005074', 'Montaldo Scarampi', 44.831425, 8.260167, 1),
(773, 6, '001158', 'Montaldo Torinese', 45.066425, 7.851426, 1),
(774, 6, '001159', 'Montalenghe', 45.338451, 7.840020, 1),
(775, 6, '001160', 'Montalto Dora', 45.491722, 7.863907, 1),
(776, 6, '001161', 'Montanaro', 45.234535, 7.854556, 1),
(777, 4, '004136', 'Montanera', 44.463295, 7.666722, 1),
(778, 1, '006105', 'Montecastello', 44.950134, 8.687385, 1),
(779, 1, '006106', 'Montechiaro d''Acqui', 44.595482, 8.379870, 1),
(780, 7, '103046', 'Montecrestese', 46.165482, 8.327352, 1),
(781, 1, '006107', 'Montegioco', 44.841923, 8.962874, 1),
(782, 2, '005076', 'Montegrosso d''Asti', 44.821739, 8.238778, 1),
(783, 4, '004137', 'Montelupo Albese', 44.622040, 8.047865, 1),
(784, 4, '004138', 'Montemale di Cuneo', 44.437279, 7.374874, 1),
(785, 1, '006108', 'Montemarzino', 44.848869, 8.992612, 1),
(786, 4, '004139', 'Monterosso Grana', 44.409222, 7.324074, 1),
(787, 7, '103047', 'Montescheno', 46.067101, 8.231731, 1),
(788, 6, '001162', 'Monteu da Po', 45.151642, 8.018086, 1),
(789, 4, '004141', 'Montezemolo', 44.378120, 8.141424, 1),
(790, 1, '006109', 'Morano sul Po', 45.168297, 8.367370, 1),
(791, 2, '005079', 'Moransengo', 45.115799, 8.024641, 1),
(792, 1, '006110', 'Morbello', 44.606571, 8.510967, 1),
(793, 4, '004143', 'Moretta', 44.764851, 7.538296, 1),
(794, 6, '001163', 'Moriondo Torinese', 45.038776, 7.941278, 1),
(795, 1, '006111', 'Mornese', 44.637638, 8.756470, 1),
(796, 4, '004144', 'Morozzo', 44.423126, 7.710063, 1),
(797, 1, '006112', 'Morsasco', 44.666428, 8.552056, 1),
(798, 3, '096084', 'Mosso', 45.646416, 8.136032, 1),
(799, 8, '002082', 'Motta de'' Conti', 45.194538, 8.522037, 1),
(800, 3, '096037', 'Mottalciata', 45.506111, 8.207815, 1),
(801, 4, '004146', 'Murello', 44.753132, 7.602037, 1),
(802, 3, '096038', 'Muzzano', 45.561729, 7.990009, 1),
(803, 4, '004147', 'Narzole', 44.596409, 7.870944, 1),
(804, 5, '003103', 'Nebbiuno', 45.804459, 8.523450, 1),
(805, 3, '096039', 'Netro', 45.538284, 7.946642, 1),
(806, 4, '004149', 'Neviglie', 44.692230, 8.117961, 1),
(807, 5, '003104', 'Nibbiola', 45.372669, 8.657520, 1),
(808, 4, '004150', 'Niella Belbo', 44.513760, 8.080481, 1),
(809, 4, '004151', 'Niella Tanaro', 44.413849, 7.923515, 1),
(810, 6, '001165', 'Noasca', 45.454716, 7.313391, 1),
(811, 6, '001166', 'Nole', 45.242371, 7.574222, 1),
(812, 6, '001167', 'Nomaglio', 45.536041, 7.860293, 1),
(813, 6, '001168', 'None', 44.934242, 7.541259, 1),
(814, 7, '103048', 'Nonio', 45.846722, 8.378778, 1),
(815, 4, '004152', 'Novello', 44.588772, 7.927458, 1),
(816, 4, '004153', 'Nucetto', 44.341923, 8.060966, 1),
(817, 3, '096040', 'Occhieppo Inferiore', 45.551109, 8.022204, 1),
(818, 3, '096041', 'Occhieppo Superiore', 45.564205, 8.005008, 1),
(819, 1, '006115', 'Occimiano', 45.061268, 8.508760, 1),
(820, 1, '006116', 'Odalengo Grande', 45.110001, 8.168148, 1),
(821, 1, '006117', 'Odalengo Piccolo', 45.072021, 8.207218, 1),
(822, 7, '103049', 'Oggebbio', 45.998768, 8.651570, 1),
(823, 6, '001170', 'Oglianico', 45.343452, 7.695778, 1),
(824, 8, '002088', 'Olcenengo', 45.364555, 8.310944, 1),
(825, 8, '002089', 'Oldenico', 45.403759, 8.382204, 1),
(826, 5, '003108', 'Oleggio', 45.596699, 8.637620, 1),
(827, 5, '003109', 'Oleggio Castello', 45.748550, 8.526890, 1),
(828, 1, '006118', 'Olivola', 45.037983, 8.368149, 1),
(829, 2, '005081', 'Olmo Gentile', 44.586185, 8.248377, 1),
(830, 7, '103050', 'Omegna', 45.876080, 8.408778, 1),
(831, 4, '004154', 'Oncino', 44.676205, 7.190461, 1),
(832, 6, '001171', 'Orbassano', 45.007454, 7.537428, 1),
(833, 6, '001172', 'Orio Canavese', 45.330334, 7.862815, 1),
(834, 7, '103051', 'Ornavasso', 45.968906, 8.416259, 1),
(835, 6, '001173', 'Osasco', 44.848454, 7.343822, 1),
(836, 6, '001174', 'Osasio', 44.872517, 7.609241, 1),
(837, 4, '004156', 'Ostana', 44.693111, 7.186758, 1),
(838, 1, '006120', 'Ottiglio', 45.052460, 8.338398, 1),
(839, 6, '001175', 'Oulx', 45.033325, 6.833635, 1),
(840, 1, '006122', 'Oviglio', 44.862370, 8.488926, 1),
(841, 6, '001176', 'Ozegna', 45.350018, 7.746426, 1),
(842, 1, '006123', 'Ozzano Monferrato', 45.106853, 8.371605, 1),
(843, 1, '006124', 'Paderna', 44.821575, 8.892352, 1),
(844, 4, '004157', 'Paesana', 44.686260, 7.275881, 1),
(845, 4, '004158', 'Pagno', 44.612831, 7.426889, 1),
(846, 6, '001177', 'Palazzo Canavese', 45.458622, 7.979655, 1),
(847, 8, '002090', 'Palazzolo Vercellese', 45.185585, 8.230806, 1),
(848, 7, '103052', 'Pallanzeno', 46.042980, 8.259222, 1),
(849, 1, '006125', 'Pareto', 44.516689, 8.382330, 1),
(850, 1, '006126', 'Parodi Ligure', 44.670708, 8.758052, 1),
(851, 4, '004160', 'Paroldo', 44.433147, 8.073611, 1),
(852, 5, '003114', 'Paruzzaro', 45.749722, 8.517690, 1),
(853, 2, '005082', 'Passerano Marmorito', 45.057743, 8.018928, 1),
(854, 1, '006127', 'Pasturana', 44.751884, 8.750308, 1),
(855, 6, '001180', 'Pavarolo', 45.069515, 7.836241, 1),
(856, 6, '001182', 'Pecco', 45.451805, 7.777187, 1),
(857, 1, '006128', 'Pecetto di Valenza', 44.991028, 8.672068, 1),
(858, 6, '001183', 'Pecetto Torinese', 45.017208, 7.750370, 1),
(859, 5, '003115', 'Pella', 45.800110, 8.385890, 1),
(860, 2, '005083', 'Penango', 45.031475, 8.250567, 1),
(861, 4, '004161', 'Perletto', 44.600315, 8.214241, 1),
(862, 4, '004162', 'Perlo', 44.332790, 8.083557, 1),
(863, 6, '001184', 'Perosa Argentina', 44.956902, 7.191904, 1),
(864, 6, '001185', 'Perosa Canavese', 45.398148, 7.832056, 1),
(865, 6, '001186', 'Perrero', 44.938328, 7.114710, 1),
(866, 8, '002091', 'Pertengo', 45.236057, 8.417620, 1),
(867, 6, '001187', 'Pertusio', 45.356743, 7.642667, 1),
(868, 6, '001188', 'Pessinetto', 45.289181, 7.403896, 1),
(869, 5, '003116', 'Pettenasco', 45.817501, 8.408130, 1),
(870, 3, '096042', 'Pettinengo', 45.614075, 8.105315, 1),
(871, 8, '002093', 'Pezzana', 45.263149, 8.486278, 1),
(872, 4, '004164', 'Pezzolo Valle Uzzone', 44.539795, 8.194751, 1),
(873, 6, '001189', 'Pianezza', 45.098579, 7.548355, 1),
(874, 4, '004165', 'Pianfei', 44.373150, 7.712500, 1),
(875, 3, '096043', 'Piatto', 45.590961, 8.136407, 1),
(876, 3, '096044', 'Piedicavallo', 45.689304, 7.954676, 1),
(877, 7, '103053', 'Piedimulera', 46.025547, 8.260013, 1),
(878, 1, '006129', 'Pietra Marazzi', 44.943779, 8.669704, 1),
(879, 4, '004167', 'Pietraporzio', 44.344543, 7.031841, 1),
(880, 7, '103054', 'Pieve Vergonte', 46.013908, 8.262055, 1),
(881, 8, '002096', 'Pila', 45.770500, 8.083311, 1),
(882, 6, '001190', 'Pinasca', 44.942387, 7.227500, 1),
(883, 2, '005085', 'Pino d''Asti', 45.057476, 7.986330, 1),
(884, 6, '001192', 'Pino Torinese', 45.040649, 7.778296, 1),
(885, 4, '004168', 'Piobesi d''Alba', 44.736279, 7.980796, 1),
(886, 6, '001193', 'Piobesi Torinese', 44.933907, 7.611259, 1),
(887, 8, '002097', 'Piode', 45.772057, 8.051722, 1),
(888, 6, '001194', 'Piossasco', 44.991085, 7.463538, 1),
(889, 2, '005086', 'Piovà Massaia', 45.053532, 8.049160, 1),
(890, 4, '004169', 'Piozzo', 44.514851, 7.893778, 1),
(891, 5, '003119', 'Pisano', 45.793560, 8.511490, 1),
(892, 6, '001196', 'Piverone', 45.447369, 8.006889, 1),
(893, 4, '004170', 'Pocapaglia', 44.716259, 7.884074, 1),
(894, 5, '003120', 'Pogno', 45.756569, 8.385800, 1),
(895, 6, '001197', 'Poirino', 44.921890, 7.848148, 1),
(896, 3, '096046', 'Pollone', 45.580795, 8.007037, 1),
(897, 4, '004171', 'Polonghera', 44.803463, 7.596889, 1),
(898, 6, '001198', 'Pomaretto', 44.955959, 7.182911, 1),
(899, 1, '006131', 'Pomaro Monferrato', 45.063499, 8.596761, 1),
(900, 5, '003121', 'Pombia', 45.652000, 8.633460, 1),
(901, 6, '001199', 'Pont-Canavese', 45.423927, 7.597352, 1),
(902, 4, '004172', 'Pontechianale', 44.622368, 7.031284, 1),
(903, 1, '006132', 'Pontecurone', 44.961277, 8.935018, 1),
(904, 1, '006133', 'Pontestura', 45.143444, 8.334389, 1),
(905, 1, '006134', 'Ponti', 44.629429, 8.365344, 1),
(906, 1, '006135', 'Ponzano Monferrato', 45.085468, 8.263226, 1),
(907, 1, '006136', 'Ponzone', 44.589241, 8.460481, 1),
(908, 2, '005087', 'Portacomaro', 44.958179, 8.257616, 1),
(909, 6, '001200', 'Porte', 44.887859, 7.270339, 1),
(910, 3, '096048', 'Portula', 45.674667, 8.179614, 1),
(911, 8, '002102', 'Postua', 45.713924, 8.231722, 1),
(912, 1, '006137', 'Pozzol Groppo', 44.877560, 9.029237, 1),
(913, 4, '004173', 'Pradleves', 44.418781, 7.281370, 1),
(914, 6, '001202', 'Prali', 44.889050, 7.048747, 1),
(915, 3, '096049', 'Pralungo', 45.591278, 8.039704, 1),
(916, 6, '001204', 'Pramollo', 44.904049, 7.214573, 1),
(917, 8, '002104', 'Prarolo', 45.280960, 8.477667, 1),
(918, 6, '001205', 'Prarostino', 44.866631, 7.268449, 1);
INSERT INTO `ipie_ipie_city` (`city_id`, `province_id`, `istat`, `name`, `latitudine`, `longitudine`, `published`) VALUES
(919, 1, '006139', 'Prasco', 44.639732, 8.552413, 1),
(920, 6, '001206', 'Prascorsano', 45.368759, 7.618148, 1),
(921, 6, '001207', 'Pratiglione', 45.353649, 7.596200, 1),
(922, 5, '003122', 'Prato Sesia', 45.647350, 8.373830, 1),
(923, 4, '004174', 'Prazzo', 44.483189, 7.055972, 1),
(924, 1, '006140', 'Predosa', 44.752354, 8.656574, 1),
(925, 7, '103055', 'Premeno', 45.980000, 8.598907, 1),
(926, 7, '103056', 'Premia', 46.267147, 8.333928, 1),
(927, 7, '103057', 'Premosello-Chiovenda', 46.005165, 8.330000, 1),
(928, 4, '004175', 'Priero', 44.375401, 8.095762, 1),
(929, 4, '004176', 'Priocca', 44.787369, 8.065315, 1),
(930, 4, '004177', 'Priola', 44.244705, 8.022352, 1),
(931, 4, '004178', 'Prunetto', 44.491253, 8.144920, 1),
(932, 6, '001208', 'Quagliuzzo', 45.427837, 7.783439, 1),
(933, 2, '005088', 'Quaranti', 44.750973, 8.449992, 1),
(934, 3, '096051', 'Quaregna', 45.582203, 8.164852, 1),
(935, 1, '006141', 'Quargnento', 44.945946, 8.488130, 1),
(936, 7, '103058', 'Quarna Sopra', 45.872139, 8.371732, 1),
(937, 7, '103059', 'Quarna Sotto', 45.870167, 8.364556, 1),
(938, 8, '002107', 'Quarona', 45.758926, 8.266889, 1),
(939, 6, '001209', 'Quassolo', 45.523926, 7.833444, 1),
(940, 1, '006142', 'Quattordio', 44.897350, 8.406111, 1),
(941, 6, '001210', 'Quincinetto', 45.562160, 7.807469, 1),
(942, 3, '096052', 'Quittengo', 45.657505, 8.011786, 1),
(943, 8, '002110', 'Rassa', 45.768417, 8.012030, 1),
(944, 7, '103060', 'Re', 46.133240, 8.549962, 1),
(945, 6, '001211', 'Reano', 45.052200, 7.430206, 1),
(946, 5, '003129', 'Recetto', 45.461430, 8.436890, 1),
(947, 2, '005089', 'Refrancore', 44.936485, 8.343804, 1),
(948, 2, '005090', 'Revigliasco', 44.859047, 8.158629, 1),
(949, 6, '001212', 'Ribordone', 45.433201, 7.502565, 1),
(950, 1, '006143', 'Ricaldone', 44.733463, 8.469222, 1),
(951, 4, '004181', 'Rifreddo', 44.651722, 7.347500, 1),
(952, 8, '002111', 'Rima San Giuseppe', 45.884705, 7.998918, 1),
(953, 8, '002112', 'Rimasco', 45.860001, 8.063907, 1),
(954, 8, '002113', 'Rimella', 45.909073, 8.183463, 1),
(955, 4, '004182', 'Rittana', 44.351257, 7.398546, 1),
(956, 6, '001215', 'Riva presso Chieri', 44.985943, 7.873444, 1),
(957, 8, '002114', 'Riva Valdobbia', 45.832054, 7.957833, 1),
(958, 6, '001213', 'Rivalba', 45.119389, 7.889222, 1),
(959, 1, '006144', 'Rivalta Bormida', 44.710796, 8.552815, 1),
(960, 6, '001214', 'Rivalta di Torino', 45.032990, 7.523180, 1),
(961, 6, '001217', 'Rivarolo Canavese', 45.331974, 7.723224, 1),
(962, 1, '006145', 'Rivarone', 44.977814, 8.716722, 1),
(963, 6, '001218', 'Rivarossa', 45.252666, 7.715944, 1),
(964, 8, '002115', 'Rive', 45.215168, 8.418778, 1),
(965, 4, '004183', 'Roaschia', 44.270226, 7.454314, 1),
(966, 4, '004184', 'Roascio', 44.415260, 8.029545, 1),
(967, 8, '002116', 'Roasio', 45.605755, 8.287069, 1),
(968, 2, '005091', 'Roatto', 44.952415, 8.027012, 1),
(969, 6, '001220', 'Robassomero', 45.200741, 7.568580, 1),
(970, 2, '005092', 'Robella', 45.101433, 8.102752, 1),
(971, 4, '004185', 'Robilante', 44.294476, 7.511336, 1),
(972, 4, '004186', 'Roburent', 44.307762, 7.892317, 1),
(973, 6, '001221', 'Rocca Canavese', 45.310795, 7.577352, 1),
(974, 4, '004188', 'Rocca Cigliè', 44.446720, 7.950780, 1),
(975, 2, '005093', 'Rocca d''Arazzo', 44.872147, 8.284846, 1),
(976, 4, '004187', 'Roccabruna', 44.477127, 7.341948, 1),
(977, 1, '006146', 'Roccaforte Ligure', 44.678291, 9.028472, 1),
(978, 4, '004190', 'Roccaforte Mondovì', 44.318909, 7.745960, 1),
(979, 4, '004191', 'Roccasparvera', 44.341400, 7.441436, 1),
(980, 4, '004192', 'Roccavione', 44.315632, 7.483613, 1),
(981, 4, '004193', 'Rocchetta Belbo', 44.637035, 8.176407, 1),
(982, 1, '006148', 'Rocchetta Ligure', 44.707500, 9.051574, 1),
(983, 2, '005095', 'Rocchetta Palafea', 44.707672, 8.343749, 1),
(984, 4, '004195', 'Roddino', 44.573921, 8.019125, 1),
(985, 4, '004196', 'Rodello', 44.629536, 8.057981, 1),
(986, 6, '001222', 'Roletto', 44.925106, 7.330915, 1),
(987, 5, '003130', 'Romagnano Sesia', 45.632038, 8.389870, 1),
(988, 6, '001223', 'Romano Canavese', 45.390186, 7.865512, 1),
(989, 5, '003131', 'Romentino', 45.465019, 8.720170, 1),
(990, 3, '096053', 'Ronco Biellese', 45.579559, 8.091892, 1),
(991, 6, '001224', 'Ronco Canavese', 45.499687, 7.547327, 1),
(992, 6, '001225', 'Rondissone', 45.247814, 7.964222, 1),
(993, 8, '002118', 'Ronsecco', 45.253132, 8.278148, 1),
(994, 6, '001226', 'Rorà', 44.793129, 7.200170, 1),
(995, 3, '096055', 'Rosazza', 45.676769, 7.977447, 1),
(996, 1, '006149', 'Rosignano Monferrato', 45.081142, 8.399803, 1),
(997, 8, '002121', 'Rossa', 45.832962, 8.120643, 1),
(998, 4, '004197', 'Rossana', 44.544067, 7.432386, 1),
(999, 6, '001228', 'Rosta', 45.068909, 7.466259, 1),
(1000, 6, '001227', 'Roure', 45.002190, 7.128417, 1),
(1001, 6, '001229', 'Rubiana', 45.138832, 7.382674, 1),
(1002, 6, '001230', 'Rueglio', 45.468040, 7.756068, 1),
(1003, 4, '004198', 'Ruffia', 44.707668, 7.605167, 1),
(1004, 8, '002123', 'Sabbia', 45.856972, 8.236113, 1),
(1005, 3, '096056', 'Sagliano Micca', 45.622997, 8.044283, 1),
(1006, 3, '096057', 'Sala Biellese', 45.507915, 7.960226, 1),
(1007, 1, '006150', 'Sala Monferrato', 45.074440, 8.358900, 1),
(1008, 8, '002126', 'Salasco', 45.325901, 8.265174, 1),
(1009, 6, '001231', 'Salassa', 45.356743, 7.690315, 1),
(1010, 6, '001232', 'Salbertrand', 45.073250, 6.884179, 1),
(1011, 1, '006151', 'Sale', 44.981743, 8.810481, 1),
(1012, 4, '004199', 'Sale delle Langhe', 44.396259, 8.081259, 1),
(1013, 4, '004200', 'Sale San Giovanni', 44.400166, 8.079074, 1),
(1014, 6, '001233', 'Salerano Canavese', 45.458790, 7.851178, 1),
(1015, 8, '002127', 'Sali Vercellese', 45.310963, 8.330000, 1),
(1016, 4, '004202', 'Salmour', 44.578648, 7.793150, 1),
(1017, 8, '002128', 'Saluggia', 45.238609, 8.012204, 1),
(1018, 3, '096058', 'Salussola', 45.447834, 8.113444, 1),
(1019, 6, '001234', 'Salza di Pinerolo', 44.940987, 7.053634, 1),
(1020, 4, '004204', 'Sambuco', 44.337120, 7.078977, 1),
(1021, 6, '001235', 'Samone', 45.449390, 7.841741, 1),
(1022, 4, '004205', 'Sampeyre', 44.579311, 7.187803, 1),
(1023, 4, '004206', 'San Benedetto Belbo', 44.491280, 8.058907, 1),
(1024, 6, '001236', 'San Benigno Canavese', 45.228149, 7.786278, 1),
(1025, 7, '103061', 'San Bernardino Verbano', 45.956333, 8.518190, 1),
(1026, 6, '001237', 'San Carlo Canavese', 45.245647, 7.606889, 1),
(1027, 6, '001238', 'San Colombano Belmonte', 45.382988, 7.622981, 1),
(1028, 1, '006152', 'San Cristoforo', 44.693031, 8.749163, 1),
(1029, 2, '005097', 'San Damiano d''Asti', 44.834698, 8.065008, 1),
(1030, 4, '004207', 'San Damiano Macra', 44.488876, 7.257610, 1),
(1031, 6, '001239', 'San Didero', 45.135429, 7.214735, 1),
(1032, 6, '001240', 'San Francesco al Campo', 45.229504, 7.653266, 1),
(1033, 6, '001242', 'San Germano Chisone', 44.903149, 7.237833, 1),
(1034, 8, '002131', 'San Germano Vercellese', 45.351425, 8.248907, 1),
(1035, 8, '002035', 'San Giacomo Vercellese', 45.499241, 8.327815, 1),
(1036, 6, '001243', 'San Gillio', 45.143761, 7.537056, 1),
(1037, 2, '005098', 'San Giorgio Scarampi', 44.611485, 8.241976, 1),
(1038, 6, '001245', 'San Giorio di Susa', 45.129242, 7.179389, 1),
(1039, 2, '005099', 'San Martino Alfieri', 44.818218, 8.109126, 1),
(1040, 6, '001247', 'San Martino Canavese', 45.396111, 7.817815, 1),
(1041, 2, '005100', 'San Marzano Oliveto', 44.754288, 8.295921, 1),
(1042, 6, '001248', 'San Maurizio Canavese', 45.218147, 7.631741, 1),
(1043, 6, '001249', 'San Mauro Torinese', 45.101925, 7.765574, 1),
(1044, 4, '004210', 'San Michele Mondovì', 44.378151, 7.912200, 1),
(1045, 3, '096060', 'San Paolo Cervo', 45.651890, 8.010196, 1),
(1046, 2, '005101', 'San Paolo Solbrito', 44.951740, 7.971889, 1),
(1047, 5, '003135', 'San Pietro Mosezzo', 45.454540, 8.546740, 1),
(1048, 6, '001250', 'San Pietro Val Lemina', 44.907501, 7.312037, 1),
(1049, 6, '001251', 'San Ponso', 45.350754, 7.670923, 1),
(1050, 6, '001252', 'San Raffaele Cimena', 45.147667, 7.850481, 1),
(1051, 1, '006154', 'San Salvatore Monferrato', 44.995167, 8.567037, 1),
(1052, 1, '006155', 'San Sebastiano Curone', 44.787666, 9.065944, 1),
(1053, 6, '001253', 'San Sebastiano da Po', 45.168278, 7.958310, 1),
(1054, 6, '001254', 'San Secondo di Pinerolo', 44.867519, 7.299537, 1),
(1055, 3, '096059', 'Sandigliano', 45.519539, 8.078778, 1),
(1056, 4, '004208', 'Sanfrè', 44.750938, 7.803760, 1),
(1057, 4, '004209', 'Sanfront', 44.648148, 7.322204, 1),
(1058, 6, '001241', 'Sangano', 45.026978, 7.450549, 1),
(1059, 7, '103062', 'Santa Maria Maggiore', 44.785797, 8.922370, 1),
(1060, 1, '006156', 'Sant''Agata Fossili', 45.097755, 7.362225, 1),
(1061, 4, '004211', 'Sant''Albano Stura', 44.510021, 7.723440, 1),
(1062, 6, '001256', 'Sant''Antonino di Susa', 44.699703, 7.938444, 1),
(1063, 8, '002133', 'Santhià', 45.367371, 8.173760, 1),
(1064, 4, '004214', 'Santo Stefano Roero', 44.789078, 7.940827, 1),
(1065, 1, '006157', 'Sardigliano', 44.753807, 8.894354, 1),
(1066, 1, '006158', 'Sarezzano', 44.869881, 8.908236, 1),
(1067, 6, '001258', 'Sauze di Cesana', 45.027473, 6.859624, 1),
(1068, 4, '004216', 'Scagnello', 44.334175, 7.984727, 1),
(1069, 6, '001260', 'Scalenghe', 44.887325, 7.496781, 1),
(1070, 6, '001261', 'Scarmagno', 45.385471, 7.842377, 1),
(1071, 4, '004217', 'Scarnafigi', 44.679871, 7.567037, 1),
(1072, 6, '001262', 'Sciolze', 45.094223, 7.881574, 1),
(1073, 8, '002134', 'Scopa', 45.793907, 8.115167, 1),
(1074, 8, '002135', 'Scopello', 45.773563, 8.096034, 1),
(1075, 2, '005103', 'Scurzolengo', 44.965706, 8.278796, 1),
(1076, 3, '096061', 'Selve Marcone', 45.620220, 8.089061, 1),
(1077, 7, '103063', 'Seppiana', 46.059219, 8.217840, 1),
(1078, 2, '005104', 'Serole', 44.553894, 8.259703, 1),
(1079, 1, '006159', 'Serralunga di Crea', 45.101257, 8.283130, 1),
(1080, 4, '004219', 'Serravalle Langhe', 44.560062, 8.058432, 1),
(1081, 8, '002137', 'Serravalle Sesia', 45.687538, 8.309402, 1),
(1082, 2, '005105', 'Sessame', 44.671238, 8.337366, 1),
(1083, 2, '005106', 'Settime', 44.963184, 8.113816, 1),
(1084, 6, '001264', 'Settimo Rottaro', 45.409218, 7.993849, 1),
(1085, 6, '001265', 'Settimo Torinese', 45.137115, 7.770932, 1),
(1086, 6, '001266', 'Settimo Vittone', 45.550797, 7.833463, 1),
(1087, 5, '003138', 'Sillavengo', 45.521740, 8.442200, 1),
(1088, 1, '006162', 'Silvano d''Orba', 44.685902, 8.672054, 1),
(1089, 4, '004220', 'Sinio', 44.601173, 8.021752, 1),
(1090, 5, '003139', 'Sizzano', 45.577881, 8.437880, 1),
(1091, 1, '006163', 'Solero', 44.919388, 8.508778, 1),
(1092, 1, '006164', 'Solonghello', 45.130978, 8.282013, 1),
(1093, 4, '004221', 'Somano', 44.536427, 8.008907, 1),
(1094, 4, '004222', 'Sommariva del Bosco', 44.769871, 7.786407, 1),
(1095, 3, '096062', 'Soprana', 45.640480, 8.200000, 1),
(1096, 5, '003140', 'Soriso', 45.741428, 8.410630, 1),
(1097, 3, '096064', 'Sostegno', 45.653927, 8.270944, 1),
(1098, 5, '003141', 'Sozzago', 45.399521, 8.720920, 1),
(1099, 6, '001267', 'Sparone', 45.414852, 7.544537, 1),
(1100, 1, '006165', 'Spigno Monferrato', 44.543827, 8.333264, 1),
(1101, 1, '006166', 'Spineto Scrivia', 44.838097, 8.873375, 1),
(1102, 1, '006167', 'Stazzano', 44.728466, 8.871104, 1),
(1103, 6, '001268', 'Strambinello', 45.424000, 7.772073, 1),
(1104, 6, '001269', 'Strambino', 45.381630, 7.884807, 1),
(1105, 3, '096065', 'Strona', 45.619637, 8.169527, 1),
(1106, 8, '002142', 'Stroppiana', 45.231258, 8.455019, 1),
(1107, 4, '004224', 'Stroppo', 44.505840, 7.126723, 1),
(1108, 5, '003143', 'Suno', 45.634392, 8.543910, 1),
(1109, 4, '004225', 'Tarantasca', 44.494537, 7.544704, 1),
(1110, 1, '006170', 'Tassarolo', 44.729538, 8.772667, 1),
(1111, 3, '096066', 'Tavigliano', 45.630707, 8.056055, 1),
(1112, 5, '003144', 'Terdobbiate', 45.377499, 8.696430, 1),
(1113, 3, '096067', 'Ternengo', 45.590019, 8.114852, 1),
(1114, 1, '006171', 'Terruggia', 45.083298, 8.444389, 1),
(1115, 1, '006172', 'Terzo', 44.671272, 8.421140, 1),
(1116, 1, '006173', 'Ticineto', 45.097202, 8.552815, 1),
(1117, 2, '005108', 'Tigliole', 44.886623, 8.076740, 1),
(1118, 7, '103065', 'Toceno', 46.145630, 8.470167, 1),
(1119, 3, '096068', 'Tollegno', 45.593464, 8.051386, 1),
(1120, 2, '005109', 'Tonco', 45.024769, 8.190887, 1),
(1121, 2, '005110', 'Tonengo', 45.118778, 8.001926, 1),
(1122, 5, '003146', 'Tornaco', 45.358608, 8.717040, 1),
(1123, 6, '001273', 'Torrazza Piemonte', 45.216427, 7.977815, 1),
(1124, 3, '096069', 'Torrazzo', 45.499615, 7.955069, 1),
(1125, 4, '004226', 'Torre Bormida', 44.563141, 8.156924, 1),
(1126, 6, '001274', 'Torre Canavese', 45.393147, 7.760944, 1),
(1127, 4, '004227', 'Torre Mondov&#236;', 44.353931, 7.900800, 1),
(1128, 4, '004228', 'Torre San Giorgio', 44.736721, 7.529222, 1),
(1129, 4, '004229', 'Torresina', 44.434704, 8.037815, 1),
(1130, 6, '001276', 'Trana', 45.040001, 7.422981, 1),
(1131, 7, '103066', 'Trarego Viggiona', 46.033779, 8.663526, 1),
(1132, 7, '103067', 'Trasquera', 46.213684, 8.213098, 1),
(1133, 6, '001277', 'Trausella', 45.490829, 7.763151, 1),
(1134, 6, '001278', 'Traversella', 45.509556, 7.750648, 1),
(1135, 6, '001279', 'Traves', 45.268307, 7.430791, 1),
(1136, 5, '003149', 'Trecate', 45.432701, 8.738170, 1),
(1137, 4, '004230', 'Treiso', 44.689358, 8.086895, 1),
(1138, 1, '006175', 'Treville', 45.097813, 8.360621, 1),
(1139, 4, '004231', 'Trezzo Tinella', 44.677879, 8.107646, 1),
(1140, 8, '002147', 'Tricerro', 45.236721, 8.326407, 1),
(1141, 4, '004232', 'Trinit&#224;', 44.509541, 7.758130, 1),
(1142, 1, '006176', 'Trisobbio', 44.662666, 8.587370, 1),
(1143, 6, '001280', 'Trofarello', 44.984703, 7.746426, 1),
(1144, 7, '103068', 'Trontano', 46.122673, 8.337307, 1),
(1145, 8, '002150', 'Tronzano Vercellese', 45.342369, 8.174241, 1),
(1146, 6, '001281', 'Usseaux', 45.048611, 7.026697, 1),
(1147, 6, '001282', 'Usseglio', 45.232822, 7.217239, 1),
(1148, 2, '005111', 'Vaglio Serra', 44.797352, 8.340000, 1),
(1149, 6, '001283', 'Vaie', 45.101658, 7.289804, 1),
(1150, 6, '001284', 'Val della Torre', 45.156277, 7.446278, 1),
(1151, 3, '096071', 'Valdengo', 45.568150, 8.139556, 1),
(1152, 8, '002152', 'Valduggia', 45.729389, 8.331111, 1),
(1153, 1, '006177', 'Valenza', 45.012268, 8.644185, 1),
(1154, 6, '001285', 'Valgioie', 45.076099, 7.340726, 1),
(1155, 4, '004234', 'Valgrana', 44.412369, 7.381259, 1),
(1156, 3, '096072', 'Vallanzengo', 45.604057, 8.150844, 1),
(1157, 3, '096073', 'Valle Mosso', 45.634724, 8.143261, 1),
(1158, 3, '096074', 'Valle San Nicolao', 45.608147, 8.142204, 1),
(1159, 6, '001286', 'Vallo Torinese', 45.224537, 7.497518, 1),
(1160, 4, '004235', 'Valloriate', 44.338058, 7.372059, 1),
(1161, 1, '006178', 'Valmacca', 45.101257, 8.584241, 1),
(1162, 4, '004236', 'Valmala', 44.544086, 7.346442, 1),
(1163, 6, '001288', 'Valprato Soana', 45.522160, 7.550154, 1),
(1164, 7, '103069', 'Valstrona', 45.908798, 8.345824, 1),
(1165, 7, '103070', 'Vanzone con San Carlo', 45.979794, 8.112050, 1),
(1166, 5, '003153', 'Vaprio d''Agogna', 45.604698, 8.554700, 1),
(1167, 5, '003154', 'Varallo Pombia', 45.667809, 8.630000, 1),
(1168, 6, '001289', 'Varisella', 45.209621, 7.486139, 1),
(1169, 7, '103071', 'Varzo', 46.207668, 8.253611, 1),
(1170, 6, '001290', 'Vauda Canavese', 45.279202, 7.616355, 1),
(1171, 3, '096075', 'Veglio', 45.640648, 8.114246, 1),
(1172, 4, '004237', 'Venasca', 44.561970, 7.396196, 1),
(1173, 6, '001291', 'Venaus', 45.159554, 7.009222, 1),
(1174, 4, '004238', 'Verduno', 44.667206, 7.931889, 1),
(1175, 6, '001293', 'Verolengo', 45.191113, 7.969389, 1),
(1176, 3, '096076', 'Verrone', 45.504704, 8.120167, 1),
(1177, 6, '001294', 'Verrua Savoia', 45.157833, 8.093463, 1),
(1178, 5, '003157', 'Veruno', 45.689850, 8.529860, 1),
(1179, 4, '004240', 'Verzuolo', 44.601200, 7.483091, 1),
(1180, 2, '005113', 'Vesime', 44.636078, 8.228289, 1),
(1181, 5, '003158', 'Vespolate', 45.351429, 8.668910, 1),
(1182, 6, '001295', 'Vestign&#232;', 45.386719, 7.955940, 1),
(1183, 4, '004241', 'Vezza d''Alba', 44.763760, 8.009074, 1),
(1184, 2, '005114', 'Viale d''Asti', 45.001091, 8.050243, 1),
(1185, 6, '001296', 'Vialfr&#232;', 45.381222, 7.817680, 1),
(1186, 6, '001297', 'Vico Canavese', 45.495647, 7.777500, 1),
(1187, 5, '003159', 'Vicolungo', 45.478611, 8.463930, 1),
(1188, 6, '001298', 'Vidracco', 45.431740, 7.758611, 1),
(1189, 7, '103073', 'Viganella', 46.052261, 8.194879, 1),
(1190, 3, '096077', 'Vigliano Biellese', 45.565479, 8.105630, 1),
(1191, 2, '005116', 'Vigliano d''Asti', 44.834999, 8.230333, 1),
(1192, 1, '006180', 'Vignole Borbera', 44.707825, 8.890571, 1),
(1193, 4, '004243', 'Vignolo', 44.363297, 7.473926, 1),
(1194, 7, '103074', 'Vignone', 45.962204, 8.564852, 1),
(1195, 6, '001299', 'Vigone', 44.845482, 7.496111, 1),
(1196, 1, '006181', 'Viguzzolo', 44.905479, 8.923759, 1),
(1197, 3, '096078', 'Villa Del Bosco', 45.622017, 8.280742, 1),
(1198, 2, '005119', 'Villa San Secondo', 45.004894, 8.135027, 1),
(1199, 1, '006182', 'Villadeati', 45.072716, 8.169076, 1),
(1200, 7, '103075', 'Villadossola', 46.068035, 8.257140, 1),
(1201, 4, '004244', 'Villafalletto', 44.544868, 7.541259, 1),
(1202, 2, '005117', 'Villafranca d''Asti', 44.912979, 8.032833, 1),
(1203, 6, '001300', 'Villafranca Piemonte', 44.780018, 7.501574, 1),
(1204, 1, '006183', 'Villalvernia', 44.814522, 8.855315, 1),
(1205, 1, '006184', 'Villamiroglio', 45.135647, 8.172204, 1),
(1206, 3, '096079', 'Villanova Biellese', 45.482235, 8.192957, 1),
(1207, 6, '001301', 'Villanova Canavese', 45.244537, 7.553296, 1),
(1208, 4, '004245', 'Villanova Mondovì', 44.347980, 7.767520, 1),
(1209, 1, '006185', 'Villanova Monferrato', 45.182934, 8.479846, 1),
(1210, 4, '004246', 'Villanova Solaro', 44.730946, 7.575648, 1),
(1211, 6, '001303', 'Villar Dora', 45.115631, 7.384704, 1),
(1212, 6, '001305', 'Villar Focchiardo', 45.110313, 7.232764, 1),
(1213, 6, '001306', 'Villar Pellice', 44.809387, 7.153296, 1),
(1214, 6, '001307', 'Villar Perosa', 44.919319, 7.248118, 1),
(1215, 4, '004247', 'Villar San Costanzo', 44.484142, 7.381073, 1),
(1216, 6, '001302', 'Villarbasse', 45.046280, 7.469537, 1),
(1217, 8, '002163', 'Villarboit', 45.438461, 8.338444, 1),
(1218, 6, '001304', 'Villareggia', 45.311111, 7.977833, 1),
(1219, 1, '006186', 'Villaromagnano', 44.850632, 8.888926, 1),
(1220, 6, '001308', 'Villastellone', 44.921795, 7.744629, 1),
(1221, 8, '002164', 'Villata', 45.388760, 8.433759, 1),
(1222, 7, '103076', 'Villette', 46.131992, 8.534980, 1),
(1223, 4, '004248', 'Vinadio', 44.306572, 7.173685, 1),
(1224, 2, '005120', 'Vinchio', 44.812057, 8.322037, 1),
(1225, 5, '003164', 'Vinzaglio', 45.323910, 8.520330, 1),
(1226, 4, '004249', 'Viola', 44.291195, 7.965190, 1),
(1227, 6, '001310', 'Virle Piemonte', 44.865646, 7.571259, 1),
(1228, 6, '001311', 'Vische', 45.335201, 7.945944, 1),
(1229, 1, '006187', 'Visone', 44.662819, 8.501894, 1),
(1230, 6, '001312', 'Vistrorio', 45.442970, 7.768533, 1),
(1231, 8, '002166', 'Vocca', 45.832756, 8.195765, 1),
(1232, 1, '006189', 'Volpeglino', 44.893425, 8.959793, 1),
(1233, 6, '001314', 'Volpiano', 45.201466, 7.777262, 1),
(1234, 1, '006190', 'Voltaggio', 44.622852, 8.842683, 1),
(1235, 6, '001315', 'Volvera', 44.955963, 7.512500, 1),
(1236, 4, '004250', 'Vottignasco', 44.565166, 7.580333, 1),
(1237, 3, '096081', 'Zimone', 45.450333, 8.037204, 1),
(1238, 3, '096082', 'Zubiena', 45.492863, 7.995755, 1),
(1239, 3, '096083', 'Zumaglia', 45.594696, 8.089802, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_company`
--

DROP TABLE IF EXISTS `ipie_ipie_company`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_company` (
  `company_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `province_id` int(20) unsigned NOT NULL,
  `city_id` int(20) unsigned NOT NULL,
  `cap` varchar(5) NOT NULL,
  `address` varchar(256) NOT NULL,
  `ragione_sociale` varchar(45) NOT NULL,
  `piva` varchar(11) NOT NULL,
  `employees` mediumint(9) NOT NULL,
  `year_foundation` varchar(4) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `web` varchar(1024) DEFAULT NULL,
  `logo` varchar(1024) DEFAULT NULL,
  `area_eccellenza_it` text NOT NULL,
  `area_eccellenza_en` text NOT NULL,
  `collaborazioni` text,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `fk_company_province1` (`province_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dump dei dati per la tabella `ipie_ipie_company`
--

INSERT INTO `ipie_ipie_company` (`company_id`, `name`, `province_id`, `city_id`, `cap`, `address`, `ragione_sociale`, `piva`, `employees`, `year_foundation`, `email`, `web`, `logo`, `area_eccellenza_it`, `area_eccellenza_en`, `collaborazioni`, `published`, `user_id`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(1, 'nuova e libera', 2, 55, '', '', '', '', 100, '', '', NULL, NULL, '', '', NULL, 0, NULL, NULL, NULL, NULL, NULL),
(7, 'La Nuova Brevetti Inc.', 6, 326, '10100', 'Via Roma 64', 'spa', '23332423333', 100, '1995', 'cristiano.cucco@gmail.com', '', '52025de0daf4f_2fa67f482133f1c934235b73c2a03954_XL (1).jpg', 'hguyg', 'jhgj', '', 1, 831, '2013-08-07 13:15:07', 828, '2013-08-07 14:46:57', 828),
(8, 'New Acta', 1, 113, '', '', '', '', 0, '', '', NULL, NULL, '', '', NULL, 0, 832, '2013-08-05 15:53:17', 828, '2013-08-05 15:53:17', 828),
(12, 'Chupa Hard', 2, 342, '', '', '', '23332423333', 0, '', 'cristiano.cucco@gmail.com', NULL, NULL, '', '', NULL, 0, 836, '2013-08-09 13:58:03', 828, '2013-08-09 13:58:03', 828);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_draft`
--

DROP TABLE IF EXISTS `ipie_ipie_draft`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_draft` (
  `draft_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `province_id` int(20) unsigned NOT NULL,
  `city_id` int(20) unsigned NOT NULL,
  `cap` varchar(5) NOT NULL,
  `address` varchar(256) NOT NULL,
  `ragione_sociale` varchar(45) NOT NULL,
  `piva` varchar(11) NOT NULL,
  `employees` mediumint(9) NOT NULL,
  `year_foundation` varchar(4) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `web` varchar(1024) DEFAULT NULL,
  `logo` varchar(1024) DEFAULT NULL,
  `area_eccellenza_it` text NOT NULL,
  `area_eccellenza_en` text NOT NULL,
  `collaborazioni` text,
  `company_id` int(20) unsigned NOT NULL,
  `state` set('pending','editable') DEFAULT 'editable',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`draft_id`),
  KEY `fk_draft_company1` (`company_id`),
  KEY `fk_ipie_ipie_draft_ipie_ipie_city1` (`city_id`),
  KEY `fk_ipie_ipie_draft_ipie_ipie_province1` (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dump dei dati per la tabella `ipie_ipie_draft`
--

INSERT INTO `ipie_ipie_draft` (`draft_id`, `name`, `province_id`, `city_id`, `cap`, `address`, `ragione_sociale`, `piva`, `employees`, `year_foundation`, `email`, `web`, `logo`, `area_eccellenza_it`, `area_eccellenza_en`, `collaborazioni`, `company_id`, `state`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES
(3, 'New Acta', 1, 113, '', '', '', '', 0, '', '', NULL, NULL, '', '', NULL, 8, 'pending', '2013-08-05 15:53:17', 828, '2013-08-05 15:53:17', 828),
(37, 'La Nuova Brevetti Inculata', 6, 326, '10100', 'Via Roma 64', 'spa', '23332423333', 100, '1995', 'cristiano.cucco@gmail.com', '', '52025de0daf4f_2fa67f482133f1c934235b73c2a03954_XL (1).jpg', 'hguyg', 'jhgj', '', 7, 'editable', '2013-08-07 14:46:57', 828, '2013-08-08 13:45:30', 828),
(41, 'Chupa Hard', 2, 342, '', '', '', '23332423333', 0, '', 'cristiano.cucco@gmail.com', NULL, NULL, '', '', NULL, 12, 'editable', '2013-08-09 13:58:03', 828, '2013-08-09 13:58:03', 828);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_factor`
--

DROP TABLE IF EXISTS `ipie_ipie_factor`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_factor` (
  `factor_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(256) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`factor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `ipie_ipie_factor`
--

INSERT INTO `ipie_ipie_factor` (`factor_id`, `description`, `published`) VALUES
(1, 'bhbhhbhbhbhb', 0),
(2, 'jfjfkjfkjkfjkf', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_factor_company`
--

DROP TABLE IF EXISTS `ipie_ipie_factor_company`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_factor_company` (
  `factor_id` int(20) unsigned NOT NULL,
  `company_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`factor_id`,`company_id`),
  KEY `fk_factor_company_company1` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ipie_ipie_factor_company`
--

INSERT INTO `ipie_ipie_factor_company` (`factor_id`, `company_id`) VALUES
(2, 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_province`
--

DROP TABLE IF EXISTS `ipie_ipie_province`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_province` (
  `province_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `ipie_ipie_province`
--

INSERT INTO `ipie_ipie_province` (`province_id`, `name`, `code`) VALUES
(1, 'Alessandria', 'Al'),
(2, 'Asti', 'At'),
(3, 'Biella', 'Bi'),
(4, 'Cuneo', 'Cn'),
(5, 'Novara', 'No'),
(6, 'Torino', 'To'),
(7, 'Verbania', 'Vb'),
(8, 'Vercelli', 'Vc');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_registration`
--

DROP TABLE IF EXISTS `ipie_ipie_registration`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_registration` (
  `registration_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `piva` varchar(256) NOT NULL,
  `city_id` int(20) unsigned NOT NULL,
  `province_id` int(20) unsigned NOT NULL,
  `email` varchar(1024) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `state` set('pending','approved') NOT NULL DEFAULT 'pending',
  `company_id` int(20) unsigned DEFAULT NULL COMMENT 'da valorizzare quando si accetta la registrazione',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `fk_ipie_ipie_registration_ipie_ipie_province1` (`province_id`),
  KEY `fk_ipie_ipie_registration_ipie_ipie_city1` (`city_id`),
  KEY `fk_ipie_ipie_registration_ipie_ipie_company1` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `ipie_ipie_registration`
--

INSERT INTO `ipie_ipie_registration` (`registration_id`, `name`, `piva`, `city_id`, `province_id`, `email`, `username`, `password`, `state`, `company_id`, `created_on`) VALUES
(1, 'Acme', '233324233333333111', 55, 1, 'cristiano.cucco@gmail.com', 'cristiano', 'mypass', 'pending', NULL, '2013-08-05 00:00:00'),
(2, 'La Brevetti', '233456456333111', 113, 1, 'cristiano.cuccos@gmail.com', 'gris77', 'mypass2', 'approved', NULL, '2013-08-05 00:00:00'),
(3, 'New Acta', '233324233333333111', 113, 1, 'cristiano.cuccot@gmail.com', 'cristiano322', 'mypass', 'approved', NULL, '2013-08-05 00:00:00'),
(4, 'Chupa Hard', '23332423333', 342, 2, 'cristiano.cucco@gmail.com', 'grisoni77', 'mypass!99', 'approved', NULL, '2013-08-09 13:17:48'),
(5, 'asss', '23332423333', 64, 2, 'cristiano.cucco@gmail.com', 'grisoni77', 'aaa', 'pending', NULL, '2013-08-09 13:50:42');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_sector`
--

DROP TABLE IF EXISTS `ipie_ipie_sector`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_sector` (
  `sector_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`sector_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `ipie_ipie_sector`
--

INSERT INTO `ipie_ipie_sector` (`sector_id`, `name`) VALUES
(1, 'Agroalimentare'),
(2, 'Ambiente-Energia');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_subsector`
--

DROP TABLE IF EXISTS `ipie_ipie_subsector`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_subsector` (
  `subsector_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `sector_id` int(20) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`subsector_id`),
  KEY `fk_subsector_sector` (`sector_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `ipie_ipie_subsector`
--

INSERT INTO `ipie_ipie_subsector` (`subsector_id`, `sector_id`, `name`) VALUES
(1, 1, 'Coltivazioni agricole'),
(2, 1, 'Macchinari e servizi'),
(3, 2, 'Attrezzature e servizi'),
(4, 2, 'Energie Rinnovabili e Biocombustibili');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_subsector_company`
--

DROP TABLE IF EXISTS `ipie_ipie_subsector_company`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_subsector_company` (
  `subsector_id` int(20) unsigned NOT NULL,
  `company_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`subsector_id`,`company_id`),
  KEY `fk_subsector_company_company1` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ipie_ipie_subsector_company`
--

INSERT INTO `ipie_ipie_subsector_company` (`subsector_id`, `company_id`) VALUES
(1, 7),
(4, 7),
(3, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_ipie_subsector_draft`
--

DROP TABLE IF EXISTS `ipie_ipie_subsector_draft`;
CREATE TABLE IF NOT EXISTS `ipie_ipie_subsector_draft` (
  `subsector_id` int(20) unsigned NOT NULL,
  `draft_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`subsector_id`,`draft_id`),
  KEY `fk_subsector_draft_draft1` (`draft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ipie_ipie_subsector_draft`
--

INSERT INTO `ipie_ipie_subsector_draft` (`subsector_id`, `draft_id`) VALUES
(1, 37),
(4, 37);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_languages`
--

DROP TABLE IF EXISTS `ipie_languages`;
CREATE TABLE IF NOT EXISTS `ipie_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `ipie_languages`
--

INSERT INTO `ipie_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1),
(2, 'it-IT', 'Italiano (IT)', 'Italian (IT)', 'it', 'it', '', '', '', '', 1, 0, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_menu`
--

DROP TABLE IF EXISTS `ipie_menu`;
CREATE TABLE IF NOT EXISTS `ipie_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Dump dei dati per la tabella `ipie_menu`
--

INSERT INTO `ipie_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 51, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 41, 42, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 33, 34, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 35, 40, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 36, 37, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 38, 39, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 41, 42, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","orderby_pri":"","orderby_sec":"front","order_date":"","multi_column_order":"1","show_pagination":"2","show_pagination_results":"1","show_noauth":"","article-allow_ratings":"","article-allow_comments":"","show_feed_link":"1","feed_summary":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_readmore":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","show_page_heading":1,"page_title":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 1, '*', 0),
(102, 'main', 'Innovative Piemonte', 'innovative-piemonte', '', 'innovative-piemonte', 'index.php?option=com_ipie', 'component', 0, 1, 1, 10000, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 43, 44, 0, '', 1),
(103, 'main', 'COM_FALANG_MENU', 'com-falang-menu', '', 'com-falang-menu', 'index.php?option=com_falang', 'component', 0, 1, 1, 10001, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_falang/assets/images/icon-16-falang.png', 0, '', 45, 46, 0, '', 1),
(104, 'mainmenu', 'Aziende', 'aziende', '', 'aziende', 'index.php?option=com_ipie&view=companies', 'component', 1, 1, 1, 10000, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 47, 48, 0, '*', 0),
(105, 'mainmenu', 'Registrazione', 'registrazione', '', 'registrazione', 'index.php?option=com_ipie&view=registration&layout=edit', 'component', 1, 1, 1, 10000, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 49, 50, 0, '*', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_menu_types`
--

DROP TABLE IF EXISTS `ipie_menu_types`;
CREATE TABLE IF NOT EXISTS `ipie_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `ipie_menu_types`
--

INSERT INTO `ipie_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Menu Principale', 'Menu Principale del sito');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_messages`
--

DROP TABLE IF EXISTS `ipie_messages`;
CREATE TABLE IF NOT EXISTS `ipie_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_messages_cfg`
--

DROP TABLE IF EXISTS `ipie_messages_cfg`;
CREATE TABLE IF NOT EXISTS `ipie_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_modules`
--

DROP TABLE IF EXISTS `ipie_modules`;
CREATE TABLE IF NOT EXISTS `ipie_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dump dei dati per la tabella `ipie_modules`
--

INSERT INTO `ipie_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Menu Principale', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'I più letti', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Articoli recenti', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Utenti connessi', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Titolo', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Percorso', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 'Stato multilingua', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 'FaLang Language Switcher', '', '', 1, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_falang', 1, 1, '{"header_text":"","footer_text":"","dropdown":"0","image":"1","inline":"1","show_active":"1","full_name":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_modules_menu`
--

DROP TABLE IF EXISTS `ipie_modules_menu`;
CREATE TABLE IF NOT EXISTS `ipie_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ipie_modules_menu`
--

INSERT INTO `ipie_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_newsfeeds`
--

DROP TABLE IF EXISTS `ipie_newsfeeds`;
CREATE TABLE IF NOT EXISTS `ipie_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_overrider`
--

DROP TABLE IF EXISTS `ipie_overrider`;
CREATE TABLE IF NOT EXISTS `ipie_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_redirect_links`
--

DROP TABLE IF EXISTS `ipie_redirect_links`;
CREATE TABLE IF NOT EXISTS `ipie_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `ipie_redirect_links`
--

INSERT INTO `ipie_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://localhost/j2513/index.php/it/registrazione&layout=success', '', '', '', 1, 0, '2013-08-08 15:38:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_schemas`
--

DROP TABLE IF EXISTS `ipie_schemas`;
CREATE TABLE IF NOT EXISTS `ipie_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ipie_schemas`
--

INSERT INTO `ipie_schemas` (`extension_id`, `version_id`) VALUES
(700, '2.5.13'),
(10001, '1.2.0');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_session`
--

DROP TABLE IF EXISTS `ipie_session`;
CREATE TABLE IF NOT EXISTS `ipie_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ipie_session`
--

INSERT INTO `ipie_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('83cbb8fc1f21f6d231cf3c2da301476c', 1, 0, '1376056684', '__default|a:8:{s:22:"session.client.browser";s:101:"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36";s:15:"session.counter";i:710;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":6:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}s:8:"com_ipie";O:8:"stdClass":1:{s:4:"edit";O:8:"stdClass":3:{s:12:"registration";O:8:"stdClass":2:{s:2:"id";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;}s:4:"data";N;}s:7:"company";O:8:"stdClass":2:{s:2:"id";a:2:{i:0;i:6;i:1;i:7;}s:4:"data";N;}s:5:"draft";O:8:"stdClass":2:{s:2:"id";a:9:{i:0;i:14;i:1;i:15;i:2;i:16;i:3;i:17;i:4;i:19;i:5;i:20;i:6;i:21;i:7;i:26;i:8;i:37;}s:4:"data";N;}}}s:9:"com_users";O:8:"stdClass":1:{s:5:"users";O:8:"stdClass":1:{s:7:"default";O:8:"stdClass":1:{s:10:"limitstart";i:0;}}}s:9:"com_menus";O:8:"stdClass":2:{s:5:"items";O:8:"stdClass":2:{s:6:"filter";O:8:"stdClass":1:{s:8:"menutype";s:8:"mainmenu";}s:10:"limitstart";i:0;}s:4:"edit";O:8:"stdClass":1:{s:4:"item";O:8:"stdClass":3:{s:4:"data";N;s:4:"type";N;s:4:"link";N;}}}s:4:"item";O:8:"stdClass":1:{s:6:"filter";O:8:"stdClass":1:{s:8:"menutype";s:8:"mainmenu";}}}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:1;s:2:"id";s:3:"828";s:4:"name";s:10:"Super User";s:8:"username";s:5:"admin";s:5:"email";s:33:"cristiano.cucco@consulenti.csi.it";s:8:"password";s:65:"0cdc09adf8a4b41e598b2a21f47b9c34:FGtrkwJQvcpuTj1AJ0nTnbiJFdDHe5iM";s:14:"password_clear";s:0:"";s:8:"usertype";s:10:"deprecated";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2013-08-01 10:33:04";s:13:"lastvisitDate";s:19:"2013-08-05 08:26:17";s:10:"activation";s:1:"0";s:6:"params";s:0:"";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\0*\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"007c58728f34481ed7352754d0fb9913";s:19:"session.timer.start";i:1375692992;s:18:"session.timer.last";i:1376056683;s:17:"session.timer.now";i:1376056684;}', 828, 'admin', ''),
('cf5e4284946aa3fda8475e92ef485630', 1, 1, '1375692962', '__default|a:5:{s:22:"session.client.browser";s:101:"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36";s:15:"session.counter";i:1;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";N;s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"5c0919a10ca61299c738eb2f65ff02fc";}', 0, '', ''),
('f98eafef9aa456c45660abd9d9c25b86', 1, 1, '1375692962', '__default|a:5:{s:22:"session.client.browser";s:101:"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36";s:15:"session.counter";i:1;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";N;s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"b96eb6db0aa74ee5e93bedd14c16242a";}', 0, '', ''),
('j79en85biqhje71bopl1csjh05', 0, 1, '1376056243', '__default|a:8:{s:15:"session.counter";i:117;s:19:"session.timer.start";i:1375795120;s:18:"session.timer.last";i:1376056242;s:17:"session.timer.now";i:1376056242;s:22:"session.client.browser";s:101:"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":2:{s:8:"com_ipie";O:8:"stdClass":2:{s:4:"edit";O:8:"stdClass":1:{s:12:"registration";O:8:"stdClass":1:{s:4:"data";a:10:{s:15:"registration_id";i:0;s:4:"name";s:0:"";s:10:"company_id";s:0:"";s:4:"piva";s:0:"";s:11:"province_id";s:1:"1";s:7:"city_id";s:2:"96";s:5:"email";s:0:"";s:8:"username";s:12:"cristiano223";s:8:"password";s:6:"mypass";s:3:"tos";s:0:"";}}}s:12:"registration";O:8:"stdClass":1:{s:4:"data";a:10:{s:15:"registration_id";s:1:"0";s:4:"name";s:4:"asss";s:4:"piva";s:11:"23332423333";s:11:"province_id";s:1:"2";s:7:"city_id";s:2:"64";s:5:"email";s:25:"cristiano.cucco@gmail.com";s:8:"username";s:9:"grisoni77";s:8:"password";s:3:"aaa";s:9:"password2";s:3:"aaa";s:3:"tos";s:0:"";}}}s:9:"com_users";O:8:"stdClass":1:{s:12:"registration";O:8:"stdClass":1:{s:4:"data";N;}}}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"e436999545f1955e2ebfb133d6448c9d";}', 0, '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_template_styles`
--

DROP TABLE IF EXISTS `ipie_template_styles`;
CREATE TABLE IF NOT EXISTS `ipie_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `ipie_template_styles`
--

INSERT INTO `ipie_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '1', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","html5":"0"}');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_updates`
--

DROP TABLE IF EXISTS `ipie_updates`;
CREATE TABLE IF NOT EXISTS `ipie_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_update_categories`
--

DROP TABLE IF EXISTS `ipie_update_categories`;
CREATE TABLE IF NOT EXISTS `ipie_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_update_sites`
--

DROP TABLE IF EXISTS `ipie_update_sites`;
CREATE TABLE IF NOT EXISTS `ipie_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `ipie_update_sites`
--

INSERT INTO `ipie_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 0, 1375353202),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 0, 1375353268),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', 0, 1375353641),
(4, 'Falang Update Site', 'collection', 'http://update.faboba.com/falang/collection.xml', 0, 1375438653);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_update_sites_extensions`
--

DROP TABLE IF EXISTS `ipie_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `ipie_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dump dei dati per la tabella `ipie_update_sites_extensions`
--

INSERT INTO `ipie_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 602),
(4, 10004);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_usergroups`
--

DROP TABLE IF EXISTS `ipie_usergroups`;
CREATE TABLE IF NOT EXISTS `ipie_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `ipie_usergroups`
--

INSERT INTO `ipie_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_users`
--

DROP TABLE IF EXISTS `ipie_users`;
CREATE TABLE IF NOT EXISTS `ipie_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=837 ;

--
-- Dump dei dati per la tabella `ipie_users`
--

INSERT INTO `ipie_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(828, 'Super User', 'admin', 'cristiano.cucco@consulenti.csi.it', '0cdc09adf8a4b41e598b2a21f47b9c34:FGtrkwJQvcpuTj1AJ0nTnbiJFdDHe5iM', 'deprecated', 0, 1, '2013-08-01 10:33:04', '2013-08-05 08:56:57', '0', '', '0000-00-00 00:00:00', 0),
(831, 'La Brevetti', 'gris77', 'cristiano.cuccos@gmail.com', 'debcb03ba4e62e47beb74e9b2bda90a5:earplvRXPtuqPj5qoCnJVasTEpmtNszX', '', 0, 0, '2013-08-05 15:32:20', '0000-00-00 00:00:00', '', '{}', '0000-00-00 00:00:00', 0),
(832, 'New Acta', 'cristiano322', 'cristiano.cuccot@gmail.com', 'd6a6871046dce703e7d5e6b8c45b4874:eLdvJlZzt51i1dyIFXu0vimDtl1kX24I', '', 0, 0, '2013-08-05 15:53:17', '0000-00-00 00:00:00', '', '{}', '0000-00-00 00:00:00', 0),
(836, 'Chupa Hard', 'grisoni77', 'cristiano.cucco@gmail.com', '229a34c2c6add20e5e69847cf7036638:jzVOpLgKdSdD7rg53rbkqzSUxfCB0nHr', '', 0, 0, '2013-08-09 13:58:03', '0000-00-00 00:00:00', '', '{}', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_user_notes`
--

DROP TABLE IF EXISTS `ipie_user_notes`;
CREATE TABLE IF NOT EXISTS `ipie_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_user_profiles`
--

DROP TABLE IF EXISTS `ipie_user_profiles`;
CREATE TABLE IF NOT EXISTS `ipie_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_user_usergroup_map`
--

DROP TABLE IF EXISTS `ipie_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `ipie_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ipie_user_usergroup_map`
--

INSERT INTO `ipie_user_usergroup_map` (`user_id`, `group_id`) VALUES
(828, 8),
(831, 1),
(831, 2),
(832, 1),
(832, 2),
(836, 1),
(836, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_viewlevels`
--

DROP TABLE IF EXISTS `ipie_viewlevels`;
CREATE TABLE IF NOT EXISTS `ipie_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `ipie_viewlevels`
--

INSERT INTO `ipie_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]');

-- --------------------------------------------------------

--
-- Struttura della tabella `ipie_weblinks`
--

DROP TABLE IF EXISTS `ipie_weblinks`;
CREATE TABLE IF NOT EXISTS `ipie_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ipie_ipie_city`
--
ALTER TABLE `ipie_ipie_city`
  ADD CONSTRAINT `ipie_ipie_city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `ipie_ipie_province` (`province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `ipie_ipie_company`
--
ALTER TABLE `ipie_ipie_company`
  ADD CONSTRAINT `ipie_ipie_company_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `ipie_ipie_province` (`province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ipie_ipie_company_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `ipie_ipie_city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `ipie_ipie_draft`
--
ALTER TABLE `ipie_ipie_draft`
  ADD CONSTRAINT `fk_draft_company1` FOREIGN KEY (`company_id`) REFERENCES `ipie_ipie_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ipie_ipie_draft_ipie_ipie_city1` FOREIGN KEY (`city_id`) REFERENCES `ipie_ipie_city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ipie_ipie_draft_ipie_ipie_province1` FOREIGN KEY (`province_id`) REFERENCES `ipie_ipie_province` (`province_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ipie_ipie_factor_company`
--
ALTER TABLE `ipie_ipie_factor_company`
  ADD CONSTRAINT `fk_factor_company_company1` FOREIGN KEY (`company_id`) REFERENCES `ipie_ipie_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_factor_company_factor1` FOREIGN KEY (`factor_id`) REFERENCES `ipie_ipie_factor` (`factor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ipie_ipie_registration`
--
ALTER TABLE `ipie_ipie_registration`
  ADD CONSTRAINT `fk_ipie_ipie_registration_ipie_ipie_city1` FOREIGN KEY (`city_id`) REFERENCES `ipie_ipie_city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ipie_ipie_registration_ipie_ipie_company1` FOREIGN KEY (`company_id`) REFERENCES `ipie_ipie_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ipie_ipie_registration_ipie_ipie_province1` FOREIGN KEY (`province_id`) REFERENCES `ipie_ipie_province` (`province_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ipie_ipie_subsector`
--
ALTER TABLE `ipie_ipie_subsector`
  ADD CONSTRAINT `fk_subsector_sector` FOREIGN KEY (`sector_id`) REFERENCES `ipie_ipie_sector` (`sector_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ipie_ipie_subsector_company`
--
ALTER TABLE `ipie_ipie_subsector_company`
  ADD CONSTRAINT `fk_subsector_company_company1` FOREIGN KEY (`company_id`) REFERENCES `ipie_ipie_company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subsector_company_subsector1` FOREIGN KEY (`subsector_id`) REFERENCES `ipie_ipie_subsector` (`subsector_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ipie_ipie_subsector_draft`
--
ALTER TABLE `ipie_ipie_subsector_draft`
  ADD CONSTRAINT `fk_subsector_draft_draft1` FOREIGN KEY (`draft_id`) REFERENCES `ipie_ipie_draft` (`draft_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subsector_draft_subsector1` FOREIGN KEY (`subsector_id`) REFERENCES `ipie_ipie_subsector` (`subsector_id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
