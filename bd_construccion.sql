-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_construccion
CREATE DATABASE IF NOT EXISTS `bd_construccion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_construccion`;

-- Volcando estructura para tabla bd_construccion.asignacion_empleados_obras
CREATE TABLE IF NOT EXISTS `asignacion_empleados_obras` (
  `id_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `id_obras` int(11) NOT NULL,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_obras` (`id_obras`),
  CONSTRAINT `asignacion_empleados_obras_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `registro` (`id_registro`),
  CONSTRAINT `asignacion_empleados_obras_ibfk_2` FOREIGN KEY (`id_obras`) REFERENCES `obras` (`id_obras`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.avances
CREATE TABLE IF NOT EXISTS `avances` (
  `id_avance` int(11) NOT NULL AUTO_INCREMENT,
  `id_obras` int(11) NOT NULL,
  `fecha_avance` date NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `eliminar` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id_avance`),
  KEY `id_obras` (`id_obras`),
  CONSTRAINT `avances_ibfk_1` FOREIGN KEY (`id_obras`) REFERENCES `obras` (`id_obras`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.gastos
CREATE TABLE IF NOT EXISTS `gastos` (
  `id_gastos` int(11) NOT NULL AUTO_INCREMENT,
  `id_obras` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `descripcion_gasto` varchar(100) NOT NULL,
  `fecha_gasto` date NOT NULL,
  `eliminar` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id_gastos`),
  KEY `id_obras` (`id_obras`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`id_obras`) REFERENCES `obras` (`id_obras`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.informes_empleados
CREATE TABLE IF NOT EXISTS `informes_empleados` (
  `id_informe` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `horas` time NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `id_obras` int(11) NOT NULL,
  `eliminar` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id_informe`),
  KEY `id_obras` (`id_obras`),
  CONSTRAINT `informes_empleados_ibfk_1` FOREIGN KEY (`id_obras`) REFERENCES `obras` (`id_obras`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.login
CREATE TABLE IF NOT EXISTS `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_registro` int(11) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `contraseña` varchar(60) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`id_login`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_registro`) REFERENCES `registro` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.materiales
CREATE TABLE IF NOT EXISTS `materiales` (
  `id_materiales` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `id_obras` int(11) NOT NULL,
  `eliminar` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id_materiales`),
  KEY `id_obras` (`id_obras`),
  CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`id_obras`) REFERENCES `obras` (`id_obras`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.obras
CREATE TABLE IF NOT EXISTS `obras` (
  `id_obras` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_obra` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(20) DEFAULT 'pendiente',
  `id_registro` int(11) NOT NULL,
  `eliminar` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id_obras`),
  KEY `id_registro` (`id_registro`),
  CONSTRAINT `obras_ibfk_1` FOREIGN KEY (`id_registro`) REFERENCES `registro` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.planos
CREATE TABLE IF NOT EXISTS `planos` (
  `id_planos` int(11) NOT NULL AUTO_INCREMENT,
  `id_obras` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `eliminar` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id_planos`),
  KEY `id_obras` (`id_obras`),
  CONSTRAINT `planos_ibfk_1` FOREIGN KEY (`id_obras`) REFERENCES `obras` (`id_obras`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bd_construccion.registro
CREATE TABLE IF NOT EXISTS `registro` (
  `id_registro` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo_electronico` varchar(60) NOT NULL,
  `contraseña` varchar(60) NOT NULL,
  `rol` varchar(30) NOT NULL DEFAULT 'empleado',
  `estado` varchar(30) NOT NULL DEFAULT 'sin',
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para disparador bd_construccion.after_registro_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER after_registro_insert
AFTER INSERT ON registro
FOR EACH ROW
BEGIN
    INSERT INTO Login (id_registro, correo, contraseña, rol, estado)
    VALUES (NEW.id_registro, NEW.correo_electronico, NEW.contraseña, NEW.rol, NEW.estado);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
INSERT INTO Registro (nombres, apellidos, correo_electronico, contraseña, rol)
VALUES ('Kevin', 'Barzola', 'arquitecto@gmail.com', '1', 'arquitecto');

INSERT INTO Registro (nombres, apellidos, correo_electronico, contraseña, rol)
VALUES ('Gabriel', 'Alvarado', 'empleado@gmail.com', '1', 'empleado');

INSERT INTO Registro (nombres, apellidos, correo_electronico, contraseña, rol)
VALUES ('Joel', 'Delgado', 'empleado2@gmail.com', '1', 'empleado');

INSERT INTO Registro (nombres, apellidos, correo_electronico, contraseña, rol)
VALUES ('Joel', 'Canales', 'empleado3@gmail.com', '1', 'empleado');

INSERT INTO Registro (nombres, apellidos, correo_electronico, contraseña, rol)
VALUES ('Gustavo', 'Castillo', 'empleado4@gmail.com', '1', 'empleado');