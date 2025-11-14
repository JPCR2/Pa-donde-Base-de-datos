-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2025 at 03:28 AM
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
-- Database: `proyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `cambio_datos`
--

CREATE TABLE `cambio_datos` (
  `id_cambio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `descripcion_cambio` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colonia`
--

CREATE TABLE `colonia` (
  `id_colonia` int(11) NOT NULL,
  `nombre_colonia` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colonia`
--

INSERT INTO `colonia` (`id_colonia`, `nombre_colonia`, `descripcion`) VALUES
(1, 'Colosio', 'Colonia mas cercana al centro.'),
(2, 'Misi?n del Carmen', 'Zona cerca de villamar y del Wallmart.'),
(3, 'Guadalupana', 'Zona en la que se encuentran las universidades.'),
(4, 'Villamar', 'Colonia cercana al IMSS.'),
(5, 'Las Flores', 'Colonia ubicada al poniente de la ciudad, con varios paraderos principales.'),
(6, 'Ju?rez', 'Zona centrica con multiples rutas de transporte y conexion hacia otras colonias.'),
(7, 'Cristo Rey', 'Area con paraderos antiguos y nuevos, punto de enlace hacia el norte.'),
(8, 'Av. Universidades', 'Zona donde se ubican instituciones educativas como la UT y UQROO.'),
(9, 'Bellavista', 'Colonia con varios puntos de parada cercanos al mercado de las pi?atas.');

-- --------------------------------------------------------

--
-- Table structure for table `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_reporte` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `id_reporte`, `id_usuario`, `comentario`, `fecha`) VALUES
(11, 6, 3, 'Confirmo, la unidad 32 lleg? con retraso.', '2025-11-11 21:07:50'),
(12, 7, 1, 'Ya se revis? el reporte y se ajustaron los horarios.', '2025-11-11 21:07:50'),
(13, 8, 2, 'Se avis? al conductor responsable.', '2025-11-11 21:07:50'),
(14, 9, 5, 'Buen servicio en la ma?ana.', '2025-11-11 21:07:50'),
(15, 10, 4, 'Verificar horario de regreso.', '2025-11-11 21:07:50');

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `dias_activos` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `horario`
--

INSERT INTO `horario` (`id_horario`, `id_ruta`, `hora_inicio`, `hora_fin`, `dias_activos`) VALUES
(6, 1, '05:00:00', '24:00:00', 'Lunes a Domingo'),
(7, 2, '05:30:00', '22:00:00', 'Lunes a Domingo'),
(8, 3, '05:15:00', '22:00:00', 'Lunes a Domingo'),
(9, 4, '05:45:00', '22:00:00', 'Lunes a Domingo'),
(10, 5, '05:00:00', '23:40:00', 'Lunes a Domingo');

-- --------------------------------------------------------

--
-- Table structure for table `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `leido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notificacion`
--

INSERT INTO `notificacion` (`id_notificacion`, `id_usuario`, `mensaje`, `fecha`, `leido`) VALUES
(1, 1, 'Tu reporte ha sido recibido.', '2025-11-11 21:04:23', 0),
(2, 2, 'El horario de tu ruta favorita ha cambiado.', '2025-11-11 21:04:23', 0),
(3, 3, 'Tu comentario ha sido aprobado.', '2025-11-11 21:04:23', 0),
(4, 4, 'Tu cuenta ha sido actualizada.', '2025-11-11 21:04:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `paraderos`
--

CREATE TABLE `paraderos` (
  `id_parada` int(11) NOT NULL,
  `nombre_parada` varchar(100) DEFAULT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL,
  `referencia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paraderos`
--

INSERT INTO `paraderos` (`id_parada`, `nombre_parada`, `latitud`, `longitud`, `referencia`) VALUES
(1, 'Lilis & Constituyentes', 20.653443, -87.106180, 'Colonia Las Flores'),
(2, 'Panader?a Mana', 20.655458, -87.104839, 'Colonia Las Flores'),
(3, 'Lilis & sin nombre', 20.659188, -87.101889, 'Colonia Las Flores'),
(4, 'Olivos & Constituyentes', 20.655611, -87.109759, 'Colonia Las Flores'),
(5, 'Olivos & Para?so', 20.657712, -87.108415, 'Colonia Las Flores'),
(6, 'Domo Flores', 20.655824, -87.105095, 'Colonia Las Flores'),
(7, 'Miguel Hidalgo', 20.658249, -87.103085, 'Colonia Las Flores'),
(8, 'Banco del Bienestar', 20.660094, -87.106606, 'Colonia Las Flores'),
(9, 'Olivos & sin nombre', 20.661737, -87.105610, 'Colonia Las Flores'),
(10, 'Para?so & Olivos', 20.657969, -87.108623, 'Colonia Las Flores'),
(11, 'Poliforum & Gasolinera', 20.634513, -87.095357, 'Colonia Ju?rez'),
(12, 'Poliforum & Calle 105', 20.633716, -87.094039, 'Colonia Ju?rez'),
(13, 'Calle Diagonal 85', 20.631398, -87.090200, 'Colonia Ju?rez'),
(14, 'Calle Diagonal 70', 20.629710, -87.087395, 'Colonia Ju?rez'),
(15, 'Calle Diagonal 65', 20.629131, -87.086451, 'Colonia Ju?rez'),
(16, 'Calle 55 Pte', 20.628307, -87.085106, 'Colonia Ju?rez'),
(17, 'Calle 50 & 45', 20.627130, -87.082902, 'Colonia Ju?rez'),
(18, 'Calle 40 & 35', 20.625922, -87.080901, 'Colonia Ju?rez'),
(19, '30 Avenida', 20.625647, -87.079314, 'Colonia Ju?rez'),
(20, 'Calle 25', 20.625193, -87.078450, 'Colonia Ju?rez'),
(21, 'Antiguo Paradero', 20.705030, -87.073793, 'Colonia Cristo Rey'),
(22, 'Nuevo Paradero', 20.706141, -87.075853, 'Colonia Cristo Rey'),
(23, 'Paradero UT', 20.683257, -87.065892, 'A un costado de la Universidad Tecnol?gica'),
(24, 'Paradero UQROO', 20.684209, -87.066960, 'Cerca de la Universidad de Quintana Roo'),
(25, 'Mercado de las Pi?atas', 20.633633, -87.101943, 'Colonia Bellavista'),
(26, 'Paradero Esquina', 20.636936, -87.099596, 'Colonia Bellavista'),
(27, 'Paradero 135', 20.632342, -87.102834, 'Colonia Bellavista');

-- --------------------------------------------------------

--
-- Table structure for table `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `estado` enum('pendiente','revisado','resuelto') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `id_usuario`, `id_ruta`, `descripcion`, `fecha`, `estado`) VALUES
(6, 1, 1, 'El autob?s tard? m?s de 20 minutos en llegar.', '2025-11-11 21:06:15', 'pendiente'),
(7, 2, 2, 'No pasan muchos colectivos de la ruta.', '2025-11-11 21:06:15', 'revisado'),
(8, 3, 3, 'El conductor fue muy amable.', '2025-11-11 21:06:15', 'resuelto'),
(9, 4, 1, 'El cami?n iba muy lleno.', '2025-11-11 21:06:15', 'pendiente'),
(10, 5, 2, 'El horario no coincide con la app.', '2025-11-11 21:06:15', 'pendiente');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `descripcion`) VALUES
(1, 'Administrador', 'Acceso completo al sistema. Puede gestionar rutas, usuarios, reportes y configuraciones.'),
(2, 'Conductor', 'Puede actualizar rutas, horarios y reportar incidencias relacionadas con el transporte.'),
(3, 'Usuario', 'Puede consultar rutas, agregar rutas a favoritas y enviar reportes.'),
(4, 'Moderador', 'Puede revisar, aprobar o resolver reportes enviados por los usuarios y apoyar en la gesti?n de incidencias.'),
(5, 'Supervisor', 'Supervisa la actividad de conductores, verifica el cumplimiento de rutas y horarios, y reporta inconsistencias al administrador.');

-- --------------------------------------------------------

--
-- Table structure for table `rol_temp`
--

CREATE TABLE `rol_temp` (
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol_temp`
--

INSERT INTO `rol_temp` (`nombre_rol`, `descripcion`) VALUES
('Administrador', 'Acceso completo al sistema. Puede gestionar rutas, usuarios, reportes y configuraciones.'),
('Conductor', 'Puede actualizar rutas, horarios y reportar incidencias relacionadas con el transporte.'),
('Usuario', 'Puede consultar rutas, agregar rutas a favoritas y enviar reportes.'),
('Moderador', 'Puede revisar, aprobar o resolver reportes enviados por los usuarios y apoyar en la gesti?n de incidencias.'),
('Supervisor', 'Supervisa la actividad de conductores, verifica el cumplimiento de rutas y horarios, y reporta inconsistencias al administrador.');

-- --------------------------------------------------------

--
-- Table structure for table `rutas`
--

CREATE TABLE `rutas` (
  `id_ruta` int(11) NOT NULL,
  `nombre_ruta` varchar(100) DEFAULT NULL,
  `color_identificador` varchar(7) DEFAULT NULL,
  `horario` text DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `id_colonia` int(11) DEFAULT NULL,
  `id_parada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rutas`
--

INSERT INTO `rutas` (`id_ruta`, `nombre_ruta`, `color_identificador`, `horario`, `costo`, `id_colonia`, `id_parada`) VALUES
(1, 'Ruta Las Flores', NULL, NULL, NULL, NULL, NULL),
(2, 'Ruta Ju?rez', NULL, NULL, NULL, NULL, NULL),
(3, 'Ruta Cristo Rey', NULL, NULL, NULL, NULL, NULL),
(4, 'Ruta Av. Universidades', NULL, NULL, NULL, NULL, NULL),
(5, 'Ruta Bellavista', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ruta_parada`
--

CREATE TABLE `ruta_parada` (
  `id_ruta` int(11) NOT NULL,
  `id_parada` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruta_parada`
--

INSERT INTO `ruta_parada` (`id_ruta`, `id_parada`, `orden`) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 4, 1),
(2, 5, 2),
(3, 7, 1),
(3, 8, 2),
(4, 9, 1),
(4, 10, 2),
(5, 11, 1),
(5, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(150) DEFAULT NULL,
  `contrasena_hash` text DEFAULT NULL,
  `idioma_preferido` varchar(50) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo_electronico`, `contrasena_hash`, `idioma_preferido`, `fecha_registro`, `id_rol`) VALUES
(1, 'Isaac Pech', 'isaac.pech@gmail.com', 'Pech2210', 'Espa?ol', '2025-11-11 20:22:34', 1),
(2, 'Fabian Vidal', 'fabian.vidal@gmail.com', 'Vidal1611', 'Espa?ol', '2025-11-11 20:22:34', 2),
(3, 'Marco Pi?a', 'marco.pina@gmail.com', 'Pina1711', 'Ingl?s', '2025-11-11 20:22:34', 4),
(4, 'Cesar Torres', 'cesar.torres@gmail.com', 'Cesartores1811', 'Espa?ol', '2025-11-11 20:22:34', 3),
(5, 'Joel Chin', 'joel.chin@gmail.com', 'JoelChin1911', 'Espa?ol', '2025-11-11 20:22:34', 5);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_rutas_favoritas`
--

CREATE TABLE `usuario_rutas_favoritas` (
  `id_usuario` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario_rutas_favoritas`
--

INSERT INTO `usuario_rutas_favoritas` (`id_usuario`, `id_ruta`) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 1),
(5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cambio_datos`
--
ALTER TABLE `cambio_datos`
  ADD PRIMARY KEY (`id_cambio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `colonia`
--
ALTER TABLE `colonia`
  ADD PRIMARY KEY (`id_colonia`);

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_reporte` (`id_reporte`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indexes for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `id_usuario` (`id_usuario`);

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
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id_ruta`),
  ADD KEY `fk_ruta_colonia` (`id_colonia`),
  ADD KEY `fk_ruta_parada` (`id_parada`);

--
-- Indexes for table `ruta_parada`
--
ALTER TABLE `ruta_parada`
  ADD PRIMARY KEY (`id_ruta`,`id_parada`),
  ADD KEY `id_parada` (`id_parada`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`),
  ADD KEY `fk_usuarios_rol` (`id_rol`);

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
-- AUTO_INCREMENT for table `cambio_datos`
--
ALTER TABLE `cambio_datos`
  MODIFY `id_cambio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colonia`
--
ALTER TABLE `colonia`
  MODIFY `id_colonia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paraderos`
--
ALTER TABLE `paraderos`
  MODIFY `id_parada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cambio_datos`
--
ALTER TABLE `cambio_datos`
  ADD CONSTRAINT `cambio_datos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id_reporte`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`);

--
-- Constraints for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`);

--
-- Constraints for table `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `fk_ruta_colonia` FOREIGN KEY (`id_colonia`) REFERENCES `colonia` (`id_colonia`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ruta_parada` FOREIGN KEY (`id_parada`) REFERENCES `paraderos` (`id_parada`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ruta_parada`
--
ALTER TABLE `ruta_parada`
  ADD CONSTRAINT `ruta_parada_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ruta_parada_ibfk_2` FOREIGN KEY (`id_parada`) REFERENCES `paraderos` (`id_parada`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `usuario_rutas_favoritas`
--
ALTER TABLE `usuario_rutas_favoritas`
  ADD CONSTRAINT `usuario_rutas_favoritas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuario_rutas_favoritas_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
