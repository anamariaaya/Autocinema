-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 30-09-2020 a las 16:48:11
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Estructura de tabla para la tabla `boleta`
--

DROP TABLE IF EXISTS `boleta`;
CREATE TABLE IF NOT EXISTS `boleta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_boleta_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `proyeccion_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proyeccion_id_idx` (`proyeccion_id`),
  KEY `fk_cliente_id_idx` (`cliente_id`),
  KEY `fk_boleta_tipo_boleta1_idx` (`tipo_boleta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `boleta`
--

INSERT INTO `boleta` (`id`, `tipo_boleta_id`, `cliente_id`, `proyeccion_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 1, 2, 1, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 1, 2, 1, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 1, 1, 2, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(5, 1, 1, 2, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(6, 1, 1, 2, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(7, 1, 1, 3, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(8, 1, 1, 3, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(9, 1, 3, 4, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(10, 1, 3, 4, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(11, 1, 3, 5, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(12, 1, 1, 4, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(13, 1, 3, 3, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(14, 1, 2, 4, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(15, 1, 2, 4, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(16, 1, 8, 1, '2020-06-16 17:14:15', '2020-06-16 17:14:15'),
(17, 1, 9, 1, '2020-06-16 18:14:26', '2020-06-16 18:14:26'),
(18, 1, 10, 1, '2020-06-16 18:15:34', '2020-06-16 18:15:34'),
(19, 1, 11, 1, '2020-06-16 18:16:26', '2020-06-16 18:16:26'),
(20, 1, 12, 1, '2020-06-16 18:16:51', '2020-06-16 18:16:51'),
(21, 1, 13, 1, '2020-06-16 18:17:00', '2020-06-16 18:17:00'),
(22, 1, 14, 1, '2020-06-17 02:07:04', '2020-06-17 02:07:04'),
(23, 1, 15, 1, '2020-06-17 02:08:36', '2020-06-17 02:08:36'),
(24, 1, 16, 1, '2020-06-17 02:27:06', '2020-06-17 02:27:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Crispetas', '2020-06-04 00:00:00', '2020-06-04 00:00:00'),
(2, 'Combos', '2020-06-04 00:00:00', '2020-06-04 00:00:00'),
(3, 'Bebidas', '2020-06-04 00:00:00', '2020-06-04 00:00:00'),
(4, 'A la Carta', '2020-06-04 00:00:00', '2020-06-04 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificaion`
--

DROP TABLE IF EXISTS `clasificaion`;
CREATE TABLE IF NOT EXISTS `clasificaion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clasificaion`
--

INSERT INTO `clasificaion` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Todo publico', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 'Mayor de 13 años', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 'Mayor de 15 años', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 'Mayor de 18 años', '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `email`, `telefono`, `created_at`, `updated_at`, `direccion`, `cedula`, `placa`) VALUES
(1, 'Andres Felipe ', 'andres.lopezma@hotmail.com', '7762039', '2020-05-22 00:00:00', '2020-05-22 00:00:00', NULL, NULL, NULL),
(2, 'Alexander', 'alex@hotmail.com', '315465897', '2020-05-22 00:00:00', '2020-05-22 00:00:00', NULL, NULL, NULL),
(3, 'Usuario 3', 'usuario@hotmai.com', '31546895', '2020-05-22 00:00:00', '2020-05-22 00:00:00', NULL, NULL, NULL),
(5, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 16:58:01', '2020-06-16 16:58:01', 'carera 10', '1024580021', 'ASD231'),
(6, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 17:08:37', '2020-06-16 17:08:37', 'carera 10', '1024580021', 'ASD231'),
(7, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 17:14:05', '2020-06-16 17:14:05', 'carera 10', '1024580021', 'ASD231'),
(8, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 17:14:14', '2020-06-16 17:14:14', 'carera 10', '1024580021', 'ASD231'),
(9, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 18:14:26', '2020-06-16 18:14:26', 'carera 10', '1024580021', 'ASD231'),
(10, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 18:15:34', '2020-06-16 18:15:34', 'carera 10', '1024580021', 'ASD231'),
(11, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 18:16:26', '2020-06-16 18:16:26', 'carera 10', '1024580021', 'ASD231'),
(12, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 18:16:50', '2020-06-16 18:16:50', 'carera 10', '1024580021', 'ASD231'),
(13, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-16 18:17:00', '2020-06-16 18:17:00', 'carera 10', '1024580021', 'ASD231'),
(14, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-17 02:07:03', '2020-06-17 02:07:03', 'carera 10', '1024580021', 'ASD231'),
(15, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-17 02:08:36', '2020-06-17 02:08:36', 'carera 10', '1024580021', 'ASD231'),
(16, 'Andres Lopez', 'andres.lopezma', '7762039', '2020-06-17 02:27:06', '2020-06-17 02:27:06', 'carera 10', '1024580021', 'ASD231');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_productos`
--

DROP TABLE IF EXISTS `clientes_productos`;
CREATE TABLE IF NOT EXISTS `clientes_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_productos_idx` (`cliente_id`),
  KEY `fk_productos_clientes_idx` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `portada` varchar(45) DEFAULT NULL,
  `sinopsis` longtext,
  `trailer` longtext,
  `descripcion` longtext,
  `duracion` decimal(10,0) DEFAULT NULL,
  `clasificacion_id` int DEFAULT NULL,
  `genero_id` int DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genero_id_idx` (`genero_id`),
  KEY `fk_clasificacion_id_idx` (`clasificacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `titulo`, `portada`, `sinopsis`, `trailer`, `descripcion`, `duracion`, `clasificacion_id`, `genero_id`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'Pelicula 1', 'portada pelicula 1', 'Sinopsis de la pelicula 1 ', 'Trailer de la pelicula 1', 'descripcion de la pelicula 1', '90', 1, 1, 'public/imagenes/poster-2.png', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 'Pelicula 2', 'portada pelicual 2', 'sinopsis pelicula 2', 'trailer peliucla 2', 'descripcion de la pelicual 2', '120', 2, 2, 'public/imagenes/poster-2.png', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 'Pelicula 3', 'portada pelicula 3', 'Sinopsis pelicula 3', 'trailer pelicula 3', 'descripcion pelicula 3', '200', 4, 3, 'public/imagenes/poster-2.png', '2020-05-22 00:00:00', '2020-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `subCategoria_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_subcategoria_idx` (`subCategoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `descripcion`, `costo`, `created_at`, `updated_at`, `subCategoria_id`) VALUES
(1, '1 Crispeta media, 2 gaseosas y 1 Brownie', '20000', NULL, NULL, 2),
(2, '1 Crispetas grandes, 2 Gaseosas y 2 Brownie', '30000', NULL, NULL, 7),
(3, '1 Crispetas medianas, 2 Hot dog y 2 Gaseosas', '35000', NULL, NULL, 8),
(4, '1 Crispetas medianas, 2 Gaseosas y 1 Nachos con queso cheddar', '33000', NULL, NULL, 9),
(5, '1 Crispetas medianas, 1 Gaseosa y 1 Brownie', '25000', NULL, NULL, 10),
(6, 'Crispetas medianas', '8900', NULL, NULL, 1),
(7, 'Crispetas Grandes', '14900', NULL, NULL, 1),
(8, 'Hot dog', '10000', NULL, NULL, 4),
(9, 'Gaseosas', '3500', NULL, NULL, 3),
(10, 'Nachos con queso cheddar', '8900', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyeccion`
--

DROP TABLE IF EXISTS `proyeccion`;
CREATE TABLE IF NOT EXISTS `proyeccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pelicula_id` int DEFAULT NULL,
  `sala_id` int DEFAULT NULL,
  `horario_inicio` datetime DEFAULT NULL,
  `horario_fin` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pelicula_id_idx` (`pelicula_id`),
  KEY `fk_id_sala_idx` (`sala_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyeccion`
--

INSERT INTO `proyeccion` (`id`, `pelicula_id`, `sala_id`, `horario_inicio`, `horario_fin`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2020-09-20 18:00:00', '2020-09-11 19:20:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(2, 1, 2, '2020-09-20 09:00:00', '2020-09-12 11:30:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 3, 1, '2020-09-20 07:30:00', '2020-09-13 10:00:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 2, 2, '2020-09-20 14:00:00', '2020-09-14 16:00:00', '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(5, 2, 2, '2020-09-15 08:30:00', '2020-09-15 11:15:00', '2020-07-08 00:00:00', '2020-05-22 00:00:00'),
(6, 2, 1, '2020-10-01 04:30:00', '2020-09-10 10:00:00', '2020-06-02 00:00:00', '2020-06-02 00:00:00'),
(7, 1, 1, '2020-10-01 13:00:00', '2020-09-17 15:00:00', '2020-06-02 00:00:00', '2020-06-02 00:00:00'),
(8, 2, 3, '2020-10-01 11:00:00', '2020-09-28 16:00:00', '2020-06-04 00:00:00', '2020-06-04 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `nombre`, `capacidad`, `created_at`, `updated_at`) VALUES
(1, 'nombre de la sala 1', 10, '2020-05-22 00:00:00', '2020-06-18 01:05:59'),
(2, 'Sala 2', 20, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(3, 'Sala 3', 20, '2020-05-22 00:00:00', '2020-05-22 00:00:00'),
(4, 'nombre de la sala', 10, '2020-06-18 00:59:37', '2020-06-18 00:59:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
CREATE TABLE IF NOT EXISTS `subcategoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `categoria_producto_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `subcategoria_categoria_fk_idx` (`categoria_producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id`, `descripcion`, `categoria_producto_id`, `created_at`, `updated_at`) VALUES
(1, 'Crispetas', 1, '2020-09-16 22:27:26', '2020-09-16 22:27:26'),
(2, 'Combo 1', 2, '2020-09-16 22:27:26', '2020-09-16 22:27:26'),
(3, 'Gaseosas', 3, '2020-09-16 22:27:26', '2020-09-16 22:27:26'),
(4, 'Hot dogs', 4, '2020-09-16 22:27:26', '2020-09-16 22:27:26'),
(5, 'Nachos', 4, '2020-09-16 22:27:26', '2020-09-16 22:27:26'),
(7, 'Combo 2', 2, '2020-09-16 22:34:26', '2020-09-16 22:34:26'),
(8, 'Combo 3', 2, '2020-09-16 22:34:26', '2020-09-16 22:34:26'),
(9, 'Combo 4', 2, '2020-09-16 22:34:26', '2020-09-16 22:34:26'),
(10, 'Combo 5', 2, '2020-09-16 22:34:26', '2020-09-16 22:34:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_boleta`
--

DROP TABLE IF EXISTS `tipo_boleta`;
CREATE TABLE IF NOT EXISTS `tipo_boleta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo_fijo` decimal(10,0) DEFAULT NULL,
  `costo_descuento` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_boleta`
--

INSERT INTO `tipo_boleta` (`id`, `nombre`, `descripcion`, `costo_fijo`, `costo_descuento`, `created_at`, `updated_at`) VALUES
(1, 'Entrada', 'Entrada', '45000', '45000', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(2, 'Entrada + Combo 1', '1 Crispeta grande 2 gaseosas', '70000', '55000', '2020-09-15 00:00:00', '2020-09-15 00:00:00'),
(3, 'Entrada + Combo 2', '2 Crispetas grandes 4 gaseosas', '100000', '70000', '2020-09-15 00:00:00', '2020-09-15 00:00:00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `fk_boleta_tipo_boleta1` FOREIGN KEY (`tipo_boleta_id`) REFERENCES `tipo_boleta` (`id`),
  ADD CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `fk_proyeccion_id` FOREIGN KEY (`proyeccion_id`) REFERENCES `proyeccion` (`id`);

--
-- Filtros para la tabla `clientes_productos`
--
ALTER TABLE `clientes_productos`
  ADD CONSTRAINT `fk_cliente_productos` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `fk_productos_clientes` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `fk_clasificacion_id` FOREIGN KEY (`clasificacion_id`) REFERENCES `clasificaion` (`id`),
  ADD CONSTRAINT `fk_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_subcategoria` FOREIGN KEY (`subCategoria_id`) REFERENCES `subcategoria` (`id`);

--
-- Filtros para la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD CONSTRAINT `fk_id_sala` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`id`),
  ADD CONSTRAINT `fk_pelicula_id` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `subcategoria_categoria_fk` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_producto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
