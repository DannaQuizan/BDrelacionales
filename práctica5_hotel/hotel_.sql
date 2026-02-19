-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2026 a las 16:13:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel}`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion`
--

CREATE TABLE `atencion` (
  `id_atencion` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nota` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `atencion`
--

INSERT INTO `atencion` (`id_atencion`, `id_reserva`, `id_empleado`, `fecha`, `nota`) VALUES
(1, 1, 3, '2026-07-06', 'tuve una pésima atención con este empleado, no sabia ni trapear un piso, entonces lo patie.'),
(2, 2, 4, '2026-11-20', 'buenas atención, se sabia muchas canciones de fuer     za     regida, un gran pa.'),
(3, 3, 2, '2026-02-20', 'Un buen servicio, no mas que no calentó bien los frijoles, no frijoleo, pero de ahí muy buena mushasha.'),
(4, 4, 5, '2026-07-09', 'Muy buen servicio.'),
(5, 5, 1, '2026-08-09', 'Muy agradable chica, mi único inconveniente es que no dejaba de hablar de Taylor Swift siendo yo Kanye West. ah, y también de su novia, siendo yo homofóbico . ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `email`, `telefono`, `fecha_registro`) VALUES
(1, 'Renata Soto Serrano', 'renata.soto24@cetis107.edu.mx', '66713462454', '2026-04-24'),
(2, 'Saúl Alejandro Tavizón Cárdenas', 'saul.tavizon24@cetis107.edu.mx', '6674324459', '2026-04-01'),
(3, 'Marcos Uribe Chávez', 'marcos.uribe24@cetis107.edu.mx', '6673257743', '2026-02-18'),
(4, 'Israel Osorio López', 'israel.osorio24@cetis107.edu.mx', '6675258211', '2026-08-27'),
(5, 'Francis Dennis Aceves Quizán', 'francis.acevez24@cetis107.edu.mx', '6673590666', '2026-12-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `id_hotel`, `nombre`, `puesto`, `email`) VALUES
(1, 1, 'Camila Anahy Beltrán Gastelum', 'Gerente regional', 'camila.beltrang24@cetis107.edu.mx'),
(2, 3, 'Abigail Cerda Serrano', 'Chef', 'abigail.cerda24@cetis107.edu.mx'),
(3, 2, 'Axel Rosales López', 'Limpieza', 'axel.rosales24@cetis107.edu.mx'),
(4, 1, 'Saul Alejandro Tavizón Cárdenas', 'Recursos humanos', 'saul.tavizon24@cetis107.edu.mx'),
(5, 3, 'Danna Sofía Carrillo Quizán', 'Director Gerente', 'danna.carrillo24@cetis107.edu.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitación`
--

CREATE TABLE `habitación` (
  `id_habitacion` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `precio_noche` double NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitación`
--

INSERT INTO `habitación` (`id_habitacion`, `id_hotel`, `numero`, `tipo`, `precio_noche`, `estado`) VALUES
(1, 1, 707, 'Deluxe', 1400.44, 'disponible'),
(2, 3, 420, 'doble', 800, 'ocupada'),
(3, 2, 261, 'sencilla', 620, 'disponible'),
(4, 1, 488, 'triple', 1005, 'disponible'),
(5, 3, 412, 'doble', 800, 'ocupada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nombre`, `ciudad`, `telefono`) VALUES
(1, 'Hotel Playamar', 'Mazatlán', '669 982 0833'),
(2, 'Hotel San Marcos', 'Culiacán Rosales', '667 752 0470'),
(3, 'Emporio Mazatlan', 'Mazatlán', '55 8526 6436');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` double NOT NULL,
  `metodo` varchar(100) NOT NULL,
  `referencias` varchar(300) NOT NULL,
  `estado_pago` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_reserva`, `fecha_pago`, `monto`, `metodo`, `referencias`, `estado_pago`) VALUES
(1, 1, '2026-02-21', 3600, 'Tarjeta', '132597', 'Aprobado'),
(2, 2, '2026-05-08', 5600, 'efectivo', '589675', 'Aprobado'),
(3, 3, '2026-05-02', 2700, 'tarjeta', '568953', 'Rechazada'),
(4, 4, '2026-04-10', 2000, 'tarjeta', '125875', 'aprobada'),
(5, 9, '2026-07-24', 2000, 'efectivo', '245185', 'rechazada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `num_huespedes` varchar(20) NOT NULL,
  `estado_reserva` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `id_cliente`, `id_habitacion`, `fecha_entrada`, `fecha_salida`, `num_huespedes`, `estado_reserva`, `fecha_creacion`) VALUES
(1, 2, 1, '2026-07-03', '2026-07-05', '2', 'Vigente', '2026-02-18'),
(2, 1, 2, '2026-11-02', '2026-11-09', '6', 'Vigente', '2026-02-18'),
(3, 5, 4, '2026-09-25', '2026-09-28', '3', 'Vigente', '2026-02-18'),
(4, 4, 5, '2026-03-10', '2026-02-13', '2', 'Vigente', '2026-02-18'),
(5, 3, 3, '2026-06-14', '2026-06-16', '1', 'Vigente', '2026-02-18'),
(6, 2, 4, '2026-04-03', '2026-04-05', '5', 'Vigente', '2026-02-18'),
(7, 1, 1, '2026-05-15', '2026-05-24', '2', 'Vigente', '2026-02-18'),
(8, 5, 5, '2026-02-20', '2026-02-22', '3', 'Vigente', '2026-02-18'),
(9, 3, 4, '2026-05-30', '2026-05-31', '2', 'Vigente', '2026-02-18'),
(10, 5, 2, '2026-02-19', '2026-02-22', '1', 'Vigente', '2026-02-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_servicio`
--

CREATE TABLE `reserva_servicio` (
  `id_reserva` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva_servicio`
--

INSERT INTO `reserva_servicio` (`id_reserva`, `id_servicio`, `cantidad`, `precio_unitario`) VALUES
(2, 3, 12, 9600),
(1, 1, 4, 2000),
(3, 4, 2, 1500),
(4, 2, 3, 1200),
(5, 5, 8, 3200),
(6, 3, 6, 4800),
(7, 1, 2, 1000),
(8, 4, 4, 3000),
(9, 2, 5, 2000),
(10, 5, 4, 1600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `precio_base` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `precio_base`) VALUES
(1, 'Servicio a la habitación', 500),
(2, 'Gimnasio ', 400),
(3, 'Servicio de translado', 800),
(4, 'Servicio de niñera', 650),
(5, 'Servicio de lavandería', 400);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD PRIMARY KEY (`id_atencion`),
  ADD KEY `id_reserva` (`id_reserva`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indices de la tabla `habitación`
--
ALTER TABLE `habitación`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `reserva_servicio`
--
ALTER TABLE `reserva_servicio`
  ADD KEY `id_reserva` (`id_reserva`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atencion`
--
ALTER TABLE `atencion`
  MODIFY `id_atencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `habitación`
--
ALTER TABLE `habitación`
  MODIFY `id_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD CONSTRAINT `atencion_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  ADD CONSTRAINT `atencion_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`);

--
-- Filtros para la tabla `habitación`
--
ALTER TABLE `habitación`
  ADD CONSTRAINT `habitación_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitación` (`id_habitacion`);

--
-- Filtros para la tabla `reserva_servicio`
--
ALTER TABLE `reserva_servicio`
  ADD CONSTRAINT `reserva_servicio_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  ADD CONSTRAINT `reserva_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
