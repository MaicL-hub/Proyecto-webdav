-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2023 a las 22:35:04
-- Versión del servidor: 11.1.0-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cocoteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos`
--

CREATE TABLE `carritos` (
  `id` bigint(20) NOT NULL,
  `fechaPedido` date DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `descuentos` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `impuestos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carritos`
--

INSERT INTO `carritos` (`id`, `fechaPedido`, `fechaEntrega`, `descuentos`, `subtotal`, `impuestos`) VALUES
(20, '2023-09-13', '2023-09-20', 0, 283, 59),
(21, '2023-09-13', '2023-09-20', 0, 649, 136),
(23, '2023-09-13', '2023-09-20', 0, 457, 96),
(28, '2023-10-23', '2023-10-30', 0, 283, 59),
(29, '2023-10-23', '2023-10-30', 0, 649, 136),
(33, '2023-10-23', '2023-10-30', 0, 649, 136);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` bigint(20) NOT NULL,
  `portada` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `editorial` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `precio` bigint(20) DEFAULT NULL,
  `paginas` int(6) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `fechaPubli` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `portada`, `titulo`, `autor`, `editorial`, `genero`, `precio`, `paginas`, `isbn`, `fechaPubli`) VALUES
(1, 'producto1.jpg', '9 Hábitos Japoneses: Que Cambiarán Tu Vida', 'Andrea Rodríguez', 'Audible', 'Educación financiera', 283, 81, '09798737425562', '2015-05-07'),
(2, 'producto2.jpg', 'Harry Potter y la piedra filosofal', 'J. K Rowling', 'Penguin Random House', 'Fantasía', 649, 264, '978-6073193894', '2013-05-11'),
(4, 'producto4.jpg', 'El camino de los reyes', 'Brandon Sanderson', 'Ediciones B México;', 'Fantasía', 695, 1200, '978-8466657662', '2013-05-24'),
(5, 'producto5.jpg', 'El Imperio Final', 'Brandon Sanderson', 'Penguin Random House', 'Fantasía', 457, 672, '978-8417347291', '2019-05-10'),
(9, 'rtfu', 'dtfjgh', 'jfgjhkk', 'sgdhfghj', 'gsdfhgfg', 7655, 76, 'gfhgjhkj', '2023-06-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) NOT NULL,
  `idUsuario` varchar(50) DEFAULT NULL,
  `fechaPedido` date DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `estadoPedido` varchar(50) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `costoEnvio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `idUsuario`, `fechaPedido`, `fechaEntrega`, `estadoPedido`, `total`, `costoEnvio`) VALUES
(48, '1', '2023-09-13', '2023-09-20', 'enviado', 457, 0),
(50, '1', '2023-10-23', '2023-10-30', 'enviado', 1390, 0),
(51, '9', '2023-10-23', '2023-10-30', 'enviado', 1947, 0),
(53, '1', '2023-09-13', '2023-09-20', 'enviado', 695, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `fNacimiento` date DEFAULT NULL,
  `infoPago` varchar(50) DEFAULT NULL,
  `administrador` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`, `direccion`, `telefono`, `fNacimiento`, `infoPago`, `administrador`) VALUES
(1, 'Ross', 'rsantana@ceti.mx', '1111', 'calle a', 3334784686, '1999-01-01', 'sdfg', 0),
(2, 'Maic', 'maic@gmail.com', '1111', 'Calle b', 3309984356, '2023-05-16', 'Tarjeta de credito', 1),
(3, 'Erick', 'erick@gmail.com', '3333', 'calle c', 3365986843, '1999-01-03', 'hred', 1),
(4, 'Jair', 'jair@gmail.com', '4444', 'calle d', 3375549865, '1999-01-04', 'hrtd', 1),
(5, 'Ivan', 'ivan@gmail.com', '5555', 'calle e', 3309348743, '1999-01-05', 'hdfs', 1),
(7, 'efde', 'edwef', 'edwfegr', 'dfvedg', 4567, '2023-05-18', 'defghjkl', 0),
(9, 'Jorge', 'jorge@gmail.com', 'abcd', 'Calle f', 3380782123, '1999-01-07', 'Tarjeta de credito', 0),
(13, 'toño', 'esgfdhgf', '1111', '1111', 23, '2023-06-18', 'tarjeta', 0),
(15, 'adrian', 'erhheehee', '1234', 'calle h', 8787878787, '2023-06-19', 'Tarjeta de credito', 0),
(17, 'pedro', 'correo', '1111', 'calle d', 1234, '2023-06-19', 'tarjeta', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritos`
--
ALTER TABLE `carritos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
