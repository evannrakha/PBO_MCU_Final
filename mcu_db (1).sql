-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 08:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mcu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `umur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `gender`, `nama`, `password`, `umur`) VALUES
(1, 'Laki-laki', 'admin1', '456', 20);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_daftarmcu`
--

CREATE TABLE `laporan_daftarmcu` (
  `id_laporan` int(11) NOT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `paket_id` int(11) NOT NULL,
  `pasien_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_daftarmcu`
--

INSERT INTO `laporan_daftarmcu` (`id_laporan`, `tanggal_daftar`, `paket_id`, `pasien_id`) VALUES
(2, '2025-01-08', 2, 1),
(4, '2025-01-09', 1, 3),
(5, '2025-01-03', 1, 2),
(6, '2025-01-05', 3, 4),
(7, '2025-01-06', 2, 2),
(8, '2025-01-09', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `paketmcu`
--

CREATE TABLE `paketmcu` (
  `id_paket` int(11) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `harga_paket` double NOT NULL,
  `jenis_pemeriksaan` varchar(255) DEFAULT NULL,
  `nama_paket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paketmcu`
--

INSERT INTO `paketmcu` (`id_paket`, `deskripsi`, `harga_paket`, `jenis_pemeriksaan`, `nama_paket`) VALUES
(1, 'Paket general check-up wellness basic Prodia ini diperuntukkan bagi orang dewasa. Harga panel ini berkisar mulai dari Rp1.800.000. Terdapat rangkaian pemeriksaan dalam panel ini yang bertujuan untuk; Cek kolestrol dan Cek Tensi', 1800000, 'Darah', 'Panel Wellness Basic'),
(2, 'Paket medical check-up wellness medium Prodia dengan rangkaian pemeriksaan yang lebih lengkap dari Panel Wellness Basic. Harganya berkisar mulai dari Rp2.800.000. Berikut tambahan rangkaian pemeriksaannya; Tes ginjal dan kolestrol', 2800000, 'Abdomen', 'Panel Wellness Medium'),
(3, 'Paket medical check-up wellness premium pria paling komplit dari seri wellness dan dikhususkan untuk pria dewasa. Harga panel ini berkisar mulai dari Rp6.100.000. Terdapat rangkaian pemeriksaan tambahan dari panel Wellness Medium; Tes protein dan Tes fung', 6100000, 'Darah', 'Panel Wellness Premium Pria'),
(11, 'Ini adalah paket4', 1234000, 'abdomen', 'Paket4');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `umur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `gender`, `nama`, `password`, `umur`) VALUES
(1, 'Laki-laki', 'Bob', '1234', 20),
(2, 'Laki-laki', 'John', '980', 19),
(3, 'Perempuan', 'Tina', '1234', 24),
(4, 'Perempuan', 'Jeni', '1234', 27),
(5, 'Laki-laki', 'Andre', '1234', 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_daftarmcu`
--
ALTER TABLE `laporan_daftarmcu`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `FK43hu9nx612f1pstayml32wksq` (`paket_id`),
  ADD KEY `FKn9bwa9r5tj7x1ghbjmisd0100` (`pasien_id`);

--
-- Indexes for table `paketmcu`
--
ALTER TABLE `paketmcu`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `laporan_daftarmcu`
--
ALTER TABLE `laporan_daftarmcu`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `paketmcu`
--
ALTER TABLE `paketmcu`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan_daftarmcu`
--
ALTER TABLE `laporan_daftarmcu`
  ADD CONSTRAINT `FK43hu9nx612f1pstayml32wksq` FOREIGN KEY (`paket_id`) REFERENCES `paketmcu` (`id_paket`),
  ADD CONSTRAINT `FKn9bwa9r5tj7x1ghbjmisd0100` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
