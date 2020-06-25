-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.22-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para librerias
CREATE DATABASE IF NOT EXISTS `librerias` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `librerias`;

-- Volcando estructura para tabla librerias.autor
CREATE TABLE IF NOT EXISTS `autor` (
  `id` char(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `URL` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `fnac` date DEFAULT NULL,
  `fmue` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.autor: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` (`id`, `nombre`, `URL`, `pais`, `fnac`, `fmue`) VALUES
	('A0001', 'Cervantes', 'URL1', 'España', '1547-09-27', '1616-04-22'),
	('A0002', 'Shakespeare', 'URL2', 'Inglaterra', '1564-04-26', '1616-04-23'),
	('A0003', 'Pascal', 'URL3', 'Francia', '1623-06-19', '1662-08-19'),
	('A0004', 'Russel', 'URL4', 'Inglaterra', '1872-05-18', '1970-02-02'),
	('A0005', 'Gracian', 'URL5', 'España', '1601-01-08', '1658-12-06'),
	('A0006', 'Homero', 'URL6', 'Grecia', NULL, NULL);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;

-- Volcando estructura para tabla librerias.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `dni` char(5) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `ciudad` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.cliente: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`dni`, `nombre`, `ciudad`, `email`) VALUES
	('Cl001', 'Carmelo Cotón', 'Madrid', 'em11'),
	('Cl002', 'Casimiro Noveonada', 'Madrid', 'em12'),
	('Cl003', 'Lali Cuadora', 'Barcelona', 'em13'),
	('Cl004', 'Juanchi Chones', 'Barcelona', 'em14'),
	('Cl005', 'Aitor Menta', 'Cartagena', 'em15'),
	('Cl006', 'Armando Guerra', 'Cartagena', 'em16'),
	('Cl007', 'Helen Chufes', 'Cartagena', 'em17'),
	('Cl008', 'Luci Fer', 'Madrid', 'em18'),
	('Cl009', 'Zacarías Jhonson', 'Cartagena', 'em19'),
	('Cl010', 'Zote Williams', 'París', 'em20');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla librerias.datos_pedido
CREATE TABLE IF NOT EXISTS `datos_pedido` (
  `libro_id` char(5) NOT NULL,
  `pedido_id` char(5) NOT NULL,
  `cantidad` int(11) NOT NULL,
  KEY `FK_datos_pedido_libro` (`libro_id`),
  KEY `FK_datos_pedido_pedido` (`pedido_id`),
  CONSTRAINT `FK_datos_pedido_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`isbn`),
  CONSTRAINT `FK_datos_pedido_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.datos_pedido: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `datos_pedido` DISABLE KEYS */;
INSERT INTO `datos_pedido` (`libro_id`, `pedido_id`, `cantidad`) VALUES
	('L0001', 'P001', 1),
	('L0002', 'P001', 2),
	('L0003', 'P002', 1),
	('L0004', 'P003', 1),
	('L0005', 'P004', 1),
	('L0006', 'P005', 1),
	('L0007', 'P008', 2),
	('L0001', 'P009', 1),
	('L0007', 'P003', 1),
	('L0001', 'P010', 1);
/*!40000 ALTER TABLE `datos_pedido` ENABLE KEYS */;

-- Volcando estructura para tabla librerias.editorial
CREATE TABLE IF NOT EXISTS `editorial` (
  `id` char(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.editorial: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` (`id`, `nombre`, `email`, `pais`) VALUES
	('Ed001', 'Santillana', 'em1', 'España'),
	('Ed002', 'Edelvives', 'em2', 'España'),
	('Ed003', 'Larousse', 'em3', 'Francia'),
	('Ed004', 'Lefevre', 'em4', 'Francia'),
	('Ed005', 'Pinguin', 'em5', 'Inglaterra'),
	('Ed006', 'Oxford', 'em6', 'Ingalterra');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;

-- Volcando estructura para tabla librerias.existencias
CREATE TABLE IF NOT EXISTS `existencias` (
  `libro_id` char(5) NOT NULL,
  `tienda_id` char(5) NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`libro_id`,`tienda_id`),
  KEY `FK_existencias_tienda` (`tienda_id`),
  CONSTRAINT `FK__libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`isbn`),
  CONSTRAINT `FK_existencias_tienda` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.existencias: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `existencias` DISABLE KEYS */;
INSERT INTO `existencias` (`libro_id`, `tienda_id`, `cantidad`) VALUES
	('L0001', 'T0001', 4),
	('L0001', 'T0002', 2),
	('L0001', 'T0005', 1),
	('L0002', 'T0003', 1),
	('L0003', 'T0004', 1),
	('L0004', 'T0001', 1),
	('L0004', 'T0002', 2),
	('L0004', 'T0004', 3),
	('L0005', 'T0005', 10),
	('L0005', 'T0006', 4),
	('L0007', 'T0001', 3);
/*!40000 ALTER TABLE `existencias` ENABLE KEYS */;

-- Volcando estructura para tabla librerias.libro
CREATE TABLE IF NOT EXISTS `libro` (
  `isbn` char(50) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `anio` char(4) DEFAULT NULL,
  `autor_id` char(5) NOT NULL,
  `editorial_id` char(5) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `FK_libro_autor` (`autor_id`),
  KEY `FK_libro_editorial` (`editorial_id`),
  CONSTRAINT `FK_libro_autor` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`),
  CONSTRAINT `FK_libro_editorial` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.libro: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` (`isbn`, `titulo`, `anio`, `autor_id`, `editorial_id`, `precio`) VALUES
	('L0001', 'El Quijote', '2000', 'A0001', 'Ed002', 100),
	('L0002', 'El Héroe', '2000', 'A0005', 'Ed003', 20),
	('L0003', 'Pérsiles y Segismunda', '2005', 'A0001', 'Ed003', 56),
	('L0004', 'Pensées', '2005', 'A0003', 'Ed004', 18),
	('L0005', 'Hamlet', '2008', 'A0002', 'Ed006', 12),
	('L0006', 'Macbeth', '2011', 'A0002', 'Ed001', 15),
	('L0007', 'Principia Mathematica', '1915', 'A0004', 'Ed006', 78),
	('L0008', 'La Iliada', NULL, 'A0006', 'Ed005', 8);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;

-- Volcando estructura para tabla librerias.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` char(5) NOT NULL,
  `fecha` date NOT NULL,
  `entregado` char(2) NOT NULL DEFAULT 'NO',
  `cliente_id` char(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pedido_cliente` (`cliente_id`),
  CONSTRAINT `FK_pedido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.pedido: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id`, `fecha`, `entregado`, `cliente_id`) VALUES
	('P001', '2017-01-06', 'SI', 'Cl005'),
	('P002', '2017-02-06', 'SI', 'Cl006'),
	('P003', '2017-03-06', 'NO', 'Cl004'),
	('P004', '2017-04-06', 'SI', 'Cl003'),
	('P005', '2017-05-06', 'NO', 'Cl002'),
	('P006', '2017-06-06', 'SI', 'Cl001'),
	('P007', '2017-07-06', 'SI', 'Cl003'),
	('P008', '2017-08-06', 'NO', 'Cl001'),
	('P009', '2017-09-06', 'NO', 'Cl005'),
	('P010', '2017-09-19', 'NO', 'Cl003');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla librerias.tienda
CREATE TABLE IF NOT EXISTS `tienda` (
  `id` char(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla librerias.tienda: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` (`id`, `email`, `ciudad`, `nombre`) VALUES
	('T0001', 'em21', 'Madrid', 'La Moderna'),
	('T0002', 'em22', 'Madrid', 'La Vieja'),
	('T0003', 'em23', 'Barcelona', 'La de Arriba'),
	('T0004', 'em24', 'Barcelona', 'La de Abajo'),
	('T0005', 'em25', 'Cartagena', 'Efese'),
	('T0006', 'em26', 'Bilbao', 'La Ría');
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
