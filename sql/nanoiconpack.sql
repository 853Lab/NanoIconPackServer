-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-01-22 20:12:58
-- 服务器版本： 8.0.3-rc-log
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nanoiconpack`
--

-- --------------------------------------------------------

--
-- 表的结构 `donate`
--

CREATE TABLE `donate` (
  `id` char(32) NOT NULL,
  `icon_pack` varchar(64) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `money` float NOT NULL DEFAULT '0',
  `donator` varchar(64) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  `add_ip` char(15) DEFAULT NULL,
  `del_ip` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `icon_pack`
--

CREATE TABLE `icon_pack` (
  `pkg` varchar(64) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `label_en` varchar(128) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `evil` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `req`
--

CREATE TABLE `req` (
  `series` varchar(128) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `label_en` varchar(128) DEFAULT NULL,
  `pkg` varchar(128) NOT NULL,
  `launcher` varchar(192) NOT NULL,
  `sys_app` tinyint(1) DEFAULT '0',
  `icon_pack` varchar(64) NOT NULL,
  `device_id` char(32) NOT NULL,
  `device_brand` varchar(32) DEFAULT NULL,
  `device_model` varchar(32) DEFAULT NULL,
  `device_sdk` tinyint(1) DEFAULT '0',
  `TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `req_filter`
--

CREATE TABLE `req_filter` (
  `icon_pack` varchar(64) NOT NULL,
  `user` varchar(64) NOT NULL,
  `pkg` varchar(128) NOT NULL,
  `launcher` varchar(192) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `score`
--

CREATE TABLE `score` (
  `icon_pack` varchar(64) NOT NULL,
  `icon_md5` char(32) NOT NULL,
  `score` tinyint(1) DEFAULT '0',
  `device_id` char(32) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `series`
--

CREATE TABLE `series` (
  `name` varchar(128) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `label_en` varchar(128) DEFAULT NULL,
  `sys` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donate`
--
ALTER TABLE `donate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `icon_pack`
--
ALTER TABLE `icon_pack`
  ADD PRIMARY KEY (`pkg`);

--
-- Indexes for table `req`
--
ALTER TABLE `req`
  ADD PRIMARY KEY (`pkg`,`launcher`,`icon_pack`,`device_id`),
  ADD KEY `fk_series` (`series`);

--
-- Indexes for table `req_filter`
--
ALTER TABLE `req_filter`
  ADD PRIMARY KEY (`icon_pack`,`user`,`pkg`,`launcher`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`icon_pack`,`icon_md5`,`device_id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`name`);

--
-- 限制导出的表
--

--
-- 限制表 `req`
--
ALTER TABLE `req`
  ADD CONSTRAINT `fk_series` FOREIGN KEY (`series`) REFERENCES `series` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
