-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2024 at 05:17 PM
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
-- Database: `gestion`
--

-- --------------------------------------------------------

--
-- Table structure for table `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_carpeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archivos`
--

INSERT INTO `archivos` (`id`, `nombre`, `tipo`, `fecha_create`, `id_carpeta`) VALUES
(1, 'logo.jpg', 'image/jpeg', '2024-01-20 01:33:59', 1),
(2, 'indedalogo.jpg', 'image/jpeg', '2024-01-20 01:34:28', 2),
(3, '20230925_232414.jpg', 'image/jpeg', '2024-01-20 01:39:38', 1),
(4, 'permiso-conducir-venezuela-en-Espana-300x189.jpg', 'image/jpeg', '2024-01-20 01:46:22', 1),
(5, 'theres-no-place-like-localhost-51-1920x1080.jpg', 'image/jpeg', '2024-01-20 01:52:35', 1),
(6, '07c25f4db14a973c6aee9007071c6f8a.jpg', 'image/jpeg', '2024-01-20 01:59:05', 3),
(7, 'e1bee5d1c0bff16175800bc583d08f33.jpg', 'image/jpeg', '2024-01-20 01:59:50', 3),
(8, '07c25f4db14a973c6aee9007071c6f8a.jpg', 'image/jpeg', '2024-01-20 02:01:59', 2),
(9, '07c25f4db14a973c6aee9007071c6f8a.jpg', 'image/jpeg', '2024-01-20 02:07:31', 4),
(10, 'a60a7489a9b596a7c65d61e96689ab43.jpg', 'image/jpeg', '2024-01-20 02:09:21', 4),
(11, '71bf597b4d49ab06205e1841e20346fe.jpg', 'image/jpeg', '2024-01-20 02:09:56', 4),
(12, '65e7cd3eb722a29c0b1fc07cd8e36a65.jpg', 'image/jpeg', '2024-01-20 02:10:22', 4),
(13, '2.jpg', 'image/jpeg', '2024-01-20 02:11:06', 5),
(14, '6.jpg', 'image/jpeg', '2024-01-20 02:11:17', 1),
(15, '4.jpg', 'image/jpeg', '2024-01-21 08:56:47', 6),
(16, '20230925_232414.jpg', 'image/jpeg', '2024-01-21 09:42:06', 1),
(17, 'a60a7489a9b596a7c65d61e96689ab43.jpg', 'image/jpeg', '2024-01-21 10:12:23', 8),
(18, '71bf597b4d49ab06205e1841e20346fe.jpg', 'image/jpeg', '2024-01-21 10:14:16', 9),
(19, 'gaming-controller-minimal-dark-5k-zp-1920x1080.jpg', 'image/jpeg', '2024-01-21 10:58:16', 10),
(20, 'Ejercicio 7-8.jpeg', 'image/jpeg', '2024-01-22 01:58:02', 11);

-- --------------------------------------------------------

--
-- Table structure for table `carpetas`
--

CREATE TABLE `carpetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carpetas`
--

INSERT INTO `carpetas` (`id`, `nombre`, `fecha_create`, `estado`, `id_usuario`) VALUES
(1, '123', '2024-01-19 22:36:28', 1, 1),
(2, 'loco', '2024-01-19 23:29:26', 1, 1),
(3, 'PRUEBAS', '2024-01-20 01:58:28', 1, 1),
(4, 'PRUEBAS2', '2024-01-20 02:06:36', 1, 1),
(5, 'PRUEBAS3', '2024-01-20 02:10:54', 1, 1),
(6, 'PRUEBAS4', '2024-01-21 08:56:15', 1, 1),
(7, 'PRUEBAS5', '2024-01-21 09:43:36', 1, 1),
(8, 'PRUEBAS6', '2024-01-21 10:11:57', 1, 1),
(9, 'PRUEBAS7', '2024-01-21 10:13:58', 1, 1),
(10, 'PRUEBAS8', '2024-01-21 10:57:56', 1, 1),
(11, 'prueba', '2024-01-22 01:57:41', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_archivos`
--

CREATE TABLE `detalle_archivos` (
  `id` int(11) NOT NULL,
  `fecha_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `correo` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_archivo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle_archivos`
--

INSERT INTO `detalle_archivos` (`id`, `fecha_add`, `correo`, `estado`, `id_archivo`, `id_usuario`) VALUES
(1, '2024-01-22 01:52:21', 'ultimo@gmail.com', 1, 19, 1),
(2, '2024-01-22 01:52:21', 'correo@gmail.com', 1, 19, 1),
(3, '2024-01-22 01:54:20', 'ultimo@gmail.com', 1, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `clave` varchar(200) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `token`, `fecha`, `estado`, `rol`) VALUES
(1, 'INDEDA', 'DEPORTIVA', 'indedadeportiva@gmail.com', '04147661401', 'Av', NULL, '$2y$10$1G.WCHNhdijSL1fM5YQwZuHG3J5VcnzVqVccaHGw1XG0adsS/T.CW', NULL, '2024-01-08 21:18:31', 1, 1),
(2, 'nombre', 'modificado', 'ALEX@GMAIL.COM', '6777', '8566', NULL, '$2y$10$5KesAmK2susvCqCS4gIA3ual/6FPQb8prDhVlAuBe7GR23Eii4ldK', NULL, '2024-01-09 02:19:48', 1, 0),
(3, 'Luisvelys', 'Caraballo', 'lify@gmail.com', '4898887', 'desconocida', NULL, '$2y$10$1V6TqGZJdhm8yvJpHawQgOe5Xy0tPIfrx60gWIsSzof90343aGJQ.', NULL, '2024-01-08 21:44:33', 1, 1),
(4, 'Tercer', 'usuario', 'tercero@gmail.com', '3', 'Parroquia San Rafael, Sector Raul Leonis 1 Calle numero 1 casa numero 12', NULL, '$2y$10$cGNkrUCz41HeeA3G2PEvGOV8UOtp7QMtCVZ2ecviiqQYRH6Z.1Lli', NULL, '2024-01-09 03:08:14', 1, 1),
(5, 'segundo', 'usuario', 'rosaura@fernandez', '04266656677', 'dd', NULL, '$2y$10$rMIhtMqa/m2WNUgDCyW.1uQpdRZyzQ7fosysxBfvmEw1P09xMcUcy', NULL, '2024-01-09 03:05:53', 1, 2),
(6, 'finehas', 'Pagola', 'finehas@gmail.com', '023445858', 'Parroquia San Rafael, Sector Raul Leonis 1 Calle numero 1 casa numero 12', NULL, '$2y$10$m8JdpkYF6EGZd/OOlYb0QO2lKUAwdOvjhQKQutsVs7JpxzrbpMDDy', NULL, '2024-01-09 01:32:20', 1, 1),
(7, 'Cristian', 'Margarito', 'correo@gmail.com', '6778672', '8566', NULL, '$2y$10$kPa8k2W4iLXpOOdb3w85keQuUG7VSVf3fKc4snIJxEDl2YI7Zu63u', NULL, '2024-01-22 01:50:52', 1, 2),
(8, 'prueba', 'del usuario', 'ALEX1@GMAIL.COM', '67771', '8566', NULL, '$2y$10$AyeTotV10YQvYmpAPi/yg.KAlzZENrMB9IsCtyXu.p1Tu5xKNMl6y', NULL, '2024-01-09 02:22:48', 1, 2),
(9, 'ultimo', 'usuario', 'ultimo@gmail.com', '045245', 'ultimo de lo ultimo', NULL, '$2y$10$TzeXQYNYeRkcsiqMtKd6CekxcQXcPspSv7LzsLrgV5cQtT6Q.nxqy', NULL, '2024-01-09 03:09:40', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carpeta` (`id_carpeta`);

--
-- Indexes for table `carpetas`
--
ALTER TABLE `carpetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_archivo` (`id_archivo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `carpetas`
--
ALTER TABLE `carpetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`id_carpeta`) REFERENCES `carpetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carpetas`
--
ALTER TABLE `carpetas`
  ADD CONSTRAINT `carpetas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  ADD CONSTRAINT `detalle_archivos_ibfk_1` FOREIGN KEY (`id_archivo`) REFERENCES `archivos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_archivos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
