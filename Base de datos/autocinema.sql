-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 11-06-2020 a las 18:53:34
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `autocinema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos`
--

DROP TABLE IF EXISTS `asientos`;
CREATE TABLE IF NOT EXISTS `asientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `sala_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asla_id_asientos_idx` (`sala_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asientos`
--

INSERT INTO `asientos` (`id`, `descripcion`, `sala_id`, `created_at`, `update_at`) VALUES
(1, 'Sala 1 - 1', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(2, 'Sala 1 - 2', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(3, 'Sala 1 - 3', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(4, 'Sala 1 - 4', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(5, 'Sala 1 - 5', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(6, 'Sala 1 - 6', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(7, 'Sala 1 - 7', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(8, 'Sala 1 - 8', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(9, 'Sala 1 - 9', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(10, 'Sala 1 - 10', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(11, 'Sala 1 - 11', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(12, 'Sala 1 - 12', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(13, 'Sala 1 - 13', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(14, 'Sala 1 - 14', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(15, 'Sala 1 - 15', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(16, 'Sala 1 - 16', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(17, 'Sala 1 - 17', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(18, 'Sala 1 - 18', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(19, 'Sala 1 - 19', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(20, 'Sala 1 - 20', 1, '2020-05-22 19:20:16', '2020-05-22 19:20:16'),
(21, 'Sala 1 - 1', 1, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(22, 'Sala 2 - 2', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(23, 'Sala 2 - 3', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(24, 'Sala 2 - 4', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(25, 'Sala 2 - 5', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(26, 'Sala 2 - 6', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(27, 'Sala 2 - 7', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(28, 'Sala 2 - 8', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(29, 'Sala 2 - 9', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(30, 'Sala 2 - 10', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(31, 'Sala 2 - 11', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(32, 'Sala 2 - 12', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(33, 'Sala 2 - 13', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(34, 'Sala 2 - 14', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(35, 'Sala 2 - 15', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(36, 'Sala 2 - 16', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(37, 'Sala 2 - 17', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(38, 'Sala 2 - 18', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(39, 'Sala 2 - 19', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(40, 'Sala 2 - 20', 2, '2020-05-22 19:22:00', '2020-05-22 19:22:00'),
(41, 'Sala 3 - 1', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(42, 'Sala 3 - 2', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(43, 'Sala 3 - 3', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(44, 'Sala 3 - 4', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(45, 'Sala 3 - 5', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(46, 'Sala 3 - 6', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(47, 'Sala 3 - 7', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(48, 'Sala 3 - 8', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(49, 'Sala 3 - 9', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(50, 'Sala 3 - 10', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(51, 'Sala 3 - 11', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(52, 'Sala 3 - 12', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(53, 'Sala 3 - 13', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(54, 'Sala 3 - 14', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(55, 'Sala 3 - 15', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(56, 'Sala 3 - 16', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(57, 'Sala 3 - 17', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(58, 'Sala 3 - 18', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(59, 'Sala 3 - 19', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42'),
(60, 'Sala 3 - 20', 3, '2020-05-22 19:23:42', '2020-05-22 19:23:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos_ocupados`
--

DROP TABLE IF EXISTS `asientos_ocupados`;
CREATE TABLE IF NOT EXISTS `asientos_ocupados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asientos_id` int(11) DEFAULT NULL,
  `proyeccion_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asientos_id_idx` (`asientos_id`),
  KEY `fk_proyeccion_id_idx` (`proyeccion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asientos_ocupados`
--

INSERT INTO `asientos_ocupados` (`id`, `asientos_id`, `proyeccion_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(2, 5, 1, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(3, 10, 1, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(4, 8, 1, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(5, 7, 1, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(6, 15, 1, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(7, 14, 1, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(8, 21, 2, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(9, 25, 2, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(10, 30, 2, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(11, 31, 2, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(12, 32, 2, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(13, 36, 2, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(14, 41, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(15, 42, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(16, 45, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(17, 50, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(18, 51, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(19, 52, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(20, 53, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15'),
(21, 55, 3, '2020-05-22 19:27:15', '2020-05-22 19:27:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

DROP TABLE IF EXISTS `boleta`;
CREATE TABLE IF NOT EXISTS `boleta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `proyeccion_id` int(11) DEFAULT NULL,
  `asiento` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proyeccion_id_idx` (`proyeccion_id`),
  KEY `fk_cliente_id_idx` (`cliente_id`),
  KEY `fk_tipo_id_idx` (`tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`id`, `cliente_id`, `proyeccion_id`, `asiento`, `created_at`, `updated_at`, `tipo_id`) VALUES
(1, 2, 1, '1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2),
(2, 2, 1, '2', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2),
(3, 2, 1, '3', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2),
(4, 1, 2, '1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2),
(5, 1, 2, '2', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2),
(6, 1, 2, '3', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(7, 1, 3, '1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(8, 1, 3, '2', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(9, 3, 4, '1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(10, 3, 4, '2', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(11, 3, 5, '1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2),
(12, 1, 4, '1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(13, 3, 3, '5', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(14, 2, 4, '1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 1),
(15, 2, 4, '12', '2020-05-22 00:00:00', '2020-05-22 00:00:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta_productos`
--

DROP TABLE IF EXISTS `boleta_productos`;
CREATE TABLE IF NOT EXISTS `boleta_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `boleta_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_boleta_productos_idx` (`boleta_id`),
  KEY `fk_productos_clientes_idx` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `boleta_productos`
--

INSERT INTO `boleta_productos` (`id`, `boleta_id`, `producto_id`, `created_at`, `updated_at`, `cantidad`) VALUES
(1, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(2, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(3, 1, 3, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(4, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(5, 2, 4, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(6, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(7, 2, 3, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(8, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(9, 5, 10, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(10, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(11, 6, 7, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(12, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(13, 6, 6, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(14, 1, 1, '2020-06-11 12:36:07', '2020-06-11 12:36:07', 2),
(15, 15, 3, '2020-06-11 12:41:35', '2020-06-11 12:41:35', 1),
(16, 15, 7, '2020-06-11 12:41:35', '2020-06-11 12:41:35', 2),
(17, 15, 1, '2020-06-11 12:41:35', '2020-06-11 12:41:35', 1),
(18, 15, 2, '2020-06-11 12:41:35', '2020-06-11 12:41:35', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Crispeta', '2020-06-03 00:00:00', '2020-06-03 00:00:00'),
(2, 'Combos', '2020-06-06 00:00:00', '2020-06-06 00:00:00'),
(3, 'Bebidas', '2020-06-06 00:00:00', '2020-06-06 00:00:00'),
(4, 'A la carte', '2020-06-06 00:00:00', '2020-06-06 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificaion`
--

DROP TABLE IF EXISTS `clasificaion`;
CREATE TABLE IF NOT EXISTS `clasificaion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clasificaion`
--

INSERT INTO `clasificaion` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Excelente', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 'Buena', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 'Regular', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 'Mala', '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `email`, `telefono`, `created_at`, `updated_at`) VALUES
(1, 'Andres Felipe ', 'andres.lopezma@hotmail.com', '7762039', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 'Alexander', 'alex@hotmail.com', '315465897', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 'Usuario 3', 'usuario@hotmai.com', '31546895', '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Accion', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 'Animada', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 'Terror', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 'Comedia', '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
CREATE TABLE IF NOT EXISTS `pelicula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sinopsis` longtext,
  `trailer` longtext,
  `portada` varchar(45) DEFAULT NULL,
  `descripcion` longtext,
  `genero_id` int(11) DEFAULT NULL,
  `clasificacion_id` int(11) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `duracion` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genero_id_idx` (`genero_id`),
  KEY `fk_clasificacion_id_idx` (`clasificacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `sinopsis`, `trailer`, `portada`, `descripcion`, `genero_id`, `clasificacion_id`, `titulo`, `created_at`, `updated_at`, `duracion`) VALUES
(1, 'Sinopsis de la pelicula 1 ', 'Trailer de la pelicula 1', 'portada pelicula 1', 'descripcion de la pelicula 1', 1, 1, 'Pelicula 1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '90'),
(2, 'sinopsis pelicula 2', 'trailer peliucla 2', 'portada pelicual 2', 'descripcion de la pelicual 2', 2, 2, 'Pelicula 2', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '120'),
(3, 'Sinopsis pelicula 3', 'trailer pelicula 3', 'portada pelicula 3', 'descripcion pelicula 3', 3, 4, 'Pelicula 3', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '200');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_id` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `descripcion`, `created_at`, `updated_at`, `costo`, `categoria_id`, `nombre`) VALUES
(1, 'Crispetas Grandes', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '15000', 1, 'Crispetas'),
(2, 'Crispetas pequeñas', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '5000', 1, 'Crispetas'),
(3, 'Crispetas medianas', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '10000', 1, 'Crispetas'),
(4, 'Geseosa Grande', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '18000', 3, 'Gaseosas'),
(5, 'gaseosas Pequeñas', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '6000', 1, 'Gaseosas'),
(6, 'Gaseosa mediana', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '11000', 3, 'Gaseosas'),
(7, 'combo duo gaseosa y crispeta medianas', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '18000', 2, 'combo duo gaseosa y crispeta medianas'),
(8, 'combo pop', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '20000', 1, 'combo pop'),
(9, 'combo 3 en 1', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '420', 2, 'combo 3 en 1'),
(10, 'Groovy', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '18000', 1, 'Hamburguesas ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyeccion`
--

DROP TABLE IF EXISTS `proyeccion`;
CREATE TABLE IF NOT EXISTS `proyeccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelicula_id` int(11) DEFAULT NULL,
  `sala_id` int(11) DEFAULT NULL,
  `horario_inicio` datetime DEFAULT NULL,
  `horario_fin` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelicula_id_idx` (`pelicula_id`),
  KEY `fk_id_sala_idx` (`sala_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyeccion`
--

INSERT INTO `proyeccion` (`id`, `pelicula_id`, `sala_id`, `horario_inicio`, `horario_fin`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2020-06-10 18:00:00', '2020-06-10 19:20:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 1, 2, '2020-06-10 09:00:00', '2020-06-10 11:30:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 3, 1, '2020-06-10 10:30:00', '2020-06-10 10:00:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 2, 2, '2020-06-14 14:00:00', '2020-06-14 16:00:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(5, 2, 2, '2020-06-11 08:30:00', '2020-06-11 11:15:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(6, 3, 1, '2020-06-12 07:30:00', '2020-06-12 10:00:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `nombre`, `capacidad`, `created_at`, `updated_at`) VALUES
(1, 'Sala 1', 10, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 'Sala 2', 20, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 'Sala 3', 20, '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_boleta`
--

DROP TABLE IF EXISTS `tipo_boleta`;
CREATE TABLE IF NOT EXISTS `tipo_boleta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_boleta`
--

INSERT INTO `tipo_boleta` (`id`, `descripcion`, `created_at`, `updated_at`, `costo`) VALUES
(1, 'normal', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '10000'),
(2, 'Preferencial ', '2020-05-22 00:00:00', '2020-05-22 00:00:00', '15000');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD CONSTRAINT `fk_asla_id_asientos` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asientos_ocupados`
--
ALTER TABLE `asientos_ocupados`
  ADD CONSTRAINT `fk_asientos_id_x` FOREIGN KEY (`asientos_id`) REFERENCES `asientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyeccion_id_x` FOREIGN KEY (`proyeccion_id`) REFERENCES `proyeccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyeccion_id` FOREIGN KEY (`proyeccion_id`) REFERENCES `proyeccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `tipo_boleta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `boleta_productos`
--
ALTER TABLE `boleta_productos`
  ADD CONSTRAINT `fk_boleta_productos` FOREIGN KEY (`boleta_id`) REFERENCES `boleta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_clientes` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `fk_clasificacion_id` FOREIGN KEY (`clasificacion_id`) REFERENCES `clasificaion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_producto` (`id`);

--
-- Filtros para la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD CONSTRAINT `fk_id_sala` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pelicula_id` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
