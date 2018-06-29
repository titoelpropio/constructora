-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-07-2017 a las 00:46:20
-- Versión del servidor: 5.5.55-0+deb8u1
-- Versión de PHP: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `laprovision`
--

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
(13, 'C', 1, 'Area Común sobre Calles', NULL),
(14, 'B', 1, 'Area Preferencial (Av. Principal, Aread Verdes y Equipamiento)', NULL),
(15, 'B', 3, 'Área Preferencial(Av. Principal, Áreas Verdes y Equipamiento)', NULL),
(16, 'C', 3, 'Areas Común sobre calles', NULL);

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
  `expediente` varchar(5) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellidos`, `fechaNacimiento`, `ci`, `expediente`, `lugarProcedencia`, `genero`, `celular`, `celular_ref`, `estadoCivil`, `ocupacion`, `domicilio`, `nit`, `deleted_at`, `idEmpleado`, `idPais`) VALUES
(3, 'Luis Alberto', 'Sandoval', '2017-07-12', 8888558, '', 'Santa Cruz', 'm', 65000000, 65000000, NULL, '', 'calle la Provision N° 90', 2147483647, NULL, 18, NULL),
(4, 'Yngriy', 'Ortyz Seas', '0000-00-00', 5389321, '', 'Santa Cruz de la sierra', 'f', 5389321, 5389321, NULL, '', '', 0, NULL, 41, NULL),
(5, 'adf', 'dfgdfg', '2008-02-02', 72696811, '', 'sfgsfg', 'm', 345345, 345345, NULL, '', 'sfgsfg', 345345, NULL, 62, NULL),
(6, 'asadasd', 'dadadas', '0000-00-00', 44484848, '', 'Santa Cruz', 'm', 66602225, 65544758, NULL, '', 'Calle Pucar{a', 2147483647, NULL, 62, NULL),
(7, 'Elizabeth ', 'Rodriguez sanchez', '1995-07-17', 9741981, '', 'Andrea ivañez', 'f', 72103519, 72696811, NULL, '', 'B/avaroa C/ capitan rodriguez ', 0, NULL, 63, NULL),
(8, 'Katherine Scarlet', 'Roda Pecho', '1987-11-30', 4615356, '', 'Madrid España', 'f', 677334451, 0, NULL, '', '', 0, NULL, 40, NULL);

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
-- Estructura de tabla para la tabla `cuentabanco`
--

CREATE TABLE IF NOT EXISTS `cuentabanco` (
`id` int(11) NOT NULL,
  `nroCuenta` int(11) DEFAULT NULL,
  `idBanco` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentabanco`
--

INSERT INTO `cuentabanco` (`id`, `nroCuenta`, `idBanco`, `deleted_at`) VALUES
(4, 24788800, 3, NULL),
(5, 24788652, 3, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuotaminima`
--

INSERT INTO `cuotaminima` (`id`, `porcentaje`, `idProyecto`, `deleted_at`, `updated_at`, `created_at`) VALUES
(9, 10.00, 1, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `descuentoventa`
--

INSERT INTO `descuentoventa` (`id`, `porcentaje`, `idProyecto`, `fecha`, `deleted_at`) VALUES
(2, 15.00, 1, '2017-06-29 23:41:46', NULL),
(3, 15.00, 3, '2017-07-01 11:31:10', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleprereserva`
--

INSERT INTO `detalleprereserva` (`id`, `idLote`, `estado`, `idPreReserva`, `deleted_at`) VALUES
(3, 679, 'p', 3, NULL),
(4, 678, 'r', 3, NULL),
(5, 1095, 'p', 4, NULL),
(6, 1129, 'p', 5, NULL),
(7, 983, 'p', 5, NULL),
(8, 969, 'p', 6, NULL),
(9, 969, 'r', 6, NULL),
(10, 47, 'p', 7, NULL),
(11, 49, 'p', 8, NULL),
(12, 1172, 'p', 9, NULL);

--
-- Disparadores `detalleprereserva`
--
DELIMITER //
CREATE TRIGGER `Actualizar_Lote_PreReserva` AFTER INSERT ON `detalleprereserva`
 FOR EACH ROW UPDATE lote 

SET lote.estado=1 

WHERE lote.id=new.idLote
//
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
  `tipoPago` char(4) NOT NULL,
  `estado` char(4) NOT NULL DEFAULT 'r',
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detallereserva`
--

INSERT INTO `detallereserva` (`id`, `idLote`, `idReserva`, `subTotal`, `tipoPago`, `estado`, `deleted_at`) VALUES
(1, 678, 1, 696.00, 'b', 'v', NULL),
(2, 969, 2, 696.00, 'b', 'r', NULL),
(3, 969, 3, 700.00, 'e', 'r', NULL);

--
-- Disparadores `detallereserva`
--
DELIMITER //
CREATE TRIGGER `Actualizar_Lote_Reserva` AFTER INSERT ON `detallereserva`
 FOR EACH ROW UPDATE lote 

SET lote.estado=2 

WHERE lote.id=new.idLote
//
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `apellido`, `direccion`, `ci`, `expedido`, `celular`, `genero`, `codigo`, `estado`, `idCargo`, `idTurno`, `deleted_at`, `idPais`) VALUES
(4, 'Modesto ', 'Saldaña Michalec', 'barrio avaroa', 8883510, '', 72639636, 'm', '', 'h', 1, 1, NULL, NULL),
(18, 'Gustavo ', 'Arancibia Chaira', 'Montero Barrio Porvenir', 9687454, '', 75096558, 'm', '', 'h', 1, 1, NULL, NULL),
(19, 'Yacquiline', 'Estivariz Bustilos', '', 2947401, '', 70246916, 'f', '', 'h', 4, 1, NULL, NULL),
(20, 'Stephanie', 'Nuñes Estivariz', '', 4602461, '', 70246916, 'f', '', 'h', 4, 1, NULL, NULL),
(21, 'Ruddy Edwin ', 'Salvatierra Estivariz', '', 70246916, '', 70246916, 'm', '', 'h', 4, 1, NULL, NULL),
(22, 'Luis Gaurahari ', 'Cabrera Pacheco', '', 3537063, '', 76335392, 'm', '', 'h', 5, 1, NULL, NULL),
(23, 'Carlos', 'del Castillo', '', 476828, '', 476828, 'm', '7469c', 'h', 6, 1, NULL, NULL),
(24, 'Maribel', 'Ayala Mendoza ', '', 1109611, '', 1109611, 'f', '10ee6b', 'h', 3, 1, NULL, NULL),
(25, 'Lady elsa ', 'del castillo justiniano', '', 4735285, '', 60837917, 'f', '484135', 'h', 3, 1, NULL, NULL),
(26, 'Sandro', 'Arnez Velarde ', '', 3451951, '', 3451951, 'm', '34ac2f', 'h', 3, 1, NULL, NULL),
(27, 'Ivan Abad', 'Landivar Limachi', '', 3872282, '', 3872282, 'm', '3b161a', 'h', 3, 1, NULL, NULL),
(28, 'Erwin ', 'Morales Lozano', '', 3822769, '', 3822769, 'm', '3a54b1', 'h', 3, 1, NULL, NULL),
(29, 'Franz', 'mike', '', 78583115, '', 78583115, 'm', '', 'h', 1, 1, NULL, NULL),
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
(50, 'Jacqueline', 'Machaca Valverde', '', 6221954, '', 6221954, 'f', '5ef082', 'h', 7, 1, NULL, NULL),
(51, 'Mauricio', 'Parada Mayer', '', 3218292, '', 3218292, 'm', '311b74', 'h', 7, 1, NULL, NULL),
(52, 'Ricardo', ' Ortiz', '', 4687951, '', 4687951, 'm', '47884f', 'h', 7, 1, NULL, NULL),
(53, 'Rolly', 'Cuellar', '', 3216572, '', 3216572, 'm', '3114bc', 'h', 7, 1, NULL, NULL),
(54, 'Renato', 'Justiniano', '', 7676697, '', 7676697, 'm', '752319', 'h', 7, 1, NULL, NULL),
(55, 'Vauvin', 'Hurtado', '', 4629183, '', 4629183, 'm', '46a2bf', 'h', 3, 1, NULL, NULL),
(56, 'Erwin ', 'Morales del Castillo', '', 6850481, '', 6850481, 'm', '6887b1', 'h', 7, 1, NULL, NULL),
(57, 'Mirta', 'Del Castillo', '', 4566146, '', 4566146, 'f', '45ac82', 'h', 7, 1, NULL, NULL),
(58, 'Flavio Roberto', 'Diaz Herrera', '', 2473651, '', 70630213, 'm', '25beb3', 'h', 7, 1, NULL, NULL),
(59, 'Lucas Marcelo', 'Entrambasaaguas Rios', '', 3271572, '', 61376242, 'm', '31eb94', 'h', 7, 1, NULL, NULL),
(60, 'Gustavo', 'Arancibia Chaira', '', 666, '', 75096558, 'm', '29a', 'h', 7, 1, NULL, NULL),
(61, 'Luis Enrique', 'Lopez Carrillo', 'Radial 10', 7435616, '', 75643262, 'm', '717560', 'h', 7, 1, NULL, NULL),
(62, 'Willians', 'Duabyakosky C.', 'Calle Pucará', 5841985, '', 65009460, 'm', '592441', 'h', 1, 1, NULL, NULL),
(63, 'Elizabeth', 'Rodriguez ', '', 9741981, '', 9741981, 'm', '94a69d', 'h', 7, 1, NULL, NULL),
(64, 'Leonardo Fabio', 'Balcazar Ríos', '', 2992489, '', 2992489, 'm', '2da969', 'h', 7, 1, NULL, NULL),
(65, 'Karen Gloria', 'Herrera Gonzales', '', 4640902, '', 4640902, 'f', '46d086', 'h', 7, 1, NULL, NULL),
(66, 'Marcela tarija', 'hoyos abrego', '', 4575941, '', 4575941, 'f', '45d2c5', 'h', 7, 1, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=1399 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(45, 1, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M814.3,136.7l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L814.3,136.7z', 1, 1, 1, NULL, 13),
(46, 2, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '815.9,104.3 815.1,120.5 782.8,118.9 783.6,102.7', 1, 0, 1, NULL, 13),
(47, 3, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, '784.4,86.6 783.6,102.7 815.9,104.3 816.7,88.2', 1, 0, 1, NULL, 13),
(48, 4, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M817.6,71.9l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L817.6,71.9z', 1, 1, 1, NULL, 13),
(49, 5, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, '817.6,71.9 816,104.3 828.9,105 830.5,72.6', 1, 0, 1, NULL, 13),
(50, 6, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '830.5,72.6 828.9,105 841.8,105.6 843.5,73.2', 1, 0, 1, NULL, 13),
(51, 7, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '843.5,73.2 841.9,105.6 854.8,106.3 856.4,73.9', 1, 0, 1, NULL, 13),
(52, 8, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '856.4,73.9 854.9,106.3 867.8,106.9 869.4,74.5', 1, 0, 1, NULL, 13),
(53, 9, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '869.4,74.5 867.8,106.9 880.7,107.6 882.3,75.2', 1, 0, 1, NULL, 13),
(54, 10, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '882.4,75.2 880.8,107.6 893.7,108.2 895.3,75.8', 1, 0, 1, NULL, 13),
(55, 1, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M806,308.8l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L806,308.8z', 1, 1, 1, NULL, 13),
(56, 11, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '895.3,75.8 893.7,108.2 906.6,108.9 908.3,76.5', 1, 0, 1, NULL, 13),
(57, 2, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '807.6,276.4 806.8,292.6 774.4,291 775.3,274.8', 1, 0, 1, NULL, 13),
(58, 3, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '776,258.7 775.3,274.8 807.6,276.4 808.4,260.3', 1, 0, 1, NULL, 13),
(59, 12, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '908.2,76.5 906.6,108.9 919.6,109.5 921.2,77.1', 1, 0, 1, NULL, 13),
(60, 4, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M809.3,244l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L809.3,244z', 1, 1, 1, NULL, 13),
(61, 13, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '921.2,77.1 919.6,109.5 932.5,110.2 934.1,77.8', 1, 0, 1, NULL, 13),
(62, 5, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '809.3,244 807.7,276.4 820.6,277.1 822.2,244.7', 1, 0, 1, NULL, 13),
(63, 6, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '822.2,244.7 820.6,277.1 833.5,277.7 835.1,245.3', 1, 0, 1, NULL, 13),
(64, 7, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '835.2,245.3 833.6,277.7 846.5,278.4 848.1,246', 1, 0, 1, NULL, 13),
(65, 8, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '848.1,246 846.5,278.4 859.4,279 861.1,246.6', 1, 0, 1, NULL, 13),
(66, 9, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '861,246.6 859.4,279 872.4,279.6 874,247.3', 1, 0, 1, NULL, 13),
(67, 10, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '874,247.3 872.4,279.6 885.3,280.3 887,247.9', 1, 0, 1, NULL, 13),
(68, 14, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '934.2,77.8 932.6,110.2 945.5,110.8 947.1,78.4', 1, 0, 1, NULL, 13),
(69, 11, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '887,247.9 885.4,280.3 898.3,280.9 899.9,248.6', 1, 0, 1, NULL, 13),
(70, 15, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '947.1,78.4 945.5,110.8 958.4,111.5 960,79.1', 1, 0, 1, NULL, 13),
(71, 16, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '960.1,79.1 958.5,111.5 971.4,112.1 973,79.7', 1, 0, 1, NULL, 13),
(72, 12, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '899.9,248.6 898.3,280.9 911.2,281.6 912.9,249.2', 1, 0, 1, NULL, 13),
(73, 17, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '973,79.7 971.4,112.1 984.3,112.8 986,80.4', 1, 0, 1, NULL, 13),
(74, 13, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '912.8,249.2 911.2,281.6 924.2,282.2 925.8,249.9', 1, 0, 1, NULL, 13),
(75, 14, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '925.8,249.9 924.2,282.2 937.2,282.9 938.8,250.5', 1, 0, 1, NULL, 13),
(76, 15, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '938.7,250.5 937.2,282.9 950.1,283.5 951.7,251.2', 1, 0, 1, NULL, 13),
(78, 16, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '951.7,251.2 950.1,283.5 963.1,284.2 964.7,251.8', 1, 0, 1, NULL, 13),
(79, 19, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '985.2,96.6 984.3,112.8 1016.7,114.4 1017.5,98.2', 1, 0, 1, NULL, 13),
(80, 17, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '964.7,251.8 963.1,284.2 976,284.8 977.6,252.5', 1, 0, 1, NULL, 13),
(83, 20, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '984.3,112.8 983.5,129.1 1015.9,130.6 1016.7,114.4', 1, 0, 1, NULL, 13),
(84, 21, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M983.5,129.1l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L983.5,129.1z', 1, 1, 1, NULL, 13),
(85, 22, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '971.4,112.1 969.8,144.5 982.7,145.1 984.3,112.8', 1, 0, 1, NULL, 13),
(86, 23, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '958.4,111.5 956.8,143.8 969.7,144.5 971.4,112.1', 1, 0, 1, NULL, 13),
(87, 24, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '945.4,110.8 943.8,143.2 956.8,143.8 958.4,111.5', 1, 0, 1, NULL, 13),
(88, 25, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '932.5,110.2 930.9,142.5 943.8,143.2 945.5,110.8', 1, 0, 1, NULL, 13),
(89, 26, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '919.5,109.5 917.9,141.9 930.8,142.5 932.5,110.2', 1, 0, 1, NULL, 13),
(90, 27, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '906.6,108.9 905,141.2 917.9,141.9 919.5,109.5', 1, 0, 1, NULL, 13),
(91, 28, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '893.7,108.2 892.1,140.6 905,141.2 906.6,108.9', 1, 0, 1, NULL, 13),
(92, 29, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '880.7,107.6 879.1,139.9 892,140.6 893.7,108.2', 1, 0, 1, NULL, 13),
(93, 22, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '963,284.2 961.4,316.6 974.4,317.2 976,284.8', 1, 0, 1, NULL, 13),
(94, 30, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '867.7,106.9 866.1,139.3 879.1,139.9 880.7,107.6', 1, 0, 1, NULL, 13),
(95, 31, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '854.8,106.3 853.2,138.7 866.1,139.3 867.7,106.9', 1, 0, 1, NULL, 13),
(96, 32, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '841.8,105.6 840.3,138 853.2,138.7 854.8,106.3', 1, 0, 1, NULL, 13),
(97, 23, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '950.1,283.5 948.5,315.9 961.4,316.6 963,284.2', 1, 0, 1, NULL, 13),
(98, 33, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '828.9,105 827.3,137.4 840.2,138 841.8,105.6', 1, 0, 1, NULL, 13),
(99, 34, 360.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '815.9,104.3 814.3,136.7 827.3,137.4 828.9,105', 1, 0, 1, NULL, 13),
(100, 24, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '937.1,282.9 935.5,315.3 948.4,315.9 950.1,283.5', 1, 0, 1, NULL, 13),
(101, 34, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '807.6,276.4 806,308.8 818.9,309.4 820.6,277.1', 1, 0, 1, NULL, 13),
(102, 33, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '820.5,277.1 818.9,309.4 831.9,310.1 833.5,277.7', 1, 0, 1, NULL, 13),
(103, 18, 450.00, 45, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M986,80.4l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L986,80.4z', 1, 1, 1, NULL, 13),
(104, 32, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '833.5,277.7 831.9,310.1 844.8,310.7 846.5,278.4', 1, 0, 1, NULL, 13),
(105, 31, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '846.5,278.4 844.9,310.7 857.8,311.4 859.4,279', 1, 0, 1, NULL, 13),
(106, 30, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '859.4,279 857.8,311.4 870.7,312 872.3,279.7', 1, 0, 1, NULL, 13),
(107, 29, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '872.4,279.7 870.8,312 883.7,312.7 885.3,280.3', 1, 0, 1, NULL, 13),
(108, 28, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '885.3,280.3 883.7,312.7 896.6,313.3 898.3,281', 1, 0, 1, NULL, 13),
(109, 27, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '898.3,281 896.7,313.3 909.6,314 911.2,281.6', 1, 0, 1, NULL, 13),
(110, 26, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '911.2,281.6 909.6,314 922.5,314.6 924.1,282.2', 1, 0, 1, NULL, 13),
(111, 25, 360.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '924.2,282.2 922.6,314.6 935.5,315.3 937.1,282.9', 1, 0, 1, NULL, 13),
(112, 1, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1057.5,405.1l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1057.5,405.1z', 1, 1, 1, NULL, 13),
(113, 2, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1059.1,372.7 1058.3,388.9 1026,387.3 1026.8,371.1', 1, 0, 1, NULL, 13),
(114, 3, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1027.6,355 1026.8,371.1 1059.1,372.7 1059.9,356.6', 1, 0, 1, NULL, 13),
(115, 1, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M803.6,393l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L803.6,393z', 1, 1, 1, NULL, 13),
(116, 2, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '805.2,360.7 804.4,376.8 772.1,375.2 772.9,359', 1, 0, 1, NULL, 13),
(117, 3, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '773.6,342.9 772.9,359 805.2,360.7 806,344.5', 1, 0, 1, NULL, 13),
(118, 4, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M806.9,328.3l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L806.9,328.3z', 1, 1, 1, NULL, 13),
(119, 5, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '806.9,328.3 805.3,360.7 818.2,361.3 819.8,328.9', 1, 0, 1, NULL, 13),
(120, 6, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '819.8,328.9 818.2,361.3 831.1,361.9 832.7,329.6', 1, 0, 1, NULL, 13),
(121, 22, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1214.6,380.5 1213,412.9 1225.9,413.6 1227.5,381.2', 1, 0, 1, NULL, 13),
(122, 23, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1201.6,379.9 1200,412.3 1212.9,412.9 1214.5,380.5', 1, 0, 1, NULL, 13),
(123, 24, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1188.6,379.2 1187,411.6 1199.9,412.3 1201.6,379.9', 1, 0, 1, NULL, 13),
(124, 7, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '832.8,329.6 831.2,361.9 844.1,362.6 845.7,330.2', 1, 0, 1, NULL, 13),
(125, 8, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '845.7,330.2 844.1,362.6 857,363.2 858.7,330.9', 1, 0, 1, NULL, 13),
(126, 25, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1175.7,378.6 1174.1,411 1187,411.6 1188.6,379.2', 1, 0, 1, NULL, 13),
(127, 26, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1162.7,377.9 1161.1,410.3 1174,411 1175.7,378.6', 1, 0, 1, NULL, 13),
(128, 9, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '858.6,330.9 857,363.2 870,363.9 871.6,331.5', 1, 0, 1, NULL, 13),
(129, 34, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1059.1,372.7 1057.5,405.1 1070.5,405.8 1072.1,373.4', 1, 0, 1, NULL, 13),
(130, 10, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '871.6,331.5 870,363.9 882.9,364.5 884.6,332.2', 1, 0, 1, NULL, 13),
(131, 33, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1072.1,373.4 1070.5,405.8 1083.4,406.4 1085,374', 1, 0, 1, NULL, 13),
(132, 11, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '884.6,332.2 883,364.5 895.9,365.2 897.5,332.8', 1, 0, 1, NULL, 13),
(133, 32, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1085,374 1083.4,406.4 1096.4,407.1 1098,374.7', 1, 0, 1, NULL, 13),
(134, 12, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '897.5,332.8 895.9,365.2 908.8,365.8 910.5,333.5', 1, 0, 1, NULL, 13),
(135, 31, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1098,374.7 1096.4,407.1 1109.3,407.7 1110.9,375.3', 1, 0, 1, NULL, 13),
(136, 13, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '910.4,333.5 908.8,365.8 921.8,366.5 923.4,334.1', 1, 0, 1, NULL, 13),
(137, 30, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1110.9,375.3 1109.3,407.7 1122.2,408.4 1123.9,376', 1, 0, 1, NULL, 13),
(138, 29, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1123.9,376 1122.3,408.4 1135.2,409 1136.8,376.6', 1, 0, 1, NULL, 13),
(139, 14, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '923.4,334.1 921.8,366.5 934.8,367.1 936.4,334.8', 1, 0, 1, NULL, 13),
(140, 28, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1136.8,376.6 1135.2,409 1148.2,409.7 1149.8,377.3', 1, 0, 1, NULL, 13),
(141, 15, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '936.4,334.8 934.8,367.1 947.7,367.8 949.3,335.4', 1, 0, 1, NULL, 13),
(142, 27, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1149.8,377.3 1148.2,409.7 1161.1,410.3 1162.7,377.9', 1, 0, 1, NULL, 13),
(143, 16, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '949.3,335.4 947.7,367.8 960.7,368.4 962.3,336.1', 1, 0, 1, NULL, 13),
(144, 17, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '962.3,336.1 960.7,368.4 973.6,369.1 975.2,336.7', 1, 0, 1, NULL, 13),
(145, 19, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '974.4,352.9 973.6,369.1 1006,370.7 1006.8,354.5', 1, 0, 1, NULL, 13),
(146, 1, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1053.4,489.1l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1053.4,489.1z', 1, 1, 1, NULL, 13),
(147, 20, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '973.6,369.1 972.8,385.4 1005.2,386.9 1006,370.7', 1, 0, 1, NULL, 13),
(148, 21, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M972.8,385.4l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L972.8,385.4z', 1, 1, 1, NULL, 13),
(149, 2, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1055,456.7 1054.2,472.9 1021.9,471.3 1022.7,455.1', 1, 0, 1, NULL, 13),
(150, 3, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1023.5,439 1022.7,455.1 1055,456.7 1055.8,440.6', 1, 0, 1, NULL, 13),
(151, 22, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '960.6,368.4 959,400.8 972,401.5 973.6,369.1', 1, 0, 1, NULL, 13),
(152, 4, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1056.7,424.3l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1056.7,424.3z', 1, 1, 1, NULL, 13),
(153, 23, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '947.7,367.8 946.1,400.2 959,400.8 960.6,368.4', 1, 0, 1, NULL, 13),
(154, 24, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '934.7,367.1 933.1,399.5 946,400.2 947.7,367.8', 1, 0, 1, NULL, 13),
(155, 25, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '921.8,366.5 920.2,398.9 933.1,399.5 934.7,367.1', 1, 0, 1, NULL, 13),
(156, 5, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1056.7,424.3 1055.1,456.7 1068,457.4 1069.6,425', 1, 0, 1, NULL, 13),
(157, 6, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1069.6,425 1068,457.4 1080.9,458 1082.6,425.6', 1, 0, 1, NULL, 13),
(158, 7, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1082.6,425.6 1081,458 1093.9,458.7 1095.5,426.3', 1, 0, 1, NULL, 13),
(159, 26, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '908.8,365.8 907.2,398.2 920.1,398.9 921.7,366.5', 1, 0, 1, NULL, 13),
(160, 8, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1095.5,426.3 1093.9,458.7 1106.9,459.3 1108.5,426.9', 1, 0, 1, NULL, 13),
(161, 27, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '895.9,365.2 894.3,397.6 907.2,398.2 908.8,365.8', 1, 0, 1, NULL, 13),
(162, 9, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1108.5,426.9 1106.9,459.3 1119.8,459.9 1121.4,427.6', 1, 0, 1, NULL, 13),
(163, 28, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '882.9,364.5 881.3,396.9 894.3,397.6 895.9,365.2', 1, 0, 1, NULL, 13),
(164, 10, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1121.4,427.6 1119.8,460 1132.8,460.6 1134.4,428.2', 1, 0, 1, NULL, 13),
(165, 29, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '870,363.9 868.4,396.3 881.3,396.9 882.9,364.5', 1, 0, 1, NULL, 13),
(166, 30, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '857,363.3 855.4,395.6 868.3,396.3 869.9,363.9', 1, 0, 1, NULL, 13),
(167, 31, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '844.1,362.6 842.5,395 855.4,395.6 857,363.3', 1, 0, 1, NULL, 13),
(168, 11, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1134.4,428.2 1132.8,460.6 1145.7,461.2 1147.3,428.9', 1, 0, 1, NULL, 13),
(169, 32, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '831.1,362 829.5,394.3 842.4,395 844.1,362.6', 1, 0, 1, NULL, 13),
(170, 12, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1147.3,428.9 1145.7,461.2 1158.7,461.9 1160.3,429.5', 1, 0, 1, NULL, 13),
(171, 33, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '818.1,361.3 816.5,393.7 829.5,394.3 831.1,362', 1, 0, 1, NULL, 13),
(172, 13, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1160.3,429.5 1158.7,461.9 1171.6,462.5 1173.2,430.2', 1, 0, 1, NULL, 13),
(173, 34, 360.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '805.2,360.7 803.6,393 816.5,393.7 818.2,361.3', 1, 0, 1, NULL, 13),
(174, 14, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1173.3,430.2 1171.7,462.5 1184.6,463.2 1186.2,430.8', 1, 0, 1, NULL, 13),
(175, 15, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1186.2,430.8 1184.6,463.2 1197.5,463.8 1199.1,431.5', 1, 0, 1, NULL, 13),
(176, 16, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1199.2,431.5 1197.6,463.8 1210.5,464.5 1212.1,432.1', 1, 0, 1, NULL, 13),
(177, 17, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1212.1,432.1 1210.5,464.5 1223.4,465.1 1225.1,432.8', 1, 0, 1, NULL, 13),
(178, 22, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1210.5,464.5 1208.9,496.9 1221.8,497.5 1223.4,465.1', 1, 0, 1, NULL, 13),
(179, 23, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1197.5,463.8 1195.9,496.2 1208.8,496.9 1210.5,464.5', 1, 0, 1, NULL, 13),
(180, 24, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1184.5,463.2 1182.9,495.6 1195.9,496.2 1197.5,463.8', 1, 0, 1, NULL, 13),
(181, 25, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1171.6,462.5 1170,494.9 1182.9,495.6 1184.6,463.2', 1, 0, 1, NULL, 13),
(182, 34, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1055,456.7 1053.4,489.1 1066.4,489.7 1068,457.4', 1, 0, 1, NULL, 13),
(183, 33, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1068,457.4 1066.4,489.7 1079.3,490.4 1080.9,458', 1, 0, 1, NULL, 13),
(184, 32, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1080.9,458 1079.3,490.4 1092.3,491 1093.9,458.7', 1, 0, 1, NULL, 13),
(185, 31, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1093.9,458.7 1092.3,491 1105.2,491.7 1106.8,459.3', 1, 0, 1, NULL, 13),
(186, 30, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1106.8,459.3 1105.2,491.7 1118.1,492.3 1119.8,460', 1, 0, 1, NULL, 13),
(187, 29, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1119.8,460 1118.2,492.3 1131.1,493 1132.7,460.6', 1, 0, 1, NULL, 13),
(188, 28, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1132.7,460.6 1131.2,493 1144.1,493.6 1145.7,461.3', 1, 0, 1, NULL, 13),
(189, 27, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1145.7,461.3 1144.1,493.6 1157,494.3 1158.6,461.9', 1, 0, 1, NULL, 13),
(190, 26, 360.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1158.6,461.9 1157,494.3 1169.9,494.9 1171.6,462.5', 1, 0, 1, NULL, 13),
(191, 1, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M799.5,477l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L799.5,477z', 1, 1, 1, NULL, 13),
(192, 2, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '801.1,444.6 800.3,460.8 768,459.2 768.8,443', 1, 0, 1, NULL, 13),
(193, 3, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '769.5,426.9 768.8,443 801.1,444.6 801.9,428.5', 1, 0, 1, NULL, 13),
(194, 4, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M802.8,412.2l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L802.8,412.2z', 1, 1, 1, NULL, 13),
(195, 1, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1049.7,571.7l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1049.7,571.7z', 1, 1, 1, NULL, 13),
(196, 2, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1051.3,539.3 1050.5,555.5 1018.2,553.8 1019,537.7', 1, 0, 1, NULL, 13),
(197, 3, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1019.7,521.5 1019,537.7 1051.3,539.3 1052.1,523.2', 1, 0, 1, NULL, 13),
(198, 4, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1053,506.9l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1053,506.9z', 1, 1, 1, NULL, 13),
(199, 5, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '802.8,412.2 801.2,444.6 814.1,445.3 815.7,412.9', 1, 0, 1, NULL, 13),
(200, 34, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1051.3,539.3 1049.7,571.7 1062.6,572.3 1064.3,539.9', 1, 0, 1, NULL, 13),
(201, 6, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '815.7,412.9 814.1,445.3 827,445.9 828.6,413.5', 1, 0, 1, NULL, 13),
(202, 33, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1064.2,539.9 1062.6,572.3 1075.6,573 1077.2,540.6', 1, 0, 1, NULL, 13),
(203, 7, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '828.7,413.5 827.1,445.9 840,446.6 841.6,414.2', 1, 0, 1, NULL, 13),
(204, 32, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1077.2,540.6 1075.6,573 1088.5,573.6 1090.2,541.2', 1, 0, 1, NULL, 13),
(205, 31, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1090.2,541.2 1088.6,573.6 1101.5,574.2 1103.1,541.9', 1, 0, 1, NULL, 13),
(206, 8, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '841.6,414.2 840,446.6 853,447.2 854.6,414.8', 1, 0, 1, NULL, 13),
(207, 30, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1103.1,541.9 1101.5,574.3 1114.4,574.9 1116,542.5', 1, 0, 1, NULL, 13),
(208, 9, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '854.5,414.8 853,447.2 865.9,447.9 867.5,415.5', 1, 0, 1, NULL, 13),
(209, 5, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1053,506.9 1051.4,539.3 1064.3,539.9 1065.9,507.5', 1, 0, 1, NULL, 13),
(210, 10, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '867.5,415.5 865.9,447.9 878.9,448.5 880.5,416.1', 1, 0, 1, NULL, 13),
(211, 6, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1065.9,507.5 1064.3,539.9 1077.2,540.6 1078.8,508.2', 1, 0, 1, NULL, 13),
(212, 7, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1078.9,508.2 1077.3,540.6 1090.2,541.2 1091.8,508.8', 1, 0, 1, NULL, 13),
(213, 11, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '880.5,416.1 878.9,448.5 891.8,449.2 893.4,416.8', 1, 0, 1, NULL, 13),
(214, 8, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1091.8,508.8 1090.2,541.2 1103.1,541.9 1104.8,509.5', 1, 0, 1, NULL, 13),
(215, 9, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1104.7,509.5 1103.1,541.9 1116.1,542.5 1117.7,510.1', 1, 0, 1, NULL, 13),
(216, 10, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1117.7,510.1 1116.1,542.5 1129,543.2 1130.7,510.8', 1, 0, 1, NULL, 13),
(217, 11, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1130.7,510.8 1129.1,543.2 1142,543.8 1143.6,511.4', 1, 0, 1, NULL, 13),
(218, 12, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1143.6,511.4 1142,543.8 1154.9,544.5 1156.6,512.1', 1, 0, 1, NULL, 13),
(219, 13, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1156.5,512.1 1154.9,544.5 1167.9,545.1 1169.5,512.7', 1, 0, 1, NULL, 13),
(220, 12, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '893.4,416.8 891.8,449.2 904.7,449.8 906.4,417.4', 1, 0, 1, NULL, 13),
(221, 13, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '906.3,417.4 904.7,449.8 917.7,450.5 919.3,418.1', 1, 0, 1, NULL, 13),
(222, 17, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1208.4,514.7 1206.8,547.1 1219.7,547.7 1221.3,515.3', 1, 0, 1, NULL, 13),
(223, 16, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1195.4,514 1193.8,546.4 1206.8,547.1 1208.4,514.7', 1, 0, 1, NULL, 13),
(224, 14, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '919.3,418.1 917.7,450.5 930.7,451.1 932.3,418.7', 1, 0, 1, NULL, 13),
(225, 15, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '932.3,418.7 930.7,451.1 943.6,451.8 945.2,419.4', 1, 0, 1, NULL, 13),
(226, 15, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1182.5,513.4 1180.9,545.8 1193.8,546.4 1195.4,514', 1, 0, 1, NULL, 13),
(227, 14, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1169.5,512.7 1167.9,545.1 1180.9,545.8 1182.5,513.4', 1, 0, 1, NULL, 13),
(228, 16, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '945.2,419.4 943.6,451.8 956.6,452.4 958.2,420', 1, 0, 1, NULL, 13),
(229, 17, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '958.2,420 956.6,452.4 969.5,453.1 971.1,420.7', 1, 0, 1, NULL, 13),
(230, 18, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M971.1,420.7l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L971.1,420.7z', 1, 1, 1, NULL, 13),
(231, 19, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '970.3,436.9 969.5,453.1 1001.9,454.7 1002.7,438.5', 1, 0, 1, NULL, 13),
(232, 20, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '969.5,453.1 968.7,469.4 1001.1,470.9 1001.9,454.7', 1, 0, 1, NULL, 13),
(233, 29, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1116.1,542.5 1114.5,574.9 1127.4,575.5 1129,543.2', 1, 0, 1, NULL, 13),
(234, 28, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1129,543.2 1127.4,575.5 1140.4,576.2 1142,543.8', 1, 0, 1, NULL, 13),
(235, 21, 450.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M968.7,469.4l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L968.7,469.4z', 1, 1, 1, NULL, 13),
(236, 27, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1142,543.8 1140.4,576.2 1153.3,576.8 1154.9,544.5', 1, 0, 1, NULL, 13),
(237, 22, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '956.5,452.4 955,484.8 967.9,485.4 969.5,453.1', 1, 0, 1, NULL, 13),
(238, 26, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1154.9,544.5 1153.3,576.8 1166.2,577.5 1167.8,545.1', 1, 0, 1, NULL, 13),
(239, 25, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1167.9,545.1 1166.3,577.5 1179.2,578.1 1180.8,545.8', 1, 0, 1, NULL, 13),
(240, 23, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '943.6,451.8 942,484.1 954.9,484.8 956.5,452.4', 1, 0, 1, NULL, 13),
(241, 24, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '930.6,451.1 929,483.5 941.9,484.1 943.6,451.8', 1, 0, 1, NULL, 13),
(242, 24, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1180.8,545.8 1179.2,578.1 1192.1,578.8 1193.8,546.4', 1, 0, 1, NULL, 13),
(243, 22, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1206.7,547.1 1205.1,579.4 1218.1,580.1 1219.7,547.7', 1, 0, 1, NULL, 13),
(244, 25, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '917.7,450.5 916.1,482.8 929,483.5 930.6,451.1', 1, 0, 1, NULL, 13),
(245, 23, 360.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1193.8,546.4 1192.2,578.8 1205.1,579.4 1206.7,547.1', 1, 0, 1, NULL, 13),
(246, 26, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '904.7,449.8 903.1,482.2 916,482.8 917.6,450.5', 1, 0, 1, NULL, 13),
(247, 27, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '891.8,449.2 890.2,481.5 903.1,482.2 904.7,449.8', 1, 0, 1, NULL, 13),
(248, 28, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '878.8,448.5 877.2,480.9 890.2,481.5 891.8,449.2', 1, 0, 1, NULL, 13),
(249, 29, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '865.9,447.9 864.3,480.2 877.2,480.9 878.8,448.5', 1, 0, 1, NULL, 13),
(250, 30, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '852.9,447.2 851.3,479.6 864.2,480.2 865.8,447.9', 1, 0, 1, NULL, 13),
(251, 31, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '840,446.6 838.4,478.9 851.3,479.6 852.9,447.2', 1, 0, 1, NULL, 13),
(252, 32, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '827,445.9 825.4,478.3 838.4,478.9 840,446.6', 1, 0, 1, NULL, 13),
(253, 33, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '814,445.3 812.4,477.6 825.4,478.3 827,445.9', 1, 0, 1, NULL, 13),
(254, 34, 360.00, 49, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '801.1,444.6 799.5,477 812.4,477.6 814.1,445.3', 1, 0, 1, NULL, 13),
(255, 2, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1046.6,623.3 1045.8,639.5 1013.5,637.8 1014.3,621.7', 1, 0, 1, NULL, 13),
(256, 3, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1015.1,605.6 1014.3,621.7 1046.6,623.3 1047.4,607.2', 1, 0, 1, NULL, 13),
(257, 5, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1048.3,590.9 1046.7,623.3 1059.6,623.9 1061.2,591.6', 1, 0, 1, NULL, 13),
(258, 6, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1061.2,591.6 1059.6,623.9 1072.5,624.6 1074.2,592.2', 1, 0, 1, NULL, 13),
(259, 7, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1074.2,592.2 1072.6,624.6 1085.5,625.2 1087.1,592.9', 1, 0, 1, NULL, 13),
(260, 8, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1087.1,592.9 1085.5,625.2 1098.5,625.9 1100.1,593.5', 1, 0, 1, NULL, 13),
(261, 9, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1100.1,593.5 1098.5,625.9 1111.4,626.5 1113,594.1', 1, 0, 1, NULL, 13),
(262, 10, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1113,594.1 1111.4,626.5 1124.4,627.2 1126,594.8', 1, 0, 1, NULL, 13),
(263, 11, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1126,594.8 1124.4,627.2 1137.3,627.8 1138.9,595.4', 1, 0, 1, NULL, 13),
(264, 12, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1138.9,595.4 1137.3,627.8 1150.3,628.5 1151.9,596.1', 1, 0, 1, NULL, 13),
(265, 13, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1151.9,596.1 1150.3,628.5 1163.2,629.1 1164.8,596.7', 1, 0, 1, NULL, 13),
(266, 14, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1164.8,596.7 1163.3,629.1 1176.2,629.8 1177.8,597.4', 1, 0, 1, NULL, 13),
(267, 1, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M809.8,220.5l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L809.8,220.5z', 1, 1, 1, NULL, 13),
(268, 15, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1177.8,597.4 1176.2,629.8 1189.1,630.4 1190.7,598', 1, 0, 1, NULL, 13),
(269, 16, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1190.8,598 1189.2,630.4 1202.1,631.1 1203.7,598.7', 1, 0, 1, NULL, 13),
(270, 17, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1203.7,598.7 1202.1,631.1 1215,631.7 1216.7,599.3', 1, 0, 1, NULL, 13),
(271, 2, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '811.4,188.1 810.6,204.3 778.3,202.7 779.1,186.5', 1, 0, 1, NULL, 13),
(272, 4, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1048.3,590.9l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1048.3,590.9z', 1, 1, 1, NULL, 13),
(273, 3, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '779.9,170.4 779.1,186.5 811.4,188.1 812.2,172', 1, 0, 1, NULL, 13),
(274, 4, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M813.1,155.8l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L813.1,155.8z', 1, 1, 1, NULL, 13),
(275, 5, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '813.1,155.8 811.5,188.1 824.4,188.8 826,156.4', 1, 0, 1, NULL, 13),
(276, 6, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '826,156.4 824.4,188.8 837.3,189.4 838.9,157.1', 1, 0, 1, NULL, 13),
(277, 7, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '839,157.1 837.4,189.4 850.3,190.1 851.9,157.7', 1, 0, 1, NULL, 13),
(278, 8, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '851.9,157.7 850.3,190.1 863.3,190.7 864.9,158.4', 1, 0, 1, NULL, 13),
(279, 9, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '864.9,158.4 863.3,190.7 876.2,191.4 877.8,159', 1, 0, 1, NULL, 13),
(280, 10, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '877.8,159 876.2,191.4 889.2,192 890.8,159.7', 1, 0, 1, NULL, 13),
(281, 11, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '890.8,159.7 889.2,192 902.1,192.7 903.7,160.3', 1, 0, 1, NULL, 13),
(282, 12, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '903.7,160.3 902.1,192.7 915.1,193.3 916.7,161', 1, 0, 1, NULL, 13),
(283, 13, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '916.6,161 915.1,193.3 928,194 929.6,161.6', 1, 0, 1, NULL, 13),
(284, 14, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '929.6,161.6 928,194 941,194.6 942.6,162.3', 1, 0, 1, NULL, 13),
(285, 15, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '942.6,162.3 941,194.6 953.9,195.3 955.5,162.9', 1, 0, 1, NULL, 13),
(286, 16, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '955.5,162.9 953.9,195.3 966.9,195.9 968.5,163.6', 1, 0, 1, NULL, 13),
(287, 17, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '968.5,163.6 966.9,195.9 979.8,196.6 981.4,164.2', 1, 0, 1, NULL, 13),
(288, 2, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1066.3,201.5 1065.5,217.7 1033.2,216 1034,199.9', 1, 0, 1, NULL, 13),
(289, 18, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M981.4,164.2l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L981.4,164.2z', 1, 1, 1, NULL, 13),
(290, 3, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1034.8,183.7 1034,199.9 1066.3,201.5 1067.1,185.4', 1, 0, 1, NULL, 13),
(291, 19, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '980.6,180.4 979.8,196.6 1012.2,198.2 1013,182', 1, 0, 1, NULL, 13),
(292, 4, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1068,169.1l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1068,169.1z', 1, 1, 1, NULL, 13),
(293, 20, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '979.8,196.6 979,212.9 1011.4,214.4 1012.2,198.2', 1, 0, 1, NULL, 13),
(294, 5, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1068,169.1 1066.4,201.5 1079.3,202.1 1080.9,169.8', 1, 0, 1, NULL, 13),
(295, 6, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1080.9,169.8 1079.3,202.1 1092.2,202.8 1093.9,170.4', 1, 0, 1, NULL, 13),
(296, 7, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1093.9,170.4 1092.3,202.8 1105.2,203.4 1106.8,171', 1, 0, 1, NULL, 13),
(297, 8, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1106.8,171 1105.2,203.4 1118.2,204.1 1119.8,171.7', 1, 0, 1, NULL, 13),
(298, 9, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1119.8,171.7 1118.2,204.1 1131.1,204.7 1132.7,172.3', 1, 0, 1, NULL, 13),
(299, 10, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1132.7,172.3 1131.1,204.7 1144.1,205.4 1145.7,173', 1, 0, 1, NULL, 13),
(300, 11, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1145.7,173 1144.1,205.4 1157,206 1158.6,173.6', 1, 0, 1, NULL, 13),
(301, 17, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1223.4,176.9 1221.8,209.3 1234.7,209.9 1236.4,177.5', 1, 0, 1, NULL, 13),
(302, 16, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1210.5,176.2 1208.9,208.6 1221.8,209.3 1223.4,176.9', 1, 0, 1, NULL, 13),
(303, 21, 450.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M979,212.9l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L979,212.9z', 1, 1, 1, NULL, 13),
(304, 15, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1197.5,175.6 1195.9,208 1208.8,208.6 1210.4,176.2', 1, 0, 1, NULL, 13),
(305, 22, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '966.9,195.9 965.3,228.3 978.2,229 979.8,196.6', 1, 0, 1, NULL, 13),
(306, 14, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1184.5,174.9 1183,207.3 1195.9,208 1197.5,175.6', 1, 0, 1, NULL, 13),
(307, 23, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '953.9,195.3 952.3,227.7 965.2,228.3 966.8,195.9', 1, 0, 1, NULL, 13),
(308, 13, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1171.6,174.3 1170,206.7 1182.9,207.3 1184.5,174.9', 1, 0, 1, NULL, 13),
(309, 24, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '940.9,194.6 939.3,227 952.2,227.7 953.9,195.3', 1, 0, 1, NULL, 13),
(310, 12, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1158.6,173.6 1157,206 1170,206.7 1171.6,174.3', 1, 0, 1, NULL, 13),
(311, 25, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '928,194 926.4,226.4 939.3,227 940.9,194.6', 1, 0, 1, NULL, 13),
(312, 26, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '915,193.3 913.4,225.7 926.3,226.4 927.9,194', 1, 0, 1, NULL, 13),
(313, 27, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '902.1,192.7 900.5,225.1 913.4,225.7 915,193.3', 1, 0, 1, NULL, 13),
(314, 28, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '889.1,192 887.5,224.4 900.5,225.1 902.1,192.7', 1, 0, 1, NULL, 13),
(315, 29, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '876.2,191.4 874.6,223.8 887.5,224.4 889.1,192', 1, 0, 1, NULL, 13),
(316, 30, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '863.2,190.7 861.6,223.1 874.5,223.8 876.2,191.4', 1, 0, 1, NULL, 13),
(317, 31, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '850.3,190.1 848.7,222.5 861.6,223.1 863.2,190.7', 1, 0, 1, NULL, 13),
(318, 32, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '837.3,189.4 835.7,221.8 848.7,222.5 850.3,190.1', 1, 0, 1, NULL, 13),
(319, 33, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '824.3,188.8 822.8,221.2 835.7,221.8 837.3,189.4', 1, 0, 1, NULL, 13),
(320, 34, 360.00, 46, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '811.4,188.1 809.8,220.5 822.8,221.2 824.4,188.8', 1, 0, 1, NULL, 13),
(321, 1, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1069.4,150.9l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1069.4,150.9z', 1, 1, 1, NULL, 13),
(322, 2, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1071,118.5 1070.2,134.7 1037.9,133 1038.7,116.8', 1, 0, 1, NULL, 13),
(323, 3, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1039.4,100.7 1038.7,116.8 1071,118.5 1071.8,102.4', 1, 0, 1, NULL, 13),
(324, 5, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1072.7,86.1 1071.1,118.5 1084,119.1 1085.6,86.7', 1, 0, 1, NULL, 13),
(325, 6, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1085.6,86.7 1084,119.1 1096.9,119.8 1098.5,87.4', 1, 0, 1, NULL, 13),
(326, 7, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1098.6,87.4 1097,119.8 1109.9,120.4 1111.5,88', 1, 0, 1, NULL, 13),
(327, 4, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1072.7,86.1L1050,85c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1072.7,86.1z', 1, 1, 1, NULL, 13),
(328, 8, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1111.5,88 1109.9,120.4 1122.8,121.1 1124.5,88.7', 1, 0, 1, NULL, 13),
(329, 9, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1124.4,88.7 1122.8,121.1 1135.8,121.7 1137.4,89.3', 1, 0, 1, NULL, 13),
(330, 10, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1137.4,89.3 1135.8,121.7 1148.7,122.4 1150.4,90', 1, 0, 1, NULL, 13),
(331, 11, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1150.4,90 1148.8,122.4 1161.7,123 1163.3,90.6', 1, 0, 1, NULL, 13),
(332, 12, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1163.3,90.6 1161.7,123 1174.6,123.7 1176.3,91.3', 1, 0, 1, NULL, 13),
(333, 17, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1228.1,93.9 1226.5,126.3 1239.4,126.9 1241,94.5', 1, 0, 1, NULL, 13),
(334, 16, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1215.1,93.2 1213.5,125.6 1226.5,126.3 1228.1,93.9', 1, 0, 1, NULL, 13),
(335, 15, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1202.2,92.6 1200.6,125 1213.5,125.6 1215.1,93.2', 1, 0, 1, NULL, 13),
(336, 13, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1176.2,91.3 1174.6,123.7 1187.6,124.3 1189.2,91.9', 1, 0, 1, NULL, 13),
(337, 14, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1189.2,91.9 1187.6,124.3 1200.6,125 1202.2,92.6', 1, 0, 1, NULL, 13),
(338, 34, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1071,118.5 1069.4,150.9 1082.3,151.5 1084,119.1', 1, 0, 1, NULL, 13),
(339, 33, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1083.9,119.1 1082.3,151.5 1095.3,152.1 1096.9,119.8', 1, 0, 1, NULL, 13),
(340, 32, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1096.9,119.8 1095.3,152.1 1108.2,152.8 1109.9,120.4', 1, 0, 1, NULL, 13),
(341, 31, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1109.9,120.4 1108.3,152.8 1121.2,153.4 1122.8,121.1', 1, 0, 1, NULL, 13),
(342, 30, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1122.8,121.1 1121.2,153.4 1134.1,154.1 1135.7,121.7', 1, 0, 1, NULL, 13),
(343, 22, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1226.4,126.3 1224.8,158.6 1237.8,159.3 1239.4,126.9', 1, 0, 1, NULL, 13),
(344, 23, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1213.5,125.6 1211.9,158 1224.8,158.6 1226.4,126.3', 1, 0, 1, NULL, 13),
(345, 24, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1200.5,125 1198.9,157.3 1211.8,158 1213.5,125.6', 1, 0, 1, NULL, 13),
(346, 25, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1187.6,124.3 1186,156.7 1198.9,157.3 1200.5,125', 1, 0, 1, NULL, 13),
(347, 26, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1174.6,123.7 1173,156 1185.9,156.7 1187.5,124.3', 1, 0, 1, NULL, 13),
(348, 27, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1161.7,123 1160.1,155.4 1173,156 1174.6,123.7', 1, 0, 1, NULL, 13),
(349, 29, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1135.8,121.7 1134.2,154.1 1147.1,154.7 1148.7,122.4', 1, 0, 1, NULL, 13),
(350, 28, 360.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1148.7,122.4 1147.1,154.7 1160.1,155.4 1161.7,123', 1, 0, 1, NULL, 13),
(351, 5, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1327.4,101.6 1325.8,134 1338.7,134.6 1340.4,102.3', 1, 0, 1, NULL, 13),
(352, 6, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1340.3,102.3 1338.7,134.6 1351.7,135.3 1353.3,102.9', 1, 0, 1, NULL, 13),
(353, 7, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1353.3,102.9 1351.7,135.3 1364.7,135.9 1366.3,103.6', 1, 0, 1, NULL, 13),
(354, 8, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1366.3,103.6 1364.7,135.9 1377.6,136.6 1379.2,104.2', 1, 0, 1, NULL, 13),
(355, 9, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1379.2,104.2 1377.6,136.6 1390.5,137.2 1392.1,104.9', 1, 0, 1, NULL, 13),
(356, 10, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1392.2,104.9 1390.6,137.2 1403.5,137.9 1405.1,105.5', 1, 0, 1, NULL, 13),
(357, 11, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1405.1,105.5 1403.5,137.9 1416.5,138.5 1418.1,106.2', 1, 0, 1, NULL, 13),
(358, 17, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1482.8,109.4 1481.3,141.8 1494.2,142.4 1495.8,110', 1, 0, 1, NULL, 13),
(359, 16, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1469.9,108.7 1468.3,141.1 1481.2,141.8 1482.8,109.4', 1, 0, 1, NULL, 13),
(360, 15, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1456.9,108.1 1455.3,140.5 1468.2,141.1 1469.9,108.7', 1, 0, 1, NULL, 13),
(361, 14, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1444,107.4 1442.4,139.8 1455.3,140.5 1456.9,108.1', 1, 0, 1, NULL, 13),
(362, 13, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1431,106.8 1429.4,139.2 1442.3,139.8 1443.9,107.4', 1, 0, 1, NULL, 13),
(363, 12, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1418.1,106.2 1416.5,138.5 1429.4,139.2 1431,106.8', 1, 0, 1, NULL, 13),
(364, 18, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1495.8,110l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1495.8,110z', 1, 1, 1, NULL, 13),
(365, 19, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1495,126.2 1494.2,142.4 1526.5,144 1527.3,127.9', 1, 0, 1, NULL, 13),
(366, 20, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1494.2,142.4 1493.3,158.7 1525.7,160.2 1526.5,144', 1, 0, 1, NULL, 13),
(367, 21, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1493.3,158.7l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1493.3,158.7z', 1, 1, 1, NULL, 13),
(368, 22, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1481.2,141.8 1479.6,174.2 1492.5,174.8 1494.2,142.4', 1, 0, 1, NULL, 13),
(369, 23, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1468.2,141.1 1466.6,173.5 1479.6,174.2 1481.2,141.8', 1, 0, 1, NULL, 13),
(370, 24, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1455.3,140.5 1453.7,172.9 1466.6,173.5 1468.2,141.1', 1, 0, 1, NULL, 13),
(371, 25, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1442.3,139.8 1440.7,172.2 1453.7,172.9 1455.3,140.5', 1, 0, 1, NULL, 13),
(372, 26, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1429.3,139.2 1427.8,171.6 1440.7,172.2 1442.3,139.8', 1, 0, 1, NULL, 13),
(373, 27, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1416.4,138.5 1414.8,170.9 1427.8,171.6 1429.4,139.2', 1, 0, 1, NULL, 13),
(374, 28, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1403.5,137.9 1401.9,170.3 1414.8,170.9 1416.4,138.5', 1, 0, 1, NULL, 13),
(375, 34, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1325.8,134 1324.2,166.4 1337.1,167 1338.7,134.6', 1, 0, 1, NULL, 13),
(376, 33, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1338.7,134.6 1337.1,167 1350,167.7 1351.6,135.3', 1, 0, 1, NULL, 13),
(377, 32, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1351.7,135.3 1350.1,167.7 1363,168.3 1364.6,135.9', 1, 0, 1, NULL, 13),
(378, 31, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1364.6,135.9 1363,168.3 1376,169 1377.6,136.6', 1, 0, 1, NULL, 13),
(379, 30, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1377.6,136.6 1376,169 1388.9,169.6 1390.5,137.2', 1, 0, 1, NULL, 13),
(380, 29, 360.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1390.5,137.2 1388.9,169.6 1401.9,170.3 1403.5,137.9', 1, 0, 1, NULL, 13),
(381, 2, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '797.4,527.2 796.6,543.4 764.2,541.8 765,525.6', 1, 0, 1, NULL, 13),
(382, 3, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '765.8,509.5 765,525.6 797.4,527.2 798.2,511.1', 1, 0, 1, NULL, 13),
(383, 5, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '799,494.8 797.4,527.2 810.4,527.8 812,495.5', 1, 0, 1, NULL, 13),
(384, 6, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '812,495.5 810.4,527.8 823.3,528.5 824.9,496.1', 1, 0, 1, NULL, 13),
(385, 7, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '824.9,496.1 823.4,528.5 836.3,529.1 837.9,496.8', 1, 0, 1, NULL, 13),
(386, 8, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '837.9,496.8 836.3,529.1 849.2,529.8 850.9,497.4', 1, 0, 1, NULL, 13),
(387, 9, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '850.8,497.4 849.2,529.8 862.2,530.4 863.8,498.1', 1, 0, 1, NULL, 13),
(388, 10, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '863.8,498.1 862.2,530.4 875.1,531.1 876.8,498.7', 1, 0, 1, NULL, 13),
(389, 11, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '876.8,498.7 875.2,531.1 888.1,531.7 889.7,499.4', 1, 0, 1, NULL, 13),
(390, 12, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '889.7,499.4 888.1,531.7 901,532.4 902.6,500', 1, 0, 1, NULL, 13),
(391, 13, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '902.6,500 901,532.4 913.9,533 915.6,500.6', 1, 0, 1, NULL, 13),
(392, 14, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '915.6,500.6 914,533 926.9,533.7 928.6,501.3', 1, 0, 1, NULL, 13),
(393, 15, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '928.5,501.3 926.9,533.7 939.9,534.3 941.5,501.9', 1, 0, 1, NULL, 13),
(394, 16, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '941.5,501.9 939.9,534.3 952.8,535 954.5,502.6', 1, 0, 1, NULL, 13),
(395, 17, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '954.5,502.6 952.9,535 965.8,535.6 967.4,503.2', 1, 0, 1, NULL, 13),
(396, 19, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '966.6,519.4 965.8,535.6 998.2,537.2 999,521.1', 1, 0, 1, NULL, 13),
(397, 20, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '965.8,535.6 965,551.9 997.3,553.4 998.2,537.2', 1, 0, 1, NULL, 13),
(398, 22, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '952.8,535 951.2,567.4 964.2,568 965.8,535.6', 1, 0, 1, NULL, 13),
(399, 23, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '939.9,534.3 938.3,566.7 951.2,567.4 952.8,535', 1, 0, 1, NULL, 13),
(400, 24, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '926.9,533.7 925.3,566.1 938.2,566.7 939.8,534.3', 1, 0, 1, NULL, 13),
(401, 25, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '914,533 912.4,565.4 925.3,566.1 926.9,533.7', 1, 0, 1, NULL, 13),
(402, 26, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '901,532.4 899.4,564.8 912.3,565.4 913.9,533', 1, 0, 1, NULL, 13),
(403, 27, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '888,531.7 886.5,564.1 899.4,564.8 901,532.4', 1, 0, 1, NULL, 13),
(404, 5, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1320.6,187.2 1319,219.5 1332,220.2 1333.6,187.8', 1, 0, 1, NULL, 13),
(405, 28, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '875.1,531.1 873.5,563.5 886.4,564.1 888.1,531.7', 1, 0, 1, NULL, 13),
(406, 6, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1333.6,187.8 1332,220.2 1344.9,220.8 1346.5,188.5', 1, 0, 1, NULL, 13),
(407, 29, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '862.2,530.4 860.6,562.8 873.5,563.5 875.1,531.1', 1, 0, 1, NULL, 13),
(408, 7, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1346.5,188.5 1344.9,220.8 1357.9,221.5 1359.5,189.1', 1, 0, 1, NULL, 13),
(409, 30, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '849.2,529.8 847.6,562.2 860.5,562.8 862.1,530.4', 1, 0, 1, NULL, 13),
(410, 8, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1359.5,189.1 1357.9,221.5 1370.8,222.1 1372.4,189.8', 1, 0, 1, NULL, 13),
(411, 31, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '836.3,529.1 834.7,561.5 847.6,562.2 849.2,529.8', 1, 0, 1, NULL, 13),
(412, 9, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1372.4,189.8 1370.8,222.1 1383.7,222.8 1385.4,190.4', 1, 0, 1, NULL, 13);
INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(413, 32, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '823.3,528.5 821.7,560.9 834.6,561.5 836.3,529.1', 1, 0, 1, NULL, 13),
(414, 10, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1385.4,190.4 1383.8,222.8 1396.7,223.4 1398.3,191.1', 1, 0, 1, NULL, 13),
(415, 33, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '810.3,527.8 808.7,560.2 821.6,560.9 823.3,528.5', 1, 0, 1, NULL, 13),
(416, 11, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1398.3,191.1 1396.7,223.4 1409.7,224.1 1411.3,191.7', 1, 0, 1, NULL, 13),
(417, 34, 360.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '797.4,527.2 795.8,559.6 808.7,560.2 810.3,527.8', 1, 0, 1, NULL, 13),
(418, 12, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1411.3,191.7 1409.7,224.1 1422.6,224.7 1424.2,192.4', 1, 0, 1, NULL, 13),
(419, 13, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1424.2,192.4 1422.6,224.7 1435.5,225.4 1437.2,193', 1, 0, 1, NULL, 13),
(420, 17, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1476.1,195 1474.5,227.3 1487.4,228 1489,195.6', 1, 0, 1, NULL, 13),
(421, 1, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M795.8,559.6l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L795.8,559.6z', 1, 1, 1, NULL, 13),
(422, 16, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1463.1,194.3 1461.5,226.7 1474.4,227.3 1476.1,195', 1, 0, 1, NULL, 13),
(423, 4, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M799,494.8l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L799,494.8z', 1, 1, 1, NULL, 13),
(424, 15, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1450.1,193.7 1448.5,226 1461.5,226.7 1463.1,194.3', 1, 0, 1, NULL, 13),
(425, 18, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M967.4,503.2l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L967.4,503.2z', 1, 1, 1, NULL, 13),
(426, 14, 360.00, 107, 0, '0', 0, '0', 0, '', 0, '', 0, '0', 0, '1437.2,193 1435.6,225.4 1448.5,226 1450.1,193.7', 1, 0, 1, NULL, 13),
(427, 21, 450.00, 50, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M965,551.9l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L965,551.9z', 1, 1, 1, NULL, 13),
(428, 1, 450.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M693.7,188.7l-0.3,7.1c0,0-4.5,17.6,14.3,16.3l8,0.3l1.1-22.7L693.7,188.7z', 1, 1, 1, NULL, 13),
(429, 2, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M694.4,175.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L694.4,175.7z', 1, 1, 1, NULL, 13),
(430, 3, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M695,162.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L695,162.7z', 1, 1, 1, NULL, 13),
(431, 4, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M695.7,150c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L695.7,150z', 1, 1, 1, NULL, 13),
(432, 5, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M696.3,137.1c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L696.3,137.1z', 1, 1, 1, NULL, 13),
(433, 6, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M697,124c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L697,124z', 1, 1, 1, NULL, 13),
(434, 7, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M697.5,111c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L697.5,111z', 1, 1, 1, NULL, 13),
(435, 8, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M698.3,98c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L698.3,98z', 1, 1, 1, NULL, 13),
(436, 9, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M698.9,85c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L698.9,85z', 1, 1, 1, NULL, 13),
(437, 10, 450.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M698.9,85l32.4,1.6l0.8-16.3l-21.5-1c0,0-9.1,0.4-11,9L698.9,85z', 1, 1, 1, NULL, 13),
(438, 11, 450.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M732.1,70.4l24.4,1.2c0,0,5.8,0.9,7.7,7.6l-0.5,9.1l-32.4-1.6L732.1,70.4z', 1, 1, 1, NULL, 13),
(439, 12, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M731.3,86.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L731.3,86.7z', 1, 1, 1, NULL, 13),
(440, 13, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M730.7,99.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L730.7,99.7z', 1, 1, 1, NULL, 13),
(441, 14, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M729.9,112.6c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L729.9,112.6z', 1, 1, 1, NULL, 13),
(442, 15, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M729.3,125.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L729.3,125.7z', 1, 1, 1, NULL, 13),
(443, 16, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M728.7,138.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L728.7,138.7z', 1, 1, 1, NULL, 13),
(444, 17, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M728.1,151.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L728.1,151.7z', 1, 1, 1, NULL, 13),
(445, 18, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M727.4,164.4c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L727.4,164.4z', 1, 1, 1, NULL, 13),
(446, 19, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M726.7,177.4c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L726.7,177.4z', 1, 1, 1, NULL, 13),
(447, 20, 450.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M734.2,213.4l13.7,0.7c0,0,9.8-0.2,9.9-10.1l0.6-12', 1, 1, 1, NULL, 13),
(448, 21, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '716.8,189.8 715.7,212.5 734.2,213.4 735.3,190.8', 1, 0, 1, NULL, 13),
(449, 2, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '792.7,611.2 791.9,627.4 759.6,625.8 760.4,609.6', 1, 0, 1, NULL, 13),
(450, 3, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '761.1,593.5 760.4,609.6 792.7,611.2 793.5,595.1', 1, 0, 1, NULL, 13),
(451, 4, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M794.4,578.8l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L794.4,578.8z', 1, 1, 1, NULL, 13),
(452, 5, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '794.4,578.8 792.8,611.2 805.7,611.8 807.3,579.5', 1, 0, 1, NULL, 13),
(453, 6, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '807.3,579.5 805.7,611.8 818.6,612.5 820.2,580.1', 1, 0, 1, NULL, 13),
(454, 7, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '820.3,580.1 818.7,612.5 831.6,613.1 833.2,580.8', 1, 0, 1, NULL, 13),
(455, 8, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '833.2,580.8 831.6,613.1 844.5,613.8 846.2,581.4', 1, 0, 1, NULL, 13),
(456, 9, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '846.1,581.4 844.5,613.8 857.5,614.4 859.1,582.1', 1, 0, 1, NULL, 13),
(457, 10, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '859.1,582.1 857.5,614.4 870.5,615.1 872.1,582.7', 1, 0, 1, NULL, 13),
(458, 11, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '872.1,582.7 870.5,615.1 883.4,615.7 885,583.4', 1, 0, 1, NULL, 13),
(459, 12, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '885,583.4 883.4,615.7 896.3,616.4 898,584', 1, 0, 1, NULL, 13),
(460, 13, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '897.9,584 896.3,616.4 909.3,617 910.9,584.7', 1, 0, 1, NULL, 13),
(461, 14, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '910.9,584.7 909.3,617 922.3,617.7 923.9,585.3', 1, 0, 1, NULL, 13),
(462, 15, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '923.9,585.3 922.3,617.7 935.2,618.3 936.8,586', 1, 0, 1, NULL, 13),
(463, 16, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '936.8,586 935.2,618.3 948.2,619 949.8,586.6', 1, 0, 1, NULL, 13),
(464, 17, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '949.8,586.6 948.2,619 961.1,619.6 962.7,587.3', 1, 0, 1, NULL, 13),
(465, 18, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M962.7,587.3l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L962.7,587.3z', 1, 1, 1, NULL, 13),
(466, 19, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '961.9,603.4 961.1,619.6 993.5,621.2 994.3,605.1', 1, 0, 1, NULL, 13),
(467, 20, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '961.1,619.6 960.3,635.9 992.7,637.4 993.5,621.2', 1, 0, 1, NULL, 13),
(469, 18, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1489,195.6l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1489,195.6z', 1, 1, 1, NULL, 13),
(470, 19, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1488.2,211.8 1487.4,228 1519.7,229.6 1520.5,213.4', 1, 0, 1, NULL, 13),
(471, 20, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1487.4,228 1486.6,244.3 1518.9,245.8 1519.7,229.6', 1, 0, 1, NULL, 13),
(472, 22, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1474.4,227.3 1472.8,259.7 1485.7,260.4 1487.4,228', 1, 0, 1, NULL, 13),
(473, 23, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1461.5,226.7 1459.9,259.1 1472.8,259.7 1474.4,227.3', 1, 0, 1, NULL, 13),
(474, 24, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1448.5,226 1446.9,258.4 1459.8,259.1 1461.4,226.7', 1, 0, 1, NULL, 13),
(475, 25, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1435.5,225.4 1434,257.8 1446.9,258.4 1448.5,226', 1, 0, 1, NULL, 13),
(476, 26, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1422.6,224.7 1421,257.1 1433.9,257.8 1435.5,225.4', 1, 0, 1, NULL, 13),
(477, 27, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1409.6,224.1 1408,256.5 1421,257.1 1422.6,224.7', 1, 0, 1, NULL, 13),
(478, 28, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1396.7,223.4 1395.1,255.8 1408,256.5 1409.6,224.1', 1, 0, 1, NULL, 13),
(479, 29, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1383.7,222.8 1382.1,255.2 1395.1,255.8 1396.7,223.4', 1, 0, 1, NULL, 13),
(480, 30, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1370.8,222.1 1369.2,254.5 1382.1,255.2 1383.7,222.8', 1, 0, 1, NULL, 13),
(481, 31, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1357.8,221.5 1356.2,253.9 1369.2,254.5 1370.8,222.1', 1, 0, 1, NULL, 13),
(482, 32, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1344.9,220.8 1343.3,253.2 1356.2,253.9 1357.8,221.5', 1, 0, 1, NULL, 13),
(483, 33, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1331.9,220.2 1330.3,252.6 1343.2,253.2 1344.9,220.8', 1, 0, 1, NULL, 13),
(484, 34, 360.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1319,219.5 1317.4,251.9 1330.3,252.6 1331.9,220.2', 1, 0, 1, NULL, 13),
(485, 21, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1486.6,244.3l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1486.6,244.3z', 1, 1, 1, NULL, 13),
(486, 5, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1317,273 1315.4,305.3 1328.3,306 1330,273.6', 1, 0, 1, NULL, 13),
(487, 6, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1329.9,273.6 1328.3,306 1341.3,306.6 1342.9,274.3', 1, 0, 1, NULL, 13),
(488, 7, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1342.9,274.3 1341.3,306.6 1354.2,307.3 1355.9,274.9', 1, 0, 1, NULL, 13),
(489, 8, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1355.9,274.9 1354.3,307.3 1367.2,307.9 1368.8,275.6', 1, 0, 1, NULL, 13),
(490, 9, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1368.8,275.6 1367.2,307.9 1380.1,308.6 1381.7,276.2', 1, 0, 1, NULL, 13),
(491, 10, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1381.8,276.2 1380.2,308.6 1393.1,309.2 1394.7,276.9', 1, 0, 1, NULL, 13),
(492, 11, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1394.7,276.9 1393.1,309.2 1406.1,309.9 1407.7,277.5', 1, 0, 1, NULL, 13),
(493, 12, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1407.7,277.5 1406.1,309.9 1419,310.5 1420.6,278.2', 1, 0, 1, NULL, 13),
(494, 13, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1420.6,278.2 1419,310.5 1431.9,311.2 1433.5,278.8', 1, 0, 1, NULL, 13),
(495, 14, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1433.6,278.8 1432,311.2 1444.9,311.8 1446.5,279.5', 1, 0, 1, NULL, 13),
(496, 15, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1446.5,279.5 1444.9,311.8 1457.8,312.5 1459.5,280.1', 1, 0, 1, NULL, 13),
(497, 16, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1459.5,280.1 1457.9,312.5 1470.8,313.1 1472.4,280.8', 1, 0, 1, NULL, 13),
(498, 17, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1472.4,280.8 1470.9,313.1 1483.8,313.8 1485.4,281.4', 1, 0, 1, NULL, 13),
(499, 19, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1484.6,297.6 1483.7,313.8 1516.1,315.4 1516.9,299.2', 1, 0, 1, NULL, 13),
(500, 20, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1483.7,313.8 1482.9,330.1 1515.3,331.6 1516.1,315.4', 1, 0, 1, NULL, 13),
(501, 22, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1470.8,313.1 1469.2,345.5 1482.1,346.2 1483.7,313.8', 1, 0, 1, NULL, 13),
(502, 23, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1457.8,312.5 1456.2,344.9 1469.2,345.5 1470.8,313.1', 1, 0, 1, NULL, 13),
(503, 24, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1444.9,311.8 1443.3,344.2 1456.2,344.9 1457.8,312.5', 1, 0, 1, NULL, 13),
(504, 25, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1431.9,311.2 1430.3,343.6 1443.3,344.2 1444.9,311.8', 1, 0, 1, NULL, 13),
(505, 26, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1418.9,310.5 1417.4,342.9 1430.3,343.6 1431.9,311.2', 1, 0, 1, NULL, 13),
(506, 27, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1406,309.9 1404.4,342.3 1417.4,342.9 1419,310.5', 1, 0, 1, NULL, 13),
(507, 28, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1393.1,309.2 1391.5,341.6 1404.4,342.3 1406,309.9', 1, 0, 1, NULL, 13),
(508, 29, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1380.1,308.6 1378.5,341 1391.5,341.6 1393.1,309.2', 1, 0, 1, NULL, 13),
(509, 30, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1367.1,307.9 1365.6,340.3 1378.5,341 1380.1,308.6', 1, 0, 1, NULL, 13),
(510, 31, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1354.2,307.3 1352.6,339.7 1365.6,340.3 1367.2,307.9', 1, 0, 1, NULL, 13),
(511, 32, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1341.3,306.6 1339.7,339 1352.6,339.7 1354.2,307.3', 1, 0, 1, NULL, 13),
(512, 33, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1328.3,306 1326.7,338.4 1339.6,339 1341.2,306.6', 1, 0, 1, NULL, 13),
(513, 34, 360.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1315.4,305.3 1313.8,337.7 1326.7,338.4 1328.3,306', 1, 0, 1, NULL, 13),
(514, 18, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1485.4,281.4l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1485.4,281.4z', 1, 1, 1, NULL, 13),
(515, 21, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1482.9,330.1l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1482.9,330.1z', 1, 1, 1, NULL, 13),
(516, 5, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1315.6,356.7 1314,389 1326.9,389.7 1328.5,357.3', 1, 0, 1, NULL, 13),
(517, 6, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1328.5,357.3 1326.9,389.7 1339.8,390.3 1341.5,358', 1, 0, 1, NULL, 13),
(518, 7, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1341.5,358 1339.9,390.3 1352.8,391 1354.4,358.6', 1, 0, 1, NULL, 13),
(519, 8, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1354.4,358.6 1352.8,391 1365.8,391.6 1367.4,359.3', 1, 0, 1, NULL, 13),
(520, 9, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1367.4,359.3 1365.8,391.6 1378.7,392.3 1380.3,359.9', 1, 0, 1, NULL, 13),
(521, 10, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1380.3,359.9 1378.7,392.3 1391.7,392.9 1393.3,360.6', 1, 0, 1, NULL, 13),
(522, 11, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1393.3,360.6 1391.7,392.9 1404.6,393.6 1406.2,361.2', 1, 0, 1, NULL, 13),
(523, 12, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1406.2,361.2 1404.6,393.6 1417.6,394.2 1419.2,361.8', 1, 0, 1, NULL, 13),
(524, 13, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1419.2,361.8 1417.6,394.2 1430.5,394.9 1432.1,362.5', 1, 0, 1, NULL, 13),
(525, 14, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1432.2,362.5 1430.6,394.9 1443.5,395.5 1445.1,363.1', 1, 0, 1, NULL, 13),
(526, 15, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1445.1,363.1 1443.5,395.5 1456.4,396.2 1458,363.8', 1, 0, 1, NULL, 13),
(527, 16, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1458.1,363.8 1456.5,396.2 1469.4,396.8 1471,364.4', 1, 0, 1, NULL, 13),
(528, 17, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1471,364.4 1469.4,396.8 1482.3,397.5 1484,365.1', 1, 0, 1, NULL, 13),
(529, 18, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1484,365.1l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1484,365.1z', 1, 1, 1, NULL, 13),
(530, 19, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1483.2,381.3 1482.3,397.5 1514.7,399.1 1515.5,382.9', 1, 0, 1, NULL, 13),
(531, 20, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1482.3,397.5 1481.5,413.8 1513.9,415.3 1514.7,399.1', 1, 0, 1, NULL, 13),
(532, 21, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1481.5,413.8l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1481.5,413.8z', 1, 1, 1, NULL, 13),
(533, 22, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1469.4,396.8 1467.8,429.2 1480.7,429.8 1482.3,397.5', 1, 0, 1, NULL, 13),
(534, 23, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1456.4,396.2 1454.8,428.6 1467.7,429.2 1469.4,396.8', 1, 0, 1, NULL, 13),
(535, 24, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1443.4,395.5 1441.8,427.9 1454.8,428.6 1456.4,396.2', 1, 0, 1, NULL, 13),
(536, 25, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1430.5,394.9 1428.9,427.3 1441.8,427.9 1443.5,395.5', 1, 0, 1, NULL, 13),
(537, 26, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1417.5,394.2 1415.9,426.6 1428.8,427.3 1430.5,394.9', 1, 0, 1, NULL, 13),
(538, 27, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1404.6,393.6 1403,426 1415.9,426.6 1417.5,394.2', 1, 0, 1, NULL, 13),
(539, 28, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1391.6,392.9 1390.1,425.3 1403,426 1404.6,393.6', 1, 0, 1, NULL, 13),
(540, 29, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1378.7,392.3 1377.1,424.7 1390,425.3 1391.6,392.9', 1, 0, 1, NULL, 13),
(541, 30, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1365.7,391.6 1364.1,424 1377,424.7 1378.7,392.3', 1, 0, 1, NULL, 13),
(542, 31, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1352.8,391 1351.2,423.4 1364.1,424 1365.7,391.6', 1, 0, 1, NULL, 13),
(543, 32, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1339.8,390.3 1338.2,422.7 1351.2,423.4 1352.8,391', 1, 0, 1, NULL, 13),
(544, 33, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1326.9,389.7 1325.3,422.1 1338.2,422.7 1339.8,390.3', 1, 0, 1, NULL, 13),
(545, 34, 360.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1313.9,389 1312.3,421.4 1325.3,422.1 1326.9,389.7', 1, 0, 1, NULL, 13),
(546, 5, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1311.5,439.6 1309.9,472 1322.8,472.6 1324.4,440.3', 1, 0, 1, NULL, 13),
(547, 6, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1324.4,440.3 1322.8,472.7 1335.7,473.3 1337.4,440.9', 1, 0, 1, NULL, 13),
(548, 7, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1337.4,440.9 1335.8,473.3 1348.7,473.9 1350.3,441.6', 1, 0, 1, NULL, 13),
(549, 8, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1350.3,441.6 1348.8,473.9 1361.7,474.6 1363.3,442.2', 1, 0, 1, NULL, 13),
(550, 9, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1363.3,442.2 1361.7,474.6 1374.6,475.2 1376.2,442.9', 1, 0, 1, NULL, 13),
(551, 10, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1376.3,442.9 1374.7,475.2 1387.6,475.9 1389.2,443.5', 1, 0, 1, NULL, 13),
(552, 11, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1389.2,443.5 1387.6,475.9 1400.5,476.5 1402.2,444.2', 1, 0, 1, NULL, 13),
(553, 12, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1402.1,444.2 1400.5,476.5 1413.5,477.2 1415.1,444.8', 1, 0, 1, NULL, 13),
(554, 13, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1415.1,444.8 1413.5,477.2 1426.4,477.8 1428,445.5', 1, 0, 1, NULL, 13),
(555, 14, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1428.1,445.5 1426.5,477.8 1439.4,478.5 1441,446.1', 1, 0, 1, NULL, 13),
(556, 15, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1441,446.1 1439.4,478.5 1452.3,479.1 1453.9,446.8', 1, 0, 1, NULL, 13),
(557, 16, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1454,446.8 1452.4,479.1 1465.3,479.8 1466.9,447.4', 1, 0, 1, NULL, 13),
(558, 17, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1466.9,447.4 1465.3,479.8 1478.2,480.4 1479.9,448.1', 1, 0, 1, NULL, 13),
(559, 19, 450.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1479.1,464.2 1478.2,480.4 1510.6,482.1 1511.4,465.9', 1, 0, 1, NULL, 13),
(560, 20, 450.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1478.2,480.4 1477.4,496.7 1509.8,498.2 1510.6,482.1', 1, 0, 1, NULL, 13),
(561, 22, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1465.3,479.8 1463.7,512.2 1476.6,512.8 1478.2,480.4', 1, 0, 1, NULL, 13),
(562, 23, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1452.3,479.1 1450.7,511.5 1463.6,512.2 1465.3,479.8', 1, 0, 1, NULL, 13),
(563, 24, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1439.3,478.5 1437.7,510.9 1450.7,511.5 1452.3,479.1', 1, 0, 1, NULL, 13),
(564, 25, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1426.4,477.8 1424.8,510.2 1437.7,510.9 1439.4,478.5', 1, 0, 1, NULL, 13),
(565, 26, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1413.4,477.2 1411.8,509.6 1424.7,510.2 1426.4,477.8', 1, 0, 1, NULL, 13),
(566, 27, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1400.5,476.5 1398.9,508.9 1411.8,509.6 1413.4,477.2', 1, 0, 1, NULL, 13),
(567, 28, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1387.6,475.9 1386,508.3 1398.9,508.9 1400.5,476.5', 1, 0, 1, NULL, 13),
(568, 29, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1374.6,475.2 1373,507.6 1385.9,508.3 1387.6,475.9', 1, 0, 1, NULL, 13),
(569, 30, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1361.6,474.6 1360,507 1373,507.6 1374.6,475.2', 1, 0, 1, NULL, 13),
(570, 31, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1348.7,474 1347.1,506.3 1360,507 1361.7,474.6', 1, 0, 1, NULL, 13),
(571, 32, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1335.7,473.3 1334.2,505.7 1347.1,506.3 1348.7,474', 1, 0, 1, NULL, 13),
(572, 33, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1322.8,472.7 1321.2,505 1334.1,505.7 1335.7,473.3', 1, 0, 1, NULL, 13),
(573, 34, 360.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1309.8,472 1308.2,504.4 1321.2,505 1322.8,472.7', 1, 0, 1, NULL, 13),
(574, 18, 450.00, 110, 0, '0', 0, '0', 0, '', 0, '', 0, '0', 0, 'M1479.9,448.1l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1479.9,448.1z', 1, 1, 1, NULL, 13),
(575, 21, 450.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1477.4,496.7l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1477.4,496.7z', 1, 1, 1, NULL, 13),
(576, 5, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1308.8,521.2 1307.2,553.6 1320.1,554.2 1321.7,521.8', 1, 0, 1, NULL, 13),
(577, 6, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1321.7,521.8 1320.1,554.2 1333,554.9 1334.6,522.5', 1, 0, 1, NULL, 13),
(578, 7, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1334.7,522.5 1333.1,554.9 1346,555.5 1347.6,523.1', 1, 0, 1, NULL, 13),
(579, 8, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1347.6,523.1 1346,555.5 1359,556.2 1360.6,523.8', 1, 0, 1, NULL, 13),
(580, 9, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1360.6,523.8 1359,556.2 1371.9,556.8 1373.5,524.4', 1, 0, 1, NULL, 13),
(581, 10, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1373.5,524.4 1371.9,556.8 1384.9,557.5 1386.5,525.1', 1, 0, 1, NULL, 13),
(582, 11, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1386.5,525.1 1384.9,557.5 1397.8,558.1 1399.4,525.7', 1, 0, 1, NULL, 13),
(583, 12, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1399.4,525.7 1397.8,558.1 1410.8,558.8 1412.4,526.4', 1, 0, 1, NULL, 13),
(584, 13, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1412.3,526.4 1410.8,558.8 1423.7,559.4 1425.3,527', 1, 0, 1, NULL, 13),
(585, 14, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1425.3,527 1423.7,559.4 1436.7,560.1 1438.3,527.7', 1, 0, 1, NULL, 13),
(586, 15, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1438.3,527.7 1436.7,560.1 1449.6,560.7 1451.2,528.3', 1, 0, 1, NULL, 13),
(587, 16, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1451.2,528.3 1449.6,560.7 1462.6,561.4 1464.2,529', 1, 0, 1, NULL, 13),
(588, 17, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1464.2,529 1462.6,561.4 1475.5,562 1477.1,529.6', 1, 0, 1, NULL, 13),
(589, 18, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1477.1,529.6l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1477.1,529.6z', 1, 1, 1, NULL, 13),
(590, 19, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1476.3,545.8 1475.5,562 1507.9,563.6 1508.7,547.4', 1, 0, 1, NULL, 13),
(591, 20, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1475.5,562 1474.7,578.3 1507.1,579.8 1507.9,563.6', 1, 0, 1, NULL, 13),
(592, 21, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1474.7,578.3l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1474.7,578.3z', 1, 1, 1, NULL, 13),
(593, 22, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1462.6,561.4 1461,593.7 1473.9,594.4 1475.5,562', 1, 0, 1, NULL, 13),
(594, 23, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1449.6,560.7 1448,593.1 1460.9,593.7 1462.5,561.4', 1, 0, 1, NULL, 13),
(595, 24, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1436.6,560.1 1435,592.4 1447.9,593.1 1449.6,560.7', 1, 0, 1, NULL, 13),
(596, 25, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1423.7,559.4 1422.1,591.8 1435,592.4 1436.6,560.1', 1, 0, 1, NULL, 13),
(597, 26, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1410.7,558.8 1409.1,591.1 1422,591.8 1423.6,559.4', 1, 0, 1, NULL, 13),
(598, 27, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1397.8,558.1 1396.2,590.5 1409.1,591.1 1410.7,558.8', 1, 0, 1, NULL, 13),
(599, 28, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1384.8,557.5 1383.2,589.8 1396.2,590.5 1397.8,558.1', 1, 0, 1, NULL, 13),
(600, 29, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1371.9,556.8 1370.3,589.2 1383.2,589.8 1384.8,557.5', 1, 0, 1, NULL, 13),
(601, 30, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1358.9,556.2 1357.3,588.5 1370.2,589.2 1371.9,556.8', 1, 0, 1, NULL, 13),
(602, 31, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1346,555.5 1344.4,587.9 1357.3,588.5 1358.9,556.2', 1, 0, 1, NULL, 13),
(603, 32, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1333,554.9 1331.4,587.2 1344.4,587.9 1346,555.5', 1, 0, 1, NULL, 13),
(604, 33, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1320,554.2 1318.5,586.6 1331.4,587.2 1333,554.9', 1, 0, 1, NULL, 13),
(605, 34, 360.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1307.1,553.6 1305.5,586 1318.5,586.6 1320.1,554.2', 1, 0, 1, NULL, 13),
(606, 5, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1302.8,602 1316,602.6 1314.4,635 1301.4,634.3', 1, 0, 1, NULL, 13),
(607, 6, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1315.9,602.6 1329,603.2 1327.4,635.6 1314.6,635', 1, 0, 1, NULL, 13),
(608, 7, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1328.9,603.3 1341.9,603.9 1340.3,636.3 1327.6,635.7', 1, 0, 1, NULL, 13),
(609, 8, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1341.9,603.9 1354.7,604.6 1353.2,636.9 1340.5,636.3', 1, 0, 1, NULL, 13),
(610, 9, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1354.8,604.5 1367.8,605.2 1366.2,637.5 1353.4,636.9', 1, 0, 1, NULL, 13),
(611, 10, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1367.8,605.2 1380.6,605.8 1379.1,638.2 1366.4,637.5', 1, 0, 1, NULL, 13),
(612, 11, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1380.7,605.8 1393.7,606.4 1392.1,638.8 1379.3,638.1', 1, 0, 1, NULL, 13),
(613, 12, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1393.7,606.5 1406.5,607.1 1404.9,639.5 1392.3,638.8', 1, 0, 1, NULL, 13),
(614, 13, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1406.6,607.1 1419.6,607.7 1418,640.1 1405.2,639.4', 1, 0, 1, NULL, 13),
(615, 14, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1419.6,607.7 1432.5,608.4 1430.9,640.8 1418,640.1', 1, 0, 1, NULL, 13),
(616, 15, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1432.5,608.4 1445.5,609.1 1443.9,641.5 1430.9,640.9', 1, 0, 1, NULL, 13),
(617, 16, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1445.5,609 1458.5,609.7 1456.9,642 1443.9,641.4', 1, 0, 1, NULL, 13),
(618, 17, 356.60, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1458.5,609.7 1471.4,610.4 1469.7,642.2 1456.8,642.1', 1, 0, 1, NULL, 13),
(619, 18, 378.26, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1471.4,610.4 1484.7,611 1484.5,642.3 1469.7,642.2', 1, 0, 1, NULL, 13),
(620, 19, 384.76, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1484.7,611 1499.3,611.8 1499.1,642.3 1484.5,642.3', 1, 0, 1, NULL, 13),
(621, 20, 389.92, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1499.3,611.8 1514.4,612.6 1514.2,642.3 1499.1,642.3', 1, 0, 1, NULL, 13),
(622, 21, 380.66, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1514.2,642.3 1529.4,642.4 1529.5,613.3 1514.4,612.6', 1, 0, 1, NULL, 13),
(623, 22, 371.40, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1529.5,613.3 1544.7,614.1 1544.5,642.4 1529.4,642.4', 1, 0, 1, NULL, 13),
(624, 24, 447.18, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1544.5,649.7 1578.7,649.8 1579.5,634.7 1544.5,634.6', 1, 0, 1, NULL, 13),
(625, 26, 353.86, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1529.4,642.4 1544.5,642.4 1544.5,669.4 1529.4,670', 1, 0, 1, NULL, 14),
(626, 27, 361.38, 112, 0, '0', 0, '0', 0, '0', 0, '0', -1, '0', 0, '1514.2,642.3 1529.4,642.4 1529.4,670 1514.2,670.5', 1, 0, 1, NULL, 14),
(627, 28, 368.90, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1499.1,642.3 1514.2,642.3 1514.2,670.5 1499.1,671', 1, 0, 1, NULL, 14),
(628, 29, 362.84, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1484.5,642.3 1484.5,671.6 1499.1,671 1499.1,642.3', 1, 0, 1, NULL, 14),
(629, 30, 392.95, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1469.7,642.2 1484.7,642.3 1484.5,671.6 1468.1,672', 1, 0, 1, NULL, 14),
(630, 31, 335.67, 112, 0, '0', 0, '00', 0, '0', 0, '0', 0, '0', 0, '1456.8,642.1 1469.7,642.2 1468.3,671.9 1455.3,672.6', 1, 0, 1, NULL, 14),
(631, 32, 344.62, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1443.9,641.5 1456.8,642.1 1455.3,672.6 1442.3,673', 1, 0, 1, NULL, 14),
(632, 33, 356.57, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1430.9,640.9 1443.9,641.5 1442.3,673 1434.6,673.3 1429.3,673.2', 1, 0, 1, NULL, 14),
(633, 34, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1418,640.1 1430.9,640.9 1429.3,673.2 1416.4,672.5', 1, 0, 1, NULL, 14),
(634, 35, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1405,639.5 1418,640.1 1416.4,672.5 1403.6,671.9', 1, 0, 1, NULL, 14),
(635, 36, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1392.1,638.9 1404.9,639.5 1403.4,671.9 1390.7,671.3', 1, 0, 1, NULL, 14),
(636, 37, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1379.1,638.2 1392.1,638.8 1390.5,671.2 1377.7,670.5', 1, 0, 1, NULL, 14),
(637, 38, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1366.2,637.6 1379.1,638.2 1377.5,670.6 1364.9,669.9', 1, 0, 1, NULL, 14),
(638, 39, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1353.2,637 1366.3,637.6 1364.6,670 1351.8,669.3', 1, 0, 1, NULL, 14),
(639, 40, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1340.3,636.4 1353.2,637 1351.6,669.4 1339,668.7', 1, 0, 1, NULL, 14),
(640, 41, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1327.3,635.7 1340.4,636.4 1338.8,668.7 1326,668.1', 1, 0, 1, NULL, 14),
(641, 42, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1314.4,635 1327.4,635.6 1325.8,668 1313,667.4', 1, 0, 1, NULL, 14),
(642, 43, 360.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1301.2,634.4 1314.4,635 1312.8,667.4 1299.8,666.7', 1, 0, 1, NULL, 14),
(643, 2, 719.88, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1626.5,430.8 1622.8,485.2 1644.3,440.5', 1, 0, 1, NULL, 13),
(644, 3, 363.22, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1628,408.8 1626.5,430.8 1644.3,440.5 1652.8,422.3', 1, 0, 1, NULL, 13),
(645, 4, 359.26, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1629.5,392.2c0,0-0.7,2.1-0.7,4.6l-0.8,12.1l24.8,13.5l6.7-14L1629.5,392.2z', 1, 1, 1, NULL, 13),
(646, 5, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1635.6,379.5 1629.5,392.2 1659.5,408.3 1665.5,395.5', 1, 0, 1, NULL, 14),
(647, 6, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1635.6,379.5 1641.7,366.6 1671.6,382.8 1665.6,395.6', 1, 0, 1, NULL, 14),
(648, 7, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1641.6,366.6 1647.8,353.9 1677.7,370 1671.6,382.8', 1, 0, 1, NULL, 14),
(649, 8, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1647.8,353.9 1653.9,340.9 1683.8,357.1 1677.7,370', 1, 0, 1, NULL, 14),
(650, 9, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1653.8,341 1659.8,328.2 1689.8,344.3 1683.8,357.2', 1, 0, 1, NULL, 14),
(651, 10, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1659.9,328.2 1666,315.4 1695.9,331.4 1689.9,344.3', 1, 0, 1, NULL, 14),
(652, 12, 450.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1680.8,323.3 1695.9,331.4 1711.1,299.3 1696.1,291.2', 1, 0, 1, NULL, 16),
(653, 13, 450.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1711.1,299.3 1726.1,307.4 1710.9,339.5 1695.9,331.4', 1, 0, 1, NULL, 16),
(654, 15, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1689.9,344.2 1695.9,331.4 1725.8,347.4 1719.8,360.4', 1, 0, 1, NULL, 16),
(655, 16, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1683.7,357.1 1689.8,344.2 1719.7,360.3 1713.7,373.2', 1, 0, 1, NULL, 16),
(656, 17, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1677.7,369.9 1683.8,357 1713.7,373.1 1707.6,386', 1, 0, 1, NULL, 16),
(657, 18, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1671.6,382.6 1677.7,369.9 1707.6,386 1701.5,398.8', 1, 0, 1, NULL, 16),
(658, 19, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1665.6,395.5 1671.6,382.7 1701.5,398.8 1695.5,411.6', 1, 0, 1, NULL, 16),
(659, 20, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1659.5,408.3 1665.5,395.5 1695.4,411.6 1689.4,424.5', 1, 0, 1, NULL, 16),
(660, 21, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1653.5,421.2 1659.5,408.3 1689.5,424.5 1683.4,437.3', 1, 0, 1, NULL, 16),
(661, 22, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1647.3,434 1653.3,421.2 1683.2,437.3 1677.2,450.2', 1, 0, 1, NULL, 16),
(662, 23, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1641.3,446.9 1647.3,434 1677.2,450.2 1671.2,463', 1, 0, 1, NULL, 16),
(663, 24, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1635.2,459.7 1641.3,446.9 1671.2,463 1665.1,475.8', 1, 0, 1, NULL, 16),
(664, 25, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1629.1,472.5 1635.2,459.7 1665.1,475.8 1659.1,488.7', 1, 0, 1, NULL, 16),
(665, 26, 360.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1622.8,485.2 1629.1,472.5 1659,488.7 1653,501.5', 1, 0, 1, NULL, 16),
(666, 27, 369.70, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1622.8,485.2 1621.6,502.7 1646,515.9 1653,501.5', 1, 0, 1, NULL, 16),
(667, 1, 450.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M671.7,612.9l-0.3,7.1c0,0-0.5,13.6,14.3,16.3l8,0.3l1.1-22.7L671.7,612.9z', 1, 1, 1, NULL, 14),
(668, 2, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M672.3,599.9c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L672.3,599.9z', 1, 1, 1, NULL, 16),
(669, 3, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M673,587c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L673,587z', 1, 1, 1, NULL, 16),
(670, 4, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M673.7,574.3c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L673.7,574.3z', 1, 1, 1, NULL, 16),
(671, 5, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M674.3,561.3c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L674.3,561.3z', 1, 1, 1, NULL, 16),
(672, 6, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M674.9,548.3c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L674.9,548.3z', 1, 1, 1, NULL, 16),
(673, 11, 450.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M710.1,494.6l24.4,1.2c0,0,6.9,0,7.7,7.6l-0.5,9.1l-32.4-1.6L710.1,494.6z', 1, 1, 1, NULL, 16),
(674, 12, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M709.2,511c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L709.2,511z', 1, 1, 1, NULL, 16),
(675, 7, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', -2, '0', 0, 'M675.5,535.2c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L675.5,535.2z', 1, 1, 1, NULL, 13),
(676, 8, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M676.3,522.2c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L676.3,522.2z', 1, 1, 1, NULL, 13),
(677, 13, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M708.6,523.9c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L708.6,523.9z', 1, 1, 1, NULL, 13),
(678, 14, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'M707.9,536.9c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L707.9,536.9z', 1, 1, 1, NULL, 13),
(679, 15, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, 'M707.3,549.9c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L707.3,549.9z', 1, 1, 1, NULL, 13),
(680, 16, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M706.7,563c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L706.7,563z', 1, 1, 1, NULL, 13),
(681, 17, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M706.1,575.9c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L706.1,575.9z', 1, 1, 1, NULL, 13),
(682, 18, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M705.4,588.7c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L705.4,588.7z', 1, 1, 1, NULL, 13),
(683, 19, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M704.7,601.6c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L704.7,601.6z', 1, 1, 1, NULL, 13),
(684, 20, 450.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M712.2,637.7l13.7,0.7c0,0,9.8-0.2,9.9-10.1l0.6-12', 1, 1, 1, NULL, 14),
(685, 21, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '694.8,614.1 693.7,636.7 712.2,637.7 713.3,615.1', 1, 0, 1, NULL, 14),
(686, 85, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M675.5,535.2c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L675.5,535.2z', 1, 1, 1, NULL, 13),
(687, 88, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M676.3,522.2c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L676.3,522.2z', 1, 1, 1, NULL, 13),
(688, 9, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M676.9,509.3c0.2,0.4-0.7,13-0.7,13l32.4,1.6l0.6-13L676.9,509.3z', 1, 1, 1, NULL, 13),
(689, 4, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1060.8,340.4l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1060.8,340.4z', 1, 1, 1, NULL, 14),
(690, 5, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1060.8,340.4 1059.2,372.7 1072.1,373.4 1073.7,341', 1, 0, 1, NULL, 14),
(691, 6, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1073.7,341 1072.1,373.4 1085,374 1086.7,341.7', 1, 0, 1, NULL, 14),
(692, 7, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1086.7,341.7 1085.1,374 1098,374.7 1099.6,342.3', 1, 0, 1, NULL, 14),
(693, 8, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1099.6,342.3 1098,374.7 1111,375.3 1112.6,343', 1, 0, 1, NULL, 14),
(694, 9, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1112.6,343 1111,375.3 1123.9,376 1125.5,343.6', 1, 0, 1, NULL, 14),
(695, 10, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1125.5,343.6 1123.9,376 1136.9,376.6 1138.5,344.3', 1, 0, 1, NULL, 14),
(696, 11, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1138.5,344.3 1136.9,376.6 1149.8,377.3 1151.4,344.9', 1, 0, 1, NULL, 14),
(697, 18, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1229.2,348.8l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1229.2,348.8z', 1, 1, 1, NULL, 14),
(698, 17, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1216.2,348.1 1214.6,380.5 1227.5,381.2 1229.2,348.8', 1, 0, 1, NULL, 14),
(699, 16, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1203.2,347.5 1201.6,379.9 1214.6,380.5 1216.2,348.1', 1, 0, 1, NULL, 14),
(700, 15, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1190.3,346.9 1188.7,379.2 1201.6,379.9 1203.2,347.5', 1, 0, 1, NULL, 14),
(701, 14, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1177.3,346.2 1175.7,378.6 1188.7,379.2 1190.3,346.9', 1, 0, 1, NULL, 14),
(702, 13, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1164.4,345.6 1162.8,377.9 1175.7,378.6 1177.3,346.2', 1, 0, 1, NULL, 14),
(703, 12, 360.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1151.4,344.9 1149.8,377.3 1162.8,377.9 1164.4,345.6', 1, 0, 1, NULL, 14),
(704, 19, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1228.3,365 1227.5,381.2 1259.9,382.8 1260.7,366.6', 1, 0, 1, NULL, 14),
(705, 20, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1227.5,381.2 1226.7,397.5 1259.1,399 1259.9,382.8', 1, 0, 1, NULL, 14),
(706, 21, 450.00, 55, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1226.7,397.5l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1226.7,397.5z', 1, 1, 1, NULL, 14),
(707, 18, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M977.6,252.5l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L977.6,252.5z', 1, 1, 1, NULL, 14),
(708, 19, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '976.8,268.7 976,284.8 1008.4,286.5 1009.2,270.3', 1, 0, 1, NULL, 14),
(709, 20, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '976,284.8 975.2,301.1 1007.6,302.6 1008.4,286.5', 1, 0, 1, NULL, 14),
(710, 21, 450.00, 47, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M975.2,301.1l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L975.2,301.1z', 1, 1, 1, NULL, 14),
(711, 18, 450.00, 48, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M975.2,336.7l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L975.2,336.7z', 1, 1, 1, NULL, 14),
(712, 18, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1225.1,432.8l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1225.1,432.8z', 1, 1, 1, NULL, 14),
(713, 19, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1224.3,449 1223.4,465.1 1255.8,466.8 1256.6,450.6', 1, 0, 1, NULL, 14),
(714, 20, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1223.4,465.1 1222.6,481.4 1255,482.9 1255.8,466.8', 1, 0, 1, NULL, 14),
(715, 21, 450.00, 54, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1222.6,481.4l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1222.6,481.4z', 1, 1, 1, NULL, 14),
(716, 18, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1221.3,515.3l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1221.3,515.3z', 1, 1, 1, NULL, 14),
(717, 19, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '00', 0, '0', 0, '1220.5,531.5 1219.7,547.7 1252.1,549.3 1252.9,533.1', 1, 0, 1, NULL, 14),
(718, 20, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1219.7,547.7 1218.9,564 1251.3,565.5 1252.1,549.3', 1, 0, 1, NULL, 14),
(719, 21, 450.00, 53, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1218.9,564l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1218.9,564z', 1, 1, 1, NULL, 14),
(720, 1, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1317.4,251.9l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1317.4,251.9z', 1, 1, 1, NULL, 14),
(721, 2, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1319,219.5 1318.2,235.7 1285.8,234.1 1286.6,217.9', 1, 0, 1, NULL, 14),
(722, 3, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1287.4,201.8 1286.6,217.9 1319,219.5 1319.8,203.4', 1, 0, 1, NULL, 14),
(723, 1, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1312.3,421.4l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1312.3,421.4z', 1, 1, 1, NULL, 14),
(724, 2, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1313.9,389 1313.1,405.2 1280.8,403.6 1281.6,387.4', 1, 0, 1, NULL, 14),
(725, 3, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1282.4,371.3 1281.6,387.4 1313.9,389 1314.7,372.9', 1, 0, 1, NULL, 14),
(726, 4, 450.00, 109, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1315.6,356.7l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1315.6,356.7z', 1, 1, 1, NULL, 14),
(727, 1, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1305.5,586l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1305.5,586z', 1, 1, 1, NULL, 14),
(728, 2, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1307.1,553.6 1306.3,569.8 1274,568.1 1274.8,551.9', 1, 0, 1, NULL, 14),
(729, 3, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1275.6,535.8 1274.8,551.9 1307.1,553.6 1307.9,537.5', 1, 0, 1, NULL, 14),
(730, 1, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M791.1,643.6l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L791.1,643.6z', 1, 1, 1, NULL, 14),
(731, 21, 450.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M960.3,635.9l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L960.3,635.9z', 1, 1, 1, NULL, 14),
(732, 22, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '948.1,619 946.6,651.4 959.5,652 961.1,619.6', 1, 0, 1, NULL, 14),
(733, 23, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '935.2,618.3 933.6,650.7 946.5,651.4 948.1,619', 1, 0, 1, NULL, 14),
(734, 24, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '922.2,617.7 920.6,650.1 933.5,650.7 935.2,618.3', 1, 0, 1, NULL, 14),
(735, 25, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '909.3,617 907.7,649.4 920.6,650.1 922.2,617.7', 1, 0, 1, NULL, 14),
(736, 26, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '896.3,616.4 894.7,648.8 907.6,649.4 909.2,617', 1, 0, 1, NULL, 14),
(737, 27, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '883.4,615.7 881.8,648.1 894.7,648.8 896.3,616.4', 1, 0, 1, NULL, 14),
(738, 28, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '870.4,615.1 868.8,647.5 881.8,648.1 883.4,615.7', 1, 0, 1, NULL, 14),
(739, 29, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '857.5,614.4 855.9,646.8 868.8,647.5 870.4,615.1', 1, 0, 1, NULL, 14),
(740, 30, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '844.5,613.8 842.9,646.2 855.8,646.8 857.4,614.4', 1, 0, 1, NULL, 14),
(741, 31, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '831.6,613.1 830,645.5 842.9,646.2 844.5,613.8', 1, 0, 1, NULL, 14),
(742, 32, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '818.6,612.5 817,644.9 829.9,645.5 831.6,613.1', 1, 0, 1, NULL, 14),
(743, 33, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '805.6,611.8 804,644.2 817,644.9 818.6,612.5', 1, 0, 1, NULL, 14),
(744, 34, 360.00, 51, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '792.7,611.2 791.1,643.6 804,644.2 805.7,611.8', 1, 0, 1, NULL, 14),
(745, 20, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1215,631.7 1214.2,648 1246.6,649.5 1247.4,633.3', 1, 0, 1, NULL, 14),
(746, 22, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1202.1,631.1 1200.5,663.4 1213.4,664.1 1215,631.7', 1, 0, 1, NULL, 14),
(747, 23, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1189.1,630.4 1187.5,662.8 1200.4,663.4 1202.1,631.1', 1, 0, 1, NULL, 14),
(748, 24, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1176.1,629.8 1174.5,662.1 1187.5,662.8 1189.1,630.4', 1, 0, 1, NULL, 14),
(749, 25, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1163.2,629.1 1161.6,661.5 1174.5,662.1 1176.2,629.8', 1, 0, 1, NULL, 14),
(750, 26, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1150.2,628.5 1148.6,660.9 1161.5,661.5 1163.2,629.1', 1, 0, 1, NULL, 14),
(751, 27, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1137.3,627.8 1135.7,660.2 1148.6,660.9 1150.2,628.5', 1, 0, 1, NULL, 14),
(752, 28, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1124.3,627.2 1122.7,659.6 1135.7,660.2 1137.3,627.8', 1, 0, 1, NULL, 14),
(753, 29, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1111.4,626.5 1109.8,658.9 1122.7,659.6 1124.3,627.2', 1, 0, 1, NULL, 14),
(754, 30, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1098.4,625.9 1096.8,658.3 1109.7,658.9 1111.4,626.5', 1, 0, 1, NULL, 14),
(755, 31, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1085.5,625.2 1083.9,657.6 1096.8,658.3 1098.4,625.9', 1, 0, 1, NULL, 14),
(756, 32, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1072.5,624.6 1070.9,657 1083.9,657.6 1085.5,625.2', 1, 0, 1, NULL, 14),
(757, 33, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1059.6,623.9 1058,656.3 1070.9,657 1072.5,624.6', 1, 0, 1, NULL, 14),
(758, 34, 360.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1046.6,623.3 1045,655.7 1058,656.3 1059.6,623.9', 1, 0, 1, NULL, 14),
(759, 2, 450.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1269.1,632.7 1268.3,648.9 1300.6,650.6 1301.2,634.4', 1, 0, 1, NULL, 14),
(760, 3, 450.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1269.9,616.6 1269.1,632.7 1301.2,634.4 1302.3,618.2', 1, 0, 1, NULL, 14),
(761, 25, 549.93, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1544.5,669.4l18-0.7c0,0,9.2,0.2,14-8.2c0,0,2-1.8,2.3-10.8l-34.2-0.2V669.4z', 1, 1, 1, NULL, 14),
(762, 23, 595.28, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1544.7,614.1l24,1.3c0,0,6.5-1.2,10.1,5.2c0,0,1.7,2.3,1,7.4l-0.3,6.8l-35-0.1L1544.7,614.1z', 1, 1, 1, NULL, 13),
(763, 10, 450.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M676.9,509.3l32.4,1.6l0.8-16.3l-23.7-1.4c0,0-7.4-0.5-8.8,8.4L676.9,509.3z', 1, 1, 1, NULL, 13),
(764, 1, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1045,655.7l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1045,655.7z', 1, 1, 1, NULL, 14),
(765, 18, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1216.7,599.3l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1216.7,599.3z', 1, 1, 1, NULL, 14),
(766, 19, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1215.9,615.5 1215,631.7 1247.4,633.3 1248.2,617.1', 1, 0, 1, NULL, 14);
INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(767, 21, 450.00, 52, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1214.2,648l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1214.2,648z', 1, 1, 1, NULL, 14),
(768, 18, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1241,94.5l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1241,94.5z', 1, 1, 1, NULL, 14),
(769, 19, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1240.2,110.7 1239.4,126.9 1271.8,128.5 1272.6,112.3', 1, 0, 1, NULL, 14),
(770, 20, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1239.4,126.9 1238.6,143.2 1271,144.7 1271.8,128.5', 1, 0, 1, NULL, 14),
(771, 21, 450.00, 57, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1238.6,143.2l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1238.6,143.2z', 1, 1, 1, NULL, 14),
(772, 18, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1236.4,177.5l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1236.4,177.5z', 1, 1, 1, NULL, 14),
(773, 19, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1235.5,193.7 1234.7,209.9 1267.1,211.5 1267.9,195.3', 1, 0, 1, NULL, 14),
(774, 20, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1234.7,209.9 1233.9,226.2 1266.3,227.7 1267.1,211.5', 1, 0, 1, NULL, 14),
(775, 22, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1221.8,209.3 1220.2,241.6 1233.1,242.3 1234.7,209.9', 1, 0, 1, NULL, 14),
(776, 23, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1208.8,208.6 1207.2,241 1220.1,241.6 1221.8,209.3', 1, 0, 1, NULL, 14),
(777, 24, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1195.8,208 1194.2,240.3 1207.2,241 1208.8,208.6', 1, 0, 1, NULL, 14),
(778, 25, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1182.9,207.3 1181.3,239.7 1194.2,240.3 1195.8,208', 1, 0, 1, NULL, 14),
(779, 26, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1169.9,206.7 1168.3,239 1181.2,239.7 1182.9,207.3', 1, 0, 1, NULL, 14),
(780, 27, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1157,206 1155.4,238.4 1168.3,239 1169.9,206.7', 1, 0, 1, NULL, 14),
(781, 28, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1144,205.4 1142.4,237.8 1155.4,238.4 1157,206', 1, 0, 1, NULL, 14),
(782, 29, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1131.1,204.7 1129.5,237.1 1142.4,237.8 1144,205.4', 1, 0, 1, NULL, 14),
(783, 30, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1118.1,204.1 1116.5,236.5 1129.4,237.1 1131.1,204.7', 1, 0, 1, NULL, 14),
(784, 31, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1105.2,203.4 1103.6,235.8 1116.5,236.5 1118.1,204.1', 1, 0, 1, NULL, 14),
(785, 32, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1092.2,202.8 1090.6,235.2 1103.6,235.8 1105.2,203.4', 1, 0, 1, NULL, 14),
(786, 33, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1079.3,202.1 1077.7,234.5 1090.6,235.2 1092.2,202.8', 1, 0, 1, NULL, 14),
(787, 34, 360.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1066.3,201.5 1064.7,233.9 1077.7,234.5 1079.3,202.1', 1, 0, 1, NULL, 14),
(788, 1, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1064.7,233.9l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1064.7,233.9z', 1, 1, 1, NULL, 14),
(789, 1, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1324.2,166.4l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1324.2,166.4z', 1, 1, 1, NULL, 14),
(790, 2, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1325.8,134 1325,150.2 1292.6,148.6 1293.4,132.4', 1, 0, 1, NULL, 14),
(791, 3, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1294.2,116.3 1293.4,132.4 1325.8,134 1326.6,117.9', 1, 0, 1, NULL, 14),
(792, 4, 450.00, 106, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1327.4,101.6l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1327.4,101.6z', 1, 1, 1, NULL, 14),
(793, 4, 450.00, 107, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1320.6,187.2L1298,186c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1320.6,187.2z', 1, 1, 1, NULL, 14),
(794, 1, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1313.8,337.7l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1313.8,337.7z', 1, 1, 1, NULL, 14),
(795, 2, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1315.4,305.3 1314.6,321.5 1282.2,319.9 1283,303.7', 1, 0, 1, NULL, 14),
(796, 3, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1283.8,287.6 1283,303.7 1315.4,305.3 1316.2,289.2', 1, 0, 1, NULL, 14),
(797, 1, 450.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1308.2,504.4l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1308.2,504.4z', 1, 1, 1, NULL, 14),
(798, 2, 450.00, 110, 0, '0', 0, '0', 0, '0', 0, '00', 0, '0', 0, '1309.8,472 1309,488.2 1276.7,486.6 1277.5,470.4', 1, 0, 1, NULL, 14),
(799, 3, 450.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1278.3,454.3 1277.5,470.4 1309.8,472 1310.6,455.9', 1, 0, 1, NULL, 14),
(800, 4, 450.00, 110, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1311.5,439.6l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1311.5,439.6z', 1, 1, 1, NULL, 14),
(801, 1, 450.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1268.3,648.9l-0.3,6.5c0,0,0,10.4,10.5,10.2l21.4,1.1l0.8-16.2L1268.3,648.9z', 1, 1, 1, NULL, 14),
(802, 4, 450.00, 112, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1303.1,602l-23.9-1.2c0,0-8.5-0.7-8.9,7.8l-0.4,8l32.4,1.6L1303.1,602z', 1, 1, 1, NULL, 14),
(803, 1, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M680,428.2l-1.1,21.5c0,0-1.6,9.7,8.7,11.5l6.9,0.3l1.6-32.5L680,428.2z', 1, 1, 1, NULL, 13),
(804, 2, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '680.6,415.3 680,428.2 712.4,429.9 713,417', 1, 0, 1, NULL, 13),
(805, 3, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '681.3,402.4 680.6,415.4 713,417 713.7,404.1', 1, 0, 1, NULL, 13),
(806, 4, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '681.9,389.4 681.3,402.3 713.7,404 714.3,391.1', 1, 0, 1, NULL, 13),
(807, 5, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '682.6,376.5 681.9,389.5 714.3,391.1 714.9,378.2', 1, 0, 1, NULL, 13),
(808, 6, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '683.2,363.5 682.6,376.5 715,378.1 715.6,365.2', 1, 0, 1, NULL, 13),
(809, 7, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '683.9,350.7 683.2,363.6 715.6,365.2 716.3,352.3', 1, 0, 1, NULL, 13),
(810, 8, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '684.5,337.6 683.9,350.6 716.3,352.2 716.9,339.3', 1, 0, 1, NULL, 13),
(811, 9, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '685.2,324.8 684.5,337.7 716.9,339.3 717.5,326.4', 1, 0, 1, NULL, 13),
(812, 10, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '685.8,311.7 685.2,324.7 717.5,326.3 718.2,313.4', 1, 0, 1, NULL, 13),
(813, 11, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '686.5,298.9 685.8,311.8 718.2,313.4 718.8,300.5', 1, 0, 1, NULL, 13),
(814, 12, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '687.1,285.8 686.5,298.8 718.8,300.4 719.5,287.5', 1, 0, 1, NULL, 13),
(815, 13, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '687.7,272.9 687.1,285.9 719.5,287.5 720.1,274.6', 1, 0, 1, NULL, 13),
(816, 14, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M687.7,272.9l16.2,0.8l1.6-32.4l-6.5-0.3c0,0-9.7-0.2-10.2,9.2L687.7,272.9z', 1, 1, 1, NULL, 13),
(817, 17, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M736.3,275.4l16.2,0.8l1.2-24.8c0,0,0.5-7.2-7.2-7.9l-8.6-0.4L736.3,275.4z', 1, 1, 1, NULL, 13),
(818, 18, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '720.1,274.6 719.4,287.6 751.8,289.2 752.5,276.3', 1, 0, 1, NULL, 13),
(819, 19, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '719.5,287.5 718.8,300.4 751.2,302.1 751.8,289.2', 1, 0, 1, NULL, 13),
(820, 20, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '718.8,300.5 718.2,313.5 750.5,315.1 751.2,302.2', 1, 0, 1, NULL, 13),
(821, 21, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '718.2,313.4 717.5,326.4 749.9,328 750.5,315.1', 1, 0, 1, NULL, 13),
(822, 22, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '717.5,326.4 716.9,339.4 749.2,341 749.9,328.1', 1, 0, 1, NULL, 13),
(823, 23, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '716.9,339.3 716.2,352.3 748.6,353.9 749.2,341', 1, 0, 1, NULL, 13),
(824, 24, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '716.2,352.3 715.6,365.3 748,366.9 748.6,354', 1, 0, 1, NULL, 13),
(825, 25, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '715.6,365.2 714.9,378.2 747.3,379.8 748,366.9', 1, 0, 1, NULL, 13),
(826, 26, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '714.9,378.2 714.3,391.1 746.7,392.8 747.3,379.9', 1, 0, 1, NULL, 13),
(827, 32, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '694.5,461.5 710.7,462.4 712.4,429.9 696.1,429.1', 1, 0, 1, NULL, 13),
(828, 31, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '710.7,462.4 726.8,463.2 728.5,430.8 712.3,430', 1, 0, 1, NULL, 13),
(829, 30, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M726.8,463.2l9.4,0.3c0,0,7.3-0.5,7.2-8.1l1.2-24l-16.2-0.7L726.8,463.2z', 1, 1, 1, NULL, 13),
(830, 29, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '713,417 712.4,429.9 744.7,431.5 745.4,418.6', 1, 0, 1, NULL, 13),
(831, 28, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '713.6,404.1 713,417 745.4,418.7 746,405.8', 1, 0, 1, NULL, 13),
(832, 27, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '714.3,391.1 713.6,404 746,405.6 746.6,392.7', 1, 0, 1, NULL, 13),
(833, 17, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1585.2,411.4l16.1,0.8l1.2-24.8c0,0,0-6-7.1-7.9l-8.6-0.4L1585.2,411.4z', 1, 1, 1, NULL, 14),
(834, 1, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1529.3,564.2l-1.1,21.5c0,0-2.3,11.1,8.7,11.5l6.9,0.3l1.6-32.5L1529.3,564.2z', 1, 1, 1, NULL, 16),
(835, 2, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1530,551.2 1529.3,564.2 1561.4,565.8 1562.1,552.9', 1, 0, 1, NULL, 16),
(836, 3, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1530.6,538.4 1529.9,551.3 1562.1,552.9 1562.7,540', 1, 0, 1, NULL, 16),
(837, 4, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1531.2,525.3 1530.6,538.3 1562.7,539.9 1563.4,527', 1, 0, 1, NULL, 16),
(838, 5, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1531.9,512.5 1531.2,525.4 1563.4,527 1564,514.1', 1, 0, 1, NULL, 16),
(839, 6, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1532.5,499.5 1531.9,512.4 1564,514.1 1564.6,501.2', 1, 0, 1, NULL, 16),
(840, 7, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1533.2,486.6 1532.5,499.6 1564.7,501.2 1565.3,488.3', 1, 0, 1, NULL, 16),
(841, 8, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1533.8,473.6 1533.2,486.5 1565.3,488.2 1565.9,475.3', 1, 0, 1, NULL, 16),
(842, 9, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1534.4,460.7 1533.8,473.7 1565.9,475.3 1566.6,462.4', 1, 0, 1, NULL, 16),
(843, 10, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1535.1,447.7 1534.4,460.6 1566.6,462.3 1567.2,449.4', 1, 0, 1, NULL, 16),
(844, 11, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1535.7,434.8 1535.1,447.8 1567.2,449.4 1567.8,436.5', 1, 0, 1, NULL, 16),
(845, 12, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1536.4,421.8 1535.7,434.7 1567.8,436.3 1568.5,423.5', 1, 0, 1, NULL, 16),
(846, 13, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1537,408.9 1536.3,421.8 1568.5,423.5 1569.1,410.6', 1, 0, 1, NULL, 16),
(847, 14, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1537,408.9l16.1,0.8l1.6-32.4l-6.4-0.3c-0.7-0.5-10.8-1.1-10.1,9.2L1537,408.9z', 1, 1, 1, NULL, 16),
(848, 15, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1554.7,377.3 1570.7,378.1 1569.1,410.5 1553.1,409.7', 1, 0, 1, NULL, 16),
(849, 16, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1570.7,378.2 1586.8,379 1585.2,411.4 1569.1,410.6', 1, 0, 1, NULL, 16),
(850, 18, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1569.1,410.6 1568.5,423.5 1600.6,425.1 1601.2,412.2', 1, 0, 1, NULL, 16),
(851, 19, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1568.5,423.4 1567.8,436.4 1600,438 1600.6,425.1', 1, 0, 1, NULL, 16),
(852, 20, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1567.8,436.5 1567.2,449.4 1599.3,451.1 1600,438.2', 1, 0, 1, NULL, 16),
(853, 21, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1567.2,449.4 1566.5,462.3 1598.7,463.9 1599.3,451', 1, 0, 1, NULL, 16),
(854, 22, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1566.5,462.4 1565.9,475.3 1598,476.9 1598.7,464.1', 1, 0, 1, NULL, 16),
(855, 23, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1565.9,475.3 1565.3,488.2 1597.4,489.8 1598,476.9', 1, 0, 1, NULL, 16),
(856, 24, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1565.3,488.3 1564.6,501.2 1596.8,502.9 1597.4,490', 1, 0, 1, NULL, 16),
(857, 25, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1564.6,501.2 1564,514.1 1596.1,515.7 1596.8,502.8', 1, 0, 1, NULL, 16),
(858, 26, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1564,514.1 1563.3,527.1 1595.5,528.7 1596.1,515.8', 1, 0, 1, NULL, 16),
(859, 27, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1563.3,527 1562.7,540 1594.8,541.6 1595.5,528.7', 1, 0, 1, NULL, 16),
(860, 28, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1562.7,540 1562.1,553 1594.2,554.6 1594.8,541.7', 1, 0, 1, NULL, 16),
(861, 29, 360.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1562.1,552.9 1561.4,565.9 1593.6,567.5 1594.2,554.6', 1, 0, 1, NULL, 16),
(862, 30, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1575.8,599.2l9.4,0.3c0,0,7.2-0.5,7.2-8.1l1.2-24l-16.1-0.7L1575.8,599.2z', 1, 1, 1, NULL, 16),
(863, 31, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1559.7,598.4 1575.8,599.2 1577.4,566.8 1561.3,565.9', 1, 0, 1, NULL, 16),
(864, 32, 450.00, 113, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1543.7,597.5 1559.8,598.3 1561.4,565.9 1545.3,565', 1, 0, 1, NULL, 16),
(865, 1, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1537.5,318.6l-1.1,23.1c0,0-2.3,11.9,8.7,12.3l6.9,0.3l1.6-34.8L1537.5,318.6z', 1, 1, 1, NULL, 16),
(866, 2, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1538.2,304.8 1537.5,318.6 1569.7,320.4 1570.3,306.6', 1, 0, 1, NULL, 16),
(867, 3, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1538.8,290.9 1538.2,304.8 1570.3,306.6 1571,292.7', 1, 0, 1, NULL, 16),
(868, 4, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1539.5,277 1538.8,290.9 1571,292.6 1571.6,278.8', 1, 0, 1, NULL, 16),
(869, 5, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1540.1,263.1 1539.5,277 1571.6,278.8 1572.2,264.9', 1, 0, 1, NULL, 16),
(870, 6, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1540.8,249.2 1540.1,263.1 1572.3,264.9 1572.9,251', 1, 0, 1, NULL, 16),
(871, 7, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1541.4,235.4 1540.8,249.3 1572.9,251.1 1573.5,237.2', 1, 0, 1, NULL, 16),
(872, 8, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1542,221.5 1541.4,235.3 1573.5,237.1 1574.2,223.2', 1, 0, 1, NULL, 16),
(873, 9, 360.00, 114, 0, '0', 0, '00', 0, '0', 0, '0', 0, '0', 0, '1542.7,207.6 1542,221.5 1574.2,223.3 1574.8,209.4', 1, 0, 1, NULL, 16),
(874, 10, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1543.3,193.7 1542.7,207.6 1574.8,209.3 1575.4,195.5', 1, 0, 1, NULL, 16),
(875, 11, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1544,179.9 1543.3,193.8 1575.4,195.5 1576.1,181.7', 1, 0, 1, NULL, 16),
(876, 12, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1544.6,165.9 1543.9,179.8 1576.1,181.5 1576.7,167.7', 1, 0, 1, NULL, 16),
(877, 13, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1545.2,152.1 1544.6,166 1576.7,167.7 1577.4,153.9', 1, 0, 1, NULL, 16),
(878, 14, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1545.2,152.1l16.1,0.9l1.6-34.7l-6.4-0.3c-0.8-0.3-10.7-0.1-10.3,10L1545.2,152.1z', 1, 1, 1, NULL, 16),
(879, 15, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1562.9,118.2 1579,119.1 1577.4,153.8 1561.3,152.9', 1, 0, 1, NULL, 16),
(880, 16, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1579,119.1 1595,120 1593.4,154.7 1577.4,153.9', 1, 0, 1, NULL, 16),
(881, 17, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1593.4,154.7l16.1,0.8l1-21.7c0,0,0.2-10.8-10.7-13.6l-4.8-0.2L1593.4,154.7z', 1, 1, 1, NULL, 14),
(882, 18, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1577.3,153.9 1576.7,167.8 1608.8,169.5 1609.5,155.7', 1, 0, 1, NULL, 14),
(883, 19, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1576.7,167.7 1576.1,181.6 1608.2,183.3 1608.8,169.5', 1, 0, 1, NULL, 14),
(884, 20, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1576.1,181.7 1575.4,195.5 1607.6,197.3 1608.2,183.5', 1, 0, 1, NULL, 14),
(885, 21, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1575.4,195.5 1574.8,209.4 1606.9,211.1 1607.6,197.3', 1, 0, 1, NULL, 14),
(886, 22, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1574.8,209.4 1574.1,223.3 1606.3,225.1 1606.9,211.2', 1, 0, 1, NULL, 14),
(887, 23, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1574.1,223.2 1573.5,237.1 1605.6,238.9 1606.3,225', 1, 0, 1, NULL, 14),
(888, 24, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1573.5,237.2 1572.9,251.1 1605,252.9 1605.6,239', 1, 0, 1, NULL, 14),
(889, 25, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1572.9,251 1572.2,264.9 1604.4,266.7 1605,252.8', 1, 0, 1, NULL, 14),
(890, 26, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1572.2,264.9 1571.6,278.8 1603.7,280.6 1604.3,266.7', 1, 0, 1, NULL, 14),
(891, 27, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1571.6,278.8 1570.9,292.6 1603.1,294.4 1603.7,280.6', 1, 0, 1, NULL, 14),
(892, 28, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1570.9,292.7 1570.3,306.6 1602.4,308.4 1603.1,294.5', 1, 0, 1, NULL, 14),
(893, 29, 360.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1570.3,306.5 1569.7,320.4 1601.8,322.2 1602.4,308.3', 1, 0, 1, NULL, 14),
(894, 30, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1584,356.2l9.4,0.4c0,0,6.6-1.3,7.2-8.7l1.2-25.7l-16.1-0.8L1584,356.2z', 1, 1, 1, NULL, 14),
(895, 31, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1568,355.3 1584,356.2 1585.7,321.4 1569.6,320.5', 1, 0, 1, NULL, 13),
(896, 32, 450.00, 114, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1552,354.4 1568,355.2 1569.7,320.4 1553.6,319.5', 1, 0, 1, NULL, 13),
(897, 1, 450.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1713.3,275.4l9.8-20.5l-20.9-10l-5.5,11.6c0,0-4.2,8.1,3.7,13.1L1713.3,275.4z', 1, 1, 1, NULL, 14),
(898, 2, 450.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '609.4,782.2 608.6,798.4 576.3,796.7 577.1,780.6', 1, 0, 3, NULL, 13),
(899, 3, 450.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '577.9,764.4 577.1,780.6 609.4,782.2 610.2,766.1', 1, 0, 3, NULL, 13),
(900, 5, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '611.1,749.8 609.5,782.2 622.4,782.8 624,750.4', 1, 0, 3, NULL, 13),
(901, 6, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '624,750.4 622.4,782.8 635.3,783.5 636.9,751.1', 1, 0, 3, NULL, 13),
(902, 7, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '637,751.1 635.4,783.5 648.3,784.1 649.9,751.7', 1, 0, 3, NULL, 13),
(903, 8, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '649.9,751.7 648.3,784.1 661.3,784.8 662.9,752.4', 1, 0, 3, NULL, 13),
(904, 9, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '662.9,752.4 661.3,784.8 674.2,785.4 675.8,753', 1, 0, 3, NULL, 13),
(905, 10, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '675.8,753 674.2,785.4 687.2,786.1 688.8,753.7', 1, 0, 3, NULL, 13),
(906, 11, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '688.8,753.7 687.2,786.1 700.1,786.7 701.7,754.3', 1, 0, 3, NULL, 13),
(907, 12, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '701.7,754.3 700.1,786.7 713.1,787.4 714.7,755', 1, 0, 3, NULL, 13),
(908, 13, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '714.6,755 713.1,787.4 726,788 727.6,755.6', 1, 0, 3, NULL, 13),
(909, 14, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '727.6,755.6 726,788 739,788.7 740.6,756.3', 1, 0, 3, NULL, 13),
(910, 15, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '740.6,756.3 739,788.7 751.9,789.3 753.5,756.9', 1, 0, 3, NULL, 13),
(911, 16, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '753.5,756.9 751.9,789.3 764.9,790 766.5,757.6', 1, 0, 3, NULL, 13),
(912, 17, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '766.5,757.6 764.9,790 777.8,790.6 779.5,758.2', 1, 0, 3, NULL, 13),
(913, 19, 450.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '778.6,774.4 777.8,790.6 810.2,792.2 811,776', 1, 0, 3, NULL, 14),
(914, 20, 450.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '777.8,790.6 777,806.9 809.4,808.4 810.2,792.2', 1, 0, 3, NULL, 14),
(915, 22, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '764.9,790 763.3,822.3 776.2,823 777.8,790.6', 1, 0, 3, NULL, 16),
(916, 23, 360.00, 14, 0, '0', 0, '0', 0, '00', 0, '0', 0, '0', 0, '751.9,789.3 750.3,821.7 763.2,822.3 764.8,790', 1, 0, 3, NULL, 16),
(917, 24, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '738.9,788.7 737.3,821 750.2,821.7 751.9,789.3', 1, 0, 3, NULL, 16),
(918, 25, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '726,788 724.4,820.4 737.3,821 738.9,788.7', 1, 0, 3, NULL, 16),
(919, 26, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '713,787.4 711.4,819.7 724.3,820.4 726,788', 1, 0, 3, NULL, 16),
(920, 27, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '700.1,786.7 698.5,819.1 711.4,819.7 713,787.4', 1, 0, 3, NULL, 16),
(921, 28, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '687.1,786.1 685.5,818.4 698.5,819.1 700.1,786.7', 1, 0, 3, NULL, 16),
(922, 34, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '609.4,782.2 607.8,814.6 620.8,815.2 622.4,782.8', 1, 0, 3, NULL, 16),
(923, 33, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '622.3,782.8 620.8,815.2 633.7,815.9 635.3,783.5', 1, 0, 3, NULL, 16),
(924, 32, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '635.3,783.5 633.7,815.9 646.7,816.5 648.3,784.1', 1, 0, 3, NULL, 16),
(925, 31, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '648.3,784.1 646.7,816.5 659.6,817.1 661.2,784.8', 1, 0, 3, NULL, 16),
(926, 30, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '661.2,784.8 659.6,817.2 672.5,817.8 674.2,785.4', 1, 0, 3, NULL, 16),
(927, 29, 360.00, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '674.2,785.4 672.6,817.8 685.5,818.4 687.1,786.1', 1, 0, 3, NULL, 16),
(928, 42, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '125.1,660.9 123,693.8 136,694.6 138.1,661.7', 1, 0, 1, NULL, 16),
(929, 41, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '138.1,661.8 136,694.7 149,695.5 151.1,662.6', 1, 0, 1, NULL, 16),
(930, 4, 450.00, 111, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1308.8,521.2l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1308.8,521.2z', 1, 1, 1, NULL, 14),
(931, 4, 450.00, 108, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1317,273l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1317,273z', 1, 1, 1, NULL, 14),
(932, 21, 450.00, 56, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1233.9,226.2l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1233.9,226.2z', 1, 1, 1, NULL, 14),
(933, 11, 450.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1666,315.4l11.8-25.1c0,0,3.4-6.4,10.5-3.3l7.8,4.2l-15.3,32.1L1666,315.4z', 1, 1, 1, NULL, 14),
(934, 14, 450.00, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1726.1,307.4l7.4,4.3c0,0,7.2,2.4,3.9,11.5l-11.5,24.2l-15-8L1726.1,307.4z', 1, 1, 1, NULL, 16),
(935, 2, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1707.8,233.2c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1707.8,233.2z', 1, 1, 1, NULL, 14),
(936, 3, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1713.4,221.5c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1713.4,221.5z', 1, 1, 1, NULL, 14),
(937, 4, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1718.9,210c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1718.9,210z', 1, 1, 1, NULL, 14),
(938, 5, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1724.5,198.3c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1724.5,198.3z', 1, 1, 1, NULL, 14),
(939, 6, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1730.1,186.5c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1730.1,186.5z', 1, 1, 1, NULL, 14),
(940, 7, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1735.7,174.7c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1735.7,174.7z', 1, 1, 1, NULL, 14),
(941, 9, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1746.9,151.3c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1746.9,151.3z', 1, 1, 1, NULL, 14),
(942, 10, 460.64, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1746.9,151.3l29.3,14l7-14.7l-21.4-10.4c0,0-6.6-3.3-11.4,4.4L1746.9,151.3z', 1, 1, 1, NULL, 14),
(943, 11, 453.55, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1783.3,150.6l21.7,11.1c0,0,5.3,3,3.8,10.3l-3.3,7.4l-29.3-14L1783.3,150.6z', 1, 1, 1, NULL, 16),
(944, 12, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1776.2,165.4c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1776.2,165.4z', 1, 1, 1, NULL, 16),
(945, 13, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1770.6,177.1c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1770.6,177.1z', 1, 1, 1, NULL, 16),
(946, 14, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1764.9,188.8c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1764.9,188.8z', 1, 1, 1, NULL, 16),
(947, 15, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1759.4,200.6c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1759.4,200.6z', 1, 1, 1, NULL, 16),
(948, 16, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1753.7,212.4c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1753.7,212.4z', 1, 1, 1, NULL, 16),
(949, 17, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1748.2,224.1c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1748.2,224.1z', 1, 1, 1, NULL, 16),
(950, 18, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1742.6,235.6c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1742.6,235.6z', 1, 1, 1, NULL, 16),
(951, 20, 450.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1730,283.4l12.6,6.4c0,0,7.7,4.8,11.7-3.6l6.4-13.3l-20.9-10L1730,283.4z', 1, 1, 1, NULL, 13),
(952, 21, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1723.1,254.9 1713.3,275.4 1730,283.4 1739.8,263', 1, 0, 1, NULL, 13),
(953, 2, 450.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '84.8,835.5 83.8,851.7 116.1,854 117.1,837.1', 1, 0, 3, NULL, 13),
(954, 3, 450.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '118.1,821 85.9,818.8 84.8,835.5 117.1,837.1', 1, 0, 3, NULL, 13),
(955, 13, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '222.8,811 220.8,843.9 233.8,844.7 235.9,811.8', 1, 0, 3, NULL, 13),
(956, 14, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '235.9,811.8 233.8,844.8 246.8,845.6 248.9,812.7', 1, 0, 3, NULL, 13),
(957, 15, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '249,812.7 246.9,845.6 260,846.4 262.1,813.5', 1, 0, 3, NULL, 13),
(958, 16, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '262,813.5 259.9,846.5 273,847.3 275.1,814.4', 1, 0, 3, NULL, 13),
(959, 17, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '275,814.4 273,847.3 286,848.1 288.1,815.2', 1, 0, 3, NULL, 13),
(960, 18, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '288,815.3 286,848.2 299,849 301.1,816.1', 1, 0, 3, NULL, 13),
(961, 21, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '286,848.2 283.9,881.1 296.9,881.9 299,849', 1, 0, 3, NULL, 13),
(962, 22, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '273,847.3 270.9,880.2 283.9,881.1 286,848.2', 1, 0, 3, NULL, 13),
(963, 23, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '260,846.4 257.9,879.3 271,880.2 273.1,847.3', 1, 0, 3, NULL, 13),
(964, 24, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '246.9,845.6 244.8,878.5 257.9,879.4 260,846.5', 1, 0, 3, NULL, 13),
(965, 25, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '233.8,844.8 231.7,877.7 244.8,878.5 246.9,845.6', 1, 0, 3, NULL, 13),
(966, 26, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '220.8,843.9 218.7,876.8 231.7,877.7 233.8,844.8', 1, 0, 3, NULL, 13),
(967, 1, 438.48, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M87.8,761.1l-0.6,9.8c0,0-0.4,6.7,9.3,7.3l22.5,1.2l1-16L87.8,761.1z', 1, 1, 3, NULL, 13),
(968, 2, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '88.8,744.9 87.8,761.1 120,763.3 121,746.5', 1, 0, 3, NULL, 13),
(969, 3, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 2, '122,730.4 89.9,728.2 88.8,744.9 121,746.5', 1, 0, 3, NULL, 13),
(970, 4, 439.48, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M123.1,713.5L98,712.3c0,0-6.4-0.8-7.7,7.9l-0.4,8.1l32.1,2.2L123.1,713.5z', 1, 1, 3, NULL, 13),
(971, 5, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '123.1,713.5 121,746.4 134,747.3 136,714.4', 1, 0, 3, NULL, 13),
(972, 6, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '136,714.4 133.9,747.3 146.9,748.1 149,715.2', 1, 0, 3, NULL, 13),
(973, 7, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '149,715.2 146.9,748.1 159.9,749 161.9,716.1', 1, 0, 3, NULL, 13),
(974, 8, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '161.9,716.1 159.8,749 172.8,749.8 174.8,716.9', 1, 0, 3, NULL, 13),
(975, 9, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '174.8,716.9 172.8,749.8 185.7,750.7 187.7,717.8', 1, 0, 3, NULL, 13),
(976, 10, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '187.7,717.8 185.6,750.7 198.5,751.5 200.6,718.6', 1, 0, 3, NULL, 13),
(977, 11, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '200.6,718.6 198.6,751.5 211.5,752.4 213.6,719.5', 1, 0, 3, NULL, 13),
(978, 12, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '213.5,719.5 211.4,752.4 224.3,753.2 226.4,720.3', 1, 0, 3, NULL, 13),
(979, 13, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '226.4,720.4 224.4,753.3 237.4,754.1 239.5,721.2', 1, 0, 3, NULL, 13),
(980, 14, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '239.4,721.2 237.4,754.1 250.4,755 252.5,722.1', 1, 0, 3, NULL, 13),
(981, 15, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '252.5,722.1 250.4,755 263.5,755.8 265.6,722.9', 1, 0, 3, NULL, 13),
(982, 16, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '265.5,722.9 263.4,755.8 276.5,756.7 278.6,723.8', 1, 0, 3, NULL, 13),
(983, 17, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, '278.5,723.8 276.5,756.7 289.4,757.5 291.5,724.6', 1, 0, 3, NULL, 13),
(984, 20, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '317.5,726.3 315.4,759.2 328.4,760.1 330.5,727.2', 1, 0, 3, NULL, 14),
(985, 19, 360.00, 2, 0, '0', 0, '0', 0, '00', 0, '0', 0, '0', 0, '304.5,725.5 302.4,758.4 315.4,759.2 317.5,726.3', 1, 0, 3, NULL, 16),
(986, 18, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '291.5,724.6 289.4,757.5 302.4,758.4 304.5,725.5', 1, 0, 3, NULL, 16),
(987, 21, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '315.5,759.2 313.4,792.1 326.4,792.9 328.5,760', 1, 0, 3, NULL, 15),
(988, 22, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '302.4,758.4 300.4,791.3 313.4,792.1 315.5,759.2', 1, 0, 3, NULL, 13),
(989, 23, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '289.4,757.5 287.3,790.4 300.3,791.3 302.4,758.4', 1, 0, 3, NULL, 13),
(990, 24, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '276.5,756.7 274.4,789.6 287.4,790.4 289.5,757.5', 1, 0, 3, NULL, 13),
(991, 25, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '263.5,755.8 261.4,788.7 274.5,789.5 276.6,756.6', 1, 0, 3, NULL, 13),
(992, 26, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '250.4,755 248.4,787.9 261.4,788.7 263.5,755.8', 1, 0, 3, NULL, 13),
(993, 27, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '237.4,754.1 235.3,787 248.3,787.9 250.4,755', 1, 0, 3, NULL, 13),
(994, 28, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '224.4,753.3 222.3,786.2 235.3,787 237.4,754.1', 1, 0, 3, NULL, 13),
(995, 29, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '211.5,752.4 209.5,785.3 222.4,786.1 224.4,753.2', 1, 0, 3, NULL, 13),
(996, 30, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '198.6,751.6 196.5,784.5 209.4,785.3 211.5,752.4', 1, 0, 3, NULL, 13),
(997, 31, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '185.6,750.7 183.6,783.6 196.5,784.5 198.5,751.6', 1, 0, 3, NULL, 13),
(998, 32, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '172.8,749.9 170.7,782.8 183.6,783.6 185.7,750.7', 1, 0, 3, NULL, 13),
(999, 33, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '159.9,749 157.8,781.9 170.8,782.7 172.9,749.8', 1, 0, 3, NULL, 13),
(1000, 34, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '146.9,748.2 144.9,781.1 157.8,781.9 159.9,749', 1, 0, 3, NULL, 13),
(1001, 35, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '133.9,747.3 131.9,780.2 144.8,781.1 146.9,748.2', 1, 0, 3, NULL, 13),
(1002, 36, 360.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '121,746.5 119,779.4 131.9,780.2 134,747.3', 1, 0, 3, NULL, 13),
(1003, 5, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '127.1,628 125.1,660.9 138.1,661.7 140.2,628.8', 1, 0, 3, NULL, 14),
(1004, 6, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '140.1,628.8 138.1,661.7 151.1,662.6 153.2,629.7', 1, 0, 3, NULL, 14),
(1005, 7, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '153.2,629.7 151.1,662.6 164.2,663.4 166.3,630.5', 1, 0, 3, NULL, 14),
(1006, 8, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '166.2,630.5 164.1,663.4 177.1,664.3 179.2,631.4', 1, 0, 3, NULL, 14),
(1007, 9, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '179.2,631.4 177.1,664.3 190.1,665.1 192.2,632.2', 1, 0, 3, NULL, 14),
(1008, 10, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '192.2,632.2 190.1,665.1 203.1,666 205.2,633.1', 1, 0, 3, NULL, 14),
(1009, 11, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '205.2,633.1 203.1,666 216.1,666.8 218.2,633.9', 1, 0, 3, NULL, 14),
(1010, 12, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '218.1,633.9 216.1,666.8 229.1,667.7 231.2,634.8', 1, 0, 3, NULL, 14),
(1011, 40, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '151.1,662.6 149.1,695.5 162.1,696.3 164.2,663.4', 1, 0, 3, NULL, 16),
(1012, 39, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '164.2,663.4 162.1,696.3 175.1,697.2 177.2,664.3', 1, 0, 3, NULL, 16),
(1013, 38, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '177.1,664.3 175.1,697.2 188.1,698 190.1,665.1', 1, 0, 3, NULL, 16),
(1014, 37, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '190.1,665.2 188,698.1 201,698.9 203.1,666', 1, 0, 3, NULL, 16),
(1015, 36, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '203.1,666 201.1,698.9 214,699.7 216.1,666.8', 1, 0, 3, NULL, 16),
(1016, 35, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '216.2,666.8 214.1,699.7 227.1,700.6 229.2,667.7', 1, 0, 3, NULL, 16),
(1017, 2, 450.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1122.6,722 1121.8,738.2 1089.5,736.6 1090.3,720.4', 1, 0, 3, NULL, 16),
(1018, 3, 450.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1091.1,704.3 1090.3,720.4 1122.6,722 1123.4,705.9', 1, 0, 3, NULL, 16),
(1019, 5, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1124.3,689.7 1122.7,722 1135.6,722.7 1137.2,690.3', 1, 0, 3, NULL, 14),
(1020, 6, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1137.2,690.3 1135.6,722.7 1148.5,723.3 1150.2,691', 1, 0, 3, NULL, 14),
(1021, 7, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1150.2,691 1148.6,723.3 1161.5,724 1163.1,691.6', 1, 0, 3, NULL, 14),
(1022, 8, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1163.1,691.6 1161.5,724 1174.5,724.6 1176.1,692.3', 1, 0, 3, NULL, 14),
(1023, 9, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1176.1,692.3 1174.5,724.6 1187.4,725.3 1189,692.9', 1, 0, 3, NULL, 14),
(1024, 10, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1189,692.9 1187.5,725.3 1200.4,725.9 1202,693.6', 1, 0, 3, NULL, 14),
(1025, 11, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1202,693.6 1200.4,725.9 1213.3,726.6 1214.9,694.2', 1, 0, 3, NULL, 14),
(1026, 12, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1214.9,694.2 1213.3,726.6 1226.3,727.2 1227.9,694.9', 1, 0, 3, NULL, 14),
(1027, 13, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1227.9,694.9 1226.3,727.2 1239.2,727.9 1240.8,695.5', 1, 0, 3, NULL, 14),
(1028, 14, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1240.9,695.5 1239.3,727.9 1252.2,728.5 1253.8,696.2', 1, 0, 3, NULL, 14),
(1029, 15, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1253.8,696.2 1252.2,728.5 1265.1,729.2 1266.7,696.8', 1, 0, 3, NULL, 14),
(1030, 16, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1266.8,696.8 1265.2,729.2 1278.1,729.8 1279.7,697.4', 1, 0, 3, NULL, 14),
(1031, 17, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1279.7,697.4 1278.1,729.8 1291,730.5 1292.7,698.1', 1, 0, 3, NULL, 14),
(1032, 19, 450.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1291.9,714.3 1291,730.5 1323.4,732.1 1324.2,715.9', 1, 0, 3, NULL, 13),
(1033, 20, 450.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1291,730.5 1290.2,746.8 1322.6,748.3 1323.4,732.1', 1, 0, 3, NULL, 13),
(1034, 22, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1278.1,729.8 1276.5,762.2 1289.4,762.9 1291,730.5', 1, 0, 3, NULL, 13),
(1035, 23, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1265.1,729.2 1263.5,761.6 1276.4,762.2 1278.1,729.8', 1, 0, 3, NULL, 13),
(1036, 24, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1252.1,728.5 1250.5,760.9 1263.5,761.6 1265.1,729.2', 1, 0, 3, NULL, 13),
(1037, 25, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1239.2,727.9 1237.6,760.3 1250.5,760.9 1252.2,728.5', 1, 0, 3, NULL, 13),
(1038, 26, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1226.2,727.2 1224.6,759.6 1237.5,760.3 1239.2,727.9', 1, 0, 3, NULL, 13),
(1039, 27, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1213.3,726.6 1211.7,759 1224.6,759.6 1226.2,727.2', 1, 0, 3, NULL, 13),
(1040, 28, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1200.4,725.9 1198.8,758.3 1211.7,759 1213.3,726.6', 1, 0, 3, NULL, 13),
(1041, 29, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1187.4,725.3 1185.8,757.7 1198.7,758.3 1200.3,725.9', 1, 0, 3, NULL, 13),
(1042, 30, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1174.4,724.6 1172.8,757 1185.7,757.7 1187.4,725.3', 1, 0, 3, NULL, 13),
(1043, 31, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1161.5,724 1159.9,756.4 1172.8,757 1174.4,724.6', 1, 0, 3, NULL, 13),
(1044, 32, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1148.5,723.3 1146.9,755.7 1159.9,756.4 1161.5,724', 1, 0, 3, NULL, 13),
(1045, 33, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1135.6,722.7 1134,755.1 1146.9,755.7 1148.5,723.3', 1, 0, 3, NULL, 13),
(1046, 34, 360.00, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1122.6,722 1121,754.4 1134,755.1 1135.6,722.7', 1, 0, 3, NULL, 13),
(1047, 5, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '119.2,804.2 117.1,837.1 130.1,837.9 132.2,805', 1, 0, 3, NULL, 13),
(1048, 6, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '132.1,805 130.1,837.9 143,838.8 145.1,805.9', 1, 0, 3, NULL, 13),
(1049, 7, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '145.2,805.9 143.1,838.8 156.1,839.6 158.2,806.7', 1, 0, 3, NULL, 13),
(1050, 8, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '158.1,806.7 156,839.6 169,840.5 171.1,807.6', 1, 0, 3, NULL, 13),
(1051, 9, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '171.1,807.6 169,840.5 181.9,841.3 184,808.4', 1, 0, 3, NULL, 13),
(1052, 15, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'matrix(-0.9987 -5.003785e-002 5.003785e-002 -0.9987 1411.8705 551.2997)', 1, 3, 1, NULL, 13),
(1053, 10, 360.00, 1, 0, '0', 0, '0', 0, '00', 0, '0', 0, '0', 0, '184,808.4 181.9,841.3 194.8,842.2 196.9,809.3', 1, 0, 3, NULL, 13),
(1054, 11, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '196.9,809.3 194.9,842.2 207.8,843 209.9,810.1', 1, 0, 3, NULL, 13),
(1055, 16, 450.00, 2, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 3, 'matrix(-0.9987 -5.003785e-002 5.003785e-002 -0.9987 1444.1642 553.8381)', 1, 3, 1, NULL, 13),
(1056, 12, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '209.8,810.1 207.8,843 220.7,843.9 222.8,811', 1, 0, 3, NULL, 13),
(1057, 34, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '117.1,837.1 115.1,870 128,870.8 130.1,837.9', 1, 0, 3, NULL, 13),
(1058, 33, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '130.1,837.9 128,870.9 141,871.7 143.1,838.8', 1, 0, 3, NULL, 13),
(1059, 32, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '143.1,838.8 141,871.7 154,872.5 156.1,839.6', 1, 0, 3, NULL, 13),
(1060, 31, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '156.1,839.6 154,872.5 167,873.3 169.1,840.4', 1, 0, 3, NULL, 13),
(1061, 30, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '169,840.5 166.9,873.4 179.9,874.2 182,841.3', 1, 0, 3, NULL, 13),
(1062, 29, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '181.9,841.3 179.8,874.3 192.8,875.1 194.9,842.2', 1, 0, 3, NULL, 13),
(1063, 28, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '194.9,842.2 192.8,875.1 205.8,875.9 207.8,843', 1, 0, 3, NULL, 13),
(1064, 27, 360.00, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '207.9,843 205.8,875.9 218.7,876.7 220.8,843.8', 1, 0, 3, NULL, 13),
(1065, 1, 439.48, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M83.8,851.7l-0.6,9.8c0,0-0.4,6.7,9.3,7.3l22.6,1.2l1-16L83.8,851.7z', 1, 1, 3, NULL, 13),
(1066, 4, 439.48, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M119.2,804.2L94,802.9c0,0-6.5-0.8-7.7,7.9l-0.4,8.1l32.2,2.2L119.2,804.2z', 1, 1, 3, NULL, 13),
(1067, 19, 485.70, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '301.1,816.1 318.3,816.9 316.3,849.8 299,848.7', 1, 0, 3, NULL, 14),
(1068, 20, 485.70, 1, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '296.9,881.9 314.3,882.6 316.3,849.8 299,849', 1, 0, 3, NULL, 14),
(1069, 1, 439.62, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M94.9,673.5l-0.6,9.5c0,0-1.6,8.8,8.3,9.2l20.4,1.6l1.2-18.3L94.9,673.5z', 1, 1, 3, NULL, 16),
(1070, 2, 362.86, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '95.7,659 94.9,673.5 124.1,675.5 125.1,660.9', 1, 0, 3, NULL, 16),
(1071, 3, 362.86, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '96.7,644.3 95.7,659 125.1,660.9 126,646.1', 1, 0, 3, NULL, 16),
(1072, 4, 432.75, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M127.1,628l-19.2-1.2c0,0-10.5-0.5-10.8,9.7l-0.5,7.8l29.3,1.8L127.1,628z', 1, 1, 3, NULL, 15),
(1073, 13, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '231.2,634.8 229.1,667.7 242.1,668.6 244.2,635.7', 1, 0, 3, NULL, 15),
(1074, 14, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '244.2,635.7 242.1,668.6 255.1,669.4 257.2,636.5', 1, 0, 3, NULL, 15),
(1075, 15, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '257.3,636.5 255.2,669.4 268.2,670.3 270.3,637.4', 1, 0, 3, NULL, 15),
(1076, 16, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '270.2,637.4 268.2,670.3 281.2,671.1 283.3,638.2', 1, 0, 3, NULL, 15),
(1077, 17, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '283.3,638.2 281.2,671.1 294.2,672 296.3,639.1', 1, 0, 3, NULL, 15),
(1078, 18, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '296.2,639.1 294.1,672 307.1,672.8 309.2,639.9', 1, 0, 3, NULL, 15),
(1079, 19, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '309.2,639.9 307.2,672.8 320.2,673.7 322.3,640.8', 1, 0, 3, NULL, 15),
(1080, 20, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '322.2,640.8 320.1,673.7 333.1,674.5 335.2,641.6', 1, 0, 3, NULL, 15),
(1081, 21, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '335.2,641.6 333.2,674.5 346.1,675.4 348.2,642.5', 1, 0, 3, NULL, 15),
(1082, 22, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '348.2,642.5 346.1,675.4 359.1,676.2 361.2,643.3', 1, 0, 3, NULL, 15),
(1083, 23, 424.51, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M361.2,643.3l6.4,0.4c0,0,7.8,0.6,8,10.5l-1.2,22.9l-15.3-0.9L361.2,643.3z', 1, 1, 3, NULL, 15),
(1084, 24, 442.45, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M357.1,709.1l9,0.5c0,0,6.5,1.1,7.2-9.1l1.2-23.4l-15.3-0.9L357.1,709.1z', 1, 1, 3, NULL, 15),
(1085, 25, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '346.2,675.4 344.1,708.3 357.1,709.1 359.2,676.2', 1, 0, 3, NULL, 15),
(1086, 26, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '333.2,674.5 331.1,707.4 344.1,708.3 346.2,675.4', 1, 0, 3, NULL, 15),
(1087, 27, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '320.2,673.7 318.1,706.6 331.1,707.4 333.2,674.5', 1, 0, 3, NULL, 16),
(1088, 28, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '307.2,672.8 305.1,705.7 318.1,706.6 320.2,673.7', 1, 0, 3, NULL, 16),
(1089, 29, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '294.1,672 292.1,704.9 305.1,705.7 307.1,672.8', 1, 0, 3, NULL, 16),
(1090, 30, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '281.2,671.1 279.1,704 292.1,704.9 294.2,672', 1, 0, 3, NULL, 16),
(1091, 31, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '268.2,670.3 266.2,703.2 279.2,704 281.3,671.1', 1, 0, 3, NULL, 16),
(1092, 32, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '255.2,669.4 253.1,702.3 266.1,703.2 268.2,670.3', 1, 0, 3, NULL, 16),
(1093, 33, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '242.1,668.6 240,701.5 253.1,702.3 255.1,669.4', 1, 0, 3, NULL, 16),
(1094, 34, 360.00, 3, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '229.1,667.7 227,700.6 240.1,701.5 242.2,668.6', 1, 0, 3, NULL, 16),
(1095, 5, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, '1118.1,771.6 1116.5,804.4 1129.5,805 1131.1,772.2', 1, 0, 3, NULL, 13),
(1096, 2, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '388.9,836.6 388,850.5 422.3,852.7 423.2,838.8', 1, 0, 3, NULL, 14),
(1097, 3, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '389.7,822.7 388.8,836.7 423.2,838.8 424,824.9', 1, 0, 3, NULL, 14),
(1098, 4, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '390.5,808.6 389.7,822.6 424,824.8 424.8,810.9', 1, 0, 3, NULL, 14),
(1099, 5, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '391.4,794.8 390.5,808.7 424.8,810.9 425.7,797', 1, 0, 3, NULL, 14),
(1100, 6, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '392.3,780.8 391.4,794.8 425.7,796.9 426.6,783', 1, 0, 3, NULL, 14),
(1101, 7, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '393.1,766.9 392.3,780.9 426.6,783 427.4,769.1', 1, 0, 3, NULL, 14),
(1102, 8, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '394,752.9 393.1,766.8 427.4,769 428.2,755.1', 1, 0, 3, NULL, 14),
(1103, 9, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '394.8,739 393.9,752.9 428.3,755.1 429.1,741.2', 1, 0, 3, NULL, 14),
(1104, 10, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '395.7,724.9 394.8,738.9 429.1,741.1 429.9,727.2', 1, 0, 3, NULL, 14),
(1105, 11, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '396.5,711.1 395.6,725 430,727.2 430.8,713.3', 1, 0, 3, NULL, 13),
(1106, 12, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '397.3,697 396.5,711 430.8,713.1 431.6,699.2', 1, 0, 3, NULL, 13),
(1107, 13, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '00', 0, '0', 0, '398.2,683.1 397.3,697.1 431.6,699.2 432.5,685.3', 1, 0, 3, NULL, 13),
(1108, 14, 437.29, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M398.2,683.1l17.2,1.1l2.1-34.9l-6.9-0.4c-0.8-0.3-11.4-0.3-11.1,9.9L398.2,683.1z', 1, 1, 3, NULL, 14),
(1109, 15, 452.23, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '417.5,649.3 434.6,650.4 432.5,685.3 415.3,684.2', 1, 0, 3, NULL, 14),
(1110, 16, 450.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '434.6,650.4 451.8,651.5 449.6,686.4 432.5,685.3', 1, 0, 3, NULL, 14),
(1111, 17, 401.71, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M449.6,686.4l17.2,1l1.3-21.8c0,0,0.3-10.9-11.3-13.8l-5.1-0.3L449.6,686.4z', 1, 1, 3, NULL, 14),
(1112, 18, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '432.5,685.3 431.6,699.3 465.9,701.5 466.8,687.6', 1, 0, 3, NULL, 16),
(1113, 19, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '431.6,699.2 430.8,713.2 465.1,715.3 465.9,701.4', 1, 0, 3, NULL, 16),
(1114, 20, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '430.8,713.3 429.9,727.2 464.2,729.4 465.1,715.5', 1, 0, 3, NULL, 16),
(1115, 21, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '429.9,727.2 429.1,741.1 463.4,743.3 464.2,729.4', 1, 0, 3, NULL, 16),
(1116, 22, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '429.1,741.2 428.2,755.1 462.5,757.3 463.4,743.4', 1, 0, 3, NULL, 16),
(1117, 23, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '428.2,755.1 427.4,769 461.7,771.2 462.5,757.3', 1, 0, 3, NULL, 16),
(1118, 24, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '427.4,769.1 426.5,783.1 460.8,785.2 461.7,771.3', 1, 0, 3, NULL, 16),
(1119, 25, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '426.5,783 425.7,797 460,799.1 460.8,785.2', 1, 0, 3, NULL, 16),
(1120, 26, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '425.7,797 424.8,810.9 459.1,813.1 460,799.2', 1, 0, 3, NULL, 16),
(1121, 27, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '424.8,810.9 424,824.8 458.3,827 459.1,813.1', 1, 0, 3, NULL, 16),
(1122, 28, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '424,824.9 423.1,838.9 457.4,841 458.3,827.1', 1, 0, 3, NULL, 16),
(1123, 29, 360.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '423.1,838.8 422.3,852.7 456.6,854.9 457.4,841', 1, 0, 3, NULL, 16),
(1124, 32, 450.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '403,886.6 420.1,887.7 422.3,852.7 405.1,851.6', 1, 0, 3, NULL, 13),
(1125, 6, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1131,772.2 1129.5,805 1142.5,805.7 1144,772.8', 1, 0, 3, NULL, 13),
(1126, 7, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1144.1,772.8 1142.5,805.7 1155.5,806.3 1157.1,773.5', 1, 0, 3, NULL, 13),
(1127, 8, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1157,773.5 1155.5,806.3 1168.5,806.9 1170,774.1', 1, 0, 3, NULL, 13);
INSERT INTO `lote` (`id`, `nroLote`, `superficie`, `manzano`, `uv`, `norte`, `medidaNorte`, `sur`, `medidaSur`, `este`, `medidaEste`, `oeste`, `medidaOeste`, `matricula`, `estado`, `point`, `fase`, `tipo_etiqueta`, `idProyecto`, `deleted_at`, `idCategoriaLote`) VALUES
(1128, 9, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1170,774.1 1168.5,806.9 1181.4,807.6 1183,774.7', 1, 0, 3, NULL, 13),
(1129, 10, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, '1182.9,774.7 1181.4,807.6 1194.4,808.2 1195.9,775.4', 1, 0, 3, NULL, 13),
(1130, 11, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1195.9,775.4 1194.4,808.2 1207.4,808.8 1208.9,776', 1, 0, 3, NULL, 13),
(1131, 12, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1208.8,776 1207.3,808.8 1220.3,809.5 1221.8,776.6', 1, 0, 3, NULL, 13),
(1132, 13, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1221.9,776.7 1220.3,809.5 1233.4,810.1 1235,777.3', 1, 0, 3, NULL, 13),
(1133, 14, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1234.9,777.3 1233.4,810.1 1246.4,810.8 1248,777.9', 1, 0, 3, NULL, 13),
(1134, 15, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1248,777.9 1246.5,810.8 1259.6,811.4 1261.1,778.6', 1, 0, 3, NULL, 13),
(1135, 16, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '00', 0, '0', 0, '1261.1,778.6 1259.5,811.4 1272.6,812 1274.2,779.2', 1, 0, 3, NULL, 13),
(1136, 17, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1274.1,779.2 1272.6,812 1285.7,812.7 1287.2,779.8', 1, 0, 3, NULL, 13),
(1137, 18, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1287.2,779.8 1285.6,812.7 1298.7,813.3 1300.2,780.5', 1, 0, 3, NULL, 13),
(1138, 21, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1285.6,812.7 1284.1,845.5 1297.1,846.2 1298.7,813.3', 1, 0, 3, NULL, 13),
(1139, 22, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1272.6,812.1 1271.1,844.9 1284.1,845.5 1285.7,812.7', 1, 0, 3, NULL, 13),
(1140, 23, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1259.6,811.4 1258.1,844.2 1271.2,844.8 1272.7,812', 1, 0, 3, NULL, 13),
(1141, 24, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1246.5,810.8 1245,843.6 1258,844.2 1259.6,811.4', 1, 0, 3, NULL, 13),
(1142, 25, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1233.4,810.2 1231.8,843 1244.9,843.6 1246.5,810.8', 1, 0, 3, NULL, 13),
(1143, 26, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1220.3,809.5 1218.8,842.4 1231.9,843 1233.4,810.2', 1, 0, 3, NULL, 13),
(1144, 27, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1207.4,808.8 1205.9,841.7 1218.8,842.3 1220.4,809.4', 1, 0, 3, NULL, 13),
(1145, 28, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1194.4,808.2 1192.9,841.1 1205.8,841.7 1207.4,808.9', 1, 0, 3, NULL, 13),
(1146, 29, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1181.4,807.6 1179.9,840.4 1192.8,841.1 1194.4,808.2', 1, 0, 3, NULL, 13),
(1147, 30, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1168.5,807 1167,839.8 1179.9,840.4 1181.5,807.6', 1, 0, 3, NULL, 13),
(1148, 31, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1155.6,806.3 1154,839.1 1167,839.7 1168.6,806.9', 1, 0, 3, NULL, 13),
(1149, 32, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1142.5,805.7 1141,838.5 1154,839.1 1155.6,806.3', 1, 0, 3, NULL, 13),
(1150, 33, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1129.5,805.1 1128,837.9 1141,838.5 1142.5,805.7', 1, 0, 3, NULL, 13),
(1151, 34, 360.00, 10, 0, '0', 0, '0', 0, '00', 0, '00', 0, '0', 0, '1116.5,804.4 1115,837.3 1128,837.9 1129.5,805', 1, 0, 3, NULL, 13),
(1152, 1, 439.48, 10, 0, '0', 0, '0', 0, '00', 0, '0', 0, '0', 0, 'M1083.4,819.5l-0.5,9.8c0,0-0.3,6.7,9.4,7.1l22.6,0.8l0.7-16L1083.4,819.5z', 1, 1, 3, NULL, 14),
(1153, 2, 450.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1084.2,803.4 1083.4,819.5 1115.8,821.3 1116.5,804.4', 1, 0, 3, NULL, 14),
(1154, 3, 450.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1117.3,788.4 1085,786.7 1084.2,803.4 1116.5,804.4', 1, 0, 3, NULL, 14),
(1155, 4, 439.48, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1118.1,771.6l-25.2-0.9c0,0-6.5-0.6-7.6,8l-0.2,8l32.2,1.7L1118.1,771.6z', 1, 1, 3, NULL, 14),
(1156, 19, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1300.3,780.5 1298.7,813.3 1311.8,813.9 1313.3,781.1', 1, 0, 3, NULL, 14),
(1157, 20, 360.00, 10, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1298.7,813.3 1297.2,846.2 1310.2,846.8 1311.8,814', 1, 0, 3, NULL, 14),
(1158, 1, 439.48, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M388,850.5l-1.5,23.2c0,0-2.6,11.9,9.1,12.5l7.3,0.4l2.1-35L388,850.5z', 1, 1, 3, NULL, 14),
(1159, 30, 439.48, 4, 0, '0', 0, '0', 0, '0', 0, '00', 0, '0', 0, 'M437.2,888.9l10,0.5c0,0,7.1-1.3,7.8-8.6l1.6-25.8l-17.2-1L437.2,888.9z', 1, 1, 3, NULL, 13),
(1160, 31, 450.00, 4, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '420.1,887.8 437.2,888.9 439.4,853.9 422.2,852.8', 1, 0, 3, NULL, 13),
(1161, 1, 439.48, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M607.8,814.6l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L607.8,814.6z', 1, 1, 3, NULL, 13),
(1162, 4, 439.48, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M611.1,749.8l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L611.1,749.8z', 1, 1, 3, NULL, 13),
(1163, 18, 439.48, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M779.5,758.2l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L779.5,758.2z', 1, 1, 3, NULL, 14),
(1164, 21, 439.48, 14, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M777,806.9l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L777,806.9z', 1, 1, 3, NULL, 14),
(1165, 1, 439.48, 8, 0, '0', 0, '0', 0, '0', 0, '00', 0, '0', 0, 'M1121,754.4l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L1121,754.4z', 1, 1, 3, NULL, 14),
(1166, 4, 439.48, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1124.3,689.7l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L1124.3,689.7z', 1, 1, 3, NULL, 14),
(1167, 18, 439.48, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1292.7,698.1l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1292.7,698.1z', 1, 1, 3, NULL, 14),
(1168, 21, 439.48, 8, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1290.2,746.8l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1290.2,746.8z', 1, 1, 3, NULL, 14),
(1169, 1, 439.48, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M864.7,740.9l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L864.7,740.9z', 1, 1, 3, NULL, 14),
(1170, 2, 450.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '866.3,708.5 865.5,724.7 833.2,723.1 834,706.9', 1, 0, 3, NULL, 14),
(1171, 3, 450.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '834.8,690.8 834,706.9 866.3,708.5 867.1,692.4', 1, 0, 3, NULL, 14),
(1172, 4, 439.48, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 1, 'M868,676.2l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L868,676.2z', 1, 1, 3, NULL, 14),
(1173, 5, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '868,676.2 866.4,708.5 879.3,709.2 880.9,676.8', 1, 0, 3, NULL, 14),
(1174, 6, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '880.9,676.8 879.3,709.2 892.2,709.8 893.9,677.5', 1, 0, 3, NULL, 14),
(1175, 7, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '893.9,677.5 892.3,709.8 905.2,710.5 906.8,678.1', 1, 0, 3, NULL, 14),
(1176, 8, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '906.8,678.1 905.2,710.5 918.2,711.1 919.8,678.7', 1, 0, 3, NULL, 14),
(1177, 9, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '919.8,678.7 918.2,711.1 931.1,711.8 932.7,679.4', 1, 0, 3, NULL, 14),
(1178, 10, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '932.7,679.4 931.2,711.8 944.1,712.4 945.7,680', 1, 0, 3, NULL, 14),
(1179, 11, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '945.7,680 944.1,712.4 957,713.1 958.7,680.7', 1, 0, 3, NULL, 14),
(1180, 12, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '958.6,680.7 957,713.1 970,713.7 971.6,681.3', 1, 0, 3, NULL, 14),
(1181, 13, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '971.6,681.3 970,713.7 982.9,714.4 984.5,682', 1, 0, 3, NULL, 14),
(1182, 14, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '984.6,682 983,714.4 995.9,715 997.5,682.6', 1, 0, 3, NULL, 14),
(1183, 15, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '997.5,682.6 995.9,715 1008.8,715.7 1010.4,683.3', 1, 0, 3, NULL, 14),
(1184, 16, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1010.5,683.3 1008.9,715.7 1021.8,716.3 1023.4,683.9', 1, 0, 3, NULL, 14),
(1185, 17, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1023.4,683.9 1021.8,716.3 1034.7,717 1036.4,684.6', 1, 0, 3, NULL, 14),
(1186, 18, 439.48, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1036.4,684.6l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L1036.4,684.6z', 1, 1, 3, NULL, 14),
(1187, 19, 450.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1035.6,700.8 1034.7,717 1067.1,718.6 1067.9,702.4', 1, 0, 3, NULL, 16),
(1188, 20, 450.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1034.7,717 1033.9,733.3 1066.3,734.8 1067.1,718.6', 1, 0, 3, NULL, 16),
(1189, 21, 439.48, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1033.9,733.3l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L1033.9,733.3z', 1, 1, 3, NULL, 15),
(1190, 22, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1021.8,716.3 1020.2,748.7 1033.1,749.3 1034.7,717', 1, 0, 3, NULL, 15),
(1191, 23, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1008.8,715.7 1007.2,748 1020.1,748.7 1021.8,716.3', 1, 0, 3, NULL, 15),
(1192, 24, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '995.8,715 994.2,747.4 1007.2,748 1008.8,715.7', 1, 0, 3, NULL, 15),
(1193, 25, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '982.9,714.4 981.3,746.8 994.2,747.4 995.9,715', 1, 0, 3, NULL, 15),
(1194, 26, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '969.9,713.7 968.3,746.1 981.2,746.7 982.9,714.4', 1, 0, 3, NULL, 15),
(1195, 27, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '957,713.1 955.4,745.5 968.3,746.1 969.9,713.7', 1, 0, 3, NULL, 15),
(1196, 28, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '944.1,712.4 942.5,744.8 955.4,745.5 957,713.1', 1, 0, 3, NULL, 15),
(1197, 29, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '931.1,711.8 929.5,744.2 942.4,744.8 944.1,712.4', 1, 0, 3, NULL, 15),
(1198, 30, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '918.1,711.1 916.5,743.5 929.5,744.2 931.1,711.8', 1, 0, 3, NULL, 15),
(1199, 31, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '905.2,710.5 903.6,742.9 916.5,743.5 918.1,711.1', 1, 0, 3, NULL, 15),
(1200, 32, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '892.2,709.8 890.6,742.2 903.6,742.9 905.2,710.5', 1, 0, 3, NULL, 15),
(1201, 33, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '879.3,709.2 877.7,741.6 890.6,742.2 892.2,709.8', 1, 0, 3, NULL, 15),
(1202, 34, 360.00, 7, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '866.3,708.5 864.7,740.9 877.7,741.6 879.3,709.2', 1, 0, 3, NULL, 15),
(1203, 1, 439.48, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M481,851.1l-1.5,22.6c0,0-2.6,11.6,8.9,12.2l7.2,0.5l2.2-34.1L481,851.1z', 1, 1, 3, NULL, 13),
(1204, 2, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '481.8,837.5 481,851.1 514.8,853.3 515.6,839.8', 1, 0, 3, NULL, 13),
(1205, 3, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '482.7,823.9 481.8,837.6 515.6,839.8 516.5,826.2', 1, 0, 3, NULL, 13),
(1206, 4, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '483.6,810.2 482.7,823.9 516.5,826.1 517.4,812.5', 1, 0, 3, NULL, 13),
(1207, 5, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '484.5,796.7 483.6,810.3 517.4,812.5 518.3,799', 1, 0, 3, NULL, 13),
(1208, 6, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '485.4,783.1 484.5,796.7 518.3,798.9 519.2,785.4', 1, 0, 3, NULL, 13),
(1209, 7, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '486.3,769.5 485.4,783.2 519.2,785.4 520.1,771.8', 1, 0, 3, NULL, 13),
(1210, 8, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '487.2,755.8 486.3,769.5 520.1,771.7 521,758.1', 1, 0, 3, NULL, 13),
(1211, 9, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '488.1,742.3 487.2,755.9 521,758.1 521.8,744.6', 1, 0, 3, NULL, 13),
(1212, 10, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '489,728.6 488.1,742.2 521.9,744.5 522.7,730.9', 1, 0, 3, NULL, 13),
(1213, 11, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '489.8,715.1 488.9,728.7 522.7,730.9 523.6,717.4', 1, 0, 3, NULL, 13),
(1214, 12, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '490.7,701.4 489.8,715 523.6,717.2 524.5,703.7', 1, 0, 3, NULL, 13),
(1215, 13, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '491.6,687.8 490.7,701.5 524.5,703.7 525.4,690.1', 1, 0, 3, NULL, 13),
(1216, 15, 450.00, 5, 0, '0', 0, '00', 0, '0', 0, '0', 0, '0', 0, '510.7,654.9 527.6,656 525.4,690.1 508.5,689', 1, 0, 3, NULL, 14),
(1217, 16, 450.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '527.6,656.1 544.5,657.2 542.3,691.2 525.4,690.1', 1, 0, 3, NULL, 14),
(1218, 18, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '525.4,690.1 524.5,703.7 558.3,706 559.2,692.4', 1, 0, 3, NULL, 13),
(1219, 19, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '524.5,703.7 523.6,717.3 557.4,719.5 558.3,705.9', 1, 0, 3, NULL, 13),
(1220, 20, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '523.6,717.4 522.7,731 556.5,733.2 557.4,719.6', 1, 0, 3, NULL, 13),
(1221, 21, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '522.7,730.9 521.8,744.5 555.6,746.7 556.5,733.2', 1, 0, 3, NULL, 13),
(1222, 22, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '521.8,744.6 520.9,758.2 554.7,760.4 555.6,746.9', 1, 0, 3, NULL, 13),
(1223, 23, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '520.9,758.1 520.1,771.7 553.9,774 554.7,760.4', 1, 0, 3, NULL, 13),
(1224, 24, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '520.1,771.8 519.2,785.4 553,787.7 553.9,774.1', 1, 0, 3, NULL, 13),
(1225, 25, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '519.2,785.4 518.3,799 552.1,801.2 553,787.6', 1, 0, 3, NULL, 13),
(1226, 26, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '518.3,799 517.4,812.6 551.2,814.8 552.1,801.3', 1, 0, 3, NULL, 13),
(1227, 27, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '517.4,812.5 516.5,826.1 550.3,828.4 551.2,814.8', 1, 0, 3, NULL, 13),
(1228, 28, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '516.5,826.2 515.6,839.8 549.4,842.1 550.3,828.5', 1, 0, 3, NULL, 13),
(1229, 29, 360.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '515.6,839.8 514.7,853.4 548.5,855.6 549.4,842', 1, 0, 3, NULL, 13),
(1230, 30, 439.48, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M529.3,888.7l9.8,0.5c0,0,7-1.2,7.7-8.4l1.7-25.2l-17-1L529.3,888.7z', 1, 1, 3, NULL, 13),
(1231, 31, 450.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '512.4,887.5 529.3,888.7 531.6,854.6 514.7,853.4', 1, 0, 3, NULL, 13),
(1232, 32, 450.00, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '495.6,886.3 512.5,887.5 514.7,853.4 497.8,852.2', 1, 0, 3, NULL, 13),
(1233, 1, 439.48, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M609.1,727.4l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L609.1,727.4z', 1, 1, 3, NULL, 13),
(1234, 2, 450.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '610.7,695 609.9,711.2 577.5,709.6 578.3,693.4', 1, 0, 3, NULL, 13),
(1235, 3, 450.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '579.1,677.3 578.3,693.4 610.7,695 611.5,678.9', 1, 0, 3, NULL, 13),
(1236, 4, 439.48, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M612.3,662.6l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L612.3,662.6z', 1, 1, 3, NULL, 14),
(1237, 5, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '612.3,662.6 610.7,695 623.6,695.7 625.3,663.3', 1, 0, 3, NULL, 14),
(1238, 6, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '625.2,663.3 623.6,695.7 636.6,696.3 638.2,663.9', 1, 0, 3, NULL, 14),
(1239, 7, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '638.2,663.9 636.6,696.3 649.5,697 651.2,664.6', 1, 0, 3, NULL, 14),
(1240, 8, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '651.2,664.6 649.6,697 662.5,697.6 664.1,665.2', 1, 0, 3, NULL, 14),
(1241, 9, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '664.1,665.2 662.5,697.6 675.4,698.3 677,665.9', 1, 0, 3, NULL, 14),
(1242, 10, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '677.1,665.9 675.5,698.3 688.4,698.9 690,666.5', 1, 0, 3, NULL, 14),
(1243, 11, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '690,666.5 688.4,698.9 701.3,699.6 703,667.2', 1, 0, 3, NULL, 14),
(1244, 12, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '703,667.2 701.4,699.6 714.3,700.2 715.9,667.8', 1, 0, 3, NULL, 14),
(1245, 13, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '715.9,667.8 714.3,700.2 727.2,700.9 728.8,668.5', 1, 0, 3, NULL, 14),
(1246, 14, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '728.9,668.5 727.3,700.9 740.2,701.5 741.8,669.1', 1, 0, 3, NULL, 14),
(1247, 15, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '741.8,669.1 740.2,701.5 753.1,702.1 754.7,669.8', 1, 0, 3, NULL, 14),
(1248, 16, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '754.8,669.8 753.2,702.2 766.1,702.8 767.7,670.4', 1, 0, 3, NULL, 14),
(1249, 17, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '767.7,670.4 766.1,702.8 779.1,703.4 780.7,671.1', 1, 0, 3, NULL, 14),
(1250, 18, 439.48, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M780.7,671.1l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L780.7,671.1z', 1, 1, 3, NULL, 14),
(1251, 19, 450.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '779.9,687.3 779,703.5 811.4,705.1 812.2,688.9', 1, 0, 3, NULL, 14),
(1252, 20, 450.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '779,703.5 778.2,719.8 810.6,721.3 811.4,705.1', 1, 0, 3, NULL, 14),
(1253, 21, 439.48, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M778.2,719.8l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L778.2,719.8z', 1, 1, 3, NULL, 14),
(1254, 22, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '766.1,702.8 764.5,735.2 777.4,735.8 779,703.5', 1, 0, 3, NULL, 16),
(1255, 23, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '753.1,702.2 751.5,734.5 764.5,735.2 766.1,702.8', 1, 0, 3, NULL, 16),
(1256, 24, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '740.1,701.5 738.6,733.9 751.5,734.5 753.1,702.2', 1, 0, 3, NULL, 16),
(1257, 25, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '727.2,700.9 725.6,733.2 738.6,733.9 740.2,701.5', 1, 0, 3, NULL, 16),
(1258, 26, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '714.2,700.2 712.6,732.6 725.6,733.2 727.2,700.9', 1, 0, 3, NULL, 16),
(1259, 27, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '701.3,699.6 699.7,731.9 712.6,732.6 714.3,700.2', 1, 0, 3, NULL, 16),
(1260, 34, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '610.7,695 609.1,727.4 622,728 623.6,695.7', 1, 0, 3, NULL, 16),
(1261, 33, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '623.6,695.7 622,728 634.9,728.7 636.5,696.3', 1, 0, 3, NULL, 16),
(1262, 32, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '636.6,696.3 635,728.7 647.9,729.3 649.5,697', 1, 0, 3, NULL, 16),
(1263, 31, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '649.5,697 647.9,729.3 660.8,730 662.5,697.6', 1, 0, 3, NULL, 16),
(1264, 30, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '662.4,697.6 660.8,730 673.8,730.6 675.4,698.3', 1, 0, 3, NULL, 16),
(1265, 29, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '675.4,698.3 673.8,730.6 686.7,731.3 688.4,698.9', 1, 0, 3, NULL, 16),
(1266, 28, 360.00, 6, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '688.4,698.9 686.8,731.3 699.7,731.9 701.3,699.6', 1, 0, 3, NULL, 16),
(1267, 1, 439.48, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M602.6,897.9l-23.1-1.2l-2.1-0.1c0,0-6.7-0.6-6.9-7.6l0.4-8.9l32.4,1.6L602.6,897.9z', 1, 1, 3, NULL, 13),
(1268, 2, 450.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '604.2,865.6 603.4,881.7 571,880.1 571.8,863.9', 1, 0, 3, NULL, 13),
(1269, 3, 450.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '572.6,847.8 571.8,863.9 604.2,865.6 605,849.4', 1, 0, 3, NULL, 13),
(1270, 4, 439.48, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M605.8,833.2l-22.7-1.1c0,0-8.5-0.8-10.4,9.2l-0.1,6.6l32.4,1.6L605.8,833.2z', 1, 1, 3, NULL, 13),
(1271, 5, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '605.8,833.2 604.2,865.6 617.2,866.2 618.8,833.8', 1, 0, 3, NULL, 13),
(1272, 6, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '618.8,833.8 617.2,866.2 630.1,866.9 631.7,834.5', 1, 0, 3, NULL, 13),
(1273, 7, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '631.7,834.5 630.1,866.9 643.1,867.5 644.7,835.1', 1, 0, 3, NULL, 13),
(1274, 8, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '644.7,835.1 643.1,867.5 656,868.1 657.6,835.8', 1, 0, 3, NULL, 13),
(1275, 9, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '657.6,835.8 656,868.1 668.9,868.8 670.6,836.4', 1, 0, 3, NULL, 13),
(1276, 10, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '670.6,836.4 669,868.8 681.9,869.4 683.5,837.1', 1, 0, 3, NULL, 13),
(1277, 12, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '696.5,837.7 694.9,870.1 707.8,870.7 709.4,838.4', 1, 0, 3, NULL, 13),
(1278, 13, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '709.4,838.4 707.8,870.7 720.7,871.4 722.4,839', 1, 0, 3, NULL, 13),
(1279, 14, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '722.4,839 720.8,871.4 733.7,872 735.3,839.7', 1, 0, 3, NULL, 13),
(1280, 15, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '735.3,839.7 733.7,872 746.6,872.7 748.3,840.3', 1, 0, 3, NULL, 13),
(1281, 16, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '748.3,840.3 746.7,872.7 759.6,873.3 761.2,841', 1, 0, 3, NULL, 13),
(1282, 17, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '761.3,841 759.7,873.3 772.6,874 774.2,841.6', 1, 0, 3, NULL, 13),
(1283, 18, 439.48, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M774.2,841.6l20.8,1.1c0,0,12.4,1.1,10.8,16.2v0.5l-32.4-1.6L774.2,841.6z', 1, 1, 3, NULL, 14),
(1284, 19, 450.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '773.4,857.8 772.6,874 804.9,875.6 805.7,859.4', 1, 0, 3, NULL, 14),
(1285, 20, 450.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '772.6,874 771.7,890.3 804.1,891.8 804.9,875.6', 1, 0, 3, NULL, 14),
(1286, 21, 439.48, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M771.7,890.3l-0.8,16.1l25.2,1.2c0,0,6.9-0.1,7.5-7.2l0.4-8.6L771.7,890.3z', 1, 1, 3, NULL, 14),
(1287, 22, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '759.6,873.3 758,905.7 770.9,906.4 772.6,874', 1, 0, 3, NULL, 13),
(1288, 23, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '746.7,872.7 745.1,905.1 758,905.7 759.6,873.3', 1, 0, 3, NULL, 13),
(1289, 24, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '733.7,872 732.1,904.4 745,905.1 746.6,872.7', 1, 0, 3, NULL, 13),
(1290, 25, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '720.7,871.4 719.2,903.8 732.1,904.4 733.7,872', 1, 0, 3, NULL, 13),
(1291, 26, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '707.8,870.7 706.2,903.1 719.1,903.8 720.7,871.4', 1, 0, 3, NULL, 13),
(1292, 27, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '694.8,870.1 693.2,902.5 706.2,903.1 707.8,870.7', 1, 0, 3, NULL, 13),
(1293, 28, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '681.9,869.5 680.3,901.8 693.2,902.5 694.8,870.1', 1, 0, 3, NULL, 13),
(1294, 29, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '668.9,868.8 667.3,901.2 680.3,901.8 681.9,869.5', 1, 0, 3, NULL, 13),
(1295, 30, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '656,868.2 654.4,900.5 667.3,901.2 668.9,868.8', 1, 0, 3, NULL, 13),
(1296, 31, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '643,867.5 641.4,899.9 654.4,900.5 656,868.2', 1, 0, 3, NULL, 13),
(1297, 32, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '630.1,866.9 628.5,899.2 641.4,899.9 643,867.5', 1, 0, 3, NULL, 13),
(1298, 33, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '617.1,866.2 615.5,898.6 628.4,899.2 630.1,866.9', 1, 0, 3, NULL, 13),
(1299, 34, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '604.2,865.6 602.6,897.9 615.5,898.6 617.1,866.2', 1, 0, 3, NULL, 13),
(1300, 14, 401.71, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M491.6,687.8l1.1-18.9c0,0,2.5-15.1,18-14l-2.2,34L491.6,687.8z', 1, 1, 3, NULL, 14),
(1301, 17, 432.62, 5, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M544.5,657.2l4.8,0.3c0,0,11.5-1.2,11.3,13.9l-1.4,20.9l-16.9-1.1L544.5,657.2z', 1, 1, 3, NULL, 14),
(1302, 1, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '936.9,881.2 949.8,881.9 948.2,914.8 935.3,914.1', 1, 0, 3, NULL, 14),
(1303, 2, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '938.4,848.4 951.4,849.1 949.8,881.9 936.9,881.2', 1, 0, 3, NULL, 14),
(1304, 3, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '951.4,849.1 964.4,849.8 962.8,882.6 949.8,881.9', 1, 0, 3, NULL, 14),
(1305, 4, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '964.3,849.8 977.3,850.6 975.7,883.4 962.8,882.7', 1, 0, 3, NULL, 14),
(1306, 5, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '977.3,850.5 990.3,851.3 988.7,884.1 975.8,883.4', 1, 0, 3, NULL, 14),
(1307, 6, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '990.2,851.1 1003.2,851.8 1001.6,884.6 988.7,883.9', 1, 0, 3, NULL, 14),
(1308, 7, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1003.2,851.8 1016.2,852.5 1014.6,885.4 1001.7,884.7', 1, 0, 3, NULL, 14),
(1309, 8, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1016.1,852.5 1029.1,853.2 1027.5,886 1014.6,885.3', 1, 0, 3, NULL, 14),
(1310, 9, 439.48, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1029.1,853.4l24.8,1.1c0,0,6.8-0.5,7.5,7.3l-0.5,9.3l-32.6-1.7L1029.1,853.4z', 1, 1, 3, NULL, 14),
(1311, 10, 450.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1028.3,869.4 1027.5,886 1060.1,887.6 1060.9,871.1', 1, 0, 3, NULL, 13),
(1312, 11, 450.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1027.5,886c0,0.2-0.8,16.3-0.8,16.3l32.6,1.5l0.8-16.3L1027.5,886z', 1, 1, 3, NULL, 13),
(1313, 12, 439.48, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1025.9,918.9l24.8,1.4c0,0,8-0.5,8-8l0.6-8.4l-32.6-1.5L1025.9,918.9z', 1, 1, 3, NULL, 13),
(1314, 13, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1014.6,885.3 1027.5,886 1025.9,918.9 1013,918.2', 1, 0, 3, NULL, 13),
(1315, 14, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1001.7,884.6 1014.6,885.4 1013,918.2 1000.1,917.5', 1, 0, 3, NULL, 13),
(1316, 15, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '988.7,883.9 1001.6,884.6 1000.1,917.5 987.1,916.8', 1, 0, 3, NULL, 13),
(1317, 16, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '975.8,883.4 988.7,884.1 987.1,916.9 974.2,916.2', 1, 0, 3, NULL, 13),
(1318, 17, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '962.8,882.7 975.7,883.4 974.2,916.2 961.2,915.5', 1, 0, 3, NULL, 13),
(1319, 18, 360.00, 12, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '949.8,881.9 962.8,882.6 961.2,915.5 948.3,914.8', 1, 0, 3, NULL, 13),
(1320, 1, 439.48, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1345.8,749.1l-0.5,9.8c0,0-0.3,6.7,9.4,7.1l22.6,0.8l0.7-16L1345.8,749.1z', 1, 1, 3, NULL, 14),
(1321, 2, 450.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1346.6,733 1345.8,749.1 1378.1,750.8 1378.9,734', 1, 0, 3, NULL, 13),
(1322, 3, 450.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1379.7,718 1347.4,716.4 1346.6,733 1378.9,734', 1, 0, 3, NULL, 13),
(1323, 5, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1380.5,701.2 1378.9,734 1391.9,734.6 1393.5,701.9', 1, 0, 3, NULL, 14),
(1324, 6, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1393.4,701.9 1391.9,734.6 1404.9,735.2 1406.4,702.5', 1, 0, 3, NULL, 14),
(1325, 7, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1406.5,702.5 1404.9,735.2 1417.9,735.9 1419.5,703.1', 1, 0, 3, NULL, 14),
(1326, 8, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1419.4,703.1 1417.9,735.9 1430.9,736.5 1432.4,703.8', 1, 0, 3, NULL, 14),
(1327, 9, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1432.4,703.7 1430.8,736.5 1443.8,737.1 1445.4,704.3', 1, 0, 3, NULL, 14),
(1328, 10, 360.41, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1445.4,704.3 1458.4,703.7 1456.6,738 1443.8,737.1', 1, 0, 3, NULL, 14),
(1329, 11, 362.15, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1458.4,703.7 1470.9,703.1 1469.3,738.5 1456.6,738', 1, 0, 3, NULL, 14),
(1330, 12, 360.31, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1470.9,703.1 1483.1,702.8 1481.1,739.5 1469.3,738.5', 1, 0, 3, NULL, 14),
(1331, 13, 602.97, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1483.1,702.8h5.3c0,0,9.7-1.2,14.5,8.5c0,0,4.2,6.8,0.5,16.2l-8.1,12.6l-14.2-0.6L1483.1,702.8z', 1, 1, 3, NULL, 14),
(1332, 14, 455.79, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1470.1,738.6l11,0.9l14.2,0.6l-16.3,26.6c0,0-2.3,6.1-10.6,4.9L1470.1,738.6z', 1, 1, 3, NULL, 13),
(1333, 15, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1456.9,738 1470.1,738.6 1468.3,771.6 1455.4,770.6', 1, 0, 3, NULL, 13),
(1334, 16, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1442.4,769.8 1455.4,770.6 1456.9,738 1443.8,737.1', 1, 0, 3, NULL, 13),
(1335, 21, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1378.9,734 1377.4,766.8 1390.4,767.4 1391.9,734.6', 1, 0, 3, NULL, 13),
(1336, 20, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1391.9,734.6 1390.4,767.4 1403.4,768 1404.9,735.3', 1, 0, 3, NULL, 13),
(1337, 19, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1404.9,735.3 1403.4,768 1416.4,768.6 1418,735.9', 1, 0, 3, NULL, 13),
(1338, 18, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1418,735.9 1416.4,768.6 1429.4,769.2 1431,736.5', 1, 0, 3, NULL, 13),
(1339, 17, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1430.9,736.4 1429.4,769.2 1442.4,769.8 1443.9,737.1', 1, 0, 3, NULL, 13),
(1340, 1, 439.48, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1078.1,905.4l-0.5,9.8c0,0-0.3,6.7,9.4,7.1l22.6,0.8l0.7-16L1078.1,905.4z', 1, 1, 3, NULL, 13),
(1341, 2, 450.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1078.8,889.3 1078.1,905.4 1110.3,907.1 1111.1,890.3', 1, 0, 3, NULL, 13),
(1342, 3, 450.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1111.8,874.2 1079.7,872.6 1078.8,889.3 1111.1,890.3', 1, 0, 3, NULL, 13),
(1343, 4, 439.48, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1112.6,857.4l-25.1-0.9c0,0-6.5-0.6-7.6,8l-0.2,8l32.2,1.7L1112.6,857.4z', 1, 1, 3, NULL, 14),
(1344, 5, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1112.6,857.4 1111.1,890.3 1124.1,890.9 1125.6,858', 1, 0, 3, NULL, 13),
(1345, 6, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1125.5,858.1 1124,890.9 1137,891.5 1138.5,858.7', 1, 0, 3, NULL, 13),
(1346, 7, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1138.6,858.7 1137.1,891.5 1150,892.1 1151.6,859.3', 1, 0, 3, NULL, 13),
(1347, 8, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1151.5,859.3 1150,892.2 1162.9,892.8 1164.5,860', 1, 0, 3, NULL, 13),
(1348, 9, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1164.5,860 1162.9,892.8 1175.9,893.4 1177.4,860.6', 1, 0, 3, NULL, 13),
(1349, 10, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1177.4,860.6 1175.8,893.4 1188.8,894.1 1190.3,861.2', 1, 0, 3, NULL, 13),
(1350, 11, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1190.3,861.2 1188.8,894.1 1201.8,894.7 1203.3,861.8', 1, 0, 3, NULL, 13),
(1351, 12, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1203.2,861.9 1201.7,894.7 1214.6,895.3 1216.2,862.5', 1, 0, 3, NULL, 13),
(1352, 13, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1216.2,862.5 1214.7,895.4 1227.7,896 1229.3,863.2', 1, 0, 3, NULL, 13),
(1353, 14, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1229.2,863.2 1227.7,896 1240.8,896.6 1242.3,863.8', 1, 0, 3, NULL, 13),
(1354, 15, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1242.3,863.8 1240.8,896.6 1253.9,897.2 1255.4,864.4', 1, 0, 3, NULL, 13),
(1355, 16, 374.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1255.5,864.4 1267.3,865.1 1265.6,902.3 1253.7,901.8', 1, 0, 3, NULL, 13),
(1356, 17, 374.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1267.3,865.1 1279.1,865.8 1277.4,903 1265.6,902.3', 1, 0, 3, NULL, 13),
(1357, 18, 432.27, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1279.1,865.8l24.5,1.3c0,0,7.5-0.8,8.5,7.1c0,0,0.5,3-3.8,9l-30-1.5L1279.1,865.8z', 1, 1, 3, NULL, 14),
(1358, 19, 440.85, 11, 0, '0', 0, '0', 0, '0', 0, '00', 0, '0', 0, '1278.4,881.7 1277.4,903 1295.6,904 1308.4,883.2', 1, 0, 3, NULL, 13),
(1359, 20, 380.98, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1253.1,913.4 1289,915.2 1295.6,904 1253.7,901.8', 1, 0, 3, NULL, 13),
(1360, 21, 447.81, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1252.3,930.1l21.1,1.2c0,0,4.9,1,8-4.3l7.5-11.8l-35.8-1.8L1252.3,930.1z', 1, 1, 3, NULL, 13),
(1361, 22, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1240.8,896.6 1239.3,929.5 1252.3,930.1 1253.9,897.3', 1, 0, 3, NULL, 13),
(1362, 23, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1227.7,896 1226.2,928.9 1239.2,929.5 1240.8,896.6', 1, 0, 3, NULL, 13),
(1363, 24, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1214.7,895.4 1213.2,928.2 1226.2,928.8 1227.8,896', 1, 0, 3, NULL, 13),
(1364, 25, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1201.8,894.7 1200.3,927.5 1213.2,928.1 1214.7,895.3', 1, 0, 3, NULL, 13),
(1365, 26, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1188.8,894.1 1187.3,926.9 1200.2,927.5 1201.8,894.7', 1, 0, 3, NULL, 13),
(1366, 27, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1175.8,893.5 1174.3,926.3 1187.3,926.9 1188.8,894.1', 1, 0, 3, NULL, 13),
(1367, 28, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1162.9,892.8 1161.4,925.6 1174.4,926.3 1175.9,893.4', 1, 0, 3, NULL, 13),
(1368, 29, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1150.1,892.1 1148.5,925 1161.5,925.6 1163,892.8', 1, 0, 3, NULL, 13),
(1369, 30, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1137,891.5 1135.5,924.4 1148.5,925 1150,892.2', 1, 0, 3, NULL, 13),
(1370, 31, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1124,890.9 1122.5,923.8 1135.5,924.4 1137,891.5', 1, 0, 3, NULL, 13),
(1371, 32, 360.00, 11, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1111.1,890.3 1109.6,923.1 1122.5,923.7 1124.1,890.9', 1, 0, 3, NULL, 13),
(1372, 6, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1298.9,934.5 1327,951.8 1333.8,940.7 1305.8,923.4', 1, 0, 3, NULL, 13),
(1373, 7, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1305.8,923.5 1333.8,940.8 1340.7,929.7 1312.6,912.4', 1, 0, 3, NULL, 13),
(1374, 8, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1312.6,912.3 1340.7,929.6 1347.5,918.5 1319.5,901.2', 1, 0, 3, NULL, 13),
(1375, 9, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1319.5,901.3 1347.5,918.6 1354.4,907.5 1326.3,890.2', 1, 0, 3, NULL, 13),
(1376, 10, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1326.4,890.2 1354.4,907.5 1361.3,896.3 1333.3,878.9', 1, 0, 3, NULL, 13),
(1377, 11, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1333.3,879 1361.3,896.3 1368.2,885.1 1340.2,867.8', 1, 0, 3, NULL, 13),
(1378, 12, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1340.2,867.8 1368.3,885.1 1375.2,873.9 1347.1,856.5', 1, 0, 3, NULL, 14),
(1379, 13, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1347.1,856.6 1375.2,873.9 1382.1,862.7 1354,845.4', 1, 0, 3, NULL, 14),
(1380, 14, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1354,845.4 1382.1,862.7 1388.9,851.6 1360.9,834.2', 1, 0, 3, NULL, 14),
(1381, 15, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1360.9,834.3 1388.9,851.6 1395.8,840.4 1367.8,823.1', 1, 0, 3, NULL, 14),
(1382, 16, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1367.8,823.1 1395.9,840.4 1402.7,829.2 1374.7,811.9', 1, 0, 3, NULL, 14),
(1383, 23, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1395.9,840.4 1424,857.7 1430.8,846.6 1402.8,829.2', 1, 0, 3, NULL, 13),
(1384, 24, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1389,851.6 1417,868.9 1423.9,857.8 1395.9,840.4', 1, 0, 3, NULL, 13),
(1385, 25, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1382.1,862.7 1410.2,880.1 1417,868.9 1389,851.6', 1, 0, 3, NULL, 13),
(1386, 26, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1375.2,873.9 1403.3,891.2 1410.2,880 1382.1,862.6', 1, 0, 3, NULL, 13),
(1387, 27, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1368.3,885.1 1396.4,902.4 1403.3,891.2 1375.2,873.9', 1, 0, 3, NULL, 13),
(1388, 28, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1361.4,896.3 1389.4,913.7 1396.3,902.5 1368.3,885.1', 1, 0, 3, NULL, 13),
(1389, 29, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1354.5,907.5 1382.5,924.8 1389.4,913.6 1361.4,896.3', 1, 0, 3, NULL, 13),
(1390, 30, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1347.6,918.5 1375.6,935.8 1382.5,924.7 1354.4,907.4', 1, 0, 3, NULL, 13),
(1391, 31, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1340.7,929.7 1368.8,947 1375.6,935.9 1347.6,918.5', 1, 0, 3, NULL, 13),
(1392, 32, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1333.9,940.8 1361.9,958.1 1368.8,947 1340.7,929.7', 1, 0, 3, NULL, 13),
(1393, 33, 360.00, 66, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '1327,951.8 1355.1,969.1 1361.9,958.1 1333.9,940.7', 1, 0, 3, NULL, 13),
(1394, 11, 360.00, 13, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, '683.5,837.1 681.9,869.4 694.9,870.1 696.5,837.7', 1, 0, 3, NULL, 13),
(1395, 4, 360.00, 9, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1380.5,701.2l-25.2-0.9c0,0-6.5-0.6-7.6,8l-0.2,8l32.2,1.7L1380.5,701.2z', 1, 1, 3, NULL, 14),
(1396, 1, 719.88, 135, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1621.6,502.7l-2.9,43.1c0,0-1.8,7.4,3.5,9.1c0,0,4.7,2.4,7.7-4.8l16.2-34.2L1621.6,502.7z', 1, 1, 1, NULL, 13),
(1397, 19, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1737,247.2c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1737,247.2z', 1, 1, 1, NULL, 13),
(1398, 8, 360.00, 136, 0, '0', 0, '0', 0, '0', 0, '0', 0, '0', 0, 'M1741.4,163c0,0.5-5.6,11.7-5.6,11.7l29.3,14l5.6-11.7L1741.4,163z', 1, 1, 1, NULL, 14);

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
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
`id` int(11) NOT NULL,
  `paisnombre` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `idPais` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `paisnombre`, `idPais`) VALUES
(1, 'Australia', NULL),
(2, 'Austria', NULL),
(3, 'Azerbaiyán', NULL),
(4, 'Anguilla', NULL),
(5, 'Argentina', NULL),
(6, 'Armenia', NULL),
(7, 'Bielorrusia', NULL),
(8, 'Belice', NULL),
(9, 'Bélgica', NULL),
(10, 'Bermudas', NULL),
(11, 'Bulgaria', NULL),
(12, 'Brasil', NULL),
(13, 'Reino Unido', NULL),
(14, 'Hungría', NULL),
(15, 'Vietnam', NULL),
(16, 'Haiti', NULL),
(17, 'Guadalupe', NULL),
(18, 'Alemania', NULL),
(19, 'Países Bajos, Holanda', NULL),
(20, 'Grecia', NULL),
(21, 'Georgia', NULL),
(22, 'Dinamarca', NULL),
(23, 'Egipto', NULL),
(24, 'Israel', NULL),
(25, 'India', NULL),
(26, 'Irán', NULL),
(27, 'Irlanda', NULL),
(28, 'España', NULL),
(29, 'Italia', NULL),
(30, 'Kazajstán', NULL),
(31, 'Camerún', NULL),
(32, 'Canadá', NULL),
(33, 'Chipre', NULL),
(34, 'Kirguistán', NULL),
(35, 'China', NULL),
(36, 'Costa Rica', NULL),
(37, 'Kuwait', NULL),
(38, 'Letonia', NULL),
(39, 'Libia', NULL),
(40, 'Lituania', NULL),
(41, 'Luxemburgo', NULL),
(42, 'México', NULL),
(43, 'Moldavia', NULL),
(44, 'Mónaco', NULL),
(45, 'Nueva Zelanda', NULL),
(46, 'Noruega', NULL),
(47, 'Polonia', NULL),
(48, 'Portugal', NULL),
(49, 'Reunión', NULL),
(50, 'Rusia', NULL),
(51, 'El Salvador', NULL),
(52, 'Eslovaquia', NULL),
(53, 'Eslovenia', NULL),
(54, 'Surinam', NULL),
(55, 'Estados Unidos', NULL),
(56, 'Tadjikistan', NULL),
(57, 'Turkmenistan', NULL),
(58, 'Islas Turcas y Caicos', NULL),
(59, 'Turquía', NULL),
(60, 'Uganda', NULL),
(61, 'Uzbekistán', NULL),
(62, 'Ucrania', NULL),
(63, 'Finlandia', NULL),
(64, 'Francia', NULL),
(65, 'República Checa', NULL),
(66, 'Suiza', NULL),
(67, 'Suecia', NULL),
(68, 'Estonia', NULL),
(69, 'Corea del Sur', NULL),
(70, 'Japón', NULL),
(71, 'Croacia', NULL),
(72, 'Rumanía', NULL),
(73, 'Hong Kong', NULL),
(74, 'Indonesia', NULL),
(75, 'Jordania', NULL),
(76, 'Malasia', NULL),
(77, 'Singapur', NULL),
(78, 'Taiwan', NULL),
(79, 'Bosnia y Herzegovina', NULL),
(80, 'Bahamas', NULL),
(81, 'Chile', NULL),
(82, 'Colombia', NULL),
(83, 'Islandia', NULL),
(84, 'Corea del Norte', NULL),
(85, 'Macedonia', NULL),
(86, 'Malta', NULL),
(87, 'Pakistán', NULL),
(88, 'Papúa-Nueva Guinea', NULL),
(89, 'Perú', NULL),
(90, 'Filipinas', NULL),
(91, 'Arabia Saudita', NULL),
(92, 'Tailandia', NULL),
(93, 'Emiratos árabes Unidos', NULL),
(94, 'Groenlandia', NULL),
(95, 'Venezuela', NULL),
(96, 'Zimbabwe', NULL),
(97, 'Kenia', NULL),
(98, 'Algeria', NULL),
(99, 'Líbano', NULL),
(100, 'Botsuana', NULL),
(101, 'Tanzania', NULL),
(102, 'Namibia', NULL),
(103, 'Ecuador', NULL),
(104, 'Marruecos', NULL),
(105, 'Ghana', NULL),
(106, 'Siria', NULL),
(107, 'Nepal', NULL),
(108, 'Mauritania', NULL),
(109, 'Seychelles', NULL),
(110, 'Paraguay', NULL),
(111, 'Uruguay', NULL),
(112, 'Congo (Brazzaville)', NULL),
(113, 'Cuba', NULL),
(114, 'Albania', NULL),
(115, 'Nigeria', NULL),
(116, 'Zambia', NULL),
(117, 'Mozambique', NULL),
(119, 'Angola', NULL),
(120, 'Sri Lanka', NULL),
(121, 'Etiopía', NULL),
(122, 'Túnez', NULL),
(123, 'Bolivia', NULL),
(124, 'Panamá', NULL),
(125, 'Malawi', NULL),
(126, 'Liechtenstein', NULL),
(127, 'Bahrein', NULL),
(128, 'Barbados', NULL),
(130, 'Chad', NULL),
(131, 'Man, Isla de', NULL),
(132, 'Jamaica', NULL),
(133, 'Malí', NULL),
(134, 'Madagascar', NULL),
(135, 'Senegal', NULL),
(136, 'Togo', NULL),
(137, 'Honduras', NULL),
(138, 'República Dominicana', NULL),
(139, 'Mongolia', NULL),
(140, 'Irak', NULL),
(141, 'Sudáfrica', NULL),
(142, 'Aruba', NULL),
(143, 'Gibraltar', NULL),
(144, 'Afganistán', NULL),
(145, 'Andorra', NULL),
(147, 'Antigua y Barbuda', NULL),
(149, 'Bangladesh', NULL),
(151, 'Benín', NULL),
(152, 'Bután', NULL),
(154, 'Islas Virgenes Británicas', NULL),
(155, 'Brunéi', NULL),
(156, 'Burkina Faso', NULL),
(157, 'Burundi', NULL),
(158, 'Camboya', NULL),
(159, 'Cabo Verde', NULL),
(164, 'Comores', NULL),
(165, 'Congo (Kinshasa)', NULL),
(166, 'Cook, Islas', NULL),
(168, 'Costa de Marfil', NULL),
(169, 'Djibouti, Yibuti', NULL),
(171, 'Timor Oriental', NULL),
(172, 'Guinea Ecuatorial', NULL),
(173, 'Eritrea', NULL),
(175, 'Feroe, Islas', NULL),
(176, 'Fiyi', NULL),
(178, 'Polinesia Francesa', NULL),
(180, 'Gabón', NULL),
(181, 'Gambia', NULL),
(184, 'Granada', NULL),
(185, 'Guatemala', NULL),
(186, 'Guernsey', NULL),
(187, 'Guinea', NULL),
(188, 'Guinea-Bissau', NULL),
(189, 'Guyana', NULL),
(193, 'Jersey', NULL),
(195, 'Kiribati', NULL),
(196, 'Laos', NULL),
(197, 'Lesotho', NULL),
(198, 'Liberia', NULL),
(200, 'Maldivas', NULL),
(201, 'Martinica', NULL),
(202, 'Mauricio', NULL),
(205, 'Myanmar', NULL),
(206, 'Nauru', NULL),
(207, 'Antillas Holandesas', NULL),
(208, 'Nueva Caledonia', NULL),
(209, 'Nicaragua', NULL),
(210, 'Níger', NULL),
(212, 'Norfolk Island', NULL),
(213, 'Omán', NULL),
(215, 'Isla Pitcairn', NULL),
(216, 'Qatar', NULL),
(217, 'Ruanda', NULL),
(218, 'Santa Elena', NULL),
(219, 'San Cristobal y Nevis', NULL),
(220, 'Santa Lucía', NULL),
(221, 'San Pedro y Miquelón', NULL),
(222, 'San Vincente y Granadinas', NULL),
(223, 'Samoa', NULL),
(224, 'San Marino', NULL),
(225, 'San Tomé y Príncipe', NULL),
(226, 'Serbia y Montenegro', NULL),
(227, 'Sierra Leona', NULL),
(228, 'Islas Salomón', NULL),
(229, 'Somalia', NULL),
(232, 'Sudán', NULL),
(234, 'Swazilandia', NULL),
(235, 'Tokelau', NULL),
(236, 'Tonga', NULL),
(237, 'Trinidad y Tobago', NULL),
(239, 'Tuvalu', NULL),
(240, 'Vanuatu', NULL),
(241, 'Wallis y Futuna', NULL),
(242, 'Sáhara Occidental', NULL),
(243, 'Yemen', NULL),
(246, 'Puerto Rico', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

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
(78, 12, 22, 1, 1, 1, 1, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planpago`
--

INSERT INTO `planpago` (`id`, `fechaPago`, `cuota`, `mora`, `idVenta`, `estado`) VALUES
(1, '2017-08-03', 460.00, 0, 1, 'd'),
(2, '2017-09-03', 460.00, 0, 1, 'd'),
(3, '2017-10-03', 460.00, 0, 1, 'd'),
(4, '2017-11-03', 460.00, 0, 1, 'd'),
(5, '2017-12-03', 460.00, 0, 1, 'd'),
(6, '2018-01-03', 460.00, 0, 1, 'd'),
(7, '2018-02-03', 460.00, 0, 1, 'd'),
(8, '2018-03-03', 460.00, 0, 1, 'd'),
(9, '2018-04-03', 460.00, 0, 1, 'd'),
(10, '2018-05-03', 460.00, 0, 1, 'd'),
(11, '2018-06-03', 460.00, 0, 1, 'd'),
(12, '2018-07-03', 460.00, 0, 1, 'd'),
(13, '2018-08-03', 460.00, 0, 1, 'd'),
(14, '2018-09-03', 460.00, 0, 1, 'd'),
(15, '2018-10-03', 460.00, 0, 1, 'd'),
(16, '2018-11-03', 460.00, 0, 1, 'd'),
(17, '2018-12-03', 460.00, 0, 1, 'd'),
(18, '2019-01-03', 460.00, 0, 1, 'd'),
(19, '2019-02-03', 460.00, 0, 1, 'd'),
(20, '2019-03-03', 460.00, 0, 1, 'd'),
(21, '2019-04-03', 460.00, 0, 1, 'd'),
(22, '2019-05-03', 460.00, 0, 1, 'd'),
(23, '2019-06-03', 460.00, 0, 1, 'd'),
(24, '2019-07-03', 460.00, 0, 1, 'd'),
(25, '2019-08-03', 460.00, 0, 1, 'd'),
(26, '2019-09-03', 460.00, 0, 1, 'd'),
(27, '2019-10-03', 460.00, 0, 1, 'd'),
(28, '2019-11-03', 460.00, 0, 1, 'd'),
(29, '2019-12-03', 460.00, 0, 1, 'd'),
(30, '2020-01-03', 460.00, 0, 1, 'd'),
(31, '2020-02-03', 460.00, 0, 1, 'd'),
(32, '2020-03-03', 460.00, 0, 1, 'd'),
(33, '2020-04-03', 460.00, 0, 1, 'd'),
(34, '2020-05-03', 460.00, 0, 1, 'd'),
(35, '2020-06-03', 460.00, 0, 1, 'd'),
(36, '2020-07-03', 460.00, 0, 1, 'd'),
(37, '2020-08-03', 460.00, 0, 1, 'd'),
(38, '2020-09-03', 460.00, 0, 1, 'd'),
(39, '2020-10-03', 460.00, 0, 1, 'd'),
(40, '2020-11-03', 460.00, 0, 1, 'd'),
(41, '2020-12-03', 460.00, 0, 1, 'd'),
(42, '2021-01-03', 460.00, 0, 1, 'd'),
(43, '2021-02-03', 460.00, 0, 1, 'd'),
(44, '2021-03-03', 460.00, 0, 1, 'd'),
(45, '2021-04-03', 460.00, 0, 1, 'd'),
(46, '2021-05-03', 460.00, 0, 1, 'd'),
(47, '2021-06-03', 460.00, 0, 1, 'd'),
(48, '2021-07-03', 460.00, 0, 1, 'd'),
(49, '2021-08-03', 460.00, 0, 1, 'd'),
(50, '2021-09-03', 460.00, 0, 1, 'd'),
(51, '2021-10-03', 460.00, 0, 1, 'd'),
(52, '2021-11-03', 460.00, 0, 1, 'd'),
(53, '2021-12-03', 460.00, 0, 1, 'd'),
(54, '2022-01-03', 460.00, 0, 1, 'd'),
(55, '2022-02-03', 460.00, 0, 1, 'd'),
(56, '2022-03-03', 460.00, 0, 1, 'd'),
(57, '2022-04-03', 460.00, 0, 1, 'd'),
(58, '2022-05-03', 460.00, 0, 1, 'd'),
(59, '2022-06-03', 460.00, 0, 1, 'd'),
(60, '2022-07-03', 410.96, 0, 1, 'd'),
(61, '2017-08-07', 10900.00, 0, 2, 'd'),
(62, '2017-09-07', 10900.00, 0, 2, 'd'),
(63, '2017-10-07', 10898.20, 0, 2, 'd');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `porcentajedevolucionreserva`
--

INSERT INTO `porcentajedevolucionreserva` (`id`, `porcentaje`, `fecha`, `idProyecto`, `deleted_at`) VALUES
(6, 80.0, '2017-06-29 23:41:56', 1, NULL),
(7, 80.0, '2017-07-01 11:33:19', 3, NULL);

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
(34, 14, 12.50, '2017-06-29 23:54:13', NULL),
(35, 13, 11.60, '2017-06-29 23:54:24', NULL),
(36, 15, 12.50, '2017-07-01 11:30:39', NULL),
(37, 16, 11.60, '2017-07-01 11:30:47', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prereserva`
--

INSERT INTO `prereserva` (`id`, `fecha`, `idEmpleado`, `idCliente`, `deleted_at`) VALUES
(3, '2017-07-03 19:58:43', 18, 3, NULL),
(4, '2017-07-03 22:24:45', 41, 4, NULL),
(5, '2017-07-03 23:49:33', 62, 5, NULL),
(6, '2017-07-03 23:50:12', 62, 6, NULL),
(7, '2017-07-04 02:20:18', 4, 3, NULL),
(8, '2017-07-05 01:54:29', 63, 7, NULL),
(9, '2017-07-05 18:54:53', 40, 8, NULL);

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
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id`, `fecha`, `idEmpleado`, `idCliente`, `montoTotal`, `estado`, `deleted_at`) VALUES
(1, '2017-07-04 00:11:30', 4, 3, 696.00, '', NULL),
(2, '2017-07-04 00:11:33', 4, 6, 696.00, '', NULL),
(3, '2017-07-04 00:15:12', 4, 6, 700.00, '', NULL);

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
(1, 6.96, 6.87, '2017-06-12 23:54:00', NULL);

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
  `tipo` char(4) NOT NULL DEFAULT 'i',
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccionreserva`
--

INSERT INTO `transaccionreserva` (`id`, `idDetalleReserva`, `idBanco`, `idCuenta`, `nroDocumento`, `monto`, `tipo`, `deleted_at`) VALUES
(1, 1, 3, 5, 2147483647, 696.00, 'i', NULL),
(2, 2, 3, 4, 5556, 696.00, 'i', NULL);

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
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(4, 'admin', '$2y$10$UDSMXOK.Uhjwn4NOd94UZuC2OQAaxdr1Yn0lSLhBeiQPri1y83ewG', '', 1, NULL),
(18, 'admin2', '$2y$10$tiTpLjIDcUxZNE1FxxZouuuwu3LRlAoba5kItCiJVtPQ4YO0EElse', '', 1, NULL),
(19, 'yacqueline', '$2y$10$JO5NEHBpB6YSAj3hbciLsOnPFUGP2TmnzzXfGxSB4WJCYL0TTKz3e', '', 7, NULL),
(20, 'stephanie', '$2y$10$NCtkSpdRCiVfHgElDDPW4uh4juQpUUwah45fsVqJkzewcFhj4IsBG', '', 7, NULL),
(21, 'ruddy', '$2y$10$nG2xceIo0X1IY4aTqth2me/XfDbZdRj8LXJZv2TC7ype0FoWfB7eS', '', 7, NULL),
(22, 'goprobit@gmail.com', '$2y$10$zzVqJrBSY5AvUlqC4nUDf.BCwWueDevrCxDx1daBlsxb5ZN9K5Eqq', '', 8, NULL),
(23, 'atlanboli@hotmail.com', '$2y$10$l.yaJ8nspgMiPTwQJrymP.ktsmH/xiVoVWBoDkccbP6QMXgt/Esfi', '', 11, NULL),
(24, '1109611', '$2y$10$4TKL9uySZFXmHbhCdf.mBepwA1qhbFfsVQR42CxbTMjicBSX3Soli', '', 10, NULL),
(25, '4713528', '$2y$10$UMhMFdGXGWvxe7rq4AxAVulIWUhJ8EQVaJilq0jGUYZ.zAgc8K8Me', '', 10, NULL),
(26, '3451951', '$2y$10$FePs8si7m72PDB8vKn0DDuTKyd97VZp.CUaK3Aw6kaZ5ei24xp5ku', '', 9, NULL),
(27, 'ivan3872282 ', '$2y$10$SLOIQajEhagDTuDxGDt3kupU/DEEwOgRa0n0zTBETbe1Agl1edAae', '', 9, NULL),
(28, 'modelca.logistica@hotmail.com', '$2y$10$4.fCcVN.2YqCXoq.qZ7bQu1TNBOLBV6mWDN2lrpfJpEB.oSVEpb7a', '', 9, NULL),
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
(52, '4687951', '$2y$10$iC/70ZQt4dpoe27kL/QNaO9DazVXQ2af94CDzMyYcrKA.rmTmlh5a', '', 10, NULL),
(53, '3216572', '$2y$10$5mZucTo7a1uenwlPtuT4X.aki3YiuCXUXjFA7CP6fwk6Eq9mfnRH.', '', 10, NULL),
(54, '7676697', '$2y$10$UJtBEmW1Z1f4bsFm6jxYqeFo/VZpLl8fWYTNd4Nc.1MJvp6sWLob2', '', 10, NULL),
(55, '4629183', '$2y$10$n4MC8ZbCE/BDjGYcK.E2HexzgQfx1mCuwXI0xDw8SD6cXkOCD1eq6', '', 10, NULL),
(56, '6850481', '$2y$10$qg/Dc3h0pM7D8aqxxzrv9..3lEYqX46d5bvFox1hkuFz3OhtdQrx6', '', 10, NULL),
(57, '4566146', '$2y$10$.l8oj8DuG8iR5h/GrJCeiOSoKK3vxm2JRFgaO6ZKXs4f6HP8IYm3y', '', 10, NULL),
(58, '2473651', '$2y$10$M9WYB7iU74DxdjNUgTewVOnh/8frEM8JWKfuUU4H4EUpabF29r1zG', '', 10, NULL),
(59, '3271572', '$2y$10$GgJjmoc3LF7EnHGC.CBiSeYu53ha8oyZ27TWJriZ8/5ViQhorm3oK', '', 10, NULL),
(60, '666', '$2y$10$CKVa4mLovwlMdbyrsRUk.OIhKtl6T6UV6LDIcO4OzEMnQRPug0m96', '', 10, NULL),
(61, '4735646', '$2y$10$jwdAZGcXG/BsGXZLV6QXE.f562l.ceyY53.qxa0JhvFMDj0.QETb6', '', 10, NULL),
(62, '5841985', '$2y$10$mWKqtSWyi8Ni7Z.OS/MnFezPbzB68NKVolzth4uxHQhbRk6T49pMW', '', 10, NULL),
(63, '9741981', '$2y$10$2Vttley23scvH0uLTnx8fOzdgwBOov0pOG/gSf4bGh88p7CSfLHSa', '', 10, NULL),
(64, '2992489', '$2y$10$LMvVpYH5vNWnMjIDlNVinu7mwNmgrxoBPv549p5JNP9tOCEJW5Rly', '', 10, NULL),
(65, '4640902', '$2y$10$t7KVAjMe1ata86gqrmDxke04/Z/aClAP6yCXG55.8eDuFO5dAhH5y', '', 10, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE IF NOT EXISTS `vendedor` (
`id_vendedor` int(11) NOT NULL,
  `idEmpleadoPadre` int(11) DEFAULT NULL,
  `idEmpleadoHijo` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

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
(40, 23, 25, NULL),
(41, 25, 64, NULL),
(42, 25, 65, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
`id` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cuotaInicial` decimal(9,2) DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  `idEmpleado` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idTipoCambio` int(11) DEFAULT NULL,
  `idLote` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `cuotaInicial`, `precio`, `estado`, `idEmpleado`, `idCliente`, `idTipoCambio`, `idLote`) VALUES
(1, '2017-07-04 00:26:50', 1514.00, 29064.96, 'c', 4, 3, 1, 678),
(2, '2017-07-04 00:29:59', 3633.00, 36331.20, 'c', 4, 3, 1, 1055),
(3, '2017-07-04 02:15:14', 30881.52, 36331.20, 'p', 4, 3, 1, 1052);

--
-- Disparadores `venta`
--
DELIMITER //
CREATE TRIGGER `Actualizar_Lote_Venta` AFTER INSERT ON `venta`
 FOR EACH ROW UPDATE lote 

SET lote.estado=3

WHERE lote.id=new.idLote
//
DELIMITER ;

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `categorialote`
--
ALTER TABLE `categorialote`
 ADD PRIMARY KEY (`id`), ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`id`), ADD KEY `idEmpleado` (`idEmpleado`), ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `codigovendedor`
--
ALTER TABLE `codigovendedor`
 ADD PRIMARY KEY (`id`), ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
 ADD PRIMARY KEY (`id`), ADD KEY `idBanco` (`idBanco`);

--
-- Indices de la tabla `cuotaminima`
--
ALTER TABLE `cuotaminima`
 ADD PRIMARY KEY (`id`), ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `descuentoventa`
--
ALTER TABLE `descuentoventa`
 ADD PRIMARY KEY (`id`), ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `detalleprereserva`
--
ALTER TABLE `detalleprereserva`
 ADD PRIMARY KEY (`id`), ADD KEY `idLote` (`idLote`), ADD KEY `idPreReserva` (`idPreReserva`);

--
-- Indices de la tabla `detallereserva`
--
ALTER TABLE `detallereserva`
 ADD PRIMARY KEY (`id`), ADD KEY `idLote` (`idLote`), ADD KEY `idReserva` (`idReserva`);

--
-- Indices de la tabla `devolucionreserva`
--
ALTER TABLE `devolucionreserva`
 ADD PRIMARY KEY (`id`), ADD KEY `idDetalleReserva` (`idDetalleReserva`), ADD KEY `idPorcentajeDevolucionReserva` (`idPorcentajeDevolucionReserva`), ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
 ADD PRIMARY KEY (`id`), ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadopais`
--
ALTER TABLE `estadopais`
 ADD PRIMARY KEY (`id`), ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `experiencia_laboral`
--
ALTER TABLE `experiencia_laboral`
 ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
 ADD PRIMARY KEY (`id`), ADD KEY `idCategoriaLote` (`idCategoriaLote`), ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `meses`
--
ALTER TABLE `meses`
 ADD PRIMARY KEY (`id`), ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `objeto`
--
ALTER TABLE `objeto`
 ADD PRIMARY KEY (`id`), ADD KEY `idModulo` (`idModulo`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
 ADD PRIMARY KEY (`id`), ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
 ADD PRIMARY KEY (`id`), ADD KEY `idPais` (`idPais`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfilobjeto`
--
ALTER TABLE `perfilobjeto`
 ADD PRIMARY KEY (`id`), ADD KEY `idObjeto` (`idObjeto`), ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `planpago`
--
ALTER TABLE `planpago`
 ADD PRIMARY KEY (`id`), ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `porcentajedevolucionreserva`
--
ALTER TABLE `porcentajedevolucionreserva`
 ADD PRIMARY KEY (`id`), ADD KEY `idProyecto` (`idProyecto`);

--
-- Indices de la tabla `preciocategoria`
--
ALTER TABLE `preciocategoria`
 ADD PRIMARY KEY (`id`), ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `prereserva`
--
ALTER TABLE `prereserva`
 ADD PRIMARY KEY (`id`), ADD KEY `idEmpleado` (`idEmpleado`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `idEmpleado` (`idEmpleado`), ADD KEY `idVentaNueva` (`idVentaNueva`), ADD KEY `idVentaActual` (`idVentaActual`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
 ADD PRIMARY KEY (`id`), ADD KEY `idEmpleado` (`idEmpleado`), ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `sesionventa`
--
ALTER TABLE `sesionventa`
 ADD PRIMARY KEY (`id`), ADD KEY `idEmpleado` (`idEmpleado`), ADD KEY `idVentaNueva` (`idVentaNueva`), ADD KEY `idVentaActual` (`idVentaActual`);

--
-- Indices de la tabla `tipocambio`
--
ALTER TABLE `tipocambio`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transaccionpago`
--
ALTER TABLE `transaccionpago`
 ADD PRIMARY KEY (`id`), ADD KEY `idPago` (`idPago`), ADD KEY `idBanco` (`idBanco`), ADD KEY `idCuenta` (`idCuenta`);

--
-- Indices de la tabla `transaccionreserva`
--
ALTER TABLE `transaccionreserva`
 ADD PRIMARY KEY (`id`), ADD KEY `idDetalleReserva` (`idDetalleReserva`), ADD KEY `idBanco` (`idBanco`), ADD KEY `idCuenta` (`idCuenta`);

--
-- Indices de la tabla `transaccionventa`
--
ALTER TABLE `transaccionventa`
 ADD PRIMARY KEY (`id`), ADD KEY `idVenta` (`idVenta`), ADD KEY `idBanco` (`idBanco`), ADD KEY `idCuenta` (`idCuenta`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`idEmpleado`), ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
 ADD PRIMARY KEY (`id_vendedor`), ADD KEY `idEmpleadoPadre` (`idEmpleadoPadre`), ADD KEY `idEmpleadoHijo` (`idEmpleadoHijo`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`id`), ADD KEY `idEmpleado` (`idEmpleado`), ADD KEY `idCliente` (`idCliente`), ADD KEY `idLote` (`idLote`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `categorialote`
--
ALTER TABLE `categorialote`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `codigovendedor`
--
ALTER TABLE `codigovendedor`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `cuotaminima`
--
ALTER TABLE `cuotaminima`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `descuentoventa`
--
ALTER TABLE `descuentoventa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `detalleprereserva`
--
ALTER TABLE `detalleprereserva`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `detallereserva`
--
ALTER TABLE `detallereserva`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `devolucionreserva`
--
ALTER TABLE `devolucionreserva`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;
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
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1399;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT de la tabla `planpago`
--
ALTER TABLE `planpago`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT de la tabla `porcentajedevolucionreserva`
--
ALTER TABLE `porcentajedevolucionreserva`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `preciocategoria`
--
ALTER TABLE `preciocategoria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `prereserva`
--
ALTER TABLE `prereserva`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `transaccionventa`
--
ALTER TABLE `transaccionventa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

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
-- Filtros para la tabla `cuentabanco`
--
ALTER TABLE `cuentabanco`
ADD CONSTRAINT `cuentabanco_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`);

--
-- Filtros para la tabla `cuotaminima`
--
ALTER TABLE `cuotaminima`
ADD CONSTRAINT `cuotaminima_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `descuentoventa`
--
ALTER TABLE `descuentoventa`
ADD CONSTRAINT `descuentoventa_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`);

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
