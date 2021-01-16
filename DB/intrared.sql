-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-01-2021 a las 02:15:26
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intrared`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `cities_id` int(11) NOT NULL,
  `city` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`cities_id`, `city`) VALUES
(1, 'Cartagena'),
(2, 'Bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_type`
--

CREATE TABLE `document_type` (
  `document_type_id` int(11) NOT NULL,
  `document_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `document_type`
--

INSERT INTO `document_type` (`document_type_id`, `document_type`) VALUES
(1, 'cedula de ciudadania'),
(2, 'cedula de extranjeria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL,
  `rol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `rol`) VALUES
(1, 'propietario'),
(2, 'conductor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(30) NOT NULL,
  `city_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`users_id`, `first_name`, `second_name`, `document_number`, `address`, `phone`, `city_id`, `rol_id`, `document_type_id`) VALUES
(1, 'Laura Camila ', 'Paez Barbosa', '1000615160', 'cra 15 n 34 34 ', 3206543856, 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicles_id` int(11) NOT NULL,
  `license_plate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vechicle_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vehicles`
--

INSERT INTO `vehicles` (`vehicles_id`, `license_plate`, `color`, `mark`, `vechicle_type_id`) VALUES
(1, 'XXX-111', 'Verde', 'Chevrolet', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicles_users`
--

CREATE TABLE `vehicles_users` (
  `vehicles_users_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `vehicles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vehicles_users`
--

INSERT INTO `vehicles_users` (`vehicles_users_id`, `users_id`, `vehicles_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `vehicle_type_id` int(11) NOT NULL,
  `vehice_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vehicle_type`
--

INSERT INTO `vehicle_type` (`vehicle_type_id`, `vehice_type`) VALUES
(1, 'particular '),
(2, 'publico');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cities_id`);

--
-- Indices de la tabla `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`document_type_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `rol_id` (`rol_id`),
  ADD KEY `document_type_id` (`document_type_id`);

--
-- Indices de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicles_id`),
  ADD KEY `vechicle_type_id` (`vechicle_type_id`);

--
-- Indices de la tabla `vehicles_users`
--
ALTER TABLE `vehicles_users`
  ADD PRIMARY KEY (`vehicles_users_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `vehicles_users_ibfk_2` (`vehicles_id`);

--
-- Indices de la tabla `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`vehicle_type_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `cities_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `document_type`
--
ALTER TABLE `document_type`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vehicles_users`
--
ALTER TABLE `vehicles_users`
  MODIFY `vehicles_users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `vehicle_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`cities_id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`);

--
-- Filtros para la tabla `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`vechicle_type_id`) REFERENCES `vehicle_type` (`vehicle_type_id`);

--
-- Filtros para la tabla `vehicles_users`
--
ALTER TABLE `vehicles_users`
  ADD CONSTRAINT `vehicles_users_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`),
  ADD CONSTRAINT `vehicles_users_ibfk_2` FOREIGN KEY (`vehicles_id`) REFERENCES `vehicles` (`vehicles_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
