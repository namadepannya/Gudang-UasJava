-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2024 pada 10.30
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `id_account` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`id_account`, `fullname`, `email`, `password`) VALUES
(1, 'javabayuabi', 'lumbalumba@gmail.com', 'lumba123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` int(10) NOT NULL,
  `kd_divisi` varchar(20) NOT NULL,
  `nm_divisi` varchar(30) NOT NULL,
  `jm_divisi` int(100) NOT NULL,
  `job_divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `kd_divisi`, `nm_divisi`, `jm_divisi`, `job_divisi`) VALUES
(1, 'DV001', 'PASUKAN BESI', 100, 'KETOK BESI LAS BESI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inputbarang`
--

CREATE TABLE `inputbarang` (
  `id_barang` int(11) NOT NULL,
  `kd_barang` varchar(5) NOT NULL,
  `nm_barang` varchar(50) NOT NULL,
  `jn_barang` varchar(30) NOT NULL,
  `jm_barang` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inputbarang`
--

INSERT INTO `inputbarang` (`id_barang`, `kd_barang`, `nm_barang`, `jn_barang`, `jm_barang`) VALUES
(1, 'KD001', 'BESI', 'KERAS', 20),
(2, 'KD002', 'BAJA', 'KERAS', 12),
(3, 'KD003', 'KARET', 'LEMAS', 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `outputbarang`
--

CREATE TABLE `outputbarang` (
  `kd_barang` varchar(50) NOT NULL,
  `nm_barang` varchar(50) NOT NULL,
  `nm_pegawai` varchar(50) NOT NULL,
  `nm_divisi` varchar(50) NOT NULL,
  `id_output` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `outputbarang`
--

INSERT INTO `outputbarang` (`kd_barang`, `nm_barang`, `nm_pegawai`, `nm_divisi`, `id_output`) VALUES
('KD001', 'BESI', 'UJANG', 'PASUKAN BESI', 1),
('KD003', 'KARET', 'UJANG', 'PASUKAN BESI', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(10) NOT NULL,
  `nm_pegawai` varchar(50) NOT NULL,
  `jb_pegawai` varchar(50) NOT NULL,
  `nm_divisi` varchar(30) NOT NULL,
  `kd_pegawai` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nm_pegawai`, `jb_pegawai`, `nm_divisi`, `kd_pegawai`) VALUES
(1, 'UJANG', 'KEPALA LANE BESI', 'PASUKAN BESI', 'KP001');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`);

--
-- Indeks untuk tabel `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indeks untuk tabel `inputbarang`
--
ALTER TABLE `inputbarang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `outputbarang`
--
ALTER TABLE `outputbarang`
  ADD PRIMARY KEY (`id_output`),
  ADD KEY `id_output` (`id_output`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `inputbarang`
--
ALTER TABLE `inputbarang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `outputbarang`
--
ALTER TABLE `outputbarang`
  MODIFY `id_output` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `outputbarang`
--
ALTER TABLE `outputbarang`
  ADD CONSTRAINT `outputbarang_ibfk_1` FOREIGN KEY (`id_output`) REFERENCES `inputbarang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
