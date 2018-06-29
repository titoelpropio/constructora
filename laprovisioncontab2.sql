-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2018 a las 22:19:41
-- Versión del servidor: 5.6.27-log
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laprovisioncontab2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento`
--

CREATE TABLE IF NOT EXISTS `asiento` (
  `id` int(11) NOT NULL,
  `nro_asiento` int(11) DEFAULT NULL,
  `tipo` tinyint(4) DEFAULT NULL,
  `glosa` varchar(500) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_transaccion` datetime DEFAULT NULL,
  `cambio_tipo` decimal(6,2) NOT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `motivo_anulado` varchar(200) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_gestion` int(11) DEFAULT NULL,
  `id_tipo_cambio` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asiento`
--

INSERT INTO `asiento` (`id`, `nro_asiento`, `tipo`, `glosa`, `fecha_creacion`, `fecha_transaccion`, `cambio_tipo`, `estado`, `motivo_anulado`, `id_categoria`, `id_gestion`, `id_tipo_cambio`, `id_usuario`, `id_moneda`, `deleted_at`) VALUES
(1, 1, 1, 'adfadf', '2018-02-28 01:25:16', '2018-02-27 21:25:16', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(2, 2, 3, 'asdfadf', '2018-03-01 00:16:36', '2018-02-28 20:16:36', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(3, 3, 3, 'asdfgsdf', '2018-03-01 00:18:55', '2018-02-28 20:18:55', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(4, 4, 3, 'adfadfadf', '2018-03-01 00:20:34', '2018-02-28 20:20:34', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(5, 5, 3, 'asdfasdf', '2018-03-01 00:23:15', '2018-02-28 20:23:15', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(6, 6, 3, 'adfadf', '2018-03-01 00:27:15', '2018-02-28 20:27:15', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(7, 7, 3, 'sfdgsfg', '2018-03-01 00:30:45', '2018-02-28 20:30:45', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(8, 8, 3, 'sfgsfg', '2018-03-01 00:31:45', '2018-02-28 20:31:45', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(9, 9, 3, 'srfgsfg', '2018-03-01 00:34:09', '2018-02-28 20:34:09', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(10, 10, 3, 'sfgsfg', '2018-03-01 00:34:58', '2018-02-28 20:34:58', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(11, 11, 3, 'asdsadf', '2018-03-01 00:35:37', '2018-02-28 20:35:37', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(12, 12, 3, 'sfgsfg', '2018-03-01 00:37:24', '2018-02-28 20:37:24', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(13, 13, 3, 'adfadf', '2018-03-01 20:46:47', '2018-03-01 16:46:47', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(14, 14, 1, 'edfgdfgdfg', '2018-03-01 20:50:54', '2018-03-01 16:50:54', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(15, 15, 1, 'wdefsdf', '2018-03-02 21:23:30', '2018-03-02 17:23:30', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(17, 16, 3, 'adfadfadf', '2018-03-02 22:07:42', '2018-03-02 18:07:42', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(21, 17, 3, 'sfgsfg', '2018-03-02 22:15:52', '2018-03-02 18:15:52', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(22, 18, 3, 'sfgsfg', '2018-03-03 23:18:15', '2018-03-03 19:18:15', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(23, 19, 1, 'adfadf', '2018-03-06 02:38:02', '2018-03-05 22:38:02', '6.96', 1, NULL, 1, 1, 1, 4, 1, NULL),
(24, 20, 3, 'dsftghsfg', '2018-03-07 02:38:08', '2018-03-06 22:38:08', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(25, 21, 3, 'sdfasdf', '2018-03-11 18:52:33', '2018-03-11 14:52:33', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(26, 22, 1, 'wsdfsdf', '2018-03-11 20:12:48', '2018-03-11 16:12:48', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(27, 23, 3, 'rdfgdfg', '2018-03-11 20:13:49', '0000-00-00 00:00:00', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(28, 24, 3, 'sfgsfgsdfg', '2018-03-11 20:23:48', '0000-00-00 00:00:00', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(29, 25, 3, 'SDFGSFDG', '2018-03-11 20:32:31', '0000-00-00 00:00:00', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(30, 26, 3, 'asdfadsf', '2018-03-11 23:24:40', '0000-00-00 00:00:00', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(31, 27, 3, 'sfgsfgsdfg', '2018-03-12 00:23:14', '2018-03-11 20:23:14', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizacionpago`
--

CREATE TABLE IF NOT EXISTS `autorizacionpago` (
  `id` int(11) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idPago` int(11) DEFAULT NULL,
  `moneda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE IF NOT EXISTS `banco` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id`, `nombre`, `deleted_at`) VALUES
(3, 'Banco Union', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`, `deleted_at`) VALUES
(1, 'Administrador', NULL),
(2, 'Secretaria', NULL),
(3, 'Gestor Venta', NULL),
(4, 'Administrador Provision', NULL),
(5, 'Gerencia Venta', NULL),
(6, 'Asesor de Venta', NULL),
(7, 'Vendedor', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriacuenta`
--

CREATE TABLE IF NOT EXISTS `categoriacuenta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoriacuenta`
--

INSERT INTO `categoriacuenta` (`id`, `nombre`, `deleted_at`) VALUES
(1, 'Asiento Diario', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorialote`
--

CREATE TABLE IF NOT EXISTS `categorialote` (
  `id` int(11) NOT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorialote`
--

INSERT INTO `categorialote` (`id`, `categoria`, `idProyecto`, `descripcion`, `deleted_at`) VALUES
(13, 'C', 3, 'Area Común sobre Calles', NULL),
(14, 'B', 1, 'Area Preferencial (Av. Principal, Aread Verdes y Equipamiento)', NULL),
(15, 'B', 3, 'Área Preferencial(Av. Principal, Áreas Verdes y Equipamiento)', NULL),
(16, 'C', 1, 'Areas Común sobre calles', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrocosto`
--

CREATE TABLE IF NOT EXISTS `centrocosto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `id_padre` int(11) NOT NULL,
  `hijo` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `utilizable` tinyint(4) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centrocosto`
--

INSERT INTO `centrocosto` (`id`, `codigo`, `id_padre`, `hijo`, `nombre`, `estado`, `utilizable`, `deleted_at`) VALUES
(1, '1.', 0, 0, 'Ventas', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `ci` int(11) NOT NULL,
  `expedido` varchar(5) NOT NULL,
  `lugarProcedencia` varchar(30) NOT NULL,
  `genero` varchar(30) NOT NULL,
  `celular` int(11) NOT NULL,
  `celular_ref` int(11) DEFAULT NULL,
  `estadoCivil` varchar(12) DEFAULT NULL,
  `ocupacion` varchar(30) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `nit` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellidos`, `fechaNacimiento`, `ci`, `expedido`, `lugarProcedencia`, `genero`, `celular`, `celular_ref`, `estadoCivil`, `ocupacion`, `domicilio`, `nit`, `deleted_at`, `idEmpleado`, `idPais`) VALUES
(3, 'Luis Alberto', 'Sandoval', '2017-07-12', 8888558, '', 'Santa Cruz', 'm', 65000000, 65000000, NULL, '', 'calle la Provision N° 90', 2147483647, NULL, 18, NULL),
(4, 'YNGRIY', 'ORTYS SEAS', '2017-07-04', 5389321, 'SC', 'Santa Cruz de la sierra', 'f', 5389321, 5389321, 'c', 'Vendedora', 'calle la Provision N° 90', 0, NULL, 41, 123),
(8, 'Katherine Scarlet', 'Roda Pecho', '1987-11-30', 4615356, '', 'Madrid España', 'f', 677334451, 0, NULL, '', '', 0, NULL, 40, NULL),
(9, 'SARAH', 'FRANCO DE SUAREZ', '1970-02-20', 3263993, 'SC', 'Santa cruz', 'f', 71662242, 71096655, 'c', 'Empleada', 'Urbanización el palmar uv. 171 manzano 25 casa 25', 0, NULL, 49, 123),
(10, 'ARMINDA', 'RIBERA VDA  DE FRERKING', '0000-00-00', 1677855, 'BN', 'BENI', 'f', 76043367, 78588287, 'v', 'AMA DE CASA', 'Tercer anillo interno calle las petas #2775', 0, NULL, 49, 123),
(11, 'CARLOS RODRIGO', 'DEL CASTILLO JUSTINIANO', '1981-04-23', 4713527, 'SC', 'LA PAZ', 'm', 69273994, 73123934, 's', 'INDEPENDIENTE', 'Avenida Brasil  3er anillo', 0, NULL, 35, 123),
(12, 'NARDA', 'CARDENAS SAINZ', '1976-09-12', 3730992, 'CB', 'COCHABAMBA', 'f', 79989089, 77389486, 's', 'ESTUDIANTE', 'Avenida oquendo #623', 0, NULL, 49, 123),
(13, 'ELIZABETH', 'RODRIGEZ', '2018-02-09', 8883510, 'SC', '', 'f', 72696811, 0, 's', 'CONTADORA', 'sdfgsfgsfg', 0, NULL, 4, 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigovendedor`
--

CREATE TABLE IF NOT EXISTS `codigovendedor` (
  `id` int(11) NOT NULL,
  `codigo` varchar(30) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE IF NOT EXISTS `cuenta` (
  `id` int(11) NOT NULL,
  `codigo` varchar(25) NOT NULL,
  `id_padre` int(11) NOT NULL,
  `hijo` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `utilizable` tinyint(4) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `codigo`, `id_padre`, `hijo`, `nombre`, `estado`, `utilizable`, `deleted_at`) VALUES
(1, '1.', 0, 1, 'ACTIVO', 1, 0, NULL),
(2, '2.', 0, 1, 'PASIVO', 1, 0, NULL),
(3, '1.1.', 1, 0, 'adfadf', 1, 1, NULL),
(4, '1.2.', 1, 0, 'Adsfadf', 1, 1, NULL),
(5, '1.3.', 1, 0, 'adfadf', 1, 1, NULL),
(6, '1.4.', 1, 0, 'adfadfaf', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaautomatica`
--

CREATE TABLE IF NOT EXISTS `cuentaautomatica` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentaautomatica`
--

INSERT INTO `cuentaautomatica` (`id`, `nombre`, `id_cuenta`, `deleted_at`) VALUES
(1, 'Caja', 3, NULL),
(2, 'Bancos', 3, NULL),
(3, 'Cuenta por Cobrar', 3, NULL),
(4, 'Ingreso Diferido', 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabanco`
--

CREATE TABLE IF NOT EXISTS `cuentabanco` (
  `id` int(11) NOT NULL,
  `nroCuenta` int(11) DEFAULT NULL,
  `idBanco` int(11) DEFAULT NULL,
  `tipoCuenta` varchar(30) DEFAULT NULL,
  `moneda` varchar(30) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentabanco`
--

INSERT INTO `cuentabanco` (`id`, `nroCuenta`, `idBanco`, `tipoCuenta`, `moneda`, `deleted_at`) VALUES
(4, 24788800, 3, 'BS', 'BOLIVIANOS', NULL),
(5, 24788652, 3, '$U$', 'DOLARES', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentagrupo`
--

CREATE TABLE IF NOT EXISTS `cuentagrupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaimpuesto`
--

CREATE TABLE IF NOT EXISTS `cuentaimpuesto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `porcentaje` decimal(4,2) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotaminima`
--

CREATE TABLE IF NOT EXISTS `cuotaminima` (
  `id` int(11) NOT NULL,
  `porcentaje` decimal(5,2) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuotaminima`
--

INSERT INTO `cuotaminima` (`id`, `porcentaje`, `idProyecto`, `deleted_at`, `updated_at`, `created_at`) VALUES
(9, '10.00', 1, NULL, NULL, NULL),
(10, '10.00', 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotas`
--

CREATE TABLE IF NOT EXISTS `cuotas` (
  `id` int(11) NOT NULL,
  `monto` decimal(9,2) DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL,
  `mora` int(11) DEFAULT NULL,
  `idPlandePago` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuotas`
--

INSERT INTO `cuotas` (`id`, `monto`, `fechaLimite`, `mora`, `idPlandePago`, `estado`, `deleted_at`) VALUES
(61, '10.00', '2018-04-01', 0, 2, 'p', NULL),
(62, '10.00', '2018-05-01', 0, 2, 'p', NULL),
(63, '10.00', '2018-06-01', 0, 2, 'p', NULL),
(64, '10.00', '2018-07-01', 0, 2, 'p', NULL),
(65, '10.00', '2018-08-01', 0, 2, 'p', NULL),
(66, '10.00', '2018-09-01', 0, 2, 'p', NULL),
(67, '10.00', '2018-10-01', 0, 2, 'p', NULL),
(68, '10.00', '2018-11-01', 0, 2, 'p', NULL),
(69, '10.00', '2018-12-01', 0, 2, 'p', NULL),
(70, '10.00', '2019-01-01', 0, 2, 'p', NULL),
(71, '10.00', '2019-02-01', 0, 2, 'p', NULL),
(72, '10.00', '2019-03-01', 0, 2, 'p', NULL),
(73, '10.00', '2019-04-01', 0, 2, 'p', NULL),
(74, '10.00', '2019-05-01', 0, 2, 'p', NULL),
(75, '10.00', '2019-06-01', 0, 2, 'p', NULL),
(76, '10.00', '2019-07-01', 0, 2, 'p', NULL),
(77, '10.00', '2019-08-01', 0, 2, 'p', NULL),
(78, '10.00', '2019-09-01', 0, 2, 'p', NULL),
(79, '10.00', '2019-10-01', 0, 2, 'p', NULL),
(80, '10.00', '2019-11-01', 0, 2, 'p', NULL),
(81, '10.00', '2019-12-01', 0, 2, 'p', NULL),
(82, '10.00', '2020-01-01', 0, 2, 'p', NULL),
(83, '10.00', '2020-02-01', 0, 2, 'p', NULL),
(84, '10.00', '2020-03-01', 0, 2, 'p', NULL),
(85, '10.00', '2020-04-01', 0, 2, 'p', NULL),
(86, '10.00', '2020-05-01', 0, 2, 'p', NULL),
(87, '10.00', '2020-06-01', 0, 2, 'p', NULL),
(88, '10.00', '2020-07-01', 0, 2, 'p', NULL),
(89, '10.00', '2020-08-01', 0, 2, 'p', NULL),
(90, '10.00', '2020-09-01', 0, 2, 'p', NULL),
(91, '10.00', '2020-10-01', 0, 2, 'p', NULL),
(92, '10.00', '2020-11-01', 0, 2, 'p', NULL),
(93, '10.00', '2020-12-01', 0, 2, 'p', NULL),
(94, '10.00', '2021-01-01', 0, 2, 'p', NULL),
(95, '10.00', '2021-02-01', 0, 2, 'p', NULL),
(96, '10.00', '2021-03-01', 0, 2, 'd', NULL),
(97, '10.00', '2021-04-01', 0, 2, 'd', NULL),
(98, '10.00', '2021-05-01', 0, 2, 'd', NULL),
(99, '10.00', '2021-06-01', 0, 2, 'd', NULL),
(100, '10.00', '2021-07-01', 0, 2, 'd', NULL),
(101, '10.00', '2021-08-01', 0, 2, 'd', NULL),
(102, '10.00', '2021-09-01', 0, 2, 'd', NULL),
(103, '10.00', '2021-10-01', 0, 2, 'd', NULL),
(104, '10.00', '2021-11-01', 0, 2, 'd', NULL),
(105, '10.00', '2021-12-01', 0, 2, 'd', NULL),
(106, '10.00', '2022-01-01', 0, 2, 'd', NULL),
(107, '10.00', '2022-02-01', 0, 2, 'd', NULL),
(108, '10.00', '2022-03-01', 0, 2, 'd', NULL),
(109, '10.00', '2022-04-01', 0, 2, 'd', NULL),
(110, '10.00', '2022-05-01', 0, 2, 'd', NULL),
(111, '10.00', '2022-06-01', 0, 2, 'd', NULL),
(112, '10.00', '2022-07-01', 0, 2, 'd', NULL),
(113, '10.00', '2022-08-01', 0, 2, 'd', NULL),
(114, '10.00', '2022-09-01', 0, 2, 'd', NULL),
(115, '10.00', '2022-10-01', 0, 2, 'd', NULL),
(116, '10.00', '2022-11-01', 0, 2, 'd', NULL),
(117, '10.00', '2022-12-01', 0, 2, 'd', NULL),
(118, '10.00', '2023-01-01', 0, 2, 'd', NULL),
(119, '10.00', '2023-02-01', 0, 2, 'd', NULL),
(120, '-16.00', '2023-03-01', 0, 2, 'd', NULL),
(301, '68.00', '2018-04-18', 0, 6, 'd', NULL),
(302, '68.00', '2018-05-18', 0, 6, 'd', NULL),
(303, '68.00', '2018-06-18', 0, 6, 'd', NULL),
(304, '68.00', '2018-07-18', 0, 6, 'd', NULL),
(305, '68.00', '2018-08-18', 0, 6, 'd', NULL),
(306, '68.00', '2018-09-18', 0, 6, 'd', NULL),
(307, '68.00', '2018-10-18', 0, 6, 'd', NULL),
(308, '68.00', '2018-11-18', 0, 6, 'd', NULL),
(309, '68.00', '2018-12-18', 0, 6, 'd', NULL),
(310, '68.00', '2019-01-18', 0, 6, 'd', NULL),
(311, '68.00', '2019-02-18', 0, 6, 'd', NULL),
(312, '68.00', '2019-03-18', 0, 6, 'd', NULL),
(313, '68.00', '2019-04-18', 0, 6, 'd', NULL),
(314, '68.00', '2019-05-18', 0, 6, 'd', NULL),
(315, '68.00', '2019-06-18', 0, 6, 'd', NULL),
(316, '68.00', '2019-07-18', 0, 6, 'd', NULL),
(317, '68.00', '2019-08-18', 0, 6, 'd', NULL),
(318, '68.00', '2019-09-18', 0, 6, 'd', NULL),
(319, '68.00', '2019-10-18', 0, 6, 'd', NULL),
(320, '68.00', '2019-11-18', 0, 6, 'd', NULL),
(321, '68.00', '2019-12-18', 0, 6, 'd', NULL),
(322, '68.00', '2020-01-18', 0, 6, 'd', NULL),
(323, '68.00', '2020-02-18', 0, 6, 'd', NULL),
(324, '68.00', '2020-03-18', 0, 6, 'd', NULL),
(325, '68.00', '2020-04-18', 0, 6, 'd', NULL),
(326, '68.00', '2020-05-18', 0, 6, 'd', NULL),
(327, '68.00', '2020-06-18', 0, 6, 'd', NULL),
(328, '68.00', '2020-07-18', 0, 6, 'd', NULL),
(329, '68.00', '2020-08-18', 0, 6, 'd', NULL),
(330, '68.00', '2020-09-18', 0, 6, 'd', NULL),
(331, '68.00', '2020-10-18', 0, 6, 'd', NULL),
(332, '68.00', '2020-11-18', 0, 6, 'd', NULL),
(333, '68.00', '2020-12-18', 0, 6, 'd', NULL),
(334, '68.00', '2021-01-18', 0, 6, 'd', NULL),
(335, '68.00', '2021-02-18', 0, 6, 'd', NULL),
(336, '68.00', '2021-03-18', 0, 6, 'd', NULL),
(337, '68.00', '2021-04-18', 0, 6, 'd', NULL),
(338, '68.00', '2021-05-18', 0, 6, 'd', NULL),
(339, '68.00', '2021-06-18', 0, 6, 'd', NULL),
(340, '68.00', '2021-07-18', 0, 6, 'd', NULL),
(341, '68.00', '2021-08-18', 0, 6, 'd', NULL),
(342, '68.00', '2021-09-18', 0, 6, 'd', NULL),
(343, '68.00', '2021-10-18', 0, 6, 'd', NULL),
(344, '68.00', '2021-11-18', 0, 6, 'd', NULL),
(345, '68.00', '2021-12-18', 0, 6, 'd', NULL),
(346, '68.00', '2022-01-18', 0, 6, 'd', NULL),
(347, '68.00', '2022-02-18', 0, 6, 'd', NULL),
(348, '68.00', '2022-03-18', 0, 6, 'd', NULL),
(349, '68.00', '2022-04-18', 0, 6, 'd', NULL),
(350, '68.00', '2022-05-18', 0, 6, 'd', NULL),
(351, '68.00', '2022-06-18', 0, 6, 'd', NULL),
(352, '68.00', '2022-07-18', 0, 6, 'd', NULL),
(353, '68.00', '2022-08-18', 0, 6, 'd', NULL),
(354, '68.00', '2022-09-18', 0, 6, 'd', NULL),
(355, '68.00', '2022-10-18', 0, 6, 'd', NULL),
(356, '68.00', '2022-11-18', 0, 6, 'd', NULL),
(357, '68.00', '2022-12-18', 0, 6, 'd', NULL),
(358, '68.00', '2023-01-18', 0, 6, 'd', NULL),
(359, '68.00', '2023-02-18', 0, 6, 'd', NULL),
(360, '38.00', '2023-03-18', 0, 6, 'd', NULL),
(361, '3.00', '2018-04-01', 0, 7, 'd', NULL),
(362, '3.00', '2018-05-01', 0, 7, 'd', NULL),
(363, '3.00', '2018-06-01', 0, 7, 'd', NULL),
(364, '3.00', '2018-07-01', 0, 7, 'd', NULL),
(365, '3.00', '2018-08-01', 0, 7, 'd', NULL),
(366, '3.00', '2018-09-01', 0, 7, 'd', NULL),
(367, '3.00', '2018-10-01', 0, 7, 'd', NULL),
(368, '3.00', '2018-11-01', 0, 7, 'd', NULL),
(369, '3.00', '2018-12-01', 0, 7, 'd', NULL),
(370, '3.00', '2019-01-01', 0, 7, 'd', NULL),
(371, '3.00', '2019-02-01', 0, 7, 'd', NULL),
(372, '3.00', '2019-03-01', 0, 7, 'd', NULL),
(373, '3.00', '2019-04-01', 0, 7, 'd', NULL),
(374, '3.00', '2019-05-01', 0, 7, 'd', NULL),
(375, '3.00', '2019-06-01', 0, 7, 'd', NULL),
(376, '3.00', '2019-07-01', 0, 7, 'd', NULL),
(377, '3.00', '2019-08-01', 0, 7, 'd', NULL),
(378, '3.00', '2019-09-01', 0, 7, 'd', NULL),
(379, '3.00', '2019-10-01', 0, 7, 'd', NULL),
(380, '3.00', '2019-11-01', 0, 7, 'd', NULL),
(381, '3.00', '2019-12-01', 0, 7, 'd', NULL),
(382, '3.00', '2020-01-01', 0, 7, 'd', NULL),
(383, '3.00', '2020-02-01', 0, 7, 'd', NULL),
(384, '3.00', '2020-03-01', 0, 7, 'd', NULL),
(385, '3.00', '2020-04-01', 0, 7, 'd', NULL),
(386, '3.00', '2020-05-01', 0, 7, 'd', NULL),
(387, '3.00', '2020-06-01', 0, 7, 'd', NULL),
(388, '3.00', '2020-07-01', 0, 7, 'd', NULL),
(389, '3.00', '2020-08-01', 0, 7, 'd', NULL),
(390, '3.00', '2020-09-01', 0, 7, 'd', NULL),
(391, '3.00', '2020-10-01', 0, 7, 'd', NULL),
(392, '3.00', '2020-11-01', 0, 7, 'd', NULL),
(393, '3.00', '2020-12-01', 0, 7, 'd', NULL),
(394, '3.00', '2021-01-01', 0, 7, 'd', NULL),
(395, '3.00', '2021-02-01', 0, 7, 'd', NULL),
(396, '3.00', '2021-03-01', 0, 7, 'd', NULL),
(397, '3.00', '2021-04-01', 0, 7, 'd', NULL),
(398, '3.00', '2021-05-01', 0, 7, 'd', NULL),
(399, '3.00', '2021-06-01', 0, 7, 'd', NULL),
(400, '3.00', '2021-07-01', 0, 7, 'd', NULL),
(401, '3.00', '2021-08-01', 0, 7, 'd', NULL),
(402, '3.00', '2021-09-01', 0, 7, 'd', NULL),
(403, '3.00', '2021-10-01', 0, 7, 'd', NULL),
(404, '3.00', '2021-11-01', 0, 7, 'd', NULL),
(405, '3.00', '2021-12-01', 0, 7, 'd', NULL),
(406, '3.00', '2022-01-01', 0, 7, 'd', NULL),
(407, '3.00', '2022-02-01', 0, 7, 'd', NULL),
(408, '3.00', '2022-03-01', 0, 7, 'd', NULL),
(409, '3.00', '2022-04-01', 0, 7, 'd', NULL),
(410, '3.00', '2022-05-01', 0, 7, 'd', NULL),
(411, '3.00', '2022-06-01', 0, 7, 'd', NULL),
(412, '3.00', '2022-07-01', 0, 7, 'd', NULL),
(413, '3.00', '2022-08-01', 0, 7, 'd', NULL),
(414, '3.00', '2022-09-01', 0, 7, 'd', NULL),
(415, '3.00', '2022-10-01', 0, 7, 'd', NULL),
(416, '3.00', '2022-11-01', 0, 7, 'd', NULL),
(417, '3.00', '2022-12-01', 0, 7, 'd', NULL),
(418, '3.00', '2023-01-01', 0, 7, 'd', NULL),
(419, '3.00', '2023-02-01', 0, 7, 'd', NULL),
(420, '-52.00', '2023-03-01', 0, 7, 'd', NULL),
(421, '63.00', '2018-04-05', 0, 8, 'd', NULL),
(422, '63.00', '2018-05-05', 0, 8, 'd', NULL),
(423, '63.00', '2018-06-05', 0, 8, 'd', NULL),
(424, '63.00', '2018-07-05', 0, 8, 'd', NULL),
(425, '63.00', '2018-08-05', 0, 8, 'd', NULL),
(426, '63.00', '2018-09-05', 0, 8, 'd', NULL),
(427, '63.00', '2018-10-05', 0, 8, 'd', NULL),
(428, '63.00', '2018-11-05', 0, 8, 'd', NULL),
(429, '63.00', '2018-12-05', 0, 8, 'd', NULL),
(430, '63.00', '2019-01-05', 0, 8, 'd', NULL),
(431, '63.00', '2019-02-05', 0, 8, 'd', NULL),
(432, '63.00', '2019-03-05', 0, 8, 'd', NULL),
(433, '63.00', '2019-04-05', 0, 8, 'd', NULL),
(434, '63.00', '2019-05-05', 0, 8, 'd', NULL),
(435, '63.00', '2019-06-05', 0, 8, 'd', NULL),
(436, '63.00', '2019-07-05', 0, 8, 'd', NULL),
(437, '63.00', '2019-08-05', 0, 8, 'd', NULL),
(438, '63.00', '2019-09-05', 0, 8, 'd', NULL),
(439, '63.00', '2019-10-05', 0, 8, 'd', NULL),
(440, '63.00', '2019-11-05', 0, 8, 'd', NULL),
(441, '63.00', '2019-12-05', 0, 8, 'd', NULL),
(442, '63.00', '2020-01-05', 0, 8, 'd', NULL),
(443, '63.00', '2020-02-05', 0, 8, 'd', NULL),
(444, '63.00', '2020-03-05', 0, 8, 'd', NULL),
(445, '63.00', '2020-04-05', 0, 8, 'd', NULL),
(446, '63.00', '2020-05-05', 0, 8, 'd', NULL),
(447, '63.00', '2020-06-05', 0, 8, 'd', NULL),
(448, '63.00', '2020-07-05', 0, 8, 'd', NULL),
(449, '63.00', '2020-08-05', 0, 8, 'd', NULL),
(450, '63.00', '2020-09-05', 0, 8, 'd', NULL),
(451, '63.00', '2020-10-05', 0, 8, 'd', NULL),
(452, '63.00', '2020-11-05', 0, 8, 'd', NULL),
(453, '63.00', '2020-12-05', 0, 8, 'd', NULL),
(454, '63.00', '2021-01-05', 0, 8, 'd', NULL),
(455, '63.00', '2021-02-05', 0, 8, 'd', NULL),
(456, '63.00', '2021-03-05', 0, 8, 'd', NULL),
(457, '63.00', '2021-04-05', 0, 8, 'd', NULL),
(458, '63.00', '2021-05-05', 0, 8, 'd', NULL),
(459, '63.00', '2021-06-05', 0, 8, 'd', NULL),
(460, '63.00', '2021-07-05', 0, 8, 'd', NULL),
(461, '63.00', '2021-08-05', 0, 8, 'd', NULL),
(462, '63.00', '2021-09-05', 0, 8, 'd', NULL),
(463, '63.00', '2021-10-05', 0, 8, 'd', NULL),
(464, '63.00', '2021-11-05', 0, 8, 'd', NULL),
(465, '63.00', '2021-12-05', 0, 8, 'd', NULL),
(466, '63.00', '2022-01-05', 0, 8, 'd', NULL),
(467, '63.00', '2022-02-05', 0, 8, 'd', NULL),
(468, '63.00', '2022-03-05', 0, 8, 'd', NULL),
(469, '63.00', '2022-04-05', 0, 8, 'd', NULL),
(470, '63.00', '2022-05-05', 0, 8, 'd', NULL),
(471, '63.00', '2022-06-05', 0, 8, 'd', NULL),
(472, '63.00', '2022-07-05', 0, 8, 'd', NULL),
(473, '63.00', '2022-08-05', 0, 8, 'd', NULL),
(474, '63.00', '2022-09-05', 0, 8, 'd', NULL),
(475, '63.00', '2022-10-05', 0, 8, 'd', NULL),
(476, '63.00', '2022-11-05', 0, 8, 'd', NULL),
(477, '63.00', '2022-12-05', 0, 8, 'd', NULL),
(478, '63.00', '2023-01-05', 0, 8, 'd', NULL),
(479, '63.00', '2023-02-05', 0, 8, 'd', NULL),
(480, '41.00', '2023-03-05', 0, 8, 'd', NULL),
(481, '135.00', '2018-04-19', 0, 9, 'd', NULL),
(482, '135.00', '2018-05-19', 0, 9, 'd', NULL),
(483, '135.00', '2018-06-19', 0, 9, 'd', NULL),
(484, '135.00', '2018-07-19', 0, 9, 'd', NULL),
(485, '135.00', '2018-08-19', 0, 9, 'd', NULL),
(486, '135.00', '2018-09-19', 0, 9, 'd', NULL),
(487, '135.00', '2018-10-19', 0, 9, 'd', NULL),
(488, '135.00', '2018-11-19', 0, 9, 'd', NULL),
(489, '135.00', '2018-12-19', 0, 9, 'd', NULL),
(490, '135.00', '2019-01-19', 0, 9, 'd', NULL),
(491, '135.00', '2019-02-19', 0, 9, 'd', NULL),
(492, '135.00', '2019-03-19', 0, 9, 'd', NULL),
(493, '135.00', '2019-04-19', 0, 9, 'd', NULL),
(494, '135.00', '2019-05-19', 0, 9, 'd', NULL),
(495, '135.00', '2019-06-19', 0, 9, 'd', NULL),
(496, '135.00', '2019-07-19', 0, 9, 'd', NULL),
(497, '135.00', '2019-08-19', 0, 9, 'd', NULL),
(498, '135.00', '2019-09-19', 0, 9, 'd', NULL),
(499, '135.00', '2019-10-19', 0, 9, 'd', NULL),
(500, '135.00', '2019-11-19', 0, 9, 'd', NULL),
(501, '135.00', '2019-12-19', 0, 9, 'd', NULL),
(502, '135.00', '2020-01-19', 0, 9, 'd', NULL),
(503, '135.00', '2020-02-19', 0, 9, 'd', NULL),
(504, '135.00', '2020-03-19', 0, 9, 'd', NULL),
(505, '135.00', '2020-04-19', 0, 9, 'd', NULL),
(506, '135.00', '2020-05-19', 0, 9, 'd', NULL),
(507, '135.00', '2020-06-19', 0, 9, 'd', NULL),
(508, '135.00', '2020-07-19', 0, 9, 'd', NULL),
(509, '135.00', '2020-08-19', 0, 9, 'd', NULL),
(510, '135.00', '2020-09-19', 0, 9, 'd', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depreciacion`
--

CREATE TABLE IF NOT EXISTS `depreciacion` (
  `id` int(11) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `vida_util` int(11) NOT NULL,
  `depreciacion_anual` decimal(6,2) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentoventa`
--

CREATE TABLE IF NOT EXISTS `descuentoventa` (
  `id` int(11) NOT NULL,
  `porcentaje` decimal(5,2) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `descuentoventa`
--

INSERT INTO `descuentoventa` (`id`, `porcentaje`, `idProyecto`, `fecha`, `deleted_at`) VALUES
(4, '15.00', 1, '2018-02-07 19:45:27', NULL),
(5, '15.00', 3, '2018-02-07 19:45:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE IF NOT EXISTS `detalle` (
  `id` int(11) NOT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  `id_asiento` int(11) DEFAULT NULL,
  `nro_detalle` int(11) DEFAULT NULL,
  `tipo` tinyint(4) DEFAULT NULL,
  `montoSus` decimal(15,2) DEFAULT NULL,
  `montoBs` decimal(15,2) DEFAULT NULL,
  `id_centro_costo` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`id`, `id_cuenta`, `id_asiento`, `nro_detalle`, `tipo`, `montoSus`, `montoBs`, `id_centro_costo`, `deleted_at`) VALUES
(1, 3, 1, 1, 1, '57.47', '400.00', NULL, NULL),
(2, 3, 1, 2, 2, '57.47', '400.00', NULL, NULL),
(3, 3, 2, 1, 1, '127.50', '887.40', NULL, NULL),
(4, 3, 2, 2, 2, '127.50', '887.40', NULL, NULL),
(5, 3, 3, 1, 1, '118.32', '823.51', NULL, NULL),
(6, 3, 3, 2, 2, '118.32', '823.51', NULL, NULL),
(7, 3, 4, 1, 1, '3510.16', '24430.71', NULL, NULL),
(8, 3, 4, 2, 2, '3510.16', '24430.71', NULL, NULL),
(9, 3, 5, 1, 1, '9.86', '68.63', NULL, NULL),
(10, 3, 5, 2, 2, '9.86', '68.63', NULL, NULL),
(11, 3, 6, 1, 1, '542.30', '3774.41', NULL, NULL),
(12, 3, 6, 2, 2, '542.30', '3774.41', NULL, NULL),
(13, 3, 7, 1, 1, '127.50', '887.40', NULL, NULL),
(14, 3, 7, 2, 2, '127.50', '887.40', NULL, NULL),
(15, 3, 8, 1, 1, '118.32', '823.51', NULL, NULL),
(16, 3, 8, 2, 2, '118.32', '823.51', NULL, NULL),
(17, 3, 9, 1, 1, '3510.16', '24430.71', NULL, NULL),
(18, 3, 9, 2, 2, '3510.16', '24430.71', NULL, NULL),
(19, 3, 10, 1, 1, '9.86', '68.63', NULL, NULL),
(20, 3, 10, 2, 2, '9.86', '68.63', NULL, NULL),
(21, 3, 11, 1, 1, '542.30', '3774.41', NULL, NULL),
(22, 3, 11, 2, 2, '542.30', '3774.41', NULL, NULL),
(23, 3, 12, 1, 1, '118.32', '823.51', NULL, NULL),
(24, 3, 12, 2, 2, '118.32', '823.51', NULL, NULL),
(25, 3, 13, 1, 1, '3549.60', '24705.22', NULL, NULL),
(26, 3, 13, 2, 2, '3549.60', '24705.22', NULL, NULL),
(27, 3, 14, 1, 1, '50.00', '348.00', NULL, NULL),
(28, 3, 14, 2, 2, '50.00', '348.00', NULL, NULL),
(29, 3, 15, 1, 1, '50.00', '348.00', NULL, NULL),
(30, 3, 15, 2, 2, '50.00', '348.00', NULL, NULL),
(34, 3, 17, 1, 1, '638.00', '4440.48', NULL, NULL),
(35, 3, 17, 2, 1, '0.00', '0.00', NULL, NULL),
(36, 3, 17, 3, 2, '638.00', '4440.48', NULL, NULL),
(46, 3, 21, 1, 1, '4500.00', '31320.00', NULL, NULL),
(47, 3, 21, 2, 1, '0.00', '0.00', NULL, NULL),
(48, 3, 21, 3, 2, '4500.00', '31320.00', NULL, NULL),
(49, 3, 22, 1, 1, '0.00', '0.00', NULL, NULL),
(50, 3, 22, 2, 2, '0.00', '0.00', NULL, NULL),
(51, 4, 23, 1, 1, '71.84', '500.00', NULL, NULL),
(52, 5, 23, 2, 2, '71.84', '500.00', NULL, NULL),
(53, 3, 24, 1, 1, '139.20', '968.83', NULL, NULL),
(54, 3, 24, 2, 1, '0.00', '0.00', NULL, NULL),
(55, 3, 24, 3, 2, '139.20', '968.83', NULL, NULL),
(56, 3, 25, 1, 1, '4176.00', '29064.96', NULL, NULL),
(57, 3, 25, 2, 1, '0.00', '0.00', NULL, NULL),
(58, 3, 25, 3, 2, '4176.00', '29064.96', NULL, NULL),
(59, 3, 26, 1, 1, '50.00', '348.00', NULL, NULL),
(60, 3, 26, 2, 2, '50.00', '348.00', NULL, NULL),
(61, 3, 27, 1, 1, '0.00', '0.00', NULL, NULL),
(62, 3, 27, 2, 2, '0.00', '0.00', NULL, NULL),
(63, 3, 28, 1, 1, '0.00', '0.00', NULL, NULL),
(64, 3, 28, 2, 2, '0.00', '0.00', NULL, NULL),
(65, 3, 29, 1, 1, '0.00', '0.00', NULL, NULL),
(66, 3, 29, 2, 2, '0.00', '0.00', NULL, NULL),
(67, 3, 30, 1, 1, '0.00', '0.00', NULL, NULL),
(68, 3, 30, 2, 2, '0.00', '0.00', NULL, NULL),
(69, 3, 31, 1, 1, '4500.00', '31320.00', NULL, NULL),
(70, 3, 31, 2, 1, '0.00', '0.00', NULL, NULL),
(71, 3, 31, 3, 2, '4500.00', '31320.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecuota`
--

CREATE TABLE IF NOT EXISTS `detallecuota` (
  `id` int(11) NOT NULL,
  `monto` decimal(9,2) DEFAULT NULL,
  `idCuota` int(11) DEFAULT NULL,
  `tipoPago` char(4) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallecuota`
--

INSERT INTO `detallecuota` (`id`, `monto`, `idCuota`, `tipoPago`, `fecha`, `deleted_at`) VALUES
(16, '10.00', 61, 'e', '2018-03-02 22:28:31', NULL),
(17, '10.00', 62, 'e', '2018-03-02 22:28:31', NULL),
(18, '10.00', 63, 'e', '2018-03-02 22:28:31', NULL),
(19, '10.00', 64, 'e', '2018-03-02 22:28:31', NULL),
(20, '10.00', 65, 'e', '2018-03-02 22:28:31', NULL),
(21, '10.00', 66, 'e', '2018-03-02 22:28:31', NULL),
(22, '10.00', 67, 'e', '2018-03-02 22:28:31', NULL),
(23, '10.00', 68, 'e', '2018-03-02 22:28:31', NULL),
(24, '10.00', 69, 'e', '2018-03-02 22:28:31', NULL),
(25, '10.00', 70, 'e', '2018-03-02 22:28:31', NULL),
(26, '10.00', 71, 'e', '2018-03-02 22:28:31', NULL),
(27, '10.00', 72, 'e', '2018-03-02 22:28:31', NULL),
(28, '10.00', 73, 'e', '2018-03-02 22:28:31', NULL),
(29, '10.00', 74, 'e', '2018-03-02 22:28:31', NULL),
(30, '10.00', 75, 'e', '2018-03-02 22:28:31', NULL),
(31, '10.00', 76, 'e', '2018-03-02 22:28:31', NULL),
(32, '10.00', 77, 'e', '2018-03-02 22:28:31', NULL),
(33, '10.00', 78, 'e', '2018-03-02 22:28:31', NULL),
(34, '10.00', 79, 'e', '2018-03-02 22:28:31', NULL),
(35, '10.00', 80, 'e', '2018-03-02 22:28:31', NULL),
(36, '10.00', 81, 'e', '2018-03-02 22:28:31', NULL),
(37, '10.00', 82, 'e', '2018-03-02 22:28:31', NULL),
(38, '10.00', 83, 'e', '2018-03-02 22:28:31', NULL),
(39, '10.00', 84, 'e', '2018-03-02 22:28:31', NULL),
(40, '10.00', 85, 'e', '2018-03-02 22:28:31', NULL),
(41, '10.00', 86, 'e', '2018-03-02 22:28:31', NULL),
(42, '10.00', 87, 'e', '2018-03-02 22:28:31', NULL),
(43, '10.00', 88, 'e', '2018-03-02 22:28:31', NULL),
(44, '10.00', 89, 'e', '2018-03-02 22:28:31', NULL),
(45, '10.00', 90, 'e', '2018-03-02 22:28:31', NULL),
(46, '10.00', 91, 'e', '2018-03-02 22:28:31', NULL),
(47, '10.00', 92, 'e', '2018-03-02 22:28:31', NULL),
(48, '10.00', 93, 'e', '2018-03-02 22:28:31', NULL),
(49, '10.00', 94, 'e', '2018-03-02 22:28:31', NULL),
(50, '4.00', 95, 'e', '2018-03-02 22:28:31', NULL),
(51, '6.00', 95, 'e', '2018-03-07 02:37:33', NULL),
(52, '9.00', 96, 'e', '2018-03-07 02:37:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleprereserva`
--

CREATE TABLE IF NOT EXISTS `detalleprereserva` (
  `id` int(11) NOT NULL,
  `idLote` int(11) DEFAULT NULL,
  `estado` char(4) NOT NULL DEFAULT 'p',
  `idPreReserva` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleprereserva`
--

INSERT INTO `detalleprereserva` (`id`, `idLote`, `estado`, `idPreReserva`, `deleted_at`) VALUES
(22, 2118, 'r', 18, NULL),
(23, 2121, 'r', 19, NULL),
(24, 2119, 'r', 20, NULL),
(25, 2127, 'r', 21, NULL),
(26, 2129, 'v', 22, NULL),
(27, 2130, 'v', 23, NULL);

--
-- Disparadores `detalleprereserva`
--
DELIMITER $$
CREATE TRIGGER `Actualizar_Lote_PreReserva` AFTER INSERT ON `detalleprereserva`
 FOR EACH ROW UPDATE lote 

SET lote.estado=1 

WHERE lote.id=new.idLote
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallereserva`
--

CREATE TABLE IF NOT EXISTS `detallereserva` (
  `id` int(11) NOT NULL,
  `idLote` int(11) DEFAULT NULL,
  `idReserva` int(11) DEFAULT NULL,
  `subTotal` decimal(5,2) DEFAULT NULL,
  `subTotalBs` decimal(12,2) DEFAULT NULL,
  `tipoPago` char(4) NOT NULL,
  `estado` char(4) NOT NULL DEFAULT 'r',
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detallereserva`
--

INSERT INTO `detallereserva` (`id`, `idLote`, `idReserva`, `subTotal`, `subTotalBs`, `tipoPago`, `estado`, `deleted_at`) VALUES
(6, 2118, 6, '57.47', '400.00', 'e', 'r', NULL),
(7, 2121, 7, '50.00', '348.00', 'b', 'r', NULL),
(8, 2119, 8, '50.00', '348.00', 'e', 'v', NULL),
(9, 2127, 9, '50.00', '348.00', 'e', 'v', NULL);

--
-- Disparadores `detallereserva`
--
DELIMITER $$
CREATE TRIGGER `Actualizar_Lote_Reserva` AFTER INSERT ON `detallereserva`
 FOR EACH ROW UPDATE lote 

SET lote.estado=2 

WHERE lote.id=new.idLote
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucionreserva`
--

CREATE TABLE IF NOT EXISTS `devolucionreserva` (
  `id` int(11) NOT NULL,
  `idDetalleReserva` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idPorcentajeDevolucionReserva` int(11) DEFAULT NULL,
  `monto` decimal(10,1) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ci` int(11) NOT NULL,
  `expedido` varchar(5) NOT NULL,
  `celular` int(11) NOT NULL,
  `genero` char(4) DEFAULT NULL,
  `codigo` varchar(30) DEFAULT NULL,
  `estado` char(4) DEFAULT NULL,
  `idCargo` int(11) NOT NULL,
  `idTurno` int(11) NOT NULL,
  `deleted_at` date DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `apellido`, `direccion`, `ci`, `expedido`, `celular`, `genero`, `codigo`, `estado`, `idCargo`, `idTurno`, `deleted_at`, `idPais`) VALUES
(4, 'Modesto ', 'Saldaña Michalec', 'barrio avaroa', 8883510, '', 72639636, 'm', '', 'h', 1, 1, NULL, NULL),
(18, 'Gustavo ', 'Arancibia Chaira', 'Montero Barrio Porvenir', 9687454, '', 75096558, 'm', '', 'h', 1, 1, '2017-08-24', NULL),
(19, 'Yacquiline', 'Estivariz Bustilos', '', 2947401, '', 70246916, 'f', '', 'h', 4, 1, NULL, NULL),
(20, 'Stephanie', 'Nuñes Estivariz', '', 4602461, '', 70246916, 'f', '', 'h', 4, 1, NULL, 123),
(21, 'Ruddy Edwin ', 'Salvatierra Estivariz', '', 70246916, '', 70246916, 'm', '', 'h', 4, 1, NULL, NULL),
(22, 'Luis Gaurahari ', 'Cabrera Pacheco', '', 3537063, '', 76335392, 'm', '', 'h', 5, 1, NULL, NULL),
(23, 'Carlos', 'del Castillo', '', 476828, '', 476828, 'm', '7469c', 'h', 6, 1, NULL, NULL),
(24, 'Maribel', 'Ayala Mendoza ', '', 1109611, '', 1109611, 'f', '10ee6b', 'h', 3, 1, NULL, NULL),
(25, 'Lady elsa ', 'del castillo justiniano', '', 4735285, '', 60837917, 'f', '484135', 'h', 3, 1, NULL, NULL),
(26, 'Sandro', 'Arnez Velarde ', '', 3451951, '', 3451951, 'm', '34ac2f', 'h', 3, 1, NULL, NULL),
(27, 'Ivan Abad', 'Landivar Limachi', '', 3872282, '', 3872282, 'm', '3b161a', 'h', 3, 1, NULL, NULL),
(28, 'Erwin ', 'Morales Lozano', '', 3822769, '', 3822769, 'm', '3a54b1', 'h', 3, 1, NULL, NULL),
(29, 'Franz', 'mike', '', 78583115, '', 78583115, 'm', '', 'h', 1, 1, '2017-08-24', NULL),
(30, 'Sergio', 'Galves', '', 13218221, '', 13218221, 'm', 'c9b1ad', 'h', 7, 1, NULL, NULL),
(31, 'Gabriel', 'Lopez', '', 3024844, '', 3024844, 'm', '2e27cc', 'h', 7, 1, NULL, NULL),
(32, 'Roxana ', 'Santillan', '', 1106757, '', 1106757, 'f', '10e345', 'h', 7, 1, NULL, NULL),
(33, 'Mario', 'Mendoza', '', 7679806, '', 7679806, 'm', '752f3e', 'h', 7, 1, NULL, NULL),
(34, 'Karina', 'Murillo', '', 4631769, '', 4631769, 'f', '46acd9', 'h', 7, 1, NULL, NULL),
(35, 'Rodrigo', 'del Castillo', '', 4713527, '', 4713527, 'm', '47ec37', 'h', 7, 1, NULL, NULL),
(36, 'Reyna Lorena', 'Gumiel', '', 2475674, '', 2475674, 'f', '25c69a', 'h', 7, 1, NULL, NULL),
(37, 'Carlos Mauricio', 'Rivera', '', 10017152, '', 10017152, 'm', '98d980', 'h', 7, 1, NULL, NULL),
(38, 'Jorge', 'Contreras', '', 2312827, '', 2312827, 'm', '234a7b', 'h', 7, 1, NULL, NULL),
(39, 'Maria Luz ', 'Hauzateng', '', 4825379, '', 4825379, 'f', '49a123', 'h', 7, 1, NULL, NULL),
(40, 'Silvia', 'Mallory Rivero', '', 6291093, '', 6291093, 'f', '5ffe95', 'h', 7, 1, NULL, NULL),
(41, 'Yngriy ', 'Ortyz Seas', '', 5389321, '', 5389321, 'f', '523c09', 'h', 7, 1, NULL, NULL),
(42, 'Roberto', 'Frich Zambrana', '', 3472857, '', 3472857, 'm', '34fdd9', 'h', 7, 1, NULL, NULL),
(43, 'Francisco', 'Santa Cruz', '', 3923951, '', 3923951, 'm', '3bdfef', 'h', 7, 1, NULL, NULL),
(44, 'Gabriel Rene ', 'Velasco', '', 2521935, '', 2521935, 'm', '267b4f', 'h', 7, 1, NULL, NULL),
(45, 'Neyda A.', 'Montenegro', '', 5320858, '', 5320858, 'f', '51309a', 'h', 7, 1, NULL, NULL),
(46, 'Maria Lupe', 'Alvarez', '', 3286611, '', 3286611, 'f', '322653', 'h', 7, 1, NULL, NULL),
(47, 'Jose Luis', 'Barron', '', 3852486, '', 3852486, 'm', '3ac8c6', 'h', 7, 1, NULL, NULL),
(48, 'Cecilio', 'Rodriguez Guarachi', '', 4512479, '', 4512479, 'm', '44dadf', 'h', 7, 1, NULL, NULL),
(49, 'Roy William', 'Paz', '', 7721568, '', 7721568, 'm', '75d260', 'h', 7, 1, NULL, NULL),
(50, 'Jacqueline', 'Machaca Valverde', '', 6221954, '', 6221954, 'f', '5ef082', 'h', 7, 1, '2017-07-12', NULL),
(51, 'Mauricio', 'Parada Mayer', '', 3218292, '', 3218292, 'm', '311b74', 'h', 7, 1, '2017-07-08', NULL),
(52, 'Ricardo', ' Ortiz', '', 4687951, '', 4687951, 'm', '47884f', 'h', 7, 1, '2017-07-08', NULL),
(53, 'Rolly', 'Cuellar', '', 3216572, '', 3216572, 'm', '3114bc', 'h', 7, 1, '2017-07-08', NULL),
(54, 'Renato', 'Justiniano', '', 7676697, '', 7676697, 'm', '752319', 'h', 7, 1, '2017-07-08', NULL),
(55, 'Vauvin', 'Hurtado', '', 4629782, '', 4629183, 'm', '46a2bf', 'h', 3, 1, NULL, NULL),
(56, 'Erwin ', 'Morales del Castillo', '', 6850481, '', 6850481, 'm', '6887b1', 'h', 7, 1, NULL, NULL),
(57, 'Mirta', 'Del Castillo', '', 4566146, '', 4566146, 'f', '45ac82', 'h', 7, 1, NULL, NULL),
(58, 'Flavio Roberto', 'Diaz Herrera', '', 2473651, '', 70630213, 'm', '25beb3', 'h', 7, 1, NULL, NULL),
(59, 'Lucas Marcelo', 'Entrambasaaguas Rios', '', 3271572, '', 61376242, 'm', '31eb94', 'h', 7, 1, NULL, NULL),
(60, 'Gustavo', 'Arancibia Chaira', '', 666, '', 75096558, 'm', '29a', 'h', 7, 1, NULL, NULL),
(61, 'Luis Enrique', 'Lopez Carrillo', 'Radial 10', 7435616, '', 75643262, 'm', '717560', 'h', 7, 1, NULL, NULL),
(62, 'Willians', 'Duabyakosky C.', 'Calle Pucará', 5841985, '', 65009460, 'm', '592441', 'h', 1, 1, '2017-08-24', NULL),
(63, 'Elizabeth', 'Rodriguez ', '', 9741981, '', 9741981, 'm', '94a69d', 'h', 7, 1, '2017-07-21', NULL),
(64, 'Leonardo Fabio', 'Balcazar Ríos', '', 2992489, '', 2992489, 'm', '2da969', 'h', 7, 1, NULL, NULL),
(65, 'Karen Gloria', 'Herrera Gonzales', '', 4640902, '', 4640902, 'f', '46d086', 'h', 7, 1, NULL, NULL),
(66, 'Marcela tarija', 'hoyos abrego', '', 4575941, '', 4575941, 'f', '45d2c5', 'h', 7, 1, NULL, NULL),
(67, 'Liduvia', 'Oña Sardinas', '', 5138116, '', 5138116, 'f', '4e66c4', 'h', 7, 1, NULL, NULL),
(68, 'Andrea Marianne', 'Caba', 'Barrio Sucre calle 13 Numero 90', 5005380, 'SC', 71661127, 'f', '4c6044', 'h', 7, 1, NULL, 123),
(69, 'liliana', 'estivariz', 'calle chungara', 123456, 'SC', 123456, 'f', '', 'h', 4, 1, NULL, 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `nit` int(11) DEFAULT NULL,
  `correo` varchar(40) NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `direccion`, `telefono`, `nit`, `correo`, `deleted_at`) VALUES
(3, 'Inversiones Inmobiliarias La P', 'Av. La Salle C/Rodolfo Antelo ', 3, 201336027, 'info@laprovisioninmobiliaria.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopais`
--

CREATE TABLE IF NOT EXISTS `estadopais` (
  `id` int(11) NOT NULL,
  `idPais` int(11) DEFAULT NULL,
  `estadonombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2202 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadopais`
--

INSERT INTO `estadopais` (`id`, `idPais`, `estadonombre`) VALUES
(1, 3, 'Azerbaijan'),
(2, 3, 'Nargorni Karabakh'),
(3, 3, 'Nakhichevanskaya Region'),
(4, 4, 'Anguilla'),
(5, 7, 'Brestskaya obl.'),
(6, 7, 'Vitebskaya obl.'),
(7, 7, 'Gomelskaya obl.'),
(8, 7, 'Grodnenskaya obl.'),
(9, 7, 'Minskaya obl.'),
(10, 7, 'Mogilevskaya obl.'),
(11, 8, 'Belize'),
(12, 10, 'Hamilton'),
(13, 15, 'Dong Bang Song Cuu Long'),
(14, 15, 'Dong Bang Song Hong'),
(15, 15, 'Dong Nam Bo'),
(16, 15, 'Duyen Hai Mien Trung'),
(17, 15, 'Khu Bon Cu'),
(18, 15, 'Mien Nui Va Trung Du'),
(19, 15, 'Thai Nguyen'),
(20, 16, 'Artibonite'),
(21, 16, 'Grand&#039;Anse'),
(22, 16, 'North West'),
(23, 16, 'West'),
(24, 16, 'South'),
(25, 16, 'South East'),
(26, 17, 'Grande-Terre'),
(27, 17, 'Basse-Terre'),
(28, 21, 'Abkhazia'),
(29, 21, 'Ajaria'),
(30, 21, 'Georgia'),
(31, 21, 'South Ossetia'),
(32, 23, 'Al QÄhira'),
(33, 23, 'Aswan'),
(34, 23, 'Asyut'),
(35, 23, 'Beni Suef'),
(36, 23, 'Gharbia'),
(37, 23, 'Damietta'),
(38, 24, 'Southern District'),
(39, 24, 'Central District'),
(40, 24, 'Northern District'),
(41, 24, 'Haifa'),
(42, 24, 'Tel Aviv'),
(43, 24, 'Jerusalem'),
(44, 25, 'Bangala'),
(45, 25, 'Chhattisgarh'),
(46, 25, 'Karnataka'),
(47, 25, 'Uttaranchal'),
(48, 25, 'Andhara Pradesh'),
(49, 25, 'Assam'),
(50, 25, 'Bihar'),
(51, 25, 'Gujarat'),
(52, 25, 'Jammu and Kashmir'),
(53, 25, 'Kerala'),
(54, 25, 'Madhya Pradesh'),
(55, 25, 'Manipur'),
(56, 25, 'Maharashtra'),
(57, 25, 'Megahalaya'),
(58, 25, 'Orissa'),
(59, 25, 'Punjab'),
(60, 25, 'Pondisheri'),
(61, 25, 'Rajasthan'),
(62, 25, 'Tamil Nadu'),
(63, 25, 'Tripura'),
(64, 25, 'Uttar Pradesh'),
(65, 25, 'Haryana'),
(66, 25, 'Chandigarh'),
(67, 26, 'Azarbayjan-e Khavari'),
(68, 26, 'Esfahan'),
(69, 26, 'Hamadan'),
(70, 26, 'Kordestan'),
(71, 26, 'Markazi'),
(72, 26, 'Sistan-e Baluches'),
(73, 26, 'Yazd'),
(74, 26, 'Kerman'),
(75, 26, 'Kermanshakhan'),
(76, 26, 'Mazenderan'),
(77, 26, 'Tehran'),
(78, 26, 'Fars'),
(79, 26, 'Horasan'),
(80, 26, 'Husistan'),
(81, 30, 'Aktyubinskaya obl.'),
(82, 30, 'Alma-Atinskaya obl.'),
(83, 30, 'Vostochno-Kazahstanskaya obl.'),
(84, 30, 'Gurevskaya obl.'),
(85, 30, 'Zhambylskaya obl. (Dzhambulskaya obl.)'),
(86, 30, 'Dzhezkazganskaya obl.'),
(87, 30, 'Karagandinskaya obl.'),
(88, 30, 'Kzyl-Ordinskaya obl.'),
(89, 30, 'Kokchetavskaya obl.'),
(90, 30, 'Kustanaiskaya obl.'),
(91, 30, 'Mangystauskaya (Mangyshlakskaya obl.)'),
(92, 30, 'Pavlodarskaya obl.'),
(93, 30, 'Severo-Kazahstanskaya obl.'),
(94, 30, 'Taldy-Kurganskaya obl.'),
(95, 30, 'Turgaiskaya obl.'),
(96, 30, 'Akmolinskaya obl. (Tselinogradskaya obl.)'),
(97, 30, 'Chimkentskaya obl.'),
(98, 31, 'Littoral'),
(99, 31, 'Southwest Region'),
(100, 31, 'North'),
(101, 31, 'Central'),
(102, 33, 'Government controlled area'),
(103, 33, 'Turkish controlled area'),
(104, 34, 'Issik Kulskaya Region'),
(105, 34, 'Kyrgyzstan'),
(106, 34, 'Narinskaya Region'),
(107, 34, 'Oshskaya Region'),
(108, 34, 'Tallaskaya Region'),
(109, 37, 'al-Jahra'),
(110, 37, 'al-Kuwait'),
(111, 38, 'Latviya'),
(112, 39, 'Tarabulus'),
(113, 39, 'Bengasi'),
(114, 40, 'Litva'),
(115, 43, 'Moldova'),
(116, 45, 'Auckland'),
(117, 45, 'Bay of Plenty'),
(118, 45, 'Canterbury'),
(119, 45, 'Gisborne'),
(120, 45, 'Hawke&#039;s Bay'),
(121, 45, 'Manawatu-Wanganui'),
(122, 45, 'Marlborough'),
(123, 45, 'Nelson'),
(124, 45, 'Northland'),
(125, 45, 'Otago'),
(126, 45, 'Southland'),
(127, 45, 'Taranaki'),
(128, 45, 'Tasman'),
(129, 45, 'Waikato'),
(130, 45, 'Wellington'),
(131, 45, 'West Coast'),
(132, 49, 'Saint-Denis'),
(133, 50, 'Altaiskii krai'),
(134, 50, 'Amurskaya obl.'),
(135, 50, 'Arhangelskaya obl.'),
(136, 50, 'Astrahanskaya obl.'),
(137, 50, 'Bashkiriya obl.'),
(138, 50, 'Belgorodskaya obl.'),
(139, 50, 'Bryanskaya obl.'),
(140, 50, 'Buryatiya'),
(141, 50, 'Vladimirskaya obl.'),
(142, 50, 'Volgogradskaya obl.'),
(143, 50, 'Vologodskaya obl.'),
(144, 50, 'Voronezhskaya obl.'),
(145, 50, 'Nizhegorodskaya obl.'),
(146, 50, 'Dagestan'),
(147, 50, 'Evreiskaya obl.'),
(148, 50, 'Ivanovskaya obl.'),
(149, 50, 'Irkutskaya obl.'),
(150, 50, 'Kabardino-Balkariya'),
(151, 50, 'Kaliningradskaya obl.'),
(152, 50, 'Tverskaya obl.'),
(153, 50, 'Kalmykiya'),
(154, 50, 'Kaluzhskaya obl.'),
(155, 50, 'Kamchatskaya obl.'),
(156, 50, 'Kareliya'),
(157, 50, 'Kemerovskaya obl.'),
(158, 50, 'Kirovskaya obl.'),
(159, 50, 'Komi'),
(160, 50, 'Kostromskaya obl.'),
(161, 50, 'Krasnodarskii krai'),
(162, 50, 'Krasnoyarskii krai'),
(163, 50, 'Kurganskaya obl.'),
(164, 50, 'Kurskaya obl.'),
(165, 50, 'Lipetskaya obl.'),
(166, 50, 'Magadanskaya obl.'),
(167, 50, 'Marii El'),
(168, 50, 'Mordoviya'),
(169, 50, 'Moscow &amp; Moscow Region'),
(170, 50, 'Murmanskaya obl.'),
(171, 50, 'Novgorodskaya obl.'),
(172, 50, 'Novosibirskaya obl.'),
(173, 50, 'Omskaya obl.'),
(174, 50, 'Orenburgskaya obl.'),
(175, 50, 'Orlovskaya obl.'),
(176, 50, 'Penzenskaya obl.'),
(177, 50, 'Permskiy krai'),
(178, 50, 'Primorskii krai'),
(179, 50, 'Pskovskaya obl.'),
(180, 50, 'Rostovskaya obl.'),
(181, 50, 'Ryazanskaya obl.'),
(182, 50, 'Samarskaya obl.'),
(183, 50, 'Saint-Petersburg and Region'),
(184, 50, 'Saratovskaya obl.'),
(185, 50, 'Saha (Yakutiya)'),
(186, 50, 'Sahalin'),
(187, 50, 'Sverdlovskaya obl.'),
(188, 50, 'Severnaya Osetiya'),
(189, 50, 'Smolenskaya obl.'),
(190, 50, 'Stavropolskii krai'),
(191, 50, 'Tambovskaya obl.'),
(192, 50, 'Tatarstan'),
(193, 50, 'Tomskaya obl.'),
(195, 50, 'Tulskaya obl.'),
(196, 50, 'Tyumenskaya obl. i Hanty-Mansiiskii AO'),
(197, 50, 'Udmurtiya'),
(198, 50, 'Ulyanovskaya obl.'),
(199, 50, 'Uralskaya obl.'),
(200, 50, 'Habarovskii krai'),
(201, 50, 'Chelyabinskaya obl.'),
(202, 50, 'Checheno-Ingushetiya'),
(203, 50, 'Chitinskaya obl.'),
(204, 50, 'Chuvashiya'),
(205, 50, 'Yaroslavskaya obl.'),
(206, 51, 'Ahuachapán'),
(207, 51, 'Cuscatlán'),
(208, 51, 'La Libertad'),
(209, 51, 'La Paz'),
(210, 51, 'La Unión'),
(211, 51, 'San Miguel'),
(212, 51, 'San Salvador'),
(213, 51, 'Santa Ana'),
(214, 51, 'Sonsonate'),
(215, 54, 'Paramaribo'),
(216, 56, 'Gorno-Badakhshan Region'),
(217, 56, 'Kuljabsk Region'),
(218, 56, 'Kurgan-Tjube Region'),
(219, 56, 'Sughd Region'),
(220, 56, 'Tajikistan'),
(221, 57, 'Ashgabat Region'),
(222, 57, 'Krasnovodsk Region'),
(223, 57, 'Mary Region'),
(224, 57, 'Tashauz Region'),
(225, 57, 'Chardzhou Region'),
(226, 58, 'Grand Turk'),
(227, 59, 'Bartin'),
(228, 59, 'Bayburt'),
(229, 59, 'Karabuk'),
(230, 59, 'Adana'),
(231, 59, 'Aydin'),
(232, 59, 'Amasya'),
(233, 59, 'Ankara'),
(234, 59, 'Antalya'),
(235, 59, 'Artvin'),
(236, 59, 'Afion'),
(237, 59, 'Balikesir'),
(238, 59, 'Bilecik'),
(239, 59, 'Bursa'),
(240, 59, 'Gaziantep'),
(241, 59, 'Denizli'),
(242, 59, 'Izmir'),
(243, 59, 'Isparta'),
(244, 59, 'Icel'),
(245, 59, 'Kayseri'),
(246, 59, 'Kars'),
(247, 59, 'Kodjaeli'),
(248, 59, 'Konya'),
(249, 59, 'Kirklareli'),
(250, 59, 'Kutahya'),
(251, 59, 'Malatya'),
(252, 59, 'Manisa'),
(253, 59, 'Sakarya'),
(254, 59, 'Samsun'),
(255, 59, 'Sivas'),
(256, 59, 'Istanbul'),
(257, 59, 'Trabzon'),
(258, 59, 'Corum'),
(259, 59, 'Edirne'),
(260, 59, 'Elazig'),
(261, 59, 'Erzincan'),
(262, 59, 'Erzurum'),
(263, 59, 'Eskisehir'),
(264, 60, 'Jinja'),
(265, 60, 'Kampala'),
(266, 61, 'Andijon Region'),
(267, 61, 'Buxoro Region'),
(268, 61, 'Jizzac Region'),
(269, 61, 'Qaraqalpaqstan'),
(270, 61, 'Qashqadaryo Region'),
(271, 61, 'Navoiy Region'),
(272, 61, 'Namangan Region'),
(273, 61, 'Samarqand Region'),
(274, 61, 'Surxondaryo Region'),
(275, 61, 'Sirdaryo Region'),
(276, 61, 'Tashkent Region'),
(277, 61, 'Fergana Region'),
(278, 61, 'Xorazm Region'),
(279, 62, 'Vinnitskaya obl.'),
(280, 62, 'Volynskaya obl.'),
(281, 62, 'Dnepropetrovskaya obl.'),
(282, 62, 'Donetskaya obl.'),
(283, 62, 'Zhitomirskaya obl.'),
(284, 62, 'Zakarpatskaya obl.'),
(285, 62, 'Zaporozhskaya obl.'),
(286, 62, 'Ivano-Frankovskaya obl.'),
(287, 62, 'Kievskaya obl.'),
(288, 62, 'Kirovogradskaya obl.'),
(289, 62, 'Krymskaya obl.'),
(290, 62, 'Luganskaya obl.'),
(291, 62, 'Lvovskaya obl.'),
(292, 62, 'Nikolaevskaya obl.'),
(293, 62, 'Odesskaya obl.'),
(294, 62, 'Poltavskaya obl.'),
(295, 62, 'Rovenskaya obl.'),
(296, 62, 'Sumskaya obl.'),
(297, 62, 'Ternopolskaya obl.'),
(298, 62, 'Harkovskaya obl.'),
(299, 62, 'Hersonskaya obl.'),
(300, 62, 'Hmelnitskaya obl.'),
(301, 62, 'Cherkasskaya obl.'),
(302, 62, 'Chernigovskaya obl.'),
(303, 62, 'Chernovitskaya obl.'),
(304, 68, 'Estoniya'),
(305, 69, 'Cheju'),
(306, 69, 'Chollabuk'),
(307, 69, 'Chollanam'),
(308, 69, 'Chungcheongbuk'),
(309, 69, 'Chungcheongnam'),
(310, 69, 'Incheon'),
(311, 69, 'Kangweon'),
(312, 69, 'Kwangju'),
(313, 69, 'Kyeonggi'),
(314, 69, 'Kyeongsangbuk'),
(315, 69, 'Kyeongsangnam'),
(316, 69, 'Pusan'),
(317, 69, 'Seoul'),
(318, 69, 'Taegu'),
(319, 69, 'Taejeon'),
(320, 69, 'Ulsan'),
(321, 70, 'Aichi'),
(322, 70, 'Akita'),
(323, 70, 'Aomori'),
(324, 70, 'Wakayama'),
(325, 70, 'Gifu'),
(326, 70, 'Gunma'),
(327, 70, 'Ibaraki'),
(328, 70, 'Iwate'),
(329, 70, 'Ishikawa'),
(330, 70, 'Kagawa'),
(331, 70, 'Kagoshima'),
(332, 70, 'Kanagawa'),
(333, 70, 'Kyoto'),
(334, 70, 'Kochi'),
(335, 70, 'Kumamoto'),
(336, 70, 'Mie'),
(337, 70, 'Miyagi'),
(338, 70, 'Miyazaki'),
(339, 70, 'Nagano'),
(340, 70, 'Nagasaki'),
(341, 70, 'Nara'),
(342, 70, 'Niigata'),
(343, 70, 'Okayama'),
(344, 70, 'Okinawa'),
(345, 70, 'Osaka'),
(346, 70, 'Saga'),
(347, 70, 'Saitama'),
(348, 70, 'Shiga'),
(349, 70, 'Shizuoka'),
(350, 70, 'Shimane'),
(351, 70, 'Tiba'),
(352, 70, 'Tokyo'),
(353, 70, 'Tokushima'),
(354, 70, 'Tochigi'),
(355, 70, 'Tottori'),
(356, 70, 'Toyama'),
(357, 70, 'Fukui'),
(358, 70, 'Fukuoka'),
(359, 70, 'Fukushima'),
(360, 70, 'Hiroshima'),
(361, 70, 'Hokkaido'),
(362, 70, 'Hyogo'),
(363, 70, 'Yoshimi'),
(364, 70, 'Yamagata'),
(365, 70, 'Yamaguchi'),
(366, 70, 'Yamanashi'),
(368, 73, 'Hong Kong'),
(369, 74, 'Indonesia'),
(370, 75, 'Jordan'),
(371, 76, 'Malaysia'),
(372, 77, 'Singapore'),
(373, 78, 'Taiwan'),
(374, 30, 'Kazahstan'),
(375, 62, 'Ukraina'),
(376, 25, 'India'),
(377, 23, 'Egypt'),
(378, 106, 'Damascus'),
(379, 131, 'Isle of Man'),
(380, 30, 'Zapadno-Kazahstanskaya obl.'),
(381, 50, 'Adygeya'),
(382, 50, 'Hakasiya'),
(383, 93, 'Dubai'),
(384, 50, 'Chukotskii AO'),
(385, 99, 'Beirut'),
(386, 137, 'Tegucigalpa'),
(387, 138, 'Santo Domingo'),
(388, 139, 'Ulan Bator'),
(389, 23, 'Sinai'),
(390, 140, 'Baghdad'),
(391, 140, 'Basra'),
(392, 140, 'Mosul'),
(393, 141, 'Johannesburg'),
(394, 104, 'Morocco'),
(395, 104, 'Tangier'),
(396, 50, 'Yamalo-Nenetskii AO'),
(397, 122, 'Tunisia'),
(398, 92, 'Thailand'),
(399, 117, 'Mozambique'),
(400, 84, 'Korea'),
(401, 87, 'Pakistan'),
(402, 142, 'Aruba'),
(403, 80, 'Bahamas'),
(404, 69, 'South Korea'),
(405, 132, 'Jamaica'),
(406, 93, 'Sharjah'),
(407, 93, 'Abu Dhabi'),
(409, 24, 'Ramat Hagolan'),
(410, 115, 'Nigeria'),
(411, 64, 'Ain'),
(412, 64, 'Haute-Savoie'),
(413, 64, 'Aisne'),
(414, 64, 'Allier'),
(415, 64, 'Alpes-de-Haute-Provence'),
(416, 64, 'Hautes-Alpes'),
(417, 64, 'Alpes-Maritimes'),
(418, 64, 'Ard&egrave;che'),
(419, 64, 'Ardennes'),
(420, 64, 'Ari&egrave;ge'),
(421, 64, 'Aube'),
(422, 64, 'Aude'),
(423, 64, 'Aveyron'),
(424, 64, 'Bouches-du-Rh&ocirc;ne'),
(425, 64, 'Calvados'),
(426, 64, 'Cantal'),
(427, 64, 'Charente'),
(428, 64, 'Charente Maritime'),
(429, 64, 'Cher'),
(430, 64, 'Corr&egrave;ze'),
(431, 64, 'Dordogne'),
(432, 64, 'Corse'),
(433, 64, 'C&ocirc;te d&#039;Or'),
(434, 64, 'Sa&ocirc;ne et Loire'),
(435, 64, 'C&ocirc;tes d&#039;Armor'),
(436, 64, 'Creuse'),
(437, 64, 'Doubs'),
(438, 64, 'Dr&ocirc;me'),
(439, 64, 'Eure'),
(440, 64, 'Eure-et-Loire'),
(441, 64, 'Finist&egrave;re'),
(442, 64, 'Gard'),
(443, 64, 'Haute-Garonne'),
(444, 64, 'Gers'),
(445, 64, 'Gironde'),
(446, 64, 'Hérault'),
(447, 64, 'Ille et Vilaine'),
(448, 64, 'Indre'),
(449, 64, 'Indre-et-Loire'),
(450, 64, 'Isère'),
(451, 64, 'Jura'),
(452, 64, 'Landes'),
(453, 64, 'Loir-et-Cher'),
(454, 64, 'Loire'),
(455, 64, 'Rh&ocirc;ne'),
(456, 64, 'Haute-Loire'),
(457, 64, 'Loire Atlantique'),
(458, 64, 'Loiret'),
(459, 64, 'Lot'),
(460, 64, 'Lot-et-Garonne'),
(461, 64, 'Loz&egrave;re'),
(462, 64, 'Maine et Loire'),
(463, 64, 'Manche'),
(464, 64, 'Marne'),
(465, 64, 'Haute-Marne'),
(466, 64, 'Mayenne'),
(467, 64, 'Meurthe-et-Moselle'),
(468, 64, 'Meuse'),
(469, 64, 'Morbihan'),
(470, 64, 'Moselle'),
(471, 64, 'Ni&egrave;vre'),
(472, 64, 'Nord'),
(473, 64, 'Oise'),
(474, 64, 'Orne'),
(475, 64, 'Pas-de-Calais'),
(476, 64, 'Puy-de-D&ocirc;me'),
(477, 64, 'Pyrénées-Atlantiques'),
(478, 64, 'Hautes-Pyrénées'),
(479, 64, 'Pyrénées-Orientales'),
(480, 64, 'Bas Rhin'),
(481, 64, 'Haut Rhin'),
(482, 64, 'Haute-Sa&ocirc;ne'),
(483, 64, 'Sarthe'),
(484, 64, 'Savoie'),
(485, 64, 'Paris'),
(486, 64, 'Seine-Maritime'),
(487, 64, 'Seine-et-Marne'),
(488, 64, 'Yvelines'),
(489, 64, 'Deux-S&egrave;vres'),
(490, 64, 'Somme'),
(491, 64, 'Tarn'),
(492, 64, 'Tarn-et-Garonne'),
(493, 64, 'Var'),
(494, 64, 'Vaucluse'),
(495, 64, 'Vendée'),
(496, 64, 'Vienne'),
(497, 64, 'Haute-Vienne'),
(498, 64, 'Vosges'),
(499, 64, 'Yonne'),
(500, 64, 'Territoire de Belfort'),
(501, 64, 'Essonne'),
(502, 64, 'Hauts-de-Seine'),
(503, 64, 'Seine-Saint-Denis'),
(504, 64, 'Val-de-Marne'),
(505, 64, 'Val-d&#039;Oise'),
(506, 29, 'Piemonte - Torino'),
(507, 29, 'Piemonte - Alessandria'),
(508, 29, 'Piemonte - Asti'),
(509, 29, 'Piemonte - Biella'),
(510, 29, 'Piemonte - Cuneo'),
(511, 29, 'Piemonte - Novara'),
(512, 29, 'Piemonte - Verbania'),
(513, 29, 'Piemonte - Vercelli'),
(514, 29, 'Valle d&#039;Aosta - Aosta'),
(515, 29, 'Lombardia - Milano'),
(516, 29, 'Lombardia - Bergamo'),
(517, 29, 'Lombardia - Brescia'),
(518, 29, 'Lombardia - Como'),
(519, 29, 'Lombardia - Cremona'),
(520, 29, 'Lombardia - Lecco'),
(521, 29, 'Lombardia - Lodi'),
(522, 29, 'Lombardia - Mantova'),
(523, 29, 'Lombardia - Pavia'),
(524, 29, 'Lombardia - Sondrio'),
(525, 29, 'Lombardia - Varese'),
(526, 29, 'Trentino Alto Adige - Trento'),
(527, 29, 'Trentino Alto Adige - Bolzano'),
(528, 29, 'Veneto - Venezia'),
(529, 29, 'Veneto - Belluno'),
(530, 29, 'Veneto - Padova'),
(531, 29, 'Veneto - Rovigo'),
(532, 29, 'Veneto - Treviso'),
(533, 29, 'Veneto - Verona'),
(534, 29, 'Veneto - Vicenza'),
(535, 29, 'Friuli Venezia Giulia - Trieste'),
(536, 29, 'Friuli Venezia Giulia - Gorizia'),
(537, 29, 'Friuli Venezia Giulia - Pordenone'),
(538, 29, 'Friuli Venezia Giulia - Udine'),
(539, 29, 'Liguria - Genova'),
(540, 29, 'Liguria - Imperia'),
(541, 29, 'Liguria - La Spezia'),
(542, 29, 'Liguria - Savona'),
(543, 29, 'Emilia Romagna - Bologna'),
(544, 29, 'Emilia Romagna - Ferrara'),
(545, 29, 'Emilia Romagna - Forlì-Cesena'),
(546, 29, 'Emilia Romagna - Modena'),
(547, 29, 'Emilia Romagna - Parma'),
(548, 29, 'Emilia Romagna - Piacenza'),
(549, 29, 'Emilia Romagna - Ravenna'),
(550, 29, 'Emilia Romagna - Reggio Emilia'),
(551, 29, 'Emilia Romagna - Rimini'),
(552, 29, 'Toscana - Firenze'),
(553, 29, 'Toscana - Arezzo'),
(554, 29, 'Toscana - Grosseto'),
(555, 29, 'Toscana - Livorno'),
(556, 29, 'Toscana - Lucca'),
(557, 29, 'Toscana - Massa Carrara'),
(558, 29, 'Toscana - Pisa'),
(559, 29, 'Toscana - Pistoia'),
(560, 29, 'Toscana - Prato'),
(561, 29, 'Toscana - Siena'),
(562, 29, 'Umbria - Perugia'),
(563, 29, 'Umbria - Terni'),
(564, 29, 'Marche - Ancona'),
(565, 29, 'Marche - Ascoli Piceno'),
(566, 29, 'Marche - Macerata'),
(567, 29, 'Marche - Pesaro - Urbino'),
(568, 29, 'Lazio - Roma'),
(569, 29, 'Lazio - Frosinone'),
(570, 29, 'Lazio - Latina'),
(571, 29, 'Lazio - Rieti'),
(572, 29, 'Lazio - Viterbo'),
(573, 29, 'Abruzzo - L´Aquila'),
(574, 29, 'Abruzzo - Chieti'),
(575, 29, 'Abruzzo - Pescara'),
(576, 29, 'Abruzzo - Teramo'),
(577, 29, 'Molise - Campobasso'),
(578, 29, 'Molise - Isernia'),
(579, 29, 'Campania - Napoli'),
(580, 29, 'Campania - Avellino'),
(581, 29, 'Campania - Benevento'),
(582, 29, 'Campania - Caserta'),
(583, 29, 'Campania - Salerno'),
(584, 29, 'Puglia - Bari'),
(585, 29, 'Puglia - Brindisi'),
(586, 29, 'Puglia - Foggia'),
(587, 29, 'Puglia - Lecce'),
(588, 29, 'Puglia - Taranto'),
(589, 29, 'Basilicata - Potenza'),
(590, 29, 'Basilicata - Matera'),
(591, 29, 'Calabria - Catanzaro'),
(592, 29, 'Calabria - Cosenza'),
(593, 29, 'Calabria - Crotone'),
(594, 29, 'Calabria - Reggio Calabria'),
(595, 29, 'Calabria - Vibo Valentia'),
(596, 29, 'Sicilia - Palermo'),
(597, 29, 'Sicilia - Agrigento'),
(598, 29, 'Sicilia - Caltanissetta'),
(599, 29, 'Sicilia - Catania'),
(600, 29, 'Sicilia - Enna'),
(601, 29, 'Sicilia - Messina'),
(602, 29, 'Sicilia - Ragusa'),
(603, 29, 'Sicilia - Siracusa'),
(604, 29, 'Sicilia - Trapani'),
(605, 29, 'Sardegna - Cagliari'),
(606, 29, 'Sardegna - Nuoro'),
(607, 29, 'Sardegna - Oristano'),
(608, 29, 'Sardegna - Sassari'),
(609, 28, 'Las Palmas'),
(610, 28, 'Soria'),
(611, 28, 'Palencia'),
(612, 28, 'Zamora'),
(613, 28, 'Cádiz'),
(614, 28, 'Navarra'),
(615, 28, 'Ourense'),
(616, 28, 'Segovia'),
(617, 28, 'Guip&uacute;zcoa'),
(618, 28, 'Ciudad Real'),
(619, 28, 'Vizcaya'),
(620, 28, 'álava'),
(621, 28, 'A Coruña'),
(622, 28, 'Cantabria'),
(623, 28, 'Almería'),
(624, 28, 'Zaragoza'),
(625, 28, 'Santa Cruz de Tenerife'),
(626, 28, 'Cáceres'),
(627, 28, 'Guadalajara'),
(628, 28, 'ávila'),
(629, 28, 'Toledo'),
(630, 28, 'Castellón'),
(631, 28, 'Tarragona'),
(632, 28, 'Lugo'),
(633, 28, 'La Rioja'),
(634, 28, 'Ceuta'),
(635, 28, 'Murcia'),
(636, 28, 'Salamanca'),
(637, 28, 'Valladolid'),
(638, 28, 'Jaén'),
(639, 28, 'Girona'),
(640, 28, 'Granada'),
(641, 28, 'Alacant'),
(642, 28, 'Córdoba'),
(643, 28, 'Albacete'),
(644, 28, 'Cuenca'),
(645, 28, 'Pontevedra'),
(646, 28, 'Teruel'),
(647, 28, 'Melilla'),
(648, 28, 'Barcelona'),
(649, 28, 'Badajoz'),
(650, 28, 'Madrid'),
(651, 28, 'Sevilla'),
(652, 28, 'Val&egrave;ncia'),
(653, 28, 'Huelva'),
(654, 28, 'Lleida'),
(655, 28, 'León'),
(656, 28, 'Illes Balears'),
(657, 28, 'Burgos'),
(658, 28, 'Huesca'),
(659, 28, 'Asturias'),
(660, 28, 'Málaga'),
(661, 144, 'Afghanistan'),
(662, 210, 'Niger'),
(663, 133, 'Mali'),
(664, 156, 'Burkina Faso'),
(665, 136, 'Togo'),
(666, 151, 'Benin'),
(667, 119, 'Angola'),
(668, 102, 'Namibia'),
(669, 100, 'Botswana'),
(670, 134, 'Madagascar'),
(671, 202, 'Mauritius'),
(672, 196, 'Laos'),
(673, 158, 'Cambodia'),
(674, 90, 'Philippines'),
(675, 88, 'Papua New Guinea'),
(676, 228, 'Solomon Islands'),
(677, 240, 'Vanuatu'),
(678, 176, 'Fiji'),
(679, 223, 'Samoa'),
(680, 206, 'Nauru'),
(681, 168, 'Cote D&#039;Ivoire'),
(682, 198, 'Liberia'),
(683, 187, 'Guinea'),
(684, 189, 'Guyana'),
(685, 98, 'Algeria'),
(686, 147, 'Antigua and Barbuda'),
(687, 127, 'Bahrain'),
(688, 149, 'Bangladesh'),
(689, 128, 'Barbados'),
(690, 152, 'Bhutan'),
(691, 155, 'Brunei'),
(692, 157, 'Burundi'),
(693, 159, 'Cape Verde'),
(694, 130, 'Chad'),
(695, 164, 'Comoros'),
(696, 112, 'Congo (Brazzaville)'),
(697, 169, 'Djibouti'),
(698, 171, 'East Timor'),
(699, 173, 'Eritrea'),
(700, 121, 'Ethiopia'),
(701, 180, 'Gabon'),
(702, 181, 'Gambia'),
(703, 105, 'Ghana'),
(704, 197, 'Lesotho'),
(705, 125, 'Malawi'),
(706, 200, 'Maldives'),
(707, 205, 'Myanmar (Burma)'),
(708, 107, 'Nepal'),
(709, 213, 'Oman'),
(710, 217, 'Rwanda'),
(711, 91, 'Saudi Arabia'),
(712, 120, 'Sri Lanka'),
(713, 232, 'Sudan'),
(714, 234, 'Swaziland'),
(715, 101, 'Tanzania'),
(716, 236, 'Tonga'),
(717, 239, 'Tuvalu'),
(718, 242, 'Western Sahara'),
(719, 243, 'Yemen'),
(720, 116, 'Zambia'),
(721, 96, 'Zimbabwe'),
(722, 66, 'Aargau'),
(723, 66, 'Appenzell Innerrhoden'),
(724, 66, 'Appenzell Ausserrhoden'),
(725, 66, 'Bern'),
(726, 66, 'Basel-Landschaft'),
(727, 66, 'Basel-Stadt'),
(728, 66, 'Fribourg'),
(729, 66, 'Gen&egrave;ve'),
(730, 66, 'Glarus'),
(731, 66, 'Graubünden'),
(732, 66, 'Jura'),
(733, 66, 'Luzern'),
(734, 66, 'Neuch&acirc;tel'),
(735, 66, 'Nidwalden'),
(736, 66, 'Obwalden'),
(737, 66, 'Sankt Gallen'),
(738, 66, 'Schaffhausen'),
(739, 66, 'Solothurn'),
(740, 66, 'Schwyz'),
(741, 66, 'Thurgau'),
(742, 66, 'Ticino'),
(743, 66, 'Uri'),
(744, 66, 'Vaud'),
(745, 66, 'Valais'),
(746, 66, 'Zug'),
(747, 66, 'Zürich'),
(749, 48, 'Aveiro'),
(750, 48, 'Beja'),
(751, 48, 'Braga'),
(752, 48, 'Braganca'),
(753, 48, 'Castelo Branco'),
(754, 48, 'Coimbra'),
(755, 48, 'Evora'),
(756, 48, 'Faro'),
(757, 48, 'Madeira'),
(758, 48, 'Guarda'),
(759, 48, 'Leiria'),
(760, 48, 'Lisboa'),
(761, 48, 'Portalegre'),
(762, 48, 'Porto'),
(763, 48, 'Santarem'),
(764, 48, 'Setubal'),
(765, 48, 'Viana do Castelo'),
(766, 48, 'Vila Real'),
(767, 48, 'Viseu'),
(768, 48, 'Azores'),
(769, 55, 'Armed Forces Americas'),
(770, 55, 'Armed Forces Europe'),
(771, 55, 'Alaska'),
(772, 55, 'Alabama'),
(773, 55, 'Armed Forces Pacific'),
(774, 55, 'Arkansas'),
(775, 55, 'American Samoa'),
(776, 55, 'Arizona'),
(777, 55, 'California'),
(778, 55, 'Colorado'),
(779, 55, 'Connecticut'),
(780, 55, 'District of Columbia'),
(781, 55, 'Delaware'),
(782, 55, 'Florida'),
(783, 55, 'Federated States of Micronesia'),
(784, 55, 'Georgia'),
(786, 55, 'Hawaii'),
(787, 55, 'Iowa'),
(788, 55, 'Idaho'),
(789, 55, 'Illinois'),
(790, 55, 'Indiana'),
(791, 55, 'Kansas'),
(792, 55, 'Kentucky'),
(793, 55, 'Louisiana'),
(794, 55, 'Massachusetts'),
(795, 55, 'Maryland'),
(796, 55, 'Maine'),
(797, 55, 'Marshall Islands'),
(798, 55, 'Michigan'),
(799, 55, 'Minnesota'),
(800, 55, 'Missouri'),
(801, 55, 'Northern Mariana Islands'),
(802, 55, 'Mississippi'),
(803, 55, 'Montana'),
(804, 55, 'North Carolina'),
(805, 55, 'North Dakota'),
(806, 55, 'Nebraska'),
(807, 55, 'New Hampshire'),
(808, 55, 'New Jersey'),
(809, 55, 'New Mexico'),
(810, 55, 'Nevada'),
(811, 55, 'New York'),
(812, 55, 'Ohio'),
(813, 55, 'Oklahoma'),
(814, 55, 'Oregon'),
(815, 55, 'Pennsylvania'),
(816, 246, 'Puerto Rico'),
(817, 55, 'Palau'),
(818, 55, 'Rhode Island'),
(819, 55, 'South Carolina'),
(820, 55, 'South Dakota'),
(821, 55, 'Tennessee'),
(822, 55, 'Texas'),
(823, 55, 'Utah'),
(824, 55, 'Virginia'),
(825, 55, 'Virgin Islands'),
(826, 55, 'Vermont'),
(827, 55, 'Washington'),
(828, 55, 'West Virginia'),
(829, 55, 'Wisconsin'),
(830, 55, 'Wyoming'),
(831, 94, 'Greenland'),
(832, 18, 'Brandenburg'),
(833, 18, 'Baden-Württemberg'),
(834, 18, 'Bayern'),
(835, 18, 'Hessen'),
(836, 18, 'Hamburg'),
(837, 18, 'Mecklenburg-Vorpommern'),
(838, 18, 'Niedersachsen'),
(839, 18, 'Nordrhein-Westfalen'),
(840, 18, 'Rheinland-Pfalz'),
(841, 18, 'Schleswig-Holstein'),
(842, 18, 'Sachsen'),
(843, 18, 'Sachsen-Anhalt'),
(844, 18, 'Thüringen'),
(845, 18, 'Berlin'),
(846, 18, 'Bremen'),
(847, 18, 'Saarland'),
(848, 13, 'Scotland North'),
(849, 13, 'England - East'),
(850, 13, 'England - West Midlands'),
(851, 13, 'England - South West'),
(852, 13, 'England - North West'),
(853, 13, 'England - Yorks &amp; Humber'),
(854, 13, 'England - South East'),
(855, 13, 'England - London'),
(856, 13, 'Northern Ireland'),
(857, 13, 'England - North East'),
(858, 13, 'Wales South'),
(859, 13, 'Wales North'),
(860, 13, 'England - East Midlands'),
(861, 13, 'Scotland Central'),
(862, 13, 'Scotland South'),
(863, 13, 'Channel Islands'),
(864, 13, 'Isle of Man'),
(865, 2, 'Burgenland'),
(866, 2, 'Kärnten'),
(867, 2, 'Niederösterreich'),
(868, 2, 'Oberösterreich'),
(869, 2, 'Salzburg'),
(870, 2, 'Steiermark'),
(871, 2, 'Tirol'),
(872, 2, 'Vorarlberg'),
(873, 2, 'Wien'),
(874, 9, 'Bruxelles'),
(875, 9, 'West-Vlaanderen'),
(876, 9, 'Oost-Vlaanderen'),
(877, 9, 'Limburg'),
(878, 9, 'Vlaams Brabant'),
(879, 9, 'Antwerpen'),
(880, 9, 'LiÄge'),
(881, 9, 'Namur'),
(882, 9, 'Hainaut'),
(883, 9, 'Luxembourg'),
(884, 9, 'Brabant Wallon'),
(887, 67, 'Blekinge Lan'),
(888, 67, 'Gavleborgs Lan'),
(890, 67, 'Gotlands Lan'),
(891, 67, 'Hallands Lan'),
(892, 67, 'Jamtlands Lan'),
(893, 67, 'Jonkopings Lan'),
(894, 67, 'Kalmar Lan'),
(895, 67, 'Dalarnas Lan'),
(897, 67, 'Kronobergs Lan'),
(899, 67, 'Norrbottens Lan'),
(900, 67, 'Orebro Lan'),
(901, 67, 'Ostergotlands Lan'),
(903, 67, 'Sodermanlands Lan'),
(904, 67, 'Uppsala Lan'),
(905, 67, 'Varmlands Lan'),
(906, 67, 'Vasterbottens Lan'),
(907, 67, 'Vasternorrlands Lan'),
(908, 67, 'Vastmanlands Lan'),
(909, 67, 'Stockholms Lan'),
(910, 67, 'Skane Lan'),
(911, 67, 'Vastra Gotaland'),
(913, 46, 'Akershus'),
(914, 46, 'Aust-Agder'),
(915, 46, 'Buskerud'),
(916, 46, 'Finnmark'),
(917, 46, 'Hedmark'),
(918, 46, 'Hordaland'),
(919, 46, 'More og Romsdal'),
(920, 46, 'Nordland'),
(921, 46, 'Nord-Trondelag'),
(922, 46, 'Oppland'),
(923, 46, 'Oslo'),
(924, 46, 'Ostfold'),
(925, 46, 'Rogaland'),
(926, 46, 'Sogn og Fjordane'),
(927, 46, 'Sor-Trondelag'),
(928, 46, 'Telemark'),
(929, 46, 'Troms'),
(930, 46, 'Vest-Agder'),
(931, 46, 'Vestfold'),
(933, 63, '&ETH;&bull;land'),
(934, 63, 'Lapland'),
(935, 63, 'Oulu'),
(936, 63, 'Southern Finland'),
(937, 63, 'Eastern Finland'),
(938, 63, 'Western Finland'),
(940, 22, 'Arhus'),
(941, 22, 'Bornholm'),
(942, 22, 'Frederiksborg'),
(943, 22, 'Fyn'),
(944, 22, 'Kobenhavn'),
(945, 22, 'Staden Kobenhavn'),
(946, 22, 'Nordjylland'),
(947, 22, 'Ribe'),
(948, 22, 'Ringkobing'),
(949, 22, 'Roskilde'),
(950, 22, 'Sonderjylland'),
(951, 22, 'Storstrom'),
(952, 22, 'Vejle'),
(953, 22, 'Vestsjalland'),
(954, 22, 'Viborg'),
(956, 65, 'Hlavni Mesto Praha'),
(957, 65, 'Jihomoravsky Kraj'),
(958, 65, 'Jihocesky Kraj'),
(959, 65, 'Vysocina'),
(960, 65, 'Karlovarsky Kraj'),
(961, 65, 'Kralovehradecky Kraj'),
(962, 65, 'Liberecky Kraj'),
(963, 65, 'Olomoucky Kraj'),
(964, 65, 'Moravskoslezsky Kraj'),
(965, 65, 'Pardubicky Kraj'),
(966, 65, 'Plzensky Kraj'),
(967, 65, 'Stredocesky Kraj'),
(968, 65, 'Ustecky Kraj'),
(969, 65, 'Zlinsky Kraj'),
(971, 114, 'Berat'),
(972, 114, 'Diber'),
(973, 114, 'Durres'),
(974, 114, 'Elbasan'),
(975, 114, 'Fier'),
(976, 114, 'Gjirokaster'),
(977, 114, 'Korce'),
(978, 114, 'Kukes'),
(979, 114, 'Lezhe'),
(980, 114, 'Shkoder'),
(981, 114, 'Tirane'),
(982, 114, 'Vlore'),
(984, 145, 'Canillo'),
(985, 145, 'Encamp'),
(986, 145, 'La Massana'),
(987, 145, 'Ordino'),
(988, 145, 'Sant Julia de Loria'),
(989, 145, 'Andorra la Vella'),
(990, 145, 'Escaldes-Engordany'),
(992, 6, 'Aragatsotn'),
(993, 6, 'Ararat'),
(994, 6, 'Armavir'),
(995, 6, 'Geghark&#039;unik&#039;'),
(996, 6, 'Kotayk&#039;'),
(997, 6, 'Lorri'),
(998, 6, 'Shirak'),
(999, 6, 'Syunik&#039;'),
(1000, 6, 'Tavush'),
(1001, 6, 'Vayots&#039; Dzor'),
(1002, 6, 'Yerevan'),
(1004, 79, 'Federation of Bosnia and Herzegovina'),
(1005, 79, 'Republika Srpska'),
(1007, 11, 'Mikhaylovgrad'),
(1008, 11, 'Blagoevgrad'),
(1009, 11, 'Burgas'),
(1010, 11, 'Dobrich'),
(1011, 11, 'Gabrovo'),
(1012, 11, 'Grad Sofiya'),
(1013, 11, 'Khaskovo'),
(1014, 11, 'Kurdzhali'),
(1015, 11, 'Kyustendil'),
(1016, 11, 'Lovech'),
(1017, 11, 'Montana'),
(1018, 11, 'Pazardzhik'),
(1019, 11, 'Pernik'),
(1020, 11, 'Pleven'),
(1021, 11, 'Plovdiv'),
(1022, 11, 'Razgrad'),
(1023, 11, 'Ruse'),
(1024, 11, 'Shumen'),
(1025, 11, 'Silistra'),
(1026, 11, 'Sliven'),
(1027, 11, 'Smolyan'),
(1028, 11, 'Sofiya'),
(1029, 11, 'Stara Zagora'),
(1030, 11, 'Turgovishte'),
(1031, 11, 'Varna'),
(1032, 11, 'Veliko Turnovo'),
(1033, 11, 'Vidin'),
(1034, 11, 'Vratsa'),
(1035, 11, 'Yambol'),
(1037, 71, 'Bjelovarsko-Bilogorska'),
(1038, 71, 'Brodsko-Posavska'),
(1039, 71, 'Dubrovacko-Neretvanska'),
(1040, 71, 'Istarska'),
(1041, 71, 'Karlovacka'),
(1042, 71, 'Koprivnicko-Krizevacka'),
(1043, 71, 'Krapinsko-Zagorska'),
(1044, 71, 'Licko-Senjska'),
(1045, 71, 'Medimurska'),
(1046, 71, 'Osjecko-Baranjska'),
(1047, 71, 'Pozesko-Slavonska'),
(1048, 71, 'Primorsko-Goranska'),
(1049, 71, 'Sibensko-Kninska'),
(1050, 71, 'Sisacko-Moslavacka'),
(1051, 71, 'Splitsko-Dalmatinska'),
(1052, 71, 'Varazdinska'),
(1053, 71, 'Viroviticko-Podravska'),
(1054, 71, 'Vukovarsko-Srijemska'),
(1055, 71, 'Zadarska'),
(1056, 71, 'Zagrebacka'),
(1057, 71, 'Grad Zagreb'),
(1059, 143, 'Gibraltar'),
(1060, 20, 'Evros'),
(1061, 20, 'Rodhopi'),
(1062, 20, 'Xanthi'),
(1063, 20, 'Drama'),
(1064, 20, 'Serrai'),
(1065, 20, 'Kilkis'),
(1066, 20, 'Pella'),
(1067, 20, 'Florina'),
(1068, 20, 'Kastoria'),
(1069, 20, 'Grevena'),
(1070, 20, 'Kozani'),
(1071, 20, 'Imathia'),
(1072, 20, 'Thessaloniki'),
(1073, 20, 'Kavala'),
(1074, 20, 'Khalkidhiki'),
(1075, 20, 'Pieria'),
(1076, 20, 'Ioannina'),
(1077, 20, 'Thesprotia'),
(1078, 20, 'Preveza'),
(1079, 20, 'Arta'),
(1080, 20, 'Larisa'),
(1081, 20, 'Trikala'),
(1082, 20, 'Kardhitsa'),
(1083, 20, 'Magnisia'),
(1084, 20, 'Kerkira'),
(1085, 20, 'Levkas'),
(1086, 20, 'Kefallinia'),
(1087, 20, 'Zakinthos'),
(1088, 20, 'Fthiotis'),
(1089, 20, 'Evritania'),
(1090, 20, 'Aitolia kai Akarnania'),
(1091, 20, 'Fokis'),
(1092, 20, 'Voiotia'),
(1093, 20, 'Evvoia'),
(1094, 20, 'Attiki'),
(1095, 20, 'Argolis'),
(1096, 20, 'Korinthia'),
(1097, 20, 'Akhaia'),
(1098, 20, 'Ilia'),
(1099, 20, 'Messinia'),
(1100, 20, 'Arkadhia'),
(1101, 20, 'Lakonia'),
(1102, 20, 'Khania'),
(1103, 20, 'Rethimni'),
(1104, 20, 'Iraklion'),
(1105, 20, 'Lasithi'),
(1106, 20, 'Dhodhekanisos'),
(1107, 20, 'Samos'),
(1108, 20, 'Kikladhes'),
(1109, 20, 'Khios'),
(1110, 20, 'Lesvos'),
(1112, 14, 'Bacs-Kiskun'),
(1113, 14, 'Baranya'),
(1114, 14, 'Bekes'),
(1115, 14, 'Borsod-Abauj-Zemplen'),
(1116, 14, 'Budapest'),
(1117, 14, 'Csongrad'),
(1118, 14, 'Debrecen'),
(1119, 14, 'Fejer'),
(1120, 14, 'Gyor-Moson-Sopron'),
(1121, 14, 'Hajdu-Bihar'),
(1122, 14, 'Heves'),
(1123, 14, 'Komarom-Esztergom'),
(1124, 14, 'Miskolc'),
(1125, 14, 'Nograd'),
(1126, 14, 'Pecs'),
(1127, 14, 'Pest'),
(1128, 14, 'Somogy'),
(1129, 14, 'Szabolcs-Szatmar-Bereg'),
(1130, 14, 'Szeged'),
(1131, 14, 'Jasz-Nagykun-Szolnok'),
(1132, 14, 'Tolna'),
(1133, 14, 'Vas'),
(1134, 14, 'Veszprem'),
(1135, 14, 'Zala'),
(1136, 14, 'Gyor'),
(1150, 14, 'Veszprem'),
(1152, 126, 'Balzers'),
(1153, 126, 'Eschen'),
(1154, 126, 'Gamprin'),
(1155, 126, 'Mauren'),
(1156, 126, 'Planken'),
(1157, 126, 'Ruggell'),
(1158, 126, 'Schaan'),
(1159, 126, 'Schellenberg'),
(1160, 126, 'Triesen'),
(1161, 126, 'Triesenberg'),
(1162, 126, 'Vaduz'),
(1163, 41, 'Diekirch'),
(1164, 41, 'Grevenmacher'),
(1165, 41, 'Luxembourg'),
(1167, 85, 'Aracinovo'),
(1168, 85, 'Bac'),
(1169, 85, 'Belcista'),
(1170, 85, 'Berovo'),
(1171, 85, 'Bistrica'),
(1172, 85, 'Bitola'),
(1173, 85, 'Blatec'),
(1174, 85, 'Bogdanci'),
(1175, 85, 'Bogomila'),
(1176, 85, 'Bogovinje'),
(1177, 85, 'Bosilovo'),
(1179, 85, 'Cair'),
(1180, 85, 'Capari'),
(1181, 85, 'Caska'),
(1182, 85, 'Cegrane'),
(1184, 85, 'Centar Zupa'),
(1187, 85, 'Debar'),
(1188, 85, 'Delcevo'),
(1190, 85, 'Demir Hisar'),
(1191, 85, 'Demir Kapija'),
(1195, 85, 'Dorce Petrov'),
(1198, 85, 'Gazi Baba'),
(1199, 85, 'Gevgelija'),
(1200, 85, 'Gostivar'),
(1201, 85, 'Gradsko'),
(1204, 85, 'Jegunovce'),
(1205, 85, 'Kamenjane'),
(1207, 85, 'Karpos'),
(1208, 85, 'Kavadarci'),
(1209, 85, 'Kicevo'),
(1210, 85, 'Kisela Voda'),
(1211, 85, 'Klecevce'),
(1212, 85, 'Kocani'),
(1214, 85, 'Kondovo'),
(1217, 85, 'Kratovo'),
(1219, 85, 'Krivogastani'),
(1220, 85, 'Krusevo'),
(1223, 85, 'Kumanovo'),
(1224, 85, 'Labunista'),
(1225, 85, 'Lipkovo'),
(1228, 85, 'Makedonska Kamenica'),
(1229, 85, 'Makedonski Brod'),
(1234, 85, 'Murtino'),
(1235, 85, 'Negotino'),
(1238, 85, 'Novo Selo'),
(1240, 85, 'Ohrid'),
(1242, 85, 'Orizari'),
(1245, 85, 'Petrovec'),
(1248, 85, 'Prilep'),
(1249, 85, 'Probistip'),
(1250, 85, 'Radovis'),
(1252, 85, 'Resen'),
(1253, 85, 'Rosoman'),
(1256, 85, 'Saraj'),
(1260, 85, 'Srbinovo'),
(1262, 85, 'Star Dojran'),
(1264, 85, 'Stip'),
(1265, 85, 'Struga'),
(1266, 85, 'Strumica'),
(1267, 85, 'Studenicani'),
(1268, 85, 'Suto Orizari'),
(1269, 85, 'Sveti Nikole'),
(1270, 85, 'Tearce'),
(1271, 85, 'Tetovo'),
(1273, 85, 'Valandovo'),
(1275, 85, 'Veles'),
(1277, 85, 'Vevcani'),
(1278, 85, 'Vinica'),
(1281, 85, 'Vrapciste'),
(1286, 85, 'Zelino'),
(1289, 85, 'Zrnovci'),
(1291, 86, 'Malta'),
(1292, 44, 'La Condamine'),
(1293, 44, 'Monaco'),
(1294, 44, 'Monte-Carlo'),
(1295, 47, 'Biala Podlaska'),
(1296, 47, 'Bialystok'),
(1297, 47, 'Bielsko'),
(1298, 47, 'Bydgoszcz'),
(1299, 47, 'Chelm'),
(1300, 47, 'Ciechanow'),
(1301, 47, 'Czestochowa'),
(1302, 47, 'Elblag'),
(1303, 47, 'Gdansk'),
(1304, 47, 'Gorzow'),
(1305, 47, 'Jelenia Gora'),
(1306, 47, 'Kalisz'),
(1307, 47, 'Katowice'),
(1308, 47, 'Kielce'),
(1309, 47, 'Konin'),
(1310, 47, 'Koszalin'),
(1311, 47, 'Krakow'),
(1312, 47, 'Krosno'),
(1313, 47, 'Legnica'),
(1314, 47, 'Leszno'),
(1315, 47, 'Lodz'),
(1316, 47, 'Lomza'),
(1317, 47, 'Lublin'),
(1318, 47, 'Nowy Sacz'),
(1319, 47, 'Olsztyn'),
(1320, 47, 'Opole'),
(1321, 47, 'Ostroleka'),
(1322, 47, 'Pila'),
(1323, 47, 'Piotrkow'),
(1324, 47, 'Plock'),
(1325, 47, 'Poznan'),
(1326, 47, 'Przemysl'),
(1327, 47, 'Radom'),
(1328, 47, 'Rzeszow'),
(1329, 47, 'Siedlce'),
(1330, 47, 'Sieradz'),
(1331, 47, 'Skierniewice'),
(1332, 47, 'Slupsk'),
(1333, 47, 'Suwalki'),
(1335, 47, 'Tarnobrzeg'),
(1336, 47, 'Tarnow'),
(1337, 47, 'Torun'),
(1338, 47, 'Walbrzych'),
(1339, 47, 'Warszawa'),
(1340, 47, 'Wloclawek'),
(1341, 47, 'Wroclaw'),
(1342, 47, 'Zamosc'),
(1343, 47, 'Zielona Gora'),
(1344, 47, 'Dolnoslaskie'),
(1345, 47, 'Kujawsko-Pomorskie'),
(1346, 47, 'Lodzkie'),
(1347, 47, 'Lubelskie'),
(1348, 47, 'Lubuskie'),
(1349, 47, 'Malopolskie'),
(1350, 47, 'Mazowieckie'),
(1351, 47, 'Opolskie'),
(1352, 47, 'Podkarpackie'),
(1353, 47, 'Podlaskie'),
(1354, 47, 'Pomorskie'),
(1355, 47, 'Slaskie'),
(1356, 47, 'Swietokrzyskie'),
(1357, 47, 'Warminsko-Mazurskie'),
(1358, 47, 'Wielkopolskie'),
(1359, 47, 'Zachodniopomorskie'),
(1361, 72, 'Alba'),
(1362, 72, 'Arad'),
(1363, 72, 'Arges'),
(1364, 72, 'Bacau'),
(1365, 72, 'Bihor'),
(1366, 72, 'Bistrita-Nasaud'),
(1367, 72, 'Botosani'),
(1368, 72, 'Braila'),
(1369, 72, 'Brasov'),
(1370, 72, 'Bucuresti'),
(1371, 72, 'Buzau'),
(1372, 72, 'Caras-Severin'),
(1373, 72, 'Cluj'),
(1374, 72, 'Constanta'),
(1375, 72, 'Covasna'),
(1376, 72, 'Dambovita'),
(1377, 72, 'Dolj'),
(1378, 72, 'Galati'),
(1379, 72, 'Gorj'),
(1380, 72, 'Harghita'),
(1381, 72, 'Hunedoara'),
(1382, 72, 'Ialomita'),
(1383, 72, 'Iasi'),
(1384, 72, 'Maramures'),
(1385, 72, 'Mehedinti'),
(1386, 72, 'Mures'),
(1387, 72, 'Neamt'),
(1388, 72, 'Olt'),
(1389, 72, 'Prahova'),
(1390, 72, 'Salaj'),
(1391, 72, 'Satu Mare'),
(1392, 72, 'Sibiu'),
(1393, 72, 'Suceava'),
(1394, 72, 'Teleorman'),
(1395, 72, 'Timis'),
(1396, 72, 'Tulcea'),
(1397, 72, 'Vaslui'),
(1398, 72, 'Valcea'),
(1399, 72, 'Vrancea'),
(1400, 72, 'Calarasi'),
(1401, 72, 'Giurgiu'),
(1404, 224, 'Acquaviva'),
(1405, 224, 'Chiesanuova'),
(1406, 224, 'Domagnano'),
(1407, 224, 'Faetano'),
(1408, 224, 'Fiorentino'),
(1409, 224, 'Borgo Maggiore'),
(1410, 224, 'San Marino'),
(1411, 224, 'Monte Giardino'),
(1412, 224, 'Serravalle'),
(1413, 52, 'Banska Bystrica'),
(1414, 52, 'Bratislava'),
(1415, 52, 'Kosice'),
(1416, 52, 'Nitra'),
(1417, 52, 'Presov'),
(1418, 52, 'Trencin'),
(1419, 52, 'Trnava'),
(1420, 52, 'Zilina'),
(1423, 53, 'Beltinci'),
(1425, 53, 'Bohinj'),
(1426, 53, 'Borovnica'),
(1427, 53, 'Bovec'),
(1428, 53, 'Brda'),
(1429, 53, 'Brezice'),
(1430, 53, 'Brezovica'),
(1432, 53, 'Cerklje na Gorenjskem'),
(1434, 53, 'Cerkno'),
(1436, 53, 'Crna na Koroskem'),
(1437, 53, 'Crnomelj'),
(1438, 53, 'Divaca'),
(1439, 53, 'Dobrepolje'),
(1440, 53, 'Dol pri Ljubljani'),
(1443, 53, 'Duplek'),
(1447, 53, 'Gornji Grad'),
(1450, 53, 'Hrastnik'),
(1451, 53, 'Hrpelje-Kozina'),
(1452, 53, 'Idrija'),
(1453, 53, 'Ig'),
(1454, 53, 'Ilirska Bistrica'),
(1455, 53, 'Ivancna Gorica'),
(1462, 53, 'Komen'),
(1463, 53, 'Koper-Capodistria'),
(1464, 53, 'Kozje'),
(1465, 53, 'Kranj'),
(1466, 53, 'Kranjska Gora'),
(1467, 53, 'Krsko'),
(1469, 53, 'Lasko'),
(1470, 53, 'Ljubljana'),
(1471, 53, 'Ljubno'),
(1472, 53, 'Logatec'),
(1475, 53, 'Medvode'),
(1476, 53, 'Menges'),
(1478, 53, 'Mezica'),
(1480, 53, 'Moravce'),
(1482, 53, 'Mozirje'),
(1483, 53, 'Murska Sobota'),
(1487, 53, 'Nova Gorica'),
(1489, 53, 'Ormoz'),
(1491, 53, 'Pesnica'),
(1494, 53, 'Postojna'),
(1497, 53, 'Radece'),
(1498, 53, 'Radenci'),
(1500, 53, 'Radovljica'),
(1502, 53, 'Rogaska Slatina'),
(1505, 53, 'Sencur'),
(1506, 53, 'Sentilj'),
(1508, 53, 'Sevnica'),
(1509, 53, 'Sezana'),
(1511, 53, 'Skofja Loka'),
(1513, 53, 'Slovenj Gradec'),
(1514, 53, 'Slovenske Konjice'),
(1515, 53, 'Smarje pri Jelsah'),
(1521, 53, 'Tolmin'),
(1522, 53, 'Trbovlje'),
(1524, 53, 'Trzic'),
(1526, 53, 'Velenje'),
(1528, 53, 'Vipava'),
(1531, 53, 'Vrhnika'),
(1532, 53, 'Vuzenica'),
(1533, 53, 'Zagorje ob Savi'),
(1535, 53, 'Zelezniki'),
(1536, 53, 'Ziri'),
(1537, 53, 'Zrece'),
(1539, 53, 'Domzale'),
(1540, 53, 'Jesenice'),
(1541, 53, 'Kamnik'),
(1542, 53, 'Kocevje'),
(1544, 53, 'Lenart'),
(1545, 53, 'Litija'),
(1546, 53, 'Ljutomer'),
(1550, 53, 'Maribor'),
(1552, 53, 'Novo Mesto'),
(1553, 53, 'Piran'),
(1554, 53, 'Preddvor'),
(1555, 53, 'Ptuj'),
(1556, 53, 'Ribnica'),
(1558, 53, 'Sentjur pri Celju'),
(1559, 53, 'Slovenska Bistrica'),
(1560, 53, 'Videm'),
(1562, 53, 'Zalec'),
(1564, 109, 'Seychelles'),
(1565, 108, 'Mauritania'),
(1566, 135, 'Senegal'),
(1567, 154, 'Road Town'),
(1568, 165, 'Congo'),
(1569, 166, 'Avarua'),
(1570, 172, 'Malabo'),
(1571, 175, 'Torshavn'),
(1572, 178, 'Papeete'),
(1573, 184, 'St George&#039;s'),
(1574, 186, 'St Peter Port'),
(1575, 188, 'Bissau'),
(1576, 193, 'Saint Helier'),
(1577, 201, 'Fort-de-France'),
(1578, 207, 'Willemstad'),
(1579, 208, 'Noumea'),
(1580, 212, 'Kingston'),
(1581, 215, 'Adamstown'),
(1582, 216, 'Doha'),
(1583, 218, 'Jamestown'),
(1584, 219, 'Basseterre'),
(1585, 220, 'Castries'),
(1586, 221, 'Saint Pierre'),
(1587, 222, 'Kingstown'),
(1588, 225, 'San Tome'),
(1589, 226, 'Belgrade'),
(1590, 227, 'Freetown'),
(1591, 229, 'Mogadishu'),
(1592, 235, 'Fakaofo'),
(1593, 237, 'Port of Spain'),
(1594, 241, 'Mata-Utu'),
(1596, 89, 'Amazonas'),
(1597, 89, 'Ancash'),
(1598, 89, 'Apurímac'),
(1599, 89, 'Arequipa'),
(1600, 89, 'Ayacucho'),
(1601, 89, 'Cajamarca'),
(1602, 89, 'Callao'),
(1603, 89, 'Cusco'),
(1604, 89, 'Huancavelica'),
(1605, 89, 'Huánuco'),
(1606, 89, 'Ica'),
(1607, 89, 'Junín'),
(1608, 89, 'La Libertad'),
(1609, 89, 'Lambayeque'),
(1610, 89, 'Lima'),
(1611, 89, 'Loreto'),
(1612, 89, 'Madre de Dios'),
(1613, 89, 'Moquegua'),
(1614, 89, 'Pasco'),
(1615, 89, 'Piura'),
(1616, 89, 'Puno'),
(1617, 89, 'San Martín'),
(1618, 89, 'Tacna'),
(1619, 89, 'Tumbes'),
(1620, 89, 'Ucayali'),
(1622, 110, 'Alto Paraná'),
(1623, 110, 'Amambay'),
(1624, 110, 'Boquerón'),
(1625, 110, 'Caaguaz&uacute;'),
(1626, 110, 'Caazapá'),
(1627, 110, 'Central'),
(1628, 110, 'Concepción'),
(1629, 110, 'Cordillera'),
(1630, 110, 'Guairá'),
(1631, 110, 'Itap&uacute;a'),
(1632, 110, 'Misiones'),
(1633, 110, 'Neembuc&uacute;'),
(1634, 110, 'Paraguarí'),
(1635, 110, 'Presidente Hayes'),
(1636, 110, 'San Pedro'),
(1637, 110, 'Alto Paraguay'),
(1638, 110, 'Canindey&uacute;'),
(1639, 110, 'Chaco'),
(1642, 111, 'Artigas'),
(1643, 111, 'Canelones'),
(1644, 111, 'Cerro Largo'),
(1645, 111, 'Colonia'),
(1646, 111, 'Durazno'),
(1647, 111, 'Flores'),
(1648, 111, 'Florida'),
(1649, 111, 'Lavalleja'),
(1650, 111, 'Maldonado'),
(1651, 111, 'Montevideo'),
(1652, 111, 'Paysand&uacute;'),
(1653, 111, 'Río Negro'),
(1654, 111, 'Rivera'),
(1655, 111, 'Rocha'),
(1656, 111, 'Salto'),
(1657, 111, 'San José'),
(1658, 111, 'Soriano'),
(1659, 111, 'Tacuarembó'),
(1660, 111, 'Treinta y Tres'),
(1662, 81, 'Valparaíso'),
(1663, 81, 'Aisén del General Carlos Ibánez del Campo'),
(1664, 81, 'Antofagasta'),
(1665, 81, 'Araucanía'),
(1666, 81, 'Atacama'),
(1667, 81, 'Bío-Bío'),
(1668, 81, 'Coquimbo'),
(1669, 81, 'Libertador General Bernardo O&#039;Higgins'),
(1670, 81, 'Los Lagos'),
(1671, 81, 'Magallanes y de la Antártica Chilena'),
(1672, 81, 'Maule'),
(1673, 81, 'Region Metropolitana'),
(1674, 81, 'Tarapacá'),
(1676, 185, 'Alta Verapaz'),
(1677, 185, 'Baja Verapaz'),
(1678, 185, 'Chimaltenango'),
(1679, 185, 'Chiquimula'),
(1680, 185, 'El Progreso'),
(1681, 185, 'Escuintla'),
(1682, 185, 'Guatemala'),
(1683, 185, 'Huehuetenango'),
(1684, 185, 'Izabal'),
(1685, 185, 'Jalapa'),
(1686, 185, 'Jutiapa'),
(1687, 185, 'Petén'),
(1688, 185, 'Quetzaltenango'),
(1689, 185, 'Quiché'),
(1690, 185, 'Retalhuleu'),
(1691, 185, 'Sacatepéquez'),
(1692, 185, 'San Marcos'),
(1693, 185, 'Santa Rosa'),
(1694, 185, 'Sololá'),
(1695, 185, 'Suchitepequez'),
(1696, 185, 'Totonicapán'),
(1697, 185, 'Zacapa'),
(1699, 82, 'Amazonas'),
(1700, 82, 'Antioquia'),
(1701, 82, 'Arauca'),
(1702, 82, 'Atlántico'),
(1703, 82, 'Caquetá'),
(1704, 82, 'Cauca'),
(1705, 82, 'César'),
(1706, 82, 'Chocó'),
(1707, 82, 'Córdoba'),
(1708, 82, 'Guaviare'),
(1709, 82, 'Guainía'),
(1710, 82, 'Huila'),
(1711, 82, 'La Guajira'),
(1712, 82, 'Meta'),
(1713, 82, 'Narino'),
(1714, 82, 'Norte de Santander'),
(1715, 82, 'Putumayo'),
(1716, 82, 'Quindío'),
(1717, 82, 'Risaralda'),
(1718, 82, 'San Andrés y Providencia'),
(1719, 82, 'Santander'),
(1720, 82, 'Sucre'),
(1721, 82, 'Tolima'),
(1722, 82, 'Valle del Cauca'),
(1723, 82, 'Vaupés'),
(1724, 82, 'Vichada'),
(1725, 82, 'Casanare'),
(1726, 82, 'Cundinamarca'),
(1727, 82, 'Distrito Especial'),
(1730, 82, 'Caldas'),
(1731, 82, 'Magdalena'),
(1733, 42, 'Aguascalientes'),
(1734, 42, 'Baja California'),
(1735, 42, 'Baja California Sur'),
(1736, 42, 'Campeche'),
(1737, 42, 'Chiapas'),
(1738, 42, 'Chihuahua'),
(1739, 42, 'Coahuila de Zaragoza'),
(1740, 42, 'Colima'),
(1741, 42, 'Distrito Federal'),
(1742, 42, 'Durango'),
(1743, 42, 'Guanajuato'),
(1744, 42, 'Guerrero'),
(1745, 42, 'Hidalgo'),
(1746, 42, 'Jalisco'),
(1747, 42, 'México'),
(1748, 42, 'Michoacán de Ocampo'),
(1749, 42, 'Morelos'),
(1750, 42, 'Nayarit'),
(1751, 42, 'Nuevo León'),
(1752, 42, 'Oaxaca'),
(1753, 42, 'Puebla'),
(1754, 42, 'Querétaro de Arteaga'),
(1755, 42, 'Quintana Roo'),
(1756, 42, 'San Luis Potosí'),
(1757, 42, 'Sinaloa'),
(1758, 42, 'Sonora'),
(1759, 42, 'Tabasco'),
(1760, 42, 'Tamaulipas'),
(1761, 42, 'Tlaxcala'),
(1762, 42, 'Veracruz-Llave'),
(1763, 42, 'Yucatán'),
(1764, 42, 'Zacatecas'),
(1766, 124, 'Bocas del Toro'),
(1767, 124, 'Chiriquí'),
(1768, 124, 'Coclé'),
(1769, 124, 'Colón'),
(1770, 124, 'Darién'),
(1771, 124, 'Herrera'),
(1772, 124, 'Los Santos'),
(1773, 124, 'Panamá'),
(1774, 124, 'San Blas'),
(1775, 124, 'Veraguas'),
(1777, 123, 'Chuquisaca'),
(1778, 123, 'Cochabamba'),
(1779, 123, 'El Beni'),
(1780, 123, 'La Paz'),
(1781, 123, 'Oruro'),
(1782, 123, 'Pando'),
(1783, 123, 'Potosí'),
(1784, 123, 'Santa Cruz'),
(1785, 123, 'Tarija'),
(1787, 36, 'Alajuela'),
(1788, 36, 'Cartago'),
(1789, 36, 'Guanacaste'),
(1790, 36, 'Heredia'),
(1791, 36, 'Limón'),
(1792, 36, 'Puntarenas'),
(1793, 36, 'San José'),
(1795, 103, 'Galápagos'),
(1796, 103, 'Azuay'),
(1797, 103, 'Bolívar'),
(1798, 103, 'Canar'),
(1799, 103, 'Carchi'),
(1800, 103, 'Chimborazo'),
(1801, 103, 'Cotopaxi'),
(1802, 103, 'El Oro'),
(1803, 103, 'Esmeraldas'),
(1804, 103, 'Guayas'),
(1805, 103, 'Imbabura'),
(1806, 103, 'Loja'),
(1807, 103, 'Los Ríos'),
(1808, 103, 'Manabí'),
(1809, 103, 'Morona-Santiago'),
(1810, 103, 'Pastaza'),
(1811, 103, 'Pichincha'),
(1812, 103, 'Tungurahua'),
(1813, 103, 'Zamora-Chinchipe'),
(1814, 103, 'Sucumbíos'),
(1815, 103, 'Napo'),
(1816, 103, 'Orellana'),
(1818, 5, 'Buenos Aires'),
(1819, 5, 'Catamarca'),
(1820, 5, 'Chaco'),
(1821, 5, 'Chubut'),
(1822, 5, 'Córdoba'),
(1823, 5, 'Corrientes'),
(1824, 5, 'Distrito Federal'),
(1825, 5, 'Entre Ríos'),
(1826, 5, 'Formosa'),
(1827, 5, 'Jujuy'),
(1828, 5, 'La Pampa'),
(1829, 5, 'La Rioja'),
(1830, 5, 'Mendoza'),
(1831, 5, 'Misiones'),
(1832, 5, 'Neuquén'),
(1833, 5, 'Río Negro'),
(1834, 5, 'Salta'),
(1835, 5, 'San Juan'),
(1836, 5, 'San Luis'),
(1837, 5, 'Santa Cruz'),
(1838, 5, 'Santa Fe'),
(1839, 5, 'Santiago del Estero'),
(1840, 5, 'Tierra del Fuego'),
(1841, 5, 'Tucumán'),
(1843, 95, 'Amazonas'),
(1844, 95, 'Anzoategui'),
(1845, 95, 'Apure'),
(1846, 95, 'Aragua'),
(1847, 95, 'Barinas'),
(1848, 95, 'Bolívar'),
(1849, 95, 'Carabobo'),
(1850, 95, 'Cojedes'),
(1851, 95, 'Delta Amacuro'),
(1852, 95, 'Falcón'),
(1853, 95, 'Guárico'),
(1854, 95, 'Lara'),
(1855, 95, 'Mérida'),
(1856, 95, 'Miranda'),
(1857, 95, 'Monagas'),
(1858, 95, 'Nueva Esparta'),
(1859, 95, 'Portuguesa'),
(1860, 95, 'Sucre'),
(1861, 95, 'Táchira'),
(1862, 95, 'Trujillo'),
(1863, 95, 'Yaracuy'),
(1864, 95, 'Zulia'),
(1865, 95, 'Dependencias Federales'),
(1866, 95, 'Distrito Capital'),
(1867, 95, 'Vargas'),
(1869, 209, 'Boaco'),
(1870, 209, 'Carazo'),
(1871, 209, 'Chinandega'),
(1872, 209, 'Chontales'),
(1873, 209, 'Estelí'),
(1874, 209, 'Granada'),
(1875, 209, 'Jinotega'),
(1876, 209, 'León'),
(1877, 209, 'Madriz'),
(1878, 209, 'Managua'),
(1879, 209, 'Masaya'),
(1880, 209, 'Matagalpa'),
(1881, 209, 'Nueva Segovia'),
(1882, 209, 'Rio San Juan'),
(1883, 209, 'Rivas'),
(1884, 209, 'Zelaya'),
(1886, 113, 'Pinar del Rio'),
(1887, 113, 'Ciudad de la Habana'),
(1888, 113, 'Matanzas'),
(1889, 113, 'Isla de la Juventud'),
(1890, 113, 'Camaguey'),
(1891, 113, 'Ciego de Avila'),
(1892, 113, 'Cienfuegos'),
(1893, 113, 'Granma'),
(1894, 113, 'Guantanamo'),
(1895, 113, 'La Habana'),
(1896, 113, 'Holguin'),
(1897, 113, 'Las Tunas'),
(1898, 113, 'Sancti Spiritus'),
(1899, 113, 'Santiago de Cuba'),
(1900, 113, 'Villa Clara'),
(1901, 12, 'Acre'),
(1902, 12, 'Alagoas'),
(1903, 12, 'Amapa'),
(1904, 12, 'Amazonas'),
(1905, 12, 'Bahia'),
(1906, 12, 'Ceara'),
(1907, 12, 'Distrito Federal'),
(1908, 12, 'Espirito Santo'),
(1909, 12, 'Mato Grosso do Sul'),
(1910, 12, 'Maranhao'),
(1911, 12, 'Mato Grosso'),
(1912, 12, 'Minas Gerais'),
(1913, 12, 'Para'),
(1914, 12, 'Paraiba'),
(1915, 12, 'Parana'),
(1916, 12, 'Piaui'),
(1917, 12, 'Rio de Janeiro'),
(1918, 12, 'Rio Grande do Norte'),
(1919, 12, 'Rio Grande do Sul'),
(1920, 12, 'Rondonia'),
(1921, 12, 'Roraima'),
(1922, 12, 'Santa Catarina'),
(1923, 12, 'Sao Paulo'),
(1924, 12, 'Sergipe'),
(1925, 12, 'Goias'),
(1926, 12, 'Pernambuco'),
(1927, 12, 'Tocantins'),
(1930, 83, 'Akureyri'),
(1931, 83, 'Arnessysla'),
(1932, 83, 'Austur-Bardastrandarsysla'),
(1933, 83, 'Austur-Hunavatnssysla'),
(1934, 83, 'Austur-Skaftafellssysla'),
(1935, 83, 'Borgarfjardarsysla'),
(1936, 83, 'Dalasysla'),
(1937, 83, 'Eyjafjardarsysla'),
(1938, 83, 'Gullbringusysla'),
(1939, 83, 'Hafnarfjordur'),
(1943, 83, 'Kjosarsysla'),
(1944, 83, 'Kopavogur'),
(1945, 83, 'Myrasysla'),
(1946, 83, 'Neskaupstadur'),
(1947, 83, 'Nordur-Isafjardarsysla'),
(1948, 83, 'Nordur-Mulasysla'),
(1949, 83, 'Nordur-Tingeyjarsysla'),
(1950, 83, 'Olafsfjordur'),
(1951, 83, 'Rangarvallasysla'),
(1952, 83, 'Reykjavik'),
(1953, 83, 'Saudarkrokur'),
(1954, 83, 'Seydisfjordur'),
(1956, 83, 'Skagafjardarsysla'),
(1957, 83, 'Snafellsnes- og Hnappadalssysla'),
(1958, 83, 'Strandasysla'),
(1959, 83, 'Sudur-Mulasysla'),
(1960, 83, 'Sudur-Tingeyjarsysla'),
(1961, 83, 'Vestmannaeyjar'),
(1962, 83, 'Vestur-Bardastrandarsysla'),
(1964, 83, 'Vestur-Isafjardarsysla'),
(1965, 83, 'Vestur-Skaftafellssysla'),
(1966, 35, 'Anhui'),
(1967, 35, 'Zhejiang'),
(1968, 35, 'Jiangxi'),
(1969, 35, 'Jiangsu'),
(1970, 35, 'Jilin'),
(1971, 35, 'Qinghai'),
(1972, 35, 'Fujian'),
(1973, 35, 'Heilongjiang'),
(1974, 35, 'Henan'),
(1975, 35, 'Hebei'),
(1976, 35, 'Hunan'),
(1977, 35, 'Hubei'),
(1978, 35, 'Xinjiang'),
(1979, 35, 'Xizang'),
(1980, 35, 'Gansu'),
(1981, 35, 'Guangxi'),
(1982, 35, 'Guizhou'),
(1983, 35, 'Liaoning'),
(1984, 35, 'Nei Mongol'),
(1985, 35, 'Ningxia'),
(1986, 35, 'Beijing'),
(1987, 35, 'Shanghai'),
(1988, 35, 'Shanxi'),
(1989, 35, 'Shandong'),
(1990, 35, 'Shaanxi'),
(1991, 35, 'Sichuan'),
(1992, 35, 'Tianjin'),
(1993, 35, 'Yunnan'),
(1994, 35, 'Guangdong'),
(1995, 35, 'Hainan'),
(1996, 35, 'Chongqing'),
(1997, 97, 'Central'),
(1998, 97, 'Coast'),
(1999, 97, 'Eastern'),
(2000, 97, 'Nairobi Area'),
(2001, 97, 'North-Eastern'),
(2002, 97, 'Nyanza'),
(2003, 97, 'Rift Valley'),
(2004, 97, 'Western'),
(2006, 195, 'Gilbert Islands'),
(2007, 195, 'Line Islands'),
(2008, 195, 'Phoenix Islands'),
(2010, 1, 'Australian Capital Territory'),
(2011, 1, 'New South Wales'),
(2012, 1, 'Northern Territory'),
(2013, 1, 'Queensland'),
(2014, 1, 'South Australia'),
(2015, 1, 'Tasmania'),
(2016, 1, 'Victoria'),
(2017, 1, 'Western Australia'),
(2018, 27, 'Dublin'),
(2019, 27, 'Galway'),
(2020, 27, 'Kildare'),
(2021, 27, 'Leitrim'),
(2022, 27, 'Limerick'),
(2023, 27, 'Mayo'),
(2024, 27, 'Meath'),
(2025, 27, 'Carlow'),
(2026, 27, 'Kilkenny'),
(2027, 27, 'Laois'),
(2028, 27, 'Longford'),
(2029, 27, 'Louth'),
(2030, 27, 'Offaly'),
(2031, 27, 'Westmeath'),
(2032, 27, 'Wexford'),
(2033, 27, 'Wicklow'),
(2034, 27, 'Roscommon'),
(2035, 27, 'Sligo'),
(2036, 27, 'Clare'),
(2037, 27, 'Cork'),
(2038, 27, 'Kerry'),
(2039, 27, 'Tipperary'),
(2040, 27, 'Waterford'),
(2041, 27, 'Cavan'),
(2042, 27, 'Donegal'),
(2043, 27, 'Monaghan'),
(2044, 50, 'Karachaeva-Cherkesskaya Respublica'),
(2045, 50, 'Raimirskii (Dolgano-Nenetskii) AO'),
(2046, 50, 'Respublica Tiva'),
(2047, 32, 'Newfoundland'),
(2048, 32, 'Nova Scotia'),
(2049, 32, 'Prince Edward Island'),
(2050, 32, 'New Brunswick'),
(2051, 32, 'Quebec'),
(2052, 32, 'Ontario'),
(2053, 32, 'Manitoba'),
(2054, 32, 'Saskatchewan'),
(2055, 32, 'Alberta'),
(2056, 32, 'British Columbia'),
(2057, 32, 'Nunavut'),
(2058, 32, 'Northwest Territories'),
(2059, 32, 'Yukon Territory'),
(2060, 19, 'Drenthe'),
(2061, 19, 'Friesland'),
(2062, 19, 'Gelderland'),
(2063, 19, 'Groningen'),
(2064, 19, 'Limburg'),
(2065, 19, 'Noord-Brabant'),
(2066, 19, 'Noord-Holland'),
(2067, 19, 'Utrecht'),
(2068, 19, 'Zeeland'),
(2069, 19, 'Zuid-Holland'),
(2071, 19, 'Overijssel'),
(2072, 19, 'Flevoland'),
(2073, 138, 'Duarte'),
(2074, 138, 'Puerto Plata'),
(2075, 138, 'Valverde'),
(2076, 138, 'María Trinidad Sánchez'),
(2077, 138, 'Azua'),
(2078, 138, 'Santiago'),
(2079, 138, 'San Cristóbal'),
(2080, 138, 'Peravia'),
(2081, 138, 'Elías Piña'),
(2082, 138, 'Barahona'),
(2083, 138, 'Monte Plata'),
(2084, 138, 'Salcedo'),
(2085, 138, 'La Altagracia'),
(2086, 138, 'San Juan'),
(2087, 138, 'Monseñor Nouel'),
(2088, 138, 'Monte Cristi'),
(2089, 138, 'Espaillat'),
(2090, 138, 'Sánchez Ramírez'),
(2091, 138, 'La Vega'),
(2092, 138, 'San Pedro de Macorís'),
(2093, 138, 'Independencia'),
(2094, 138, 'Dajabón'),
(2095, 138, 'Baoruco'),
(2096, 138, 'El Seibo'),
(2097, 138, 'Hato Mayor'),
(2098, 138, 'La Romana'),
(2099, 138, 'Pedernales'),
(2100, 138, 'Samaná'),
(2101, 138, 'Santiago Rodríguez'),
(2102, 138, 'San José de Ocoa'),
(2103, 70, 'Chiba'),
(2104, 70, 'Ehime'),
(2105, 70, 'Oita'),
(2106, 85, 'Skopje'),
(2108, 35, 'Schanghai'),
(2109, 35, 'Hongkong'),
(2110, 35, 'Neimenggu'),
(2111, 35, 'Aomen'),
(2112, 92, 'Amnat Charoen'),
(2113, 92, 'Ang Thong'),
(2114, 92, 'Bangkok'),
(2115, 92, 'Buri Ram'),
(2116, 92, 'Chachoengsao'),
(2117, 92, 'Chai Nat'),
(2118, 92, 'Chaiyaphum'),
(2119, 92, 'Chanthaburi'),
(2120, 92, 'Chiang Mai'),
(2121, 92, 'Chiang Rai'),
(2122, 92, 'Chon Buri'),
(2124, 92, 'Kalasin'),
(2126, 92, 'Kanchanaburi'),
(2127, 92, 'Khon Kaen'),
(2128, 92, 'Krabi'),
(2129, 92, 'Lampang'),
(2131, 92, 'Loei'),
(2132, 92, 'Lop Buri'),
(2133, 92, 'Mae Hong Son'),
(2134, 92, 'Maha Sarakham'),
(2137, 92, 'Nakhon Pathom'),
(2139, 92, 'Nakhon Ratchasima'),
(2140, 92, 'Nakhon Sawan'),
(2141, 92, 'Nakhon Si Thammarat'),
(2143, 92, 'Narathiwat'),
(2144, 92, 'Nong Bua Lam Phu'),
(2145, 92, 'Nong Khai'),
(2146, 92, 'Nonthaburi'),
(2147, 92, 'Pathum Thani'),
(2148, 92, 'Pattani'),
(2149, 92, 'Phangnga'),
(2150, 92, 'Phatthalung'),
(2154, 92, 'Phichit'),
(2155, 92, 'Phitsanulok'),
(2156, 92, 'Phra Nakhon Si Ayutthaya'),
(2157, 92, 'Phrae'),
(2158, 92, 'Phuket'),
(2159, 92, 'Prachin Buri'),
(2160, 92, 'Prachuap Khiri Khan'),
(2162, 92, 'Ratchaburi'),
(2163, 92, 'Rayong'),
(2164, 92, 'Roi Et'),
(2165, 92, 'Sa Kaeo'),
(2166, 92, 'Sakon Nakhon'),
(2167, 92, 'Samut Prakan'),
(2168, 92, 'Samut Sakhon'),
(2169, 92, 'Samut Songkhran'),
(2170, 92, 'Saraburi'),
(2172, 92, 'Si Sa Ket'),
(2173, 92, 'Sing Buri'),
(2174, 92, 'Songkhla'),
(2175, 92, 'Sukhothai'),
(2176, 92, 'Suphan Buri'),
(2177, 92, 'Surat Thani'),
(2178, 92, 'Surin'),
(2180, 92, 'Trang'),
(2182, 92, 'Ubon Ratchathani'),
(2183, 92, 'Udon Thani'),
(2184, 92, 'Uthai Thani'),
(2185, 92, 'Uttaradit'),
(2186, 92, 'Yala'),
(2187, 92, 'Yasothon'),
(2188, 69, 'Busan'),
(2189, 69, 'Daegu'),
(2191, 69, 'Gangwon'),
(2192, 69, 'Gwangju'),
(2193, 69, 'Gyeonggi'),
(2194, 69, 'Gyeongsangbuk'),
(2195, 69, 'Gyeongsangnam'),
(2196, 69, 'Jeju'),
(2201, 25, 'Delhi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_laboral`
--

CREATE TABLE IF NOT EXISTS `experiencia_laboral` (
  `id` int(11) NOT NULL,
  `nombre_empresa` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `direccion_empresa` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion`
--

CREATE TABLE IF NOT EXISTS `gestion` (
  `id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` tinyint(4) NOT NULL,
  `nombre_gestion` varchar(25) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gestion`
--

INSERT INTO `gestion` (`id`, `fecha_inicio`, `fecha_fin`, `estado`, `nombre_gestion`, `deleted_at`) VALUES
(1, '2012-02-02', '2018-02-03', 1, '2018', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE IF NOT EXISTS `lote` (
  `id` int(11) NOT NULL,
  `nroLote` int(11) DEFAULT NULL,
  `superficie` decimal(10,2) DEFAULT NULL,
  `manzano` int(11) DEFAULT NULL,
  `uv` int(11) DEFAULT NULL,
  `norte` varchar(25) DEFAULT NULL,
  `medidaNorte` int(11) DEFAULT NULL,
  `sur` varchar(25) DEFAULT NULL,
  `medidaSur` int(11) DEFAULT NULL,
  `este` varchar(25) DEFAULT NULL,
  `medidaEste` int(11) DEFAULT NULL,
  `oeste` varchar(25) DEFAULT NULL,
  `medidaOeste` int(11) DEFAULT NULL,
  `matricula` varchar(100) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `point` varchar(100) DEFAULT NULL,
  `fase` tinyint(4) NOT NULL,
  `tipo_etiqueta` tinyint(4) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `idCategoriaLote` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2137 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(2118, 1, '12.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.68 -23.86) rotate(3.19)', 1, 2, 3, NULL, 14),
(2119, 1, '55.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(27.25 -18.99) rotate(3.19)', 1, 2, 3, NULL, 13),
(2120, 3, '1.00', 23, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.37 -20.2) rotate(3.19)', 1, 2, 3, NULL, 13),
(2121, 23, '356.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 2, 'translate(27.14 -17.77) rotate(3.19)', 1, 2, 3, NULL, 13),
(2122, 1, '12.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(27.58 -22.64) rotate(3.19)', 1, 2, 3, NULL, 13),
(2123, 1, '12.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, '165.15 105.29 164.8 114.52 183.56 115.74 183.97 106.45 165.15 105.29', 1, 0, 1, NULL, 14),
(2124, 1, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(28.36 -31.2) rotate(3.19)', 1, 2, 3, NULL, 15),
(2125, 1, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(27.78 -25.1) rotate(3.19)', 1, 2, 3, NULL, 13),
(2126, 252, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(28.66 -34.81) rotate(3.19)', 1, 2, 3, NULL, 13),
(2127, 10, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(31.92 -36.95) rotate(3.19)', 1, 2, 3, NULL, 13),
(2128, 11, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(31.77 -35.74) rotate(3.19)', 1, 2, 3, NULL, 13),
(2129, 123, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(30.2 -17.51) rotate(3.19)', 1, 2, 3, NULL, 13),
(2130, 32, '450.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(30.29 -18.73) rotate(3.19)', 1, 2, 3, NULL, 13),
(2131, 360, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.82 -24.82) rotate(3.19)', 1, 2, 3, NULL, 15),
(2132, 35, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.59 -33.33) rotate(3.19)', 1, 2, 3, NULL, 15),
(2133, 50, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.08 -27.25) rotate(3.19)', 1, 2, 3, NULL, 15),
(2134, 54, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.62 -22.38) rotate(3.19)', 1, 2, 3, NULL, 15),
(2135, 88, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.41 -30.94) rotate(3.19)', 1, 2, 3, NULL, 15),
(2136, 87, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(30.39 -19.96) rotate(3.19)', 1, 2, 3, NULL, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses`
--

CREATE TABLE IF NOT EXISTS `meses` (
  `id` int(11) NOT NULL,
  `mesMin` int(11) DEFAULT NULL,
  `mesMax` int(11) NOT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `meses`
--

INSERT INTO `meses` (`id`, `mesMin`, `mesMax`, `idProyecto`, `deleted_at`, `updated_at`) VALUES
(8, 6, 60, 1, NULL, '0000-00-00'),
(9, 6, 60, 3, NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `nombre`, `deleted_at`) VALUES
(1, 'Usuario', NULL),
(2, 'Seguridad', NULL),
(3, 'Empleado', NULL),
(4, 'Proyecto', NULL),
(5, 'Lotes', NULL),
(6, 'Ventas y Reservas', NULL),
(7, 'Vendedor', NULL),
(8, 'Vendedor', '2017-06-28'),
(9, 'Empresa', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE IF NOT EXISTS `moneda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `abreviatura` varchar(5) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id`, `nombre`, `abreviatura`, `deleted_at`) VALUES
(1, 'BOLIVIANO', 'BS', NULL),
(2, 'DOLARES', 'USD', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto`
--

CREATE TABLE IF NOT EXISTS `objeto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `tipoObjeto` varchar(30) DEFAULT NULL,
  `urlObjeto` varchar(30) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `visibleEnMenu` tinyint(4) DEFAULT NULL,
  `idModulo` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `objeto`
--

INSERT INTO `objeto` (`id`, `nombre`, `tipoObjeto`, `urlObjeto`, `estado`, `visibleEnMenu`, `idModulo`, `deleted_at`) VALUES
(1, 'Gestionar Usuario', 'Formulario', '/Usuario', 1, 1, 1, NULL),
(2, 'Gestionar Perfil', 'Formulario', '/Perfil', 1, 1, 2, NULL),
(3, 'Gestionar Objeto', 'Formulario', '/Objeto', 1, 1, 2, NULL),
(4, 'Gestionar Empleado', 'Formulario', '/Empleado', 1, 1, 3, NULL),
(6, 'Gestionar Cargo', 'Formulario', '/Cargo', 1, 1, 3, NULL),
(7, 'Gestionar Turno', 'Formulario', '/Turno', 1, 1, 3, NULL),
(8, 'Gestionar Lotes', 'Formulario', '/Lote', 1, 1, 5, NULL),
(10, 'Gestionar Proyecto', 'Formulario', '/Proyecto', 1, 1, 4, NULL),
(11, 'Gestionar Categoria de Lotes', 'Formulario', '/Categoria', 1, 1, 4, NULL),
(12, 'Gestionar Precios', 'Formulario', '/Precio', 1, 1, 4, NULL),
(13, 'Gestionar Meses', 'Formulario', '/Meses', 1, 1, 4, NULL),
(14, 'Gestionar Cuota Minima', 'Formulario', '/CuotaMinima', 1, 1, 4, NULL),
(15, 'Gestionar Descuento En Venta', 'Formulario', '/DescuentoVenta', 1, 1, 4, NULL),
(16, 'PorcentajeDevolucionReserva', 'Formulario', '/PorcentajeDevolucionReserva', 1, 1, 4, NULL),
(17, 'Gestionar Tipo de Cambio', 'Formulario', '/TipoCambio', 1, 1, 4, NULL),
(18, 'Gestionar Empresa', 'Formulario', '/Empresa', 1, 1, 9, NULL),
(19, 'Gestionar Banco', 'Formulario', '/Banco', 1, 1, 9, NULL),
(20, 'Gestionar Pre Reserva', 'Formulario', '/PreReserva', 1, 1, 7, NULL),
(21, 'Gestionar Vendedor', 'Formulario', '/Vendedor', 1, 1, 7, NULL),
(22, 'Gestionar Venta', 'Formulario', '/Venta', 1, 1, 6, NULL),
(23, 'Gestionar Reserva', 'Formulario', '/Reservar', 1, 1, 6, NULL),
(24, 'Gestionar Ventas a Plazo', 'Formulario', '/PagoVenta', 1, 1, 6, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE IF NOT EXISTS `pago` (
  `id` int(11) NOT NULL,
  `monto` decimal(9,2) NOT NULL,
  `tipoPago` char(4) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idVenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagocuota`
--

CREATE TABLE IF NOT EXISTS `pagocuota` (
  `id` int(11) NOT NULL,
  `totalPagoBs` decimal(12,2) DEFAULT NULL,
  `totalPagoUsd` decimal(12,2) DEFAULT NULL,
  `pagoBs` decimal(12,2) DEFAULT NULL,
  `pagoUsd` decimal(12,2) DEFAULT NULL,
  `cambioUsd` decimal(12,2) DEFAULT NULL,
  `cambioBs` decimal(12,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `tipoPago` tinyint(4) DEFAULT NULL,
  `saldoDeuda` decimal(9,2) DEFAULT NULL,
  `idPlandePago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL,
  `paisnombre` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `idPais` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `paisnombre`, `idPais`, `deleted_at`) VALUES
(1, 'Australia', NULL, NULL),
(2, 'Austria', NULL, NULL),
(3, 'Azerbaiyán', NULL, NULL),
(4, 'Anguilla', NULL, NULL),
(5, 'Argentina', NULL, NULL),
(6, 'Armenia', NULL, NULL),
(7, 'Bielorrusia', NULL, NULL),
(8, 'Belice', NULL, NULL),
(9, 'Bélgica', NULL, NULL),
(10, 'Bermudas', NULL, NULL),
(11, 'Bulgaria', NULL, NULL),
(12, 'Brasil', NULL, NULL),
(13, 'Reino Unido', NULL, NULL),
(14, 'Hungría', NULL, NULL),
(15, 'Vietnam', NULL, NULL),
(16, 'Haiti', NULL, NULL),
(17, 'Guadalupe', NULL, NULL),
(18, 'Alemania', NULL, NULL),
(19, 'Países Bajos, Holanda', NULL, NULL),
(20, 'Grecia', NULL, NULL),
(21, 'Georgia', NULL, NULL),
(22, 'Dinamarca', NULL, NULL),
(23, 'Egipto', NULL, NULL),
(24, 'Israel', NULL, NULL),
(25, 'India', NULL, NULL),
(26, 'Irán', NULL, NULL),
(27, 'Irlanda', NULL, NULL),
(28, 'España', NULL, NULL),
(29, 'Italia', NULL, NULL),
(30, 'Kazajstán', NULL, NULL),
(31, 'Camerún', NULL, NULL),
(32, 'Canadá', NULL, NULL),
(33, 'Chipre', NULL, NULL),
(34, 'Kirguistán', NULL, NULL),
(35, 'China', NULL, NULL),
(36, 'Costa Rica', NULL, NULL),
(37, 'Kuwait', NULL, NULL),
(38, 'Letonia', NULL, NULL),
(39, 'Libia', NULL, NULL),
(40, 'Lituania', NULL, NULL),
(41, 'Luxemburgo', NULL, NULL),
(42, 'México', NULL, NULL),
(43, 'Moldavia', NULL, NULL),
(44, 'Mónaco', NULL, NULL),
(45, 'Nueva Zelanda', NULL, NULL),
(46, 'Noruega', NULL, NULL),
(47, 'Polonia', NULL, NULL),
(48, 'Portugal', NULL, NULL),
(49, 'Reunión', NULL, NULL),
(50, 'Rusia', NULL, NULL),
(51, 'El Salvador', NULL, NULL),
(52, 'Eslovaquia', NULL, NULL),
(53, 'Eslovenia', NULL, NULL),
(54, 'Surinam', NULL, NULL),
(55, 'Estados Unidos', NULL, NULL),
(56, 'Tadjikistan', NULL, NULL),
(57, 'Turkmenistan', NULL, NULL),
(58, 'Islas Turcas y Caicos', NULL, NULL),
(59, 'Turquía', NULL, NULL),
(60, 'Uganda', NULL, NULL),
(61, 'Uzbekistán', NULL, NULL),
(62, 'Ucrania', NULL, NULL),
(63, 'Finlandia', NULL, NULL),
(64, 'Francia', NULL, NULL),
(65, 'República Checa', NULL, NULL),
(66, 'Suiza', NULL, NULL),
(67, 'Suecia', NULL, NULL),
(68, 'Estonia', NULL, NULL),
(69, 'Corea del Sur', NULL, NULL),
(70, 'Japón', NULL, NULL),
(71, 'Croacia', NULL, NULL),
(72, 'Rumanía', NULL, NULL),
(73, 'Hong Kong', NULL, NULL),
(74, 'Indonesia', NULL, NULL),
(75, 'Jordania', NULL, NULL),
(76, 'Malasia', NULL, NULL),
(77, 'Singapur', NULL, NULL),
(78, 'Taiwan', NULL, NULL),
(79, 'Bosnia y Herzegovina', NULL, NULL),
(80, 'Bahamas', NULL, NULL),
(81, 'Chile', NULL, NULL),
(82, 'Colombia', NULL, NULL),
(83, 'Islandia', NULL, NULL),
(84, 'Corea del Norte', NULL, NULL),
(85, 'Macedonia', NULL, NULL),
(86, 'Malta', NULL, NULL),
(87, 'Pakistán', NULL, NULL),
(88, 'Papúa-Nueva Guinea', NULL, NULL),
(89, 'Perú', NULL, NULL),
(90, 'Filipinas', NULL, NULL),
(91, 'Arabia Saudita', NULL, NULL),
(92, 'Tailandia', NULL, NULL),
(93, 'Emiratos árabes Unidos', NULL, NULL),
(94, 'Groenlandia', NULL, NULL),
(95, 'Venezuela', NULL, NULL),
(96, 'Zimbabwe', NULL, NULL),
(97, 'Kenia', NULL, NULL),
(98, 'Algeria', NULL, NULL),
(99, 'Líbano', NULL, NULL),
(100, 'Botsuana', NULL, NULL),
(101, 'Tanzania', NULL, NULL),
(102, 'Namibia', NULL, NULL),
(103, 'Ecuador', NULL, NULL),
(104, 'Marruecos', NULL, NULL),
(105, 'Ghana', NULL, NULL),
(106, 'Siria', NULL, NULL),
(107, 'Nepal', NULL, NULL),
(108, 'Mauritania', NULL, NULL),
(109, 'Seychelles', NULL, NULL),
(110, 'Paraguay', NULL, NULL),
(111, 'Uruguay', NULL, NULL),
(112, 'Congo (Brazzaville)', NULL, NULL),
(113, 'Cuba', NULL, NULL),
(114, 'Albania', NULL, NULL),
(115, 'Nigeria', NULL, NULL),
(116, 'Zambia', NULL, NULL),
(117, 'Mozambique', NULL, NULL),
(119, 'Angola', NULL, NULL),
(120, 'Sri Lanka', NULL, NULL),
(121, 'Etiopía', NULL, NULL),
(122, 'Túnez', NULL, NULL),
(123, 'Bolivia', NULL, NULL),
(124, 'Panamá', NULL, NULL),
(125, 'Malawi', NULL, NULL),
(126, 'Liechtenstein', NULL, NULL),
(127, 'Bahrein', NULL, NULL),
(128, 'Barbados', NULL, NULL),
(130, 'Chad', NULL, NULL),
(131, 'Man, Isla de', NULL, NULL),
(132, 'Jamaica', NULL, NULL),
(133, 'Malí', NULL, NULL),
(134, 'Madagascar', NULL, NULL),
(135, 'Senegal', NULL, NULL),
(136, 'Togo', NULL, NULL),
(137, 'Honduras', NULL, NULL),
(138, 'República Dominicana', NULL, NULL),
(139, 'Mongolia', NULL, NULL),
(140, 'Irak', NULL, NULL),
(141, 'Sudáfrica', NULL, NULL),
(142, 'Aruba', NULL, NULL),
(143, 'Gibraltar', NULL, NULL),
(144, 'Afganistán', NULL, NULL),
(145, 'Andorra', NULL, NULL),
(147, 'Antigua y Barbuda', NULL, NULL),
(149, 'Bangladesh', NULL, NULL),
(151, 'Benín', NULL, NULL),
(152, 'Bután', NULL, NULL),
(154, 'Islas Virgenes Británicas', NULL, NULL),
(155, 'Brunéi', NULL, NULL),
(156, 'Burkina Faso', NULL, NULL),
(157, 'Burundi', NULL, NULL),
(158, 'Camboya', NULL, NULL),
(159, 'Cabo Verde', NULL, NULL),
(164, 'Comores', NULL, NULL),
(165, 'Congo (Kinshasa)', NULL, NULL),
(166, 'Cook, Islas', NULL, NULL),
(168, 'Costa de Marfil', NULL, NULL),
(169, 'Djibouti, Yibuti', NULL, NULL),
(171, 'Timor Oriental', NULL, NULL),
(172, 'Guinea Ecuatorial', NULL, NULL),
(173, 'Eritrea', NULL, NULL),
(175, 'Feroe, Islas', NULL, NULL),
(176, 'Fiyi', NULL, NULL),
(178, 'Polinesia Francesa', NULL, NULL),
(180, 'Gabón', NULL, NULL),
(181, 'Gambia', NULL, NULL),
(184, 'Granada', NULL, NULL),
(185, 'Guatemala', NULL, NULL),
(186, 'Guernsey', NULL, NULL),
(187, 'Guinea', NULL, NULL),
(188, 'Guinea-Bissau', NULL, NULL),
(189, 'Guyana', NULL, NULL),
(193, 'Jersey', NULL, NULL),
(195, 'Kiribati', NULL, NULL),
(196, 'Laos', NULL, NULL),
(197, 'Lesotho', NULL, NULL),
(198, 'Liberia', NULL, NULL),
(200, 'Maldivas', NULL, NULL),
(201, 'Martinica', NULL, NULL),
(202, 'Mauricio', NULL, NULL),
(205, 'Myanmar', NULL, NULL),
(206, 'Nauru', NULL, NULL),
(207, 'Antillas Holandesas', NULL, NULL),
(208, 'Nueva Caledonia', NULL, NULL),
(209, 'Nicaragua', NULL, NULL),
(210, 'Níger', NULL, NULL),
(212, 'Norfolk Island', NULL, NULL),
(213, 'Omán', NULL, NULL),
(215, 'Isla Pitcairn', NULL, NULL),
(216, 'Qatar', NULL, NULL),
(217, 'Ruanda', NULL, NULL),
(218, 'Santa Elena', NULL, NULL),
(219, 'San Cristobal y Nevis', NULL, NULL),
(220, 'Santa Lucía', NULL, NULL),
(221, 'San Pedro y Miquelón', NULL, NULL),
(222, 'San Vincente y Granadinas', NULL, NULL),
(223, 'Samoa', NULL, NULL),
(224, 'San Marino', NULL, NULL),
(225, 'San Tomé y Príncipe', NULL, NULL),
(226, 'Serbia y Montenegro', NULL, NULL),
(227, 'Sierra Leona', NULL, NULL),
(228, 'Islas Salomón', NULL, NULL),
(229, 'Somalia', NULL, NULL),
(232, 'Sudán', NULL, NULL),
(234, 'Swazilandia', NULL, NULL),
(235, 'Tokelau', NULL, NULL),
(236, 'Tonga', NULL, NULL),
(237, 'Trinidad y Tobago', NULL, NULL),
(239, 'Tuvalu', NULL, NULL),
(240, 'Vanuatu', NULL, NULL),
(241, 'Wallis y Futuna', NULL, NULL),
(242, 'Sáhara Occidental', NULL, NULL),
(243, 'Yemen', NULL, NULL),
(246, 'Puerto Rico', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre`, `deleted_at`) VALUES
(1, 'Administrador', NULL),
(7, 'administrador Provision', NULL),
(8, 'Gerencia de Venta', NULL),
(9, 'Gestor de Venta', NULL),
(10, 'Vendedor', NULL),
(11, 'Asesor de Venta', NULL),
(12, 'Gestionador de Lote', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilobjeto`
--

CREATE TABLE IF NOT EXISTS `perfilobjeto` (
  `id` int(11) NOT NULL,
  `idPerfil` int(11) DEFAULT NULL,
  `idObjeto` int(11) DEFAULT NULL,
  `puedeGuardar` tinyint(4) DEFAULT NULL,
  `puedeModificar` tinyint(4) DEFAULT NULL,
  `puedeEliminar` tinyint(4) DEFAULT NULL,
  `puedeListar` tinyint(4) DEFAULT NULL,
  `puedeVerReporte` tinyint(4) DEFAULT NULL,
  `puedeImprimir` tinyint(4) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfilobjeto`
--

INSERT INTO `perfilobjeto` (`id`, `idPerfil`, `idObjeto`, `puedeGuardar`, `puedeModificar`, `puedeEliminar`, `puedeListar`, `puedeVerReporte`, `puedeImprimir`, `deleted_at`) VALUES
(28, 1, 2, 1, 1, 1, 1, 1, 1, NULL),
(29, 1, 1, 1, 1, 1, 1, 1, 1, NULL),
(30, 1, 3, 1, 1, 1, 1, 1, 1, NULL),
(31, 1, 4, 1, 1, 1, 1, 1, 1, NULL),
(32, 1, 7, 1, 1, 1, 1, 1, 1, NULL),
(33, 1, 8, 1, 1, 1, 1, 1, 1, NULL),
(35, 1, 10, 1, 1, 1, 1, 1, NULL, NULL),
(36, 1, 11, 1, 1, 1, 1, 1, 1, NULL),
(37, 1, 13, 1, 1, 1, 1, 1, 1, NULL),
(38, 1, 21, 1, 1, 1, 1, 1, 1, NULL),
(39, 1, 23, 1, 1, 1, 1, 1, 1, NULL),
(40, 1, 16, 1, 1, 1, 1, 1, 1, NULL),
(41, 1, 14, 1, 1, 1, 1, 1, 1, NULL),
(42, 1, 15, 1, 1, 1, 1, 1, 1, NULL),
(43, 1, 19, 1, 1, 1, 1, 1, 1, NULL),
(44, 1, 18, 1, 1, 1, 1, 1, 1, NULL),
(45, 1, 20, 1, 1, 1, 1, 1, 1, NULL),
(46, 1, 17, 1, 1, 1, 1, 1, 1, NULL),
(47, 1, 22, 1, 1, 1, 1, 1, 1, NULL),
(48, 1, 6, 1, 1, 1, 1, 1, 1, NULL),
(49, 7, 1, 1, 1, 1, 1, 1, 1, NULL),
(50, 7, 4, 1, 1, 1, 1, 1, 1, NULL),
(51, 7, 6, 1, 1, 1, 1, 1, 1, NULL),
(52, 7, 7, 1, 1, 1, 1, 1, 1, NULL),
(53, 7, 13, 1, 1, 1, 1, 1, 1, NULL),
(54, 7, 14, 1, 1, 1, 1, 1, 1, NULL),
(55, 7, 20, 1, 1, 1, 1, 1, 1, NULL),
(56, 7, 23, 1, 1, 1, 1, 1, 1, NULL),
(57, 7, 24, 1, 1, 1, 1, 1, 1, NULL),
(58, 7, 22, 1, 1, 1, 1, 1, 1, NULL),
(59, 7, 19, 1, 1, 1, 1, 1, 1, NULL),
(60, 7, 18, 1, 1, 1, 1, 1, 1, NULL),
(61, 7, 8, 1, 1, 1, 1, 1, 1, NULL),
(62, 1, 12, 1, 1, 1, 1, 1, 1, NULL),
(63, 7, 10, 1, 1, 1, 1, 1, 1, NULL),
(64, 7, 17, 1, 1, 1, 1, 1, 1, NULL),
(65, 7, 15, 1, 1, 1, 1, 1, 1, NULL),
(66, 7, 12, 1, 1, 1, 1, 1, 1, NULL),
(67, 8, 20, 1, 1, 1, 1, 1, 1, NULL),
(68, 8, 21, 1, 1, 1, 1, 1, 1, NULL),
(69, 11, 21, 1, 1, 1, 1, 1, 1, NULL),
(70, 7, 21, 1, 1, NULL, 1, 1, 1, NULL),
(71, 11, 20, 1, 1, 1, 1, 1, 1, NULL),
(72, 9, 20, 1, 1, 1, 1, 1, 1, NULL),
(73, 10, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 12, 8, 1, 1, 1, 1, 1, 1, NULL),
(75, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 12, 20, 1, 1, 1, 1, 1, 1, NULL),
(77, 12, 23, 1, 1, 1, NULL, NULL, NULL, NULL),
(78, 12, 22, 1, 1, 1, 1, NULL, NULL, NULL),
(79, 1, 24, 1, 1, 1, NULL, NULL, NULL, NULL),
(80, 9, 21, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plandepago`
--

CREATE TABLE IF NOT EXISTS `plandepago` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nroCuotas` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `montoTotal` decimal(10,2) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `cuotaInicialUsd` decimal(12,2) DEFAULT NULL,
  `cuotaInicialBs` decimal(12,2) DEFAULT NULL,
  `montoTotalBs` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plandepago`
--

INSERT INTO `plandepago` (`id`, `fecha`, `nroCuotas`, `estado`, `deleted_at`, `montoTotal`, `idVenta`, `cuotaInicialUsd`, `cuotaInicialBs`, `montoTotalBs`) VALUES
(2, '2018-03-02 22:07:42', 60, 'd', NULL, '638.00', 14, '14.00', '97.44', '4440.48'),
(6, '2018-03-02 22:15:52', 60, 'd', NULL, '4500.00', 18, '450.00', '3132.00', '31320.00'),
(7, '2018-03-07 02:38:08', 60, 'd', NULL, '139.00', 20, '14.00', '97.44', '967.44'),
(8, '2018-03-11 18:52:33', 60, 'd', NULL, '4176.00', 21, '418.00', '2909.28', '29064.96'),
(9, '2018-03-12 00:23:14', 30, 'd', NULL, '4500.00', 26, '450.00', '3132.00', '31320.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planpago`
--

CREATE TABLE IF NOT EXISTS `planpago` (
  `id` int(11) NOT NULL,
  `fechaPago` date DEFAULT NULL,
  `cuota` decimal(9,2) DEFAULT NULL,
  `mora` int(11) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porcentajedevolucionreserva`
--

CREATE TABLE IF NOT EXISTS `porcentajedevolucionreserva` (
  `id` int(11) NOT NULL,
  `porcentaje` decimal(10,1) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idProyecto` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `porcentajedevolucionreserva`
--

INSERT INTO `porcentajedevolucionreserva` (`id`, `porcentaje`, `fecha`, `idProyecto`, `deleted_at`) VALUES
(6, '80.0', '2017-06-29 23:41:56', 1, '2017-08-01'),
(7, '80.0', '2017-07-01 11:33:19', 3, '2017-08-01'),
(8, '50.0', '2017-08-01 21:34:39', 1, NULL),
(9, '50.0', '2017-08-01 21:35:12', 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preciocategoria`
--

CREATE TABLE IF NOT EXISTS `preciocategoria` (
  `id` int(11) NOT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preciocategoria`
--

INSERT INTO `preciocategoria` (`id`, `idCategoria`, `precio`, `fecha`, `deleted_at`) VALUES
(34, 14, '12.50', '2017-06-29 23:54:13', NULL),
(35, 13, '11.60', '2017-06-29 23:54:24', NULL),
(36, 15, '12.50', '2017-07-01 11:30:39', NULL),
(37, 16, '11.60', '2017-07-01 11:30:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prereserva`
--

CREATE TABLE IF NOT EXISTS `prereserva` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpleado` int(11) DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prereserva`
--

INSERT INTO `prereserva` (`id`, `fecha`, `idEmpleado`, `idCliente`, `deleted_at`) VALUES
(4, '2017-07-03 22:24:45', 41, 4, NULL),
(10, '2017-07-05 18:54:53', 40, 8, NULL),
(11, '2017-07-07 14:31:15', 49, 9, NULL),
(12, '2017-07-14 13:03:18', 49, 10, NULL),
(13, '2017-07-18 01:15:38', 35, 11, NULL),
(14, '2017-07-25 01:34:21', 49, 10, NULL),
(15, '2017-07-26 02:15:49', 49, 10, NULL),
(16, '2017-07-28 16:44:58', 49, 10, NULL),
(17, '2017-07-31 12:16:44', 49, 12, NULL),
(18, '2018-02-27 20:30:18', 4, 13, NULL),
(19, '2018-03-01 20:50:19', 4, 13, NULL),
(20, '2018-03-02 20:40:42', 4, 13, NULL),
(21, '2018-03-11 20:12:26', 4, 10, NULL),
(22, '2018-03-11 20:15:45', 67, 11, NULL),
(23, '2018-03-11 20:32:16', 4, 13, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `ubicacion` varchar(30) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `nombre`, `ubicacion`, `deleted_at`) VALUES
(1, 'La Barranca', 'Puerto Suarez', NULL),
(3, 'Virgen de Guadalupe', 'Puerto Suarez', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciatrabajocliente`
--

CREATE TABLE IF NOT EXISTS `referenciatrabajocliente` (
  `idCliente` int(11) NOT NULL,
  `nombreEmpresa` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `contacto` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referenciatrabajoempleado`
--

CREATE TABLE IF NOT EXISTS `referenciatrabajoempleado` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(255) DEFAULT NULL,
  `direccion_domicilio` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `direccion_empresa` varchar(255) DEFAULT NULL,
  `relacion` varchar(100) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reprogramacion`
--

CREATE TABLE IF NOT EXISTS `reprogramacion` (
  `id` int(11) NOT NULL,
  `idVentaActual` int(11) DEFAULT NULL,
  `idVentaNueva` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE IF NOT EXISTS `reserva` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpleado` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `montoTotal` decimal(10,2) DEFAULT NULL,
  `estado` char(4) NOT NULL,
  `deleted_at` date DEFAULT NULL,
  `montoTotalBs` decimal(12,2) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `formaPago` varchar(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id`, `fecha`, `idEmpleado`, `idCliente`, `montoTotal`, `estado`, `deleted_at`, `montoTotalBs`, `moneda`, `formaPago`) VALUES
(6, '2018-02-28 01:25:16', 4, 13, '57.47', '', NULL, '400.00', 'BOLIVIANO', NULL),
(7, '2018-03-01 20:50:54', 4, 13, '50.00', '', NULL, '348.00', 'BOLIVIANO', NULL),
(8, '2018-03-02 21:23:30', 4, 13, '50.00', '', NULL, '348.00', 'BOLIVIANO', NULL),
(9, '2018-03-11 20:12:48', 4, 10, '50.00', '', NULL, '348.00', 'BOLIVIANO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesionventa`
--

CREATE TABLE IF NOT EXISTS `sesionventa` (
  `id` int(11) NOT NULL,
  `idVentaActual` int(11) DEFAULT NULL,
  `idVentaNueva` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocambio`
--

CREATE TABLE IF NOT EXISTS `tipocambio` (
  `id` int(11) NOT NULL,
  `monedaVenta` decimal(5,2) DEFAULT NULL,
  `monedaCompra` decimal(5,2) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipocambio`
--

INSERT INTO `tipocambio` (`id`, `monedaVenta`, `monedaCompra`, `fecha`, `deleted_at`) VALUES
(1, '6.96', '6.87', '2017-06-12 23:54:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccionpago`
--

CREATE TABLE IF NOT EXISTS `transaccionpago` (
  `id` int(11) NOT NULL,
  `idPago` int(11) DEFAULT NULL,
  `idBanco` int(11) DEFAULT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `nroDocumento` int(11) DEFAULT NULL,
  `monto` decimal(9,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` char(4) NOT NULL DEFAULT 'i',
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccionreserva`
--

CREATE TABLE IF NOT EXISTS `transaccionreserva` (
  `id` int(11) NOT NULL,
  `idDetalleReserva` int(11) DEFAULT NULL,
  `idBanco` int(11) NOT NULL,
  `idCuenta` int(11) NOT NULL,
  `nroDocumento` int(11) NOT NULL,
  `monto` decimal(9,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` char(4) NOT NULL DEFAULT 'i',
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccionreserva`
--

INSERT INTO `transaccionreserva` (`id`, `idDetalleReserva`, `idBanco`, `idCuenta`, `nroDocumento`, `monto`, `fecha`, `tipo`, `deleted_at`) VALUES
(1, 7, 3, 5, 423456456, '50.00', '2018-03-01', 'i', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccionventa`
--

CREATE TABLE IF NOT EXISTS `transaccionventa` (
  `id` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `nroDocumento` int(11) NOT NULL,
  `tipo` char(4) NOT NULL DEFAULT 'i',
  `monto` decimal(9,2) NOT NULL,
  `montoBs` decimal(12,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccionventa`
--

INSERT INTO `transaccionventa` (`id`, `idVenta`, `idBanco`, `idCuenta`, `nroDocumento`, `tipo`, `monto`, `montoBs`, `fecha`, `deleted_at`) VALUES
(1, 12, 3, 5, 1253641231, 'i', '3549.60', NULL, '2018-03-01', NULL),
(2, 21, 3, 5, 1256456, 'i', '500.00', '3480.00', '2018-03-11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE IF NOT EXISTS `turno` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `minutosTolerancia` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`id`, `nombre`, `minutosTolerancia`, `deleted_at`) VALUES
(1, 'Cajero', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ufv`
--

CREATE TABLE IF NOT EXISTS `ufv` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `valor` decimal(8,4) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idEmpleado` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `remember_token` varchar(250) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idEmpleado`, `email`, `password`, `remember_token`, `idPerfil`, `deleted_at`) VALUES
(4, 'admin', '$2y$10$QOAMoWfxTd2JFVdPdcpyAe9IycNVViTFuVoQqWa9KvGVHum7mbxuG', '', 1, NULL),
(18, 'admin2', '$2y$10$tiTpLjIDcUxZNE1FxxZouuuwu3LRlAoba5kItCiJVtPQ4YO0EElse', '', 1, NULL),
(19, 'yacqueline', '$2y$10$/BtdPH04FgFivJpqEAiikehsiVHaAwWARJmjgdQXK1rsjyS3bTZ3C', '', 7, NULL),
(20, 'stephanie', '$2y$10$NMTA64GdRFFETm..J2Qdfu66n8A2LUrmEL1jQBE52x8VlO4DBrnVK', '', 7, NULL),
(21, 'ruddy', '$2y$10$QQ1UcPTY9vIz.kBkhrTPs.U.Pj38QXLw4IBqJFf/N6csGAL9XU2r6', '', 7, NULL),
(22, 'goprobit@gmail.com', '$2y$10$zzVqJrBSY5AvUlqC4nUDf.BCwWueDevrCxDx1daBlsxb5ZN9K5Eqq', '', 8, NULL),
(23, 'atlanboli@hotmail.com', '$2y$10$XAw/m2dEMMR6rl5WIpGVAuJoPKWuL4TAz0w.VGZdL3BGLIC6tcL.y', '', 8, NULL),
(24, '1109611', '$2y$10$1G1Qys8iEog2m.zUODyn1eVADmmuBpjIYGn7FmLoczX7b06AWr6cu', '', 9, NULL),
(25, '4713528', '$2y$10$UMhMFdGXGWvxe7rq4AxAVulIWUhJ8EQVaJilq0jGUYZ.zAgc8K8Me', '', 10, NULL),
(26, '3451951', '$2y$10$r5y8.k7ppmDP4N5TbOQKUe.OOs3L43sFlIXbSNoerb1CiYJkEKn4S', '', 9, NULL),
(27, '3872282', '$2y$10$NhGJSSmq4L4tZzQ/SlJAnu9SS6Ou82u1tTtx0ftqu7CbeqTLh1Oq2', '', 9, NULL),
(28, '3822769', '$2y$10$Qr8/2eIt1HUozFgZL/wbSOztZE75bDW/hlsHl4/myKz9ACxxGTeYe', '', 9, NULL),
(29, 'franz', '$2y$10$HPos4PkC8TroXRkO/O1PS.NU6Afd2tBJ/x.SK.9pnDgafJLhRaNsm', '', 12, NULL),
(30, '13218221', '$2y$10$5VXq4wbAlvJLgQgA95B56ewCHD3qW6LgIZzjlgZXi6PG9wtwvyU5K', '', 10, NULL),
(31, '3024844', '$2y$10$PILYrxsdjWy6EAhmrCoWvOd5kj2HbDd8UPfnUWbXooOu/uSuuRiPK', '', 10, NULL),
(32, '1106757', '$2y$10$y.RsNPND3uYe1G.fn66ODeEwpbE.ATfsypOqEJu7gL5ltS/zMedhG', '', 10, NULL),
(33, '7679806', '$2y$10$A5Tvm.XEzAKeCE3nSYfibeR1yVMwsQko2friTmqIdjeUjxrd8jBvC', '', 10, NULL),
(34, '4631769', '$2y$10$VkLYszoFzRVqWoRt2etFm.sQ.weYcc/f3jEGN6TkPrcr6CETYiDW6', '', 10, NULL),
(35, '4713527', '$2y$10$2XImduS8.Ygrb6oEe9EzLu/lUEEo0peMl6wiO4L0P/N011d3fMYZe', '', 10, NULL),
(36, '2475674', '$2y$10$SOiWXARfQZmT.qynnnAy0esyppHBZSLyCkgyQ6Df57/3FYYrMqeqq', '', 10, NULL),
(37, '10017152', '$2y$10$kFFQ4UEAk/P84dgJAW5Wi.rW0K.mXei39vcOqiXl0cdQYo/lhARcy', '', 10, NULL),
(38, '2312827', '$2y$10$tH2VE5X3dy3H9t.LU3XQxu186KNp5vXnW5EWQfUyH.EDxX1kIx4ki', '', 10, NULL),
(39, '4825379', '$2y$10$LKIDLvsmTa2qD.bOCehL5ejV6.oaRp.N0MUAe2cUAAtKp2.aOswc.', '', 10, NULL),
(40, '6291093', '$2y$10$oGB3pobRDbdNMlRn75GOfOcSAbfbCYLSDBcRpAXw7vSuOu4t.Tw/.', '', 10, NULL),
(41, '5389321', '$2y$10$umyFsLZP0iL.dawV5SnuJeTCYDCPa7gAIjL3fPq0V9G4bV59p7uu6', '', 10, NULL),
(42, '3472857', '$2y$10$IIJbfaNWdBRKjQgbk3q3z.pjdFlrx2nmzNJC3NWjVmVzQR6XKGKw6', '', 10, NULL),
(43, '3923951', '$2y$10$khXk1ALs7c/tXQPoMmaXROxCxBQmRNeLIacVMgOe7WVxNL5TCAGmW', '', 10, NULL),
(44, '2521935', '$2y$10$oESSd1TujpTiSVTxekNJN.KFfypV98WZsml8DvW/E8juH9nAdzpdK', '', 10, NULL),
(45, '5320858', '$2y$10$1xHKkbqWXHjq6POtDNVlIOPiLpHG.VFBWa9RY4snHVBKhQQunZ5da', '', 10, NULL),
(46, '3286611', '$2y$10$4aRDneN5jTIU7TcW1l2cb.0fR27CZdHuZieGcl5xiPjyA2WnZTPwW', '', 10, NULL),
(47, '3852486', '$2y$10$eBGC4fiIy4JPexqhP13fCe0ue6GGYjw63p9bBxAW1GxtoPp5h90VO', '', 10, NULL),
(48, '4512479', '$2y$10$ewLmVoyHfuFFvDC2FWgRhuSNKU6R2IO7xq.qQ6vuYPbvKJSKqTZjS', '', 10, NULL),
(49, '7721568', '$2y$10$G.pxdJQ.HFovup4a6uz1TeP4niIyQUKh4tXCtGAdZEgoxSqpt/zKu', '', 10, NULL),
(50, '6221954', '$2y$10$5tiBEpX80FKwf1o4rXbvnOpcFCbt5TB6qpi.jTducIPjfSdFnfkuG', '', 10, NULL),
(51, '3218292', '$2y$10$HRrNgZvQpK1vJ4D3PJBVmO0Ku75CzDYqyNxXIl..tWsVQj3EmUlZO', '', 10, NULL),
(52, '4687951', '$2y$10$I9Z28KyzGSm8/Zc9jj3ste9ldX78qbNUkxxLqZSqfTqjM.r3zKFGu', '', 10, NULL),
(53, '3216572', '$2y$10$B68hauKcvJZm3FhxmDtULuWVDUF.Rl5A8oUnCUTblH8NHkTllnWZK', '', 10, NULL),
(54, '7676697', '$2y$10$.xTsJgBemxNcK4Jpn0dMF.s0MLYCcBZOnea8itn7o7Ky8xsf4TbVO', '', 10, NULL),
(55, '4629782', '$2y$10$78qREaMb9Gb//lwtl8EfAOxZMECBfUmnXA5U9WWro5mcPSqG8CAkS', '', 9, NULL),
(56, '6850481', '$2y$10$qg/Dc3h0pM7D8aqxxzrv9..3lEYqX46d5bvFox1hkuFz3OhtdQrx6', '', 10, NULL),
(57, '4566146', '$2y$10$.l8oj8DuG8iR5h/GrJCeiOSoKK3vxm2JRFgaO6ZKXs4f6HP8IYm3y', '', 10, NULL),
(58, '2473651', '$2y$10$M9WYB7iU74DxdjNUgTewVOnh/8frEM8JWKfuUU4H4EUpabF29r1zG', '', 10, NULL),
(59, '3271572', '$2y$10$GgJjmoc3LF7EnHGC.CBiSeYu53ha8oyZ27TWJriZ8/5ViQhorm3oK', '', 10, NULL),
(60, '666', '$2y$10$CKVa4mLovwlMdbyrsRUk.OIhKtl6T6UV6LDIcO4OzEMnQRPug0m96', '', 10, NULL),
(61, '4735646', '$2y$10$jwdAZGcXG/BsGXZLV6QXE.f562l.ceyY53.qxa0JhvFMDj0.QETb6', '', 10, NULL),
(62, '5841985', '$2y$10$mWKqtSWyi8Ni7Z.OS/MnFezPbzB68NKVolzth4uxHQhbRk6T49pMW', '', 10, NULL),
(63, '9741981', '$2y$10$2Vttley23scvH0uLTnx8fOzdgwBOov0pOG/gSf4bGh88p7CSfLHSa', '', 10, NULL),
(64, '2992489', '$2y$10$LMvVpYH5vNWnMjIDlNVinu7mwNmgrxoBPv549p5JNP9tOCEJW5Rly', '', 10, NULL),
(65, '4640902', '$2y$10$t7KVAjMe1ata86gqrmDxke04/Z/aClAP6yCXG55.8eDuFO5dAhH5y', '', 10, NULL),
(66, '4575941', '$2y$10$MHJJ35nIBLLSmWTJIWrSvOAvksWV0wPPM8edwi1O/3O3qwWH4A3wC', '', 10, NULL),
(67, '5138116', '$2y$10$YMAQOH8T818SUh1sENnVRO9o6srAf7di7sqaeixtp5LIYmQFDbKv6', '', 10, NULL),
(68, '5005380', '$2y$10$r7VdKSMSXrQYrXXrLZrIpuW6bzLU72z4wiLHcqVLMY7kQ.ZVKK0Yq', '', 10, NULL),
(69, 'liliana', '$2y$10$MajQjAS4ePB0zqCHzrcc2eZgeAlTMT2w.Kxh9mdaE41HIGY.hU4QO', '', 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE IF NOT EXISTS `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `idEmpleadoPadre` int(11) DEFAULT NULL,
  `idEmpleadoHijo` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `idEmpleadoPadre`, `idEmpleadoHijo`, `deleted_at`) VALUES
(5, 22, 23, NULL),
(6, 23, 25, NULL),
(7, 23, 28, NULL),
(8, 23, 24, NULL),
(9, 23, 26, NULL),
(10, 23, 27, NULL),
(11, 24, 30, NULL),
(12, 24, 31, NULL),
(13, 24, 32, NULL),
(14, 24, 34, NULL),
(15, 24, 33, NULL),
(16, 25, 35, NULL),
(17, 25, 36, NULL),
(18, 25, 37, NULL),
(19, 25, 38, NULL),
(20, 25, 39, NULL),
(21, 25, 40, NULL),
(22, 25, 41, NULL),
(23, 27, 42, NULL),
(24, 27, 43, NULL),
(25, 27, 44, NULL),
(26, 27, 45, NULL),
(27, 55, 46, NULL),
(28, 55, 47, NULL),
(29, 55, 48, NULL),
(30, 55, 49, NULL),
(31, 55, 50, NULL),
(32, 55, 51, NULL),
(33, 55, 52, NULL),
(34, 55, 53, NULL),
(35, 55, 54, NULL),
(36, 28, 57, NULL),
(37, 28, 56, NULL),
(38, 23, 55, NULL),
(41, 25, 64, NULL),
(42, 25, 65, NULL),
(43, 55, 66, NULL),
(44, 25, 67, NULL),
(45, 25, 68, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `precio` decimal(9,2) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  `tipoPago` char(4) DEFAULT NULL,
  `descuento` decimal(8,0) DEFAULT NULL,
  `reserva` decimal(9,2) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idTipoCambio` int(11) DEFAULT NULL,
  `idLote` int(11) DEFAULT NULL,
  `IdAsiento` int(11) DEFAULT NULL,
  `pagoBs` decimal(12,2) DEFAULT NULL,
  `pagoUsd` decimal(12,2) DEFAULT NULL,
  `totalapagar` decimal(12,2) NOT NULL,
  `totalapagarBs` decimal(12,2) NOT NULL,
  `cambioBs` decimal(12,2) DEFAULT NULL,
  `cambioUsd` decimal(12,2) DEFAULT NULL,
  `precioBs` decimal(12,2) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `reservaBs` decimal(12,2) DEFAULT NULL,
  `tipoVenta` varchar(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `precio`, `estado`, `tipoPago`, `descuento`, `reserva`, `idEmpleado`, `idCliente`, `idTipoCambio`, `idLote`, `IdAsiento`, `pagoBs`, `pagoUsd`, `totalapagar`, `totalapagarBs`, `cambioBs`, `cambioUsd`, `precioBs`, `moneda`, `reservaBs`, `tipoVenta`) VALUES
(3, '2018-03-01 00:20:34', '4129.60', 'p', 'e', '15', '0.00', 4, 13, 1, 2121, 4, '24499.20', '3520.00', '0.00', '0.00', '68.49', '9.84', '28742.02', 'DOLAR', '0.00', NULL),
(4, '2018-03-01 00:23:15', '11.60', 'p', 'e', '15', '0.00', 4, 13, 1, 2120, 5, '556.80', '80.00', '0.00', '0.00', '488.17', '70.14', '80.74', 'DOLAR', '0.00', NULL),
(5, '2018-03-01 00:27:15', '638.00', 'p', 'e', '15', '0.00', 4, 13, 1, 2119, 6, '5568.00', '800.00', '0.00', '0.00', '1793.59', '257.70', '4440.48', 'DOLAR', '0.00', NULL),
(6, '2018-03-01 00:30:45', '150.00', 'p', 'e', NULL, '0.00', 4, 13, 1, 2123, 7, '900.00', '129.31', '0.00', '0.00', '12.60', '1.81', '1044.00', 'BOLIVIANO', '0.00', NULL),
(7, '2018-03-01 00:31:45', '139.20', 'p', 'e', NULL, '0.00', 4, 13, 1, 2122, 8, '900.00', '129.31', '0.00', '0.00', '76.49', '10.99', '968.83', 'BOLIVIANO', '0.00', NULL),
(8, '2018-03-01 00:34:09', '4129.60', 'p', 'e', NULL, '0.00', 4, 13, 1, 2121, 9, '34800.00', '5000.00', '0.00', '0.00', '10369.29', '1489.84', '28742.02', 'DOLAR', '0.00', NULL),
(9, '2018-03-01 00:34:58', '11.60', 'p', 'e', '15', '0.00', 4, 13, 1, 2120, 10, '69.60', '10.00', '0.00', '0.00', '0.97', '0.14', '80.74', 'DOLAR', '0.00', NULL),
(10, '2018-03-01 00:35:37', '638.00', 'p', 'e', '15', '0.00', 4, 13, 1, 2119, 11, '4176.00', '600.00', '0.00', '0.00', '401.59', '57.70', '4440.48', 'DOLAR', '0.00', NULL),
(11, '2018-03-01 00:37:24', '139.20', 'p', 'e', '15', '0.00', 4, 13, 1, 2118, 12, '1392.00', '200.00', '118.32', '823.51', '568.49', '81.68', '968.83', 'DOLAR', '0.00', NULL),
(12, '2018-03-01 20:46:47', '4176.00', 'p', 'b', '15', '0.00', 4, 13, 1, 2125, 13, '24708.00', '3550.00', '3549.60', '24705.22', '2.78', '0.40', '29064.96', 'DOLAR', '0.00', NULL),
(14, '2018-03-02 22:07:42', '638.00', 'c', 'e', '0', '50.00', 4, 13, 1, 2119, 17, '104.40', '15.00', '14.00', '97.44', '6.96', '1.00', '4440.48', 'DOLAR', '348.00', NULL),
(18, '2018-03-02 22:15:52', '4500.00', 'c', 'e', '0', '0.00', 4, 13, 1, 2124, 21, '3132.00', '450.00', '450.00', '3132.00', '0.00', '0.00', '31320.00', 'DOLAR', '0.00', NULL),
(19, '2018-03-03 23:18:15', '150.00', 'p', 'e', '15', '0.00', 4, 13, 1, 2123, 22, '0.00', '0.00', '127.50', '887.40', '0.00', '0.00', '1044.00', 'DOLAR', '0.00', NULL),
(20, '2018-03-07 02:38:08', '139.20', 'c', 'e', '0', '0.00', 4, 13, 1, 2122, 24, '104.40', '15.00', '14.00', '97.44', '6.96', '1.00', '968.83', 'DOLAR', '0.00', NULL),
(21, '2018-03-11 18:52:33', '4176.00', 'c', 'b', '0', '0.00', 4, 13, 1, 2126, 25, '3480.00', '500.00', '418.00', '2909.28', '570.72', '82.00', '29064.96', 'DOLAR', '0.00', NULL),
(22, '2018-03-11 20:13:49', '4176.00', 'p', 'e', '15', '50.00', 4, 10, 1, 2127, 27, '24360.00', '3500.00', '3499.60', '24357.22', '2.78', '0.40', '29064.96', 'DOLAR', '348.00', NULL),
(23, '2018-03-11 20:23:48', '4176.00', 'p', 'e', '15', '0.00', 4, 11, 1, 2129, 28, '24708.00', '3550.00', '3549.60', '24705.22', '2.78', '0.40', '29064.96', 'DOLAR', '0.00', NULL),
(24, '2018-03-11 20:32:31', '5220.00', 'p', 'e', '15', '0.00', 4, 13, 1, 2130, 29, '30902.40', '4440.00', '4437.00', '30881.52', '20.88', '3.00', '36331.20', 'DOLAR', '0.00', 'CONTADO'),
(25, '2018-03-11 23:24:40', '4176.00', 'p', 'e', '15', '0.00', 4, 4, 1, 2128, 30, '24708.00', '3550.00', '3549.60', '24705.22', '2.78', '0.40', '29064.96', 'DOLAR', '0.00', 'CONTADO'),
(26, '2018-03-12 00:23:14', '4500.00', 'c', 'e', '0', '0.00', 4, 10, 1, 2136, 31, '3132.00', '450.00', '450.00', '3132.00', '0.00', '0.00', '31320.00', 'DOLAR', '0.00', 'PLAZO');

--
-- Disparadores `venta`
--
DELIMITER $$
CREATE TRIGGER `Actualizar_Lote_Venta` AFTER INSERT ON `venta`
 FOR EACH ROW UPDATE lote 

SET lote.estado=3

WHERE lote.id=new.idLote
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_gestion` (`id_gestion`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tipo_cambio` (`id_tipo_cambio`),
  ADD KEY `id_moneda` (`id_moneda`);

--
-- Indices de la tabla `autorizacionpago`
--
ALTER TABLE `autorizacionpago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoriacuenta`
--
ALTER TABLE `categoriacuenta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorialote`
--
ALTER TABLE `categorialote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `centrocosto`
--
ALTER TABLE `centrocosto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `codigovendedor`
--
ALTER TABLE `codigovendedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentaautomatica`
--
ALTER TABLE `cuentaautomatica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuenta` (`id_cuenta`);

--
-- Indices de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBanco` (`idBanco`);

--
-- Indices de la tabla `cuentagrupo`
--
ALTER TABLE `cuentagrupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuenta` (`id_cuenta`);

--
-- Indices de la tabla `cuentaimpuesto`
--
ALTER TABLE `cuentaimpuesto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuenta` (`id_cuenta`);

--
-- Indices de la tabla `cuotaminima`
--
ALTER TABLE `cuotaminima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPlandePago` (`idPlandePago`);

--
-- Indices de la tabla `depreciacion`
--
ALTER TABLE `depreciacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuenta` (`id_cuenta`);

--
-- Indices de la tabla `descuentoventa`
--
ALTER TABLE `descuentoventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuenta` (`id_cuenta`),
  ADD KEY `id_asiento` (`id_asiento`),
  ADD KEY `id_centro_costo` (`id_centro_costo`);

--
-- Indices de la tabla `detallecuota`
--
ALTER TABLE `detallecuota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCuota` (`idCuota`);

--
-- Indices de la tabla `detalleprereserva`
--
ALTER TABLE `detalleprereserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLote` (`idLote`),
  ADD KEY `idPreReserva` (`idPreReserva`);

--
-- Indices de la tabla `detallereserva`
--
ALTER TABLE `detallereserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLote` (`idLote`),
  ADD KEY `idReserva` (`idReserva`);

--
-- Indices de la tabla `devolucionreserva`
--
ALTER TABLE `devolucionreserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idDetalleReserva` (`idDetalleReserva`),
  ADD KEY `idPorcentajeDevolucionReserva` (`idPorcentajeDevolucionReserva`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadopais`
--
ALTER TABLE `estadopais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `gestion`
--
ALTER TABLE `gestion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoriaLote` (`idCategoriaLote`),
  ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `meses`
--
ALTER TABLE `meses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idModulo` (`idModulo`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `pagocuota`
--
ALTER TABLE `pagocuota`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfilobjeto`
--
ALTER TABLE `perfilobjeto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idObjeto` (`idObjeto`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `plandepago`
--
ALTER TABLE `plandepago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `planpago`
--
ALTER TABLE `planpago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `porcentajedevolucionreserva`
--
ALTER TABLE `porcentajedevolucionreserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `preciocategoria`
--
ALTER TABLE `preciocategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `prereserva`
--
ALTER TABLE `prereserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `referenciatrabajocliente`
--
ALTER TABLE `referenciatrabajocliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `referenciatrabajoempleado`
--
ALTER TABLE `referenciatrabajoempleado`
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `reprogramacion`
--
ALTER TABLE `reprogramacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idVentaNueva` (`idVentaNueva`),
  ADD KEY `idVentaActual` (`idVentaActual`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `sesionventa`
--
ALTER TABLE `sesionventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idVentaNueva` (`idVentaNueva`),
  ADD KEY `idVentaActual` (`idVentaActual`);

--
-- Indices de la tabla `tipocambio`
--
ALTER TABLE `tipocambio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transaccionpago`
--
ALTER TABLE `transaccionpago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPago` (`idPago`),
  ADD KEY `idBanco` (`idBanco`),
  ADD KEY `idCuenta` (`idCuenta`);

--
-- Indices de la tabla `transaccionreserva`
--
ALTER TABLE `transaccionreserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idDetalleReserva` (`idDetalleReserva`),
  ADD KEY `idBanco` (`idBanco`),
  ADD KEY `idCuenta` (`idCuenta`);

--
-- Indices de la tabla `transaccionventa`
--
ALTER TABLE `transaccionventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVenta` (`idVenta`),
  ADD KEY `idBanco` (`idBanco`),
  ADD KEY `idCuenta` (`idCuenta`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ufv`
--
ALTER TABLE `ufv`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`),
  ADD KEY `idEmpleadoPadre` (`idEmpleadoPadre`),
  ADD KEY `idEmpleadoHijo` (`idEmpleadoHijo`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idLote` (`idLote`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asiento`
--
ALTER TABLE `asiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `autorizacionpago`
--
ALTER TABLE `autorizacionpago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `categoriacuenta`
--
ALTER TABLE `categoriacuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `categorialote`
--
ALTER TABLE `categorialote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `centrocosto`
--
ALTER TABLE `centrocosto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `codigovendedor`
--
ALTER TABLE `codigovendedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `cuentaautomatica`
--
ALTER TABLE `cuentaautomatica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `cuentagrupo`
--
ALTER TABLE `cuentagrupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentaimpuesto`
--
ALTER TABLE `cuentaimpuesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuotaminima`
--
ALTER TABLE `cuotaminima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=511;
--
-- AUTO_INCREMENT de la tabla `depreciacion`
--
ALTER TABLE `depreciacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `descuentoventa`
--
ALTER TABLE `descuentoventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT de la tabla `detallecuota`
--
ALTER TABLE `detallecuota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT de la tabla `detalleprereserva`
--
ALTER TABLE `detalleprereserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `detallereserva`
--
ALTER TABLE `detallereserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `devolucionreserva`
--
ALTER TABLE `devolucionreserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estadopais`
--
ALTER TABLE `estadopais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2202;
--
-- AUTO_INCREMENT de la tabla `gestion`
--
ALTER TABLE `gestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2137;
--
-- AUTO_INCREMENT de la tabla `meses`
--
ALTER TABLE `meses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `objeto`
--
ALTER TABLE `objeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pagocuota`
--
ALTER TABLE `pagocuota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `perfilobjeto`
--
ALTER TABLE `perfilobjeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT de la tabla `plandepago`
--
ALTER TABLE `plandepago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `planpago`
--
ALTER TABLE `planpago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `porcentajedevolucionreserva`
--
ALTER TABLE `porcentajedevolucionreserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `preciocategoria`
--
ALTER TABLE `preciocategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `prereserva`
--
ALTER TABLE `prereserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `reprogramacion`
--
ALTER TABLE `reprogramacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `sesionventa`
--
ALTER TABLE `sesionventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipocambio`
--
ALTER TABLE `tipocambio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `transaccionpago`
--
ALTER TABLE `transaccionpago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `transaccionreserva`
--
ALTER TABLE `transaccionreserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `transaccionventa`
--
ALTER TABLE `transaccionventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ufv`
--
ALTER TABLE `ufv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD CONSTRAINT `asiento_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoriacuenta` (`id`),
  ADD CONSTRAINT `asiento_ibfk_2` FOREIGN KEY (`id_gestion`) REFERENCES `gestion` (`id`),
  ADD CONSTRAINT `asiento_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`idEmpleado`),
  ADD CONSTRAINT `asiento_ibfk_5` FOREIGN KEY (`id_tipo_cambio`) REFERENCES `tipocambio` (`id`),
  ADD CONSTRAINT `asiento_ibfk_6` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id`);

--
-- Filtros para la tabla `categorialote`
--
ALTER TABLE `categorialote`
  ADD CONSTRAINT `categorialote_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idPais`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `codigovendedor`
--
ALTER TABLE `codigovendedor`
  ADD CONSTRAINT `codigovendedor_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `cuentaautomatica`
--
ALTER TABLE `cuentaautomatica`
  ADD CONSTRAINT `cuentaautomatica_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`);

--
-- Filtros para la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  ADD CONSTRAINT `cuentabanco_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`);

--
-- Filtros para la tabla `cuentagrupo`
--
ALTER TABLE `cuentagrupo`
  ADD CONSTRAINT `cuentagrupo_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`);

--
-- Filtros para la tabla `cuentaimpuesto`
--
ALTER TABLE `cuentaimpuesto`
  ADD CONSTRAINT `cuentaimpuesto_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`);

--
-- Filtros para la tabla `cuotaminima`
--
ALTER TABLE `cuotaminima`
  ADD CONSTRAINT `cuotaminima_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `cuotas`
--
ALTER TABLE `cuotas`
  ADD CONSTRAINT `cuotas_ibfk_1` FOREIGN KEY (`idPlandePago`) REFERENCES `plandepago` (`id`);

--
-- Filtros para la tabla `depreciacion`
--
ALTER TABLE `depreciacion`
  ADD CONSTRAINT `depreciacion_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`);

--
-- Filtros para la tabla `descuentoventa`
--
ALTER TABLE `descuentoventa`
  ADD CONSTRAINT `descuentoventa_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id`),
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`id_asiento`) REFERENCES `asiento` (`id`),
  ADD CONSTRAINT `detalle_ibfk_3` FOREIGN KEY (`id_centro_costo`) REFERENCES `centrocosto` (`id`);

--
-- Filtros para la tabla `detallecuota`
--
ALTER TABLE `detallecuota`
  ADD CONSTRAINT `detallecuota_ibfk_1` FOREIGN KEY (`idCuota`) REFERENCES `cuotas` (`id`);

--
-- Filtros para la tabla `detalleprereserva`
--
ALTER TABLE `detalleprereserva`
  ADD CONSTRAINT `detalleprereserva_ibfk_1` FOREIGN KEY (`idLote`) REFERENCES `lote` (`id`),
  ADD CONSTRAINT `detalleprereserva_ibfk_2` FOREIGN KEY (`idPreReserva`) REFERENCES `prereserva` (`id`);

--
-- Filtros para la tabla `detallereserva`
--
ALTER TABLE `detallereserva`
  ADD CONSTRAINT `detallereserva_ibfk_1` FOREIGN KEY (`idLote`) REFERENCES `lote` (`id`),
  ADD CONSTRAINT `detallereserva_ibfk_2` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`id`);

--
-- Filtros para la tabla `devolucionreserva`
--
ALTER TABLE `devolucionreserva`
  ADD CONSTRAINT `devolucionreserva_ibfk_1` FOREIGN KEY (`idDetalleReserva`) REFERENCES `detallereserva` (`id`),
  ADD CONSTRAINT `devolucionreserva_ibfk_2` FOREIGN KEY (`idPorcentajeDevolucionReserva`) REFERENCES `porcentajedevolucionreserva` (`id`),
  ADD CONSTRAINT `devolucionreserva_ibfk_3` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `estadopais`
--
ALTER TABLE `estadopais`
  ADD CONSTRAINT `estadopais_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
  ADD CONSTRAINT `experiencia_laboral_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`idCategoriaLote`) REFERENCES `categorialote` (`id`),
  ADD CONSTRAINT `lote_ibfk_2` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `meses`
--
ALTER TABLE `meses`
  ADD CONSTRAINT `meses_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD CONSTRAINT `objeto_ibfk_1` FOREIGN KEY (`idModulo`) REFERENCES `modulo` (`id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `pais_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `perfilobjeto`
--
ALTER TABLE `perfilobjeto`
  ADD CONSTRAINT `perfilobjeto_ibfk_1` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`id`),
  ADD CONSTRAINT `perfilobjeto_ibfk_2` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`id`);

--
-- Filtros para la tabla `plandepago`
--
ALTER TABLE `plandepago`
  ADD CONSTRAINT `plandepago_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `planpago`
--
ALTER TABLE `planpago`
  ADD CONSTRAINT `planpago_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `porcentajedevolucionreserva`
--
ALTER TABLE `porcentajedevolucionreserva`
  ADD CONSTRAINT `porcentajedevolucionreserva_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `preciocategoria`
--
ALTER TABLE `preciocategoria`
  ADD CONSTRAINT `preciocategoria_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorialote` (`id`);

--
-- Filtros para la tabla `prereserva`
--
ALTER TABLE `prereserva`
  ADD CONSTRAINT `prereserva_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `referenciatrabajocliente`
--
ALTER TABLE `referenciatrabajocliente`
  ADD CONSTRAINT `referenciatrabajocliente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `referenciatrabajoempleado`
--
ALTER TABLE `referenciatrabajoempleado`
  ADD CONSTRAINT `referenciatrabajoempleado_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `reprogramacion`
--
ALTER TABLE `reprogramacion`
  ADD CONSTRAINT `reprogramacion_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `reprogramacion_ibfk_2` FOREIGN KEY (`idVentaNueva`) REFERENCES `venta` (`id`),
  ADD CONSTRAINT `reprogramacion_ibfk_3` FOREIGN KEY (`idVentaActual`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `sesionventa`
--
ALTER TABLE `sesionventa`
  ADD CONSTRAINT `sesionventa_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `sesionventa_ibfk_2` FOREIGN KEY (`idVentaNueva`) REFERENCES `venta` (`id`),
  ADD CONSTRAINT `sesionventa_ibfk_3` FOREIGN KEY (`idVentaActual`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `transaccionpago`
--
ALTER TABLE `transaccionpago`
  ADD CONSTRAINT `transaccionpago_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`id`),
  ADD CONSTRAINT `transaccionpago_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`),
  ADD CONSTRAINT `transaccionpago_ibfk_3` FOREIGN KEY (`idCuenta`) REFERENCES `cuentabanco` (`id`);

--
-- Filtros para la tabla `transaccionreserva`
--
ALTER TABLE `transaccionreserva`
  ADD CONSTRAINT `transaccionreserva_ibfk_1` FOREIGN KEY (`idDetalleReserva`) REFERENCES `detallereserva` (`id`),
  ADD CONSTRAINT `transaccionreserva_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`),
  ADD CONSTRAINT `transaccionreserva_ibfk_3` FOREIGN KEY (`idCuenta`) REFERENCES `cuentabanco` (`id`);

--
-- Filtros para la tabla `transaccionventa`
--
ALTER TABLE `transaccionventa`
  ADD CONSTRAINT `transaccionventa_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`id`),
  ADD CONSTRAINT `transaccionventa_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`),
  ADD CONSTRAINT `transaccionventa_ibfk_3` FOREIGN KEY (`idCuenta`) REFERENCES `cuentabanco` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`idEmpleadoPadre`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`idEmpleadoHijo`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`idLote`) REFERENCES `lote` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
