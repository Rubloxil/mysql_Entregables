-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2025 a las 01:43:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `transmilenio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bus`
--

CREATE TABLE `bus` (
  `id_bus` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `capacidad` varchar(10) NOT NULL,
  `id_tipo_vehiculo` int(11) DEFAULT NULL,
  `id_conductor` int(11) DEFAULT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `id_turno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductores`
--

CREATE TABLE `conductores` (
  `id_conductor` int(11) NOT NULL,
  `nombre_conductor` varchar(100) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciones`
--

CREATE TABLE `estaciones` (
  `id_estacion` int(11) NOT NULL,
  `nombre_estacion` enum('portal suba','Suba - Transversal 91','Suba - Avenida Boyacá','Avenida Suba - Calle 116 (Shaio)','puentelargo','Rionegro (Av. Suba - Cl 90)','Movistar Arena (Av. NQS - Cl 63)','Universidad Nacional (Av. NQS - Cl 47)','CAD (Av. NQS - Cl 22C)','Santa Isabel (Av. NQS - Cl 1G)','NQS - Calle 38A Sur','general santander','venecia','portal sur','portal 20 de julio','country sur','Avenida 1 de Mayo','bicentenario','NQS - Calle 38A Sur','Guatoque Veraguas','El Campín - UAN','movistar arena','Av. chile','NQS Calle 75','Avenida Suba Calle 95','Avenida Suba Calle 100','Niza Calle 127','portal suba') NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `id_ruta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `hora_salida` time NOT NULL,
  `hora_llegada` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portales`
--

CREATE TABLE `portales` (
  `id_portal` int(11) NOT NULL,
  `nombre_portal` enum('PORTAL 20 DE JULIO','PORTAL SUBA','PORTAL SUR') NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` enum('usuario','conductor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id_ruta` int(11) NOT NULL,
  `nombre_ruta` enum('C25','G30','D22') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_bus`
--

CREATE TABLE `tipo_bus` (
  `id_tipo_vehiculo` int(11) NOT NULL,
  `nombre_tipo` enum('troncal','urbano','alimentador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(11) NOT NULL,
  `numero_turno` enum('1','2','3','4','5') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_conductor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id_bus`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `id_tipo_vehiculo` (`id_tipo_vehiculo`),
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `id_turno` (`id_turno`);

--
-- Indices de la tabla `conductores`
--
ALTER TABLE `conductores`
  ADD PRIMARY KEY (`id_conductor`),
  ADD UNIQUE KEY `num_documento` (`num_documento`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD PRIMARY KEY (`id_estacion`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indices de la tabla `portales`
--
ALTER TABLE `portales`
  ADD PRIMARY KEY (`id_portal`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id_ruta`);

--
-- Indices de la tabla `tipo_bus`
--
ALTER TABLE `tipo_bus`
  ADD PRIMARY KEY (`id_tipo_vehiculo`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `id_conductor` (`id_conductor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bus`
--
ALTER TABLE `bus`
  MODIFY `id_bus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conductores`
--
ALTER TABLE `conductores`
  MODIFY `id_conductor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estaciones`
--
ALTER TABLE `estaciones`
  MODIFY `id_estacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `portales`
--
ALTER TABLE `portales`
  MODIFY `id_portal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_bus`
--
ALTER TABLE `tipo_bus`
  MODIFY `id_tipo_vehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`id_tipo_vehiculo`) REFERENCES `tipo_bus` (`id_tipo_vehiculo`),
  ADD CONSTRAINT `bus_ibfk_2` FOREIGN KEY (`id_conductor`) REFERENCES `conductores` (`id_conductor`),
  ADD CONSTRAINT `bus_ibfk_3` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`),
  ADD CONSTRAINT `bus_ibfk_4` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`);

--
-- Filtros para la tabla `conductores`
--
ALTER TABLE `conductores`
  ADD CONSTRAINT `conductores_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `estaciones`
--
ALTER TABLE `estaciones`
  ADD CONSTRAINT `estaciones_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`);

--
-- Filtros para la tabla `portales`
--
ALTER TABLE `portales`
  ADD CONSTRAINT `portales_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`),
  ADD CONSTRAINT `portales_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_conductor`) REFERENCES `conductores` (`id_conductor`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



INSERT INTO rol (nombre_rol) VALUES
('usuario'),
('conductor');
INSERT INTO tipo_bus (nombre_tipo) VALUES
('troncal'),
('urbano'),
('alimentador');
INSERT INTO rutas (nombre_ruta) VALUES
('C25'),
('G30'),
('D22');
INSERT INTO usuario (nombre_usuario, id_rol) VALUES
('admin', 1);
INSERT INTO conductores (nombre_conductor, num_documento, id_rol) VALUES
('Juan Perez', '123456789', 2),
('Maria Gomez', '987654321', 2);
INSERT INTO turnos (numero_turno, hora_inicio, hora_fin, id_conductor) VALUES
('1', '06:00:00', '14:00:00', 1),
('2', '14:00:00', '22:00:00', 2);
INSERT INTO bus (placa, capacidad, id_tipo_vehiculo, id_con
ductor, id_ruta, id_turno) VALUES
('ABC123', '80', 1, 1, 1, 1),
('DEF456', '60', 2, 2, 2, 2);
INSERT INTO estaciones (nombre_estacion, ubicacion, id_ruta) VALUES
('portal suba', 'Av. Suba con Calle 170', 1),
('Suba - Transversal 91', 'Transversal 91 con Av. Suba', 1);
INSERT INTO portales (nombre_portal, ubicacion, id_ruta, id_usuario) VALUES
('PORTAL SUBA', 'Av. Suba con Calle 170', 1, 1),
('PORTAL SUR', 'Av. Caracas con Calle 44 Sur', 2, 1);
INSERT INTO horarios (id_ruta, hora_salida, hora_llegada) VALUES
(1, '06:00:00', '07:00:00'),
(2, '07:00:00', '08:00:00');
