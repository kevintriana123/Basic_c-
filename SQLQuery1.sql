-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.34-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bdnotasgrupo8
DROP DATABASE IF EXISTS bdnotasgrupo8;
CREATE DATABASE bdnotasgrupo8; /*!40100 DEFAULT CHARACTER SET latin1 */;
USE bdnotasgrupo8;

-- Volcando estructura para tabla bdnotasgrupo8.estudiantes
DROP TABLE IF EXISTS estudiantes;
CREATE TABLE estudiantes (
  id_estudiante int NOT NULL IDENTITY,
  doc_estudiante int NOT NULL,
  nombre_estudiante varchar(50) NOT NULL,
  PRIMARY KEY (id_estudiante)
)  ;

-- Volcando datos para la tabla bdnotasgrupo8.estudiantes: ~4 rows (aproximadamente)
DELETE FROM estudiantes;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO estudiantes (doc_estudiante, nombre_estudiante) VALUES
	(746261, 'Juan Carlos Cifuentes'),
	(748446, 'Kevin Fabian Triana'),
	(874222, 'William Hernandez'),
	(1023588, 'Yeni Paola bernal');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;

-- Volcando estructura para tabla bdnotasgrupo8.materias
DROP TABLE IF EXISTS materias;
CREATE TABLE materias (
  id_materia int NOT NULL IDENTITY,
  cod_materia int NOT NULL,
  nombre_materia varchar(50) NOT NULL,
  PRIMARY KEY (id_materia)
)  ;

-- Volcando datos para la tabla bdnotasgrupo8.materias: ~3 rows (aproximadamente)
DELETE FROM materias;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO materias (cod_materia, nombre_materia) VALUES
	(4100, 'Redes'),
	(4200, 'Programacion'),
	(3320, 'Calculo');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;

-- Volcando estructura para tabla bdnotasgrupo8.notas
DROP TABLE IF EXISTS notas;
CREATE TABLE notas (
  id_nota int NOT NULL IDENTITY,
  id_estudiante int NOT NULL,
  id_materia int NOT NULL,
  nota float DEFAULT '0',
  PRIMARY KEY (id_nota)
 ,
  CONSTRAINT FK_notas_estudiantes FOREIGN KEY (id_estudiante) REFERENCES estudiantes (id_estudiante) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT FK_notas_materias FOREIGN KEY (id_materia) REFERENCES materias (id_materia) ON DELETE NO ACTION ON UPDATE NO ACTION
)  ;

CREATE INDEX id_estudiante ON notas (id_estudiante);
CREATE INDEX id_materia ON notas (id_materia);

-- Volcando datos para la tabla bdnotasgrupo8.notas: ~2 rows (aproximadamente)
DELETE FROM notas;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO notas (id_estudiante, id_materia, nota) VALUES
	(1, 3, 4.5),
	(3, 2, 5);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
