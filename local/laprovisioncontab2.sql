-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-04-2018 a las 12:15:27
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asiento`
--

INSERT INTO `asiento` (`id`, `nro_asiento`, `tipo`, `glosa`, `fecha_creacion`, `fecha_transaccion`, `cambio_tipo`, `estado`, `motivo_anulado`, `id_categoria`, `id_gestion`, `id_tipo_cambio`, `id_usuario`, `id_moneda`, `deleted_at`) VALUES
(1, 1, 3, 'ertuyety', '2018-04-03 01:15:12', '2018-04-02 21:15:12', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(2, 2, 3, 'asdfadf', '2018-04-03 03:18:11', '2018-04-02 23:18:11', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(3, 3, 3, 'dfgsfdg', '2018-04-03 03:20:41', '2018-04-02 23:20:41', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(4, 4, 3, 'sfgsfg', '2018-04-03 03:22:06', '2018-04-02 23:22:06', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(5, 5, 3, 'sfgsfgsdfg', '2018-04-03 14:29:44', '2018-04-03 10:29:44', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(6, 6, 3, 'sfdadfadf', '2018-04-03 22:39:51', '2018-04-03 18:39:51', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL),
(8, 7, 3, 'sfgsfgsfg', '2018-04-03 23:12:26', '2018-04-03 19:12:26', '6.96', 1, NULL, 1, 1, 1, 4, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id`, `nombre`, `deleted_at`) VALUES
(3, 'Banco Union', NULL),
(4, 'Banco mercantil', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
(12, 'NARDA', 'CARDENAS SAINZ', '1976-09-12', 3730992, 'CB', 'COCHABAMBA', 'f', 79989089, 77389486, 's', 'ESTUDIANTE', 'Avenida oquendo #623', 0, NULL, 49, 123);

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
  `id_moneda` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `codigo`, `id_padre`, `hijo`, `nombre`, `estado`, `utilizable`, `id_moneda`, `deleted_at`) VALUES
(7, '1.', 0, 1, 'ACTIVO', 1, 0, 1, NULL),
(8, '1.1.', 7, 1, 'ACTIVO CORRIENTE', 1, 0, 1, NULL),
(9, '1.1.1.', 8, 1, 'ACTIVO DISPONIBLE', 1, 0, 1, NULL),
(10, '1.1.1.1.', 9, 1, 'CAJA', 1, 0, 1, NULL),
(11, '1.1.1.1.1.', 10, 0, 'Caja general M/N', 1, 1, 1, NULL),
(12, '1.1.1.1.2.', 10, 0, 'CAJA GENERAL M/E', 1, 1, 2, NULL),
(13, '1.1.1.1.3.', 10, 0, 'Caja chica', 1, 1, 1, NULL),
(14, '1.1.1.1.4.', 10, 0, 'Fondo de cambio', 1, 1, 1, NULL),
(15, '1.1.1.1.5.', 10, 0, 'Caja de ventas', 1, 1, 1, NULL),
(16, '1.1.1.1.6.', 10, 0, 'Cobranzas Tarjeta Credito', 1, 1, 1, NULL),
(17, '1.1.1.1.7.', 10, 0, 'CAJA AHORRO EFECTIVO', 1, 1, 1, NULL),
(18, '1.1.1.1.8.', 10, 0, 'CAJA GASTOS', 1, 1, 1, NULL),
(19, '1.1.1.2.', 9, 1, 'BANCOS', 1, 0, 1, NULL),
(20, '1.1.1.2.1.', 19, 0, 'Banco Union Cta. Cte. M/N', 1, 1, 1, NULL),
(21, '1.1.1.2.2.', 19, 0, 'Banco Union Cta. Cte. M/e', 1, 1, 2, NULL),
(23, '1.1.2.', 8, 1, 'ACTIVO EXIGIBLE', 1, 0, 1, NULL),
(24, '1.1.2.1.', 23, 1, 'CUENTAS POR COBRAR', 1, 0, 1, NULL),
(25, '1.1.2.1.1.', 24, 0, 'Cuentas por cobrar M/E', 1, 1, 2, NULL),
(26, '1.1.2.1.2.', 24, 0, 'Ventas al Credito', 1, 1, 1, NULL),
(27, '1.1.2.2.', 23, 1, '	DOCUMENTOS POR COBRAR', 1, 0, 1, NULL),
(28, '1.1.2.2.1.', 27, 0, 'Documentos por cobrar M/N', 1, 1, 1, NULL),
(29, '1.1.2.2.2.', 27, 0, 'Documentos por cobrar M/E', 1, 1, 1, NULL),
(30, '1.1.2.3.', 23, 1, 'CUENTAS FISCALES', 1, 0, 1, NULL),
(31, '1.1.2.3.1.', 30, 0, 'Crédito fiscal', 1, 1, 1, NULL),
(32, '1.1.2.3.2.', 30, 0, 'IUE POR COMPENSAR', 1, 1, 1, NULL),
(33, '1.1.2.4.', 23, 1, 'POR COBRAR A EMPLEADOS', 1, 0, 1, NULL),
(34, '1.1.2.4.1.', 33, 0, 'Préstamos a empleados', 1, 1, 1, NULL),
(35, '1.1.2.4.2.', 33, 0, 'Fondos a rendir', 1, 1, 1, NULL),
(36, '1.1.2.5.', 23, 1, 'ANTICIPOS AL PERSONAL', 1, 0, 1, NULL),
(37, '1.1.2.5.1.', 36, 0, 'Anticipos al personal', 1, 1, 1, NULL),
(38, '1.1.2.6.', 23, 1, 'OTROS ANTICIPOS', 1, 0, 1, NULL),
(39, '1.1.2.6.1.', 38, 0, 'Anticipos a proveedores', 1, 1, 1, NULL),
(40, '1.1.2.6.2.', 38, 0, 'Otros Anticipos', 1, 1, 1, NULL),
(41, '1.1.2.6.3.', 38, 0, 'ANTICIPO UTILIDADES', 1, 1, 1, NULL),
(42, '1.1.2.7.', 23, 1, 'OTRAS CUENTAS POR COBRAR', 1, 0, 1, NULL),
(43, '1.1.2.7.1.', 42, 0, 'Otras cuentas por cobrar', 1, 1, 1, NULL),
(44, '1.1.2.7.2.', 42, 0, 'Garantia Alquileres', 1, 1, 1, NULL),
(45, '1.1.3.', 8, 1, 'ACTIVO REALIZABLE', 1, 0, 1, NULL),
(46, '1.1.3.1.', 45, 1, 'INVENTARIO DE MERCADERIA', 1, 0, 1, NULL),
(47, '1.1.3.1.1.', 46, 0, 'Inventario de mercadería', 1, 1, 1, NULL),
(48, '1.1.3.2.', 45, 1, 'MERCADERIA EN TRANSITO', 1, 0, 1, NULL),
(49, '1.1.3.2.1.', 48, 0, 'Mercadería en tránsito', 1, 1, 1, NULL),
(50, '1.1.3.2.2.', 48, 0, 'Por pagar a proveedor', 1, 1, 1, NULL),
(51, '1.2.', 7, 1, 'ACTIVO NO CORRIENTE', 1, 0, 1, NULL),
(52, '1.2.1.', 51, 1, 'ACTIVO FIJO', 1, 0, 1, NULL),
(53, '1.2.1.1.', 52, 1, 'TERRENOS', 1, 0, 1, NULL),
(54, '1.2.1.1.1.', 53, 0, 'Valor actualizado de terrenos', 1, 1, 1, NULL),
(56, '1.2.1.2.', 52, 1, 'EDIFICIO Y CONSTRUCCIONE', 1, 0, 1, NULL),
(57, '1.2.1.2.1.', 56, 0, 'Edificios y construcciones', 1, 1, 1, NULL),
(58, '1.2.1.2.2.', 56, 0, 'Deprec. Acum. de Edificios', 1, 1, 1, NULL),
(59, '1.2.1.3.', 52, 1, '	MUEBLES Y ENSERES', 1, 0, 1, NULL),
(60, '1.2.1.3.1.', 59, 1, 'Muebles y enseres', 1, 1, 1, NULL),
(61, '1.2.1.3.2.', 59, 0, 'Deprec. Acum. de Mueb./Ens.', 1, 1, 1, NULL),
(62, '1.2.1.4.', 52, 1, 'INSTALACIONES Y EQUIPOS', 1, 0, 1, NULL),
(63, '1.2.1.4.1.', 62, 0, 'Instalaciones y equipos', 1, 1, 1, NULL),
(64, '1.2.1.4.2.', 62, 0, 'Deprec. Acum. de Inst./Eq.', 1, 1, 1, NULL),
(65, '1.2.1.5.', 52, 1, 'VEHICULOS', 1, 0, 1, NULL),
(66, '1.2.1.5.1.', 65, 0, 'Vehículos', 1, 1, 1, NULL),
(67, '1.2.1.5.2.', 65, 0, 'Deprec. Acum. de Vehículos', 1, 1, 1, NULL),
(68, '1.2.1.6.', 52, 1, 'EQUIPOS DE COMPUTACION', 1, 0, 1, NULL),
(69, '1.2.1.6.1.', 68, 0, 'Equipos de computación', 1, 1, 1, NULL),
(70, '1.2.2.', 51, 1, 'OTROS ACTIVOS', 1, 0, 1, NULL),
(71, '1.2.2.1.', 70, 1, 'INVERSIONES', 1, 0, 1, NULL),
(72, '1.2.2.2.', 70, 1, 'SOFTWARES', 1, 0, 1, NULL),
(73, '1.2.2.3.', 70, 1, 'ACTIVO DIFERIDO', 1, 0, 1, NULL),
(74, '2.', 0, 1, 'PASIVO', 1, 0, 1, NULL),
(75, '2.1.', 74, 1, 'PASIVO CORRIENTE', 1, 0, 1, NULL),
(76, '2.1.1.', 75, 1, 'PASIVO EXIGIBLE', 1, 0, 1, NULL),
(77, '2.1.1.1.', 76, 1, 'PROVEEDORES DE BIENES', 1, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaautomatica`
--

CREATE TABLE IF NOT EXISTS `cuentaautomatica` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_cuenta` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentaautomatica`
--

INSERT INTO `cuentaautomatica` (`id`, `nombre`, `id_cuenta`, `deleted_at`) VALUES
(1, 'Caja', 12, NULL),
(2, 'Cuenta Bancaria M/N', 20, NULL),
(3, 'Cuenta Bancaria M/E', 21, NULL),
(4, 'Cuenta por Cobrar', 13, NULL),
(5, 'Ingreso Diferido', 11, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentabanco`
--

INSERT INTO `cuentabanco` (`id`, `nroCuenta`, `idBanco`, `tipoCuenta`, `moneda`, `deleted_at`) VALUES
(4, 24788800, 3, 'BS', 'BOLIVIANOS', NULL),
(5, 24788652, 3, '$U$', 'DOLARES', NULL),
(6, 2147483647, 4, 'CUENTA DE AHORRO', 'BOLIVIANOS', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentagrupo`
--

INSERT INTO `cuentagrupo` (`id`, `nombre`, `descripcion`, `id_cuenta`, `deleted_at`) VALUES
(1, 'ACTIVO', '', 7, NULL),
(2, 'Credito fiscal', '', 25, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentaimpuesto`
--

INSERT INTO `cuentaimpuesto` (`id`, `nombre`, `porcentaje`, `descripcion`, `id_cuenta`, `deleted_at`) VALUES
(2, 'Credito fiscal', '13.00', '', 18, NULL),
(3, 'IC', '0.00', '', 12, NULL);

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
  `deleted_at` date DEFAULT NULL,
  `montoBs` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuotas`
--

INSERT INTO `cuotas` (`id`, `monto`, `fechaLimite`, `mora`, `idPlandePago`, `estado`, `deleted_at`, `montoBs`) VALUES
(1, '68.00', '2018-05-01', 0, 1, 'd', NULL, '470.00'),
(2, '68.00', '2018-06-01', 0, 1, 'd', NULL, '470.00'),
(3, '68.00', '2018-07-01', 0, 1, 'd', NULL, '470.00'),
(4, '68.00', '2018-08-01', 0, 1, 'd', NULL, '470.00'),
(5, '68.00', '2018-09-01', 0, 1, 'd', NULL, '470.00'),
(6, '68.00', '2018-10-01', 0, 1, 'd', NULL, '470.00'),
(7, '68.00', '2018-11-01', 0, 1, 'd', NULL, '470.00'),
(8, '68.00', '2018-12-01', 0, 1, 'd', NULL, '470.00'),
(9, '68.00', '2019-01-01', 0, 1, 'd', NULL, '470.00'),
(10, '68.00', '2019-02-01', 0, 1, 'd', NULL, '470.00'),
(11, '68.00', '2019-03-01', 0, 1, 'd', NULL, '470.00'),
(12, '68.00', '2019-04-01', 0, 1, 'd', NULL, '470.00'),
(13, '68.00', '2019-05-01', 0, 1, 'd', NULL, '470.00'),
(14, '68.00', '2019-06-01', 0, 1, 'd', NULL, '470.00'),
(15, '68.00', '2019-07-01', 0, 1, 'd', NULL, '470.00'),
(16, '68.00', '2019-08-01', 0, 1, 'd', NULL, '470.00'),
(17, '68.00', '2019-09-01', 0, 1, 'd', NULL, '470.00'),
(18, '68.00', '2019-10-01', 0, 1, 'd', NULL, '470.00'),
(19, '68.00', '2019-11-01', 0, 1, 'd', NULL, '470.00'),
(20, '68.00', '2019-12-01', 0, 1, 'd', NULL, '470.00'),
(21, '68.00', '2020-01-01', 0, 1, 'd', NULL, '470.00'),
(22, '68.00', '2020-02-01', 0, 1, 'd', NULL, '470.00'),
(23, '68.00', '2020-03-01', 0, 1, 'd', NULL, '470.00'),
(24, '68.00', '2020-04-01', 0, 1, 'd', NULL, '470.00'),
(25, '68.00', '2020-05-01', 0, 1, 'd', NULL, '470.00'),
(26, '68.00', '2020-06-01', 0, 1, 'd', NULL, '470.00'),
(27, '68.00', '2020-07-01', 0, 1, 'd', NULL, '470.00'),
(28, '68.00', '2020-08-01', 0, 1, 'd', NULL, '470.00'),
(29, '68.00', '2020-09-01', 0, 1, 'd', NULL, '470.00'),
(30, '68.00', '2020-10-01', 0, 1, 'd', NULL, '470.00'),
(31, '68.00', '2020-11-01', 0, 1, 'd', NULL, '470.00'),
(32, '68.00', '2020-12-01', 0, 1, 'd', NULL, '470.00'),
(33, '68.00', '2021-01-01', 0, 1, 'd', NULL, '470.00'),
(34, '68.00', '2021-02-01', 0, 1, 'd', NULL, '470.00'),
(35, '68.00', '2021-03-01', 0, 1, 'd', NULL, '470.00'),
(36, '68.00', '2021-04-01', 0, 1, 'd', NULL, '470.00'),
(37, '68.00', '2021-05-01', 0, 1, 'd', NULL, '470.00'),
(38, '68.00', '2021-06-01', 0, 1, 'd', NULL, '470.00'),
(39, '68.00', '2021-07-01', 0, 1, 'd', NULL, '470.00'),
(40, '68.00', '2021-08-01', 0, 1, 'd', NULL, '470.00'),
(41, '68.00', '2021-09-01', 0, 1, 'd', NULL, '470.00'),
(42, '68.00', '2021-10-01', 0, 1, 'd', NULL, '470.00'),
(43, '68.00', '2021-11-01', 0, 1, 'd', NULL, '470.00'),
(44, '68.00', '2021-12-01', 0, 1, 'd', NULL, '470.00'),
(45, '68.00', '2022-01-01', 0, 1, 'd', NULL, '470.00'),
(46, '68.00', '2022-02-01', 0, 1, 'd', NULL, '470.00'),
(47, '68.00', '2022-03-01', 0, 1, 'd', NULL, '470.00'),
(48, '68.00', '2022-04-01', 0, 1, 'd', NULL, '470.00'),
(49, '68.00', '2022-05-01', 0, 1, 'd', NULL, '470.00'),
(50, '68.00', '2022-06-01', 0, 1, 'd', NULL, '470.00'),
(51, '68.00', '2022-07-01', 0, 1, 'd', NULL, '470.00'),
(52, '68.00', '2022-08-01', 0, 1, 'd', NULL, '470.00'),
(53, '68.00', '2022-09-01', 0, 1, 'd', NULL, '470.00'),
(54, '68.00', '2022-10-01', 0, 1, 'd', NULL, '470.00'),
(55, '68.00', '2022-11-01', 0, 1, 'd', NULL, '470.00'),
(56, '68.00', '2022-12-01', 0, 1, 'd', NULL, '470.00'),
(57, '68.00', '2023-01-01', 0, 1, 'd', NULL, '470.00'),
(58, '68.00', '2023-02-01', 0, 1, 'd', NULL, '470.00'),
(59, '68.00', '2023-03-01', 0, 1, 'd', NULL, '470.00'),
(60, '38.00', '2023-04-01', 0, 1, 'd', NULL, '458.00'),
(91, '365.00', '2018-05-01', 0, 3, 'd', NULL, '2537.00'),
(92, '365.00', '2018-06-01', 0, 3, 'd', NULL, '2537.00'),
(93, '365.00', '2018-07-01', 0, 3, 'd', NULL, '2537.00'),
(94, '365.00', '2018-08-01', 0, 3, 'd', NULL, '2537.00'),
(95, '365.00', '2018-09-01', 0, 3, 'd', NULL, '2537.00'),
(96, '365.00', '2018-10-01', 0, 3, 'd', NULL, '2537.00'),
(97, '365.00', '2018-11-01', 0, 3, 'd', NULL, '2537.00'),
(98, '365.00', '2018-12-01', 0, 3, 'd', NULL, '2537.00'),
(99, '365.00', '2019-01-01', 0, 3, 'd', NULL, '2537.00'),
(100, '360.00', '2019-02-01', 0, 3, 'd', NULL, '2536.20');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`id`, `id_cuenta`, `id_asiento`, `nro_detalle`, `tipo`, `montoSus`, `montoBs`, `id_centro_costo`, `deleted_at`) VALUES
(1, 12, 1, 1, 1, '0.00', '0.00', NULL, NULL),
(2, 11, 1, 2, 2, '0.00', '0.00', NULL, NULL),
(3, 12, 2, 1, 1, '0.00', '0.00', NULL, NULL),
(4, 11, 2, 2, 2, '0.00', '0.00', NULL, NULL),
(5, 12, 3, 1, 1, '26622.00', '3825.00', NULL, NULL),
(6, 11, 3, 2, 2, '0.00', '0.00', NULL, NULL),
(7, 12, 4, 1, 1, '26622.00', '3825.00', NULL, NULL),
(8, 11, 4, 2, 2, '3825.00', '26622.00', NULL, NULL),
(9, 21, 5, 1, 1, '3825.00', '26622.00', NULL, NULL),
(10, 11, 5, 2, 2, '3825.00', '26622.00', NULL, NULL),
(11, 13, 6, 1, 1, '4500.00', '31320.00', NULL, NULL),
(12, 12, 6, 2, 1, '0.00', '0.00', NULL, NULL),
(13, 11, 6, 3, 2, '4500.00', '31320.00', NULL, NULL),
(17, 13, 8, 1, 1, '4500.00', '31320.00', NULL, NULL),
(18, 12, 8, 2, 1, '0.00', '0.00', NULL, NULL),
(19, 11, 8, 3, 2, '4500.00', '31320.00', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(23, 'Carlos', 'del Castillo', '', 476828, '', 476828, 'm', '7469c', 'h', 6, 1, '2018-03-20', NULL),
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
(37, 'Carlos Mauricio', 'Rivera', '', 10017152, '', 10017152, 'm', '98d980', 'h', 7, 1, '2018-03-20', NULL),
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
(68, 'Andrea Marianne', 'Caba', 'Barrio Sucre calle 13 Numero 90', 5005380, 'SC', 71661127, 'f', '4c6044', 'h', 7, 1, '2018-03-20', 123),
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
-- Estructura de tabla para la tabla `librocompra`
--

CREATE TABLE IF NOT EXISTS `librocompra` (
  `id` int(11) NOT NULL,
  `fecha_factura_DUI` datetime DEFAULT NULL,
  `nit_proveedor` varchar(20) DEFAULT NULL,
  `nombre_razon_social` varchar(200) DEFAULT NULL,
  `nro_factura` varchar(30) DEFAULT NULL,
  `nro_DUI` varchar(30) DEFAULT NULL,
  `nro_autorizacion` varchar(50) DEFAULT NULL,
  `importe_total_compra` decimal(12,2) DEFAULT NULL,
  `importe_no_sujeto_CF` decimal(12,2) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  `descuento_sujeto_IVA` decimal(12,2) DEFAULT NULL,
  `importe_base_CF` decimal(12,2) DEFAULT NULL,
  `credito_fiscal` decimal(12,2) DEFAULT NULL,
  `codigo_control` varchar(50) DEFAULT NULL,
  `tipo_compra` varchar(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libroventa`
--

CREATE TABLE IF NOT EXISTS `libroventa` (
  `id` int(11) NOT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  `nro_factura` varchar(30) DEFAULT NULL,
  `nro_autorizacion` varchar(50) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `nit_ci_cliente` varchar(20) DEFAULT NULL,
  `nombre_razon_social` varchar(200) DEFAULT NULL,
  `importe_total_venta` decimal(12,2) DEFAULT NULL,
  `importe_no_sujeto_IVA` decimal(12,2) DEFAULT NULL,
  `exportaciones_operaciones_exentas` decimal(12,2) DEFAULT NULL,
  `ventas_gravadas_TC` decimal(12,2) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  `descuento_sujeto_IVA` decimal(12,2) DEFAULT NULL,
  `importe_base_DF` decimal(12,2) DEFAULT NULL,
  `debito_fiscal` decimal(12,2) DEFAULT NULL,
  `codigo_control` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `point` varchar(200) DEFAULT NULL,
  `fase` tinyint(4) NOT NULL,
  `tipo_etiqueta` tinyint(4) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `idCategoriaLote` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3223 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(2117, 1, '439.48', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M307,795.09l-1.68,27.15-42.44-2.34S250,818,250.75,805.33c.63-10.56,1.06-12.94,1.07-13.54a.18.18,0,0,1,.19-.17Z', 1, 1, 3, NULL, 16),
(2118, 2, '450.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '308.39 767.4 253.74 764 252.14 792.33 306.49 796.01 308.39 767.4', 1, 0, 3, NULL, 16),
(2119, 3, '450.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '310.7 739.88 255.45 736.62 253.91 764.19 309.19 767.13 310.7 739.88', 1, 0, 3, NULL, 16),
(2120, 4, '439.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M312.14,712.5l-41.77-2.32s-13.19-1.53-14.21,14.56c-.59,9.33-.81,12-.81,12l55.23,3.18Z', 1, 1, 3, NULL, 16),
(2121, 5, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.71 -16.75) rotate(3.19)', 1, 2, 3, NULL, 16),
(2122, 6, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.82 -17.95) rotate(3.19)', 1, 2, 3, NULL, 16),
(2123, 7, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.94 -19.17) rotate(3.19)', 1, 2, 3, NULL, 16),
(2124, 8, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.05 -20.38) rotate(3.19)', 1, 2, 3, NULL, 16),
(2125, 9, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(1, 0.06, -0.06, 1, 42.15, -21.6)', 1, 2, 3, NULL, 16),
(2126, 10, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.25 -22.82) rotate(3.19)', 1, 2, 3, NULL, 16),
(2127, 11, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.36 -24.03) rotate(3.19)', 1, 2, 3, NULL, 16),
(2128, 12, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.49 -25.26) rotate(3.19)', 1, 2, 3, NULL, 16),
(2129, 13, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.59 -26.47) rotate(3.19)', 1, 2, 3, NULL, 16),
(2130, 14, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.69 -27.69) rotate(3.19)', 1, 2, 3, NULL, 16),
(2131, 15, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.83 -28.89) rotate(3.19)', 1, 2, 3, NULL, 16),
(2132, 16, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.95 -30.12) rotate(3.19)', 1, 2, 3, NULL, 16),
(2133, 17, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.04 -31.33) rotate(3.19)', 1, 2, 3, NULL, 16),
(2134, 18, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.16 -32.55) rotate(3.19)', 1, 2, 3, NULL, 16),
(2135, 19, '485.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.29 -33.97) rotate(3.19)', 1, 2, 3, NULL, 15),
(2136, 20, '485.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(46.33 -33.69) rotate(3.19)', 1, 2, 3, NULL, 15),
(2137, 21, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(46.2 -32.28) rotate(3.19)', 1, 2, 3, NULL, 16),
(2138, 22, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(46.09 -31.06) rotate(3.19)', 1, 2, 3, NULL, 16),
(2139, 23, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.99 -29.84) rotate(3.19)', 1, 2, 3, NULL, 16),
(2140, 24, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(1, 0.06, -0.06, 1, 45.87, -28.62)', 1, 2, 3, NULL, 16),
(2141, 25, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.75 -27.41) rotate(3.19)', 1, 2, 3, NULL, 16),
(2142, 26, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '502.56 834.56 480.86 833 483.91 778.25 505.92 779.48 502.56 834.56', 1, 0, 3, NULL, 16),
(2143, 27, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.51 -24.99) rotate(3.19)', 1, 2, 3, NULL, 16),
(2144, 28, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.41 -23.78) rotate(3.19)', 1, 2, 3, NULL, 16),
(2145, 29, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.31 -22.56) rotate(3.19)', 1, 2, 3, NULL, 16),
(2146, 30, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.18 -21.35) rotate(3.19)', 1, 2, 3, NULL, 16),
(2147, 31, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.08 -20.14) rotate(3.19)', 1, 2, 3, NULL, 16),
(2148, 32, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.96 -18.92) rotate(3.19)', 1, 2, 3, NULL, 16),
(2149, 33, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.86 -17.7) rotate(3.19)', 1, 2, 3, NULL, 16),
(2150, 34, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.75 -16.46) rotate(3.19)', 1, 2, 3, NULL, 16),
(2151, 1, '439.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M315.39,663.38l-1.68,27L271.27,688s-13.84-.71-12.34-14.41,1.32-13.7,1.32-13.7Z', 1, 1, 3, NULL, 16),
(2152, 2, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '317.29 635.45 261.91 632.09 260.29 660 315.37 663.64 317.29 635.45', 1, 0, 3, NULL, 16),
(2153, 3, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '318.76 608.77 263.5 605.62 261.98 632.15 317.26 634.99 318.76 608.77', 1, 0, 3, NULL, 16),
(2154, 4, '439.48', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M320.18,580.62l-41.55-2.4s-13.72.45-14.66,14.67l-.82,12.39,55.48,3.28Z', 1, 1, 3, NULL, 16),
(2155, 5, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.37 -17.4) rotate(3.19)', 1, 2, 3, NULL, 16),
(2156, 6, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.47 -18.62) rotate(3.19)', 1, 2, 3, NULL, 16),
(2157, 7, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.6 -19.84) rotate(3.19)', 1, 2, 3, NULL, 16),
(2158, 8, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.7 -21.07) rotate(3.19)', 1, 2, 3, NULL, 16),
(2159, 9, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.8 -22.27) rotate(3.19)', 1, 2, 3, NULL, 16),
(2160, 10, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.9 -23.49) rotate(3.19)', 1, 2, 3, NULL, 16),
(2161, 11, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.01 -24.73) rotate(3.19)', 1, 2, 3, NULL, 16),
(2162, 12, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.11 -25.93) rotate(3.19)', 1, 2, 3, NULL, 16),
(2163, 13, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.25 -27.17) rotate(3.19)', 1, 2, 3, NULL, 16),
(2164, 14, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.43 -28.38) rotate(3.19)', 1, 2, 3, NULL, 16),
(2165, 15, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.52 -29.59) rotate(3.19)', 1, 2, 3, NULL, 16),
(2166, 16, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.63 -30.83) rotate(3.19)', 1, 2, 3, NULL, 16),
(2167, 17, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.74 -32.01) rotate(3.19)', 1, 2, 3, NULL, 16),
(2168, 18, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.84 -33.23) rotate(3.19)', 1, 2, 3, NULL, 16),
(2169, 19, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.94 -34.44) rotate(3.19)', 1, 2, 3, NULL, 16),
(2170, 20, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.04 -35.66) rotate(3.19)', 1, 2, 3, NULL, 15),
(2171, 21, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.1 -35.39) rotate(3.19)', 1, 2, 3, NULL, 15),
(2172, 22, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39 -34.17) rotate(3.19)', 1, 2, 3, NULL, 16),
(2173, 23, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.9 -32.95) rotate(3.19)', 1, 2, 3, NULL, 16),
(2174, 24, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.78 -31.74) rotate(3.19)', 1, 2, 3, NULL, 16),
(2175, 25, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.69 -30.57) rotate(3.19)', 1, 2, 3, NULL, 16),
(2176, 26, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(1, 0.06, -0.06, 1, 38.57, -29.32)', 1, 2, 3, NULL, 16),
(2177, 27, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.42 -28.1) rotate(3.19)', 1, 2, 3, NULL, 16),
(2178, 28, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.3 -26.88) rotate(3.19)', 1, 2, 3, NULL, 16),
(2179, 29, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.14 -25.66) rotate(3.19)', 1, 2, 3, NULL, 16),
(2180, 30, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.04 -24.45) rotate(3.19)', 1, 2, 3, NULL, 16),
(2181, 31, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.95 -23.23) rotate(3.19)', 1, 2, 3, NULL, 16),
(2182, 32, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.84 -22.01) rotate(3.19)', 1, 2, 3, NULL, 16),
(2183, 33, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.74 -20.8) rotate(3.19)', 1, 2, 3, NULL, 16),
(2184, 34, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.61 -19.59) rotate(3.19)', 1, 2, 3, NULL, 16),
(2185, 35, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.51 -18.36) rotate(3.19)', 1, 2, 3, NULL, 16),
(2186, 36, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.43 -17.15) rotate(3.19)', 1, 2, 3, NULL, 16),
(2187, 1, '439.62', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M318.77,529.71l-1.1,30.72L279,557.82s-12.41-.78-11-16.37,1.21-15.58,1.21-15.58Z', 1, 1, 3, NULL, 16),
(2188, 2, '362.86', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '320.49 505.1 270.76 502.17 269.31 526.41 318.77 529.58 320.49 505.1', 1, 0, 3, NULL, 16),
(2189, 3, '362.86', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '321.82 480.85 272.14 477.95 270.76 502.42 320.46 505.04 321.82 480.85', 1, 0, 3, NULL, 16),
(2190, 4, '432.75', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M323.23,450.81l-35.38-2.4s-14.1.37-15,15.64l-.75,13.3,49.67,3.45Z', 1, 1, 3, NULL, 15),
(2191, 5, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.14 -17.77) rotate(3.19)', 1, 2, 3, NULL, 15),
(2192, 6, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.25 -18.99) rotate(3.19)', 1, 2, 3, NULL, 15),
(2193, 7, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.37 -20.2) rotate(3.19)', 1, 2, 3, NULL, 15),
(2194, 8, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.48 -21.44) rotate(3.19)', 1, 2, 3, NULL, 15),
(2195, 9, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.58 -22.64) rotate(3.19)', 1, 2, 3, NULL, 15),
(2196, 10, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.68 -23.86) rotate(3.19)', 1, 2, 3, NULL, 15),
(2197, 11, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.78 -25.1) rotate(3.19)', 1, 2, 3, NULL, 15),
(2198, 12, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.88 -26.29) rotate(3.19)', 1, 2, 3, NULL, 15),
(2199, 13, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.02 -27.54) rotate(3.19)', 1, 2, 3, NULL, 15),
(2200, 14, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.15 -28.75) rotate(3.19)', 1, 2, 3, NULL, 15),
(2201, 15, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.24 -29.96) rotate(3.19)', 1, 2, 3, NULL, 15),
(2202, 16, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.36 -31.2) rotate(3.19)', 1, 2, 3, NULL, 15),
(2203, 17, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.46 -32.38) rotate(3.19)', 1, 2, 3, NULL, 15),
(2204, 18, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.56 -33.6) rotate(3.19)', 1, 2, 3, NULL, 15),
(2205, 19, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.66 -34.81) rotate(3.19)', 1, 2, 3, NULL, 15),
(2206, 20, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.76 -36.03) rotate(3.19)', 1, 2, 3, NULL, 15),
(2207, 21, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.87 -37.24) rotate(3.19)', 1, 2, 3, NULL, 15),
(2208, 22, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.97 -38.46) rotate(3.19)', 1, 2, 3, NULL, 15),
(2209, 23, '424.51', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M743.63,493.25s.64-17.34-15.37-18.37c-4.75-.25-10.53-.73-10.53-.73l-3.07,55,26.72,1.57Z', 1, 1, 3, NULL, 15),
(2210, 24, '442.45', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M741.38,530.75l-27.1-1.49L711.22,584l13.15.74s14.5,2.13,15.25-12S741.38,530.75,741.38,530.75Z', 1, 1, 3, NULL, 15),
(2211, 25, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.02 -38.19) rotate(3.19)', 1, 2, 3, NULL, 15),
(2212, 26, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.92 -36.95) rotate(3.19)', 1, 2, 3, NULL, 15),
(2213, 27, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.77 -35.74) rotate(3.19)', 1, 2, 3, NULL, 16),
(2214, 28, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.68 -34.57) rotate(3.19)', 1, 2, 3, NULL, 16),
(2215, 29, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.59 -33.33) rotate(3.19)', 1, 2, 3, NULL, 16),
(2216, 30, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.5 -32.11) rotate(3.19)', 1, 2, 3, NULL, 16),
(2217, 31, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.41 -30.94) rotate(3.19)', 1, 2, 3, NULL, 16),
(2218, 32, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(1, 0.06, -0.06, 1, 31.29, -29.69)', 1, 2, 3, NULL, 16),
(2219, 33, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.14 -28.47) rotate(3.19)', 1, 2, 3, NULL, 16),
(2220, 34, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.08 -27.25) rotate(3.19)', 1, 2, 3, NULL, 16),
(2221, 35, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.92 -26.03) rotate(3.19)', 1, 2, 3, NULL, 16),
(2222, 36, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.82 -24.82) rotate(3.19)', 1, 2, 3, NULL, 16),
(2223, 37, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.73 -23.6) rotate(3.19)', 1, 2, 3, NULL, 16),
(2224, 38, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.62 -22.38) rotate(3.19)', 1, 2, 3, NULL, 16),
(2225, 39, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.52 -21.17) rotate(3.19)', 1, 2, 3, NULL, 16),
(2226, 40, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.39 -19.96) rotate(3.19)', 1, 2, 3, NULL, 16),
(2227, 41, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.29 -18.73) rotate(3.19)', 1, 2, 3, NULL, 16),
(2228, 42, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.2 -17.51) rotate(3.19)', 1, 2, 3, NULL, 16),
(2229, 1, '439.48', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M750.2,796.59l-2,40s-1.34,14.75,12.71,15.58l14,.83,2.85-55.07Z', 1, 1, 3, NULL, 15),
(2230, 2, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-45.54 1526.14) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2231, 3, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-22.24 1506.72) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2232, 4, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(0.94 1486.7) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2233, 5, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(23.55 1467.17) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2234, 6, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, 46.51, 1447.34)', 1, 2, 3, NULL, 15),
(2235, 7, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(69.97 1427.08) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2236, 8, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(92.38 1407.72) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2237, 9, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(116.44 1388.12) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2238, 10, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(138.68 1367.82) rotate(-87.21)', 1, 2, 3, NULL, 15),
(2239, 11, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(161.4 1348.05) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2240, 12, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, 184.81, 1328.12)', 1, 2, 3, NULL, 16),
(2241, 13, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(207.14 1308.94) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2242, 14, '437.29', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M791.23,534.83l-27.6-1.34,2.65-34.29s9.14-19.86,22.56-19.49c.78,0,4.92.32,4.92.32Z', 1, 1, 3, NULL, 15),
(2243, 15, '452.23', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '821.2 481.41 818.79 536.47 791.23 534.83 793.74 480.04 821.2 481.41', 1, 0, 3, NULL, 15),
(2244, 16, '450.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '848.78 482.91 845.73 537.77 818.79 536.47 821.2 481.41 848.78 482.91', 1, 0, 3, NULL, 15),
(2245, 17, '401.71', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M873.72,539.13l1.89-40s-.25-15.55-13.79-15.92c-11.33-.33-13-.33-13-.33l-3.05,54.86Z', 1, 1, 3, NULL, 15),
(2246, 18, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(256.65 1366.6) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2247, 19, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(234.63 1385.77) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2248, 20, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(210.85 1405.72) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2249, 21, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(188.06 1425.84) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2250, 22, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(164.67 1445.35) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2251, 23, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(141.76 1465.14) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2252, 24, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(118.93 1484.86) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2253, 25, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(96.28 1504.96) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2254, 26, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(73.13 1524.66) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2255, 27, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(50.35 1544.29) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2256, 28, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.1 1563.49) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2257, 29, '360.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(3.99 1583.45) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2258, 30, '439.48', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M832.78,800.91l27.6,1-2.1,42.2s-.59,12.67-14.63,12.17l-14-.5Z', 1, 1, 3, NULL, 16),
(2259, 31, '450.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '805.17 799.2 802.26 854.33 829.6 855.74 832.77 800.91 805.17 799.2', 1, 0, 3, NULL, 16),
(2260, 32, '450.00', 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '777.78 797.92 774.93 852.99 802.26 854.33 804.79 799.23 777.78 797.92', 1, 0, 3, NULL, 16),
(2261, 1, '439.48', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M914.2,804.68l-2,40s-1.34,14.75,12.71,15.58l14,.83L941.78,806Z', 1, 1, 3, NULL, 16),
(2262, 2, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(102.41 1697.64) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2263, 3, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(125.7 1678.22) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2264, 4, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(148.88 1658.2) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2265, 5, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(171.5 1638.67) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2266, 6, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, 194.45, 1618.84)', 1, 2, 3, NULL, 16),
(2267, 7, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(217.92 1598.58) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2268, 8, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(240.32 1579.22) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2269, 9, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(264.38 1559.62) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2270, 10, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(286.62 1539.32) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2271, 11, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(309.34 1519.55) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2272, 12, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, 332.75, 1499.62)', 1, 2, 3, NULL, 16),
(2273, 13, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(355.08 1480.44) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2274, 14, '401.71', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M955.23,542.92l-27.6-1.34,2.65-34.29s9.14-19.86,22.56-19.49c.78,0,4.92.32,4.92.32Z', 1, 1, 3, NULL, 15),
(2275, 15, '450.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '985.2 489.5 982.79 544.56 955.23 542.91 957.74 488.12 985.2 489.5', 1, 0, 3, NULL, 15),
(2276, 16, '450.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1012.78 491 1009.73 545.86 982.79 544.56 985.2 489.5 1012.78 491', 1, 0, 3, NULL, 15),
(2277, 17, '432.62', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1037.72,547.22l1.89-40s-.25-15.55-13.79-15.92c-11.33-.33-13-.33-13-.33l-3.05,54.86Z', 1, 1, 3, NULL, 15),
(2278, 18, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(404.6 1538.1) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2279, 19, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(382.57 1557.27) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2280, 20, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(358.79 1577.22) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2281, 21, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(336 1597.34) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2282, 22, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(312.61 1616.85) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2283, 23, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(289.7 1636.64) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2284, 24, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(266.87 1656.36) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2285, 25, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(244.22 1676.46) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2286, 26, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(221.07 1696.16) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2287, 27, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(198.29 1715.79) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2288, 28, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(175.04 1734.99) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2289, 29, '360.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(151.93 1754.95) rotate(-87.21)', 1, 2, 3, NULL, 16),
(2290, 30, '439.48', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M996.78,809l27.6,1-2.1,42.2s-.59,12.67-14.63,12.17l-14-.5Z', 1, 1, 3, NULL, 16),
(2291, 31, '450.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '969.17 807.29 966.26 862.41 993.6 863.83 996.77 809 969.17 807.29', 1, 0, 3, NULL, 16),
(2292, 32, '450.00', 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '941.78 806.01 938.93 861.08 966.26 862.41 968.79 807.32 941.78 806.01', 1, 0, 3, NULL, 16),
(2293, 1, '439.48', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1112.75,577.5l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 16),
(2294, 2, '450.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1114.46 549.98 1059.33 547.08 1057.92 574.33 1112.75 577.5 1114.46 549.98', 1, 0, 3, NULL, 16),
(2295, 3, '450.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1115.74 522.67 1060.67 519.83 1059.33 547.08 1114.43 549.6 1115.74 522.67', 1, 0, 3, NULL, 16),
(2296, 4, '439.48', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1117.07,495.18l-40-2s-14.75-1.33-15.58,12.67l-.83,14,55.07,2.84Z', 1, 1, 3, NULL, 15),
(2297, 5, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(26.71 -54.05) rotate(2.78)', 1, 2, 3, NULL, 15),
(2298, 6, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(26.79 -55.11) rotate(2.78)', 1, 2, 3, NULL, 15),
(2299, 7, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(26.88 -56.17) rotate(2.78)', 1, 2, 3, NULL, 15),
(2300, 8, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(26.96 -57.25) rotate(2.78)', 1, 2, 3, NULL, 15),
(2301, 9, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.04 -58.3) rotate(2.78)', 1, 2, 3, NULL, 15),
(2302, 10, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.12 -59.36) rotate(2.78)', 1, 2, 3, NULL, 15),
(2303, 11, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.2 -60.45) rotate(2.78)', 1, 2, 3, NULL, 15),
(2304, 12, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.27 -61.49) rotate(2.78)', 1, 2, 3, NULL, 15),
(2305, 13, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.38 -62.58) rotate(2.78)', 1, 2, 3, NULL, 15),
(2306, 14, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.43 -63.63) rotate(2.78)', 1, 2, 3, NULL, 15),
(2307, 15, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.5 -64.69) rotate(2.78)', 1, 2, 3, NULL, 15),
(2308, 16, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.59 -65.77) rotate(2.78)', 1, 2, 3, NULL, 15),
(2309, 17, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(27.67 -66.8) rotate(2.78)', 1, 2, 3, NULL, 15),
(2310, 18, '439.48', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1400.83,537.08l1.34-27.52,42,2.28s12.5.38,12.13,13.75-.62,14-.62,14Z', 1, 1, 3, NULL, 15),
(2311, 19, '450.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1454.25 566.96 1399.19 564.55 1400.83 537.08 1455.63 539.58 1454.25 566.96', 1, 0, 3, NULL, 15),
(2312, 20, '450.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1452.75 594.46 1397.89 591.41 1399.19 564.55 1454.25 566.96 1452.75 594.46', 1, 0, 3, NULL, 15),
(2313, 21, '439.48', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1396.53,619.32l40,1.89s15.5,1.5,15.88-12,.38-14.75.38-14.75l-54.86-3Z', 1, 1, 3, NULL, 15),
(2314, 22, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.33 -66.6) rotate(2.78)', 1, 2, 3, NULL, 16),
(2315, 23, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.26 -65.57) rotate(2.78)', 1, 2, 3, NULL, 16),
(2316, 24, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.16 -64.49) rotate(2.78)', 1, 2, 3, NULL, 16),
(2317, 25, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.09 -63.42) rotate(2.78)', 1, 2, 3, NULL, 16),
(2318, 26, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30 -62.35) rotate(2.78)', 1, 2, 3, NULL, 16),
(2319, 27, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.92 -61.29) rotate(2.78)', 1, 2, 3, NULL, 16),
(2320, 28, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.84 -60.23) rotate(2.78)', 1, 2, 3, NULL, 16),
(2321, 29, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.78 -59.17) rotate(2.78)', 1, 2, 3, NULL, 16),
(2322, 30, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.69 -58.1) rotate(2.78)', 1, 2, 3, NULL, 16),
(2323, 31, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.62 -57.05) rotate(2.78)', 1, 2, 3, NULL, 16),
(2324, 32, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.52 -55.99) rotate(2.78)', 1, 2, 3, NULL, 16),
(2325, 33, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.44 -54.92) rotate(2.78)', 1, 2, 3, NULL, 16),
(2326, 34, '360.00', 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.38 -53.86) rotate(2.78)', 1, 2, 3, NULL, 16),
(2327, 1, '439.48', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1529.87,598.81l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 15),
(2328, 2, '450.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1531.57 571.29 1476.45 568.39 1475.03 595.64 1529.87 598.81 1531.57 571.29', 1, 0, 3, NULL, 15),
(2329, 3, '450.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1532.85 543.98 1477.78 541.14 1476.45 568.39 1531.54 570.91 1532.85 543.98', 1, 0, 3, NULL, 15),
(2330, 4, '439.48', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1534.19,516.48l-40-2s-14.75-1.33-15.58,12.67l-.83,14,55.07,2.84Z', 1, 1, 3, NULL, 15),
(2331, 5, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.23 -74.26) rotate(2.78)', 1, 2, 3, NULL, 15),
(2332, 6, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.31 -75.32) rotate(2.78)', 1, 2, 3, NULL, 15),
(2333, 7, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.41 -76.39) rotate(2.78)', 1, 2, 3, NULL, 15),
(2334, 8, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.49 -77.46) rotate(2.78)', 1, 2, 3, NULL, 15),
(2335, 9, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.56 -78.51) rotate(2.78)', 1, 2, 3, NULL, 15),
(2336, 10, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.64 -79.57) rotate(2.78)', 1, 2, 3, NULL, 15),
(2337, 11, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.72 -80.66) rotate(2.78)', 1, 2, 3, NULL, 15),
(2338, 12, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.8 -81.7) rotate(2.78)', 1, 2, 3, NULL, 15),
(2339, 13, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.91 -82.79) rotate(2.78)', 1, 2, 3, NULL, 15),
(2340, 14, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(28.96 -83.85) rotate(2.78)', 1, 2, 3, NULL, 15),
(2341, 15, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.03 -84.9) rotate(2.78)', 1, 2, 3, NULL, 15),
(2342, 16, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.11 -85.98) rotate(2.78)', 1, 2, 3, NULL, 15),
(2343, 17, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.19 -87.01) rotate(2.78)', 1, 2, 3, NULL, 15),
(2344, 18, '439.48', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1817.95,558.38l1.34-27.52,42,2.28s12.5.38,12.13,13.75-.62,14-.62,14Z', 1, 1, 3, NULL, 15),
(2345, 19, '450.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1871.37 588.27 1816.31 585.86 1817.95 558.38 1872.74 560.89 1871.37 588.27', 1, 0, 3, NULL, 16),
(2346, 20, '450.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1869.87 615.77 1815 612.72 1816.31 585.86 1871.37 588.27 1869.87 615.77', 1, 0, 3, NULL, 16),
(2347, 21, '439.48', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1813.65,640.63l40,1.89s15.5,1.5,15.88-12,.38-14.75.38-14.75l-54.86-3Z', 1, 1, 3, NULL, 15),
(2348, 22, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.85 -86.81) rotate(2.78)', 1, 2, 3, NULL, 15),
(2349, 23, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.78 -85.79) rotate(2.78)', 1, 2, 3, NULL, 15),
(2350, 24, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.69 -84.7) rotate(2.78)', 1, 2, 3, NULL, 15),
(2351, 25, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.62 -83.63) rotate(2.78)', 1, 2, 3, NULL, 15),
(2352, 26, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.52 -82.56) rotate(2.78)', 1, 2, 3, NULL, 15),
(2353, 27, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.45 -81.5) rotate(2.78)', 1, 2, 3, NULL, 15),
(2354, 28, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.37 -80.44) rotate(2.78)', 1, 2, 3, NULL, 15),
(2355, 29, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.31 -79.38) rotate(2.78)', 1, 2, 3, NULL, 15),
(2356, 30, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.22 -78.31) rotate(2.78)', 1, 2, 3, NULL, 15),
(2357, 31, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.14 -77.26) rotate(2.78)', 1, 2, 3, NULL, 15),
(2358, 32, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.04 -76.2) rotate(2.78)', 1, 2, 3, NULL, 15),
(2359, 33, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.96 -75.13) rotate(2.78)', 1, 2, 3, NULL, 15),
(2360, 34, '360.00', 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.9 -74.07) rotate(2.78)', 1, 2, 3, NULL, 15),
(2361, 1, '439.48', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1946.49,620l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 15),
(2362, 2, '450.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1948.2 592.5 1893.08 589.6 1891.66 616.85 1946.49 620.02 1948.2 592.5', 1, 0, 3, NULL, 16),
(2363, 3, '450.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1949.48 565.19 1894.41 562.35 1893.08 589.6 1948.17 592.11 1949.48 565.19', 1, 0, 3, NULL, 16),
(2364, 4, '439.48', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1950.82,537.69l-40-2s-14.75-1.33-15.58,12.67l-.83,14,55.07,2.84Z', 1, 1, 3, NULL, 15),
(2365, 5, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.75 -94.45) rotate(2.78)', 1, 2, 3, NULL, 15),
(2366, 6, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.83 -95.51) rotate(2.78)', 1, 2, 3, NULL, 15),
(2367, 7, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(29.93 -96.57) rotate(2.78)', 1, 2, 3, NULL, 15),
(2368, 8, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.01 -97.65) rotate(2.78)', 1, 2, 3, NULL, 15),
(2369, 9, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.08 -98.7) rotate(2.78)', 1, 2, 3, NULL, 15),
(2370, 10, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.16 -99.76) rotate(2.78)', 1, 2, 3, NULL, 15),
(2371, 11, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.24 -100.85) rotate(2.78)', 1, 2, 3, NULL, 15),
(2372, 12, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.32 -101.89) rotate(2.78)', 1, 2, 3, NULL, 15),
(2373, 13, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.43 -102.98) rotate(2.78)', 1, 2, 3, NULL, 15),
(2374, 14, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.48 -104.03) rotate(2.78)', 1, 2, 3, NULL, 15),
(2375, 15, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.55 -105.09) rotate(2.78)', 1, 2, 3, NULL, 15),
(2376, 16, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.63 -106.17) rotate(2.78)', 1, 2, 3, NULL, 15),
(2377, 17, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(30.71 -107.2) rotate(2.78)', 1, 2, 3, NULL, 15),
(2378, 18, '439.48', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2234.58,579.59l1.34-27.52,42,2.28s12.5.38,12.13,13.75-.62,14-.62,14Z', 1, 1, 3, NULL, 15),
(2379, 19, '450.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2287.99 609.48 2232.93 607.07 2234.58 579.59 2289.37 582.1 2287.99 609.48', 1, 0, 3, NULL, 16),
(2380, 20, '450.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2286.49 636.98 2231.63 633.93 2232.93 607.07 2287.99 609.48 2286.49 636.98', 1, 0, 3, NULL, 16),
(2381, 21, '439.48', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2230.27,661.84l40,1.89s15.5,1.5,15.88-12,.38-14.75.38-14.75l-54.86-3Z', 1, 1, 3, NULL, 15),
(2382, 22, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.37 -107) rotate(2.78)', 1, 2, 3, NULL, 16),
(2383, 23, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.3 -105.97) rotate(2.78)', 1, 2, 3, NULL, 16),
(2384, 24, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.21 -104.89) rotate(2.78)', 1, 2, 3, NULL, 16),
(2385, 25, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.14 -103.82) rotate(2.78)', 1, 2, 3, NULL, 16),
(2386, 26, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.04 -102.75) rotate(2.78)', 1, 2, 3, NULL, 16),
(2387, 27, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.97 -101.69) rotate(2.78)', 1, 2, 3, NULL, 16),
(2388, 28, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.89 -100.63) rotate(2.78)', 1, 2, 3, NULL, 16),
(2389, 29, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.83 -99.57) rotate(2.78)', 1, 2, 3, NULL, 16),
(2390, 30, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.74 -98.5) rotate(2.78)', 1, 2, 3, NULL, 16),
(2391, 31, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.66 -97.45) rotate(2.78)', 1, 2, 3, NULL, 16),
(2392, 32, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.56 -96.39) rotate(2.78)', 1, 2, 3, NULL, 16),
(2393, 33, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.48 -95.32) rotate(2.78)', 1, 2, 3, NULL, 16),
(2394, 34, '360.00', 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(32.42 -94.26) rotate(2.78)', 1, 2, 3, NULL, 16),
(2395, 1, '439.48', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2363.61,641l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 15),
(2396, 2, '450.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2365.32 613.52 2310.2 610.62 2308.78 637.87 2363.61 641.03 2365.32 613.52', 1, 0, 3, NULL, 16),
(2397, 3, '450.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2366.6 586.2 2311.53 583.37 2310.2 610.62 2365.29 613.13 2366.6 586.2', 1, 0, 3, NULL, 16),
(2398, 4, '432.62', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2367.94,558.71l-40-2s-14.8-.55-15.63,13.45l-.79,13.22,55.07,2.84Z', 1, 1, 3, NULL, 15),
(2399, 5, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.26 -114.66) rotate(2.78)', 1, 2, 3, NULL, 15),
(2400, 6, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.34 -115.72) rotate(2.78)', 1, 2, 3, NULL, 15),
(2401, 7, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(31.42 -116.76) rotate(2.78)', 1, 2, 3, NULL, 15),
(2402, 8, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2452.64 617.69 2430.66 616.69 2433.32 561.91 2455.3 562.92 2452.64 617.69', 1, 0, 3, NULL, 15),
(2403, 9, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2474.34 619.27 2452.64 617.69 2455.3 562.92 2477.04 564.11 2474.34 619.27', 1, 0, 3, NULL, 15),
(2404, 10, '360.41', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2496.38 619.94 2474.38 618.88 2477.14 564.23 2498.78 562.95 2496.38 619.94', 1, 0, 3, NULL, 15),
(2405, 11, '362.15', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2517.25 621 2496.26 620.34 2499.04 563.13 2519.78 562.13 2517.25 621', 1, 0, 3, NULL, 15),
(2406, 12, '360.31', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2537.22 622.26 2517.85 620.97 2519.93 562.13 2540.38 561.75 2537.22 622.26', 1, 0, 3, NULL, 15),
(2407, 13, '602.97', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2574,602.83s16.12-32.58-19.68-41a1,1,0,0,0-.27,0c-1.37.06-13.67,0-13.67,0l-3.15,60.51,23.92,1.13Z', 1, 1, 3, NULL, 15),
(2408, 14, '455.79', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2516.13,676.1h0l2.66-54.77,42.35,2.06L2539,659.88C2533.32,669.7,2528.18,676.69,2516.13,676.1Z', 1, 1, 3, NULL, 16),
(2409, 15, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2516.13 676.1 2493.65 675.01 2496.38 619.94 2518.47 621 2516.13 676.1', 1, 0, 3, NULL, 16),
(2410, 16, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2493.66 674.75 2471.81 673.66 2474.38 618.88 2496.38 619.94 2493.66 674.75', 1, 0, 3, NULL, 16),
(2411, 17, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2471.81 673.66 2449.97 672.5 2452.63 617.69 2474.38 618.88 2471.81 673.66', 1, 0, 3, NULL, 16),
(2412, 18, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2449.81 672.78 2427.83 671.44 2430.83 616.69 2452.63 617.69 2449.81 672.78', 1, 0, 3, NULL, 16),
(2413, 19, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.07 -116.58) rotate(2.78)', 1, 2, 3, NULL, 16),
(2414, 20, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.99 -115.52) rotate(2.78)', 1, 2, 3, NULL, 16),
(2415, 21, '360.00', 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.91 -114.47) rotate(2.78)', 1, 2, 3, NULL, 16),
(2416, 1, '439.48', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1940.12,751.34l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 15),
(2417, 2, '450.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1941.83 723.82 1886.7 720.92 1885.29 748.17 1940.12 751.34 1941.83 723.82', 1, 0, 3, NULL, 15),
(2418, 3, '450.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1943.11 696.51 1888.04 693.67 1886.7 720.92 1941.8 723.43 1943.11 696.51', 1, 0, 3, NULL, 15),
(2419, 4, '439.48', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1944.44,669l-40-2s-14.75-1.33-15.58,12.67l-.83,14,55.07,2.84Z', 1, 1, 3, NULL, 15),
(2420, 5, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.12 -93.98) rotate(2.78)', 1, 2, 3, NULL, 16),
(2421, 6, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.2 -95.05) rotate(2.78)', 1, 2, 3, NULL, 16),
(2422, 7, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.29 -96.11) rotate(2.78)', 1, 2, 3, NULL, 16),
(2423, 8, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.37 -97.19) rotate(2.78)', 1, 2, 3, NULL, 16),
(2424, 9, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.45 -98.23) rotate(2.78)', 1, 2, 3, NULL, 16),
(2425, 10, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.53 -99.3) rotate(2.78)', 1, 2, 3, NULL, 16),
(2426, 11, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.6 -100.39) rotate(2.78)', 1, 2, 3, NULL, 16),
(2427, 12, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.68 -101.43) rotate(2.78)', 1, 2, 3, NULL, 16),
(2428, 13, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.78 -102.51) rotate(2.78)', 1, 2, 3, NULL, 16),
(2429, 14, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.84 -103.57) rotate(2.78)', 1, 2, 3, NULL, 16),
(2430, 15, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.91 -104.63) rotate(2.78)', 1, 2, 3, NULL, 16),
(2431, 16, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37 -105.7) rotate(2.78)', 1, 2, 3, NULL, 16),
(2432, 17, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.08 -106.74) rotate(2.78)', 1, 2, 3, NULL, 16),
(2433, 18, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.15 -107.79) rotate(2.78)', 1, 2, 3, NULL, 16),
(2434, 19, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(37.24 -108.83) rotate(2.78)', 1, 2, 3, NULL, 16),
(2435, 20, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.87 -108.64) rotate(2.78)', 1, 2, 3, NULL, 16),
(2436, 21, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.82 -107.6) rotate(2.78)', 1, 2, 3, NULL, 16),
(2437, 22, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.73 -106.54) rotate(2.78)', 1, 2, 3, NULL, 16),
(2438, 23, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.66 -105.51) rotate(2.78)', 1, 2, 3, NULL, 16),
(2439, 24, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.57 -104.42) rotate(2.78)', 1, 2, 3, NULL, 16),
(2440, 25, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.5 -103.36) rotate(2.78)', 1, 2, 3, NULL, 16),
(2441, 26, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.41 -102.29) rotate(2.78)', 1, 2, 3, NULL, 16),
(2442, 27, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.33 -101.23) rotate(2.78)', 1, 2, 3, NULL, 16),
(2443, 28, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.25 -100.17) rotate(2.78)', 1, 2, 3, NULL, 16),
(2444, 29, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.19 -99.1) rotate(2.78)', 1, 2, 3, NULL, 16),
(2445, 30, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.1 -98.04) rotate(2.78)', 1, 2, 3, NULL, 16),
(2446, 31, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.02 -96.98) rotate(2.78)', 1, 2, 3, NULL, 16),
(2447, 32, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.92 -95.93) rotate(2.78)', 1, 2, 3, NULL, 16),
(2448, 33, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.85 -94.85) rotate(2.78)', 1, 2, 3, NULL, 16),
(2449, 34, '360.00', 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(38.79 -93.79) rotate(2.78)', 1, 2, 3, NULL, 16),
(2450, 1, '439.48', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1933.45,882.41l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 16),
(2451, 2, '450.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1935.16 854.9 1880.04 852 1878.62 879.25 1933.45 882.41 1935.16 854.9', 1, 0, 3, NULL, 16),
(2452, 3, '450.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1936.44 827.58 1881.37 824.75 1880.04 852 1935.13 854.51 1936.44 827.58', 1, 0, 3, NULL, 16),
(2453, 4, '439.48', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1937.78,800.09l-40-2s-14.75-1.33-15.58,12.67l-.83,14,55.07,2.84Z', 1, 1, 3, NULL, 15),
(2454, 5, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.47 -93.51) rotate(2.78)', 1, 2, 3, NULL, 16),
(2455, 6, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.55 -94.57) rotate(2.78)', 1, 2, 3, NULL, 16),
(2456, 7, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.64 -95.63) rotate(2.78)', 1, 2, 3, NULL, 16),
(2457, 8, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.72 -96.71) rotate(2.78)', 1, 2, 3, NULL, 16),
(2458, 9, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.8 -97.76) rotate(2.78)', 1, 2, 3, NULL, 16),
(2459, 10, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.88 -98.82) rotate(2.78)', 1, 2, 3, NULL, 16),
(2460, 11, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.96 -99.91) rotate(2.78)', 1, 2, 3, NULL, 16),
(2461, 12, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.03 -100.95) rotate(2.78)', 1, 2, 3, NULL, 16),
(2462, 13, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.13 -102.03) rotate(2.78)', 1, 2, 3, NULL, 16),
(2463, 14, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.19 -103.09) rotate(2.78)', 1, 2, 3, NULL, 16),
(2464, 15, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.26 -104.15) rotate(2.78)', 1, 2, 3, NULL, 16),
(2465, 16, '374.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.53 -105.14) rotate(2.78)', 1, 2, 3, NULL, 16),
(2466, 17, '374.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.6 -106.1) rotate(2.78)', 1, 2, 3, NULL, 16),
(2467, 18, '432.27', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2268.67,844.17l6-10.34s5.17-13.5-10.5-16.67c-14.83-1-44.93-2.88-44.93-2.88l-1.32,27.2Z', 1, 1, 3, NULL, 15),
(2468, 19, '440.85', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2247.88 877.96 2268.67 844.17 2217.91 841.5 2216.19 877 2247.88 877.96', 1, 0, 3, NULL, 16),
(2469, 20, '380.98', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2235.17 897.33 2247.67 878.17 2176.68 875.08 2175.19 893.97 2235.17 897.33', 1, 0, 3, NULL, 16),
(2470, 21, '447.81', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2207.45,924s11,3.67,16.88-8.83c8-12.67,10.83-17.83,10.83-17.83l-60-3.36-1.36,27.9Z', 1, 1, 3, NULL, 16),
(2471, 22, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.92 -103.94) rotate(2.78)', 1, 2, 3, NULL, 16),
(2472, 23, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.85 -102.88) rotate(2.78)', 1, 2, 3, NULL, 16),
(2473, 24, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.76 -101.81) rotate(2.78)', 1, 2, 3, NULL, 16),
(2474, 25, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.68 -100.75) rotate(2.78)', 1, 2, 3, NULL, 16),
(2475, 26, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.6 -99.69) rotate(2.78)', 1, 2, 3, NULL, 16),
(2476, 27, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.54 -98.63) rotate(2.78)', 1, 2, 3, NULL, 16),
(2477, 28, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.45 -97.56) rotate(2.78)', 1, 2, 3, NULL, 16),
(2478, 29, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.38 -96.5) rotate(2.78)', 1, 2, 3, NULL, 16),
(2479, 30, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.28 -95.45) rotate(2.78)', 1, 2, 3, NULL, 16),
(2480, 31, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.2 -94.38) rotate(2.78)', 1, 2, 3, NULL, 16),
(2481, 32, '360.00', 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(45.14 -93.31) rotate(2.78)', 1, 2, 3, NULL, 16),
(2482, 1, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.15 -79.48) rotate(2.78)', 1, 2, 3, NULL, 15),
(2483, 2, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.5 -79.7) rotate(2.78)', 1, 2, 3, NULL, 15),
(2484, 3, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.58 -80.74) rotate(2.78)', 1, 2, 3, NULL, 15),
(2485, 4, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.69 -81.82) rotate(2.78)', 1, 2, 3, NULL, 15),
(2486, 5, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.74 -82.88) rotate(2.78)', 1, 2, 3, NULL, 15),
(2487, 6, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.81 -83.94) rotate(2.78)', 1, 2, 3, NULL, 15),
(2488, 7, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.9 -85.02) rotate(2.78)', 1, 2, 3, NULL, 15),
(2489, 8, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(41.98 -86.05) rotate(2.78)', 1, 2, 3, NULL, 15);
INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(2490, 9, '439.48', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1804.5,822.17l1.34-27.52,42,2.28s12.5.38,12.13,13.75-.62,14-.62,14Z', 1, 1, 3, NULL, 15),
(2491, 10, '450.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1857.92 852.06 1802.86 849.65 1804.5 822.17 1859.29 824.68 1857.92 852.06', 1, 0, 3, NULL, 16),
(2492, 11, '450.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1856.42 879.56 1801.56 876.51 1802.86 849.65 1857.92 852.06 1856.42 879.56', 1, 0, 3, NULL, 16),
(2493, 12, '439.48', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1800.2,904.42l40,1.89s15.5,1.5,15.88-12,.38-14.75.38-14.75l-54.86-3Z', 1, 1, 3, NULL, 16),
(2494, 13, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.63 -85.85) rotate(2.78)', 1, 2, 3, NULL, 16),
(2495, 14, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.56 -84.82) rotate(2.78)', 1, 2, 3, NULL, 16),
(2496, 15, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.47 -83.74) rotate(2.78)', 1, 2, 3, NULL, 16),
(2497, 16, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.4 -82.67) rotate(2.78)', 1, 2, 3, NULL, 16),
(2498, 17, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.31 -81.6) rotate(2.78)', 1, 2, 3, NULL, 16),
(2499, 18, '360.00', 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(44.23 -80.54) rotate(2.78)', 1, 2, 3, NULL, 16),
(2500, 1, '439.48', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1099.35,840.54l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 16),
(2501, 2, '450.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1101.06 813.02 1045.93 810.12 1044.51 837.37 1099.35 840.54 1101.06 813.02', 1, 0, 3, NULL, 16),
(2502, 3, '450.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1102.33 785.71 1047.26 782.87 1045.93 810.12 1101.03 812.63 1102.33 785.71', 1, 0, 3, NULL, 16),
(2503, 4, '439.48', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1103.67,758.21l-40-2s-14.75-1.33-15.58,12.67l-.83,14,55.07,2.84Z', 1, 1, 3, NULL, 16),
(2504, 5, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.45 -53.09) rotate(2.78)', 1, 2, 3, NULL, 16),
(2505, 6, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.53 -54.15) rotate(2.78)', 1, 2, 3, NULL, 16),
(2506, 7, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.63 -55.21) rotate(2.78)', 1, 2, 3, NULL, 16),
(2507, 8, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.71 -56.29) rotate(2.78)', 1, 2, 3, NULL, 16),
(2508, 9, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.79 -57.34) rotate(2.78)', 1, 2, 3, NULL, 16),
(2509, 10, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.86 -58.4) rotate(2.78)', 1, 2, 3, NULL, 16),
(2510, 11, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(39.94 -59.49) rotate(2.78)', 1, 2, 3, NULL, 16),
(2511, 12, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(40.02 -60.53) rotate(2.78)', 1, 2, 3, NULL, 16),
(2512, 13, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(40.11 -61.62) rotate(2.78)', 1, 2, 3, NULL, 16),
(2513, 14, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(40.18 -62.67) rotate(2.78)', 1, 2, 3, NULL, 16),
(2514, 15, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(40.25 -63.73) rotate(2.78)', 1, 2, 3, NULL, 16),
(2515, 16, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(40.34 -64.81) rotate(2.78)', 1, 2, 3, NULL, 16),
(2516, 17, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(40.41 -65.84) rotate(2.78)', 1, 2, 3, NULL, 16),
(2517, 18, '439.48', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1387.43,800.11l1.34-27.52,42,2.28s12.5.38,12.13,13.75-.62,14-.62,14Z', 1, 1, 3, NULL, 15),
(2518, 19, '450.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1440.85 830 1385.79 827.59 1387.43 800.11 1442.22 802.62 1440.85 830', 1, 0, 3, NULL, 15),
(2519, 20, '450.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1439.35 857.5 1384.48 854.45 1385.79 827.59 1440.85 830 1439.35 857.5', 1, 0, 3, NULL, 15),
(2520, 21, '439.48', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1383.13,882.36l40,1.89s15.5,1.5,15.88-12,.38-14.75.38-14.75l-54.86-3Z', 1, 1, 3, NULL, 15),
(2521, 22, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(43.07 -65.64) rotate(2.78)', 1, 2, 3, NULL, 16),
(2522, 23, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(1, 0.05, -0.05, 1, 43, -64.61)', 1, 2, 3, NULL, 16),
(2523, 24, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.91 -63.53) rotate(2.78)', 1, 2, 3, NULL, 16),
(2524, 25, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.84 -62.46) rotate(2.78)', 1, 2, 3, NULL, 16),
(2525, 26, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.74 -61.39) rotate(2.78)', 1, 2, 3, NULL, 16),
(2526, 27, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.67 -60.33) rotate(2.78)', 1, 2, 3, NULL, 16),
(2527, 28, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.59 -59.27) rotate(2.78)', 1, 2, 3, NULL, 16),
(2528, 29, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.53 -58.21) rotate(2.78)', 1, 2, 3, NULL, 16),
(2529, 30, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.44 -57.14) rotate(2.78)', 1, 2, 3, NULL, 16),
(2530, 31, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.36 -56.09) rotate(2.78)', 1, 2, 3, NULL, 16),
(2531, 32, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.26 -55.03) rotate(2.78)', 1, 2, 3, NULL, 16),
(2532, 33, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.18 -53.96) rotate(2.78)', 1, 2, 3, NULL, 16),
(2533, 34, '360.00', 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(42.12 -52.9) rotate(2.78)', 1, 2, 3, NULL, 16),
(2534, 1, '439.48', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1106,708.82l-1,27.51-42.2-2.1s-12.67-.58-12.17-14.58l.5-14Z', 1, 1, 3, NULL, 16),
(2535, 2, '450.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1107.72 681.3 1052.59 678.4 1051.18 705.65 1106.01 708.82 1107.72 681.3', 1, 0, 3, NULL, 16),
(2536, 3, '450.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1109 653.99 1053.93 651.15 1052.59 678.4 1107.69 680.92 1109 653.99', 1, 0, 3, NULL, 16),
(2537, 4, '439.48', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1110.33,626.49l-40-2s-14.75-1.33-15.58,12.67l-.83,14L1109,654Z', 1, 1, 3, NULL, 16),
(2538, 5, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.07 -53.57) rotate(2.78)', 1, 2, 3, NULL, 16),
(2539, 6, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.15 -54.63) rotate(2.78)', 1, 2, 3, NULL, 16),
(2540, 7, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.25 -55.69) rotate(2.78)', 1, 2, 3, NULL, 16),
(2541, 8, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.33 -56.77) rotate(2.78)', 1, 2, 3, NULL, 16),
(2542, 9, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.4 -57.82) rotate(2.78)', 1, 2, 3, NULL, 16),
(2543, 10, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.48 -58.88) rotate(2.78)', 1, 2, 3, NULL, 16),
(2544, 11, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.56 -59.97) rotate(2.78)', 1, 2, 3, NULL, 16),
(2545, 12, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.64 -61.01) rotate(2.78)', 1, 2, 3, NULL, 16),
(2546, 13, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.73 -62.09) rotate(2.78)', 1, 2, 3, NULL, 16),
(2547, 14, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.79 -63.15) rotate(2.78)', 1, 2, 3, NULL, 16),
(2548, 15, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.87 -64.21) rotate(2.78)', 1, 2, 3, NULL, 16),
(2549, 16, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(33.95 -65.29) rotate(2.78)', 1, 2, 3, NULL, 16),
(2550, 17, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(34.03 -66.32) rotate(2.78)', 1, 2, 3, NULL, 16),
(2551, 18, '439.48', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1394.09,668.39l1.34-27.52,42,2.28s12.5.38,12.13,13.75-.62,14-.62,14Z', 1, 1, 3, NULL, 15),
(2552, 19, '450.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1447.51 698.28 1392.45 695.87 1394.09 668.39 1448.88 670.9 1447.51 698.28', 1, 0, 3, NULL, 15),
(2553, 20, '450.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1446.01 725.78 1391.15 722.73 1392.45 695.87 1447.51 698.28 1446.01 725.78', 1, 0, 3, NULL, 15),
(2554, 21, '439.48', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1389.79,750.64l40,1.89s15.5,1.5,15.88-12,.38-14.75.38-14.75l-54.86-3Z', 1, 1, 3, NULL, 15),
(2555, 22, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.69 -66.12) rotate(2.78)', 1, 2, 3, NULL, 16),
(2556, 23, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(1, 0.05, -0.05, 1, 36.62, -65.09)', 1, 2, 3, NULL, 16),
(2557, 24, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.52 -64.01) rotate(2.78)', 1, 2, 3, NULL, 16),
(2558, 25, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.46 -62.94) rotate(2.78)', 1, 2, 3, NULL, 16),
(2559, 26, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.36 -61.87) rotate(2.78)', 1, 2, 3, NULL, 16),
(2560, 27, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.28 -60.81) rotate(2.78)', 1, 2, 3, NULL, 16),
(2561, 28, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.21 -59.75) rotate(2.78)', 1, 2, 3, NULL, 16),
(2562, 29, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.14 -58.69) rotate(2.78)', 1, 2, 3, NULL, 16),
(2563, 30, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(36.06 -57.62) rotate(2.78)', 1, 2, 3, NULL, 16),
(2564, 31, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.98 -56.56) rotate(2.78)', 1, 2, 3, NULL, 16),
(2565, 32, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.88 -55.51) rotate(2.78)', 1, 2, 3, NULL, 16),
(2566, 33, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.8 -54.44) rotate(2.78)', 1, 2, 3, NULL, 16),
(2567, 34, '360.00', 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(35.74 -53.37) rotate(2.78)', 1, 2, 3, NULL, 16),
(2568, 6, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2247.32 920.94 2235.22 939.79 2281.97 968.44 2293.68 949.34 2247.32 920.94', 1, 0, 3, NULL, 16),
(2569, 7, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(297.79 2383.38) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2570, 8, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(319.38 2384.23) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2571, 9, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(340.83 2385.06) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2572, 10, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2293.3 845.87 2281.83 864.59 2328.59 893.24 2340.22 875.04 2293.3 845.87', 1, 0, 3, NULL, 16),
(2573, 11, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(383.31 2387.12) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2574, 12, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(404.91 2388.32) rotate(-58.51)', 1, 2, 3, NULL, 15),
(2575, 13, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, '2328.07 790.51 2316.63 809.19 2363.46 837.88 2374.85 819.12 2328.07 790.51', 1, 0, 3, NULL, 15),
(2576, 14, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'translate(447.67 2390.38) rotate(-58.51)', 1, 2, 3, NULL, 15),
(2577, 15, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, '2351.36 752.98 2340.05 771.65 2387.05 800.44 2398.45 781.83 2351.36 752.98', 1, 0, 3, NULL, 15),
(2578, 16, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, '2363.33 734.23 2351.45 752.87 2398.45 781.66 2409.79 762.61 2363.33 734.23', 1, 0, 3, NULL, 15),
(2579, 17, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, '2374.73 715.62 2363.33 734.23 2409.79 762.87 2421.67 743.96 2374.73 715.62', 1, 0, 3, NULL, 15),
(2580, 18, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, '2386.42 697 2374.73 715.62 2421.28 744.49 2432.66 726.04 2386.42 697', 1, 0, 3, NULL, 15),
(2581, 19, '494.52', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'M2465.67,695.33l-66-3.33s-9-1.71-13.25,5l56.4,35.29Z', 1, 1, 3, NULL, 15),
(2582, 20, '657.95', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M2501.67,719.33s6.5-19.33-14.33-23.17c-6.33-.17-21.67-.83-21.67-.83l-22.85,37,36.54,22.49Z', 1, 1, 3, NULL, 16),
(2583, 21, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2432.66 726.04 2421.26 744.65 2468.26 773.44 2479.36 754.78 2432.66 726.04', 1, 0, 3, NULL, 16),
(2584, 22, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2421.26 744.65 2409.51 763.02 2456.51 791.81 2468.31 773.35 2421.26 744.65', 1, 0, 3, NULL, 16),
(2585, 23, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2409.51 763.02 2398.1 781.63 2444.84 810.86 2456.51 791.81 2409.51 763.02', 1, 0, 3, NULL, 16),
(2586, 24, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(466.68 2444.71) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2587, 25, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2386.25 800.98 2374.85 819.59 2421.48 848.42 2433.44 829.47 2386.25 800.98', 1, 0, 3, NULL, 16),
(2588, 26, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2374.85 819.12 2363.52 837.67 2410.09 866.72 2421.48 848.42 2374.85 819.12', 1, 0, 3, NULL, 16),
(2589, 27, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2363.42 837.57 2351.92 856.36 2398.55 885.55 2410.09 866.72 2363.42 837.57', 1, 0, 3, NULL, 16),
(2590, 28, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(381.23 2440.79) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2591, 29, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2340.15 875 2328.44 893.56 2375.5 922.39 2387.23 903.74 2340.15 875', 1, 0, 3, NULL, 16),
(2592, 30, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(338.23 2438.94) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2593, 31, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(317.27 2438.12) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2594, 32, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(295.67 2436.73) rotate(-58.51)', 1, 2, 3, NULL, 16),
(2595, 33, '360.00', 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '2293.88 949.5 2282.14 968.17 2328.74 996.55 2340.01 978.16 2293.88 949.5', 1, 0, 3, NULL, 16),
(2596, 2, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-610.32 769.18) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2597, 3, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-602.51 762.4) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2598, 4, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-594.58 755.64) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2599, 5, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-586.77 748.87) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2600, 6, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-578.84 742.1) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2601, 7, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-571.02 735.33) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2602, 8, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-563.1 728.57) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2603, 9, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-555.29 721.8) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2604, 10, '450.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M111.88,640.08,99,639.5a6.61,6.61,0,0,0-6,5l-.35,4.07,18.82.93Z', 1, 1, 1, NULL, 13),
(2605, 11, '450.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M111.88,640.08l14.4.7a5.33,5.33,0,0,1,4.18,5l-.23,4.59-18.82-.93Z', 1, 1, 1, NULL, 13),
(2606, 12, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-538.34 741.44) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2607, 13, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-546.22 748.27) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2608, 14, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-554.08 754.98) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2609, 15, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, -561.95, 761.8)', 1, 2, 1, NULL, 13),
(2610, 16, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-569.82 768.52) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2611, 17, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-577.7 775.34) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2612, 18, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-585.56 782.05) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2613, 19, '360.00', 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-593.38 788.82) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2614, 1, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M94.2,612.69l-.64,13s-.35,6,5.81,6l3.25.17.93-18.82Z', 1, 1, 1, NULL, 13),
(2615, 2, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-510.08 682.58) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2616, 3, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-502.16 675.82) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2617, 4, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-494.34 669.05) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2618, 5, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-486.42 662.28) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2619, 6, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-478.58 655.44) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2620, 7, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-470.77 648.67) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2621, 8, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-462.84 641.9) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2622, 9, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-455.03 635.13) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2623, 10, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-447.1 628.37) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2624, 11, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-439.29 621.6) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2625, 12, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-431.36 614.83) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2626, 13, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-423.55 608.06) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2627, 14, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M98.67,522.44l.7-13.36a5.7,5.7,0,0,1,6.27-5.17l3.37.17-1,18.82Z', 1, 1, 1, NULL, 13),
(2628, 15, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '109.06 504.09 108.07 522.91 117.48 523.37 118.47 504.56 109.06 504.09', 1, 0, 1, NULL, 13),
(2629, 16, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '118.47 504.56 117.48 523.37 126.89 523.84 127.88 505.02 118.47 504.56', 1, 0, 1, NULL, 13),
(2630, 17, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M127.88,505l5,.23s4.41-.06,4.12,5.28l-.75,13.76-9.41-.46Z', 1, 1, 1, NULL, 13),
(2631, 18, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-406.6 627.71) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2632, 19, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-414.48 634.53) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2633, 20, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-422.34 641.24) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2634, 21, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-430.22 648.07) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2635, 22, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, -438.08, 654.78)', 1, 2, 1, NULL, 13),
(2636, 23, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-445.9 661.55) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2637, 24, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-453.83 668.32) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2638, 25, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, -461.64, 675.09)', 1, 2, 1, NULL, 13),
(2639, 26, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-469.47 681.93) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2640, 27, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-477.4 688.7) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2641, 28, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-485.21 695.47) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2642, 29, '360.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-493.14 702.23) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2643, 30, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M121.49,632.9l4.82.23s4.88.41,4.88-5.17l.7-13.36-9.41-.46Z', 1, 1, 1, NULL, 13),
(2644, 31, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '113.01 613.62 112.08 632.37 121.49 632.9 122.42 614.08 113.01 613.62', 1, 0, 1, NULL, 13),
(2645, 32, '450.00', 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '103.6 613.15 102.67 631.91 112.08 632.37 113.01 613.62 103.6 613.15', 1, 0, 1, NULL, 13),
(2646, 1, '450.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M100.63,482.93l-.41,5.75s-.7,7,7,8l6.16.06.64-13.18Z', 1, 1, 1, NULL, 13),
(2647, 2, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-374.31 565.72) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2648, 3, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-366.49 558.95) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2649, 4, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-358.57 552.18) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2650, 5, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-350.75 545.41) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2651, 6, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-342.82 538.65) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2652, 7, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-335.01 531.87) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2653, 8, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-327.09 525.11) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2654, 9, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-319.27 518.34) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2655, 10, '450.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M122.93,414.29,110,413.71a6.61,6.61,0,0,0-6,5l-.35,4.07,18.82.93Z', 1, 1, 1, NULL, 13),
(2656, 11, '450.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M122.93,414.29l14.4.7a5.33,5.33,0,0,1,4.18,5l-.23,4.59-18.82-.93Z', 1, 1, 1, NULL, 13),
(2657, 12, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-302.33 537.99) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2658, 13, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'matrix(0.05, -1, 1, 0.05, -310.2, 544.81)', 1, 2, 1, NULL, 13),
(2659, 14, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-318.07 551.52) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2660, 15, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-325.94 558.35) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2661, 16, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-333.81 565.06) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2662, 17, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-341.68 571.88) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2663, 18, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-349.55 578.59) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2664, 19, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-357.36 585.37) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2665, 20, '450.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M124.15,497.27l6.16.29s7.08-.06,7.61-7.32l.29-5.46-13.41-.64Z', 1, 1, 1, NULL, 13),
(2666, 21, '360.00', 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'translate(-376.68 584.9) rotate(-87.13)', 1, 2, 1, NULL, 13),
(2667, 1, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M165.85,453.75l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2668, 2, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '166.78 434.94 166.32 444.34 147.56 443.42 148.02 434.01 166.78 434.94', 1, 0, 1, NULL, 13),
(2669, 3, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '148.49 424.66 148.02 434.01 166.78 434.94 167.25 425.59 148.49 424.66', 1, 0, 1, NULL, 13),
(2670, 4, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M167.77,416.12l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2671, 5, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '167.77 416.12 166.84 434.94 174.33 435.34 175.26 416.53 167.77 416.12', 1, 0, 1, NULL, 13),
(2672, 6, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '175.26 416.53 174.33 435.34 181.82 435.69 182.81 416.88 175.26 416.53', 1, 0, 1, NULL, 13),
(2673, 7, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '182.81 416.88 181.88 435.69 189.37 436.1 190.3 417.28 182.81 416.88', 1, 0, 1, NULL, 13),
(2674, 8, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '190.3 417.28 189.37 436.1 196.92 436.45 197.85 417.63 190.3 417.28', 1, 0, 1, NULL, 13),
(2675, 9, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '197.85 417.63 196.92 436.45 204.41 436.85 205.34 418.04 197.85 417.63', 1, 0, 1, NULL, 13),
(2676, 10, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '205.34 418.04 204.41 436.85 211.96 437.2 212.89 418.39 205.34 418.04', 1, 0, 1, NULL, 13),
(2677, 11, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '212.89 418.39 211.96 437.2 219.45 437.61 220.38 418.79 212.89 418.39', 1, 0, 1, NULL, 13),
(2678, 12, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '220.38 418.79 219.45 437.61 227 437.96 227.93 419.14 220.38 418.79', 1, 0, 1, NULL, 13),
(2679, 13, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '227.93 419.14 227 437.96 234.49 438.36 235.42 419.55 227.93 419.14', 1, 0, 1, NULL, 13),
(2680, 14, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '235.42 419.55 234.55 438.36 242.04 438.71 242.97 419.9 235.42 419.55', 1, 0, 1, NULL, 13),
(2681, 15, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '242.97 419.9 242.04 438.71 249.53 439.06 250.46 420.3 242.97 419.9', 1, 0, 1, NULL, 13),
(2682, 16, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '250.52 420.3 249.59 439.06 257.08 439.47 258.01 420.65 250.52 420.3', 1, 0, 1, NULL, 13),
(2683, 17, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '258.01 420.65 257.08 439.47 264.57 439.81 265.56 421.06 258.01 420.65', 1, 0, 1, NULL, 13),
(2684, 18, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M265.56,421.06l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(2685, 19, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '265.04 430.46 264.57 439.87 283.39 440.8 283.85 431.39 265.04 430.46', 1, 0, 1, NULL, 13),
(2686, 20, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '264.57 439.87 264.11 449.34 282.92 450.21 283.39 440.8 264.57 439.87', 1, 0, 1, NULL, 13),
(2687, 21, '450.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M264.11,449.34l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(2688, 22, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '257.08 439.47 256.15 458.28 263.64 458.63 264.57 439.87 257.08 439.47', 1, 0, 1, NULL, 13),
(2689, 23, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '249.53 439.12 248.6 457.88 256.09 458.28 257.08 439.47 249.53 439.12', 1, 0, 1, NULL, 13),
(2690, 24, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '241.98 438.71 241.05 457.53 248.6 457.88 249.53 439.12 241.98 438.71', 1, 0, 1, NULL, 13),
(2691, 25, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '234.49 438.36 233.56 457.12 241.05 457.53 241.98 438.71 234.49 438.36', 1, 0, 1, NULL, 13),
(2692, 26, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '226.94 437.96 226.01 456.77 233.5 457.12 234.49 438.36 226.94 437.96', 1, 0, 1, NULL, 13),
(2693, 27, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '219.45 437.61 218.52 456.37 226.01 456.77 226.94 437.96 219.45 437.61', 1, 0, 1, NULL, 13),
(2694, 28, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '211.9 437.2 210.97 456.02 218.52 456.37 219.45 437.61 211.9 437.2', 1, 0, 1, NULL, 13),
(2695, 29, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '204.41 436.85 203.48 455.61 210.97 456.02 211.9 437.2 204.41 436.85', 1, 0, 1, NULL, 13),
(2696, 30, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '196.86 436.45 195.93 455.26 203.42 455.61 204.41 436.85 196.86 436.45', 1, 0, 1, NULL, 13),
(2697, 31, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '189.37 436.1 188.44 454.86 195.93 455.26 196.86 436.45 189.37 436.1', 1, 0, 1, NULL, 13),
(2698, 32, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '181.82 435.69 180.89 454.51 188.44 454.86 189.37 436.1 181.82 435.69', 1, 0, 1, NULL, 13),
(2699, 33, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '174.33 435.34 173.4 454.1 180.89 454.51 181.82 435.69 174.33 435.34', 1, 0, 1, NULL, 13),
(2700, 34, '360.00', 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '166.78 434.94 165.85 453.75 173.4 454.1 174.33 435.34 166.78 434.94', 1, 0, 1, NULL, 13),
(2701, 1, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M164.12,499.6l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2702, 2, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '165.05 480.79 164.59 490.2 145.83 489.27 146.29 479.86 165.05 480.79', 1, 0, 1, NULL, 13),
(2703, 3, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '146.76 470.51 146.29 479.86 165.05 480.79 165.51 471.44 146.76 470.51', 1, 0, 1, NULL, 13),
(2704, 4, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M166,462l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2705, 5, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '166.04 461.97 165.11 480.79 172.6 481.19 173.53 462.38 166.04 461.97', 1, 0, 1, NULL, 13),
(2706, 6, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '173.53 462.38 172.6 481.19 180.09 481.54 181.08 462.73 173.53 462.38', 1, 0, 1, NULL, 13),
(2707, 7, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '181.08 462.73 180.15 481.54 187.64 481.95 188.57 463.13 181.08 462.73', 1, 0, 1, NULL, 13),
(2708, 8, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '188.57 463.13 187.64 481.95 195.19 482.3 196.12 463.48 188.57 463.13', 1, 0, 1, NULL, 13),
(2709, 9, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '196.12 463.48 195.19 482.3 202.68 482.7 203.61 463.89 196.12 463.48', 1, 0, 1, NULL, 13),
(2710, 10, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '203.61 463.89 202.68 482.7 210.23 483.05 211.16 464.24 203.61 463.89', 1, 0, 1, NULL, 13),
(2711, 11, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '211.16 464.24 210.23 483.05 217.72 483.46 218.65 464.64 211.16 464.24', 1, 0, 1, NULL, 13),
(2712, 12, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '218.65 464.64 217.72 483.46 225.27 483.81 226.2 464.99 218.65 464.64', 1, 0, 1, NULL, 13),
(2713, 13, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '226.2 464.99 225.27 483.81 232.76 484.21 233.69 465.4 226.2 464.99', 1, 0, 1, NULL, 13),
(2714, 14, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '233.69 465.4 232.82 484.21 240.31 484.56 241.24 465.75 233.69 465.4', 1, 0, 1, NULL, 13),
(2715, 15, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '241.24 465.75 240.31 484.56 247.8 484.91 248.73 466.15 241.24 465.75', 1, 0, 1, NULL, 13),
(2716, 16, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '248.79 466.15 247.86 484.91 255.35 485.32 256.28 466.5 248.79 466.15', 1, 0, 1, NULL, 13),
(2717, 17, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '256.28 466.5 255.35 485.32 262.84 485.67 263.83 466.91 256.28 466.5', 1, 0, 1, NULL, 13),
(2718, 18, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M263.83,466.91l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(2719, 19, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '263.31 476.32 262.84 485.73 281.66 486.65 282.12 477.25 263.31 476.32', 1, 0, 1, NULL, 13),
(2720, 20, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '262.84 485.73 262.38 495.19 281.19 496.06 281.66 486.65 262.84 485.73', 1, 0, 1, NULL, 13),
(2721, 21, '450.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M262.38,495.19l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(2722, 22, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '255.35 485.32 254.42 504.13 261.91 504.48 262.84 485.73 255.35 485.32', 1, 0, 1, NULL, 13),
(2723, 23, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '247.8 484.97 246.87 503.73 254.36 504.13 255.35 485.32 247.8 484.97', 1, 0, 1, NULL, 13),
(2724, 24, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '240.25 484.56 239.32 503.38 246.87 503.73 247.8 484.97 240.25 484.56', 1, 0, 1, NULL, 13),
(2725, 25, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '232.76 484.21 231.83 502.97 239.32 503.38 240.25 484.56 232.76 484.21', 1, 0, 1, NULL, 13),
(2726, 26, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '225.21 483.81 224.28 502.62 231.77 502.97 232.76 484.21 225.21 483.81', 1, 0, 1, NULL, 13),
(2727, 27, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '217.72 483.46 216.79 502.22 224.28 502.62 225.21 483.81 217.72 483.46', 1, 0, 1, NULL, 13),
(2728, 28, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '210.17 483.05 209.24 501.87 216.79 502.22 217.72 483.46 210.17 483.05', 1, 0, 1, NULL, 13),
(2729, 29, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '202.68 482.7 201.75 501.46 209.24 501.87 210.17 483.05 202.68 482.7', 1, 0, 1, NULL, 13),
(2730, 30, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '195.13 482.3 194.2 501.11 201.69 501.46 202.68 482.7 195.13 482.3', 1, 0, 1, NULL, 13),
(2731, 31, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '187.64 481.95 186.71 500.71 194.2 501.11 195.13 482.3 187.64 481.95', 1, 0, 1, NULL, 13),
(2732, 32, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '180.09 481.54 179.16 500.36 186.71 500.71 187.64 481.95 180.09 481.54', 1, 0, 1, NULL, 13),
(2733, 33, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '172.6 481.19 171.67 499.95 179.16 500.36 180.09 481.54 172.6 481.19', 1, 0, 1, NULL, 13),
(2734, 34, '360.00', 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '165.05 480.79 164.12 499.6 171.67 499.95 172.6 481.19 165.05 480.79', 1, 0, 1, NULL, 13),
(2735, 1, '450.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M161.86,544.53l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2736, 2, '450.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '162.79 525.71 162.32 535.12 143.57 534.19 144.03 524.78 162.79 525.71', 1, 0, 1, NULL, 13),
(2737, 3, '450.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '144.5 515.43 144.03 524.78 162.79 525.71 163.25 516.36 144.5 515.43', 1, 0, 1, NULL, 13),
(2738, 4, '450.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M163.78,506.9l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2739, 5, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '163.78 506.9 162.85 525.71 170.34 526.12 171.27 507.3 163.78 506.9', 1, 0, 1, NULL, 13),
(2740, 6, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '171.27 507.3 170.34 526.12 177.83 526.47 178.82 507.65 171.27 507.3', 1, 0, 1, NULL, 13),
(2741, 7, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '178.82 507.65 177.89 526.47 185.38 526.87 186.31 508.06 178.82 507.65', 1, 0, 1, NULL, 13),
(2742, 8, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '186.31 508.06 185.38 526.87 192.93 527.22 193.86 508.41 186.31 508.06', 1, 0, 1, NULL, 13),
(2743, 9, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '193.86 508.41 192.93 527.22 200.42 527.63 201.35 508.81 193.86 508.41', 1, 0, 1, NULL, 13),
(2744, 10, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '201.35 508.81 200.42 527.63 207.97 527.98 208.9 509.16 201.35 508.81', 1, 0, 1, NULL, 13),
(2745, 11, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '208.9 509.16 207.97 527.98 215.46 528.38 216.39 509.57 208.9 509.16', 1, 0, 1, NULL, 13),
(2746, 12, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '216.39 509.57 215.46 528.38 223.01 528.73 223.94 509.92 216.39 509.57', 1, 0, 1, NULL, 13),
(2747, 13, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '223.94 509.92 223.01 528.73 230.5 529.14 231.43 510.32 223.94 509.92', 1, 0, 1, NULL, 13),
(2748, 14, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '231.43 510.32 230.56 529.14 238.05 529.49 238.98 510.67 231.43 510.32', 1, 0, 1, NULL, 13),
(2749, 15, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '238.98 510.67 238.05 529.49 245.54 529.84 246.47 511.08 238.98 510.67', 1, 0, 1, NULL, 13),
(2750, 16, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '246.53 511.08 245.6 529.84 253.09 530.24 254.02 511.43 246.53 511.08', 1, 0, 1, NULL, 13),
(2751, 17, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '254.02 511.43 253.09 530.24 260.58 530.59 261.57 511.83 254.02 511.43', 1, 0, 1, NULL, 13),
(2752, 22, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '253.09 530.24 252.16 549.06 259.65 549.4 260.58 530.65 253.09 530.24', 1, 0, 1, NULL, 13),
(2753, 23, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '245.54 529.89 244.61 548.65 252.1 549.06 253.09 530.24 245.54 529.89', 1, 0, 1, NULL, 13),
(2754, 24, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '237.99 529.49 237.06 548.3 244.61 548.65 245.54 529.89 237.99 529.49', 1, 0, 1, NULL, 13),
(2755, 25, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '230.5 529.14 229.57 547.9 237.06 548.3 237.99 529.49 230.5 529.14', 1, 0, 1, NULL, 13),
(2756, 26, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '222.95 528.73 222.02 547.55 229.51 547.9 230.5 529.14 222.95 528.73', 1, 0, 1, NULL, 13),
(2757, 27, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '215.46 528.38 214.53 547.14 222.02 547.55 222.95 528.73 215.46 528.38', 1, 0, 1, NULL, 13),
(2758, 28, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '207.91 527.98 206.98 546.79 214.53 547.14 215.46 528.38 207.91 527.98', 1, 0, 1, NULL, 13),
(2759, 29, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '200.42 527.63 199.49 546.39 206.98 546.79 207.91 527.98 200.42 527.63', 1, 0, 1, NULL, 13),
(2760, 30, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '192.87 527.22 191.94 546.04 199.43 546.39 200.42 527.63 192.87 527.22', 1, 0, 1, NULL, 13),
(2761, 31, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '185.38 526.87 184.45 545.63 191.94 546.04 192.87 527.22 185.38 526.87', 1, 0, 1, NULL, 13),
(2762, 32, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '177.83 526.47 176.9 545.28 184.45 545.63 185.38 526.87 177.83 526.47', 1, 0, 1, NULL, 13),
(2763, 33, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '170.34 526.12 169.41 544.88 176.9 545.28 177.83 526.47 170.34 526.12', 1, 0, 1, NULL, 13),
(2764, 34, '360.00', 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '162.79 525.71 161.86 544.53 169.41 544.88 170.34 526.12 162.79 525.71', 1, 0, 1, NULL, 13),
(2765, 1, '450.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M159.07,589.4l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2766, 2, '450.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '160 570.59 159.54 579.99 140.78 579.07 141.25 569.66 160 570.59', 1, 0, 1, NULL, 13),
(2767, 3, '450.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '141.71 560.31 141.25 569.66 160 570.59 160.47 561.24 141.71 560.31', 1, 0, 1, NULL, 13),
(2768, 4, '450.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M161,551.77l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2769, 5, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '160.99 551.77 160.06 570.59 167.55 570.99 168.48 552.18 160.99 551.77', 1, 0, 1, NULL, 13),
(2770, 6, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '168.48 552.18 167.55 570.99 175.04 571.34 176.03 552.53 168.48 552.18', 1, 0, 1, NULL, 13),
(2771, 7, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, '176.03 552.53 175.1 571.34 182.59 571.75 183.52 552.93 176.03 552.53', 1, 0, 1, NULL, 13),
(2772, 8, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '183.52 552.93 182.59 571.75 190.14 572.1 191.07 553.28 183.52 552.93', 1, 0, 1, NULL, 13),
(2773, 9, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '191.07 553.28 190.14 572.1 197.63 572.5 198.56 553.69 191.07 553.28', 1, 0, 1, NULL, 13),
(2774, 10, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '198.56 553.69 197.63 572.5 205.18 572.85 206.11 554.04 198.56 553.69', 1, 0, 1, NULL, 13),
(2775, 11, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '206.11 554.04 205.18 572.85 212.68 573.26 213.6 554.44 206.11 554.04', 1, 0, 1, NULL, 13),
(2776, 12, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '213.6 554.44 212.68 573.26 220.22 573.61 221.15 554.79 213.6 554.44', 1, 0, 1, NULL, 13),
(2777, 13, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '221.15 554.79 220.22 573.61 227.72 574.01 228.64 555.2 221.15 554.79', 1, 0, 1, NULL, 13),
(2778, 14, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '228.64 555.2 227.77 574.01 235.26 574.36 236.19 555.55 228.64 555.2', 1, 0, 1, NULL, 13),
(2779, 15, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '236.19 555.55 235.26 574.36 242.76 574.71 243.69 555.95 236.19 555.55', 1, 0, 1, NULL, 13),
(2780, 16, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '243.74 555.95 242.81 574.71 250.31 575.12 251.23 556.3 243.74 555.95', 1, 0, 1, NULL, 13),
(2781, 17, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '251.23 556.3 250.31 575.12 257.8 575.46 258.78 556.71 251.23 556.3', 1, 0, 1, NULL, 13),
(2782, 19, '450.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '258.26 566.12 257.8 575.52 276.61 576.45 277.08 567.04 258.26 566.12', 1, 0, 1, NULL, 13),
(2783, 20, '450.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '257.8 575.52 257.33 584.99 276.15 585.86 276.61 576.45 257.8 575.52', 1, 0, 1, NULL, 13),
(2784, 21, '450.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M257.33,585l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(2785, 22, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '250.31 575.12 249.38 593.93 256.87 594.28 257.8 575.52 250.31 575.12', 1, 0, 1, NULL, 13),
(2786, 23, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '242.76 574.77 241.83 593.52 249.32 593.93 250.31 575.12 242.76 574.77', 1, 0, 1, NULL, 13),
(2787, 24, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '235.21 574.36 234.28 593.18 241.83 593.52 242.76 574.77 235.21 574.36', 1, 0, 1, NULL, 13),
(2788, 25, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '227.72 574.01 226.79 592.77 234.28 593.18 235.21 574.36 227.72 574.01', 1, 0, 1, NULL, 13),
(2789, 26, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '220.17 573.61 219.24 592.42 226.73 592.77 227.72 574.01 220.17 573.61', 1, 0, 1, NULL, 13),
(2790, 27, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '212.68 573.26 211.75 592.01 219.24 592.42 220.17 573.61 212.68 573.26', 1, 0, 1, NULL, 13),
(2791, 28, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '205.13 572.85 204.2 591.67 211.75 592.01 212.68 573.26 205.13 572.85', 1, 0, 1, NULL, 13),
(2792, 29, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '197.63 572.5 196.71 591.26 204.2 591.67 205.13 572.85 197.63 572.5', 1, 0, 1, NULL, 13),
(2793, 30, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '190.09 572.1 189.16 590.91 196.65 591.26 197.63 572.5 190.09 572.1', 1, 0, 1, NULL, 13),
(2794, 31, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '182.59 571.75 181.66 590.5 189.16 590.91 190.09 572.1 182.59 571.75', 1, 0, 1, NULL, 13),
(2795, 32, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '175.04 571.34 174.12 590.16 181.66 590.5 182.59 571.75 175.04 571.34', 1, 0, 1, NULL, 13),
(2796, 33, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '167.55 570.99 166.62 589.75 174.12 590.16 175.04 571.34 167.55 570.99', 1, 0, 1, NULL, 13),
(2797, 34, '360.00', 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '160 570.59 159.07 589.4 166.62 589.75 167.55 570.99 160 570.59', 1, 0, 1, NULL, 13),
(2798, 1, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M157.16,634.89l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2799, 2, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '158.09 616.07 157.62 625.48 138.87 624.55 139.33 615.14 158.09 616.07', 1, 0, 1, NULL, 13),
(2800, 3, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '139.79 605.79 139.33 615.14 158.09 616.07 158.55 606.72 139.79 605.79', 1, 0, 1, NULL, 13),
(2801, 4, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M159.07,597.26l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2802, 5, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '159.07 597.26 158.15 616.07 165.64 616.48 166.57 597.66 159.07 597.26', 1, 0, 1, NULL, 13),
(2803, 6, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '166.57 597.66 165.64 616.48 173.13 616.83 174.12 598.01 166.57 597.66', 1, 0, 1, NULL, 13),
(2804, 7, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '174.12 598.01 173.19 616.83 180.68 617.23 181.61 598.42 174.12 598.01', 1, 0, 1, NULL, 13),
(2805, 8, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '181.61 598.42 180.68 617.23 188.23 617.58 189.16 598.77 181.61 598.42', 1, 0, 1, NULL, 13),
(2806, 9, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '189.16 598.77 188.23 617.58 195.72 617.99 196.65 599.17 189.16 598.77', 1, 0, 1, NULL, 13),
(2807, 10, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '196.65 599.17 195.72 617.99 203.27 618.34 204.2 599.52 196.65 599.17', 1, 0, 1, NULL, 13),
(2808, 11, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '204.2 599.52 203.27 618.34 210.76 618.74 211.69 599.93 204.2 599.52', 1, 0, 1, NULL, 13),
(2809, 12, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '211.69 599.93 210.76 618.74 218.31 619.09 219.24 600.28 211.69 599.93', 1, 0, 1, NULL, 13),
(2810, 13, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '219.24 600.28 218.31 619.09 225.8 619.5 226.73 600.68 219.24 600.28', 1, 0, 1, NULL, 13),
(2811, 14, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '226.73 600.68 225.86 619.5 233.35 619.85 234.28 601.03 226.73 600.68', 1, 0, 1, NULL, 13),
(2812, 15, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '234.28 601.03 233.35 619.85 240.84 620.2 241.77 601.44 234.28 601.03', 1, 0, 1, NULL, 13),
(2813, 16, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '241.83 601.44 240.9 620.2 248.39 620.6 249.32 601.79 241.83 601.44', 1, 0, 1, NULL, 13),
(2814, 17, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '249.32 601.79 248.39 620.6 255.88 620.95 256.87 602.19 249.32 601.79', 1, 0, 1, NULL, 13),
(2815, 18, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M256.87,602.19l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(2816, 19, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '256.34 611.6 255.88 621.01 274.69 621.94 275.16 612.53 256.34 611.6', 1, 0, 1, NULL, 13),
(2817, 20, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '255.88 621.01 255.41 630.47 274.23 631.34 274.69 621.94 255.88 621.01', 1, 0, 1, NULL, 13),
(2818, 21, '450.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M255.42,630.47l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(2819, 22, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '248.39 620.6 247.46 639.42 254.95 639.76 255.88 621.01 248.39 620.6', 1, 0, 1, NULL, 13),
(2820, 23, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '240.84 620.25 239.91 639.01 247.4 639.42 248.39 620.6 240.84 620.25', 1, 0, 1, NULL, 13),
(2821, 24, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '233.29 619.85 232.36 638.66 239.91 639.01 240.84 620.25 233.29 619.85', 1, 0, 1, NULL, 13),
(2822, 25, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '225.8 619.5 224.87 638.25 232.36 638.66 233.29 619.85 225.8 619.5', 1, 0, 1, NULL, 13),
(2823, 26, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '218.25 619.09 217.32 637.91 224.81 638.25 225.8 619.5 218.25 619.09', 1, 0, 1, NULL, 13),
(2824, 27, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '210.76 618.74 209.83 637.5 217.32 637.91 218.25 619.09 210.76 618.74', 1, 0, 1, NULL, 13),
(2825, 28, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '203.21 618.34 202.28 637.15 209.83 637.5 210.76 618.74 203.21 618.34', 1, 0, 1, NULL, 13),
(2826, 29, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '195.72 617.99 194.79 636.75 202.28 637.15 203.21 618.34 195.72 617.99', 1, 0, 1, NULL, 13),
(2827, 30, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '188.17 617.58 187.24 636.4 194.73 636.75 195.72 617.99 188.17 617.58', 1, 0, 1, NULL, 13),
(2828, 31, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '180.68 617.23 179.75 635.99 187.24 636.4 188.17 617.58 180.68 617.23', 1, 0, 1, NULL, 13);
INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(2829, 32, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '173.13 616.83 172.2 635.64 179.75 635.99 180.68 617.23 173.13 616.83', 1, 0, 1, NULL, 13),
(2830, 33, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '165.64 616.48 164.71 635.24 172.2 635.64 173.13 616.83 165.64 616.48', 1, 0, 1, NULL, 13),
(2831, 34, '360.00', 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '158.09 616.07 157.16 634.89 164.71 635.24 165.64 616.48 158.09 616.07', 1, 0, 1, NULL, 13),
(2832, 1, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M155,679.89l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2833, 2, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '155.95 661.07 155.48 670.48 136.73 669.55 137.19 660.14 155.95 661.07', 1, 0, 1, NULL, 13),
(2834, 3, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '137.66 650.79 137.19 660.14 155.95 661.07 156.41 651.72 137.66 650.79', 1, 0, 1, NULL, 13),
(2835, 4, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M156.94,642.26l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2836, 5, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '156.94 642.26 156.01 661.07 163.5 661.48 164.43 642.66 156.94 642.26', 1, 0, 1, NULL, 13),
(2837, 6, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '164.43 642.66 163.5 661.48 170.99 661.83 171.98 643.01 164.43 642.66', 1, 0, 1, NULL, 13),
(2838, 7, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '171.98 643.01 171.05 661.83 178.54 662.23 179.47 643.42 171.98 643.01', 1, 0, 1, NULL, 13),
(2839, 8, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '179.47 643.42 178.54 662.23 186.09 662.58 187.02 643.77 179.47 643.42', 1, 0, 1, NULL, 13),
(2840, 9, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '187.02 643.77 186.09 662.58 193.58 662.99 194.51 644.17 187.02 643.77', 1, 0, 1, NULL, 13),
(2841, 10, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '194.51 644.17 193.58 662.99 201.13 663.34 202.06 644.52 194.51 644.17', 1, 0, 1, NULL, 13),
(2842, 11, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '202.06 644.52 201.13 663.34 208.62 663.74 209.55 644.93 202.06 644.52', 1, 0, 1, NULL, 13),
(2843, 12, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '209.55 644.93 208.62 663.74 216.17 664.09 217.1 645.28 209.55 644.93', 1, 0, 1, NULL, 13),
(2844, 13, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '217.1 645.28 216.17 664.09 223.66 664.5 224.59 645.68 217.1 645.28', 1, 0, 1, NULL, 13),
(2845, 14, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '224.59 645.68 223.72 664.5 231.21 664.85 232.14 646.03 224.59 645.68', 1, 0, 1, NULL, 13),
(2846, 15, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '232.14 646.03 231.21 664.85 238.7 665.2 239.63 646.44 232.14 646.03', 1, 0, 1, NULL, 13),
(2847, 16, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '239.69 646.44 238.76 665.2 246.25 665.6 247.18 646.79 239.69 646.44', 1, 0, 1, NULL, 13),
(2848, 17, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '247.18 646.79 246.25 665.6 253.74 665.95 254.73 647.19 247.18 646.79', 1, 0, 1, NULL, 13),
(2849, 18, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M254.73,647.19l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(2850, 19, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '254.21 656.6 253.74 666.01 272.56 666.94 273.02 657.53 254.21 656.6', 1, 0, 1, NULL, 13),
(2851, 20, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '253.74 666.01 253.28 675.48 272.09 676.35 272.56 666.94 253.74 666.01', 1, 0, 1, NULL, 13),
(2852, 21, '450.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M253.28,675.47l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(2853, 22, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '246.25 665.6 245.32 684.42 252.81 684.77 253.74 666.01 246.25 665.6', 1, 0, 1, NULL, 13),
(2854, 23, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '238.7 665.25 237.77 684.01 245.26 684.42 246.25 665.6 238.7 665.25', 1, 0, 1, NULL, 13),
(2855, 24, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '231.15 664.85 230.22 683.66 237.77 684.01 238.7 665.25 231.15 664.85', 1, 0, 1, NULL, 13),
(2856, 25, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '223.66 664.5 222.73 683.26 230.22 683.66 231.15 664.85 223.66 664.5', 1, 0, 1, NULL, 13),
(2857, 26, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '216.11 664.09 215.18 682.91 222.67 683.26 223.66 664.5 216.11 664.09', 1, 0, 1, NULL, 13),
(2858, 27, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '208.62 663.74 207.69 682.5 215.18 682.91 216.11 664.09 208.62 663.74', 1, 0, 1, NULL, 13),
(2859, 28, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '201.07 663.34 200.14 682.15 207.69 682.5 208.62 663.74 201.07 663.34', 1, 0, 1, NULL, 13),
(2860, 29, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '193.58 662.99 192.65 681.75 200.14 682.15 201.07 663.34 193.58 662.99', 1, 0, 1, NULL, 13),
(2861, 30, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '186.03 662.58 185.1 681.4 192.59 681.75 193.58 662.99 186.03 662.58', 1, 0, 1, NULL, 13),
(2862, 31, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '178.54 662.23 177.61 680.99 185.1 681.4 186.03 662.58 178.54 662.23', 1, 0, 1, NULL, 13),
(2863, 32, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '170.99 661.83 170.06 680.64 177.61 680.99 178.54 662.23 170.99 661.83', 1, 0, 1, NULL, 13),
(2864, 33, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '163.5 661.48 162.57 680.24 170.06 680.64 170.99 661.83 163.5 661.48', 1, 0, 1, NULL, 13),
(2865, 34, '360.00', 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '155.95 661.07 155.02 679.89 162.57 680.24 163.5 661.48 155.95 661.07', 1, 0, 1, NULL, 13),
(2866, 2, '450.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '153.98 706.59 153.51 715.99 134.76 715.06 135.22 705.66 153.98 706.59', 1, 0, 1, NULL, 13),
(2867, 3, '450.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '135.69 696.31 135.22 705.66 153.98 706.59 154.44 697.24 135.69 696.31', 1, 0, 1, NULL, 13),
(2868, 4, '450.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M155,687.77l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2869, 5, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '154.97 687.77 154.04 706.59 161.53 706.99 162.46 688.18 154.97 687.77', 1, 0, 1, NULL, 13),
(2870, 6, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '162.46 688.18 161.53 706.99 169.02 707.34 170.01 688.52 162.46 688.18', 1, 0, 1, NULL, 13),
(2871, 7, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '170.01 688.52 169.08 707.34 176.57 707.75 177.5 688.93 170.01 688.52', 1, 0, 1, NULL, 13),
(2872, 8, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '177.5 688.93 176.57 707.75 184.12 708.1 185.05 689.28 177.5 688.93', 1, 0, 1, NULL, 13),
(2873, 9, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '185.05 689.28 184.12 708.1 191.61 708.5 192.54 689.69 185.05 689.28', 1, 0, 1, NULL, 13),
(2874, 10, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '192.54 689.69 191.61 708.5 199.16 708.85 200.09 690.03 192.54 689.69', 1, 0, 1, NULL, 13),
(2875, 11, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '200.09 690.03 199.16 708.85 206.65 709.26 207.58 690.44 200.09 690.03', 1, 0, 1, NULL, 13),
(2876, 12, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '207.58 690.44 206.65 709.26 214.2 709.61 215.13 690.79 207.58 690.44', 1, 0, 1, NULL, 13),
(2877, 13, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '215.13 690.79 214.2 709.61 221.69 710.01 222.62 691.2 215.13 690.79', 1, 0, 1, NULL, 13),
(2878, 14, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '222.62 691.2 221.75 710.01 229.24 710.36 230.17 691.54 222.62 691.2', 1, 0, 1, NULL, 13),
(2879, 15, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '230.17 691.54 229.24 710.36 236.73 710.71 237.66 691.95 230.17 691.54', 1, 0, 1, NULL, 13),
(2880, 16, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '237.72 691.95 236.79 710.71 244.28 711.12 245.21 692.3 237.72 691.95', 1, 0, 1, NULL, 13),
(2881, 17, '360.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '245.21 692.3 244.28 711.12 251.77 711.46 252.76 692.71 245.21 692.3', 1, 0, 1, NULL, 13),
(2882, 18, '450.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M252.76,692.71l12.08.64s7.2.64,6.27,9.41V703l-18.82-.93Z', 1, 1, 1, NULL, 13),
(2883, 19, '450.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '252.24 702.11 251.77 711.52 270.59 712.45 271.05 703.04 252.24 702.11', 1, 0, 1, NULL, 13),
(2884, 20, '450.00', 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '251.77 711.52 251.31 720.99 270.12 721.86 270.59 712.45 251.77 711.52', 1, 0, 1, NULL, 13),
(2885, 2, '450.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '296.61 714.09 296.14 723.5 277.39 722.57 277.85 713.16 296.61 714.09', 1, 0, 1, NULL, 13),
(2886, 3, '450.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '278.32 703.81 277.85 713.16 296.61 714.09 297.07 704.74 278.32 703.81', 1, 0, 1, NULL, 13),
(2887, 4, '450.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M297.6,695.27l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2888, 5, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '297.6 695.27 296.67 714.09 304.16 714.49 305.09 695.68 297.6 695.27', 1, 0, 1, NULL, 13),
(2889, 6, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '305.09 695.68 304.16 714.49 311.65 714.84 312.64 696.03 305.09 695.68', 1, 0, 1, NULL, 13),
(2890, 7, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '312.64 696.03 311.71 714.84 319.2 715.25 320.13 696.43 312.64 696.03', 1, 0, 1, NULL, 13),
(2891, 8, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '320.13 696.43 319.2 715.25 326.75 715.6 327.68 696.78 320.13 696.43', 1, 0, 1, NULL, 13),
(2892, 9, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '327.68 696.78 326.75 715.6 334.24 716 335.17 697.19 327.68 696.78', 1, 0, 1, NULL, 13),
(2893, 10, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '335.17 697.19 334.24 716 341.79 716.35 342.72 697.54 335.17 697.19', 1, 0, 1, NULL, 13),
(2894, 11, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '342.72 697.54 341.79 716.35 349.28 716.76 350.21 697.94 342.72 697.54', 1, 0, 1, NULL, 13),
(2895, 12, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '350.21 697.94 349.28 716.76 356.83 717.11 357.76 698.29 350.21 697.94', 1, 0, 1, NULL, 13),
(2896, 13, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '357.76 698.29 356.83 717.11 364.32 717.51 365.25 698.7 357.76 698.29', 1, 0, 1, NULL, 13),
(2897, 14, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '365.25 698.7 364.38 717.51 371.87 717.86 372.8 699.05 365.25 698.7', 1, 0, 1, NULL, 13),
(2898, 15, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '372.8 699.05 371.87 717.86 379.36 718.21 380.29 699.45 372.8 699.05', 1, 0, 1, NULL, 13),
(2899, 16, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '380.35 699.45 379.42 718.21 386.91 718.62 387.84 699.8 380.35 699.45', 1, 0, 1, NULL, 13),
(2900, 17, '360.00', 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '387.84 699.8 386.91 718.62 394.4 718.97 395.39 700.21 387.84 699.8', 1, 0, 1, NULL, 13),
(2901, 1, '450.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M297.82,687.74l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2902, 2, '450.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '298.75 668.92 298.28 678.33 279.53 677.4 279.99 667.99 298.75 668.92', 1, 0, 1, NULL, 13),
(2903, 3, '450.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '280.46 658.64 279.99 667.99 298.75 668.92 299.21 659.57 280.46 658.64', 1, 0, 1, NULL, 13),
(2904, 4, '450.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M299.74,650.11l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2905, 5, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '299.74 650.11 298.81 668.92 306.3 669.33 307.23 650.51 299.74 650.11', 1, 0, 1, NULL, 13),
(2906, 6, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '307.23 650.51 306.3 669.33 313.79 669.68 314.78 650.86 307.23 650.51', 1, 0, 1, NULL, 13),
(2907, 7, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '314.78 650.86 313.85 669.68 321.34 670.09 322.27 651.27 314.78 650.86', 1, 0, 1, NULL, 13),
(2908, 8, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '322.27 651.27 321.34 670.09 328.89 670.43 329.82 651.62 322.27 651.27', 1, 0, 1, NULL, 13),
(2909, 9, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '329.82 651.62 328.89 670.43 336.38 670.84 337.31 652.02 329.82 651.62', 1, 0, 1, NULL, 13),
(2910, 10, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '337.31 652.02 336.38 670.84 343.93 671.19 344.86 652.37 337.31 652.02', 1, 0, 1, NULL, 13),
(2911, 11, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '344.86 652.37 343.93 671.19 351.42 671.6 352.35 652.78 344.86 652.37', 1, 0, 1, NULL, 13),
(2912, 12, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '352.35 652.78 351.42 671.6 358.97 671.94 359.9 653.13 352.35 652.78', 1, 0, 1, NULL, 13),
(2913, 13, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '359.9 653.13 358.97 671.94 366.46 672.35 367.39 653.53 359.9 653.13', 1, 0, 1, NULL, 13),
(2914, 14, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '367.39 653.53 366.52 672.35 374.01 672.7 374.94 653.88 367.39 653.53', 1, 0, 1, NULL, 13),
(2915, 15, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '374.94 653.88 374.01 672.7 381.5 673.05 382.43 654.29 374.94 653.88', 1, 0, 1, NULL, 13),
(2916, 16, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '382.49 654.29 381.56 673.05 389.05 673.45 389.98 654.64 382.49 654.29', 1, 0, 1, NULL, 13),
(2917, 17, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '389.98 654.64 389.05 673.45 396.54 673.8 397.53 655.04 389.98 654.64', 1, 0, 1, NULL, 13),
(2918, 22, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '389.05 673.45 388.12 692.27 395.61 692.62 396.54 673.86 389.05 673.45', 1, 0, 1, NULL, 13),
(2919, 23, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '381.5 673.11 380.57 691.86 388.06 692.27 389.05 673.45 381.5 673.11', 1, 0, 1, NULL, 13),
(2920, 24, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '373.95 672.7 373.02 691.51 380.57 691.86 381.5 673.11 373.95 672.7', 1, 0, 1, NULL, 13),
(2921, 25, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '366.46 672.35 365.53 691.11 373.02 691.51 373.95 672.7 366.46 672.35', 1, 0, 1, NULL, 13),
(2922, 26, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '358.91 671.94 357.98 690.76 365.47 691.11 366.46 672.35 358.91 671.94', 1, 0, 1, NULL, 13),
(2923, 27, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '351.42 671.6 350.49 690.35 357.98 690.76 358.91 671.94 351.42 671.6', 1, 0, 1, NULL, 13),
(2924, 28, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '343.87 671.19 342.94 690 350.49 690.35 351.42 671.6 343.87 671.19', 1, 0, 1, NULL, 13),
(2925, 29, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '336.38 670.84 335.45 689.6 342.94 690 343.87 671.19 336.38 670.84', 1, 0, 1, NULL, 13),
(2926, 30, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '328.83 670.43 327.9 689.25 335.39 689.6 336.38 670.84 328.83 670.43', 1, 0, 1, NULL, 13),
(2927, 31, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '321.34 670.09 320.41 688.84 327.9 689.25 328.83 670.43 321.34 670.09', 1, 0, 1, NULL, 13),
(2928, 32, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '313.79 669.68 312.86 688.49 320.41 688.84 321.34 670.09 313.79 669.68', 1, 0, 1, NULL, 13),
(2929, 33, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '306.3 669.33 305.37 688.09 312.86 688.49 313.79 669.68 306.3 669.33', 1, 0, 1, NULL, 13),
(2930, 34, '360.00', 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '298.75 668.92 297.82 687.74 305.37 688.09 306.3 669.33 298.75 668.92', 1, 0, 1, NULL, 13),
(2931, 1, '450.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M300,642.33l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2932, 2, '450.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '300.89 623.51 300.42 632.92 281.67 631.99 282.13 622.59 300.89 623.51', 1, 0, 1, NULL, 13),
(2933, 3, '450.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '282.6 613.24 282.13 622.59 300.89 623.51 301.35 614.17 282.6 613.24', 1, 0, 1, NULL, 13),
(2934, 4, '450.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M301.88,604.7l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2935, 5, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '301.88 604.7 300.95 623.51 308.44 623.92 309.37 605.11 301.88 604.7', 1, 0, 1, NULL, 13),
(2936, 6, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '309.37 605.11 308.44 623.92 315.93 624.27 316.92 605.46 309.37 605.11', 1, 0, 1, NULL, 13),
(2937, 7, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '316.92 605.46 315.99 624.27 323.48 624.68 324.41 605.86 316.92 605.46', 1, 0, 1, NULL, 13),
(2938, 8, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '324.41 605.86 323.48 624.68 331.03 625.02 331.96 606.21 324.41 605.86', 1, 0, 1, NULL, 13),
(2939, 9, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '331.96 606.21 331.03 625.02 338.52 625.43 339.45 606.62 331.96 606.21', 1, 0, 1, NULL, 13),
(2940, 10, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '339.45 606.62 338.52 625.43 346.07 625.78 347 606.97 339.45 606.62', 1, 0, 1, NULL, 13),
(2941, 11, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '347 606.97 346.07 625.78 353.56 626.19 354.49 607.37 347 606.97', 1, 0, 1, NULL, 13),
(2942, 12, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '354.49 607.37 353.56 626.19 361.11 626.53 362.04 607.72 354.49 607.37', 1, 0, 1, NULL, 13),
(2943, 13, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '362.04 607.72 361.11 626.53 368.6 626.94 369.53 608.13 362.04 607.72', 1, 0, 1, NULL, 13),
(2944, 14, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '369.53 608.13 368.66 626.94 376.15 627.29 377.08 608.48 369.53 608.13', 1, 0, 1, NULL, 13),
(2945, 15, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '377.08 608.48 376.15 627.29 383.64 627.64 384.57 608.88 377.08 608.48', 1, 0, 1, NULL, 13),
(2946, 16, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '384.63 608.88 383.7 627.64 391.19 628.04 392.12 609.23 384.63 608.88', 1, 0, 1, NULL, 13),
(2947, 17, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '392.12 609.23 391.19 628.04 398.68 628.39 399.67 609.64 392.12 609.23', 1, 0, 1, NULL, 13),
(2948, 22, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '391.19 628.04 390.26 646.86 397.75 647.21 398.68 628.45 391.19 628.04', 1, 0, 1, NULL, 13),
(2949, 23, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '383.64 627.7 382.71 646.45 390.2 646.86 391.19 628.04 383.64 627.7', 1, 0, 1, NULL, 13),
(2950, 24, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '376.09 627.29 375.16 646.11 382.71 646.45 383.64 627.7 376.09 627.29', 1, 0, 1, NULL, 13),
(2951, 25, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '368.6 626.94 367.67 645.7 375.16 646.11 376.09 627.29 368.6 626.94', 1, 0, 1, NULL, 13),
(2952, 26, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '361.05 626.53 360.12 645.35 367.61 645.7 368.6 626.94 361.05 626.53', 1, 0, 1, NULL, 13),
(2953, 27, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '353.56 626.19 352.63 644.94 360.12 645.35 361.05 626.53 353.56 626.19', 1, 0, 1, NULL, 13),
(2954, 28, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '346.01 625.78 345.08 644.6 352.63 644.94 353.56 626.19 346.01 625.78', 1, 0, 1, NULL, 13),
(2955, 29, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '338.52 625.43 337.59 644.19 345.08 644.6 346.01 625.78 338.52 625.43', 1, 0, 1, NULL, 13),
(2956, 30, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '330.97 625.02 330.04 643.84 337.53 644.19 338.52 625.43 330.97 625.02', 1, 0, 1, NULL, 13),
(2957, 31, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '323.48 624.68 322.55 643.43 330.04 643.84 330.97 625.02 323.48 624.68', 1, 0, 1, NULL, 13),
(2958, 32, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '315.93 624.27 315 643.09 322.55 643.43 323.48 624.68 315.93 624.27', 1, 0, 1, NULL, 13),
(2959, 33, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '308.44 623.92 307.51 642.68 315 643.09 315.93 624.27 308.44 623.92', 1, 0, 1, NULL, 13),
(2960, 34, '360.00', 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '300.89 623.51 299.96 642.33 307.51 642.68 308.44 623.92 300.89 623.51', 1, 0, 1, NULL, 13),
(2961, 1, '450.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M302.1,596.67l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2962, 2, '450.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '303.03 577.86 302.56 587.26 283.81 586.34 284.27 576.93 303.03 577.86', 1, 0, 1, NULL, 13),
(2963, 3, '450.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '284.74 567.58 284.27 576.93 303.03 577.86 303.49 568.51 284.74 567.58', 1, 0, 1, NULL, 13),
(2965, 22, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '393.33 582.39 392.4 601.2 399.89 601.55 400.82 582.79 393.33 582.39', 1, 0, 1, NULL, 13),
(2966, 23, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '385.78 582.04 384.85 600.79 392.34 601.2 393.33 582.39 385.78 582.04', 1, 0, 1, NULL, 13),
(2967, 24, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '378.23 581.63 377.3 600.45 384.85 600.79 385.78 582.04 378.23 581.63', 1, 0, 1, NULL, 13),
(2968, 25, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '370.74 581.28 369.81 600.04 377.3 600.45 378.23 581.63 370.74 581.28', 1, 0, 1, NULL, 13),
(2969, 26, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '363.19 580.88 362.26 599.69 369.75 600.04 370.74 581.28 363.19 580.88', 1, 0, 1, NULL, 13),
(2970, 27, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '355.7 580.53 354.77 599.28 362.26 599.69 363.19 580.88 355.7 580.53', 1, 0, 1, NULL, 13),
(2971, 28, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '348.15 580.12 347.22 598.94 354.77 599.28 355.7 580.53 348.15 580.12', 1, 0, 1, NULL, 13),
(2972, 29, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '340.66 579.77 339.73 598.53 347.22 598.94 348.15 580.12 340.66 579.77', 1, 0, 1, NULL, 13),
(2973, 30, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '333.11 579.37 332.18 598.18 339.67 598.53 340.66 579.77 333.11 579.37', 1, 0, 1, NULL, 13),
(2974, 31, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '325.62 579.02 324.69 597.77 332.18 598.18 333.11 579.37 325.62 579.02', 1, 0, 1, NULL, 13),
(2975, 32, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '318.07 578.61 317.14 597.43 324.69 597.77 325.62 579.02 318.07 578.61', 1, 0, 1, NULL, 13),
(2976, 33, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '310.58 578.26 309.65 597.02 317.14 597.43 318.07 578.61 310.58 578.26', 1, 0, 1, NULL, 13),
(2977, 34, '360.00', 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '303.03 577.86 302.1 596.67 309.65 597.02 310.58 578.26 303.03 577.86', 1, 0, 1, NULL, 13),
(2978, 2, '450.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '307.73 488.45 307.26 497.86 288.51 496.93 288.97 487.52 307.73 488.45', 1, 0, 1, NULL, 13),
(2979, 3, '450.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '289.44 478.17 288.97 487.52 307.73 488.45 308.19 479.1 289.44 478.17', 1, 0, 1, NULL, 13),
(2980, 4, '450.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M308.72,469.64,295.53,469s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2981, 5, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '308.72 469.64 307.79 488.45 315.28 488.86 316.21 470.04 308.72 469.64', 1, 0, 1, NULL, 13),
(2982, 6, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '316.21 470.04 315.28 488.86 322.77 489.21 323.76 470.39 316.21 470.04', 1, 0, 1, NULL, 13),
(2983, 7, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '323.76 470.39 322.83 489.21 330.32 489.61 331.25 470.8 323.76 470.39', 1, 0, 1, NULL, 13),
(2984, 8, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '331.25 470.8 330.32 489.61 337.87 489.96 338.8 471.15 331.25 470.8', 1, 0, 1, NULL, 13),
(2985, 9, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '338.8 471.15 337.87 489.96 345.36 490.37 346.29 471.55 338.8 471.15', 1, 0, 1, NULL, 13),
(2986, 10, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '346.29 471.55 345.36 490.37 352.91 490.72 353.84 471.9 346.29 471.55', 1, 0, 1, NULL, 13),
(2987, 11, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '353.84 471.9 352.91 490.72 360.4 491.12 361.33 472.31 353.84 471.9', 1, 0, 1, NULL, 13),
(2988, 12, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '361.33 472.31 360.4 491.12 367.95 491.47 368.88 472.66 361.33 472.31', 1, 0, 1, NULL, 13),
(2989, 13, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '368.88 472.66 367.95 491.47 375.44 491.88 376.37 473.06 368.88 472.66', 1, 0, 1, NULL, 13),
(2990, 14, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '376.37 473.06 375.5 491.88 382.99 492.23 383.92 473.41 376.37 473.06', 1, 0, 1, NULL, 13),
(2991, 15, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '383.92 473.41 382.99 492.23 390.48 492.57 391.41 473.82 383.92 473.41', 1, 0, 1, NULL, 13),
(2992, 16, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '391.47 473.82 390.54 492.57 398.03 492.98 398.96 474.17 391.47 473.82', 1, 0, 1, NULL, 13),
(2993, 17, '360.00', 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '398.96 474.17 398.03 492.98 405.52 493.33 406.51 474.57 398.96 474.17', 1, 0, 1, NULL, 13),
(2994, 1, '450.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M308.94,461.91l-13.41-.7-1.22-.06a4.45,4.45,0,0,1-4-4.41l.23-5.17,18.82.93Z', 1, 1, 1, NULL, 13),
(2995, 2, '450.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '309.87 443.09 309.4 452.5 290.65 451.57 291.11 442.17 309.87 443.09', 1, 0, 1, NULL, 13),
(2996, 3, '450.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '291.58 432.82 291.11 442.17 309.87 443.09 310.33 433.75 291.58 432.82', 1, 0, 1, NULL, 13),
(2997, 4, '450.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M310.86,424.28l-13.18-.64s-4.94-.46-6,5.34l-.06,3.83,18.82.93Z', 1, 1, 1, NULL, 13),
(2998, 5, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '310.86 424.28 309.93 443.09 317.42 443.5 318.35 424.69 310.86 424.28', 1, 0, 1, NULL, 13),
(2999, 6, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '318.35 424.69 317.42 443.5 324.91 443.85 325.9 425.03 318.35 424.69', 1, 0, 1, NULL, 13),
(3000, 7, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '325.9 425.03 324.97 443.85 332.46 444.26 333.39 425.44 325.9 425.03', 1, 0, 1, NULL, 13),
(3001, 8, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '333.39 425.44 332.46 444.26 340.01 444.6 340.94 425.79 333.39 425.44', 1, 0, 1, NULL, 13),
(3002, 9, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '340.94 425.79 340.01 444.6 347.5 445.01 348.43 426.2 340.94 425.79', 1, 0, 1, NULL, 13),
(3003, 10, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '348.43 426.2 347.5 445.01 355.05 445.36 355.98 426.54 348.43 426.2', 1, 0, 1, NULL, 13),
(3004, 11, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '355.98 426.54 355.05 445.36 362.54 445.77 363.47 426.95 355.98 426.54', 1, 0, 1, NULL, 13),
(3005, 12, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '363.47 426.95 362.54 445.77 370.09 446.11 371.02 427.3 363.47 426.95', 1, 0, 1, NULL, 13),
(3006, 13, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '371.02 427.3 370.09 446.11 377.58 446.52 378.51 427.7 371.02 427.3', 1, 0, 1, NULL, 13),
(3007, 14, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '378.51 427.7 377.64 446.52 385.13 446.87 386.06 428.05 378.51 427.7', 1, 0, 1, NULL, 13),
(3008, 15, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '386.06 428.05 385.13 446.87 392.62 447.22 393.55 428.46 386.06 428.05', 1, 0, 1, NULL, 13),
(3009, 16, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '393.61 428.46 392.68 447.22 400.17 447.62 401.1 428.81 393.61 428.46', 1, 0, 1, NULL, 13),
(3010, 17, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '401.1 428.81 400.17 447.62 407.66 447.97 408.65 429.21 401.1 428.81', 1, 0, 1, NULL, 13),
(3011, 22, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '400.17 447.62 399.24 466.44 406.73 466.79 407.66 448.03 400.17 447.62', 1, 0, 1, NULL, 13),
(3012, 23, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '392.62 447.27 391.69 466.03 399.18 466.44 400.17 447.62 392.62 447.27', 1, 0, 1, NULL, 13),
(3013, 24, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '385.07 446.87 384.14 465.68 391.69 466.03 392.62 447.27 385.07 446.87', 1, 0, 1, NULL, 13),
(3014, 25, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '377.58 446.52 376.65 465.28 384.14 465.68 385.07 446.87 377.58 446.52', 1, 0, 1, NULL, 13),
(3015, 26, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '370.03 446.11 369.1 464.93 376.59 465.28 377.58 446.52 370.03 446.11', 1, 0, 1, NULL, 13),
(3016, 27, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '362.54 445.77 361.61 464.52 369.1 464.93 370.03 446.11 362.54 445.77', 1, 0, 1, NULL, 13),
(3017, 28, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '354.99 445.36 354.06 464.17 361.61 464.52 362.54 445.77 354.99 445.36', 1, 0, 1, NULL, 13),
(3018, 29, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '347.5 445.01 346.57 463.77 354.06 464.17 354.99 445.36 347.5 445.01', 1, 0, 1, NULL, 13),
(3019, 30, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '339.95 444.6 339.02 463.42 346.51 463.77 347.5 445.01 339.95 444.6', 1, 0, 1, NULL, 13),
(3020, 31, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '332.46 444.26 331.53 463.01 339.02 463.42 339.95 444.6 332.46 444.26', 1, 0, 1, NULL, 13),
(3021, 32, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '324.91 443.85 323.98 462.66 331.53 463.01 332.46 444.26 324.91 443.85', 1, 0, 1, NULL, 13),
(3022, 33, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '317.42 443.5 316.49 462.26 323.98 462.66 324.91 443.85 317.42 443.5', 1, 0, 1, NULL, 13),
(3023, 34, '360.00', 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '309.87 443.09 308.94 461.91 316.49 462.26 317.42 443.5 309.87 443.09', 1, 0, 1, NULL, 13),
(3024, 5, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '454.07 431.24 453.15 450.05 460.64 450.46 461.57 431.64 454.07 431.24', 1, 0, 1, NULL, 13),
(3025, 6, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '461.57 431.64 460.64 450.46 468.13 450.81 469.12 431.99 461.57 431.64', 1, 0, 1, NULL, 13),
(3026, 7, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '469.12 431.99 468.19 450.81 475.68 451.21 476.61 432.4 469.12 431.99', 1, 0, 1, NULL, 13),
(3027, 8, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '476.61 432.4 475.68 451.21 483.23 451.56 484.16 432.75 476.61 432.4', 1, 0, 1, NULL, 13),
(3028, 9, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '484.16 432.75 483.23 451.56 490.72 451.97 491.65 433.15 484.16 432.75', 1, 0, 1, NULL, 13),
(3029, 10, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '491.65 433.15 490.72 451.97 498.27 452.32 499.2 433.5 491.65 433.15', 1, 0, 1, NULL, 13),
(3030, 11, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '499.2 433.5 498.27 452.32 505.76 452.72 506.69 433.91 499.2 433.5', 1, 0, 1, NULL, 13),
(3031, 12, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '506.69 433.91 505.76 452.72 513.31 453.07 514.24 434.26 506.69 433.91', 1, 0, 1, NULL, 13),
(3032, 13, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '514.24 434.26 513.31 453.07 520.8 453.48 521.73 434.66 514.24 434.26', 1, 0, 1, NULL, 13),
(3033, 14, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '521.73 434.66 520.86 453.48 528.35 453.83 529.28 435.01 521.73 434.66', 1, 0, 1, NULL, 13),
(3034, 15, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '529.28 435.01 528.35 453.83 535.84 454.18 536.77 435.42 529.28 435.01', 1, 0, 1, NULL, 13),
(3035, 16, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '536.83 435.42 535.9 454.18 543.39 454.58 544.32 435.77 536.83 435.42', 1, 0, 1, NULL, 13),
(3036, 17, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '544.32 435.77 543.39 454.58 550.88 454.93 551.87 436.17 544.32 435.77', 1, 0, 1, NULL, 13),
(3037, 18, '450.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M551.87,436.17l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(3038, 19, '450.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '551.35 445.58 550.88 454.99 569.7 455.92 570.16 446.51 551.35 445.58', 1, 0, 1, NULL, 13),
(3039, 20, '450.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '550.88 454.99 550.41 464.45 569.23 465.33 569.7 455.92 550.88 454.99', 1, 0, 1, NULL, 13),
(3040, 21, '450.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M550.42,464.45,550,473.8l14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(3041, 22, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '543.39 454.58 542.46 473.4 549.95 473.75 550.88 454.99 543.39 454.58', 1, 0, 1, NULL, 13),
(3042, 23, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '535.84 454.23 534.91 472.99 542.4 473.4 543.39 454.58 535.84 454.23', 1, 0, 1, NULL, 13),
(3043, 24, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '528.29 453.83 527.36 472.64 534.91 472.99 535.84 454.23 528.29 453.83', 1, 0, 1, NULL, 13),
(3044, 25, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '520.8 453.48 519.87 472.24 527.36 472.64 528.29 453.83 520.8 453.48', 1, 0, 1, NULL, 13),
(3045, 26, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '513.25 453.07 512.32 471.89 519.81 472.24 520.8 453.48 513.25 453.07', 1, 0, 1, NULL, 13),
(3046, 27, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '505.76 452.72 504.83 471.48 512.32 471.89 513.25 453.07 505.76 452.72', 1, 0, 1, NULL, 13),
(3047, 28, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '498.21 452.32 497.28 471.13 504.83 471.48 505.76 452.72 498.21 452.32', 1, 0, 1, NULL, 13),
(3048, 29, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '490.72 451.97 489.79 470.73 497.28 471.13 498.21 452.32 490.72 451.97', 1, 0, 1, NULL, 13),
(3049, 30, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '483.17 451.56 482.24 470.38 489.73 470.73 490.72 451.97 483.17 451.56', 1, 0, 1, NULL, 13),
(3050, 31, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '475.68 451.21 474.75 469.97 482.24 470.38 483.17 451.56 475.68 451.21', 1, 0, 1, NULL, 13),
(3051, 32, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '468.13 450.81 467.2 469.62 474.75 469.97 475.68 451.21 468.13 450.81', 1, 0, 1, NULL, 13),
(3052, 33, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '460.64 450.46 459.71 469.22 467.2 469.62 468.13 450.81 460.64 450.46', 1, 0, 1, NULL, 13),
(3053, 34, '360.00', 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '453.09 450.05 452.16 468.87 459.71 469.22 460.64 450.46 453.09 450.05', 1, 0, 1, NULL, 13),
(3054, 5, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '452.26 475.9 451.33 494.72 458.82 495.12 459.75 476.31 452.26 475.9', 1, 0, 1, NULL, 13),
(3055, 6, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '459.75 476.31 458.82 495.12 466.31 495.47 467.3 476.66 459.75 476.31', 1, 0, 1, NULL, 13),
(3056, 7, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '467.3 476.66 466.37 495.47 473.86 495.88 474.79 477.06 467.3 476.66', 1, 0, 1, NULL, 13),
(3057, 8, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '474.79 477.06 473.86 495.88 481.41 496.23 482.34 477.41 474.79 477.06', 1, 0, 1, NULL, 13),
(3058, 9, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '482.34 477.41 481.41 496.23 488.9 496.63 489.83 477.82 482.34 477.41', 1, 0, 1, NULL, 13),
(3059, 10, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '489.83 477.82 488.9 496.63 496.45 496.98 497.38 478.17 489.83 477.82', 1, 0, 1, NULL, 13),
(3060, 11, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '497.38 478.17 496.45 496.98 503.94 497.39 504.87 478.57 497.38 478.17', 1, 0, 1, NULL, 13),
(3061, 12, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '504.87 478.57 503.94 497.39 511.49 497.74 512.42 478.92 504.87 478.57', 1, 0, 1, NULL, 13),
(3062, 13, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '512.42 478.92 511.49 497.74 518.98 498.14 519.91 479.33 512.42 478.92', 1, 0, 1, NULL, 13),
(3063, 14, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '519.91 479.33 519.04 498.14 526.53 498.49 527.46 479.68 519.91 479.33', 1, 0, 1, NULL, 13),
(3064, 15, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '527.46 479.68 526.53 498.49 534.02 498.84 534.95 480.08 527.46 479.68', 1, 0, 1, NULL, 13),
(3065, 16, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '535.01 480.08 534.08 498.84 541.57 499.25 542.5 480.43 535.01 480.08', 1, 0, 1, NULL, 13),
(3066, 17, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '542.5 480.43 541.57 499.25 549.07 499.6 550.05 480.84 542.5 480.43', 1, 0, 1, NULL, 13),
(3067, 18, '450.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M550.05,480.84l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(3068, 19, '450.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '549.53 490.25 549.07 499.65 567.88 500.58 568.35 491.18 549.53 490.25', 1, 0, 1, NULL, 13),
(3069, 20, '450.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '549.07 499.65 548.6 509.12 567.42 509.99 567.88 500.58 549.07 499.65', 1, 0, 1, NULL, 13),
(3070, 21, '450.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M548.6,509.12l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(3071, 22, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '541.57 499.25 540.64 518.06 548.14 518.41 549.07 499.65 541.57 499.25', 1, 0, 1, NULL, 13),
(3072, 23, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '534.02 498.9 533.1 517.65 540.59 518.06 541.57 499.25 534.02 498.9', 1, 0, 1, NULL, 13),
(3073, 24, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '526.48 498.49 525.55 517.31 533.1 517.65 534.02 498.9 526.48 498.49', 1, 0, 1, NULL, 13),
(3074, 25, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '518.98 498.14 518.05 516.9 525.55 517.31 526.48 498.49 518.98 498.14', 1, 0, 1, NULL, 13),
(3075, 26, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '511.44 497.74 510.51 516.55 518 516.9 518.98 498.14 511.44 497.74', 1, 0, 1, NULL, 13),
(3076, 27, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '503.94 497.39 503.01 516.14 510.51 516.55 511.44 497.74 503.94 497.39', 1, 0, 1, NULL, 13),
(3077, 28, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '496.39 496.98 495.46 515.8 503.01 516.14 503.94 497.39 496.39 496.98', 1, 0, 1, NULL, 13),
(3078, 29, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '488.9 496.63 487.97 515.39 495.46 515.8 496.39 496.98 488.9 496.63', 1, 0, 1, NULL, 13),
(3079, 30, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '481.35 496.23 480.43 515.04 487.92 515.39 488.9 496.63 481.35 496.23', 1, 0, 1, NULL, 13),
(3080, 31, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '473.86 495.88 472.93 514.64 480.43 515.04 481.35 496.23 473.86 495.88', 1, 0, 1, NULL, 13),
(3081, 32, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '466.31 495.47 465.38 514.29 472.93 514.64 473.86 495.88 466.31 495.47', 1, 0, 1, NULL, 13),
(3082, 33, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '458.82 495.12 457.89 513.88 465.38 514.29 466.31 495.47 458.82 495.12', 1, 0, 1, NULL, 13),
(3083, 34, '360.00', 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '451.27 494.72 450.34 513.53 457.89 513.88 458.82 495.12 451.27 494.72', 1, 0, 1, NULL, 13),
(3084, 5, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '449.55 521.59 448.62 540.41 456.12 540.82 457.05 522 449.55 521.59', 1, 0, 1, NULL, 13),
(3085, 6, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '457.05 522 456.12 540.82 463.61 541.16 464.59 522.35 457.05 522', 1, 0, 1, NULL, 13),
(3086, 7, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '464.59 522.35 463.67 541.16 471.16 541.57 472.08 522.75 464.59 522.35', 1, 0, 1, NULL, 13),
(3087, 8, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '472.08 522.75 471.16 541.57 478.7 541.92 479.63 523.1 472.08 522.75', 1, 0, 1, NULL, 13),
(3088, 9, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '479.63 523.1 478.7 541.92 486.2 542.33 487.13 523.51 479.63 523.1', 1, 0, 1, NULL, 13),
(3089, 10, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '487.13 523.51 486.2 542.33 493.75 542.67 494.68 523.86 487.13 523.51', 1, 0, 1, NULL, 13),
(3090, 11, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '494.68 523.86 493.75 542.67 501.24 543.08 502.17 524.26 494.68 523.86', 1, 0, 1, NULL, 13),
(3091, 12, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '502.17 524.26 501.24 543.08 508.79 543.43 509.72 524.61 502.17 524.26', 1, 0, 1, NULL, 13),
(3092, 13, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '509.72 524.61 508.79 543.43 516.28 543.84 517.21 525.02 509.72 524.61', 1, 0, 1, NULL, 13),
(3093, 14, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '517.21 525.02 516.34 543.84 523.83 544.18 524.76 525.37 517.21 525.02', 1, 0, 1, NULL, 13),
(3094, 15, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '524.76 525.37 523.83 544.18 531.32 544.53 532.25 525.77 524.76 525.37', 1, 0, 1, NULL, 13),
(3095, 16, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '532.3 525.77 531.38 544.53 538.87 544.94 539.8 526.12 532.3 525.77', 1, 0, 1, NULL, 13),
(3096, 17, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '539.8 526.12 538.87 544.94 546.36 545.29 547.35 526.53 539.8 526.12', 1, 0, 1, NULL, 13),
(3097, 18, '450.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M547.35,526.53l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(3098, 19, '450.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '546.82 535.94 546.36 545.35 565.17 546.27 565.64 536.87 546.82 535.94', 1, 0, 1, NULL, 13),
(3099, 20, '450.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '546.36 545.35 545.89 554.81 564.71 555.68 565.17 546.27 546.36 545.35', 1, 0, 1, NULL, 13),
(3100, 21, '450.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M545.89,554.81l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(3101, 22, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '538.87 544.94 537.94 563.75 545.43 564.1 546.36 545.35 538.87 544.94', 1, 0, 1, NULL, 13),
(3102, 23, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '531.32 544.59 530.39 563.35 537.88 563.75 538.87 544.94 531.32 544.59', 1, 0, 1, NULL, 13),
(3103, 24, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '523.77 544.18 522.84 563 530.39 563.35 531.32 544.59 523.77 544.18', 1, 0, 1, NULL, 13),
(3104, 25, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '516.28 543.84 515.35 562.59 522.84 563 523.77 544.18 516.28 543.84', 1, 0, 1, NULL, 13),
(3105, 26, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '508.73 543.43 507.8 562.24 515.29 562.59 516.28 543.84 508.73 543.43', 1, 0, 1, NULL, 13),
(3106, 27, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '501.24 543.08 500.31 561.84 507.8 562.24 508.73 543.43 501.24 543.08', 1, 0, 1, NULL, 13),
(3107, 28, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '493.69 542.67 492.76 561.49 500.31 561.84 501.24 543.08 493.69 542.67', 1, 0, 1, NULL, 13),
(3108, 29, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '486.2 542.33 485.27 561.08 492.76 561.49 493.69 542.67 486.2 542.33', 1, 0, 1, NULL, 13),
(3109, 30, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '478.65 541.92 477.72 560.73 485.21 561.08 486.2 542.33 478.65 541.92', 1, 0, 1, NULL, 13),
(3110, 31, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '471.16 541.57 470.23 560.33 477.72 560.73 478.65 541.92 471.16 541.57', 1, 0, 1, NULL, 13),
(3111, 32, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '463.61 541.16 462.68 559.98 470.23 560.33 471.16 541.57 463.61 541.16', 1, 0, 1, NULL, 13),
(3112, 33, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '456.12 540.82 455.19 559.57 462.68 559.98 463.61 541.16 456.12 540.82', 1, 0, 1, NULL, 13),
(3113, 34, '360.00', 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '448.57 540.41 447.64 559.22 455.19 559.57 456.12 540.82 448.57 540.41', 1, 0, 1, NULL, 13),
(3114, 5, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '447.56 566.89 446.63 585.71 454.12 586.11 455.05 567.3 447.56 566.89', 1, 0, 1, NULL, 13),
(3115, 6, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '455.05 567.3 454.12 586.11 461.61 586.46 462.6 567.65 455.05 567.3', 1, 0, 1, NULL, 13),
(3116, 7, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '462.6 567.65 461.67 586.46 469.16 586.87 470.09 568.05 462.6 567.65', 1, 0, 1, NULL, 13),
(3117, 8, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '470.09 568.05 469.16 586.87 476.71 587.22 477.64 568.4 470.09 568.05', 1, 0, 1, NULL, 13),
(3118, 9, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '477.64 568.4 476.71 587.22 484.2 587.62 485.13 568.81 477.64 568.4', 1, 0, 1, NULL, 13),
(3119, 10, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '485.13 568.81 484.2 587.62 491.75 587.97 492.68 569.16 485.13 568.81', 1, 0, 1, NULL, 13),
(3120, 11, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '492.68 569.16 491.75 587.97 499.24 588.38 500.17 569.56 492.68 569.16', 1, 0, 1, NULL, 13),
(3121, 12, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '500.17 569.56 499.24 588.38 506.79 588.73 507.72 569.91 500.17 569.56', 1, 0, 1, NULL, 13),
(3122, 13, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '507.72 569.91 506.79 588.73 514.28 589.13 515.21 570.32 507.72 569.91', 1, 0, 1, NULL, 13),
(3123, 14, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '515.21 570.32 514.34 589.13 521.83 589.48 522.76 570.67 515.21 570.32', 1, 0, 1, NULL, 13),
(3124, 15, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '522.76 570.67 521.83 589.48 529.32 589.83 530.25 571.07 522.76 570.67', 1, 0, 1, NULL, 13),
(3125, 16, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '530.31 571.07 529.38 589.83 536.87 590.24 537.8 571.42 530.31 571.07', 1, 0, 1, NULL, 13),
(3126, 17, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '537.8 571.42 536.87 590.24 544.36 590.58 545.35 571.83 537.8 571.42', 1, 0, 1, NULL, 13),
(3127, 18, '450.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M545.35,571.83l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(3128, 19, '450.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '544.83 581.24 544.36 590.64 563.18 591.57 563.64 582.16 544.83 581.24', 1, 0, 1, NULL, 13),
(3129, 20, '450.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '544.36 590.64 543.9 600.11 562.71 600.98 563.18 591.57 544.36 590.64', 1, 0, 1, NULL, 13),
(3130, 21, '450.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M543.9,600.11l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(3131, 22, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '536.87 590.24 535.94 609.05 543.43 609.4 544.36 590.64 536.87 590.24', 1, 0, 1, NULL, 13),
(3132, 23, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '529.32 589.89 528.39 608.64 535.88 609.05 536.87 590.24 529.32 589.89', 1, 0, 1, NULL, 13),
(3133, 24, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '521.77 589.48 520.84 608.3 528.39 608.64 529.32 589.89 521.77 589.48', 1, 0, 1, NULL, 13),
(3134, 25, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '514.28 589.13 513.35 607.89 520.84 608.3 521.77 589.48 514.28 589.13', 1, 0, 1, NULL, 13),
(3135, 26, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '506.73 588.73 505.8 607.54 513.29 607.89 514.28 589.13 506.73 588.73', 1, 0, 1, NULL, 13),
(3136, 27, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '499.24 588.38 498.31 607.13 505.8 607.54 506.73 588.73 499.24 588.38', 1, 0, 1, NULL, 13),
(3137, 28, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '491.69 587.97 490.76 606.79 498.31 607.13 499.24 588.38 491.69 587.97', 1, 0, 1, NULL, 13),
(3138, 29, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '484.2 587.62 483.27 606.38 490.76 606.79 491.69 587.97 484.2 587.62', 1, 0, 1, NULL, 13),
(3139, 30, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '476.65 587.22 475.72 606.03 483.21 606.38 484.2 587.62 476.65 587.22', 1, 0, 1, NULL, 13),
(3140, 31, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '469.16 586.87 468.23 605.63 475.72 606.03 476.65 587.22 469.16 586.87', 1, 0, 1, NULL, 13),
(3141, 32, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '461.61 586.46 460.68 605.28 468.23 605.63 469.16 586.87 461.61 586.46', 1, 0, 1, NULL, 13),
(3142, 33, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '454.12 586.11 453.19 604.87 460.68 605.28 461.61 586.46 454.12 586.11', 1, 0, 1, NULL, 13),
(3143, 34, '360.00', 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '446.57 585.71 445.64 604.52 453.19 604.87 454.12 586.11 446.57 585.71', 1, 0, 1, NULL, 13),
(3144, 5, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '445.26 612.14 444.33 630.96 451.83 631.37 452.76 612.55 445.26 612.14', 1, 0, 1, NULL, 13);
INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(3145, 6, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '452.76 612.55 451.83 631.37 459.32 631.71 460.31 612.9 452.76 612.55', 1, 0, 1, NULL, 13),
(3146, 7, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '460.31 612.9 459.38 631.71 466.87 632.12 467.8 613.31 460.31 612.9', 1, 0, 1, NULL, 13),
(3147, 8, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '467.8 613.31 466.87 632.12 474.42 632.47 475.35 613.65 467.8 613.31', 1, 0, 1, NULL, 13),
(3148, 9, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '475.35 613.65 474.42 632.47 481.91 632.88 482.84 614.06 475.35 613.65', 1, 0, 1, NULL, 13),
(3149, 10, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '482.84 614.06 481.91 632.88 489.46 633.22 490.39 614.41 482.84 614.06', 1, 0, 1, NULL, 13),
(3150, 11, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '490.39 614.41 489.46 633.22 496.95 633.63 497.88 614.82 490.39 614.41', 1, 0, 1, NULL, 13),
(3151, 12, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '497.88 614.82 496.95 633.63 504.5 633.98 505.43 615.16 497.88 614.82', 1, 0, 1, NULL, 13),
(3152, 13, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '505.43 615.16 504.5 633.98 511.99 634.39 512.92 615.57 505.43 615.16', 1, 0, 1, NULL, 13),
(3153, 14, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '512.92 615.57 512.05 634.39 519.54 634.73 520.47 615.92 512.92 615.57', 1, 0, 1, NULL, 13),
(3154, 15, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '520.47 615.92 519.54 634.73 527.03 635.08 527.96 616.33 520.47 615.92', 1, 0, 1, NULL, 13),
(3155, 16, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '528.02 616.33 527.09 635.08 534.58 635.49 535.51 616.67 528.02 616.33', 1, 0, 1, NULL, 13),
(3156, 17, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '535.51 616.67 534.58 635.49 542.07 635.84 543.06 617.08 535.51 616.67', 1, 0, 1, NULL, 13),
(3157, 18, '450.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M543.06,617.08l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(3158, 19, '450.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '542.53 626.49 542.07 635.89 560.88 636.83 561.35 627.42 542.53 626.49', 1, 0, 1, NULL, 13),
(3159, 20, '450.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '542.07 635.89 541.61 645.36 560.42 646.23 560.88 636.83 542.07 635.89', 1, 0, 1, NULL, 13),
(3160, 21, '450.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M541.61,645.36l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(3161, 22, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '534.58 635.49 533.65 654.3 541.14 654.65 542.07 635.89 534.58 635.49', 1, 0, 1, NULL, 13),
(3162, 23, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '527.03 635.14 526.1 653.9 533.59 654.3 534.58 635.49 527.03 635.14', 1, 0, 1, NULL, 13),
(3163, 24, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '519.48 634.73 518.55 653.55 526.1 653.9 527.03 635.14 519.48 634.73', 1, 0, 1, NULL, 13),
(3164, 25, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '511.99 634.39 511.06 653.14 518.55 653.55 519.48 634.73 511.99 634.39', 1, 0, 1, NULL, 13),
(3165, 26, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '504.44 633.98 503.51 652.79 511 653.14 511.99 634.39 504.44 633.98', 1, 0, 1, NULL, 13),
(3166, 27, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '496.95 633.63 496.02 652.39 503.51 652.79 504.44 633.98 496.95 633.63', 1, 0, 1, NULL, 13),
(3167, 28, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '489.4 633.22 488.47 652.04 496.02 652.39 496.95 633.63 489.4 633.22', 1, 0, 1, NULL, 13),
(3168, 29, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '481.91 632.88 480.98 651.63 488.47 652.04 489.4 633.22 481.91 632.88', 1, 0, 1, NULL, 13),
(3169, 30, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '474.36 632.47 473.43 651.28 480.92 651.63 481.91 632.88 474.36 632.47', 1, 0, 1, NULL, 13),
(3170, 31, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '466.87 632.12 465.94 650.88 473.43 651.28 474.36 632.47 466.87 632.12', 1, 0, 1, NULL, 13),
(3171, 32, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '459.32 631.71 458.39 650.53 465.94 650.88 466.87 632.12 459.32 631.71', 1, 0, 1, NULL, 13),
(3172, 33, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '451.83 631.37 450.9 650.12 458.39 650.53 459.32 631.71 451.83 631.37', 1, 0, 1, NULL, 13),
(3173, 34, '360.00', 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '444.28 630.96 443.35 649.77 450.9 650.12 451.83 631.37 444.28 630.96', 1, 0, 1, NULL, 13),
(3174, 1, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '442.53 656.97 441.6 675.79 449.09 676.19 450.02 657.38 442.53 656.97', 1, 0, 1, NULL, 13),
(3175, 6, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '450.02 657.38 449.09 676.19 456.58 676.54 457.57 657.73 450.02 657.38', 1, 0, 1, NULL, 13),
(3176, 7, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '457.57 657.73 456.64 676.54 464.13 676.95 465.06 658.13 457.57 657.73', 1, 0, 1, NULL, 13),
(3177, 8, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '465.06 658.13 464.13 676.95 471.68 677.3 472.61 658.48 465.06 658.13', 1, 0, 1, NULL, 13),
(3178, 9, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '472.61 658.48 471.68 677.3 479.17 677.7 480.1 658.89 472.61 658.48', 1, 0, 1, NULL, 13),
(3179, 10, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '480.1 658.89 479.17 677.7 486.72 678.05 487.65 659.24 480.1 658.89', 1, 0, 1, NULL, 13),
(3180, 11, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '487.65 659.24 486.72 678.05 494.21 678.46 495.14 659.64 487.65 659.24', 1, 0, 1, NULL, 13),
(3181, 12, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '495.14 659.64 494.21 678.46 501.76 678.81 502.69 659.99 495.14 659.64', 1, 0, 1, NULL, 13),
(3182, 13, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '502.69 659.99 501.76 678.81 509.25 679.21 510.18 660.4 502.69 659.99', 1, 0, 1, NULL, 13),
(3183, 14, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '510.18 660.4 509.31 679.21 516.8 679.56 517.73 660.75 510.18 660.4', 1, 0, 1, NULL, 13),
(3184, 15, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '517.73 660.75 516.8 679.56 524.29 679.91 525.22 661.15 517.73 660.75', 1, 0, 1, NULL, 13),
(3185, 16, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '525.28 661.15 524.35 679.91 531.84 680.32 532.77 661.5 525.28 661.15', 1, 0, 1, NULL, 13),
(3186, 17, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '532.77 661.5 531.84 680.32 539.33 680.66 540.32 661.91 532.77 661.5', 1, 0, 1, NULL, 13),
(3187, 18, '450.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M540.32,661.91l12.08.64s7.2.64,6.27,9.41v.29l-18.82-.93Z', 1, 1, 1, NULL, 13),
(3188, 19, '450.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '539.8 671.32 539.33 680.72 558.15 681.65 558.61 672.24 539.8 671.32', 1, 0, 1, NULL, 13),
(3189, 20, '450.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '539.33 680.72 538.87 690.19 557.68 691.06 558.15 681.65 539.33 680.72', 1, 0, 1, NULL, 13),
(3190, 21, '450.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M538.87,690.19l-.46,9.35,14.63.7a4.45,4.45,0,0,0,4.36-4.18l.23-5Z', 1, 1, 1, NULL, 13),
(3191, 22, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '531.84 680.32 530.91 699.13 538.4 699.48 539.33 680.72 531.84 680.32', 1, 0, 1, NULL, 13),
(3192, 23, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '524.29 679.97 523.37 698.73 530.86 699.13 531.84 680.32 524.29 679.97', 1, 0, 1, NULL, 13),
(3193, 24, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '516.74 679.56 515.82 698.38 523.37 698.73 524.29 679.97 516.74 679.56', 1, 0, 1, NULL, 13),
(3194, 25, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '509.25 679.21 508.32 697.97 515.82 698.38 516.74 679.56 509.25 679.21', 1, 0, 1, NULL, 13),
(3195, 26, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '501.7 678.81 500.77 697.62 508.27 697.97 509.25 679.21 501.7 678.81', 1, 0, 1, NULL, 13),
(3196, 27, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '494.21 678.46 493.28 697.22 500.77 697.62 501.7 678.81 494.21 678.46', 1, 0, 1, NULL, 13),
(3197, 28, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '486.66 678.05 485.73 696.87 493.28 697.22 494.21 678.46 486.66 678.05', 1, 0, 1, NULL, 13),
(3198, 29, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '479.17 677.7 478.24 696.46 485.73 696.87 486.66 678.05 479.17 677.7', 1, 0, 1, NULL, 13),
(3199, 30, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '471.62 677.3 470.69 696.11 478.19 696.46 479.17 677.7 471.62 677.3', 1, 0, 1, NULL, 13),
(3200, 31, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '464.13 676.95 463.2 695.71 470.69 696.11 471.62 677.3 464.13 676.95', 1, 0, 1, NULL, 13),
(3201, 32, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '456.58 676.54 455.65 695.36 463.2 695.71 464.13 676.95 456.58 676.54', 1, 0, 1, NULL, 13),
(3202, 33, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '449.09 676.19 448.16 694.95 455.65 695.36 456.58 676.54 449.09 676.19', 1, 0, 1, NULL, 13),
(3203, 34, '360.00', 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '441.54 675.79 440.61 694.6 448.16 694.95 449.09 676.19 441.54 675.79', 1, 0, 1, NULL, 13),
(3204, 5, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '440.33 701.69 439.4 720.45 446.9 720.85 447.83 702.04 440.33 701.69', 1, 0, 1, NULL, 13),
(3205, 6, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '447.83 702.04 446.9 720.85 454.45 721.2 455.38 702.39 447.83 702.04', 1, 0, 1, NULL, 13),
(3206, 7, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '455.38 702.39 454.45 721.2 461.94 721.61 462.92 702.79 455.38 702.39', 1, 0, 1, NULL, 13),
(3207, 8, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '462.92 702.79 462 721.61 469.49 721.96 470.42 703.14 462.92 702.79', 1, 0, 1, NULL, 13),
(3208, 9, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '470.42 703.14 469.49 721.96 476.98 722.36 477.91 703.55 470.42 703.14', 1, 0, 1, NULL, 13),
(3209, 10, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '477.96 703.55 477.04 722.36 484.53 722.71 485.46 703.9 477.96 703.55', 1, 0, 1, NULL, 13),
(3210, 11, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '485.46 703.9 484.53 722.71 492.02 723.12 493 704.3 485.46 703.9', 1, 0, 1, NULL, 13),
(3211, 12, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '492.95 704.3 492.08 723.12 499.57 723.47 500.5 704.65 492.95 704.3', 1, 0, 1, NULL, 13),
(3212, 13, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '500.5 704.65 499.57 723.47 507.06 723.87 507.99 705.06 500.5 704.65', 1, 0, 1, NULL, 13),
(3213, 14, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '508.05 705.06 507.12 723.87 514.61 724.22 515.54 705.41 508.05 705.06', 1, 0, 1, NULL, 13),
(3214, 15, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '515.54 705.41 514.61 724.22 522.1 724.63 523.03 705.81 515.54 705.41', 1, 0, 1, NULL, 13),
(3215, 16, '360.00', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '523.09 705.81 522.16 724.63 529.65 724.98 530.58 706.16 523.09 705.81', 1, 0, 1, NULL, 13),
(3216, 17, '356.60', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '530.58 706.16 529.65 724.98 537.26 724.98 538.13 706.57 530.58 706.16', 1, 0, 1, NULL, 13),
(3217, 18, '378.26', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '538.07 706.57 537.15 725.13 545.48 724.95 545.62 706.92 538.07 706.57', 1, 0, 1, NULL, 13),
(3218, 19, '384.76', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '545.62 706.97 545.48 724.95 553.93 724.95 553.93 707.37 545.62 706.97', 1, 0, 1, NULL, 13),
(3219, 20, '389.92', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '553.93 707.37 553.93 724.95 562.76 725.13 562.77 707.79 553.93 707.37', 1, 0, 1, NULL, 13),
(3220, 21, '380.66', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '562.77 707.79 562.76 724.95 571.54 724.95 571.54 708.26 562.77 707.79', 1, 0, 1, NULL, 13),
(3221, 22, '371.40', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '571.54 708.26 577.38 708.54 580.36 708.62 580.36 725.13 571.54 724.95 571.54 708.26', 1, 0, 1, NULL, 13),
(3222, 24, '447.18', 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, '580.36 720.55 600.49 720.6 600.29 729.26 580.36 729.53 580.36 720.55', 1, 0, 1, NULL, 13);

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
  `montoTotalBs` decimal(12,2) DEFAULT NULL,
  `saldoBs` decimal(12,2) DEFAULT NULL,
  `saldoUsd` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plandepago`
--

INSERT INTO `plandepago` (`id`, `fecha`, `nroCuotas`, `estado`, `deleted_at`, `montoTotal`, `idVenta`, `cuotaInicialUsd`, `cuotaInicialBs`, `montoTotalBs`, `saldoBs`, `saldoUsd`) VALUES
(1, '2018-04-03 22:39:51', 60, 'd', NULL, '4500.00', 42, '450.00', '3132.00', '31320.00', '28188.00', '4050.00'),
(3, '2018-04-03 23:12:26', 10, 'd', NULL, '4050.00', 44, '405.00', '2818.80', '28188.00', '25369.20', '3645.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
(23, '2018-03-11 20:32:16', 4, 13, NULL),
(24, '2018-03-12 22:31:52', 4, 10, NULL),
(25, '2018-03-20 16:59:54', 4, 10, NULL),
(26, '2018-03-26 00:24:33', 4, 10, NULL);

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
  `formaPago` varchar(11) DEFAULT NULL,
  `idAsiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `deleted_at` date DEFAULT NULL,
  `montoBs` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccionventa`
--

INSERT INTO `transaccionventa` (`id`, `idVenta`, `idBanco`, `idCuenta`, `nroDocumento`, `tipo`, `monto`, `montoBs`, `fecha`, `deleted_at`) VALUES
(1, 41, 3, 4, 2147483647, 'i', '4000.00', '27840.00', '2018-04-03', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `precio`, `estado`, `tipoPago`, `descuento`, `reserva`, `idEmpleado`, `idCliente`, `idTipoCambio`, `idLote`, `IdAsiento`, `pagoBs`, `pagoUsd`, `totalapagar`, `totalapagarBs`, `cambioBs`, `cambioUsd`, `precioBs`, `moneda`, `reservaBs`, `tipoVenta`) VALUES
(37, '2018-04-03 01:15:12', '6181.50', 'p', 'e', '15', '0.00', 4, 10, 1, 2581, 1, '41760.00', '6000.00', '5254.28', '36569.75', '5190.25', '745.72', '43023.24', 'DOLAR', '0.00', 'CONTADO'),
(38, '2018-04-03 03:18:11', '4500.00', 'p', 'e', '15', '0.00', 4, 10, 1, 2580, 2, '272832.00', '39200.00', '3825.00', '26622.00', '246210.00', '35375.00', '31320.00', 'DOLAR', '0.00', 'CONTADO'),
(39, '2018-04-03 03:20:41', '4500.00', 'p', 'e', NULL, '0.00', 4, 10, 1, 2579, 3, '27840.00', '4000.00', '3825.00', '26622.00', '1218.00', '175.00', '31320.00', 'DOLAR', '0.00', 'CONTADO'),
(40, '2018-04-03 03:22:06', '4500.00', 'p', 'e', NULL, '0.00', 4, 10, 1, 2578, 4, '27840.00', '4000.00', '3825.00', '26622.00', '1218.00', '175.00', '31320.00', 'DOLAR', '0.00', 'CONTADO'),
(41, '2018-04-03 14:29:44', '4500.00', 'p', 'b', '15', '0.00', 4, 10, 1, 2577, 5, '27840.00', '4000.00', '3825.00', '26622.00', '1218.00', '175.00', '31320.00', 'DOLAR', '0.00', 'CONTADO'),
(42, '2018-04-03 22:39:51', '4500.00', 'c', 'e', '0', '0.00', 4, 10, 1, 2576, 6, '3480.00', '500.00', '450.00', '3132.00', '348.00', '50.00', '31320.00', 'DOLAR', '0.00', 'PLAZO'),
(44, '2018-04-03 23:12:26', '4500.00', 'c', 'e', '10', '0.00', 4, 11, 1, 2575, 8, '3000.00', '431.03', '405.00', '2818.80', '181.20', '26.03', '31320.00', 'BOLIVIANO', '0.00', 'PLAZO');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_moneda` (`id_moneda`);

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
-- Indices de la tabla `librocompra`
--
ALTER TABLE `librocompra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libroventa`
--
ALTER TABLE `libroventa`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `autorizacionpago`
--
ALTER TABLE `autorizacionpago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `codigovendedor`
--
ALTER TABLE `codigovendedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT de la tabla `cuentaautomatica`
--
ALTER TABLE `cuentaautomatica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `cuentagrupo`
--
ALTER TABLE `cuentagrupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cuentaimpuesto`
--
ALTER TABLE `cuentaimpuesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cuotaminima`
--
ALTER TABLE `cuotaminima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `cuotas`
--
ALTER TABLE `cuotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `detallecuota`
--
ALTER TABLE `detallecuota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalleprereserva`
--
ALTER TABLE `detalleprereserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detallereserva`
--
ALTER TABLE `detallereserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT de la tabla `librocompra`
--
ALTER TABLE `librocompra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `libroventa`
--
ALTER TABLE `libroventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3223;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `transaccionventa`
--
ALTER TABLE `transaccionventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
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
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id`);

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
  ADD CONSTRAINT `transaccionpago_ibfk_2` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`),
  ADD CONSTRAINT `transaccionpago_ibfk_3` FOREIGN KEY (`idCuenta`) REFERENCES `cuentabanco` (`id`),
  ADD CONSTRAINT `transaccionpago_ibfk_4` FOREIGN KEY (`idPago`) REFERENCES `pagocuota` (`id`);

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
