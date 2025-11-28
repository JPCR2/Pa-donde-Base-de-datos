-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2025 at 04:34 AM
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
-- Database: `pa_donde`
--

-- --------------------------------------------------------

--
-- Table structure for table `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_reporte` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `texto` text NOT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `id_reporte`, `id_usuario`, `texto`, `creado_en`) VALUES
(1, 1, 1, 'Estoy dando seguimiento a este reporte.', '2025-11-14 23:08:52'),
(2, 2, 2, 'Confirmo que esta situaci?n sigue ocurriendo.', '2025-11-14 23:08:52'),
(3, 3, 3, 'Gracias por la atenci?n brindada.', '2025-11-14 23:08:52'),
(4, 4, 4, 'Se requiere verificar esta ruta nuevamente.', '2025-11-14 23:08:52'),
(5, 5, 5, 'Favor de actualizar la informaci?n del horario.', '2025-11-14 23:08:52');

-- --------------------------------------------------------

--
-- Table structure for table `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `leida` tinyint(1) NOT NULL DEFAULT 0,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notificacion`
--

INSERT INTO `notificacion` (`id_notificacion`, `id_usuario`, `mensaje`, `leida`, `creado_en`) VALUES
(1, 1, 'Tu reporte ha sido recibido.', 0, '2025-11-11 21:04:23'),
(2, 2, 'El horario de tu ruta favorita ha cambiado.', 0, '2025-11-11 21:04:23'),
(3, 3, 'Tu comentario ha sido aprobado.', 0, '2025-11-11 21:04:23'),
(4, 4, 'Tu cuenta ha sido actualizada.', 0, '2025-11-11 21:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `paraderos`
--

CREATE TABLE `paraderos` (
  `id_parada` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `lat` decimal(9,6) NOT NULL,
  `lng` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paraderos`
--

INSERT INTO `paraderos` (`id_parada`, `nombre`, `lat`, `lng`) VALUES
(62, 'Lilis & Constituyentes', 20.653443, -87.106180),
(63, 'Panaderia Mana', 20.655458, -87.104839),
(64, 'Lilis & sin nombre', 20.659188, -87.101889),
(65, 'Olivos & Constituyentes', 20.655611, -87.109759),
(66, 'Olivos & Paraiso', 20.657712, -87.108415),
(67, 'Domo Flores', 20.655824, -87.105095),
(68, 'Miguel Hidalgo', 20.658249, -87.103085),
(69, 'Banco del Bienestar', 20.660094, -87.106606),
(70, 'Olivos & sin nombre', 20.661737, -87.105610),
(71, 'Paraiso & Olivos', 20.657969, -87.108623),
(72, 'Poliforum & Gasolinera', 20.634513, -87.095357),
(73, 'Poliforum & Calle 105', 20.633716, -87.094039),
(74, 'Calle Diagonal 85', 20.631398, -87.090200),
(75, 'Calle Diagonal 70', 20.629710, -87.087395),
(76, 'Calle Diagonal 65', 20.629131, -87.086451),
(77, 'Calle 55 Pte', 20.628307, -87.085106),
(78, 'Calle 50 & 45', 20.627130, -87.082902),
(79, 'Calle 40 & 35', 20.625922, -87.080901),
(80, '30 Avenida', 20.625647, -87.079314),
(81, 'Calle 25', 20.625193, -87.078450),
(82, 'Antiguo Paradero', 20.705030, -87.073793),
(83, 'Nuevo Paradero', 20.706141, -87.075853),
(84, 'Paradero UT', 20.683257, -87.065892),
(85, 'Paradero UQROO', 20.684209, -87.066960),
(86, 'Mercado de las Pi?atas', 20.633633, -87.101943),
(87, 'Paradero Esquina', 20.636936, -87.099596),
(88, 'Paradero 135', 20.632342, -87.102834);

-- --------------------------------------------------------

--
-- Table structure for table `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `titulo` varchar(150) NOT NULL,
  `detalle` text DEFAULT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `id_usuario`, `id_ruta`, `titulo`, `detalle`, `creado_en`) VALUES
(1, 1, 1, 'El autob?s tard? m?s de 20 minutos en llegar.', NULL, '2025-11-14 23:07:11'),
(2, 2, 2, 'No pasan muchos colectivos de la ruta.', NULL, '2025-11-14 23:07:11'),
(3, 3, 3, 'El conductor fue muy amable.', NULL, '2025-11-14 23:07:11'),
(4, 4, 1, 'El cami?n iba muy lleno.', NULL, '2025-11-14 23:07:11'),
(5, 5, 2, 'El horario no coincide con la app.', NULL, '2025-11-14 23:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'Acceso completo al sistema. Puede gestionar rutas, usuarios, reportes, horarios, colonias y las configuraciones.'),
(2, 'Usuario', 'Puede consultar rutas, agregar rutas a favoritas y enviar reportes.'),
(3, 'Moderador', 'Puede revisar, aprobar o resolver reportes enviados por los usuarios y apoyar en la gesti?n de incidencias.');

-- --------------------------------------------------------

--
-- Table structure for table `ruta`
--

CREATE TABLE `ruta` (
  `id_ruta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activa` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruta`
--

INSERT INTO `ruta` (`id_ruta`, `nombre`, `descripcion`, `activa`, `creado_en`, `actualizado_en`) VALUES
(1, 'Ruta Las Flores', NULL, 1, '2025-11-14 22:57:03', '2025-11-14 22:57:03'),
(2, 'Ruta Ju?rez', NULL, 1, '2025-11-14 22:57:03', '2025-11-14 22:57:03'),
(3, 'Ruta Cristo Rey', NULL, 1, '2025-11-14 22:57:03', '2025-11-14 22:57:03'),
(4, 'Ruta Av. Universidades', NULL, 1, '2025-11-14 22:57:03', '2025-11-14 22:57:03'),
(5, 'Ruta Bellavista', NULL, 1, '2025-11-14 22:57:03', '2025-11-14 22:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `ruta_guardada`
--

CREATE TABLE `ruta_guardada` (
  `id_rg` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `alias` varchar(80) DEFAULT NULL,
  `favorito` tinyint(1) NOT NULL DEFAULT 1,
  `id_parada_origen` int(11) DEFAULT NULL,
  `id_parada_destino` int(11) DEFAULT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruta_guardada`
--

INSERT INTO `ruta_guardada` (`id_rg`, `id_usuario`, `id_ruta`, `alias`, `favorito`, `id_parada_origen`, `id_parada_destino`, `creado_en`, `actualizado_en`) VALUES
(1, 1, 1, 'Ruta a casa', 1, NULL, NULL, '2025-11-14 23:02:08', '2025-11-14 23:02:08'),
(2, 2, 2, 'Ruta al trabajo', 1, NULL, NULL, '2025-11-14 23:02:08', '2025-11-14 23:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `ruta_parada`
--

CREATE TABLE `ruta_parada` (
  `id_ruta` int(11) NOT NULL,
  `orden` smallint(6) NOT NULL,
  `id_parada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruta_parada`
--

INSERT INTO `ruta_parada` (`id_ruta`, `orden`, `id_parada`) VALUES
(1, 1, 62),
(1, 2, 63),
(1, 3, 64),
(1, 4, 65),
(1, 5, 66),
(1, 6, 67),
(1, 7, 68),
(1, 8, 69),
(1, 9, 70),
(1, 10, 71),
(2, 1, 72),
(2, 2, 73),
(2, 3, 74),
(2, 4, 75),
(2, 5, 76),
(2, 6, 77),
(2, 7, 78),
(2, 8, 79),
(2, 9, 80),
(2, 10, 81),
(3, 1, 82),
(3, 2, 83),
(4, 1, 84),
(4, 2, 85),
(5, 1, 86),
(5, 2, 87),
(5, 3, 88);

-- --------------------------------------------------------

--
-- Table structure for table `sesion`
--

CREATE TABLE `sesion` (
  `id_sesion` char(64) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp(),
  `expira_en` datetime NOT NULL,
  `valido` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sesion`
--

INSERT INTO `sesion` (`id_sesion`, `id_usuario`, `ip`, `user_agent`, `creado_en`, `expira_en`, `valido`) VALUES
('abc123xyz', 1, '192.168.1.10', 'Chrome', '2025-11-14 23:07:51', '2025-11-15 23:07:51', 1),
('def456uvw', 2, '192.168.1.11', 'Firefox', '2025-11-14 23:07:51', '2025-11-15 23:07:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `pass_hash` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ultimo_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `pass_hash`, `activo`, `creado_en`, `actualizado_en`, `ultimo_login`) VALUES
(1, 'Isaac Pech', 'isaac.pech@gmail.com', 'Pech2210', 1, '2025-11-11 20:22:34', '2025-11-14 22:56:40', NULL),
(2, 'Fabian Vidal', 'fabian.vidal@gmail.com', 'Vidal1611', 1, '2025-11-11 20:22:34', '2025-11-14 22:56:40', NULL),
(3, 'Marco Pi?a', 'marco.pina@gmail.com', 'Pina1711', 1, '2025-11-11 20:22:34', '2025-11-14 22:56:40', NULL),
(4, 'Cesar Torres', 'cesar.torres@gmail.com', 'Cesartores1811', 1, '2025-11-11 20:22:34', '2025-11-14 22:56:40', NULL),
(5, 'Joel Chin', 'joel.chin@gmail.com', 'JoelChin1911', 1, '2025-11-11 20:22:34', '2025-11-14 22:56:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuario_rol`
--

INSERT INTO `usuario_rol` (`id_usuario`, `id_rol`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2),
(5, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `idx_com_rep` (`id_reporte`),
  ADD KEY `idx_com_user` (`id_usuario`);

--
-- Indexes for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `idx_notif_user` (`id_usuario`);

--
-- Indexes for table `paraderos`
--
ALTER TABLE `paraderos`
  ADD PRIMARY KEY (`id_parada`);

--
-- Indexes for table `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `idx_rep_usuario` (`id_usuario`),
  ADD KEY `idx_rep_ruta` (`id_ruta`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id_ruta`);

--
-- Indexes for table `ruta_guardada`
--
ALTER TABLE `ruta_guardada`
  ADD PRIMARY KEY (`id_rg`),
  ADD UNIQUE KEY `uq_rg_usuario_alias` (`id_usuario`,`alias`),
  ADD KEY `idx_rg_usuario` (`id_usuario`),
  ADD KEY `idx_rg_ruta` (`id_ruta`),
  ADD KEY `fk_rg_parada_origen` (`id_parada_origen`),
  ADD KEY `fk_rg_parada_dest` (`id_parada_destino`);

--
-- Indexes for table `ruta_parada`
--
ALTER TABLE `ruta_parada`
  ADD PRIMARY KEY (`id_ruta`,`orden`),
  ADD KEY `idx_ruta_parada_parada` (`id_parada`);

--
-- Indexes for table `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id_sesion`),
  ADD KEY `fk_sesion_usuario` (`id_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`id_usuario`,`id_rol`),
  ADD KEY `fk_ur_rol` (`id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paraderos`
--
ALTER TABLE `paraderos`
  MODIFY `id_parada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ruta_guardada`
--
ALTER TABLE `ruta_guardada`
  MODIFY `id_rg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_com_reporte` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id_reporte`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_com_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `fk_notif_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `fk_rep_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_rep_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `ruta_guardada`
--
ALTER TABLE `ruta_guardada`
  ADD CONSTRAINT `fk_rg_parada_dest` FOREIGN KEY (`id_parada_destino`) REFERENCES `paraderos` (`id_parada`),
  ADD CONSTRAINT `fk_rg_parada_origen` FOREIGN KEY (`id_parada_origen`) REFERENCES `paraderos` (`id_parada`),
  ADD CONSTRAINT `fk_rg_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rg_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `ruta_parada`
--
ALTER TABLE `ruta_parada`
  ADD CONSTRAINT `fk_rp_parada` FOREIGN KEY (`id_parada`) REFERENCES `paraderos` (`id_parada`),
  ADD CONSTRAINT `fk_rp_ruta` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`) ON DELETE CASCADE;

--
-- Constraints for table `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `fk_sesion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `fk_ur_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  ADD CONSTRAINT `fk_ur_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
