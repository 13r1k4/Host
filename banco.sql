-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-08-2023 a las 17:22:17
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `folioCliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `domicilio`, `ciudad`, `telefono`, `folioCliente`) VALUES
(1, 'RIKA TAPIA', 'Del Cariño 145, Av. Venustiano Carranza', 'SLP', '4851175181', '00001'),
(2, 'MALAK FARHAT', 'Alexandria', 'CAIRO', '4441334121', '00002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesporcuenta`
--

CREATE TABLE `clientesporcuenta` (
  `idCliente` int(11) NOT NULL,
  `numeroCuenta` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientesporcuenta`
--

INSERT INTO `clientesporcuenta` (`idCliente`, `numeroCuenta`) VALUES
(1, '0000000000000000'),
(2, '0000000000000001'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `numeroCuenta` varchar(17) NOT NULL DEFAULT '0000000000000000',
  `saldo` float NOT NULL DEFAULT 0,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`numeroCuenta`, `saldo`, `fecha`) VALUES
('0000000000000000', 505023, '2020-08-01'),
('0000000000000001', 32315.5, '2020-08-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `clientesporcuenta`
--
ALTER TABLE `clientesporcuenta`
  ADD KEY `idCliente` (`idCliente`,`numeroCuenta`),
  ADD KEY `numeroCuenta` (`numeroCuenta`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`numeroCuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientesporcuenta`
--
ALTER TABLE `clientesporcuenta`
  ADD CONSTRAINT `clientesporcuenta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `clientesporcuenta_ibfk_2` FOREIGN KEY (`numeroCuenta`) REFERENCES `cuenta` (`numeroCuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
