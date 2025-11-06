-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2025 at 04:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pa_donde`
--

-- --------------------------------------------------------

--
-- Table structure for table `parada`
--

CREATE TABLE `parada` (
  `id_parada` int(11) NOT NULL,
  `nombre_parada` varchar(100) NOT NULL,
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(10,7) DEFAULT NULL,
  `referencia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parada`
--

INSERT INTO `parada` (`id_parada`, `nombre_parada`, `latitud`, `longitud`, `referencia`) VALUES
(8, 'Centro', 19.4326000, -99.1332000, 'Frente al parque principal'),
(9, 'Universidad', 19.4401000, -99.1256000, 'Entrada principal'),
(10, 'Terminal', 19.4255000, -99.1500000, 'Puerta norte'),
(11, 'Hospital', 19.4300000, -99.1400000, 'Zona de urgencias'),
(12, 'Plaza Norte', 19.4500000, -99.1200000, 'Junto a la gasolinera'),
(13, 'Bellavista', 19.4100000, -99.1600000, 'Cerca del mercado los pinatas');

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `nombre_permiso` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `nombre_permiso`, `descripcion`) VALUES
(1, 'admin', 'Acceso total al sistema'),
(2, 'usuario', 'Acceso est?ndar a las rutas y reportes'),
(3, 'moderador', 'Puede revisar y resolver reportes');

-- --------------------------------------------------------

--
-- Table structure for table `recuperar_contrasena`
--

CREATE TABLE `recuperar_contrasena` (
  `id_recuperacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `fecha_solicitud` datetime DEFAULT current_timestamp(),
  `fecha_expiracion` datetime DEFAULT NULL,
  `usado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reporte`
--

CREATE TABLE `reporte` (
  `id_reporte` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha_reporte` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','revisado','resuelto') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reporte`
--

INSERT INTO `reporte` (`id_reporte`, `id_usuario`, `id_ruta`, `descripcion`, `fecha_reporte`, `estado`) VALUES
(11, 1, 1, 'El autobus tardo mas de 20 minutos en llegar.', '2025-11-04 10:12:52', 'pendiente'),
(12, 2, 2, 'No pasan muchos colectivos de la ruta .', '2025-11-04 10:12:52', 'revisado'),
(13, 3, 3, 'El conductor fue muy amable.', '2025-11-04 10:12:52', 'resuelto'),
(14, 4, 1, 'El camion iba muy lleno.', '2025-11-04 10:12:52', 'pendiente'),
(15, 5, 2, 'El horario no coincide con la app.', '2025-11-04 10:12:52', 'pendiente');

-- --------------------------------------------------------

--
-- Table structure for table `ruta`
--

CREATE TABLE `ruta` (
  `id_ruta` int(11) NOT NULL,
  `nombre_ruta` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `origen` varchar(100) NOT NULL,
  `destino` varchar(100) NOT NULL,
  `horario_inicio` time DEFAULT NULL,
  `horario_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruta`
--

INSERT INTO `ruta` (`id_ruta`, `nombre_ruta`, `descripcion`, `origen`, `destino`, `horario_inicio`, `horario_fin`) VALUES
(1, 'Bellavista', 'Recorrido del Centro a la Universidad', 'Centro', 'Universidad', '06:00:00', '22:00:00'),
(2, 'Villas del sol', 'Recorrido de la Terminal al Hospital', 'Terminal', 'Hospital', '05:30:00', '21:30:00'),
(3, 'Cristo Rey', 'Conecta el Norte con el Sur de la ciudad', 'Norte', 'Sur', '05:00:00', '23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ruta_parada`
--

CREATE TABLE `ruta_parada` (
  `id_ruta` int(11) NOT NULL,
  `id_parada` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `contrasena`, `telefono`, `fecha_registro`) VALUES
(1, 'Juan P?rez', 'juan.perez@example.com', '1234', '9841321357', '2025-11-04 09:38:15'),
(2, 'Fabian Vidal', 'Fabian.vidal@gmail.com', 'Vidal1611', '9841976204', '2025-11-04 09:38:15'),
(3, 'Marco Pina', 'Marco.Pina@gmail.com', 'Pina1711', '9842175847', '2025-11-04 09:38:15'),
(4, 'Cesar Torres', 'cesar.torres@gmail.com', 'Cesartores1811', '9982386329', '2025-11-04 09:38:15'),
(5, 'Joel Chin', 'joel.chin@gmail.com', 'JoelChin1911', '9841988614', '2025-11-04 09:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario_rutas_favoritas`
--

CREATE TABLE `usuario_rutas_favoritas` (
  `id_usuario` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `fecha_agregado` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario_rutas_favoritas`
--

INSERT INTO `usuario_rutas_favoritas` (`id_usuario`, `id_ruta`, `fecha_agregado`) VALUES
(1, 1, '2025-11-04 09:58:37'),
(1, 3, '2025-11-04 09:58:37'),
(2, 2, '2025-11-04 09:58:37'),
(3, 1, '2025-11-04 09:58:37'),
(4, 3, '2025-11-04 09:58:37'),
(5, 2, '2025-11-04 09:58:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parada`
--
ALTER TABLE `parada`
  ADD PRIMARY KEY (`id_parada`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`),
  ADD UNIQUE KEY `nombre_permiso` (`nombre_permiso`);

--
-- Indexes for table `recuperar_contrasena`
--
ALTER TABLE `recuperar_contrasena`
  ADD PRIMARY KEY (`id_recuperacion`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indexes for table `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id_ruta`);

--
-- Indexes for table `ruta_parada`
--
ALTER TABLE `ruta_parada`
  ADD PRIMARY KEY (`id_ruta`,`id_parada`),
  ADD KEY `id_parada` (`id_parada`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indexes for table `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`id_usuario`,`id_permiso`),
  ADD KEY `id_permiso` (`id_permiso`);

--
-- Indexes for table `usuario_rutas_favoritas`
--
ALTER TABLE `usuario_rutas_favoritas`
  ADD PRIMARY KEY (`id_usuario`,`id_ruta`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parada`
--
ALTER TABLE `parada`
  MODIFY `id_parada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recuperar_contrasena`
--
ALTER TABLE `recuperar_contrasena`
  MODIFY `id_recuperacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reporte`
--
ALTER TABLE `reporte`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recuperar_contrasena`
--
ALTER TABLE `recuperar_contrasena`
  ADD CONSTRAINT `recuperar_contrasena_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL,
  ADD CONSTRAINT `reporte_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`) ON DELETE SET NULL;

--
-- Constraints for table `ruta_parada`
--
ALTER TABLE `ruta_parada`
  ADD CONSTRAINT `ruta_parada_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`) ON DELETE CASCADE,
  ADD CONSTRAINT `ruta_parada_ibfk_2` FOREIGN KEY (`id_parada`) REFERENCES `parada` (`id_parada`) ON DELETE CASCADE;

--
-- Constraints for table `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `usuario_permiso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_permiso_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`) ON DELETE CASCADE;

--
-- Constraints for table `usuario_rutas_favoritas`
--
ALTER TABLE `usuario_rutas_favoritas`
  ADD CONSTRAINT `usuario_rutas_favoritas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_rutas_favoritas_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
