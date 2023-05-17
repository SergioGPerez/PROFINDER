-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2023 a las 04:48:58
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `profinder`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `sucursales` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas_profesionales`
--

CREATE TABLE `empresas_profesionales` (
  `id` int(11) NOT NULL,
  `id_empresas` int(11) NOT NULL,
  `id_profesionales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionales`
--

CREATE TABLE `profesionales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int(100) NOT NULL,
  `numero_telefono` int(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `estudios` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesionesxprofesion`
--

CREATE TABLE `profesionesxprofesion` (
  `id` int(11) NOT NULL,
  `id_profesionales` int(11) NOT NULL,
  `id_profesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas_profesionales`
--
ALTER TABLE `empresas_profesionales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empresas` (`id_empresas`),
  ADD KEY `id_profesionales` (`id_profesionales`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesionesxprofesion`
--
ALTER TABLE `profesionesxprofesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesionales` (`id_profesionales`),
  ADD KEY `id_profesion` (`id_profesion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresas_profesionales`
--
ALTER TABLE `empresas_profesionales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesionales`
--
ALTER TABLE `profesionales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesionesxprofesion`
--
ALTER TABLE `profesionesxprofesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresas_profesionales`
--
ALTER TABLE `empresas_profesionales`
  ADD CONSTRAINT `empresas_profesionales_ibfk_1` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id`),
  ADD CONSTRAINT `empresas_profesionales_ibfk_2` FOREIGN KEY (`id_empresas`) REFERENCES `empresas` (`id`);

--
-- Filtros para la tabla `profesionesxprofesion`
--
ALTER TABLE `profesionesxprofesion`
  ADD CONSTRAINT `profesionesxprofesion_ibfk_1` FOREIGN KEY (`id_profesionales`) REFERENCES `profesionales` (`id`),
  ADD CONSTRAINT `profesionesxprofesion_ibfk_2` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
