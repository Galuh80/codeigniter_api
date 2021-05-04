-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 04, 2021 at 05:08 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeigniter_api`
--
CREATE DATABASE IF NOT EXISTS `codeigniter_api` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `codeigniter_api`;

-- --------------------------------------------------------

--
-- Table structure for table `essay`
--

CREATE TABLE `essay` (
  `essay_id` int(11) NOT NULL,
  `sub_kategori_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `essay_image` varchar(255) NOT NULL,
  `nama_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `essay`
--

INSERT INTO `essay` (`essay_id`, `sub_kategori_id`, `kategori_id`, `essay_image`, `nama_soal`, `jawaban`, `created_at`) VALUES
(1, 1, 1, 'damkar.png', 'Logo apakah ini?', 'Logo Damkar', '2021-05-03 17:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_soal`
--

CREATE TABLE `kategori_soal` (
  `kategori_id` int(11) NOT NULL,
  `kode_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_soal`
--

INSERT INTO `kategori_soal` (`kategori_id`, `kode_kategori`, `nama_kategori`, `created_at`) VALUES
(1, 'LT', 'Literasi', '2021-05-03 15:43:38'),
(2, 'NM', 'Numerasi', '2021-05-04 08:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `pilgan`
--

CREATE TABLE `pilgan` (
  `pilgan_id` int(11) NOT NULL,
  `sub_kategori_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `pilgan_image` varchar(255) NOT NULL,
  `nama_soal` text NOT NULL,
  `jawaban_a` text NOT NULL,
  `jawaban_b` text NOT NULL,
  `jawaban_c` text NOT NULL,
  `jawaban_d` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilgan`
--

INSERT INTO `pilgan` (`pilgan_id`, `sub_kategori_id`, `kategori_id`, `pilgan_image`, `nama_soal`, `jawaban_a`, `jawaban_b`, `jawaban_c`, `jawaban_d`, `created_at`) VALUES
(1, 1, 1, 'blank.png', 'Logo apakah ini?', 'Logo User', 'Logo Item', 'Logo Makanan', 'Logo Kendaraan', '2021-05-03 17:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `subkategori_soal`
--

CREATE TABLE `subkategori_soal` (
  `sub_kategori_id` int(11) NOT NULL,
  `kode_sub_kategori` varchar(20) NOT NULL,
  `nama_sub_kategori` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subkategori_soal`
--

INSERT INTO `subkategori_soal` (`sub_kategori_id`, `kode_sub_kategori`, `nama_sub_kategori`, `created_at`) VALUES
(1, 'XI', 'Kelas 11', '2021-05-01 11:26:54'),
(2, 'XII', 'Kelas 11', '2021-05-03 15:07:50'),
(8, 'X', 'Kelas 10', '2021-05-04 07:20:54'),
(9, 'X', 'Kelas 10', '2021-05-04 08:05:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `essay`
--
ALTER TABLE `essay`
  ADD PRIMARY KEY (`essay_id`),
  ADD KEY `sub_kategori_id` (`sub_kategori_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `kategori_soal`
--
ALTER TABLE `kategori_soal`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `pilgan`
--
ALTER TABLE `pilgan`
  ADD PRIMARY KEY (`pilgan_id`),
  ADD KEY `sub_kategori_id` (`sub_kategori_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `subkategori_soal`
--
ALTER TABLE `subkategori_soal`
  ADD PRIMARY KEY (`sub_kategori_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `essay`
--
ALTER TABLE `essay`
  MODIFY `essay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori_soal`
--
ALTER TABLE `kategori_soal`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pilgan`
--
ALTER TABLE `pilgan`
  MODIFY `pilgan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subkategori_soal`
--
ALTER TABLE `subkategori_soal`
  MODIFY `sub_kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `essay`
--
ALTER TABLE `essay`
  ADD CONSTRAINT `essay_ibfk_1` FOREIGN KEY (`sub_kategori_id`) REFERENCES `subkategori_soal` (`sub_kategori_id`),
  ADD CONSTRAINT `essay_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_soal` (`kategori_id`);

--
-- Constraints for table `pilgan`
--
ALTER TABLE `pilgan`
  ADD CONSTRAINT `pilgan_ibfk_1` FOREIGN KEY (`sub_kategori_id`) REFERENCES `subkategori_soal` (`sub_kategori_id`),
  ADD CONSTRAINT `pilgan_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_soal` (`kategori_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
