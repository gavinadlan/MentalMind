-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 06:10 PM
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
-- Database: `db_mentalhealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `cf`
--

CREATE TABLE `cf` (
  `Keterangan` varchar(50) NOT NULL,
  `Skor_diagnosis` decimal(10,2) NOT NULL,
  `saran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cf`
--

INSERT INTO `cf` (`Keterangan`, `Skor_diagnosis`, `saran`) VALUES
('Tidak Stres', 0.00, 'Tetapkan waktu istirahat, lakukan hal-hal yang Anda nikmati, dan pertahankan hubungan sosial untuk menjaga kesejahteraan mental Anda.'),
('Stres Ringan', 0.20, 'Ambil waktu untuk berjalan sebentar, nikmati udara segar, atau lakukan meditasi singkat.'),
('Stres Sedang', 0.30, 'Tentukan waktu istirahat terjadwal, rajin berolahraga, dan prioritaskan tugas-tugas.'),
('Stres Berat', 0.40, 'Cari bantuan profesional jika diperlukan, atur batasan, dan jaga kesehatan fisik dan mental.');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa`
--

CREATE TABLE `diagnosa` (
  `Keterangan` varchar(50) NOT NULL,
  `Gejala_Stress` varchar(50) NOT NULL,
  `Nilai_Bobot` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diagnosa`
--

INSERT INTO `diagnosa` (`Keterangan`, `Gejala_Stress`, `Nilai_Bobot`) VALUES
('Tidak Stres', 'Sering Begadang', '0.20'),
('Tidak Stres', 'Sulit Bersosialisasi', '0.15'),
('Stres Ringan', 'Mudah Terganggu', '0.30'),
('Stres Ringan', 'Menyalahkan Orang Lain', '0.40'),
('Stres Ringan', 'Dorongan Status Sosial', '0.35'),
('Stres Sedang', 'Kurang Percaya Diri', '0.45'),
('Stres Sedang', 'Sulit Bersosialisasi', '0.60'),
('Stres Sedang', 'Tidak Memiliki Kesempatan', '0.50'),
('Stres Sedang', 'Sering Menyendiri', '0.60'),
('Stres Berat', 'Khawatir Akan Masa Depan', '0.80'),
('Stres Berat', 'Menjadi Sensitif atau Mudah Marah', '0.85'),
('Stres Berat', 'Pola Pikir Negatif', '0.80');

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `Kode` char(8) NOT NULL,
  `Gejala_Stress` varchar(50) NOT NULL,
  `Keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`Kode`, `Gejala_Stress`, `Keterangan`) VALUES
('GJ09', 'Dorongan Status Sosial', 'Stres Ringan'),
('GJ011', 'Khawatir akan Masa Depan', 'Stres Berat'),
('GJ04', 'Kurang Percaya Diri', 'Stres Sedang'),
('GJ05', 'Menjadi Sensitif atau Mudah Marah', 'Stres Berat'),
('GJ07', 'Menyalahkan Orang Lain', 'Stres Ringan'),
('GJ03', 'Mudah Terganggu', 'Stres Ringan'),
('GJ12', 'Pola Pikir Negatif', 'Stres Berat'),
('GJ01', 'Sering Begadang', 'Tidak Stres'),
('GJ010', 'Sering Menyendiri', 'Stres Sedang'),
('GJ02', 'Sulit Berkonsentrasi', 'Tidak Stres'),
('GJ06', 'Sulit Bersosialisasi', 'Stres Sedang'),
('GJ08', 'Tidak Memiliki Kesempatan', 'Stres Sedang');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `Skor_diagnosis` decimal(10,2) DEFAULT NULL,
  `Keterangan` varchar(50) NOT NULL,
  `Saran` text NOT NULL,
  `Penyebab` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `UserID`, `tanggal`, `Skor_diagnosis`, `Keterangan`, `Saran`, `Penyebab`) VALUES
(1, 1, '2024-01-18 16:40:39', 0.50, 'Keterangan Contoh', 'Saran Contoh', 'Penyebab Contoh'),
(2, 1, '2024-01-18 16:46:06', 0.50, 'Keterangan Contoh', 'Saran Contoh', 'Penyebab Contoh');

-- --------------------------------------------------------

--
-- Table structure for table `tingkat_stress`
--

CREATE TABLE `tingkat_stress` (
  `Kd_Stress` char(8) NOT NULL,
  `Keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tingkat_stress`
--

INSERT INTO `tingkat_stress` (`Kd_Stress`, `Keterangan`) VALUES
('S04', 'Stres Berat'),
('S02', 'Stres Ringan'),
('S03', 'Stres Sedang'),
('S01', 'Tidak Stres');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `username`, `password`, `email`) VALUES
(1, 'ipan', 'ipan12345', 'ipan@gmail.com'),
(2, 'gavin', 'gavin12345', 'gavin@yahoo.com'),
(3, 'hulk', 'hulk123', 'hulk@yahoo.com'),
(5, 'agus', 'aswan2203', 'agussetiawan@gmail.com'),
(6, 'Azmi', 'Azmi123', 'asdiokanokdfndsofk@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cf`
--
ALTER TABLE `cf`
  ADD PRIMARY KEY (`Skor_diagnosis`),
  ADD KEY `Keterangan` (`Keterangan`);

--
-- Indexes for table `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD KEY `Keterangan` (`Keterangan`),
  ADD KEY `Gejala_Stress` (`Gejala_Stress`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`Gejala_Stress`),
  ADD KEY `Keterangan` (`Keterangan`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `tingkat_stress`
--
ALTER TABLE `tingkat_stress`
  ADD PRIMARY KEY (`Keterangan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cf`
--
ALTER TABLE `cf`
  ADD CONSTRAINT `cf_ibfk_1` FOREIGN KEY (`Keterangan`) REFERENCES `tingkat_stress` (`Keterangan`);

--
-- Constraints for table `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD CONSTRAINT `diagnosa_ibfk_1` FOREIGN KEY (`Keterangan`) REFERENCES `tingkat_stress` (`Keterangan`),
  ADD CONSTRAINT `diagnosa_ibfk_2` FOREIGN KEY (`Gejala_Stress`) REFERENCES `gejala` (`Gejala_Stress`);

--
-- Constraints for table `gejala`
--
ALTER TABLE `gejala`
  ADD CONSTRAINT `gejala_ibfk_1` FOREIGN KEY (`Keterangan`) REFERENCES `tingkat_stress` (`Keterangan`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
