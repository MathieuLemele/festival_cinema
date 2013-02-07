-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Client: smysql
-- Généré le: Jeu 07 Février 2013 à 09:48
-- Version du serveur: 5.5.24-4-log
-- Version de PHP: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `WPlemele`
--

-- --------------------------------------------------------

--
-- Structure de la table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Monsieur WordPress', '', 'http://wordpress.org/', '', '2013-01-14 15:52:48', '2013-01-14 15:52:48', 'Bonjour, ceci est un commentaire.\nPour supprimer un commentaire, connectez-vous et affichez les commentaires de cet article. Vous pourrez alors les modifier ou les supprimer.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_custom_field_options`
--

CREATE TABLE IF NOT EXISTS `wp_mf_custom_field_options` (
  `custom_field_id` int(11) NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `default_option` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_custom_field_properties`
--

CREATE TABLE IF NOT EXISTS `wp_mf_custom_field_properties` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `properties` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_module_groups`
--

CREATE TABLE IF NOT EXISTS `wp_mf_module_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duplicate` tinyint(1) NOT NULL,
  `expanded` tinyint(4) DEFAULT NULL,
  `at_right` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_panel_category`
--

CREATE TABLE IF NOT EXISTS `wp_mf_panel_category` (
  `panel_id` int(11) NOT NULL,
  `cat_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`panel_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_panel_custom_field`
--

CREATE TABLE IF NOT EXISTS `wp_mf_panel_custom_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `display_name` enum('true','false') COLLATE utf8_unicode_ci NOT NULL,
  `display_description` enum('true','false') COLLATE utf8_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `CSS` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required_field` tinyint(4) DEFAULT NULL,
  `duplicate` tinyint(1) NOT NULL,
  `help_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_panel_standard_field`
--

CREATE TABLE IF NOT EXISTS `wp_mf_panel_standard_field` (
  `panel_id` int(11) NOT NULL,
  `standard_field_id` int(11) NOT NULL,
  PRIMARY KEY (`panel_id`,`standard_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_posttypes_taxonomies`
--

CREATE TABLE IF NOT EXISTS `wp_mf_posttypes_taxonomies` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT 'posttype',
  `name` tinytext NOT NULL,
  `description` text NOT NULL,
  `settings` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_post_meta`
--

CREATE TABLE IF NOT EXISTS `wp_mf_post_meta` (
  `id` int(11) NOT NULL,
  `group_count` int(11) NOT NULL,
  `field_count` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `field_name` text COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_write_panels`
--

CREATE TABLE IF NOT EXISTS `wp_mf_write_panels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `single` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `capability_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expanded` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=302 ;

--
-- Contenu de la table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/~lemele/festival_cinema', 'yes'),
(2, 'blogname', 'Festival LGBT', 'yes'),
(3, 'blogdescription', 'Festival de films gays et lesbiens', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'mathieu.lemele@gmail.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'j F Y', 'yes'),
(23, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(24, 'links_updated_date_format', 'j F Y, G \\h i \\m\\i\\n', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '0', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:1:{i:0;s:21:"magic-fields/Main.php";}', 'yes'),
(36, 'home', 'http://localhost/~lemele/festival_cinema', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '1', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', '', 'no'),
(44, 'template', 'twentytwelve', 'yes'),
(45, 'stylesheet', 'festival', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '0', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '22441', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'page', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '0', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '0', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:3:{i:3;a:3:{s:5:"title";s:9:"Programme";s:4:"text";s:579:"Vendredi 24 septembre : 20h00\r\nSoirée d’ouverture : séance de courts métrages\r\nRencontre-débat avec un réalisateur.\r\n\r\nSamedi 25 septembre : 19h30\r\nDocumentaire :\r\nIt’s elementary, talking about gays issues in school\r\n(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nRencontre-débat avec le Groupe Action Gay & Lesbien – Loiret\r\nsur les interventions en milieu scolaire.\r\n\r\nSamedi 25 septembre : 21h45\r\nFiction : Ander\r\n\r\nDimanche 26 septembre : 16h00\r\nFiction : El niño pez\r\n\r\nDimanche 26 septembre : 18h00\r\nFiction : I can’t think straight\r\n";s:6:"filter";b:1;}i:4;a:3:{s:5:"title";s:9:"Programme";s:4:"text";s:925:"<div id="programme">\r\n	<p>\r\n		<h3 id="title_prog1">Vendredi 24 septembre : 20h00</h3>\r\n		Soirée d’ouverture : <a href="?cat=3">séance de courts métrages</a>\r\n		Rencontre-débat avec un réalisateur.\r\n	</p>\r\n	<p>\r\n		<h3 id="title_prog2">Samedi 25 septembre : 19h30</h3>\r\n		Documentaire :\r\n		<a href="?p=37">It’s elementary, talking about gays issues in school</a>\r\n		(C’est élémentaire - Parler de l’homosexualité à l’école)\r\n		Rencontre-débat avec le Groupe Action Gay & Lesbien – Loiret\r\n		sur les interventions en milieu scolaire.\r\n	</p>\r\n	<p>\r\n		<h3 id="title_prog3">Samedi 25 septembre : 21h45</h3>\r\n		Fiction : <a href="?p=40">Ander</a>\r\n	</p>\r\n	<p>\r\n		<h3 id="title_prog4">Dimanche 26 septembre : 16h00</h3>\r\n		Fiction : <a href="?p=43">El niño pez</a>\r\n	</p>\r\n	<p>\r\n		<h3 id="title_prog5">Dimanche 26 septembre : 18h00</h3>\r\n		Fiction : <a href="?p=47">I can’t think straight</a>\r\n	</p>\r\n</div>";s:6:"filter";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:0:{}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '2', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22441', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:1:{i:0;s:6:"text-4";}s:9:"sidebar-2";a:1:{i:0;s:6:"text-3";}s:9:"sidebar-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:4:{i:1360244759;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1360252390;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1360252462;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:0:{}s:15:"version_checked";s:3:"3.5";s:12:"last_checked";i:1360224102;}', 'yes'),
(102, '_site_transient_update_plugins', 'O:8:"stdClass":1:{s:12:"last_checked";i:1360224133;}', 'yes'),
(105, '_site_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:1360224163;}', 'yes'),
(106, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:40:"http://localhost/~lemele/festival_cinema";s:4:"link";s:116:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/~lemele/festival_cinema/";s:3:"url";s:149:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/~lemele/festival_cinema/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:35:"http://www.wordpress-fr.net/planet/";s:3:"url";s:55:"http://feeds2.feedburner.com/WordpressFrancophonePlanet";s:5:"title";s:14:"Blog WordPress";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:35:"http://www.wordpress-fr.net/planet/";s:3:"url";s:55:"http://feeds2.feedburner.com/WordpressFrancophonePlanet";s:5:"title";s:46:"Autres actualités de WordPress (en français)";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(107, 'can_compress_scripts', '0', 'yes'),
(121, 'recently_activated', 'a:1:{s:49:"smart-slideshow-widget/smart-slideshow-widget.php";i:1358347686;}', 'yes'),
(122, 'mf_custom_write_panel', 's:250:"a:8:{s:13:"condense-menu";i:0;s:25:"hide-non-standart-content";i:1;s:15:"hide-write-post";i:0;s:15:"hide-write-page";i:0;s:18:"hide-visual-editor";i:0;s:19:"prompt-editing-post";i:0;s:14:"assign-to-role";i:0;s:26:"default-custom-write-panel";s:0:"";}";', 'yes'),
(123, 'RC_CWP_BLOG_DB_VERSION', '8', 'yes'),
(124, 'RC_CWP_DB_VERSION', '8', 'yes'),
(125, 'MAGIC_FIELDS_fist_time', '1', 'yes'),
(126, 'theme_mods_twentytwelve', 'a:8:{s:16:"header_textcolor";s:6:"1c1c1c";s:16:"background_color";s:6:"0c0c0c";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:4;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1358782163;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:1:{i:0;s:6:"text-4";}s:9:"sidebar-2";a:1:{i:0;s:6:"text-3";}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(127, 'current_theme', 'Festival', 'yes'),
(128, 'theme_mods_twentyeleven', 'a:8:{i:0;b:0;s:16:"header_textcolor";s:6:"dd3333";s:16:"background_color";s:6:"020202";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1358343571;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:9:"sidebar-4";N;s:9:"sidebar-5";N;}}}', 'yes'),
(129, 'theme_switched', '', 'yes'),
(130, 'twentyeleven_theme_options', 'a:3:{s:12:"color_scheme";s:4:"dark";s:10:"link_color";s:7:"#e81bdd";s:12:"theme_layout";s:15:"content-sidebar";}', 'yes'),
(134, 'category_children', 'a:0:{}', 'yes'),
(174, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(175, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(208, 'theme_mods_festival', 'a:8:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:5;}s:16:"background_color";s:6:"e939f9";s:16:"header_textcolor";s:3:"444";s:12:"header_image";s:87:"http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/cropped-baniere.png";s:17:"header_image_data";O:8:"stdClass":5:{s:13:"attachment_id";i:121;s:3:"url";s:87:"http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/cropped-baniere.png";s:13:"thumbnail_url";s:87:"http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/cropped-baniere.png";s:6:"height";i:416;s:5:"width";i:800;}s:16:"background_image";s:82:"http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/fond_rouge.jpg";s:22:"background_image_thumb";s:90:"http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/fond_rouge-150x150.jpg";}', 'yes'),
(254, '_site_transient_timeout_wporg_theme_feature_list', '1359395641', 'yes'),
(255, '_site_transient_wporg_theme_feature_list', 'a:0:{}', 'yes'),
(290, '_site_transient_timeout_theme_roots', '1360225963', 'yes'),
(291, '_site_transient_theme_roots', 'a:4:{s:8:"festival";s:7:"/themes";s:12:"twentyeleven";s:7:"/themes";s:9:"twentyten";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(292, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1360267936', 'no'),
(293, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p>', 'no'),
(294, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1360267937', 'no'),
(295, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p></div>', 'no'),
(296, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1360267937', 'no'),
(297, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p></div>', 'no'),
(298, '_transient_timeout_plugin_slugs', '1360311148', 'no'),
(299, '_transient_plugin_slugs', 'a:4:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:21:"magic-fields/Main.php";i:3;s:49:"smart-slideshow-widget/smart-slideshow-widget.php";}', 'no'),
(300, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1360267948', 'no'),
(301, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=335 ;

--
-- Contenu de la table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_wp_trash_meta_status', 'publish'),
(3, 1, '_wp_trash_meta_time', '1358343953'),
(4, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(5, 5, '_edit_last', '1'),
(6, 5, '_edit_lock', '1359538908:1'),
(9, 8, '_wp_attached_file', '2013/01/EN_COLO.jpg'),
(10, 8, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:670;s:4:"file";s:19:"2013/01/EN_COLO.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"EN_COLO-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"EN_COLO-300x196.jpg";s:5:"width";i:300;s:6:"height";i:196;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"EN_COLO-624x408.jpg";s:5:"width";i:624;s:6:"height";i:408;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(11, 5, '_thumbnail_id', '8'),
(14, 10, '_edit_last', '1'),
(15, 10, '_edit_lock', '1359538957:1'),
(16, 11, '_wp_attached_file', '2013/01/PAULINE_1.jpg'),
(17, 11, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:21:"2013/01/PAULINE_1.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"PAULINE_1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"PAULINE_1-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:21:"PAULINE_1-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(18, 10, '_thumbnail_id', '11'),
(23, 14, '_edit_last', '1'),
(24, 14, '_edit_lock', '1359538630:1'),
(25, 15, '_wp_attached_file', '2013/01/OMAR_.jpg'),
(26, 15, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:17:"2013/01/OMAR_.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"OMAR_-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"OMAR_-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:17:"OMAR_-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(27, 14, '_thumbnail_id', '15'),
(30, 17, '_edit_last', '1'),
(31, 17, '_edit_lock', '1359538565:1'),
(32, 18, '_wp_attached_file', '2013/01/Odile_.jpg'),
(33, 18, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:693;s:4:"file";s:18:"2013/01/Odile_.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"Odile_-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"Odile_-300x203.jpg";s:5:"width";i:300;s:6:"height";i:203;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"Odile_-624x422.jpg";s:5:"width";i:624;s:6:"height";i:422;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(34, 17, '_thumbnail_id', '18'),
(37, 20, '_edit_last', '1'),
(38, 20, '_edit_lock', '1359538894:1'),
(39, 21, '_wp_attached_file', '2013/01/Os_sapatos_de_Aristeu.jpg'),
(40, 21, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:33:"2013/01/Os_sapatos_de_Aristeu.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"Os_sapatos_de_Aristeu-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:33:"Os_sapatos_de_Aristeu-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:33:"Os_sapatos_de_Aristeu-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(41, 20, '_thumbnail_id', '21'),
(44, 23, '_edit_last', '1'),
(45, 23, '_edit_lock', '1359538860:1'),
(46, 24, '_wp_attached_file', '2013/01/COWBOY_FOREVER.jpg'),
(47, 24, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:26:"2013/01/COWBOY_FOREVER.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"COWBOY_FOREVER-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"COWBOY_FOREVER-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:26:"COWBOY_FOREVER-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(48, 23, '_thumbnail_id', '24'),
(51, 26, '_edit_last', '1'),
(52, 26, '_edit_lock', '1359538853:1'),
(53, 27, '_wp_attached_file', '2013/01/American-boy.png'),
(54, 27, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:901;s:6:"height";i:601;s:4:"file";s:24:"2013/01/American-boy.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"American-boy-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:24:"American-boy-300x200.png";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:24:"American-boy-624x416.png";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(55, 26, '_thumbnail_id', '27'),
(74, 37, '_edit_last', '1'),
(75, 37, '_edit_lock', '1359538845:1'),
(76, 38, '_wp_attached_file', '2013/01/37_it_s_still_elementary.jpg'),
(77, 38, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:584;s:4:"file";s:36:"2013/01/37_it_s_still_elementary.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:36:"37_it_s_still_elementary-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:36:"37_it_s_still_elementary-300x171.jpg";s:5:"width";i:300;s:6:"height";i:171;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"37_it_s_still_elementary-624x355.jpg";s:5:"width";i:624;s:6:"height";i:355;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(78, 37, '_thumbnail_id', '38'),
(81, 40, '_edit_last', '1'),
(82, 40, '_edit_lock', '1359538825:1'),
(83, 41, '_wp_attached_file', '2013/01/ANDER1.jpg'),
(84, 41, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:576;s:4:"file";s:18:"2013/01/ANDER1.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"ANDER1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"ANDER1-300x168.jpg";s:5:"width";i:300;s:6:"height";i:168;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"ANDER1-624x351.jpg";s:5:"width";i:624;s:6:"height";i:351;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(85, 40, '_thumbnail_id', '41'),
(88, 43, '_edit_last', '1'),
(89, 43, '_edit_lock', '1359538808:1'),
(90, 44, '_wp_attached_file', '2013/01/EL_NINO_PEZ__2.jpg'),
(91, 44, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:519;s:6:"height";i:768;s:4:"file";s:26:"2013/01/EL_NINO_PEZ__2.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"EL_NINO_PEZ__2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"EL_NINO_PEZ__2-202x300.jpg";s:5:"width";i:202;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(92, 43, '_thumbnail_id', '44'),
(95, 47, '_edit_last', '1'),
(96, 47, '_edit_lock', '1359538789:1'),
(97, 48, '_wp_attached_file', '2013/01/I_cant_think_straight_2.jpg'),
(98, 48, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:683;s:4:"file";s:35:"2013/01/I_cant_think_straight_2.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"I_cant_think_straight_2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"I_cant_think_straight_2-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:35:"I_cant_think_straight_2-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(99, 47, '_thumbnail_id', '48'),
(102, 2, '_edit_lock', '1358782475:1'),
(103, 2, '_edit_last', '1'),
(104, 52, '_edit_last', '1'),
(105, 52, '_wp_page_template', 'default'),
(106, 52, '_edit_lock', '1358346378:1'),
(107, 52, '_wp_trash_meta_status', 'publish'),
(108, 52, '_wp_trash_meta_time', '1358346529'),
(109, 54, '_edit_last', '1'),
(110, 54, '_edit_lock', '1358781376:1'),
(111, 54, '_wp_page_template', 'default'),
(112, 56, '_edit_last', '1'),
(113, 56, '_edit_lock', '1358781357:1'),
(114, 56, '_wp_page_template', 'default'),
(115, 58, '_edit_last', '1'),
(116, 58, '_edit_lock', '1358781381:1'),
(117, 58, '_wp_page_template', 'default'),
(172, 66, '_edit_last', '1'),
(173, 66, '_edit_lock', '1358781394:1'),
(174, 66, '_wp_page_template', 'default'),
(175, 47, 'Pays', 'Grande Bretagne'),
(176, 47, 'Année', '2007'),
(177, 47, 'Durée', '01h20'),
(178, 47, 'Genre', 'Comédie romantique'),
(179, 47, 'Version', 'VOSTF'),
(180, 47, 'Interprètes', 'Lisa Ray, Sheetal Sheth, Antonia Frering'),
(183, 47, 'Réalisateur', 'Shamim Sarif'),
(186, 43, 'Année', '2008'),
(187, 43, 'Durée', '01h36'),
(188, 43, 'Version', 'VOST'),
(189, 43, 'Pays', 'Argentine'),
(190, 43, 'Interprètes', 'Inés Efron, Mariela Vitale, Pep Munne'),
(191, 43, 'Réalisateur', 'Lucía Puenzo'),
(194, 40, 'Année', '2009'),
(195, 40, 'Réalisateur', 'Roberto Castón'),
(196, 40, 'Pays', 'Espagne'),
(197, 40, 'Durée', '02h08'),
(198, 40, 'Version', 'VOST'),
(199, 40, 'Interprètes', 'Josean Bengoetxea, Eriz Alberdi, Christian Esquive'),
(204, 37, 'Réalisateur', 'Debra Chasnoff'),
(205, 37, 'Année', '1996'),
(206, 37, 'Pays', 'Etats-Unis'),
(207, 37, 'Durée', '01h20'),
(208, 37, 'Genre', 'Documentaire'),
(211, 26, 'Année', '2008'),
(212, 26, 'Durée', '4min'),
(213, 26, 'Réalisateur', 'Patricia & Colette'),
(214, 26, 'Pays', 'France'),
(217, 23, 'Année', '2006'),
(218, 23, 'Durée', '26 min'),
(219, 23, 'Pays', 'France'),
(220, 23, 'Réalisateur', 'Jean Baptiste Erreca'),
(223, 20, 'Réalisateur', 'René Guerra Luiz'),
(224, 20, 'Année', '2008'),
(225, 20, 'Durée', '17 minutes'),
(226, 20, 'Version', 'VOST'),
(227, 20, 'Pays', 'Brésil'),
(232, 17, 'Année', '2006'),
(233, 17, 'Réalisateur', 'Bénédicte Delgéhier'),
(234, 17, 'Durée', '10 minutes'),
(235, 17, 'Pays', 'France'),
(238, 14, 'Réalisateur', 'Sébastien Gabriel'),
(239, 14, 'Année', '2009'),
(240, 14, 'Durée', '9 minutes'),
(241, 14, 'Pays', 'France'),
(244, 10, 'Durée', '7 minutes'),
(245, 10, 'Réalisateur', 'Céline Sciamma'),
(246, 10, 'Pays', 'France'),
(247, 10, 'Année', '2009'),
(252, 5, 'Année', '2009'),
(253, 5, 'Durée', '8 minutes'),
(254, 5, 'Réalisateur', 'Pascal-Alex Vincent'),
(255, 5, 'Pays', 'France'),
(258, 66, '_wp_trash_meta_status', 'publish'),
(259, 66, '_wp_trash_meta_time', '1358781514'),
(266, 121, '_wp_attached_file', '2013/01/cropped-baniere.png'),
(267, 121, '_wp_attachment_context', 'custom-header'),
(268, 121, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:416;s:4:"file";s:27:"2013/01/cropped-baniere.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"cropped-baniere-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:27:"cropped-baniere-300x156.png";s:5:"width";i:300;s:6:"height";i:156;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:27:"cropped-baniere-624x324.png";s:5:"width";i:624;s:6:"height";i:324;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(269, 121, '_wp_attachment_is_custom_header', 'festival'),
(270, 122, '_menu_item_type', 'post_type'),
(271, 122, '_menu_item_menu_item_parent', '0'),
(272, 122, '_menu_item_object_id', '56'),
(273, 122, '_menu_item_object', 'page'),
(274, 122, '_menu_item_target', ''),
(275, 122, '_menu_item_classes', 'a:1:{i:0;s:7:"fg-vert";}'),
(276, 122, '_menu_item_xfn', ''),
(277, 122, '_menu_item_url', ''),
(279, 123, '_menu_item_type', 'post_type'),
(280, 123, '_menu_item_menu_item_parent', '0'),
(281, 123, '_menu_item_object_id', '54'),
(282, 123, '_menu_item_object', 'page'),
(283, 123, '_menu_item_target', ''),
(284, 123, '_menu_item_classes', 'a:1:{i:0;s:7:"fg-bleu";}'),
(285, 123, '_menu_item_xfn', ''),
(286, 123, '_menu_item_url', ''),
(288, 124, '_menu_item_type', 'post_type'),
(289, 124, '_menu_item_menu_item_parent', '0'),
(290, 124, '_menu_item_object_id', '2'),
(291, 124, '_menu_item_object', 'page'),
(292, 124, '_menu_item_target', ''),
(293, 124, '_menu_item_classes', 'a:1:{i:0;s:8:"fg-rouge";}'),
(294, 124, '_menu_item_xfn', ''),
(295, 124, '_menu_item_url', ''),
(297, 125, '_menu_item_type', 'taxonomy'),
(298, 125, '_menu_item_menu_item_parent', '0'),
(299, 125, '_menu_item_object_id', '3'),
(300, 125, '_menu_item_object', 'category'),
(301, 125, '_menu_item_target', ''),
(302, 125, '_menu_item_classes', 'a:1:{i:0;s:9:"fg-orange";}'),
(303, 125, '_menu_item_xfn', ''),
(304, 125, '_menu_item_url', ''),
(306, 126, '_menu_item_type', 'taxonomy'),
(307, 126, '_menu_item_menu_item_parent', '0'),
(308, 126, '_menu_item_object_id', '2'),
(309, 126, '_menu_item_object', 'category'),
(310, 126, '_menu_item_target', ''),
(311, 126, '_menu_item_classes', 'a:1:{i:0;s:8:"fg-jaune";}'),
(312, 126, '_menu_item_xfn', ''),
(313, 126, '_menu_item_url', ''),
(315, 127, '_menu_item_type', 'post_type'),
(316, 127, '_menu_item_menu_item_parent', '0'),
(317, 127, '_menu_item_object_id', '58'),
(318, 127, '_menu_item_object', 'page'),
(319, 127, '_menu_item_target', ''),
(320, 127, '_menu_item_classes', 'a:1:{i:0;s:9:"fg-violet";}'),
(321, 127, '_menu_item_xfn', ''),
(322, 127, '_menu_item_url', ''),
(331, 130, '_wp_attached_file', '2013/01/fond_rouge.jpg'),
(332, 130, '_wp_attachment_context', 'custom-background'),
(333, 130, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:300;s:4:"file";s:22:"2013/01/fond_rouge.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"fond_rouge-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"fond_rouge-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(334, 130, '_wp_attachment_is_custom_background', 'festival');

-- --------------------------------------------------------

--
-- Structure de la table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- Contenu de la table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2013-01-14 15:52:48', '2013-01-14 15:52:48', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'trash', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2013-01-16 14:45:53', '2013-01-16 13:45:53', '', 0, 'http://localhost/~lemele/festival_cinema/?p=1', 0, 'post', '', 1),
(2, 1, '2013-01-14 15:52:48', '2013-01-14 14:52:48', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans. En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition. Bon festival ! Christel Guillard, coordinatrice générale.', 'Edito', '', 'publish', 'closed', 'closed', '', 'page-d-exemple', '', '', '2013-01-21 16:31:21', '2013-01-21 15:31:21', '', 0, 'http://localhost/~lemele/festival_cinema/?page_id=2', 0, 'page', '', 0),
(4, 1, '2013-01-14 15:52:48', '2013-01-14 15:52:48', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'inherit', 'open', 'open', '', '1-revision', '', '', '2013-01-14 15:52:48', '2013-01-14 15:52:48', '', 1, 'http://localhost/~lemele/festival_cinema/?p=4', 0, 'revision', '', 0),
(5, 1, '2013-01-16 14:49:31', '2013-01-16 13:49:31', 'Lors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi.<!--more-->A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais surtout le faire réfléchir.', 'En colo', '', 'publish', 'closed', 'open', '', 'en-colo-pascal-alex-vincent-france', '', '', '2013-01-30 10:40:56', '2013-01-30 09:40:56', '', 0, 'http://localhost/~lemele/festival_cinema/?p=5', 0, 'post', '', 0),
(6, 1, '2013-01-16 14:47:01', '2013-01-16 13:47:01', '2009 - 8 minutes\nLors d’une séance du jeu « Action ou\nvérité ? », deux jeunes garçons, Mathieu\net Maxime, ont pour défi de s’embrasser.\nLe baiser va provoquer chez eux un certain émoi.\nA partir de ce moment, les ados, témoins de cette scène, font des\nallusions plus ou moins directes à l’éventuelle homosexualité\nde Maxime. Une révélation surprenante va alors déstabiliser\nle groupe, mais surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '5-revision', '', '', '2013-01-16 14:47:01', '2013-01-16 13:47:01', '', 5, 'http://localhost/~lemele/festival_cinema/?p=6', 0, 'revision', '', 0),
(7, 1, '2013-01-30 10:40:46', '2013-01-30 09:40:46', 'Lors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi.\n\n<!--more-->A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais surtout le faire réfléchir.', 'En colo', '', 'inherit', 'open', 'open', '', '5-autosave', '', '', '2013-01-30 10:40:46', '2013-01-30 09:40:46', '', 5, 'http://localhost/~lemele/festival_cinema/?p=7', 0, 'revision', '', 0),
(8, 1, '2013-01-16 15:02:56', '2013-01-16 14:02:56', '', 'EN_COLO', '', 'inherit', 'open', 'open', '', 'en_colo', '', '', '2013-01-16 15:02:56', '2013-01-16 14:02:56', '', 5, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/EN_COLO.jpg', 0, 'attachment', 'image/jpeg', 0),
(9, 1, '2013-01-16 14:49:31', '2013-01-16 13:49:31', '2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou\r\nvérité ? », deux jeunes garçons, Mathieu\r\net Maxime, ont pour défi de s’embrasser.\r\nLe baiser va provoquer chez eux un certain émoi.\r\nA partir de ce moment, les ados, témoins de cette scène, font des\r\nallusions plus ou moins directes à l’éventuelle homosexualité\r\nde Maxime. Une révélation surprenante va alors déstabiliser\r\nle groupe, mais surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '5-revision-2', '', '', '2013-01-16 14:49:31', '2013-01-16 13:49:31', '', 5, 'http://localhost/~lemele/festival_cinema/?p=9', 0, 'revision', '', 0),
(10, 1, '2013-01-16 15:07:02', '2013-01-16 14:07:02', 'C’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans une petite ville de province où tout le monde se connaît,<!--more-->la révélation publique et infamante de son homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur. Comme une confidence.', 'Pauline', '', 'publish', 'closed', 'open', '', 'pauline-celine-sciamma-france-2009', '', '', '2013-01-30 10:44:28', '2013-01-30 09:44:28', '', 0, 'http://localhost/~lemele/festival_cinema/?p=10', 0, 'post', '', 0),
(11, 1, '2013-01-16 15:06:09', '2013-01-16 14:06:09', '', 'PAULINE', '', 'inherit', 'open', 'open', '', 'pauline_1', '', '', '2013-01-16 15:06:09', '2013-01-16 14:06:09', '', 10, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/PAULINE_1.jpg', 0, 'attachment', 'image/jpeg', 0),
(12, 1, '2013-01-16 15:06:24', '2013-01-16 14:06:24', '7 minutes\n13\nC’est la mise en scène d’une jeune fille, qui se raconte\nface à la caméra : l’enfance joyeuse dans une petite\nville de province où tout le monde se connaît, la révélation\npublique et infamante de son homosexualité par un ami de ses\nparents, le silence des témoins, la douleur de la solitude, la\npossibilité de l’acceptation. Tout cela elle le raconte à une autre\nfille, à la caméra, au spectateur. Comme une confidence.', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '10-revision', '', '', '2013-01-16 15:06:24', '2013-01-16 14:06:24', '', 10, 'http://localhost/~lemele/festival_cinema/?p=12', 0, 'revision', '', 0),
(13, 1, '2013-01-16 15:07:02', '2013-01-16 14:07:02', '7 minutes\r\n13\r\nC’est la mise en scène d’une jeune fille, qui se raconte\r\nface à la caméra : l’enfance joyeuse dans une petite\r\nville de province où tout le monde se connaît, la révélation\r\npublique et infamante de son homosexualité par un ami de ses\r\nparents, le silence des témoins, la douleur de la solitude, la\r\npossibilité de l’acceptation. Tout cela elle le raconte à une autre\r\nfille, à la caméra, au spectateur. Comme une confidence.', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '10-revision-2', '', '', '2013-01-16 15:07:02', '2013-01-16 14:07:02', '', 10, 'http://localhost/~lemele/festival_cinema/?p=13', 0, 'revision', '', 0),
(14, 1, '2013-01-16 15:08:11', '2013-01-16 14:08:11', 'C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui l’aime mais où la pression est telle qu’il ne peut vraiment assouvir, ni même révéler, son amour pour Arthur. Jusqu’au jour où les deux jeunes hommes sont découverts.', 'Omar', '', 'publish', 'closed', 'open', '', 'omar-sebastien-gabriel-france-2009-9-minutes', '', '', '2013-01-21 16:08:18', '2013-01-21 15:08:18', '', 0, 'http://localhost/~lemele/festival_cinema/?p=14', 0, 'post', '', 0),
(15, 1, '2013-01-16 15:08:00', '2013-01-16 14:08:00', '', 'OMAR_', '', 'inherit', 'open', 'open', '', 'omar_', '', '', '2013-01-16 15:08:00', '2013-01-16 14:08:00', '', 14, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/OMAR_.jpg', 0, 'attachment', 'image/jpeg', 0),
(16, 1, '2013-01-16 15:07:35', '2013-01-16 14:07:35', '', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '14-revision', '', '', '2013-01-16 15:07:35', '2013-01-16 14:07:35', '', 14, 'http://localhost/~lemele/festival_cinema/?p=16', 0, 'revision', '', 0),
(17, 1, '2013-01-16 15:09:01', '2013-01-16 14:09:01', 'Une boulangerie banale sur une route de campagne. Derrière le comptoir, Odile, s’ennuie. Un jour, une horde de motards stoppe devant la boutique. Le passé va faire irruption dans sa vie...', 'Odile', '', 'publish', 'closed', 'open', '', 'odile-benedicte-delgehier-france-2006-10-minutes', '', '', '2013-01-21 16:07:05', '2013-01-21 15:07:05', '', 0, 'http://localhost/~lemele/festival_cinema/?p=17', 0, 'post', '', 0),
(18, 1, '2013-01-16 15:08:54', '2013-01-16 14:08:54', '', 'Odile_', '', 'inherit', 'open', 'open', '', 'odile_', '', '', '2013-01-16 15:08:54', '2013-01-16 14:08:54', '', 17, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/Odile_.jpg', 0, 'attachment', 'image/jpeg', 0),
(19, 1, '2013-01-16 15:08:29', '2013-01-16 14:08:29', '', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '17-revision', '', '', '2013-01-16 15:08:29', '2013-01-16 14:08:29', '', 17, 'http://localhost/~lemele/festival_cinema/?p=19', 0, 'revision', '', 0),
(20, 1, '2013-01-16 15:09:45', '2013-01-16 14:09:45', 'Le corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche vers la veillée funèbre pour revendiquer l’identité construite de la défunte.', 'Os sapatos de Aristeu', '', 'publish', 'closed', 'open', '', 'os-sapatos-de-aristeu-rene-guerra-luiz-bresil-2008', '', '', '2013-01-21 16:05:52', '2013-01-21 15:05:52', '', 0, 'http://localhost/~lemele/festival_cinema/?p=20', 0, 'post', '', 0),
(21, 1, '2013-01-16 15:09:38', '2013-01-16 14:09:38', '', 'Os_sapatos_de_Aristeu', '', 'inherit', 'open', 'open', '', 'os_sapatos_de_aristeu', '', '', '2013-01-16 15:09:38', '2013-01-16 14:09:38', '', 20, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/Os_sapatos_de_Aristeu.jpg', 0, 'attachment', 'image/jpeg', 0),
(22, 1, '2013-01-16 15:09:21', '2013-01-16 14:09:21', '', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '20-revision', '', '', '2013-01-16 15:09:21', '2013-01-16 14:09:21', '', 20, 'http://localhost/~lemele/festival_cinema/?p=22', 0, 'revision', '', 0),
(23, 1, '2013-01-16 15:10:31', '2013-01-16 14:10:31', 'Au cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...', 'Cowboy Forever', '', 'publish', 'closed', 'open', '', 'cowboy-forever-jean-baptiste-erreca-france', '', '', '2013-01-21 16:03:42', '2013-01-21 15:03:42', '', 0, 'http://localhost/~lemele/festival_cinema/?p=23', 0, 'post', '', 0),
(24, 1, '2013-01-16 15:10:24', '2013-01-16 14:10:24', '', 'COWBOY_FOREVER', '', 'inherit', 'open', 'open', '', 'cowboy_forever', '', '', '2013-01-16 15:10:24', '2013-01-16 14:10:24', '', 23, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/COWBOY_FOREVER.jpg', 0, 'attachment', 'image/jpeg', 0),
(25, 1, '2013-01-16 15:10:06', '2013-01-16 14:10:06', '', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '23-revision', '', '', '2013-01-16 15:10:06', '2013-01-16 14:10:06', '', 23, 'http://localhost/~lemele/festival_cinema/?p=25', 0, 'revision', '', 0),
(26, 1, '2013-01-16 15:11:23', '2013-01-16 14:11:23', 'Comment jouer du genre en chanson ? Projection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat &amp; Scène.', 'American Boy', '', 'publish', 'closed', 'open', '', 'american-boy-patricia-colette-france', '', '', '2013-01-21 16:02:11', '2013-01-21 15:02:11', '', 0, 'http://localhost/~lemele/festival_cinema/?p=26', 0, 'post', '', 0),
(27, 1, '2013-01-16 15:11:16', '2013-01-16 14:11:16', '', 'American boy', '', 'inherit', 'open', 'open', '', 'american-boy', '', '', '2013-01-16 15:11:16', '2013-01-16 14:11:16', '', 26, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/American-boy.png', 0, 'attachment', 'image/png', 0),
(28, 1, '2013-01-16 15:10:50', '2013-01-16 14:10:50', '', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '26-revision', '', '', '2013-01-16 15:10:50', '2013-01-16 14:10:50', '', 26, 'http://localhost/~lemele/festival_cinema/?p=28', 0, 'revision', '', 0),
(29, 1, '2013-01-16 15:11:23', '2013-01-16 14:11:23', '2008 - 4 minutes\r\nComment jouer du genre en chanson ?\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous\r\nsera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '26-revision-2', '', '', '2013-01-16 15:11:23', '2013-01-16 14:11:23', '', 26, 'http://localhost/~lemele/festival_cinema/?p=29', 0, 'revision', '', 0),
(30, 1, '2013-01-16 15:10:31', '2013-01-16 14:10:31', '2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des\r\ncowboys latinos, les héros de Cowboy Forever\r\nrevendiquent leur homosexualité et manient à\r\nmerveille le lasso, et pas seulement pour attraper\r\nle bétail...', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '23-revision-2', '', '', '2013-01-16 15:10:31', '2013-01-16 14:10:31', '', 23, 'http://localhost/~lemele/festival_cinema/?p=30', 0, 'revision', '', 0),
(31, 1, '2013-01-16 15:09:45', '2013-01-16 14:09:45', '17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé\r\npour l’enterrement par d’autres travestis.\r\nSon corps de femme est amené à sa famille,\r\nqui décide de l’enterrer comme un homme.\r\nUne procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer\r\nl’identité construite de la défunte.', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '20-revision-2', '', '', '2013-01-16 15:09:45', '2013-01-16 14:09:45', '', 20, 'http://localhost/~lemele/festival_cinema/?p=31', 0, 'revision', '', 0),
(32, 1, '2013-01-16 15:09:01', '2013-01-16 14:09:01', 'Une boulangerie banale sur une route de\r\ncampagne. Derrière le comptoir, Odile, s’ennuie.\r\nUn jour, une horde de motards stoppe devant\r\nla boutique. Le passé va faire irruption dans\r\nsa vie...', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '17-revision-2', '', '', '2013-01-16 15:09:01', '2013-01-16 14:09:01', '', 17, 'http://localhost/~lemele/festival_cinema/?p=32', 0, 'revision', '', 0),
(33, 1, '2013-01-16 15:12:15', '2013-01-16 14:12:15', '2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des\r\ncowboys latinos, les héros de Cowboy Forever\r\nrevendiquent leur homosexualité et manient à\r\nmerveille le lasso, et pas seulement pour attraper\r\nle bétail...', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '23-revision-3', '', '', '2013-01-16 15:12:15', '2013-01-16 14:12:15', '', 23, 'http://localhost/~lemele/festival_cinema/?p=33', 0, 'revision', '', 0),
(34, 1, '2013-01-16 15:12:15', '2013-01-16 14:12:15', '17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé\r\npour l’enterrement par d’autres travestis.\r\nSon corps de femme est amené à sa famille,\r\nqui décide de l’enterrer comme un homme.\r\nUne procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer\r\nl’identité construite de la défunte.', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '20-revision-3', '', '', '2013-01-16 15:12:15', '2013-01-16 14:12:15', '', 20, 'http://localhost/~lemele/festival_cinema/?p=34', 0, 'revision', '', 0),
(35, 1, '2013-01-16 15:12:51', '2013-01-16 14:12:51', '2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des\r\ncowboys latinos, les héros de Cowboy Forever\r\nrevendiquent leur homosexualité et manient à\r\nmerveille le lasso, et pas seulement pour attraper\r\nle bétail...', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '23-revision-4', '', '', '2013-01-16 15:12:51', '2013-01-16 14:12:51', '', 23, 'http://localhost/~lemele/festival_cinema/?p=35', 0, 'revision', '', 0),
(36, 1, '2013-01-16 15:12:52', '2013-01-16 14:12:52', '17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé\r\npour l’enterrement par d’autres travestis.\r\nSon corps de femme est amené à sa famille,\r\nqui décide de l’enterrer comme un homme.\r\nUne procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer\r\nl’identité construite de la défunte.', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '20-revision-4', '', '', '2013-01-16 15:12:52', '2013-01-16 14:12:52', '', 20, 'http://localhost/~lemele/festival_cinema/?p=36', 0, 'revision', '', 0),
(37, 1, '2013-01-16 15:15:03', '2013-01-16 14:15:03', 'Premier documentaire à traiter de l’homosexualité expliquée 14 aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée.<!--more-->Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation. Ce film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé. La projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'publish', 'closed', 'open', '', 'its-elementary-talking-about-gays-issues-in-school', '', '', '2013-01-30 10:42:31', '2013-01-30 09:42:31', '', 0, 'http://localhost/~lemele/festival_cinema/?p=37', 0, 'post', '', 0),
(38, 1, '2013-01-16 15:14:51', '2013-01-16 14:14:51', '', 'it_s_still_elementary', '', 'inherit', 'open', 'open', '', '37_it_s_still_elementary', '', '', '2013-01-16 15:14:51', '2013-01-16 14:14:51', '', 37, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/37_it_s_still_elementary.jpg', 0, 'attachment', 'image/jpeg', 0),
(39, 1, '2013-01-16 15:14:50', '2013-01-16 14:14:50', '(C’est élémentaire - Parler de l’homosexualité à l’école)\nEtats-Unis - 1996 - Documentaire\nDurée 01h20 - Réalisation : Debra Chasnoff\nPremier documentaire à traiter de l’homosexualité expliquée\n14\naux enfants dans les écoles publiques américaines, It’s\nelementary suit les interventions des enseignants dans les\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\ntour des écoles américaines et a gagné de nombreux prix.\nUn excellent support didactique à montrer à tous les élèves\net leurs professeurs lorsque l’on appartient au monde de\nl’éducation.\nCe film a subi aux Etats-Unis des attaques de la part de\nl’ultra-droite chrétienne intégriste et homophobe pour\nempêcher sa diffusion sur une chaîne télé.\nLa projection sera suivie d’un débat avec l’association\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '37-revision', '', '', '2013-01-16 15:14:50', '2013-01-16 14:14:50', '', 37, 'http://localhost/~lemele/festival_cinema/?p=39', 0, 'revision', '', 0),
(40, 1, '2013-01-16 15:17:25', '2013-01-16 14:17:25', 'Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe.<!--more-->Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander... Considéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer... Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\n\r\nPrix C.I.C.A.E – Festival International de Berlin (2009) Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009) Grand prix du jury – Festival Cinehorizontes (2009)', 'Ander', '', 'publish', 'closed', 'open', '', 'ander-realise-par-roberto-caston', '', '', '2013-01-30 10:42:15', '2013-01-30 09:42:15', '', 0, 'http://localhost/~lemele/festival_cinema/?p=40', 0, 'post', '', 0),
(41, 1, '2013-01-16 15:16:42', '2013-01-16 14:16:42', '', 'ANDER1', '', 'inherit', 'open', 'open', '', 'ander1', '', '', '2013-01-16 15:16:42', '2013-01-16 14:16:42', '', 40, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/ANDER1.jpg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2013-01-16 15:16:14', '2013-01-16 14:16:14', 'Espagne - 2009 - 02h08 - VOSTF\nInterprétation : Josean Bengoetxea, Eriz Alberdi,\nChristian Esquive\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine\npassée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme\nfamiliale. Alors qu’Arantxa doit bientôt se marier et laisser Ander\ns’occuper seul de leur mère, celui-ci se casse une jambe.\nPour l’assister dans ses tâches, sa famille embauche José, un\njeune travailleur saisonnier péruvien.\nLe nouveau venu va bientôt bouleverser les relations familiales et\nsurtout troubler de plus en plus Ander...\nConsidéré comme le Brockback Mountain basque, Roberto\nCastón met en scène cette histoire d’amour entre deux hommes\nvivant au contact de la nature d’une manière différente. Il laisse\nle temps à ses personnages de s’apprivoiser, de se découvrir,\nd’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\ntemps de filmer...\nCe premier beau long métrage où la simplicité formelle côtoie\nla complexité des rapports humains d’une grande intensité, a\nremporté l’adhésion du public dans tous les festivals où il a été\nprojeté.\nPrix C.I.C.A.E – Festival International de Berlin (2009)\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\nGrand prix du jury – Festival Cinehorizontes (2009)', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '40-revision', '', '', '2013-01-16 15:16:14', '2013-01-16 14:16:14', '', 40, 'http://localhost/~lemele/festival_cinema/?p=42', 0, 'revision', '', 0),
(43, 1, '2013-01-16 15:19:13', '2013-01-16 14:19:13', 'Dans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans.<!--more-->Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer... Lucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer. Entre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.', 'El nino pez', '', 'publish', 'closed', 'open', '', 'el-nino-pez-realise-par-lucia-puenzo', '', '', '2013-01-30 10:41:58', '2013-01-30 09:41:58', '', 0, 'http://localhost/~lemele/festival_cinema/?p=43', 0, 'post', '', 0),
(44, 1, '2013-01-16 15:18:37', '2013-01-16 14:18:37', '', 'EL_NINO_PEZ__2', '', 'inherit', 'open', 'open', '', 'el_nino_pez__2', '', '', '2013-01-16 15:18:37', '2013-01-16 14:18:37', '', 43, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/EL_NINO_PEZ__2.jpg', 0, 'attachment', 'image/jpeg', 0),
(45, 1, '2013-01-16 15:18:48', '2013-01-16 14:18:48', 'Argentine - 2008 - 01h36 - VOSTF\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge\ndépressif et d’une mère toxicomane, est follement amoureuse\nde Guayi, jeune et jolie domestique paraguayenne au service\nde la famille depuis l’âge de treize ans. Les deux jeunes filles\nprojettent de s’enfuir dans le village d’origine de Guayi, au\nbord du lac Ypoà où elles pourraient vivre ensemble et laisser\ns’exprimer sans contrainte leur désir fusionnel. Mais un\ndrame familial va brusquement les séparer...\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi\nd’adapter elle-même son propre roman écrit huit ans\nauparavant où deux jeunes femmes aux physiques opposés et\nde classes sociales différentes vont se rencontrer et s’aimer.\nEntre chronique sociale, onirisme et thriller, la cinéaste nous\nentraîne dans un Thelma et Louise lesbien à travers une\nArgentine inconnue et troublante.', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '43-revision', '', '', '2013-01-16 15:18:48', '2013-01-16 14:18:48', '', 43, 'http://localhost/~lemele/festival_cinema/?p=45', 0, 'revision', '', 0),
(46, 1, '2013-01-21 15:54:29', '2013-01-21 14:54:29', 'Argentine - 2008 - 01h36 - VOSTF\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge\ndépressif et d’une mère toxicomane, est follement amoureuse\nde Guayi, jeune et jolie domestique paraguayenne au service\nde la famille depuis l’âge de treize ans. Les deux jeunes filles\nprojettent de s’enfuir dans le village d’origine de Guayi, au\nbord du lac Ypoà où elles pourraient vivre ensemble et laisser\ns’exprimer sans contrainte leur désir fusionnel. Mais un\ndrame familial va brusquement les séparer...\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi\nd’adapter elle-même son propre roman écrit huit ans\nauparavant où deux jeunes femmes aux physiques opposés et\nde classes sociales différentes vont se rencontrer et s’aimer.\nEntre chronique sociale, onirisme et thriller, la cinéaste nous\nentraîne dans un Thelma et Louise lesbien à travers une\nArgentine inconnue et troublante.', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '43-autosave', '', '', '2013-01-21 15:54:29', '2013-01-21 14:54:29', '', 43, 'http://localhost/~lemele/festival_cinema/?p=46', 0, 'revision', '', 0),
(47, 1, '2013-01-16 15:22:33', '2013-01-16 14:22:33', 'Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide. Et pourtant, les deux femmes succombent lors d’une nuit passionnée.<!--more-->Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises. Meilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'I can''t think straight', '', 'publish', 'closed', 'open', '', 'cant-think-straight-realise-par-shamim-sarif', '', '', '2013-01-30 10:41:39', '2013-01-30 09:41:39', '', 0, 'http://localhost/~lemele/festival_cinema/?p=47', 0, 'post', '', 0),
(48, 1, '2013-01-16 15:21:55', '2013-01-16 14:21:55', '', 'I_can''t_think_straight_2', '', 'inherit', 'open', 'open', '', 'i_cant_think_straight_2', '', '', '2013-01-16 15:21:55', '2013-01-16 14:21:55', '', 47, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/I_cant_think_straight_2.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2013-01-16 15:22:25', '2013-01-16 14:22:25', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\nAlors qu’elle est sur le point de se marier, Tala, une jeune\nPalestinienne installée à Londres, tombe amoureuse de Leyla,\nune jeune Britannique d’origine indienne.\nTout les oppose : Tala est chrétienne et affirmée, Leyla\nmusulmane et timide.\nEt pourtant, les deux femmes succombent lors d’une nuit\npassionnée. Mais le poids des cultures, la pression familiale\net le sens du devoir mettront à l’épreuve leur relation et les\nforceront à se découvrir elles-mêmes.\nCe premier long métrage de Shamim Sarif, portée par les\ndeux talentueuses actrices (que l’on retrouve également dans\nson autre film The world unseen) est un pur joyau digne des\ncomédies romantiques anglaises.\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '47-revision', '', '', '2013-01-16 15:22:25', '2013-01-16 14:22:25', '', 47, 'http://localhost/~lemele/festival_cinema/?p=49', 0, 'revision', '', 0),
(51, 1, '2013-01-14 15:52:48', '2013-01-14 15:52:48', 'Voici un exemple de page. Elle est différente d&rsquo;un article de blog, en cela qu''elle restera à la même place, et s''affichera dans le menu de navigation de votre site (en fonction de votre thème). La plupart des gens commencent par écrire une page « À Propos » qui les présente aux visiteurs potentiels du site. Vous pourriez y écrire quelque chose de ce tenant :\n\n<blockquote>Bonjour ! Je suis un mécanicien qui aspire à devenir un acteur, et voici mon blog. J''habite à Bordeaux, j''ai un super chien baptisé Russell, et j''aime la vodka-ananas (ainsi que regarder la pluie tomber).</blockquote>\n\n...ou bien quelque chose comme ça :\n\n<blockquote>La société 123 Machin Truc a été créée en 1971, et n''a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules super pour la communauté bouzemontoise.</blockquote>\n\nÉtant donné que vous êtes un nouvel utilisateur de WordPress, vous devriez vous rendre sur votre <a href="http://localhost/~lemele/festival_cinema/wp-admin/">tableau de bord</a> pour effacer la présente page, et créer de nouvelles pages avec votre propre contenu. Amusez-vous bien&nbsp;!', 'Page d&rsquo;exemple', '', 'inherit', 'open', 'open', '', '2-revision', '', '', '2013-01-14 15:52:48', '2013-01-14 15:52:48', '', 2, 'http://localhost/~lemele/festival_cinema/?p=51', 0, 'revision', '', 0),
(52, 1, '2013-01-16 15:27:56', '2013-01-16 14:27:56', '', 'Films', '', 'trash', 'open', 'open', '', 'films', '', '', '2013-01-16 15:28:49', '2013-01-16 14:28:49', '', 0, 'http://localhost/~lemele/festival_cinema/?page_id=52', 0, 'page', '', 0),
(53, 1, '2013-01-16 15:27:56', '2013-01-16 14:27:56', '', 'Films', '', 'inherit', 'open', 'open', '', '52-revision', '', '', '2013-01-16 15:27:56', '2013-01-16 14:27:56', '', 52, 'http://localhost/~lemele/festival_cinema/?p=53', 0, 'revision', '', 0),
(54, 1, '2013-01-16 15:29:27', '2013-01-16 14:29:27', 'Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\r\n\r\nTarifs : Plein tarif : 7,50 €\r\n\r\nPass Festival : 25 € (5 séances)\r\n\r\nSoirée courts métrages : 6 € (vendredi)\r\n\r\n2 séances consécutives le samedi ou le dimanche : 12 €\r\n\r\nCartes &amp; réductions acceptées :\r\n\r\nCartes DECOUVERTE &amp; PASSION,\r\n\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\n\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\n\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\n\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\n\r\ntous continents.\r\n\r\nEquipe :\r\n\r\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\r\n\r\nProgrammation : Christel Guillard en collaboration avec\r\n\r\nFrançoise Dahmane (Cinéma Les Carmes)\r\n\r\nCommunication &amp; partenariats : Christel Guillard\r\n\r\nConception graphique : Yannis Bellair\r\n\r\nConception du site internet : rccc\r\n\r\nImpression : Prevost Offset\r\n\r\nContacts :\r\n\r\nfestival.dunbordalautre@gmail.com\r\n\r\nwww.festivaldunbordalautre.com', 'Infos pratiques', '', 'publish', 'closed', 'closed', '', 'infos-pratiques', '', '', '2013-01-21 16:18:09', '2013-01-21 15:18:09', '', 0, 'http://localhost/~lemele/festival_cinema/?page_id=54', 0, 'page', '', 0),
(55, 1, '2013-01-16 15:29:06', '2013-01-16 14:29:06', '', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '54-revision', '', '', '2013-01-16 15:29:06', '2013-01-16 14:29:06', '', 54, 'http://localhost/~lemele/festival_cinema/?p=55', 0, 'revision', '', 0),
(56, 1, '2013-01-16 15:29:59', '2013-01-16 14:29:59', '- Région Centre\r\n\r\n- Orléans\r\n\r\n- Cinéma des Carmes\r\n\r\n- GAGL\r\n\r\n- Têtu\r\n\r\n- La dixième MUSE\r\n\r\n- CiteGay\r\n\r\n- Yagg.com\r\n\r\n- France Bleu', 'Partenaires', '', 'publish', 'closed', 'closed', '', 'partenaires', '', '', '2013-01-21 16:17:49', '2013-01-21 15:17:49', '', 0, 'http://localhost/~lemele/festival_cinema/?page_id=56', 0, 'page', '', 0),
(57, 1, '2013-01-16 15:29:41', '2013-01-16 14:29:41', '', 'Partenaires', '', 'inherit', 'open', 'open', '', '56-revision', '', '', '2013-01-16 15:29:41', '2013-01-16 14:29:41', '', 56, 'http://localhost/~lemele/festival_cinema/?p=57', 0, 'revision', '', 0),
(58, 1, '2013-01-16 15:30:26', '2013-01-16 14:30:26', '- La Région Centre\r\n\r\n- La Mairie d''Orléans\r\n\r\n- Le cinéma des Carmes\r\n\r\n- Le Groupe Action Gay &amp; Lesbien - Loiret\r\n\r\n- Citégay\r\n\r\n- La dixième Muse\r\n\r\n- Têtu\r\n\r\n- Yagg.com\r\n\r\n- France Bleu Orléans\r\n\r\n- Bagdam Espace Lesbien ( Toulouse )\r\n\r\n- Cineffable\r\n\r\n- Le Festival Tous Courts ( Aix en Provence )\r\n\r\n- Les VidéObstinées', 'Remerciements', '', 'publish', 'closed', 'closed', '', 'remerciements', '', '', '2013-01-21 16:17:31', '2013-01-21 15:17:31', '', 0, 'http://localhost/~lemele/festival_cinema/?page_id=58', 0, 'page', '', 0),
(59, 1, '2013-01-16 15:30:10', '2013-01-16 14:30:10', '', 'Remerciements', '', 'inherit', 'open', 'open', '', '58-revision', '', '', '2013-01-16 15:30:10', '2013-01-16 14:30:10', '', 58, 'http://localhost/~lemele/festival_cinema/?p=59', 0, 'revision', '', 0),
(66, 1, '2013-01-16 15:36:17', '2013-01-16 14:36:17', 'Vendredi 24 septembre : 20h00\r\nSoirée d’ouverture : séance de courts métrages\r\nRencontre-débat avec un réalisateur.\r\nSamedi 25 septembre : 19h30\r\nDocumentaire :\r\nIt’s elementary, talking about gays issues in school\r\n(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nRencontre-débat avec le Groupe Action Gay &amp; Lesbien – Loiret\r\nsur les interventions en milieu scolaire.\r\nSamedi 25 septembre : 21h45\r\nFiction : Ander\r\nDimanche 26 septembre : 16h00\r\nFiction : El niño pez\r\nDimanche 26 septembre : 18h00\r\nFiction : I can’t think straight', 'Programme', '', 'trash', 'closed', 'closed', '', 'programme', '', '', '2013-01-21 16:18:34', '2013-01-21 15:18:34', '', 0, 'http://localhost/~lemele/festival_cinema/?page_id=66', 0, 'page', '', 0),
(67, 1, '2013-01-16 15:35:55', '2013-01-16 14:35:55', '', 'Programme', '', 'inherit', 'open', 'open', '', '66-revision', '', '', '2013-01-16 15:35:55', '2013-01-16 14:35:55', '', 66, 'http://localhost/~lemele/festival_cinema/?p=67', 0, 'revision', '', 0),
(68, 1, '2013-01-16 15:22:33', '2013-01-16 14:22:33', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\r\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\r\nAlors qu’elle est sur le point de se marier, Tala, une jeune\r\nPalestinienne installée à Londres, tombe amoureuse de Leyla,\r\nune jeune Britannique d’origine indienne.\r\nTout les oppose : Tala est chrétienne et affirmée, Leyla\r\nmusulmane et timide.\r\nEt pourtant, les deux femmes succombent lors d’une nuit\r\npassionnée. Mais le poids des cultures, la pression familiale\r\net le sens du devoir mettront à l’épreuve leur relation et les\r\nforceront à se découvrir elles-mêmes.\r\nCe premier long métrage de Shamim Sarif, portée par les\r\ndeux talentueuses actrices (que l’on retrouve également dans\r\nson autre film The world unseen) est un pur joyau digne des\r\ncomédies romantiques anglaises.\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '47-revision-2', '', '', '2013-01-16 15:22:33', '2013-01-16 14:22:33', '', 47, 'http://localhost/~lemele/festival_cinema/?p=68', 0, 'revision', '', 0),
(69, 1, '2013-01-16 15:19:13', '2013-01-16 14:19:13', 'Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge\r\ndépressif et d’une mère toxicomane, est follement amoureuse\r\nde Guayi, jeune et jolie domestique paraguayenne au service\r\nde la famille depuis l’âge de treize ans. Les deux jeunes filles\r\nprojettent de s’enfuir dans le village d’origine de Guayi, au\r\nbord du lac Ypoà où elles pourraient vivre ensemble et laisser\r\ns’exprimer sans contrainte leur désir fusionnel. Mais un\r\ndrame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi\r\nd’adapter elle-même son propre roman écrit huit ans\r\nauparavant où deux jeunes femmes aux physiques opposés et\r\nde classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous\r\nentraîne dans un Thelma et Louise lesbien à travers une\r\nArgentine inconnue et troublante.', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '43-revision-2', '', '', '2013-01-16 15:19:13', '2013-01-16 14:19:13', '', 43, 'http://localhost/~lemele/festival_cinema/?p=69', 0, 'revision', '', 0),
(70, 1, '2013-01-16 15:17:25', '2013-01-16 14:17:25', 'Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi,\r\nChristian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine\r\npassée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme\r\nfamiliale. Alors qu’Arantxa doit bientôt se marier et laisser Ander\r\ns’occuper seul de leur mère, celui-ci se casse une jambe.\r\nPour l’assister dans ses tâches, sa famille embauche José, un\r\njeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et\r\nsurtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto\r\nCastón met en scène cette histoire d’amour entre deux hommes\r\nvivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir,\r\nd’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\r\ntemps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie\r\nla complexité des rapports humains d’une grande intensité, a\r\nremporté l’adhésion du public dans tous les festivals où il a été\r\nprojeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '40-revision-2', '', '', '2013-01-16 15:17:25', '2013-01-16 14:17:25', '', 40, 'http://localhost/~lemele/festival_cinema/?p=70', 0, 'revision', '', 0),
(71, 1, '2013-01-16 15:15:03', '2013-01-16 14:15:03', '(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nEtats-Unis - 1996 - Documentaire\r\nDurée 01h20 - Réalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée\r\n14\r\naux enfants dans les écoles publiques américaines, It’s\r\nelementary suit les interventions des enseignants dans les\r\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\r\ntour des écoles américaines et a gagné de nombreux prix.\r\nUn excellent support didactique à montrer à tous les élèves\r\net leurs professeurs lorsque l’on appartient au monde de\r\nl’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de\r\nl’ultra-droite chrétienne intégriste et homophobe pour\r\nempêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\r\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '37-revision-2', '', '', '2013-01-16 15:15:03', '2013-01-16 14:15:03', '', 37, 'http://localhost/~lemele/festival_cinema/?p=71', 0, 'revision', '', 0),
(72, 1, '2013-01-16 15:11:46', '2013-01-16 14:11:46', '2008 - 4 minutes\r\nComment jouer du genre en chanson ?\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous\r\nsera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '26-revision-3', '', '', '2013-01-16 15:11:46', '2013-01-16 14:11:46', '', 26, 'http://localhost/~lemele/festival_cinema/?p=72', 0, 'revision', '', 0),
(73, 1, '2013-01-16 15:13:05', '2013-01-16 14:13:05', '2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des\r\ncowboys latinos, les héros de Cowboy Forever\r\nrevendiquent leur homosexualité et manient à\r\nmerveille le lasso, et pas seulement pour attraper\r\nle bétail...', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '23-revision-5', '', '', '2013-01-16 15:13:05', '2013-01-16 14:13:05', '', 23, 'http://localhost/~lemele/festival_cinema/?p=73', 0, 'revision', '', 0),
(74, 1, '2013-01-16 15:13:21', '2013-01-16 14:13:21', '17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé\r\npour l’enterrement par d’autres travestis.\r\nSon corps de femme est amené à sa famille,\r\nqui décide de l’enterrer comme un homme.\r\nUne procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer\r\nl’identité construite de la défunte.', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '20-revision-5', '', '', '2013-01-16 15:13:21', '2013-01-16 14:13:21', '', 20, 'http://localhost/~lemele/festival_cinema/?p=74', 0, 'revision', '', 0),
(75, 1, '2013-01-16 15:12:28', '2013-01-16 14:12:28', 'Une boulangerie banale sur une route de\r\ncampagne. Derrière le comptoir, Odile, s’ennuie.\r\nUn jour, une horde de motards stoppe devant\r\nla boutique. Le passé va faire irruption dans\r\nsa vie...', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '17-revision-3', '', '', '2013-01-16 15:12:28', '2013-01-16 14:12:28', '', 17, 'http://localhost/~lemele/festival_cinema/?p=75', 0, 'revision', '', 0),
(76, 1, '2013-01-16 15:08:11', '2013-01-16 14:08:11', 'C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui\r\nl’aime mais où la pression est telle qu’il ne peut vraiment assouvir,\r\nni même révéler, son amour pour Arthur. Jusqu’au\r\njour où les deux jeunes hommes sont découverts.', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '14-revision-2', '', '', '2013-01-16 15:08:11', '2013-01-16 14:08:11', '', 14, 'http://localhost/~lemele/festival_cinema/?p=76', 0, 'revision', '', 0),
(77, 1, '2013-01-16 15:07:13', '2013-01-16 14:07:13', '7 minutes\r\n13\r\nC’est la mise en scène d’une jeune fille, qui se raconte\r\nface à la caméra : l’enfance joyeuse dans une petite\r\nville de province où tout le monde se connaît, la révélation\r\npublique et infamante de son homosexualité par un ami de ses\r\nparents, le silence des témoins, la douleur de la solitude, la\r\npossibilité de l’acceptation. Tout cela elle le raconte à une autre\r\nfille, à la caméra, au spectateur. Comme une confidence.', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '10-revision-3', '', '', '2013-01-16 15:07:13', '2013-01-16 14:07:13', '', 10, 'http://localhost/~lemele/festival_cinema/?p=77', 0, 'revision', '', 0),
(78, 1, '2013-01-16 15:04:16', '2013-01-16 14:04:16', '2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou\r\nvérité ? », deux jeunes garçons, Mathieu\r\net Maxime, ont pour défi de s’embrasser.\r\nLe baiser va provoquer chez eux un certain émoi.\r\nA partir de ce moment, les ados, témoins de cette scène, font des\r\nallusions plus ou moins directes à l’éventuelle homosexualité\r\nde Maxime. Une révélation surprenante va alors déstabiliser\r\nle groupe, mais surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '5-revision-3', '', '', '2013-01-16 15:04:16', '2013-01-16 14:04:16', '', 5, 'http://localhost/~lemele/festival_cinema/?p=78', 0, 'revision', '', 0),
(79, 1, '2013-01-16 15:29:59', '2013-01-16 14:29:59', '- Région Centre\r\n- Orléans\r\n- Cinéma des Carmes\r\n- GAGL\r\n- Têtu\r\n- La dixième MUSE\r\n- CiteGay\r\n- Yagg.com\r\n- France Bleu', 'Partenaires', '', 'inherit', 'open', 'open', '', '56-revision-2', '', '', '2013-01-16 15:29:59', '2013-01-16 14:29:59', '', 56, 'http://localhost/~lemele/festival_cinema/?p=79', 0, 'revision', '', 0),
(80, 1, '2013-01-16 15:36:17', '2013-01-16 14:36:17', 'Vendredi 24 septembre : 20h00\r\nSoirée d’ouverture : séance de courts métrages\r\nRencontre-débat avec un réalisateur.\r\nSamedi 25 septembre : 19h30\r\nDocumentaire :\r\nIt’s elementary, talking about gays issues in school\r\n(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nRencontre-débat avec le Groupe Action Gay &amp; Lesbien – Loiret\r\nsur les interventions en milieu scolaire.\r\nSamedi 25 septembre : 21h45\r\nFiction : Ander\r\nDimanche 26 septembre : 16h00\r\nFiction : El niño pez\r\nDimanche 26 septembre : 18h00\r\nFiction : I can’t think straight', 'Programme', '', 'inherit', 'open', 'open', '', '66-revision-2', '', '', '2013-01-16 15:36:17', '2013-01-16 14:36:17', '', 66, 'http://localhost/~lemele/festival_cinema/?p=80', 0, 'revision', '', 0),
(81, 1, '2013-01-16 15:30:26', '2013-01-16 14:30:26', '- La Région Centre\r\n- La Mairie d''Orléans\r\n- Le cinéma des Carmes\r\n- Le Groupe Action Gay &amp; Lesbien - Loiret\r\n- Citégay\r\n- La dixième Muse\r\n- Têtu\r\n- Yagg.com\r\n- France Bleu Orléans\r\n- Bagdam Espace Lesbien ( Toulouse )\r\n- Cineffable\r\n- Le Festival Tous Courts ( Aix en Provence )\r\n- Les VidéObstinées', 'Remerciements', '', 'inherit', 'open', 'open', '', '58-revision-2', '', '', '2013-01-16 15:30:26', '2013-01-16 14:30:26', '', 58, 'http://localhost/~lemele/festival_cinema/?p=81', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(82, 1, '2013-01-16 15:29:27', '2013-01-16 14:29:27', 'Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\r\nTarifs : Plein tarif : 7,50 €\r\nPass Festival : 25 € (5 séances)\r\nSoirée courts métrages : 6 € (vendredi)\r\n2 séances consécutives le samedi ou le dimanche : 12 €\r\nCartes &amp; réductions acceptées :\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.\r\nEquipe :\r\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\r\nProgrammation : Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)\r\nCommunication &amp; partenariats : Christel Guillard\r\nConception graphique : Yannis Bellair\r\nConception du site internet : rccc\r\nImpression : Prevost Offset\r\nContacts :\r\nfestival.dunbordalautre@gmail.com\r\nwww.festivaldunbordalautre.com', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '54-revision-2', '', '', '2013-01-16 15:29:27', '2013-01-16 14:29:27', '', 54, 'http://localhost/~lemele/festival_cinema/?p=82', 0, 'revision', '', 0),
(83, 1, '2013-01-16 15:25:27', '2013-01-16 14:25:27', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une\r\nannée sabbatique, le Festival de films gays &amp; lesbiens revient sous\r\nune nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret,\r\nl’association culturelle Ciné Mundi axée sur le cinéma indépendant,\r\nlance en 2010 le festival de films LGBT D’un bord à l’autre sur un\r\nweek-end de trois jours, format similaire aux éditions précédentes.\r\nCette année, l’événement aura pour thème la sensibilisation des\r\njeunes à la lutte contre les discriminations liées à l’orientation\r\nsexuelle et au genre.\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma\r\nLes Carmes à Orléans.\r\nEn ouverture : une sélection de courts métrages dont trois ont été\r\nréalisés dans le cadre de Jeune et homo sous le regard des autres,\r\nconcours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays\r\nissues in school (C’est élémentaire - Parler de l’homosexualité à\r\nl’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes\r\npassions que le film d’animation Le baiser de la lune en France\r\n12\r\nen 2010. La projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un\r\nlong métrage espagnol mettant en scène une histoire d’amour entre\r\nun paysan basque et un immigré péruvien, El niño pez, un surprenant\r\nroad-movie lesbien version argentine et I can’t think straight, une\r\nsavoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\nChristel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '2-revision-2', '', '', '2013-01-16 15:25:27', '2013-01-16 14:25:27', '', 2, 'http://localhost/~lemele/festival_cinema/?p=83', 0, 'revision', '', 0),
(84, 1, '2013-01-22 09:32:10', '2013-01-22 08:32:10', 'Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide. Et pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises. Meilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT ', '', 'inherit', 'open', 'open', '', '47-autosave', '', '', '2013-01-22 09:32:10', '2013-01-22 08:32:10', '', 47, 'http://localhost/~lemele/festival_cinema/?p=84', 0, 'revision', '', 0),
(85, 1, '2013-01-16 15:37:37', '2013-01-16 14:37:37', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\r\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\r\nAlors qu’elle est sur le point de se marier, Tala, une jeune\r\nPalestinienne installée à Londres, tombe amoureuse de Leyla,\r\nune jeune Britannique d’origine indienne.\r\nTout les oppose : Tala est chrétienne et affirmée, Leyla\r\nmusulmane et timide.\r\nEt pourtant, les deux femmes succombent lors d’une nuit\r\npassionnée. Mais le poids des cultures, la pression familiale\r\net le sens du devoir mettront à l’épreuve leur relation et les\r\nforceront à se découvrir elles-mêmes.\r\nCe premier long métrage de Shamim Sarif, portée par les\r\ndeux talentueuses actrices (que l’on retrouve également dans\r\nson autre film The world unseen) est un pur joyau digne des\r\ncomédies romantiques anglaises.\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '47-revision-3', '', '', '2013-01-16 15:37:37', '2013-01-16 14:37:37', '', 47, 'http://localhost/~lemele/festival_cinema/?p=85', 0, 'revision', '', 0),
(86, 1, '2013-01-21 15:51:21', '2013-01-21 14:51:21', 'Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide. Et pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises. Meilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '47-revision-4', '', '', '2013-01-21 15:51:21', '2013-01-21 14:51:21', '', 47, 'http://localhost/~lemele/festival_cinema/?p=86', 0, 'revision', '', 0),
(88, 1, '2013-01-16 15:37:38', '2013-01-16 14:37:38', 'Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge\r\ndépressif et d’une mère toxicomane, est follement amoureuse\r\nde Guayi, jeune et jolie domestique paraguayenne au service\r\nde la famille depuis l’âge de treize ans. Les deux jeunes filles\r\nprojettent de s’enfuir dans le village d’origine de Guayi, au\r\nbord du lac Ypoà où elles pourraient vivre ensemble et laisser\r\ns’exprimer sans contrainte leur désir fusionnel. Mais un\r\ndrame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi\r\nd’adapter elle-même son propre roman écrit huit ans\r\nauparavant où deux jeunes femmes aux physiques opposés et\r\nde classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous\r\nentraîne dans un Thelma et Louise lesbien à travers une\r\nArgentine inconnue et troublante.', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '43-revision-3', '', '', '2013-01-16 15:37:38', '2013-01-16 14:37:38', '', 43, 'http://localhost/~lemele/festival_cinema/?p=88', 0, 'revision', '', 0),
(89, 1, '2013-01-23 14:03:12', '2013-01-23 13:03:12', 'Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander... Considéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer... Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\n\nPrix C.I.C.A.E – Festival International de Berlin (2009) Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009) Grand prix du jury – Festival Cinehorizontes (2009)', 'ANDER', '', 'inherit', 'open', 'open', '', '40-autosave', '', '', '2013-01-23 14:03:12', '2013-01-23 13:03:12', '', 40, 'http://localhost/~lemele/festival_cinema/?p=89', 0, 'revision', '', 0),
(90, 1, '2013-01-16 15:37:38', '2013-01-16 14:37:38', 'Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi,\r\nChristian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine\r\npassée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme\r\nfamiliale. Alors qu’Arantxa doit bientôt se marier et laisser Ander\r\ns’occuper seul de leur mère, celui-ci se casse une jambe.\r\nPour l’assister dans ses tâches, sa famille embauche José, un\r\njeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et\r\nsurtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto\r\nCastón met en scène cette histoire d’amour entre deux hommes\r\nvivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir,\r\nd’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\r\ntemps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie\r\nla complexité des rapports humains d’une grande intensité, a\r\nremporté l’adhésion du public dans tous les festivals où il a été\r\nprojeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '40-revision-3', '', '', '2013-01-16 15:37:38', '2013-01-16 14:37:38', '', 40, 'http://localhost/~lemele/festival_cinema/?p=90', 0, 'revision', '', 0),
(91, 1, '2013-01-21 15:57:33', '2013-01-21 14:57:33', 'Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander... Considéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer... Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\n\r\nPrix C.I.C.A.E – Festival International de Berlin (2009) Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009) Grand prix du jury – Festival Cinehorizontes (2009)', 'ANDER', '', 'inherit', 'open', 'open', '', '40-revision-4', '', '', '2013-01-21 15:57:33', '2013-01-21 14:57:33', '', 40, 'http://localhost/~lemele/festival_cinema/?p=91', 0, 'revision', '', 0),
(92, 1, '2013-01-21 15:59:00', '2013-01-21 14:59:00', '(C’est élémentaire - Parler de l’homosexualité à l’école)\n- 1996 - Documentaire\nDurée  - Réalisation :\nPremier documentaire à traiter de l’homosexualité expliquée\n14\naux enfants dans les écoles publiques américaines, It’s\nelementary suit les interventions des enseignants dans les\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\ntour des écoles américaines et a gagné de nombreux prix.\nUn excellent support didactique à montrer à tous les élèves\net leurs professeurs lorsque l’on appartient au monde de\nl’éducation.\nCe film a subi aux Etats-Unis des attaques de la part de\nl’ultra-droite chrétienne intégriste et homophobe pour\nempêcher sa diffusion sur une chaîne télé.\nLa projection sera suivie d’un débat avec l’association\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '37-autosave', '', '', '2013-01-21 15:59:00', '2013-01-21 14:59:00', '', 37, 'http://localhost/~lemele/festival_cinema/?p=92', 0, 'revision', '', 0),
(93, 1, '2013-01-16 15:37:39', '2013-01-16 14:37:39', '(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nEtats-Unis - 1996 - Documentaire\r\nDurée 01h20 - Réalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée\r\n14\r\naux enfants dans les écoles publiques américaines, It’s\r\nelementary suit les interventions des enseignants dans les\r\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\r\ntour des écoles américaines et a gagné de nombreux prix.\r\nUn excellent support didactique à montrer à tous les élèves\r\net leurs professeurs lorsque l’on appartient au monde de\r\nl’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de\r\nl’ultra-droite chrétienne intégriste et homophobe pour\r\nempêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\r\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '37-revision-3', '', '', '2013-01-16 15:37:39', '2013-01-16 14:37:39', '', 37, 'http://localhost/~lemele/festival_cinema/?p=93', 0, 'revision', '', 0),
(94, 1, '2013-01-21 16:01:50', '2013-01-21 15:01:50', 'Comment jouer du genre en chanson ? Projection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat &amp; Scène.', 'American Boy', '', 'inherit', 'open', 'open', '', '26-autosave', '', '', '2013-01-21 16:01:50', '2013-01-21 15:01:50', '', 26, 'http://localhost/~lemele/festival_cinema/?p=94', 0, 'revision', '', 0),
(95, 1, '2013-01-16 15:37:39', '2013-01-16 14:37:39', '2008 - 4 minutes\r\nComment jouer du genre en chanson ?\r\nProjection suivie d’un débat avec un réalisateur. Un cocktail vous\r\nsera servi à l’issue de la soirée dans l’espace Délicat&amp;Scène.', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '26-revision-4', '', '', '2013-01-16 15:37:39', '2013-01-16 14:37:39', '', 26, 'http://localhost/~lemele/festival_cinema/?p=95', 0, 'revision', '', 0),
(96, 1, '2013-01-21 16:03:32', '2013-01-21 15:03:32', 'Au cœur du Brésil, dans le monde machiste des\ncowboys latinos, les héros de Cowboy Forever\nrevendiquent leur homosexualité et manient à\nmerveille le lasso, et pas seulement pour attraper\nle bétail...', 'Cowboy Forever', '', 'inherit', 'open', 'open', '', '23-autosave', '', '', '2013-01-21 16:03:32', '2013-01-21 15:03:32', '', 23, 'http://localhost/~lemele/festival_cinema/?p=96', 0, 'revision', '', 0),
(97, 1, '2013-01-16 15:37:40', '2013-01-16 14:37:40', '2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des\r\ncowboys latinos, les héros de Cowboy Forever\r\nrevendiquent leur homosexualité et manient à\r\nmerveille le lasso, et pas seulement pour attraper\r\nle bétail...', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '23-revision-6', '', '', '2013-01-16 15:37:40', '2013-01-16 14:37:40', '', 23, 'http://localhost/~lemele/festival_cinema/?p=97', 0, 'revision', '', 0),
(98, 1, '2013-01-21 16:04:51', '2013-01-21 15:04:51', '17 minutes - VOSTF\nLe corps d’un travesti décédé est préparé\npour l’enterrement par d’autres travestis.\nSon corps de femme est amené à sa famille,\nqui décide de l’enterrer comme un homme.\nUne procession de travestis se met en marche\nvers la veillée funèbre pour revendiquer\nl’identité construite de la défunte.', 'Os sapatos de Aristeu -  - Brésil - 2008', '', 'inherit', 'open', 'open', '', '20-autosave', '', '', '2013-01-21 16:04:51', '2013-01-21 15:04:51', '', 20, 'http://localhost/~lemele/festival_cinema/?p=98', 0, 'revision', '', 0),
(99, 1, '2013-01-16 15:37:40', '2013-01-16 14:37:40', '17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé\r\npour l’enterrement par d’autres travestis.\r\nSon corps de femme est amené à sa famille,\r\nqui décide de l’enterrer comme un homme.\r\nUne procession de travestis se met en marche\r\nvers la veillée funèbre pour revendiquer\r\nl’identité construite de la défunte.', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '20-revision-6', '', '', '2013-01-16 15:37:40', '2013-01-16 14:37:40', '', 20, 'http://localhost/~lemele/festival_cinema/?p=99', 0, 'revision', '', 0),
(100, 1, '2013-01-21 16:05:13', '2013-01-21 15:05:13', 'Le corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche vers la veillée funèbre pour revendiquer l’identité construite de la défunte.', 'Os sapatos de Aristeu', '', 'inherit', 'open', 'open', '', '20-revision-7', '', '', '2013-01-21 16:05:13', '2013-01-21 15:05:13', '', 20, 'http://localhost/~lemele/festival_cinema/?p=100', 0, 'revision', '', 0),
(101, 1, '2013-01-21 16:07:02', '2013-01-21 15:07:02', 'Une boulangerie banale sur une route de campagne. Derrière le comptoir, Odile, s’ennuie. Un jour, une horde de motards stoppe devant la boutique. Le passé va faire irruption dans sa vie...', 'Odile', '', 'inherit', 'open', 'open', '', '17-autosave', '', '', '2013-01-21 16:07:02', '2013-01-21 15:07:02', '', 17, 'http://localhost/~lemele/festival_cinema/?p=101', 0, 'revision', '', 0),
(102, 1, '2013-01-16 15:37:40', '2013-01-16 14:37:40', 'Une boulangerie banale sur une route de\r\ncampagne. Derrière le comptoir, Odile, s’ennuie.\r\nUn jour, une horde de motards stoppe devant\r\nla boutique. Le passé va faire irruption dans\r\nsa vie...', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '17-revision-4', '', '', '2013-01-16 15:37:40', '2013-01-16 14:37:40', '', 17, 'http://localhost/~lemele/festival_cinema/?p=102', 0, 'revision', '', 0),
(103, 1, '2013-01-21 16:08:15', '2013-01-21 15:08:15', '', 'Omar', '', 'inherit', 'open', 'open', '', '14-autosave', '', '', '2013-01-21 16:08:15', '2013-01-21 15:08:15', '', 14, 'http://localhost/~lemele/festival_cinema/?p=103', 0, 'revision', '', 0),
(104, 1, '2013-01-16 15:37:41', '2013-01-16 14:37:41', 'C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui\r\nl’aime mais où la pression est telle qu’il ne peut vraiment assouvir,\r\nni même révéler, son amour pour Arthur. Jusqu’au\r\njour où les deux jeunes hommes sont découverts.', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '14-revision-3', '', '', '2013-01-16 15:37:41', '2013-01-16 14:37:41', '', 14, 'http://localhost/~lemele/festival_cinema/?p=104', 0, 'revision', '', 0),
(105, 1, '2013-01-21 16:09:28', '2013-01-21 15:09:28', '', 'Pauline', '', 'inherit', 'open', 'open', '', '10-autosave', '', '', '2013-01-21 16:09:28', '2013-01-21 15:09:28', '', 10, 'http://localhost/~lemele/festival_cinema/?p=105', 0, 'revision', '', 0),
(106, 1, '2013-01-16 15:37:41', '2013-01-16 14:37:41', '7 minutes\r\n13\r\nC’est la mise en scène d’une jeune fille, qui se raconte\r\nface à la caméra : l’enfance joyeuse dans une petite\r\nville de province où tout le monde se connaît, la révélation\r\npublique et infamante de son homosexualité par un ami de ses\r\nparents, le silence des témoins, la douleur de la solitude, la\r\npossibilité de l’acceptation. Tout cela elle le raconte à une autre\r\nfille, à la caméra, au spectateur. Comme une confidence.', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '10-revision-4', '', '', '2013-01-16 15:37:41', '2013-01-16 14:37:41', '', 10, 'http://localhost/~lemele/festival_cinema/?p=106', 0, 'revision', '', 0),
(107, 1, '2013-01-21 16:09:34', '2013-01-21 15:09:34', 'C’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans une petite ville de province où tout le monde se connaît, la révélation publique et infamante de son homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur. Comme une confidence.', 'Pauline', '', 'inherit', 'open', 'open', '', '10-revision-5', '', '', '2013-01-21 16:09:34', '2013-01-21 15:09:34', '', 10, 'http://localhost/~lemele/festival_cinema/?p=107', 0, 'revision', '', 0),
(108, 1, '2013-01-16 15:37:42', '2013-01-16 14:37:42', '2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou\r\nvérité ? », deux jeunes garçons, Mathieu\r\net Maxime, ont pour défi de s’embrasser.\r\nLe baiser va provoquer chez eux un certain émoi.\r\nA partir de ce moment, les ados, témoins de cette scène, font des\r\nallusions plus ou moins directes à l’éventuelle homosexualité\r\nde Maxime. Une révélation surprenante va alors déstabiliser\r\nle groupe, mais surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '5-revision-4', '', '', '2013-01-16 15:37:42', '2013-01-16 14:37:42', '', 5, 'http://localhost/~lemele/festival_cinema/?p=108', 0, 'revision', '', 0),
(109, 1, '2013-01-21 15:39:59', '2013-01-21 14:39:59', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une\r\nannée sabbatique, le Festival de films gays &amp; lesbiens revient sous\r\nune nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret,\r\nl’association culturelle Ciné Mundi axée sur le cinéma indépendant,\r\nlance en 2010 le festival de films LGBT D’un bord à l’autre sur un\r\nweek-end de trois jours, format similaire aux éditions précédentes.\r\nCette année, l’événement aura pour thème la sensibilisation des\r\njeunes à la lutte contre les discriminations liées à l’orientation\r\nsexuelle et au genre.\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma\r\nLes Carmes à Orléans.\r\nEn ouverture : une sélection de courts métrages dont trois ont été\r\nréalisés dans le cadre de Jeune et homo sous le regard des autres,\r\nconcours organisé en 2009 par le Ministère de la Santé et l’INPES\r\ncontre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays\r\nissues in school (C’est élémentaire - Parler de l’homosexualité à\r\nl’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes\r\npassions que le film d’animation Le baiser de la lune en France\r\n12\r\nen 2010. La projection sera suivie d’un débat avec l’association\r\nG.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un\r\nlong métrage espagnol mettant en scène une histoire d’amour entre\r\nun paysan basque et un immigré péruvien, El niño pez, un surprenant\r\nroad-movie lesbien version argentine et I can’t think straight, une\r\nsavoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\nChristel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '2-revision-3', '', '', '2013-01-21 15:39:59', '2013-01-21 14:39:59', '', 2, 'http://localhost/~lemele/festival_cinema/?p=109', 0, 'revision', '', 0),
(110, 1, '2013-01-21 16:17:01', '2013-01-21 15:17:01', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans. En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition. Bon festival ! Christel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '2-revision-4', '', '', '2013-01-21 16:17:01', '2013-01-21 15:17:01', '', 2, 'http://localhost/~lemele/festival_cinema/?p=110', 0, 'revision', '', 0),
(111, 1, '2013-01-21 15:39:41', '2013-01-21 14:39:41', '- La Région Centre\r\n- La Mairie d''Orléans\r\n- Le cinéma des Carmes\r\n- Le Groupe Action Gay &amp; Lesbien - Loiret\r\n- Citégay\r\n- La dixième Muse\r\n- Têtu\r\n- Yagg.com\r\n- France Bleu Orléans\r\n- Bagdam Espace Lesbien ( Toulouse )\r\n- Cineffable\r\n- Le Festival Tous Courts ( Aix en Provence )\r\n- Les VidéObstinées', 'Remerciements', '', 'inherit', 'open', 'open', '', '58-revision-3', '', '', '2013-01-21 15:39:41', '2013-01-21 14:39:41', '', 58, 'http://localhost/~lemele/festival_cinema/?p=111', 0, 'revision', '', 0),
(112, 1, '2013-01-21 15:38:34', '2013-01-21 14:38:34', '- Région Centre\r\n- Orléans\r\n- Cinéma des Carmes\r\n- GAGL\r\n- Têtu\r\n- La dixième MUSE\r\n- CiteGay\r\n- Yagg.com\r\n- France Bleu', 'Partenaires', '', 'inherit', 'open', 'open', '', '56-revision-3', '', '', '2013-01-21 15:38:34', '2013-01-21 14:38:34', '', 56, 'http://localhost/~lemele/festival_cinema/?p=112', 0, 'revision', '', 0),
(113, 1, '2013-01-21 15:39:53', '2013-01-21 14:39:53', 'Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\r\nTarifs : Plein tarif : 7,50 €\r\nPass Festival : 25 € (5 séances)\r\nSoirée courts métrages : 6 € (vendredi)\r\n2 séances consécutives le samedi ou le dimanche : 12 €\r\nCartes &amp; réductions acceptées :\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.\r\nEquipe :\r\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\r\nProgrammation : Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)\r\nCommunication &amp; partenariats : Christel Guillard\r\nConception graphique : Yannis Bellair\r\nConception du site internet : rccc\r\nImpression : Prevost Offset\r\nContacts :\r\nfestival.dunbordalautre@gmail.com\r\nwww.festivaldunbordalautre.com', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '54-revision-3', '', '', '2013-01-21 15:39:53', '2013-01-21 14:39:53', '', 54, 'http://localhost/~lemele/festival_cinema/?p=113', 0, 'revision', '', 0),
(114, 1, '2013-01-21 15:38:40', '2013-01-21 14:38:40', 'Vendredi 24 septembre : 20h00\r\nSoirée d’ouverture : séance de courts métrages\r\nRencontre-débat avec un réalisateur.\r\nSamedi 25 septembre : 19h30\r\nDocumentaire :\r\nIt’s elementary, talking about gays issues in school\r\n(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nRencontre-débat avec le Groupe Action Gay &amp; Lesbien – Loiret\r\nsur les interventions en milieu scolaire.\r\nSamedi 25 septembre : 21h45\r\nFiction : Ander\r\nDimanche 26 septembre : 16h00\r\nFiction : El niño pez\r\nDimanche 26 septembre : 18h00\r\nFiction : I can’t think straight', 'Programme', '', 'inherit', 'open', 'open', '', '66-revision-3', '', '', '2013-01-21 15:38:40', '2013-01-21 14:38:40', '', 66, 'http://localhost/~lemele/festival_cinema/?p=114', 0, 'revision', '', 0),
(115, 1, '2013-01-21 16:17:07', '2013-01-21 15:17:07', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans. En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition. Bon festival ! Christel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '2-revision-5', '', '', '2013-01-21 16:17:07', '2013-01-21 15:17:07', '', 2, 'http://localhost/~lemele/festival_cinema/?p=115', 0, 'revision', '', 0),
(116, 1, '2013-01-21 16:32:23', '2013-01-21 15:32:23', 'Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre. Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans. En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie. Autre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire. Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition. Bon festival ! Christel Guillard, coordinatrice générale.', 'Edito', '', 'inherit', 'open', 'open', '', '2-autosave', '', '', '2013-01-21 16:32:23', '2013-01-21 15:32:23', '', 2, 'http://localhost/~lemele/festival_cinema/?p=116', 0, 'revision', '', 0),
(118, 1, '2013-01-21 15:57:50', '2013-01-21 14:57:50', 'Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander... Considéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer... Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\n\r\nPrix C.I.C.A.E – Festival International de Berlin (2009) Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009) Grand prix du jury – Festival Cinehorizontes (2009)', 'ANDER', '', 'inherit', 'open', 'open', '', '40-revision-5', '', '', '2013-01-21 15:57:50', '2013-01-21 14:57:50', '', 40, 'http://localhost/~lemele/festival_cinema/?p=118', 0, 'revision', '', 0),
(119, 1, '2013-01-21 15:55:24', '2013-01-21 14:55:24', 'Dans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer... Lucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer. Entre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.', 'EL NIÑO PEZ', '', 'inherit', 'open', 'open', '', '43-revision-4', '', '', '2013-01-21 15:55:24', '2013-01-21 14:55:24', '', 43, 'http://localhost/~lemele/festival_cinema/?p=119', 0, 'revision', '', 0),
(120, 1, '2013-01-21 15:52:51', '2013-01-21 14:52:51', 'Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide. Et pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises. Meilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT ', '', 'inherit', 'open', 'open', '', '47-revision-5', '', '', '2013-01-21 15:52:51', '2013-01-21 14:52:51', '', 47, 'http://localhost/~lemele/festival_cinema/?p=120', 0, 'revision', '', 0),
(121, 1, '2013-01-28 15:54:52', '2013-01-28 14:54:52', 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/cropped-baniere.png', 'cropped-baniere.png', '', 'inherit', 'closed', 'open', '', 'cropped-baniere-png', '', '', '2013-01-28 15:54:52', '2013-01-28 14:54:52', '', 0, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/cropped-baniere.png', 0, 'attachment', 'image/png', 0),
(122, 1, '2013-01-29 10:48:54', '2013-01-29 09:48:54', ' ', '', '', 'publish', 'open', 'open', '', '122', '', '', '2013-01-29 10:54:50', '2013-01-29 09:54:50', '', 0, 'http://localhost/~lemele/festival_cinema/?p=122', 4, 'nav_menu_item', '', 0),
(123, 1, '2013-01-29 10:48:54', '2013-01-29 09:48:54', ' ', '', '', 'publish', 'open', 'open', '', '123', '', '', '2013-01-29 10:54:50', '2013-01-29 09:54:50', '', 0, 'http://localhost/~lemele/festival_cinema/?p=123', 5, 'nav_menu_item', '', 0),
(124, 1, '2013-01-29 10:48:53', '2013-01-29 09:48:53', ' ', '', '', 'publish', 'open', 'open', '', '124', '', '', '2013-01-29 10:54:49', '2013-01-29 09:54:49', '', 0, 'http://localhost/~lemele/festival_cinema/?p=124', 1, 'nav_menu_item', '', 0),
(125, 1, '2013-01-29 10:48:53', '2013-01-29 09:48:53', ' ', '', '', 'publish', 'open', 'open', '', '125', '', '', '2013-01-29 10:54:49', '2013-01-29 09:54:49', '', 0, 'http://localhost/~lemele/festival_cinema/?p=125', 2, 'nav_menu_item', '', 0),
(126, 1, '2013-01-29 10:48:53', '2013-01-29 09:48:53', ' ', '', '', 'publish', 'open', 'open', '', '126', '', '', '2013-01-29 10:54:49', '2013-01-29 09:54:49', '', 0, 'http://localhost/~lemele/festival_cinema/?p=126', 3, 'nav_menu_item', '', 0),
(127, 1, '2013-01-29 10:48:54', '2013-01-29 09:48:54', ' ', '', '', 'publish', 'open', 'open', '', '127', '', '', '2013-01-29 10:54:50', '2013-01-29 09:54:50', '', 0, 'http://localhost/~lemele/festival_cinema/?p=127', 6, 'nav_menu_item', '', 0),
(130, 1, '2013-01-30 08:57:57', '2013-01-30 07:57:57', 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/fond_rouge.jpg', 'fond_rouge.jpg', '', 'inherit', 'open', 'open', '', 'fond_rouge-jpg', '', '', '2013-01-30 08:57:57', '2013-01-30 07:57:57', '', 0, 'http://localhost/~lemele/festival_cinema/wp-content/uploads/2013/01/fond_rouge.jpg', 0, 'attachment', 'image/jpeg', 0),
(131, 1, '2013-01-23 14:05:51', '2013-01-23 13:05:51', 'Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide. Et pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises. Meilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'I can''t think straight', '', 'inherit', 'open', 'open', '', '47-revision-6', '', '', '2013-01-23 14:05:51', '2013-01-23 13:05:51', '', 47, 'http://localhost/~lemele/festival_cinema/?p=131', 0, 'revision', '', 0),
(132, 1, '2013-01-23 14:05:22', '2013-01-23 13:05:22', 'Dans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer... Lucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer. Entre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.', 'El nino pez', '', 'inherit', 'open', 'open', '', '43-revision-5', '', '', '2013-01-23 14:05:22', '2013-01-23 13:05:22', '', 43, 'http://localhost/~lemele/festival_cinema/?p=132', 0, 'revision', '', 0),
(133, 1, '2013-01-23 14:04:37', '2013-01-23 13:04:37', 'Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander... Considéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer... Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\n\r\nPrix C.I.C.A.E – Festival International de Berlin (2009) Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009) Grand prix du jury – Festival Cinehorizontes (2009)', 'Ander', '', 'inherit', 'open', 'open', '', '40-revision-6', '', '', '2013-01-23 14:04:37', '2013-01-23 13:04:37', '', 40, 'http://localhost/~lemele/festival_cinema/?p=133', 0, 'revision', '', 0),
(134, 1, '2013-01-21 15:59:38', '2013-01-21 14:59:38', 'Premier documentaire à traiter de l’homosexualité expliquée 14 aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation. Ce film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé. La projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '37-revision-4', '', '', '2013-01-21 15:59:38', '2013-01-21 14:59:38', '', 37, 'http://localhost/~lemele/festival_cinema/?p=134', 0, 'revision', '', 0),
(135, 1, '2013-01-21 16:09:46', '2013-01-21 15:09:46', 'C’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans une petite ville de province où tout le monde se connaît, la révélation publique et infamante de son homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur. Comme une confidence.', 'Pauline', '', 'inherit', 'open', 'open', '', '10-revision-6', '', '', '2013-01-21 16:09:46', '2013-01-21 15:09:46', '', 10, 'http://localhost/~lemele/festival_cinema/?p=135', 0, 'revision', '', 0),
(136, 1, '2013-01-21 16:10:54', '2013-01-21 15:10:54', 'Lors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi. A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais surtout le faire réfléchir.', 'En colo', '', 'inherit', 'open', 'open', '', '5-revision-5', '', '', '2013-01-21 16:10:54', '2013-01-21 15:10:54', '', 5, 'http://localhost/~lemele/festival_cinema/?p=136', 0, 'revision', '', 0),
(137, 1, '2013-01-30 10:39:43', '2013-01-30 09:39:43', 'Lors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi.\r\n\r\n<!--more-->\r\n\r\nA partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais surtout le faire réfléchir.', 'En colo', '', 'inherit', 'open', 'open', '', '5-revision-6', '', '', '2013-01-30 10:39:43', '2013-01-30 09:39:43', '', 5, 'http://localhost/~lemele/festival_cinema/?p=137', 0, 'revision', '', 0),
(138, 1, '2013-01-30 10:36:02', '2013-01-30 09:36:02', 'Alors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide. Et pourtant, les deux femmes succombent lors d’une nuit passionnée.\r\n\r\n<!--more-->\r\n\r\nMais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes. Ce premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises. Meilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'I can''t think straight', '', 'inherit', 'open', 'open', '', '47-revision-7', '', '', '2013-01-30 10:36:02', '2013-01-30 09:36:02', '', 47, 'http://localhost/~lemele/festival_cinema/?p=138', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(139, 1, '2013-01-30 10:36:27', '2013-01-30 09:36:27', 'Dans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans.\r\n\r\n<!--more-->\r\n\r\nLes deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer... Lucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer. Entre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.', 'El nino pez', '', 'inherit', 'open', 'open', '', '43-revision-6', '', '', '2013-01-30 10:36:27', '2013-01-30 09:36:27', '', 43, 'http://localhost/~lemele/festival_cinema/?p=139', 0, 'revision', '', 0),
(140, 1, '2013-01-30 10:36:52', '2013-01-30 09:36:52', 'Au fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe.\r\n\r\n<!--more-->\r\n\r\nPour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien. Le nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander... Considéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse le temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer... Ce premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\n\r\nPrix C.I.C.A.E – Festival International de Berlin (2009) Violette d’or du meilleur film – Festival Cinespaña - Toulouse (2009) Grand prix du jury – Festival Cinehorizontes (2009)', 'Ander', '', 'inherit', 'open', 'open', '', '40-revision-7', '', '', '2013-01-30 10:36:52', '2013-01-30 09:36:52', '', 40, 'http://localhost/~lemele/festival_cinema/?p=140', 0, 'revision', '', 0),
(141, 1, '2013-01-30 10:37:11', '2013-01-30 09:37:11', 'Premier documentaire à traiter de l’homosexualité expliquée 14 aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée.\r\n\r\n<!--more-->\r\n\r\nTourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation. Ce film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé. La projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '37-revision-5', '', '', '2013-01-30 10:37:11', '2013-01-30 09:37:11', '', 37, 'http://localhost/~lemele/festival_cinema/?p=141', 0, 'revision', '', 0),
(143, 1, '2013-01-30 10:39:24', '2013-01-30 09:39:24', 'C’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans une petite ville de province où tout le monde se connaît,\r\n\r\n<!--more-->\r\n\r\nla révélation publique et infamante de son homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur. Comme une confidence.', 'Pauline', '', 'inherit', 'open', 'open', '', '10-revision-7', '', '', '2013-01-30 10:39:24', '2013-01-30 09:39:24', '', 10, 'http://localhost/~lemele/festival_cinema/?p=143', 0, 'revision', '', 0),
(144, 1, '2013-02-07 09:12:05', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-02-07 09:12:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/~lemele/festival_cinema/?p=144', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Films', 'films', 0),
(3, 'Courts métrages', 'courts-metrages', 0),
(5, 'menu_lgbt', 'menu_lgbt', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 3, 0),
(10, 3, 0),
(14, 3, 0),
(17, 3, 0),
(20, 3, 0),
(23, 3, 0),
(26, 3, 0),
(37, 2, 0),
(40, 2, 0),
(43, 2, 0),
(47, 2, 0),
(122, 5, 0),
(123, 5, 0),
(124, 5, 0),
(125, 5, 0),
(126, 5, 0),
(127, 5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 4),
(3, 3, 'category', '', 0, 7),
(5, 5, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Structure de la table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'lemele'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '144'),
(15, 1, 'wp_user-settings', 'libraryContent=browse&align=none&imgsize=medium&urlbutton=post&editor=tinymce&hidetb=1'),
(16, 1, 'wp_user-settings-time', '1358779878'),
(17, 1, 'managenav-menuscolumnshidden', 'a:3:{i:0;s:11:"link-target";i:1;s:3:"xfn";i:2;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(19, 1, 'closedpostboxes_post', 'a:0:{}'),
(20, 1, 'metaboxhidden_post', 'a:7:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:16:"commentstatusdiv";i:3;s:11:"commentsdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";i:6;s:12:"revisionsdiv";}'),
(21, 1, 'nav_menu_recently_edited', '5');

-- --------------------------------------------------------

--
-- Structure de la table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'lemele', '$P$BL4FPIybOX1lcIaZgWV5v7Rs3kqPJz/', 'lemele', 'mathieu.lemele@gmail.com', '', '2013-01-14 15:52:46', '', 0, 'lemele');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
