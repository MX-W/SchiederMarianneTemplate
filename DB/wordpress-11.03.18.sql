-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Mrz 2018 um 16:31
-- Server-Version: 10.1.16-MariaDB
-- PHP-Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `wordpress`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_ngg_album`
--

CREATE TABLE `wp_ngg_album` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `albumdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `sortorder` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_ngg_gallery`
--

CREATE TABLE `wp_ngg_gallery` (
  `gid` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` mediumtext COLLATE utf8mb4_unicode_ci,
  `title` mediumtext COLLATE utf8mb4_unicode_ci,
  `galdesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `pageid` bigint(20) NOT NULL DEFAULT '0',
  `previewpic` bigint(20) NOT NULL DEFAULT '0',
  `author` bigint(20) NOT NULL DEFAULT '0',
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_ngg_gallery`
--

INSERT INTO `wp_ngg_gallery` (`gid`, `name`, `slug`, `path`, `title`, `galdesc`, `pageid`, `previewpic`, `author`, `extras_post_id`) VALUES
(1, 'galerie1', 'Galerie1', '\\wp-content\\gallery\\galerie1', 'Galerie1', NULL, 0, 1, 1, 49);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_ngg_pictures`
--

CREATE TABLE `wp_ngg_pictures` (
  `pid` bigint(20) NOT NULL,
  `image_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint(20) NOT NULL DEFAULT '0',
  `galleryid` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `alttext` mediumtext COLLATE utf8mb4_unicode_ci,
  `imagedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exclude` tinyint(4) DEFAULT '0',
  `sortorder` bigint(20) NOT NULL DEFAULT '0',
  `meta_data` longtext COLLATE utf8mb4_unicode_ci,
  `extras_post_id` bigint(20) NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_ngg_pictures`
--

INSERT INTO `wp_ngg_pictures` (`pid`, `image_slug`, `post_id`, `galleryid`, `filename`, `description`, `alttext`, `imagedate`, `exclude`, `sortorder`, `meta_data`, `extras_post_id`, `updated_at`) VALUES
(1, 'spd-logo-2', 0, 1, 'spd-logo.png', ' ', 'spd-logo', '2018-01-08 17:34:35', 0, 0, 'eyJiYWNrdXAiOnsiZmlsZW5hbWUiOiJzcGQtbG9nby5wbmciLCJ3aWR0aCI6MTAwLCJoZWlnaHQiOjEwMCwiZ2VuZXJhdGVkIjoiMC4xMjk4MjcwMCAxNTE1NDMyODc1In0sImFwZXJ0dXJlIjpmYWxzZSwiY3JlZGl0IjpmYWxzZSwiY2FtZXJhIjpmYWxzZSwiY2FwdGlvbiI6ZmFsc2UsImNyZWF0ZWRfdGltZXN0YW1wIjpmYWxzZSwiY29weXJpZ2h0IjpmYWxzZSwiZm9jYWxfbGVuZ3RoIjpmYWxzZSwiaXNvIjpmYWxzZSwic2h1dHRlcl9zcGVlZCI6ZmFsc2UsImZsYXNoIjpmYWxzZSwidGl0bGUiOmZhbHNlLCJrZXl3b3JkcyI6ZmFsc2UsIndpZHRoIjoxMDAsImhlaWdodCI6MTAwLCJzYXZlZCI6dHJ1ZSwibWQ1IjoiNmFiOTIwN2UxZDc0ODI4NDVlMzUyOGZiNmJiNjEzNjkiLCJmdWxsIjp7IndpZHRoIjoxMDAsImhlaWdodCI6MTAwLCJtZDUiOiI2YWI5MjA3ZTFkNzQ4Mjg0NWUzNTI4ZmI2YmI2MTM2OSJ9LCJ0aHVtYm5haWwiOnsid2lkdGgiOjEwMCwiaGVpZ2h0IjoxMDAsImZpbGVuYW1lIjoidGh1bWJzX3NwZC1sb2dvLnBuZyIsImdlbmVyYXRlZCI6IjAuMTExNTIyMDAgMTUxNTQzMjg3NiJ9fQ==', 48, 1515432876);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'Wordpress Test', 'yes'),
(4, 'blogdescription', 'Eine weitere WordPress-Website', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'wendl.max@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '1', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j. F Y', 'yes'),
(24, 'time_format', 'G:i', 'yes'),
(25, 'links_updated_date_format', 'j. F Y G:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:87:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=55&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:43:"advanced-wp-columns/advanced-wp-columns.php";i:1;s:25:"menu-image/menu-image.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'SchiederMarianneTemplate', 'yes'),
(41, 'stylesheet', 'SchiederMarianneTemplate', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:29:"nextgen-gallery/nggallery.php";a:2:{i:0;s:8:"Freemius";i:1;s:22:"_uninstall_plugin_hook";}}', 'no'),
(82, 'timezone_string', 'Europe/Berlin', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '55', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '23', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:63:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:19:"NextGEN Manage tags";b:1;s:29:"NextGEN Manage others gallery";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'WPLANG', 'de_DE', 'yes'),
(95, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'sidebars_widgets', 'a:2:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(101, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'cron', 'a:4:{i:1520782146;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1520782359;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1520856487;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(111, 'theme_mods_twentyseventeen', 'a:3:{s:18:"custom_css_post_id";i:-1;s:18:"nav_menu_locations";a:1:{s:3:"top";i:2;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1515433364;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(130, 'can_compress_scripts', '1', 'no'),
(165, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(168, 'current_theme', 'Schieder Marianne Template', 'yes'),
(169, 'theme_mods_SchiederMarianneTemplate', 'a:5:{i:0;b:0;s:18:"nav_menu_locations";a:4:{s:7:"primary";i:12;s:9:"secondary";i:12;s:11:"footer-menu";i:12;s:11:"header-menu";i:2;}s:18:"custom_css_post_id";i:28;s:12:"header_image";s:13:"remove-header";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1515433331;s:4:"data";a:1:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(170, 'theme_switched', '', 'yes'),
(192, 'recently_activated', 'a:1:{s:29:"nextgen-gallery/nggallery.php";i:1515604272;}', 'yes'),
(220, 'ngg_run_freemius', '1', 'yes'),
(221, 'fs_active_plugins', 'O:8:"stdClass":0:{}', 'yes'),
(222, 'fs_debug_mode', '', 'yes'),
(223, 'fs_accounts', 'a:5:{s:11:"plugin_data";a:1:{s:15:"nextgen-gallery";a:16:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:9:"prev_path";s:74:"C:/xampp/htdocs/wordpress/wp-content/plugins/nextgen-gallery/nggallery.php";}s:17:"install_timestamp";i:1515425351;s:16:"sdk_last_version";N;s:11:"sdk_version";s:7:"1.2.1.5";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:6:"2.2.33";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:1;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:9:"localhost";s:9:"server_ip";s:3:"::1";s:9:"is_active";b:1;s:9:"timestamp";i:1515425351;s:7:"version";s:6:"2.2.33";}s:17:"was_plugin_loaded";b:1;s:15:"prev_is_premium";b:0;s:12:"is_anonymous";a:3:{s:2:"is";b:1;s:9:"timestamp";i:1515432828;s:7:"version";s:6:"2.2.33";}s:16:"uninstall_reason";O:8:"stdClass":3:{s:2:"id";s:2:"15";s:4:"info";s:0:"";s:12:"is_anonymous";b:1;}}}s:13:"file_slug_map";a:1:{s:29:"nextgen-gallery/nggallery.php";s:15:"nextgen-gallery";}s:7:"plugins";a:1:{s:15:"nextgen-gallery";O:9:"FS_Plugin":16:{s:16:"parent_plugin_id";N;s:5:"title";s:15:"NextGEN Gallery";s:4:"slug";s:15:"nextgen-gallery";s:4:"type";N;s:4:"file";s:29:"nextgen-gallery/nggallery.php";s:7:"version";s:6:"2.2.33";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:0;s:7:"is_live";b:1;s:10:"public_key";s:32:"pk_009356711cd548837f074e1ef60a4";s:10:"secret_key";N;s:2:"id";s:3:"266";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;}}s:9:"unique_id";s:32:"cf2f5f37f645bbc71560679fec9be806";s:13:"admin_notices";a:1:{s:15:"nextgen-gallery";a:0:{}}}', 'yes'),
(224, 'fs_api_cache', 'a:0:{}', 'yes'),
(226, 'widget_ngg-images', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(227, 'widget_ngg-mrssw', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(228, 'widget_slideshow', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(229, 'ngg_transient_groups', 'a:7:{s:9:"__counter";i:7;s:3:"MVC";a:2:{s:2:"id";i:2;s:7:"enabled";b:1;}s:15:"col_in_wp_posts";a:2:{s:2:"id";i:3;s:7:"enabled";b:1;}s:21:"col_in_wp_ngg_gallery";a:2:{s:2:"id";i:4;s:7:"enabled";b:1;}s:22:"col_in_wp_ngg_pictures";a:2:{s:2:"id";i:5;s:7:"enabled";b:1;}s:27:"displayed_gallery_rendering";a:2:{s:2:"id";i:6;s:7:"enabled";b:1;}s:19:"col_in_wp_ngg_album";a:2:{s:2:"id";i:7;s:7:"enabled";b:1;}}', 'yes'),
(230, 'ngg_options', 'a:72:{s:11:"gallerypath";s:19:"wp-content\\gallery\\";s:11:"wpmuCSSfile";s:13:"nggallery.css";s:9:"wpmuStyle";b:0;s:9:"wpmuRoles";b:0;s:16:"wpmuImportFolder";b:0;s:13:"wpmuZipUpload";b:0;s:14:"wpmuQuotaCheck";b:0;s:17:"datamapper_driver";s:22:"custom_post_datamapper";s:21:"gallerystorage_driver";s:25:"ngglegacy_gallery_storage";s:20:"maximum_entity_count";i:500;s:17:"router_param_slug";s:9:"nggallery";s:22:"router_param_separator";s:2:"--";s:19:"router_param_prefix";s:0:"";s:9:"deleteImg";b:1;s:9:"swfUpload";b:1;s:13:"usePermalinks";b:0;s:13:"permalinkSlug";s:9:"nggallery";s:14:"graphicLibrary";s:2:"gd";s:14:"imageMagickDir";s:15:"/usr/local/bin/";s:11:"useMediaRSS";b:0;s:18:"galleries_in_feeds";b:0;s:12:"activateTags";i:0;s:10:"appendType";s:4:"tags";s:9:"maxImages";i:7;s:14:"relatedHeading";s:24:"<h3>Related Images:</h3>";s:10:"thumbwidth";i:240;s:11:"thumbheight";i:160;s:8:"thumbfix";b:1;s:12:"thumbquality";i:100;s:8:"imgWidth";i:800;s:9:"imgHeight";i:600;s:10:"imgQuality";i:100;s:9:"imgBackup";b:1;s:13:"imgAutoResize";b:0;s:9:"galImages";s:2:"20";s:17:"galPagedGalleries";i:0;s:10:"galColumns";i:0;s:12:"galShowSlide";b:1;s:12:"galTextSlide";s:22:"[Zeige eine Slideshow]";s:14:"galTextGallery";s:22:"[Zeige Vorschaubilder]";s:12:"galShowOrder";s:7:"gallery";s:7:"galSort";s:9:"sortorder";s:10:"galSortDir";s:3:"ASC";s:10:"galNoPages";b:1;s:13:"galImgBrowser";i:0;s:12:"galHiddenImg";i:0;s:10:"galAjaxNav";i:0;s:11:"thumbEffect";s:8:"fancybox";s:9:"thumbCode";s:41:"class="ngg-fancybox" rel="%GALLERY_NAME%"";s:18:"thumbEffectContext";s:14:"nextgen_images";s:5:"wmPos";s:8:"botRight";s:6:"wmXpos";i:5;s:6:"wmYpos";i:5;s:6:"wmType";s:5:"image";s:6:"wmPath";s:0:"";s:6:"wmFont";s:9:"arial.ttf";s:6:"wmSize";i:10;s:6:"wmText";s:14:"Wordpress Test";s:7:"wmColor";s:6:"000000";s:8:"wmOpaque";s:3:"100";s:7:"slideFX";s:4:"fade";s:7:"irWidth";i:600;s:8:"irHeight";i:400;s:12:"irRotatetime";i:10;s:11:"activateCSS";i:1;s:7:"CSSfile";s:13:"nggallery.css";s:28:"always_enable_frontend_logic";b:0;s:22:"dynamic_thumbnail_slug";s:13:"nextgen-image";s:23:"dynamic_stylesheet_slug";s:12:"nextgen-dcss";s:11:"installDate";i:1515432831;s:13:"gallery_count";i:1;s:40:"gallery_created_after_reviews_introduced";b:1;}', 'yes'),
(232, 'photocrati_auto_update_admin_update_list', '', 'yes'),
(233, 'photocrati_auto_update_admin_check_date', '', 'yes'),
(234, 'ngg_db_version', '1.8.1', 'yes'),
(237, 'pope_module_list', 'a:1:{i:20;s:33:"photocrati-dynamic_stylesheet|0.4";}', 'yes'),
(278, 'category_children', 'a:0:{}', 'yes'),
(422, 'new_admin_email', 'wendl.max@gmail.com', 'yes'),
(471, 'drysc_options', 'a:9:{s:9:"fullWidth";s:3:"960";s:15:"columnStructure";s:1:"0";s:17:"responsiveSupport";s:2:"on";s:15:"smallBreakPoint";s:4:"1024";s:27:"smallBreakPointContentWidth";s:3:"80%";s:15:"wpautopDisabled";s:2:"no";s:14:"containerClass";s:0:"";s:12:"columnsClass";s:0:"";s:11:"gutterClass";s:0:"";}', 'yes'),
(534, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:19:"wendl.max@gmail.com";s:7:"version";s:5:"4.9.4";s:9:"timestamp";i:1517950204;}', 'no'),
(667, '_site_transient_timeout_browser_aaf7e8f91d7418f1955e715a4a42cc41', '1521208850', 'no'),
(668, '_site_transient_browser_aaf7e8f91d7418f1955e715a4a42cc41', 'a:10:{s:4:"name";s:5:"Opera";s:7:"version";s:12:"51.0.2830.40";s:8:"platform";s:7:"Windows";s:10:"update_url";s:22:"https://www.opera.com/";s:7:"img_src";s:42:"http://s.w.org/images/browsers/opera.png?1";s:11:"img_src_ssl";s:43:"https://s.w.org/images/browsers/opera.png?1";s:15:"current_version";s:5:"12.18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(682, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/de_DE/wordpress-4.9.4.zip";s:6:"locale";s:5:"de_DE";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/de_DE/wordpress-4.9.4.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.4";s:7:"version";s:5:"4.9.4";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1520766687;s:15:"version_checked";s:5:"4.9.4";s:12:"translations";a:0:{}}', 'no'),
(683, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1520766687;s:7:"checked";a:5:{s:43:"advanced-wp-columns/advanced-wp-columns.php";s:5:"2.0.6";s:19:"akismet/akismet.php";s:5:"4.0.3";s:9:"hello.php";s:3:"1.6";s:25:"menu-image/menu-image.php";s:5:"2.7.0";s:29:"nextgen-gallery/nggallery.php";s:6:"2.2.54";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:5:{s:43:"advanced-wp-columns/advanced-wp-columns.php";O:8:"stdClass":9:{s:2:"id";s:33:"w.org/plugins/advanced-wp-columns";s:4:"slug";s:19:"advanced-wp-columns";s:6:"plugin";s:43:"advanced-wp-columns/advanced-wp-columns.php";s:11:"new_version";s:5:"2.0.6";s:3:"url";s:50:"https://wordpress.org/plugins/advanced-wp-columns/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/advanced-wp-columns.zip";s:5:"icons";a:0:{}s:7:"banners";a:2:{s:2:"1x";s:73:"https://ps.w.org/advanced-wp-columns/assets/banner-772x250.png?rev=561624";s:7:"default";s:73:"https://ps.w.org/advanced-wp-columns/assets/banner-772x250.png?rev=561624";}s:11:"banners_rtl";a:0:{}}s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.3";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip";s:5:"icons";a:3:{s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:7:"default";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";}s:7:"banners";a:2:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";s:7:"default";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:3:{s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:7:"default";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";}s:7:"banners";a:2:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";s:7:"default";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:25:"menu-image/menu-image.php";O:8:"stdClass":9:{s:2:"id";s:24:"w.org/plugins/menu-image";s:4:"slug";s:10:"menu-image";s:6:"plugin";s:25:"menu-image/menu-image.php";s:11:"new_version";s:5:"2.7.0";s:3:"url";s:41:"https://wordpress.org/plugins/menu-image/";s:7:"package";s:53:"https://downloads.wordpress.org/plugin/menu-image.zip";s:5:"icons";a:0:{}s:7:"banners";a:2:{s:2:"1x";s:64:"https://ps.w.org/menu-image/assets/banner-772x250.png?rev=916173";s:7:"default";s:64:"https://ps.w.org/menu-image/assets/banner-772x250.png?rev=916173";}s:11:"banners_rtl";a:0:{}}s:29:"nextgen-gallery/nggallery.php";O:8:"stdClass":9:{s:2:"id";s:29:"w.org/plugins/nextgen-gallery";s:4:"slug";s:15:"nextgen-gallery";s:6:"plugin";s:29:"nextgen-gallery/nggallery.php";s:11:"new_version";s:6:"2.2.54";s:3:"url";s:46:"https://wordpress.org/plugins/nextgen-gallery/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/nextgen-gallery.2.2.54.zip";s:5:"icons";a:4:{s:2:"1x";s:68:"https://ps.w.org/nextgen-gallery/assets/icon-128x128.png?rev=1537920";s:2:"2x";s:68:"https://ps.w.org/nextgen-gallery/assets/icon-256x256.png?rev=1537920";s:3:"svg";s:60:"https://ps.w.org/nextgen-gallery/assets/icon.svg?rev=1537920";s:7:"default";s:60:"https://ps.w.org/nextgen-gallery/assets/icon.svg?rev=1537920";}s:7:"banners";a:2:{s:2:"1x";s:69:"https://ps.w.org/nextgen-gallery/assets/banner-772x250.png?rev=667493";s:7:"default";s:69:"https://ps.w.org/nextgen-gallery/assets/banner-772x250.png?rev=667493";}s:11:"banners_rtl";a:0:{}}}}', 'no'),
(684, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1520766689;s:7:"checked";a:5:{s:24:"SchiederMarianneTemplate";s:9:"0.1 alpha";s:3:"old";s:5:"0.0.1";s:13:"twentyfifteen";s:3:"1.9";s:15:"twentyseventeen";s:3:"1.4";s:13:"twentysixteen";s:3:"1.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(697, '_site_transient_timeout_browser_9b74eda0a857643c7e4cd9badba6424b', '1521247261', 'no'),
(698, '_site_transient_browser_9b74eda0a857643c7e4cd9badba6424b', 'a:10:{s:4:"name";s:5:"Opera";s:7:"version";s:12:"51.0.2830.40";s:8:"platform";s:7:"Windows";s:10:"update_url";s:22:"https://www.opera.com/";s:7:"img_src";s:42:"http://s.w.org/images/browsers/opera.png?1";s:11:"img_src_ssl";s:43:"https://s.w.org/images/browsers/opera.png?1";s:15:"current_version";s:5:"12.18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(701, '_site_transient_timeout_theme_roots', '1520768488', 'no'),
(702, '_site_transient_theme_roots', 'a:5:{s:24:"SchiederMarianneTemplate";s:7:"/themes";s:3:"old";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(61, 23, '_wp_attached_file', '2018/01/favicon-1.png'),
(62, 23, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:32;s:6:"height";i:32;s:4:"file";s:21:"2018/01/favicon-1.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(65, 25, '_wp_attached_file', '2018/01/kuppel_bundestag-g.png'),
(66, 25, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1788;s:6:"height";i:864;s:4:"file";s:30:"2018/01/kuppel_bundestag-g.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"kuppel_bundestag-g-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:30:"kuppel_bundestag-g-300x145.png";s:5:"width";i:300;s:6:"height";i:145;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:30:"kuppel_bundestag-g-768x371.png";s:5:"width";i:768;s:6:"height";i:371;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:31:"kuppel_bundestag-g-1024x495.png";s:5:"width";i:1024;s:6:"height";i:495;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(67, 25, '_wp_attachment_custom_header_last_used_SchiederMarianneTemplate', '1515340954'),
(68, 25, '_wp_attachment_is_custom_header', 'SchiederMarianneTemplate'),
(80, 34, '_wp_attached_file', '2018/01/spd-logo.png'),
(81, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:100;s:6:"height";i:100;s:4:"file";s:20:"2018/01/spd-logo.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(95, 39, 'title', 'NextGEN Basic Thumbnails'),
(96, 39, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\thumb_preview.jpg'),
(97, 39, 'default_source', 'galleries'),
(98, 39, 'view_order', '10000'),
(99, 39, 'name', 'photocrati-nextgen_basic_thumbnails'),
(100, 39, 'installed_at_version', '2.2.33'),
(101, 39, 'hidden_from_ui', ''),
(102, 39, 'hidden_from_igw', ''),
(103, 39, '__defaults_set', '1'),
(104, 39, 'filter', 'raw'),
(105, 39, 'entity_types', 'WyJpbWFnZSJd'),
(106, 39, 'aliases', 'WyJiYXNpY190aHVtYm5haWwiLCJiYXNpY190aHVtYm5haWxzIiwibmV4dGdlbl9iYXNpY190aHVtYm5haWxzIl0='),
(107, 39, 'id_field', 'ID'),
(108, 39, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJpbWFnZXNfcGVyX3BhZ2UiOiIyMCIsIm51bWJlcl9vZl9jb2x1bW5zIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJzaG93X2FsbF9pbl9saWdodGJveCI6MCwiYWpheF9wYWdpbmF0aW9uIjowLCJ1c2VfaW1hZ2Vicm93c2VyX2VmZmVjdCI6MCwidGVtcGxhdGUiOiIiLCJkaXNwbGF5X25vX2ltYWdlc19lcnJvciI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJzaG93X3NsaWRlc2hvd19saW5rIjoxLCJzbGlkZXNob3dfbGlua190ZXh0IjoiW1plaWdlIGVpbmUgU2xpZGVzaG93XSIsIm92ZXJyaWRlX3RodW1ibmFpbF9zZXR0aW5ncyI6MCwidGh1bWJuYWlsX3F1YWxpdHkiOiIxMDAiLCJ0aHVtYm5haWxfY3JvcCI6MSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfQ=='),
(109, 40, 'title', 'NextGEN Basic Slideshow'),
(110, 40, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_gallery\\static\\slideshow_preview.jpg'),
(111, 40, 'default_source', 'galleries'),
(112, 40, 'view_order', '10010'),
(113, 40, 'name', 'photocrati-nextgen_basic_slideshow'),
(114, 40, 'installed_at_version', '2.2.33'),
(115, 40, 'hidden_from_ui', ''),
(116, 40, 'hidden_from_igw', ''),
(117, 40, '__defaults_set', '1'),
(118, 40, 'filter', 'raw'),
(119, 40, 'entity_types', 'WyJpbWFnZSJd'),
(120, 40, 'aliases', 'WyJiYXNpY19zbGlkZXNob3ciLCJuZXh0Z2VuX2Jhc2ljX3NsaWRlc2hvdyJd'),
(121, 40, 'id_field', 'ID'),
(122, 40, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X3dpZHRoIjo2MDAsImdhbGxlcnlfaGVpZ2h0Ijo0MDAsInRodW1ibmFpbF93aWR0aCI6MjQwLCJ0aHVtYm5haWxfaGVpZ2h0IjoxNjAsImN5Y2xlX2ludGVydmFsIjoxMCwiY3ljbGVfZWZmZWN0IjoiZmFkZSIsImVmZmVjdF9jb2RlIjoiY2xhc3M9XCJuZ2ctZmFuY3lib3hcIiByZWw9XCIlR0FMTEVSWV9OQU1FJVwiIiwic2hvd190aHVtYm5haWxfbGluayI6MSwidGh1bWJuYWlsX2xpbmtfdGV4dCI6IltaZWlnZSBWb3JzY2hhdWJpbGRlcl0iLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0='),
(123, 41, 'title', 'NextGEN Basic ImageBrowser'),
(124, 41, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_imagebrowser\\static\\preview.jpg'),
(125, 41, 'default_source', 'galleries'),
(126, 41, 'view_order', '10020'),
(127, 41, 'name', 'photocrati-nextgen_basic_imagebrowser'),
(128, 41, 'installed_at_version', '2.2.33'),
(129, 41, 'hidden_from_ui', ''),
(130, 41, 'hidden_from_igw', ''),
(131, 41, '__defaults_set', '1'),
(132, 41, 'filter', 'raw'),
(133, 41, 'entity_types', 'WyJpbWFnZSJd'),
(134, 41, 'aliases', 'WyJiYXNpY19pbWFnZWJyb3dzZXIiLCJpbWFnZWJyb3dzZXIiLCJuZXh0Z2VuX2Jhc2ljX2ltYWdlYnJvd3NlciJd'),
(135, 41, 'id_field', 'ID'),
(136, 41, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ0ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0='),
(137, 42, 'title', 'NextGEN Basic SinglePic'),
(138, 42, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_singlepic\\static\\preview.gif'),
(139, 42, 'default_source', 'galleries'),
(140, 42, 'view_order', '10060'),
(141, 42, 'hidden_from_ui', '1'),
(142, 42, 'hidden_from_igw', '1'),
(143, 42, 'name', 'photocrati-nextgen_basic_singlepic'),
(144, 42, 'installed_at_version', '2.2.33'),
(145, 42, '__defaults_set', '1'),
(146, 42, 'filter', 'raw'),
(147, 42, 'entity_types', 'WyJpbWFnZSJd'),
(148, 42, 'aliases', 'WyJiYXNpY19zaW5nbGVwaWMiLCJzaW5nbGVwaWMiLCJuZXh0Z2VuX2Jhc2ljX3NpbmdsZXBpYyJd'),
(149, 42, 'id_field', 'ID'),
(150, 42, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJ3aWR0aCI6IiIsImhlaWdodCI6IiIsIm1vZGUiOiIiLCJkaXNwbGF5X3dhdGVybWFyayI6MCwiZGlzcGxheV9yZWZsZWN0aW9uIjowLCJmbG9hdCI6IiIsImxpbmsiOiIiLCJsaW5rX3RhcmdldCI6Il9ibGFuayIsInF1YWxpdHkiOjEwMCwiY3JvcCI6MCwidGVtcGxhdGUiOiIiLCJuZ2dfdHJpZ2dlcnNfZGlzcGxheSI6Im5ldmVyIiwiX2Vycm9ycyI6W119'),
(151, 43, 'title', 'NextGEN Basic TagCloud'),
(152, 43, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_tagcloud\\static\\preview.gif'),
(153, 43, 'default_source', 'tags'),
(154, 43, 'view_order', '10100'),
(155, 43, 'name', 'photocrati-nextgen_basic_tagcloud'),
(156, 43, 'installed_at_version', '2.2.33'),
(157, 43, 'hidden_from_ui', ''),
(158, 43, 'hidden_from_igw', ''),
(159, 43, '__defaults_set', '1'),
(160, 43, 'filter', 'raw'),
(161, 43, 'entity_types', 'WyJpbWFnZSJd'),
(162, 43, 'aliases', 'WyJiYXNpY190YWdjbG91ZCIsInRhZ2Nsb3VkIiwibmV4dGdlbl9iYXNpY190YWdjbG91ZCJd'),
(163, 43, 'id_field', 'ID'),
(164, 43, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJ5X2Rpc3BsYXlfdHlwZSI6InBob3RvY3JhdGktbmV4dGdlbl9iYXNpY190aHVtYm5haWxzIiwibnVtYmVyIjo0NSwibmdnX3RyaWdnZXJzX2Rpc3BsYXkiOiJuZXZlciIsIl9lcnJvcnMiOltdfQ=='),
(165, 44, 'title', 'NextGEN Basic Compact Album'),
(166, 44, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\compact_preview.jpg'),
(167, 44, 'default_source', 'albums'),
(168, 44, 'view_order', '10200'),
(169, 44, 'name', 'photocrati-nextgen_basic_compact_album'),
(170, 44, 'installed_at_version', '2.2.33'),
(171, 44, 'hidden_from_ui', ''),
(172, 44, 'hidden_from_igw', ''),
(173, 44, '__defaults_set', '1'),
(174, 44, 'filter', 'raw'),
(175, 44, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(176, 44, 'aliases', 'WyJiYXNpY19jb21wYWN0X2FsYnVtIiwibmV4dGdlbl9iYXNpY19hbGJ1bSIsImJhc2ljX2FsYnVtX2NvbXBhY3QiLCJjb21wYWN0X2FsYnVtIl0='),
(177, 44, 'id_field', 'ID'),
(178, 44, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjowLCJ0ZW1wbGF0ZSI6IiIsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0='),
(179, 45, 'title', 'NextGEN Basic Extended Album'),
(180, 45, 'preview_image_relpath', '\\nextgen-gallery\\products\\photocrati_nextgen\\modules\\nextgen_basic_album\\static\\extended_preview.jpg'),
(181, 45, 'default_source', 'albums'),
(182, 45, 'view_order', '10210'),
(183, 45, 'name', 'photocrati-nextgen_basic_extended_album'),
(184, 45, 'installed_at_version', '2.2.33'),
(185, 45, 'hidden_from_ui', ''),
(186, 45, 'hidden_from_igw', ''),
(187, 45, '__defaults_set', '1'),
(188, 45, 'filter', 'raw'),
(189, 45, 'entity_types', 'WyJhbGJ1bSIsImdhbGxlcnkiXQ=='),
(190, 45, 'aliases', 'WyJiYXNpY19leHRlbmRlZF9hbGJ1bSIsIm5leHRnZW5fYmFzaWNfZXh0ZW5kZWRfYWxidW0iLCJleHRlbmRlZF9hbGJ1bSJd'),
(191, 45, 'id_field', 'ID'),
(192, 45, 'settings', 'eyJ1c2VfbGlnaHRib3hfZWZmZWN0Ijp0cnVlLCJnYWxsZXJpZXNfcGVyX3BhZ2UiOjAsImVuYWJsZV9icmVhZGNydW1icyI6MSwiZGlzYWJsZV9wYWdpbmF0aW9uIjowLCJlbmFibGVfZGVzY3JpcHRpb25zIjowLCJ0ZW1wbGF0ZSI6IiIsIm9wZW5fZ2FsbGVyeV9pbl9saWdodGJveCI6MCwib3ZlcnJpZGVfdGh1bWJuYWlsX3NldHRpbmdzIjowLCJ0aHVtYm5haWxfd2lkdGgiOjI0MCwidGh1bWJuYWlsX2hlaWdodCI6MTYwLCJ0aHVtYm5haWxfcXVhbGl0eSI6MTAwLCJ0aHVtYm5haWxfY3JvcCI6dHJ1ZSwidGh1bWJuYWlsX3dhdGVybWFyayI6MCwiZ2FsbGVyeV9kaXNwbGF5X3R5cGUiOiJwaG90b2NyYXRpLW5leHRnZW5fYmFzaWNfdGh1bWJuYWlscyIsImdhbGxlcnlfZGlzcGxheV90ZW1wbGF0ZSI6IiIsIm5nZ190cmlnZ2Vyc19kaXNwbGF5IjoibmV2ZXIiLCJfZXJyb3JzIjpbXX0='),
(193, 46, '__defaults_set', '1'),
(194, 46, 'filter', 'raw'),
(195, 46, 'id_field', 'ID'),
(196, 47, '__defaults_set', '1'),
(197, 47, 'filter', 'raw'),
(198, 47, 'id_field', 'ID'),
(205, 48, '__defaults_set', '1'),
(206, 48, 'filter', 'raw'),
(207, 48, 'id_field', 'ID'),
(208, 49, '__defaults_set', '1'),
(209, 49, 'filter', 'raw'),
(210, 49, 'id_field', 'ID'),
(236, 55, '_edit_last', '1'),
(237, 55, '_edit_lock', '1520609409:1'),
(238, 57, '_edit_last', '1'),
(239, 57, '_edit_lock', '1520603989:1'),
(240, 59, '_edit_last', '1'),
(241, 59, '_edit_lock', '1515514305:1'),
(242, 61, '_edit_last', '1'),
(243, 61, '_edit_lock', '1520604111:1'),
(244, 63, '_edit_last', '1'),
(245, 63, '_edit_lock', '1520604030:1'),
(246, 65, '_edit_last', '1'),
(247, 65, '_edit_lock', '1520604065:1'),
(248, 67, '_edit_last', '1'),
(249, 67, '_edit_lock', '1518016125:1'),
(250, 69, '_menu_item_type', 'post_type'),
(251, 69, '_menu_item_menu_item_parent', '0'),
(252, 69, '_menu_item_object_id', '67'),
(253, 69, '_menu_item_object', 'page'),
(254, 69, '_menu_item_target', ''),
(255, 69, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(256, 69, '_menu_item_xfn', ''),
(257, 69, '_menu_item_url', ''),
(259, 70, '_menu_item_type', 'post_type'),
(260, 70, '_menu_item_menu_item_parent', '0'),
(261, 70, '_menu_item_object_id', '65'),
(262, 70, '_menu_item_object', 'page'),
(263, 70, '_menu_item_target', ''),
(264, 70, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(265, 70, '_menu_item_xfn', ''),
(266, 70, '_menu_item_url', ''),
(268, 71, '_menu_item_type', 'post_type'),
(269, 71, '_menu_item_menu_item_parent', '0'),
(270, 71, '_menu_item_object_id', '63'),
(271, 71, '_menu_item_object', 'page'),
(272, 71, '_menu_item_target', ''),
(273, 71, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(274, 71, '_menu_item_xfn', ''),
(275, 71, '_menu_item_url', ''),
(277, 72, '_menu_item_type', 'post_type'),
(278, 72, '_menu_item_menu_item_parent', '0'),
(279, 72, '_menu_item_object_id', '61'),
(280, 72, '_menu_item_object', 'page'),
(281, 72, '_menu_item_target', ''),
(282, 72, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(283, 72, '_menu_item_xfn', ''),
(284, 72, '_menu_item_url', ''),
(286, 73, '_menu_item_type', 'post_type'),
(287, 73, '_menu_item_menu_item_parent', '0'),
(288, 73, '_menu_item_object_id', '59'),
(289, 73, '_menu_item_object', 'page'),
(290, 73, '_menu_item_target', ''),
(291, 73, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(292, 73, '_menu_item_xfn', ''),
(293, 73, '_menu_item_url', ''),
(295, 74, '_menu_item_type', 'post_type'),
(296, 74, '_menu_item_menu_item_parent', '0'),
(297, 74, '_menu_item_object_id', '57'),
(298, 74, '_menu_item_object', 'page'),
(299, 74, '_menu_item_target', ''),
(300, 74, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(301, 74, '_menu_item_xfn', ''),
(302, 74, '_menu_item_url', ''),
(304, 75, '_menu_item_type', 'post_type'),
(305, 75, '_menu_item_menu_item_parent', '0'),
(306, 75, '_menu_item_object_id', '55'),
(307, 75, '_menu_item_object', 'page'),
(308, 75, '_menu_item_target', ''),
(309, 75, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(310, 75, '_menu_item_xfn', ''),
(311, 75, '_menu_item_url', ''),
(313, 75, '_thumbnail_id', '34'),
(314, 75, '_menu_item_image_size', 'menu-36x36'),
(315, 75, '_menu_item_image_title_position', 'after'),
(316, 74, '_menu_item_image_size', 'menu-36x36'),
(317, 74, '_menu_item_image_title_position', 'after'),
(318, 73, '_menu_item_image_size', 'menu-36x36'),
(319, 73, '_menu_item_image_title_position', 'after'),
(320, 72, '_menu_item_image_size', 'menu-36x36'),
(321, 72, '_menu_item_image_title_position', 'after'),
(322, 71, '_menu_item_image_size', 'menu-36x36'),
(323, 71, '_menu_item_image_title_position', 'after'),
(324, 70, '_menu_item_image_size', 'menu-36x36'),
(325, 70, '_menu_item_image_title_position', 'after'),
(326, 69, '_menu_item_image_size', 'menu-36x36'),
(327, 69, '_menu_item_image_title_position', 'after'),
(328, 76, '_edit_last', '1'),
(329, 76, '_edit_lock', '1515607985:1'),
(334, 76, '_thumbnail_id', '90'),
(341, 81, '_edit_last', '1'),
(342, 81, '_edit_lock', '1515521314:1'),
(349, 85, '_edit_last', '1'),
(350, 85, '_edit_lock', '1515521468:1'),
(351, 85, '_thumbnail_id', '34'),
(352, 87, '_edit_last', '1'),
(353, 87, '_edit_lock', '1515607773:1'),
(364, 90, '_wp_attached_file', '2018/01/marianne_home.jpg'),
(365, 90, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:429;s:6:"height";i:600;s:4:"file";s:25:"2018/01/marianne_home.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"marianne_home-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"marianne_home-215x300.jpg";s:5:"width";i:215;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-24x24";a:4:{s:4:"file";s:23:"marianne_home-17x24.jpg";s:5:"width";i:17;s:6:"height";i:24;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-36x36";a:4:{s:4:"file";s:23:"marianne_home-26x36.jpg";s:5:"width";i:26;s:6:"height";i:36;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-48x48";a:4:{s:4:"file";s:23:"marianne_home-34x48.jpg";s:5:"width";i:34;s:6:"height";i:48;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(372, 94, '_edit_last', '1'),
(373, 94, '_edit_lock', '1517770845:1'),
(386, 100, '_edit_last', '1'),
(387, 100, '_edit_lock', '1515607951:1'),
(408, 104, '_edit_last', '1'),
(409, 104, '_edit_lock', '1515608646:1'),
(410, 106, '_edit_last', '1'),
(411, 106, '_edit_lock', '1515608686:1'),
(434, 110, '_edit_last', '1'),
(437, 110, '_edit_lock', '1515702829:1'),
(440, 113, '_edit_last', '1'),
(441, 113, '_edit_lock', '1515703109:1'),
(442, 113, '_thumbnail_id', '34'),
(451, 117, '_menu_item_type', 'post_type'),
(452, 117, '_menu_item_menu_item_parent', '0'),
(453, 117, '_menu_item_object_id', '106'),
(454, 117, '_menu_item_object', 'page'),
(455, 117, '_menu_item_target', ''),
(456, 117, '_menu_item_classes', 'a:1:{i:0;s:9:"last-item";}'),
(457, 117, '_menu_item_xfn', ''),
(458, 117, '_menu_item_url', ''),
(460, 118, '_menu_item_type', 'post_type'),
(461, 118, '_menu_item_menu_item_parent', '0'),
(462, 118, '_menu_item_object_id', '104'),
(463, 118, '_menu_item_object', 'page'),
(464, 118, '_menu_item_target', ''),
(465, 118, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(466, 118, '_menu_item_xfn', ''),
(467, 118, '_menu_item_url', ''),
(469, 118, '_menu_item_image_size', 'menu-36x36'),
(470, 118, '_menu_item_image_title_position', 'after'),
(471, 117, '_menu_item_image_size', 'menu-36x36'),
(472, 117, '_menu_item_image_title_position', 'after'),
(473, 126, '_wp_attached_file', '2018/02/kuppel_bundestag-f.png'),
(474, 126, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2550;s:6:"height";i:1109;s:4:"file";s:30:"2018/02/kuppel_bundestag-f.png";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"kuppel_bundestag-f-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:30:"kuppel_bundestag-f-300x130.png";s:5:"width";i:300;s:6:"height";i:130;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:30:"kuppel_bundestag-f-768x334.png";s:5:"width";i:768;s:6:"height";i:334;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:31:"kuppel_bundestag-f-1024x445.png";s:5:"width";i:1024;s:6:"height";i:445;s:9:"mime-type";s:9:"image/png";}s:10:"menu-24x24";a:4:{s:4:"file";s:28:"kuppel_bundestag-f-24x10.png";s:5:"width";i:24;s:6:"height";i:10;s:9:"mime-type";s:9:"image/png";}s:10:"menu-36x36";a:4:{s:4:"file";s:28:"kuppel_bundestag-f-36x16.png";s:5:"width";i:36;s:6:"height";i:16;s:9:"mime-type";s:9:"image/png";}s:10:"menu-48x48";a:4:{s:4:"file";s:28:"kuppel_bundestag-f-48x21.png";s:5:"width";i:48;s:6:"height";i:21;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(475, 127, '_menu_item_type', 'custom'),
(476, 127, '_menu_item_menu_item_parent', '75'),
(477, 127, '_menu_item_object_id', '127'),
(478, 127, '_menu_item_object', 'custom'),
(479, 127, '_menu_item_target', ''),
(480, 127, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(481, 127, '_menu_item_xfn', ''),
(482, 127, '_menu_item_url', '/wordpress'),
(484, 127, '_menu_item_image_size', 'menu-36x36'),
(485, 127, '_menu_item_image_title_position', 'after'),
(486, 65, '_wp_trash_meta_status', 'publish'),
(487, 65, '_wp_trash_meta_time', '1520604214'),
(488, 65, '_wp_desired_post_slug', 'fotos'),
(489, 113, '_wp_trash_meta_status', 'publish'),
(490, 113, '_wp_trash_meta_time', '1520609572'),
(491, 113, '_wp_desired_post_slug', 'ich-bin-ein-testbeitrag'),
(492, 110, '_wp_trash_meta_status', 'publish'),
(493, 110, '_wp_trash_meta_time', '1520609572'),
(494, 110, '_wp_desired_post_slug', 'beispiel'),
(495, 87, '_wp_trash_meta_status', 'publish'),
(496, 87, '_wp_trash_meta_time', '1520609573'),
(497, 87, '_wp_desired_post_slug', 'ihre-bundestagsabgeordnete-fuer-die-landkreise-cham-und-schwandorf'),
(498, 76, '_wp_trash_meta_status', 'publish'),
(499, 76, '_wp_trash_meta_time', '1520609573'),
(500, 76, '_wp_desired_post_slug', 'testbeitrag'),
(501, 85, '_wp_trash_meta_status', 'publish'),
(502, 85, '_wp_trash_meta_time', '1520609574'),
(503, 85, '_wp_desired_post_slug', 'test'),
(504, 100, '_wp_trash_meta_status', 'publish'),
(505, 100, '_wp_trash_meta_time', '1520609574'),
(506, 100, '_wp_desired_post_slug', 'das-ist-ein-beitrag-mit-1-spalte'),
(507, 81, '_wp_trash_meta_status', 'publish'),
(508, 81, '_wp_trash_meta_time', '1520609574'),
(509, 81, '_wp_desired_post_slug', 'das-ist-marianne-schieder'),
(510, 94, '_wp_trash_meta_status', 'publish'),
(511, 94, '_wp_trash_meta_time', '1520609575'),
(512, 94, '_wp_desired_post_slug', 'columns-test'),
(513, 129, '_edit_lock', '1520781978:1'),
(514, 129, '_edit_last', '1'),
(515, 130, '_wp_attached_file', '2018/03/MdB_Schieder_bei_Tandem_kompr.jpg'),
(516, 130, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:681;s:4:"file";s:41:"2018/03/MdB_Schieder_bei_Tandem_kompr.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:41:"MdB_Schieder_bei_Tandem_kompr-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:41:"MdB_Schieder_bei_Tandem_kompr-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:41:"MdB_Schieder_bei_Tandem_kompr-768x511.jpg";s:5:"width";i:768;s:6:"height";i:511;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:42:"MdB_Schieder_bei_Tandem_kompr-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-24x24";a:4:{s:4:"file";s:39:"MdB_Schieder_bei_Tandem_kompr-24x16.jpg";s:5:"width";i:24;s:6:"height";i:16;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-36x36";a:4:{s:4:"file";s:39:"MdB_Schieder_bei_Tandem_kompr-36x24.jpg";s:5:"width";i:36;s:6:"height";i:24;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-48x48";a:4:{s:4:"file";s:39:"MdB_Schieder_bei_Tandem_kompr-48x32.jpg";s:5:"width";i:48;s:6:"height";i:32;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"4.2";s:6:"credit";s:0:"";s:6:"camera";s:11:"NIKON D3200";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1520439586";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"30";s:3:"iso";s:3:"900";s:13:"shutter_speed";s:17:"0.016666666666667";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(517, 129, '_thumbnail_id', '137'),
(522, 137, '_wp_attached_file', '2018/03/MdB_Schieder_bei_Tandem_kompr.jpg'),
(523, 137, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:681;s:4:"file";s:41:"2018/03/MdB_Schieder_bei_Tandem_kompr.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:41:"MdB_Schieder_bei_Tandem_kompr-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:41:"MdB_Schieder_bei_Tandem_kompr-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:41:"MdB_Schieder_bei_Tandem_kompr-768x511.jpg";s:5:"width";i:768;s:6:"height";i:511;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:42:"MdB_Schieder_bei_Tandem_kompr-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-24x24";a:4:{s:4:"file";s:39:"MdB_Schieder_bei_Tandem_kompr-24x16.jpg";s:5:"width";i:24;s:6:"height";i:16;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-36x36";a:4:{s:4:"file";s:39:"MdB_Schieder_bei_Tandem_kompr-36x24.jpg";s:5:"width";i:36;s:6:"height";i:24;s:9:"mime-type";s:10:"image/jpeg";}s:10:"menu-48x48";a:4:{s:4:"file";s:39:"MdB_Schieder_bei_Tandem_kompr-48x32.jpg";s:5:"width";i:48;s:6:"height";i:32;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"4.2";s:6:"credit";s:0:"";s:6:"camera";s:11:"NIKON D3200";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1520439586";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"30";s:3:"iso";s:3:"900";s:13:"shutter_speed";s:17:"0.016666666666667";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(23, 1, '2018-01-07 16:52:24', '2018-01-07 15:52:24', '', 'favicon', '', 'inherit', 'open', 'closed', '', 'favicon-2', '', '', '2018-01-07 16:52:24', '2018-01-07 15:52:24', '', 0, 'http://localhost/wordpress/wp-content/uploads/2018/01/favicon-1.png', 0, 'attachment', 'image/png', 0),
(25, 1, '2018-01-07 16:56:47', '2018-01-07 15:56:47', '', 'kuppel_bundestag-g', '', 'inherit', 'open', 'closed', '', 'kuppel_bundestag-g', '', '', '2018-01-07 16:56:47', '2018-01-07 15:56:47', '', 0, 'http://localhost/wordpress/wp-content/uploads/2018/01/kuppel_bundestag-g.png', 0, 'attachment', 'image/png', 0),
(28, 1, '2018-01-07 17:24:30', '2018-01-07 16:24:30', '', 'SchiederMarianneTemplate', '', 'publish', 'closed', 'closed', '', 'schiedermariannetemplate', '', '', '2018-01-07 19:59:20', '2018-01-07 18:59:20', '', 0, 'http://localhost/wordpress/schiedermariannetemplate/', 0, 'custom_css', '', 0),
(29, 1, '2018-01-07 17:24:30', '2018-01-07 16:24:30', '.menue-hauptmenue {\n	list-style: none;\n}', 'SchiederMarianneTemplate', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2018-01-07 17:24:30', '2018-01-07 16:24:30', '', 28, 'http://localhost/wordpress/28-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2018-01-07 17:25:16', '2018-01-07 16:25:16', '.menu {\n	list-style: none;\n}', 'SchiederMarianneTemplate', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2018-01-07 17:25:16', '2018-01-07 16:25:16', '', 28, 'http://localhost/wordpress/28-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2018-01-07 17:34:41', '2018-01-07 16:34:41', '.menu {\n	list-style: none;\n}\n\n.menu > .menu-item {\n	display: inline-block;\n	padding: 20px 0px 20px 0px;\n}\n\n.menu > .menu-item > a {\n	text-decoration: none;\n	color: #000;\n	padding: 0px 15px 0px 15px;\n	border-right: 1px solid black;\n}\n\n.menu > .menu-item:first-child > a {\n	border-right: 0;\n	margin-right: 150px;\n}\n\n.menu > .menu-item:last-child > a {\n	border-right: 0;\n}\n', 'SchiederMarianneTemplate', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2018-01-07 17:34:41', '2018-01-07 16:34:41', '', 28, 'http://localhost/wordpress/28-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2018-01-07 19:40:31', '2018-01-07 18:40:31', '', 'spd-logo', '', 'inherit', 'open', 'closed', '', 'spd-logo', '', '', '2018-01-10 18:24:23', '2018-01-10 17:24:23', '', 94, 'http://localhost/wordpress/wp-content/uploads/2018/01/spd-logo.png', 0, 'attachment', 'image/png', 0),
(36, 1, '2018-01-07 19:59:20', '2018-01-07 18:59:20', '', 'SchiederMarianneTemplate', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2018-01-07 19:59:20', '2018-01-07 18:59:20', '', 28, 'http://localhost/wordpress/28-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2018-01-08 18:34:33', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2018-01-08 18:34:33', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=46', 0, 'ngg_gallery', '', 0),
(47, 1, '2018-01-08 18:34:34', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2018-01-08 18:34:34', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=47', 0, 'ngg_pictures', '', 0),
(48, 1, '2018-01-08 18:34:36', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_pictures', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2018-01-08 18:34:36', '2018-01-08 17:34:36', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=48', 0, 'ngg_pictures', '', 0),
(49, 1, '2018-01-08 18:34:36', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 'Untitled ngg_gallery', '', 'draft', 'closed', 'closed', '', 'mixin_nextgen_table_extras', '', '', '2018-01-08 18:34:36', '0000-00-00 00:00:00', 'eyJpZF9maWVsZCI6IklEIiwiX19kZWZhdWx0c19zZXQiOnRydWV9', 0, 'http://localhost/wordpress/?p=49', 0, 'ngg_gallery', '', 0),
(55, 1, '2018-01-08 19:40:21', '2018-01-08 18:40:21', 'Das ist die Startseite', 'Startseite', '', 'publish', 'closed', 'closed', '', 'startseite', '', '', '2018-01-08 19:40:21', '2018-01-08 18:40:21', '', 0, 'http://localhost/wordpress/?page_id=55', 0, 'page', '', 0),
(56, 1, '2018-01-08 19:40:21', '2018-01-08 18:40:21', 'Das ist die Startseite', 'Startseite', '', 'inherit', 'closed', 'closed', '', '55-revision-v1', '', '', '2018-01-08 19:40:21', '2018-01-08 18:40:21', '', 55, 'http://localhost/wordpress/55-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2018-01-08 19:40:49', '2018-01-08 18:40:49', 'Das ist die Aktuelles Seite', 'Aktuelles', '', 'publish', 'closed', 'closed', '', 'aktuelles', '', '', '2018-01-08 19:40:49', '2018-01-08 18:40:49', '', 0, 'http://localhost/wordpress/?page_id=57', 0, 'page', '', 0),
(58, 1, '2018-01-08 19:40:49', '2018-01-08 18:40:49', 'Das ist die Aktuelles Seite', 'Aktuelles', '', 'inherit', 'closed', 'closed', '', '57-revision-v1', '', '', '2018-01-08 19:40:49', '2018-01-08 18:40:49', '', 57, 'http://localhost/wordpress/57-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2018-01-08 19:41:04', '2018-01-08 18:41:04', 'Das ist die Zur Person Seite.', 'Zur Person', '', 'publish', 'closed', 'closed', '', 'zur-person', '', '', '2018-01-08 19:41:04', '2018-01-08 18:41:04', '', 0, 'http://localhost/wordpress/?page_id=59', 0, 'page', '', 0),
(60, 1, '2018-01-08 19:41:04', '2018-01-08 18:41:04', 'Das ist die Zur Person Seite.', 'Zur Person', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2018-01-08 19:41:04', '2018-01-08 18:41:04', '', 59, 'http://localhost/wordpress/59-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2018-01-08 19:41:19', '2018-01-08 18:41:19', 'Das ist die Wahlkreis Seite.', 'Wahlkreis', '', 'publish', 'closed', 'closed', '', 'wahlkreis', '', '', '2018-01-08 19:41:19', '2018-01-08 18:41:19', '', 0, 'http://localhost/wordpress/?page_id=61', 0, 'page', '', 0),
(62, 1, '2018-01-08 19:41:19', '2018-01-08 18:41:19', 'Das ist die Wahlkreis Seite.', 'Wahlkreis', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2018-01-08 19:41:19', '2018-01-08 18:41:19', '', 61, 'http://localhost/wordpress/61-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2018-01-08 19:41:38', '2018-01-08 18:41:38', 'Das ist die Bundestag Seite.', 'Bundestag', '', 'publish', 'closed', 'closed', '', 'bundestag', '', '', '2018-01-08 19:41:38', '2018-01-08 18:41:38', '', 0, 'http://localhost/wordpress/?page_id=63', 0, 'page', '', 0),
(64, 1, '2018-01-08 19:41:38', '2018-01-08 18:41:38', 'Das ist die Bundestag Seite.', 'Bundestag', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2018-01-08 19:41:38', '2018-01-08 18:41:38', '', 63, 'http://localhost/wordpress/63-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2018-01-08 19:41:58', '2018-01-08 18:41:58', 'Das ist die Fotoseite.', 'Fotos', '', 'trash', 'closed', 'closed', '', 'fotos__trashed', '', '', '2018-03-09 15:03:34', '2018-03-09 14:03:34', '', 0, 'http://localhost/wordpress/?page_id=65', 0, 'page', '', 0),
(66, 1, '2018-01-08 19:41:58', '2018-01-08 18:41:58', 'Das ist die Fotoseite.', 'Fotos', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2018-01-08 19:41:58', '2018-01-08 18:41:58', '', 65, 'http://localhost/wordpress/65-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2018-01-08 19:42:14', '2018-01-08 18:42:14', 'Das ist die Kontaktseite.', 'Kontakt', '', 'publish', 'closed', 'closed', '', 'kontakt', '', '', '2018-01-08 19:42:14', '2018-01-08 18:42:14', '', 0, 'http://localhost/wordpress/?page_id=67', 0, 'page', '', 0),
(68, 1, '2018-01-08 19:42:14', '2018-01-08 18:42:14', 'Das ist die Kontaktseite.', 'Kontakt', '', 'inherit', 'closed', 'closed', '', '67-revision-v1', '', '', '2018-01-08 19:42:14', '2018-01-08 18:42:14', '', 67, 'http://localhost/wordpress/67-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2018-01-08 19:43:30', '2018-01-08 18:43:30', '', 'Service', '', 'publish', 'closed', 'closed', '', '69', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://localhost/wordpress/?p=69', 8, 'nav_menu_item', '', 0),
(70, 1, '2018-01-08 19:43:30', '2018-01-08 18:43:30', ' ', '', '', 'publish', 'closed', 'closed', '', '70', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://localhost/wordpress/?p=70', 7, 'nav_menu_item', '', 0),
(71, 1, '2018-01-08 19:43:29', '2018-01-08 18:43:29', ' ', '', '', 'publish', 'closed', 'closed', '', '71', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://localhost/wordpress/?p=71', 6, 'nav_menu_item', '', 0),
(72, 1, '2018-01-08 19:43:28', '2018-01-08 18:43:28', ' ', '', '', 'publish', 'closed', 'closed', '', '72', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://localhost/wordpress/?p=72', 5, 'nav_menu_item', '', 0),
(73, 1, '2018-01-08 19:43:28', '2018-01-08 18:43:28', ' ', '', '', 'publish', 'closed', 'closed', '', '73', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://localhost/wordpress/?p=73', 4, 'nav_menu_item', '', 0),
(74, 1, '2018-01-08 19:43:27', '2018-01-08 18:43:27', ' ', '', '', 'publish', 'closed', 'closed', '', '74', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://localhost/wordpress/?p=74', 3, 'nav_menu_item', '', 0),
(75, 1, '2018-01-08 19:43:27', '2018-01-08 18:43:27', '', 'Marianne Schieder, MdB', '', 'publish', 'closed', 'closed', '', 'marianne-schieder-mdb', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://localhost/wordpress/?p=75', 1, 'nav_menu_item', '', 0),
(76, 1, '2018-01-10 15:38:34', '2018-01-10 14:38:34', 'velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum', 'Das ist ein Testbeitrag mit einem Bild', '', 'trash', 'open', 'open', '', 'testbeitrag__trashed', '', '', '2018-03-09 16:32:53', '2018-03-09 15:32:53', '', 0, 'http://localhost/wordpress/?p=76', 0, 'post', '', 0),
(77, 1, '2018-01-09 17:38:34', '2018-01-09 16:38:34', 'Dies ist ein Test, ob mein System funktioniert.', 'Testbeitrag', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2018-01-09 17:38:34', '2018-01-09 16:38:34', '', 76, 'http://localhost/wordpress/76-revision-v1/', 0, 'revision', '', 0),
(79, 1, '2018-01-09 17:55:42', '2018-01-09 16:55:42', 'velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse in est ante in nibh mauris cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna molestie at', 'Testbeitrag', '', 'inherit', 'closed', 'closed', '', '76-autosave-v1', '', '', '2018-01-09 17:55:42', '2018-01-09 16:55:42', '', 76, 'http://localhost/wordpress/76-autosave-v1/', 0, 'revision', '', 0),
(80, 1, '2018-01-09 17:55:46', '2018-01-09 16:55:46', 'velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse in est ante in nibh mauris cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna molestie at', 'Testbeitrag', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2018-01-09 17:55:46', '2018-01-09 16:55:46', '', 76, 'http://localhost/wordpress/76-revision-v1/', 0, 'revision', '', 0),
(81, 1, '2018-01-09 18:12:51', '2018-01-09 17:12:51', 'Für Sie im Bundestag aus dem Landkreis Schwandorf.', 'Das ist Marianne Schieder', '', 'trash', 'open', 'open', '', 'das-ist-marianne-schieder__trashed', '', '', '2018-03-09 16:32:55', '2018-03-09 15:32:55', '', 0, 'http://localhost/wordpress/?p=81', 0, 'post', '', 0),
(82, 1, '2018-01-09 18:12:51', '2018-01-09 17:12:51', 'Für Sie im Bundestag für den Landkreis Schwandorf.', 'Das ist Marianne Schieder', '', 'inherit', 'closed', 'closed', '', '81-revision-v1', '', '', '2018-01-09 18:12:51', '2018-01-09 17:12:51', '', 81, 'http://localhost/wordpress/81-revision-v1/', 0, 'revision', '', 0),
(83, 1, '2018-01-09 19:07:27', '2018-01-09 18:07:27', 'Für Sie im Bundestag aus dem Landkreis Schwandorf.', 'Das ist Marianne Schieder', '', 'inherit', 'closed', 'closed', '', '81-autosave-v1', '', '', '2018-01-09 19:07:27', '2018-01-09 18:07:27', '', 81, 'http://localhost/wordpress/81-autosave-v1/', 0, 'revision', '', 0),
(84, 1, '2018-01-09 19:07:30', '2018-01-09 18:07:30', 'Für Sie im Bundestag aus dem Landkreis Schwandorf.', 'Das ist Marianne Schieder', '', 'inherit', 'closed', 'closed', '', '81-revision-v1', '', '', '2018-01-09 19:07:30', '2018-01-09 18:07:30', '', 81, 'http://localhost/wordpress/81-revision-v1/', 0, 'revision', '', 0),
(85, 1, '2018-01-09 19:11:35', '2018-01-09 18:11:35', 'eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus', 'Test', '', 'trash', 'open', 'open', '', 'test__trashed', '', '', '2018-03-09 16:32:54', '2018-03-09 15:32:54', '', 0, 'http://localhost/wordpress/?p=85', 0, 'post', '', 0),
(86, 1, '2018-01-09 19:11:35', '2018-01-09 18:11:35', 'eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus', 'Test', '', 'inherit', 'closed', 'closed', '', '85-revision-v1', '', '', '2018-01-09 19:11:35', '2018-01-09 18:11:35', '', 85, 'http://localhost/wordpress/85-revision-v1/', 0, 'revision', '', 0),
(87, 1, '2018-01-10 16:19:00', '2018-01-10 15:19:00', '', 'Ihre Bundestagsabgeordnete für die Landkreise Cham und Schwandorf.', '', 'trash', 'open', 'open', '', 'ihre-bundestagsabgeordnete-fuer-die-landkreise-cham-und-schwandorf__trashed', '', '', '2018-03-09 16:32:53', '2018-03-09 15:32:53', '', 0, 'http://wdl-net.dd-dns.de/wordpress/?p=87', 0, 'post', '', 0),
(88, 1, '2018-01-10 16:19:00', '2018-01-10 15:19:00', '', 'Ihre Bundestagsabgeordnete für die Landkreise Cham und Schwandorf.', '', 'inherit', 'closed', 'closed', '', '87-revision-v1', '', '', '2018-01-10 16:19:00', '2018-01-10 15:19:00', '', 87, 'http://wdl-net.dd-dns.de/wordpress/87-revision-v1/', 0, 'revision', '', 0),
(89, 1, '2018-01-10 16:33:08', '2018-01-10 15:33:08', 'velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum&nbsp;', 'Das ist ein Testbeitrag mit einem Bild', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2018-01-10 16:33:08', '2018-01-10 15:33:08', '', 76, 'http://localhost/wordpress/76-revision-v1/', 0, 'revision', '', 0),
(90, 1, '2018-01-10 16:59:53', '2018-01-10 15:59:53', '', 'marianne_home', '', 'inherit', 'open', 'closed', '', 'marianne_home', '', '', '2018-01-10 16:59:53', '2018-01-10 15:59:53', '', 76, 'http://localhost/wordpress/wp-content/uploads/2018/01/marianne_home.jpg', 0, 'attachment', 'image/jpeg', 0),
(91, 1, '2018-01-10 18:02:23', '2018-01-10 17:02:23', '<strong>Beispielbeitrag</strong>\r\n\r\nvelit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum&nbsp;', 'Das ist ein Testbeitrag mit einem Bild', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2018-01-10 18:02:23', '2018-01-10 17:02:23', '', 76, 'http://localhost/wordpress/76-revision-v1/', 0, 'revision', '', 0),
(92, 1, '2018-01-10 18:03:15', '2018-01-10 17:03:15', 'velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum&nbsp;', 'Das ist ein Testbeitrag mit einem Bild', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2018-01-10 18:03:15', '2018-01-10 17:03:15', '', 76, 'http://localhost/wordpress/76-revision-v1/', 0, 'revision', '', 0),
(94, 1, '2018-01-08 18:13:14', '2018-01-08 17:13:14', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="15" data-csendpoint="472.5" data-cswidth="47.7%" data-csid="1b27fa1f-3b8a-d882-9998-1a03415d3560">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="487.5" data-csendpoint="945" data-cswidth="47.7%" data-csid="0e354c2b-940c-98e8-9375-b338040c53e1">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n&nbsp;', 'Das ist ein Beitrag mit 2 Spalten', '', 'trash', 'open', 'open', '', 'columns-test__trashed', '', '', '2018-03-09 16:32:55', '2018-03-09 15:32:55', '', 0, 'http://localhost/wordpress/?p=94', 0, 'post', '', 0),
(95, 1, '2018-01-10 18:13:14', '2018-01-10 17:13:14', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="15" data-csendpoint="472.5" data-cswidth="47.7%" data-csid="8085ee7a-b0ac-80a8-834b-423aa149832e">\r\n\r\nHallo Test\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="487.5" data-csendpoint="945" data-cswidth="47.7%" data-csid="6800558c-3b1a-e580-b0ab-c9c38fd9f59c">\r\n\r\nHallo Test\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n&nbsp;', 'Columns Test', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2018-01-10 18:13:14', '2018-01-10 17:13:14', '', 94, 'http://localhost/wordpress/94-revision-v1/', 0, 'revision', '', 0),
(96, 1, '2018-01-10 18:23:08', '2018-01-10 17:23:08', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="15" data-csendpoint="472.5" data-cswidth="47.7%" data-csid="1b27fa1f-3b8a-d882-9998-1a03415d3560">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="487.5" data-csendpoint="945" data-cswidth="47.7%" data-csid="0e354c2b-940c-98e8-9375-b338040c53e1">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n&nbsp;', 'Columns Test', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2018-01-10 18:23:08', '2018-01-10 17:23:08', '', 94, 'http://localhost/wordpress/94-revision-v1/', 0, 'revision', '', 0),
(97, 1, '2018-01-10 18:23:27', '2018-01-10 17:23:27', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="15" data-csendpoint="472.5" data-cswidth="47.7%" data-csid="1b27fa1f-3b8a-d882-9998-1a03415d3560">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="487.5" data-csendpoint="945" data-cswidth="47.7%" data-csid="0e354c2b-940c-98e8-9375-b338040c53e1">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n&nbsp;', 'Das ist ein Beitrag mit 2 Spalten', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2018-01-10 18:23:27', '2018-01-10 17:23:27', '', 94, 'http://localhost/wordpress/94-revision-v1/', 0, 'revision', '', 0),
(98, 1, '2018-01-10 18:24:28', '2018-01-10 17:24:28', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="15" data-csendpoint="472.5" data-cswidth="47.7%" data-csid="1b27fa1f-3b8a-d882-9998-1a03415d3560">\r\n\r\n<img class="alignnone size-full wp-image-34" src="http://localhost/wordpress/wp-content/uploads/2018/01/spd-logo.png" alt="" width="100" height="100" />quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="487.5" data-csendpoint="945" data-cswidth="47.7%" data-csid="0e354c2b-940c-98e8-9375-b338040c53e1">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n&nbsp;', 'Das ist ein Beitrag mit 2 Spalten', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2018-01-10 18:24:28', '2018-01-10 17:24:28', '', 94, 'http://localhost/wordpress/94-revision-v1/', 0, 'revision', '', 0),
(99, 1, '2018-01-10 18:24:46', '2018-01-10 17:24:46', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="15" data-csendpoint="472.5" data-cswidth="47.7%" data-csid="1b27fa1f-3b8a-d882-9998-1a03415d3560">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 47.7%;" data-csstartpoint="487.5" data-csendpoint="945" data-cswidth="47.7%" data-csid="0e354c2b-940c-98e8-9375-b338040c53e1">\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n&nbsp;', 'Das ist ein Beitrag mit 2 Spalten', '', 'inherit', 'closed', 'closed', '', '94-revision-v1', '', '', '2018-01-10 18:24:46', '2018-01-10 17:24:46', '', 94, 'http://localhost/wordpress/94-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2018-01-09 18:37:57', '2018-01-09 17:37:57', 'quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\ndiam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit', 'Das ist ein Beitrag mit 1 Spalte', '', 'trash', 'open', 'open', '', 'das-ist-ein-beitrag-mit-1-spalte__trashed', '', '', '2018-03-09 16:32:54', '2018-03-09 15:32:54', '', 0, 'http://localhost/wordpress/?p=100', 0, 'post', '', 0),
(101, 1, '2018-01-10 18:37:57', '2018-01-10 17:37:57', 'quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit', 'Das ist ein Beitrag mit 1 Spalte', '', 'inherit', 'closed', 'closed', '', '100-revision-v1', '', '', '2018-01-10 18:37:57', '2018-01-10 17:37:57', '', 100, 'http://localhost/wordpress/100-revision-v1/', 0, 'revision', '', 0),
(102, 1, '2018-01-10 18:38:26', '2018-01-10 17:38:26', 'quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit\r\n\r\ndiam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla\r\n\r\nquis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit', 'Das ist ein Beitrag mit 1 Spalte', '', 'inherit', 'closed', 'closed', '', '100-revision-v1', '', '', '2018-01-10 18:38:26', '2018-01-10 17:38:26', '', 100, 'http://localhost/wordpress/100-revision-v1/', 0, 'revision', '', 0),
(103, 1, '2018-01-10 18:50:12', '2018-01-10 17:50:12', 'velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum', 'Das ist ein Testbeitrag mit einem Bild', '', 'inherit', 'closed', 'closed', '', '76-revision-v1', '', '', '2018-01-10 18:50:12', '2018-01-10 17:50:12', '', 76, 'http://localhost/wordpress/76-revision-v1/', 0, 'revision', '', 0),
(104, 1, '2018-01-10 19:26:27', '2018-01-10 18:26:27', '', 'Impressum', '', 'publish', 'closed', 'closed', '', 'impressum', '', '', '2018-01-10 19:26:27', '2018-01-10 18:26:27', '', 0, 'http://localhost/wordpress/?page_id=104', 0, 'page', '', 0),
(105, 1, '2018-01-10 19:26:27', '2018-01-10 18:26:27', '', 'Impressum', '', 'inherit', 'closed', 'closed', '', '104-revision-v1', '', '', '2018-01-10 19:26:27', '2018-01-10 18:26:27', '', 104, 'http://localhost/wordpress/104-revision-v1/', 0, 'revision', '', 0),
(106, 1, '2018-01-10 19:27:00', '2018-01-10 18:27:00', '', 'Datenschutzerklärung', '', 'publish', 'closed', 'closed', '', 'datenschutzerklaerung', '', '', '2018-01-10 19:27:00', '2018-01-10 18:27:00', '', 0, 'http://localhost/wordpress/?page_id=106', 0, 'page', '', 0),
(107, 1, '2018-01-10 19:27:00', '2018-01-10 18:27:00', '', 'Datenschutzerklärung', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-01-10 19:27:00', '2018-01-10 18:27:00', '', 106, 'http://localhost/wordpress/106-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(110, 1, '2018-01-10 21:46:43', '2018-01-10 20:46:43', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 46.2%;" data-csstartpoint="15" data-csendpoint="458.5" data-cswidth="46.2%" data-csid="61fc9ea5-1ac3-335e-9d71-f2eee442b2d0">\r\n<p style="text-align: justify;">egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse in est ante in nibh mauris cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna</p>\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 4.27%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 46.4%;" data-csstartpoint="499.5" data-csendpoint="945" data-cswidth="46.4%" data-csid="43e7d643-79b0-b3d9-858b-74a873f3f78e">\r\n<p style="text-align: justify;">egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse in est ante in nibh mauris cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna</p>\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n<br class="nc" />Test', 'Beispiel', '', 'trash', 'open', 'open', '', 'beispiel__trashed', '', '', '2018-03-09 16:32:52', '2018-03-09 15:32:52', '', 0, 'http://localhost/wordpress/?p=110', 0, 'post', '', 0),
(111, 1, '2018-01-10 21:46:43', '2018-01-10 20:46:43', 'Test', 'Beispiel', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2018-01-10 21:46:43', '2018-01-10 20:46:43', '', 110, 'http://localhost/wordpress/110-revision-v1/', 0, 'revision', '', 0),
(112, 1, '2018-01-11 21:31:53', '2018-01-11 20:31:53', '<div class="csRow">\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 46.2%;" data-csstartpoint="15" data-csendpoint="458.5" data-cswidth="46.2%" data-csid="61fc9ea5-1ac3-335e-9d71-f2eee442b2d0">\r\n<p style="text-align: justify;">egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse in est ante in nibh mauris cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna</p>\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 4.27%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div class="csColumn" style="margin: 0px; padding: 0px; float: left; width: 46.4%;" data-csstartpoint="499.5" data-csendpoint="945" data-cswidth="46.4%" data-csid="43e7d643-79b0-b3d9-858b-74a873f3f78e">\r\n<p style="text-align: justify;">egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim sit amet venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla ut morbi tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in ante metus dictum at tempor commodo ullamcorper a lacus vestibulum sed arcu non odio euismod lacinia at quis risus sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet nisl purus in mollis nunc sed id semper risus in hendrerit gravida rutrum quisque non tellus orci ac auctor augue mauris augue neque gravida in fermentum et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim suspendisse in est ante in nibh mauris cursus mattis molestie a iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui accumsan sit amet nulla facilisi morbi tempus iaculis urna id volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean et tortor at risus viverra adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis posuere morbi leo urna</p>\r\n\r\n</div>\r\n<div class="csColumnGap" style="margin: 0px; padding: 0px; float: left; width: 1.56%;"><img style="border: none;" src="http://localhost/wordpress/wp-content/plugins/advanced-wp-columns/assets/js/plugins/views/img/1x1-pixel.png" /></div>\r\n<div style="clear: both; float: none; display: block; visibility: hidden; width: 0px; font-size: 0px; line-height: 0;"></div>\r\n</div>\r\n<br class="nc" />Test', 'Beispiel', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2018-01-11 21:31:53', '2018-01-11 20:31:53', '', 110, 'http://localhost/wordpress/110-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2018-01-11 21:36:50', '2018-01-11 20:36:50', '<img class="alignnone size-full wp-image-34" src="http://localhost/wordpress/wp-content/uploads/2018/01/spd-logo.png" alt="" width="100" height="100" />      Hallo', 'Ich bin ein Testbeitrag', '', 'trash', 'open', 'open', '', 'ich-bin-ein-testbeitrag__trashed', '', '', '2018-03-09 16:32:52', '2018-03-09 15:32:52', '', 0, 'http://localhost/wordpress/?p=113', 0, 'post', '', 0),
(114, 1, '2018-01-11 21:36:50', '2018-01-11 20:36:50', 'Hallo', 'Ich bin ein Testbeitrag', '', 'inherit', 'closed', 'closed', '', '113-revision-v1', '', '', '2018-01-11 21:36:50', '2018-01-11 20:36:50', '', 113, 'http://localhost/wordpress/113-revision-v1/', 0, 'revision', '', 0),
(115, 1, '2018-01-11 21:39:43', '2018-01-11 20:39:43', '<img class="alignnone size-full wp-image-34" src="http://localhost/wordpress/wp-content/uploads/2018/01/spd-logo.png" alt="" width="100" height="100" />Hallo', 'Ich bin ein Testbeitrag', '', 'inherit', 'closed', 'closed', '', '113-revision-v1', '', '', '2018-01-11 21:39:43', '2018-01-11 20:39:43', '', 113, 'http://localhost/wordpress/113-revision-v1/', 0, 'revision', '', 0),
(116, 1, '2018-01-11 21:40:45', '2018-01-11 20:40:45', '<img class="alignnone size-full wp-image-34" src="http://localhost/wordpress/wp-content/uploads/2018/01/spd-logo.png" alt="" width="100" height="100" />      Hallo', 'Ich bin ein Testbeitrag', '', 'inherit', 'closed', 'closed', '', '113-revision-v1', '', '', '2018-01-11 21:40:45', '2018-01-11 20:40:45', '', 113, 'http://localhost/wordpress/113-revision-v1/', 0, 'revision', '', 0),
(117, 1, '2018-01-11 22:49:13', '2018-01-11 21:49:13', ' ', '', '', 'publish', 'closed', 'closed', '', '117', '', '', '2018-01-11 23:34:35', '2018-01-11 22:34:35', '', 0, 'http://localhost/wordpress/?p=117', 2, 'nav_menu_item', '', 0),
(118, 1, '2018-01-11 22:49:13', '2018-01-11 21:49:13', ' ', '', '', 'publish', 'closed', 'closed', '', '118', '', '', '2018-01-11 23:34:34', '2018-01-11 22:34:34', '', 0, 'http://localhost/wordpress/?p=118', 1, 'nav_menu_item', '', 0),
(126, 1, '2018-02-06 22:07:47', '2018-02-06 21:07:47', '', 'kuppel_bundestag-f', '', 'inherit', 'open', 'closed', '', 'kuppel_bundestag-f', '', '', '2018-02-06 22:07:47', '2018-02-06 21:07:47', '', 0, 'http://localhost/wordpress/wp-content/uploads/2018/02/kuppel_bundestag-f.png', 0, 'attachment', 'image/png', 0),
(127, 1, '2018-02-06 22:22:53', '2018-02-06 21:22:53', '', 'Parlamentarische Geschäftsführerin der SPD-Bundestagsfraktion', '', 'publish', 'closed', 'closed', '', 'parlamentarische-geschaeftsfuehrerin-der-spd-bundestagsfraktion', '', '', '2018-02-07 00:49:28', '2018-02-06 23:49:28', '', 0, 'http://scheissverein.dd-dns.de/wordpress/?p=127', 2, 'nav_menu_item', '', 0),
(128, 1, '2018-03-09 15:00:50', '0000-00-00 00:00:00', '', 'Automatisch gespeicherter Entwurf', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-03-09 15:00:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=128', 0, 'post', '', 0),
(129, 1, '2018-03-09 16:35:43', '2018-03-09 15:35:43', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.\r\n\r\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\r\n\r\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\r\n\r\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\r\n\r\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', '', 'publish', 'open', 'open', '', 'mdb-marianne-schieder-informierte-sich-ueber-die-arbeit-von-tandem', '', '', '2018-03-11 12:20:22', '2018-03-11 11:20:22', '', 0, 'http://localhost/wordpress/?p=129', 0, 'post', '', 0),
(130, 1, '2018-03-09 16:35:11', '2018-03-09 15:35:11', '', 'MdB_Schieder_bei_Tandem_kompr', '', 'inherit', 'open', 'closed', '', 'mdb_schieder_bei_tandem_kompr', '', '', '2018-03-09 16:35:11', '2018-03-09 15:35:11', '', 129, 'http://localhost/wordpress/wp-content/uploads/2018/03/MdB_Schieder_bei_Tandem_kompr.jpg', 0, 'attachment', 'image/jpeg', 0),
(131, 1, '2018-03-09 16:35:43', '2018-03-09 15:35:43', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.\r\n\r\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\r\n\r\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\r\n\r\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\r\n\r\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', '', 'inherit', 'closed', 'closed', '', '129-revision-v1', '', '', '2018-03-09 16:35:43', '2018-03-09 15:35:43', '', 129, 'http://localhost/wordpress/129-revision-v1/', 0, 'revision', '', 0),
(132, 1, '2018-03-10 00:38:32', '2018-03-09 23:38:32', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.<!--more-->\n\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\n\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\n\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\n\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.', 'inherit', 'closed', 'closed', '', '129-autosave-v1', '', '', '2018-03-10 00:38:32', '2018-03-09 23:38:32', '', 129, 'http://localhost/wordpress/129-autosave-v1/', 0, 'revision', '', 0),
(133, 1, '2018-03-09 20:33:47', '2018-03-09 19:33:47', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.<!--more-->\r\n\r\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\r\n\r\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\r\n\r\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\r\n\r\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', '', 'inherit', 'closed', 'closed', '', '129-revision-v1', '', '', '2018-03-09 20:33:47', '2018-03-09 19:33:47', '', 129, 'http://localhost/wordpress/129-revision-v1/', 0, 'revision', '', 0),
(134, 1, '2018-03-09 20:37:00', '2018-03-09 19:37:00', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.\r\n\r\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\r\n\r\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\r\n\r\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\r\n\r\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.', 'inherit', 'closed', 'closed', '', '129-revision-v1', '', '', '2018-03-09 20:37:00', '2018-03-09 19:37:00', '', 129, 'http://localhost/wordpress/129-revision-v1/', 0, 'revision', '', 0),
(135, 1, '2018-03-10 00:38:34', '2018-03-09 23:38:34', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.<!--more-->\r\n\r\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\r\n\r\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\r\n\r\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\r\n\r\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.', 'inherit', 'closed', 'closed', '', '129-revision-v1', '', '', '2018-03-10 00:38:34', '2018-03-09 23:38:34', '', 129, 'http://localhost/wordpress/129-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(136, 1, '2018-03-10 00:58:48', '2018-03-09 23:58:48', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.\r\n\r\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\r\n\r\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\r\n\r\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\r\n\r\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.', 'inherit', 'closed', 'closed', '', '129-revision-v1', '', '', '2018-03-10 00:58:48', '2018-03-09 23:58:48', '', 129, 'http://localhost/wordpress/129-revision-v1/', 0, 'revision', '', 0),
(137, 1, '2018-03-10 01:41:45', '2018-03-10 00:41:45', '', 'MdB_Schieder_bei_Tandem_kompr', '', 'inherit', 'open', 'closed', '', 'mdb_schieder_bei_tandem_kompr-2', '', '', '2018-03-10 01:41:45', '2018-03-10 00:41:45', '', 129, 'http://localhost/wordpress/wp-content/uploads/2018/03/MdB_Schieder_bei_Tandem_kompr.jpg', 0, 'attachment', 'image/jpeg', 0),
(138, 1, '2018-03-11 12:20:22', '2018-03-11 11:20:22', 'Am Mittwoch, 7. März 2018, besuchte die Bundestagsabgeordnete Marianne Schieder das Koordinierungszentrum Deutsch-Tschechischer Jugendaustausch – Tandem in Regensburg. Einer ihrer Schwerpunkte ist die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze; entsprechend begrüßte die Sozialdemokratin das von Tandem geplante Drogenpräventionsprojekt „Besser bez / Lepší ohne“. Großes Interesse zeigte sie auch an dem Tandem-Schwerpunkt „Gemeinsam erinnern für eine gemeinsame Zukunft“ gerade in Hinblick auf das 50jährige Jubiläum des Prager Frühling im Jahr 2018 sowie an „Weltoffen leben“, einer gemeinsamen Strategie der Fach- und Förderstellen der Europäischen und Internationalen Jugendarbeit der Bundesrepublik Deutschland zur Stärkung des Jugendaustauschs.\r\n\r\nAufmerksam verfolgte die Parlamentarierin die Ausführungen von Thomas Rudner, Leiter Tandem Regensburg, bezüglich der Initiative „Weltoffen leben“. Die Strategie sieht eine starke Ausweitung der Aktivitäten vor, um mehr Teilnehmende und weitere Zielgruppen zu erreichen, um Informations- und Beratungsangebote auszubauen, Partnerschaften und Kooperationen zu erweitern, um die Zusammenarbeit von formaler und non-formaler Bildung im Austausch zu intensivieren. MdB Schieder begrüßte die Strategie. Sie fände es toll, dass sich die Fach- und Förderstellen gemeinsam für die Stärkung des Jugendaustauschs einsetzen würden und betonte: „Da müssen wir dran bleiben!“\r\n\r\nKathrin Freier-Maldoner, pädagogische Mitarbeiterin bei Tandem Regensburg, richtete den Fokus dann auf ein Thema, das derzeit im deutsch-tschechischen Kontext bearbeitet wird. In den Jahren 2017-19 befassen sich die Koordinierungszentren Deutsch-Tschechischer Jugendaustausch mit transnationaler Erinnerungsarbeit und politischer Bildung unter der Überschrift „Gemeinsam erinnern für eine gemeinsame Zukunft“ (<a href="http://www.gemeinsam-erinnern.eu/" target="_blank" rel="noopener">www.gemeinsam-erinnern.eu</a>). „Dass hier großes Potential für die grenzüberschreitende Zusammenarbeit liegt, zeigt das rege Interesse an den Veranstaltungen zum Schwerpunktthema sowie an den beantragten Maßnahmen“, betonte Thomas Rudner, Leiter von Tandem Regensburg. Aktuell bereiten die Koordinierungszentren das Fachforum „Gemeinsam erinnern für eine gemeinsame Zukunft“ für ehrenamtliche und hauptberufliche Fachkräfte der Jugendarbeit und Lehrer/-innen aller Schularten im Schloss Fürstenried, München, vor (19.-21.04.2018). Die Bundestagsabgeordnete begrüßte die Aktivitäten von Tandem auf diesem Feld, gerade vor dem Hintergrund nationalistischer Tendenzen.\r\n\r\nGerne würde Tandem noch in diesem Jahr einen weiteren Themenschwerpunkt aufgreifen: grenzüberschreitende Drogenprävention – ein Feld, in dem bereits gute Vorarbeit geleistet wurde. Tandem hat in den vergangenen Jahren Akteure der Drogenprävention beidseits der Grenze an einen Tisch geholt, um zu erarbeiten, wie Drogenprävention deutsch-tschechisch aussehen könnte. Innerhalb des geplanten bayerisch-tschechischen Projekts „Besser bez / Lepší  ohne“, das, wenn alles gut läuft, im September 2018 gestartet werden kann, soll mithilfe von so genannten „Präventionslotsen“ die Präventionsarbeit in beiden Ländern unterstützt werden. Nachdem die Bekämpfung der Drogenkriminalität an der deutsch-tschechischen Grenze eines ihrer Schwerpunkte ist, versprach die Parlamentarische Geschäftsführerin der SPD-Fraktion Unterstützung, vor allem Dingen vor folgendem Hintergrund: „Wir müssen darauf achten, dass das, was aufgebaut worden ist, nicht versandet!“\r\n\r\nAbschließend formulierte die Sozialdemokratin, die unter anderem Mitglied ist in der Deutsch-Tschechischen Parlamentariergruppe und im Beirat des Deutsch-Tschechischen Gesprächsforums, den Wunsch, in Kontakt zu bleiben und über wichtige Entwicklungen in der bilateralen, aber auch in der internationalen Jugendarbeit informiert zu werden.', 'MdB Marianne Schieder informierte sich über die Arbeit von Tandem', '', 'inherit', 'closed', 'closed', '', '129-revision-v1', '', '', '2018-03-11 12:20:22', '2018-03-11 11:20:22', '', 129, 'http://localhost/wordpress/129-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Startseite', 'startseite', 0),
(2, 'Hauptmenü', 'hauptmenue', 0),
(3, 'Zur Person', 'zur-person', 0),
(4, 'Aktuelles', 'aktuelles', 0),
(5, 'Wahlkreis', 'wahlkreis', 0),
(6, 'Bundestag', 'bundestag', 0),
(7, 'Fotos', 'fotos', 0),
(8, 'Kontakt', 'kontakt', 0),
(9, 'post-format-status', 'post-format-status', 0),
(10, 'post-format-image', 'post-format-image', 0),
(11, 'post-format-aside', 'post-format-aside', 0),
(12, 'Footernavigation', 'footernavigation', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(69, 2, 0),
(70, 2, 0),
(71, 2, 0),
(72, 2, 0),
(73, 2, 0),
(74, 2, 0),
(75, 2, 0),
(76, 1, 0),
(76, 10, 0),
(81, 6, 0),
(81, 9, 0),
(85, 4, 0),
(85, 10, 0),
(87, 1, 0),
(87, 9, 0),
(94, 1, 0),
(94, 11, 0),
(100, 1, 0),
(100, 11, 0),
(110, 1, 0),
(110, 11, 0),
(113, 6, 0),
(113, 11, 0),
(117, 12, 0),
(118, 12, 0),
(127, 2, 0),
(129, 4, 0),
(129, 10, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', 'Alle Beiträge der Startseite sollten hier angelegt werden.', 0, 0),
(2, 2, 'nav_menu', '', 0, 8),
(3, 3, 'category', 'Alle Beiträge für die Zur Person Seite sollten hier angelegt werden.', 0, 0),
(4, 4, 'category', 'Alle Beiträger der Seite Aktuelles sollten hier angelegt werden.', 0, 1),
(5, 5, 'category', 'Alle Beiträger der Seite Wahlkreis sollten hier angelegt werden.', 0, 0),
(6, 6, 'category', 'Alle Beiträger der Seite Bundestag sollten hier angelegt werden.', 0, 0),
(7, 7, 'category', 'Alle Beiträger der Seite Fotos sollten hier angelegt werden.', 0, 0),
(8, 8, 'category', 'Alle Beiträger der Seite Kontakt sollten hier angelegt werden.', 0, 0),
(9, 9, 'post_format', '', 0, 0),
(10, 10, 'post_format', '', 0, 1),
(11, 11, 'post_format', '', 0, 0),
(12, 12, 'nav_menu', '', 0, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'root'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'false'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '128'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:2:"::";}'),
(19, 1, 'managenav-menuscolumnshidden', 'a:3:{i:0;s:11:"link-target";i:1;s:3:"xfn";i:2;s:11:"description";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";}'),
(21, 1, 'nav_menu_recently_edited', '2'),
(22, 1, 'session_tokens', 'a:3:{s:64:"05c21fb62c415cf8ed37ef32ef23ed91d743f5cd01fb271ac65b2a6e8254ceab";a:4:{s:10:"expiration";i:1520776849;s:2:"ip";s:3:"::1";s:2:"ua";s:132:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.168 Safari/537.36 OPR/51.0.2830.40";s:5:"login";i:1520604049;}s:64:"95d1ac55c48004d096810153ac4a375682b4a48fd6f167e21a7e841424692882";a:4:{s:10:"expiration";i:1520811474;s:2:"ip";s:3:"::1";s:2:"ua";s:132:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.168 Safari/537.36 OPR/51.0.2830.40";s:5:"login";i:1520638674;}s:64:"5e6ca05d44f2824a115fb9ac28c83cccf9df0d9e0df9cb4b3e53bee44fcc6d80";a:4:{s:10:"expiration";i:1520815259;s:2:"ip";s:3:"::1";s:2:"ua";s:127:"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.168 Safari/537.36 OPR/51.0.2830.40";s:5:"login";i:1520642459;}}'),
(23, 1, 'wp_user-settings', 'libraryContent=browse&editor=tinymce&hidetb=1&editor_plain_text_paste_warning=1'),
(24, 1, 'wp_user-settings-time', '1515605874'),
(25, 2, 'nickname', 'felix'),
(26, 2, 'first_name', 'Felix'),
(27, 2, 'last_name', 'Engelhard'),
(28, 2, 'description', ''),
(29, 2, 'rich_editing', 'true'),
(30, 2, 'syntax_highlighting', 'true'),
(31, 2, 'comment_shortcuts', 'false'),
(32, 2, 'admin_color', 'fresh'),
(33, 2, 'use_ssl', '0'),
(34, 2, 'show_admin_bar_front', 'true'),
(35, 2, 'locale', ''),
(36, 2, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(37, 2, 'wp_user_level', '10'),
(38, 2, 'dismissed_wp_pointers', ''),
(40, 2, 'wp_dashboard_quick_press_last_post_id', '120'),
(41, 2, 'community-events-location', 'a:1:{s:2:"ip";s:12:"193.17.236.0";}'),
(42, 2, 'wp_user-settings', 'hidetb=1'),
(43, 2, 'wp_user-settings-time', '1516701035'),
(44, 1, 'closedpostboxes_post', 'a:0:{}'),
(45, 1, 'metaboxhidden_post', 'a:5:{i:0;s:13:"trackbacksdiv";i:1;s:10:"postcustom";i:2;s:16:"commentstatusdiv";i:3;s:7:"slugdiv";i:4;s:9:"authordiv";}'),
(46, 1, 'meta-box-order_post', 'a:3:{s:4:"side";s:61:"submitdiv,formatdiv,categorydiv,tagsdiv-post_tag,postimagediv";s:6:"normal";s:96:"revisionsdiv,postexcerpt,trackbacksdiv,postcustom,commentstatusdiv,commentsdiv,slugdiv,authordiv";s:8:"advanced";s:0:"";}'),
(47, 1, 'screen_layout_post', '2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'root', '$P$B5uY6d4MPxw1WTAWO1/A0RC16FymiQ0', 'root', 'wendl.max@gmail.com', '', '2017-12-28 15:28:57', '', 0, 'root'),
(2, 'felix', '$P$B13CKaOZJngSldjn6jXHS81Rd1iM4z.', 'felix', 'marianne.schieder.ma01@bundestag.de', '', '2018-01-23 09:43:47', '1516700629:$P$BHCKxfxPxE8gb3p6kVMEOupElJDloi1', 0, 'Felix Engelhard');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indizes für die Tabelle `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indizes für die Tabelle `wp_ngg_album`
--
ALTER TABLE `wp_ngg_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indizes für die Tabelle `wp_ngg_gallery`
--
ALTER TABLE `wp_ngg_gallery`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indizes für die Tabelle `wp_ngg_pictures`
--
ALTER TABLE `wp_ngg_pictures`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `extras_post_id_key` (`extras_post_id`);

--
-- Indizes für die Tabelle `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indizes für die Tabelle `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indizes für die Tabelle `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indizes für die Tabelle `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indizes für die Tabelle `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indizes für die Tabelle `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `wp_ngg_album`
--
ALTER TABLE `wp_ngg_album`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `wp_ngg_gallery`
--
ALTER TABLE `wp_ngg_gallery`
  MODIFY `gid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `wp_ngg_pictures`
--
ALTER TABLE `wp_ngg_pictures`
  MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=703;
--
-- AUTO_INCREMENT für Tabelle `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=524;
--
-- AUTO_INCREMENT für Tabelle `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT für Tabelle `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT für Tabelle `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT für Tabelle `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
