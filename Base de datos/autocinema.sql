-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-05-2020 a las 22:30:44
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_productos`
--

DROP TABLE IF EXISTS `clientes_productos`;
CREATE TABLE IF NOT EXISTS `clientes_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_productos_idx` (`cliente_id`),
  KEY `fk_productos_clientes_idx` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_combos`
--

DROP TABLE IF EXISTS `cliente_combos`;
CREATE TABLE IF NOT EXISTS `cliente_combos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `combo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_id_idx` (`cliente_id`),
  KEY `fk_combos_idx` (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combos`
--

DROP TABLE IF EXISTS `combos`;
CREATE TABLE IF NOT EXISTS `combos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `cliente_combo_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combos_productos`
--

DROP TABLE IF EXISTS `combos_productos`;
CREATE TABLE IF NOT EXISTS `combos_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `combo_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_combo_id_idx` (`combo_id`),
  KEY `fk_produtos_id_idx` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `restaurante_id` int(11) DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_restaurantes`
--

DROP TABLE IF EXISTS `productos_restaurantes`;
CREATE TABLE IF NOT EXISTS `productos_restaurantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productos_id` int(11) DEFAULT NULL,
  `restaurantes_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_id_idx` (`productos_id`),
  KEY `fk_restaurante_id_idx` (`restaurantes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyeccion`
--

INSERT INTO `proyeccion` (`id`, `pelicula_id`, `sala_id`, `horario_inicio`, `horario_fin`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2020-05-22 18:00:00', '2020-05-22 19:20:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 1, 2, '2020-05-23 09:00:00', '2020-05-22 11:30:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 3, 1, '2020-05-24 07:30:00', '2020-05-24 10:00:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 2, 2, '2020-05-25 14:00:00', '2020-05-25 16:00:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(5, 2, 2, '2020-05-25 08:30:00', '2020-05-22 11:15:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurantes`
--

DROP TABLE IF EXISTS `restaurantes`;
CREATE TABLE IF NOT EXISTS `restaurantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Filtros para la tabla `clientes_productos`
--
ALTER TABLE `clientes_productos`
  ADD CONSTRAINT `fk_cliente_productos` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_clientes` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente_combos`
--
ALTER TABLE `cliente_combos`
  ADD CONSTRAINT `fk_cliente_id_x` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_combos_x` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `combos_productos`
--
ALTER TABLE `combos_productos`
  ADD CONSTRAINT `fk_combo_id` FOREIGN KEY (`combo_id`) REFERENCES `combos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produtos_id` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `fk_clasificacion_id` FOREIGN KEY (`clasificacion_id`) REFERENCES `clasificaion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos_restaurantes`
--
ALTER TABLE `productos_restaurantes`
  ADD CONSTRAINT `fk_producto_id` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_restaurante_id` FOREIGN KEY (`restaurantes_id`) REFERENCES `restaurantes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
