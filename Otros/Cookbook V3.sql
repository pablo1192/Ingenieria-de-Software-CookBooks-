-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2014 at 04:21 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cookbook`
--
CREATE DATABASE IF NOT EXISTS `cookbook` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `cookbook`;

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Sin Autor', '2014-05-01 00:00:00', '2014-05-01 00:00:00'),
(2, 'Carmen Valldejuli', NULL, NULL),
(3, 'Kristen Feola', NULL, NULL),
(4, 'Mirta G. Carabajal', NULL, NULL),
(5, 'Petrona C. de Gandulfo', NULL, NULL),
(6, 'Christine Bailey', NULL, NULL),
(7, 'Toni Rodriguez', NULL, NULL),
(8, 'Cecilia Fassardi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `editorial`
--

CREATE TABLE IF NOT EXISTS `editorial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `editorial`
--

INSERT INTO `editorial` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Sin Editorial', '2014-05-01 00:00:00', '2014-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `etiqueta`
--

CREATE TABLE IF NOT EXISTS `etiqueta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `etiqueta`
--

INSERT INTO `etiqueta` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Sin Etiqueta', '2014-05-01 00:00:00', '2014-05-01 00:00:00'),
(2, 'criolla', NULL, NULL),
(3, 'cupcakes', NULL, NULL),
(4, 'guía', NULL, NULL),
(5, 'jugos', NULL, NULL),
(6, 'viandas', NULL, NULL),
(7, 'recetas', NULL, NULL),
(8, 'rústica', NULL, NULL),
(9, 'zumos', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `idioma`
--

CREATE TABLE IF NOT EXISTS `idioma` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `idioma`
--

INSERT INTO `idioma` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Español', NULL, NULL),
(2, 'Inglés', NULL, NULL),
(3, 'Alemán', NULL, NULL),
(4, 'Francés', NULL, NULL),
(5, 'Italiano', NULL, NULL),
(6, 'Portugués', NULL, NULL),
(7, 'Japonés', NULL, NULL),
(8, 'Chino', NULL, NULL),
(9, 'Coreano', NULL, NULL),
(10, 'Árabe', NULL, NULL),
(11, 'Turco', NULL, NULL),
(12, 'Ruso', NULL, NULL),
(13, 'Polaco', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE IF NOT EXISTS `libro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isbn` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `título` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `hojas` smallint(6) NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  `agotado` tinyint(1) NOT NULL,
  `tapa` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `índice` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `añoEdición` smallint(6) NOT NULL,
  `editorial_id` int(10) unsigned NOT NULL,
  `idioma_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Libro_1` (`editorial_id`),
  KEY `idioma_id` (`idioma_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `libro`
--

INSERT INTO `libro` (`id`, `isbn`, `título`, `hojas`, `precio`, `agotado`, `tapa`, `índice`, `añoEdición`, `editorial_id`, `idioma_id`, `created_at`, `updated_at`) VALUES
(1, '882894293', 'Cocina criolla', 87, '58.99', 0, '882894293.jpg', '882894293.jpg', 1983, 1, 1, NULL, NULL),
(2, '123456789', 'La guía óptima para el ayuno de Daniel', 68, '69.00', 0, '123456789.jpg', '123456789.jpg', 2001, 1, 1, NULL, NULL),
(3, '879548481', 'Las mejores recetas de rico y abundante', 70, '87.45', 0, '879548481.jpg', '879548481.jpg', 2012, 1, 1, NULL, NULL),
(4, '888444777', 'Cocina con calor de hogar - rústica', 154, '152.21', 0, '888444777.jpg', '888444777.jpg', 2006, 1, 1, NULL, NULL),
(5, '878987655', 'La dieta de los zumos', 54, '99.99', 0, '878987655.jpg', '878987655.jpg', 1999, 1, 1, NULL, NULL),
(6, '1478523698', 'Cupcakes veganos', 55, '47.80', 0, '1478523698.jpg', '1478523698.jpg', 2011, 1, 1, NULL, NULL),
(7, '8521479632', 'El libro de las viandas para pequeños', 87, '79.84', 0, '8521479632.jpg', '8521479632.jpg', 2012, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `libroautor`
--

CREATE TABLE IF NOT EXISTS `libroautor` (
  `libro_id` int(10) unsigned NOT NULL,
  `autor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`libro_id`,`autor_id`),
  KEY `fk_LibroAutor_1` (`libro_id`),
  KEY `fk_LibroAutor_2` (`autor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `libroautor`
--

INSERT INTO `libroautor` (`libro_id`, `autor_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `libroetiqueta`
--

CREATE TABLE IF NOT EXISTS `libroetiqueta` (
  `libro_id` int(10) unsigned NOT NULL,
  `etiqueta_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`libro_id`,`etiqueta_id`),
  KEY `fk_LibroEtiqueta_1` (`libro_id`),
  KEY `fk_LibroEtiqueta_2` (`etiqueta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `libroetiqueta`
--

INSERT INTO `libroetiqueta` (`libro_id`, `etiqueta_id`) VALUES
(1, 2),
(2, 4),
(3, 7),
(4, 8),
(5, 5),
(5, 9),
(6, 3),
(7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `libropedido`
--

CREATE TABLE IF NOT EXISTS `libropedido` (
  `libro_id` int(10) unsigned NOT NULL,
  `pedido_id` int(10) unsigned NOT NULL,
  `cantidad` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`libro_id`,`pedido_id`),
  KEY `fk_LibroPedido_1` (`libro_id`),
  KEY `fk_LibroPedido_2` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `localidad`
--

CREATE TABLE IF NOT EXISTS `localidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `provincia_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Localidad_1` (`provincia_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `localidad`
--

INSERT INTO `localidad` (`id`, `nombre`, `provincia_id`, `created_at`, `updated_at`) VALUES
(2, 'La Plata', 1, '2014-05-01 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asunto` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cuerpo` varchar(512) COLLATE utf8_spanish_ci DEFAULT NULL,
  `leído` tinyint(1) DEFAULT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Mensaje_1` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monto` decimal(8,2) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'p',
  `usuario_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Pedido_1` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `provincia`
--

INSERT INTO `provincia` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Buenos Aires', '2014-05-01 00:00:00', '2014-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `registrodeerrores`
--

CREATE TABLE IF NOT EXISTS `registrodeerrores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `descripción` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RegistroDeErrores_1` (`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipodeerror`
--

CREATE TABLE IF NOT EXISTS `tipodeerror` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `esAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `dni` int(11) DEFAULT NULL,
  `teléfono` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bloqueado` tinyint(1) DEFAULT '0',
  `dadoDeBaja` tinyint(1) DEFAULT '0',
  `dir_número` smallint(6) DEFAULT NULL,
  `dir_depto` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dir_calle` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidad_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Usuario_1` (`localidad_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `email`, `contraseña`, `esAdmin`, `dni`, `teléfono`, `bloqueado`, `dadoDeBaja`, `dir_número`, `dir_depto`, `dir_calle`, `localidad_id`, `created_at`, `updated_at`) VALUES
(1, 'Ruben', '***', 'admin@gmail.com', '$2y$10$WBTcG5CT3sNfD88/MBZjBuAmYn8OwfctuD/vT70P6W3wrreMbyifa', 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2014-05-01 00:00:00', '2014-05-01 00:00:00'),
(2, 'Carlos', 'Sanchez', 'csanchez@gmail.com', '$2y$10$axTLXQNhxJFVyihyHv2pGuZCNEQgfnCskpPNKYlUZcZjqNRuJxxIO', 0, 11454789, NULL, 0, 0, NULL, NULL, NULL, NULL, '1983-03-31 00:00:00', '0000-00-00 00:00:00'),
(3, 'Roberto', 'Juarez', 'rjuarez@gmail.com', '$2y$10$axTLXQNhxJFVyihyHv2pGuZCNEQgfnCskpPNKYlUZcZjqNRuJxxIO', 0, 10222333, NULL, 0, 0, NULL, NULL, NULL, NULL, '2001-08-25 00:00:00', '0000-00-00 00:00:00'),
(4, 'Ariel', 'Pasini', 'apasini@gmail.com', '$2y$10$axTLXQNhxJFVyihyHv2pGuZCNEQgfnCskpPNKYlUZcZjqNRuJxxIO', 0, 30876961, NULL, 0, 0, NULL, NULL, NULL, NULL, '2012-07-24 00:00:00', '0000-00-00 00:00:00'),
(5, 'Nicolás', 'Galdámez', 'ngaldamez@gmail.com', '$2y$10$axTLXQNhxJFVyihyHv2pGuZCNEQgfnCskpPNKYlUZcZjqNRuJxxIO', 0, 2968741, NULL, 0, 0, NULL, NULL, NULL, NULL, '2006-06-06 00:00:00', '0000-00-00 00:00:00'),
(6, 'Sebastián', 'Eguren', 'seuguren@gmail.com', '$2y$10$axTLXQNhxJFVyihyHv2pGuZCNEQgfnCskpPNKYlUZcZjqNRuJxxIO', 0, 3478987, NULL, 0, 0, NULL, NULL, NULL, NULL, '1999-05-03 00:00:00', '0000-00-00 00:00:00'),
(7, 'María', 'Lopez', 'mlopez@gmail.com', '$2y$10$axTLXQNhxJFVyihyHv2pGuZCNEQgfnCskpPNKYlUZcZjqNRuJxxIO', 0, 12547897, NULL, 0, 0, NULL, NULL, NULL, NULL, '2011-01-02 00:00:00', '0000-00-00 00:00:00'),
(8, 'Catalina', 'Perez', 'cperez@gmail.com', '$2y$10$axTLXQNhxJFVyihyHv2pGuZCNEQgfnCskpPNKYlUZcZjqNRuJxxIO', 0, 14879564, NULL, 0, 0, NULL, NULL, NULL, NULL, '2012-01-01 00:00:00', '0000-00-00 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `fk_Libro_2` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Libro_1` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `libroautor`
--
ALTER TABLE `libroautor`
  ADD CONSTRAINT `fk_LibroAutor_1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LibroAutor_2` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `libroetiqueta`
--
ALTER TABLE `libroetiqueta`
  ADD CONSTRAINT `fk_LibroEtiqueta_1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LibroEtiqueta_2` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiqueta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `libropedido`
--
ALTER TABLE `libropedido`
  ADD CONSTRAINT `fk_LibroPedido_1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LibroPedido_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `fk_Localidad_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `fk_Mensaje_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registrodeerrores`
--
ALTER TABLE `registrodeerrores`
  ADD CONSTRAINT `fk_RegistroDeErrores_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipodeerror` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
