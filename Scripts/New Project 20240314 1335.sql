-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	8.0.32


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema academica
--

CREATE DATABASE IF NOT EXISTS academica;
USE academica;

--
-- Temporary table structure for view `vista_actividad_proyecto`
--
DROP TABLE IF EXISTS `vista_actividad_proyecto`;
DROP VIEW IF EXISTS `vista_actividad_proyecto`;
CREATE TABLE `vista_actividad_proyecto` (
  `vista_actividad_proyecto_id` int,
  `ap_nombre` varchar(255),
  `fases_id` int,
  `fase` varchar(80)
);

--
-- Temporary table structure for view `vista_fichas`
--
DROP TABLE IF EXISTS `vista_fichas`;
DROP VIEW IF EXISTS `vista_fichas`;
CREATE TABLE `vista_fichas` (
  `vista_fichas_id` int,
  `ficha_nombre` varchar(20),
  `ficha_inicio` varchar(10),
  `ficha_finalizacion` varchar(10),
  `programa_id` int,
  `programa_nombre` varchar(200),
  `programa_codigo` varchar(20)
);

--
-- Temporary table structure for view `vista_horario`
--
DROP TABLE IF EXISTS `vista_horario`;
DROP VIEW IF EXISTS `vista_horario`;
CREATE TABLE `vista_horario` (
  `vista_horario_id` int,
  `horario_dia` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES'),
  `horario_instructor` int,
  `instructor_numid` varchar(20),
  `instructor_nombres` varchar(60),
  `instructor_perfil` varchar(255),
  `horario_fecha_inicio` date,
  `horario_fecha_final` date,
  `horario_hora_inicio` varchar(12),
  `horario_hora_final` varchar(12),
  `horario_ficha` int,
  `ficha_nombre` varchar(20),
  `programa_nombre` varchar(200),
  `programa_codigo` varchar(20),
  `ap_nombre` varchar(255),
  `fase` varchar(80),
  `horario_bloque` enum('A','B','C','D'),
  `rap1` int,
  `rap2` int,
  `rap3` int,
  `rap4` int,
  `rap_codigo` varchar(30),
  `rap_nombre` varchar(255),
  `rap_horas_directas` int,
  `rap_horas_otras` int,
  `rap_conceptos` text,
  `competencia_nombre` varchar(255),
  `competencia_perfil` varchar(255)
);

--
-- Temporary table structure for view `vista_instructores`
--
DROP TABLE IF EXISTS `vista_instructores`;
DROP VIEW IF EXISTS `vista_instructores`;
CREATE TABLE `vista_instructores` (
  `vista_instructores_id` int,
  `instructor_numid` varchar(20),
  `instructor_nombres` varchar(60),
  `instructor_correo` varchar(80),
  `instructor_perfil` varchar(255),
  `profesion_id` int,
  `profesion_nombre` varchar(200),
  `postgrado_id` int,
  `postgrado` varchar(228)
);

--
-- Temporary table structure for view `vista_planeacion`
--
DROP TABLE IF EXISTS `vista_planeacion`;
DROP VIEW IF EXISTS `vista_planeacion`;
CREATE TABLE `vista_planeacion` (
  `vista_planeacion_id` int,
  `planeacion_programa` int,
  `programa_nombre` varchar(200),
  `planeacion_ap` int,
  `ap_nombre` varchar(255),
  `fase` varchar(80),
  `competencia_nombre` varchar(255),
  `planeacion_rap` int,
  `rap_nombre` varchar(255),
  `planeacion_aa` varchar(255)
);

--
-- Temporary table structure for view `vista_planeacion_completa`
--
DROP TABLE IF EXISTS `vista_planeacion_completa`;
DROP VIEW IF EXISTS `vista_planeacion_completa`;
CREATE TABLE `vista_planeacion_completa` (
  `vista_planeacion_completa_id` int,
  `planeacion_programa` int,
  `programa_codigo` varchar(20),
  `programa_nombre` varchar(200),
  `planeacion_ap` int,
  `ap_nombre` varchar(255),
  `fase` varchar(80),
  `competencia_nombre` varchar(255),
  `competencia_perfil` varchar(255),
  `planeacion_rap` int,
  `rap_codigo` varchar(30),
  `rap_nombre` varchar(255),
  `rap_horas_directas` int,
  `rap_horas_otras` int,
  `rap_conceptos` text,
  `planeacion_aa` varchar(255)
);

--
-- Temporary table structure for view `vista_programacion`
--
DROP TABLE IF EXISTS `vista_programacion`;
DROP VIEW IF EXISTS `vista_programacion`;
CREATE TABLE `vista_programacion` (
  `vista_programacion_id` int,
  `programa_nombre` varchar(200),
  `prog_ficha` int,
  `ficha_nombre` varchar(20),
  `fase` varchar(80),
  `ap_nombre` varchar(255),
  `competencia_nombre` varchar(255),
  `rap_nombre` varchar(255),
  `planeacion_aa` varchar(255),
  `prog_instructor` int,
  `instructor_nombres` varchar(60),
  `prog_estado` enum('CALIFICADO','PENDIENTE','EN EJECUCION','SIN CALIFICAR'),
  `prog_planeacion` int
);

--
-- Temporary table structure for view `vista_programacion_completa`
--
DROP TABLE IF EXISTS `vista_programacion_completa`;
DROP VIEW IF EXISTS `vista_programacion_completa`;
CREATE TABLE `vista_programacion_completa` (
  `vista_programacion_completa_id` int,
  `programa_nombre` varchar(200),
  `prog_ficha` int,
  `ficha_nombre` varchar(20),
  `fase` varchar(80),
  `ap_nombre` varchar(255),
  `competencia_nombre` varchar(255),
  `planeacion_rap` int,
  `rap_nombre` varchar(255),
  `rap_horas_directas` int,
  `planeacion_aa` varchar(255),
  `prog_instructor` int,
  `instructor_nombres` varchar(60),
  `prog_estado` enum('CALIFICADO','PENDIENTE','EN EJECUCION','SIN CALIFICAR'),
  `prog_planeacion` int
);

--
-- Temporary table structure for view `vista_rap`
--
DROP TABLE IF EXISTS `vista_rap`;
DROP VIEW IF EXISTS `vista_rap`;
CREATE TABLE `vista_rap` (
  `vista_rap_id` int,
  `rap_codigo` varchar(30),
  `rap_nombre` varchar(255),
  `rap_horas_directas` int,
  `rap_horas_otras` int,
  `rap_conceptos` text,
  `rap_competencia` int,
  `competencia_nombre` varchar(255),
  `competencia_perfil` varchar(255)
);

--
-- Definition of table `actividad_proyecto`
--

DROP TABLE IF EXISTS `actividad_proyecto`;
CREATE TABLE `actividad_proyecto` (
  `actividad_proyecto_id` int NOT NULL AUTO_INCREMENT,
  `ap_nombre` varchar(255) NOT NULL,
  `ap_fase` int NOT NULL,
  PRIMARY KEY (`actividad_proyecto_id`),
  UNIQUE KEY `ap_nombre` (`ap_nombre`),
  KEY `ap_fase` (`ap_fase`),
  CONSTRAINT `actividad_proyecto_ibfk_1` FOREIGN KEY (`ap_fase`) REFERENCES `fases` (`fases_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `actividad_proyecto`
--

/*!40000 ALTER TABLE `actividad_proyecto` DISABLE KEYS */;
INSERT INTO `actividad_proyecto` (`actividad_proyecto_id`,`ap_nombre`,`ap_fase`) VALUES 
 (1,'DETERMINAR LAS ESPECIFICACIONES',2),
 (2,'ESPECIFICAR EL MODELO CONCEPTUAL',20),
 (3,'ESTABLECER METODOLOGÍA DE',1),
 (4,'ESTRUCTURAR LA PROPUESTA',3),
 (5,'CONSTRUIR EL PROTOTIPO DEL SISTEMA DE INFORMACION DE ACUERDO AL ANÁLISIS DE LAS CARACTERISTICAS FUNCIONALES Y DE CALIDAD ',2),
 (6,'CODIFICAR LOS MÓDULOS DEL SISTEMA DE INFORMACIÓN',3);
/*!40000 ALTER TABLE `actividad_proyecto` ENABLE KEYS */;


--
-- Definition of table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
CREATE TABLE `competencias` (
  `competencias_id` int NOT NULL AUTO_INCREMENT,
  `competencia_codigo` varchar(30) NOT NULL,
  `competencia_nombre` varchar(255) NOT NULL,
  `competencia_perfil` varchar(255) NOT NULL,
  PRIMARY KEY (`competencias_id`),
  UNIQUE KEY `competencia_nombre` (`competencia_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `competencias`
--

/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
INSERT INTO `competencias` (`competencias_id`,`competencia_codigo`,`competencia_nombre`,`competencia_perfil`) VALUES 
 (1,'220501092','Establecer requisitos de la solución de software de acuerdo con estándares y procedimiento técnicoxxx','Tecnólogo o profesional en sistemas y afines, con conocimientos en Ingeniería de requisitos, elaboración y aplicación de instrumentos para recolección de información, trabajo por procesos, estadística descriptiva y elaboración de informes. yyyy'),
 (2,'220501093','Evaluar requisitos de la solución de software de acuerdo con metodologías de análisis y estándares ','Tecnólogo o profesional en sistemas y afines, conocimientos en la fase de requisitos y análisis del ciclo de vida del software, UML, metodologías tradicionales y ágiles, modelos y disciplinas de calidad de software.  '),
 (3,'4546546','prueba','');
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;


--
-- Definition of table `fases`
--

DROP TABLE IF EXISTS `fases`;
CREATE TABLE `fases` (
  `fases_id` int NOT NULL AUTO_INCREMENT,
  `fase` varchar(80) NOT NULL,
  PRIMARY KEY (`fases_id`),
  UNIQUE KEY `fase` (`fase`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fases`
--

/*!40000 ALTER TABLE `fases` DISABLE KEYS */;
INSERT INTO `fases` (`fases_id`,`fase`) VALUES 
 (1,'Análisis'),
 (3,'Ejecución'),
 (4,'Evaluación'),
 (20,'Inducción'),
 (2,'Planeación');
/*!40000 ALTER TABLE `fases` ENABLE KEYS */;


--
-- Definition of table `fichas`
--

DROP TABLE IF EXISTS `fichas`;
CREATE TABLE `fichas` (
  `fichas_id` int NOT NULL AUTO_INCREMENT,
  `ficha_nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ficha_inicio` varchar(10) NOT NULL,
  `ficha_finalizacion` varchar(10) NOT NULL,
  `ficha_programa` int NOT NULL,
  PRIMARY KEY (`fichas_id`),
  UNIQUE KEY `ficha_nombre` (`ficha_nombre`),
  KEY `fichas_ibfk_1` (`ficha_programa`),
  CONSTRAINT `fichas_ibfk_1` FOREIGN KEY (`ficha_programa`) REFERENCES `programa` (`programa_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fichas`
--

/*!40000 ALTER TABLE `fichas` DISABLE KEYS */;
INSERT INTO `fichas` (`fichas_id`,`ficha_nombre`,`ficha_inicio`,`ficha_finalizacion`,`ficha_programa`) VALUES 
 (1,'2397050','06/02/2024','06/04/2025',6),
 (2,'2397051','08/02/2024','06/02/2025',1),
 (3,'656546546','24/25/2023','24/25/2024',7),
 (4,'4444444','20/05/2024','20/10/2025',5);
/*!40000 ALTER TABLE `fichas` ENABLE KEYS */;


--
-- Definition of table `horario`
--

DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `horario_id` int NOT NULL AUTO_INCREMENT,
  `horario_dia` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES') NOT NULL,
  `horario_instructor` int NOT NULL DEFAULT '1',
  `horario_fecha_inicio` date NOT NULL,
  `horario_fecha_final` date NOT NULL,
  `horario_hora_inicio` varchar(12) NOT NULL,
  `horario_hora_final` varchar(12) NOT NULL,
  `horario_ficha` int NOT NULL,
  `horario_bloque` enum('A','B','C','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rap1` int NOT NULL DEFAULT '1',
  `rap2` int NOT NULL DEFAULT '1',
  `rap3` int NOT NULL DEFAULT '1',
  `rap4` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`horario_id`),
  UNIQUE KEY `horario_dia` (`horario_dia`,`horario_fecha_inicio`,`horario_hora_inicio`,`horario_hora_final`,`horario_ficha`),
  KEY `horario_instructor` (`horario_instructor`),
  KEY `horario_ficha` (`horario_ficha`),
  KEY `rap1` (`rap1`),
  KEY `rap2` (`rap2`),
  KEY `rap3` (`rap3`),
  KEY `rap4` (`rap4`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`horario_instructor`) REFERENCES `instructores` (`instructores_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`horario_ficha`) REFERENCES `fichas` (`fichas_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`rap1`) REFERENCES `rap` (`rap_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `horario_ibfk_4` FOREIGN KEY (`rap2`) REFERENCES `rap` (`rap_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `horario_ibfk_5` FOREIGN KEY (`rap3`) REFERENCES `rap` (`rap_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `horario_ibfk_6` FOREIGN KEY (`rap4`) REFERENCES `rap` (`rap_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `horario`
--

/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` (`horario_id`,`horario_dia`,`horario_instructor`,`horario_fecha_inicio`,`horario_fecha_final`,`horario_hora_inicio`,`horario_hora_final`,`horario_ficha`,`horario_bloque`,`rap1`,`rap2`,`rap3`,`rap4`) VALUES 
 (1,'LUNES',1,'2024-02-05','2024-02-29','06','12',1,'A',1,2,2,2),
 (8,'MARTES',2,'2024-02-03','2024-02-29','06','12',1,'B',1,1,1,1);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;


--
-- Definition of table `horario_rap`
--

DROP TABLE IF EXISTS `horario_rap`;
CREATE TABLE `horario_rap` (
  `horario_rap_id` int NOT NULL AUTO_INCREMENT,
  `hr_horario` int NOT NULL,
  `hr_rap` int NOT NULL,
  PRIMARY KEY (`horario_rap_id`),
  UNIQUE KEY `hr_horario` (`hr_horario`,`hr_rap`),
  KEY `hr_rap` (`hr_rap`),
  CONSTRAINT `horario_rap_ibfk_1` FOREIGN KEY (`hr_horario`) REFERENCES `horario` (`horario_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `horario_rap_ibfk_2` FOREIGN KEY (`hr_rap`) REFERENCES `rap` (`rap_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `horario_rap`
--

/*!40000 ALTER TABLE `horario_rap` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_rap` ENABLE KEYS */;


--
-- Definition of table `instructores`
--

DROP TABLE IF EXISTS `instructores`;
CREATE TABLE `instructores` (
  `instructores_id` int NOT NULL AUTO_INCREMENT,
  `instructor_numid` varchar(20) NOT NULL,
  `instructor_nombres` varchar(60) NOT NULL,
  `instructor_profesion` int NOT NULL,
  `instructor_especialidad` int NOT NULL,
  `instructor_perfil` varchar(255) NOT NULL,
  `instructor_correo` varchar(80) NOT NULL,
  PRIMARY KEY (`instructores_id`),
  UNIQUE KEY `instructor_numid` (`instructor_numid`),
  UNIQUE KEY `instructor_nombres` (`instructor_nombres`),
  KEY `instructor_profesion` (`instructor_profesion`),
  KEY `instructor_especialidad` (`instructor_especialidad`),
  CONSTRAINT `instructores_ibfk_1` FOREIGN KEY (`instructor_profesion`) REFERENCES `profesion` (`profesion_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `instructores_ibfk_2` FOREIGN KEY (`instructor_especialidad`) REFERENCES `postgrado` (`postgrado_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instructores`
--

/*!40000 ALTER TABLE `instructores` DISABLE KEYS */;
INSERT INTO `instructores` (`instructores_id`,`instructor_numid`,`instructor_nombres`,`instructor_profesion`,`instructor_especialidad`,`instructor_perfil`,`instructor_correo`) VALUES 
 (1,'12435718','José David Montesino Hoyos',1,1,'Programación, implantación,analisis','josedavidontesino@yahoo.es'),
 (2,'12644644','Jesus Ramiro Zuleta Rondon',3,1,'Análisis, tics','jrzuleta@sena.edu.co'),
 (3,'56546546','José Rodriguez',5,1,'Circuitos electrónicos','jrodriguez@sena.edu.co');
/*!40000 ALTER TABLE `instructores` ENABLE KEYS */;


--
-- Definition of table `planeacion`
--

DROP TABLE IF EXISTS `planeacion`;
CREATE TABLE `planeacion` (
  `planeacion_id` int NOT NULL AUTO_INCREMENT,
  `planeacion_programa` int NOT NULL,
  `planeacion_ap` int NOT NULL,
  `planeacion_rap` int NOT NULL,
  `planeacion_aa` varchar(255) NOT NULL,
  PRIMARY KEY (`planeacion_id`),
  UNIQUE KEY `planeacion_programa` (`planeacion_programa`,`planeacion_rap`,`planeacion_ap`,`planeacion_aa`),
  KEY `planeacion_rap` (`planeacion_rap`),
  KEY `planeacion_ap` (`planeacion_ap`),
  CONSTRAINT `planeacion_ibfk_1` FOREIGN KEY (`planeacion_programa`) REFERENCES `programa` (`programa_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `planeacion_ibfk_2` FOREIGN KEY (`planeacion_rap`) REFERENCES `rap` (`rap_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `planeacion_ibfk_3` FOREIGN KEY (`planeacion_ap`) REFERENCES `actividad_proyecto` (`actividad_proyecto_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `planeacion`
--

/*!40000 ALTER TABLE `planeacion` DISABLE KEYS */;
INSERT INTO `planeacion` (`planeacion_id`,`planeacion_programa`,`planeacion_ap`,`planeacion_rap`,`planeacion_aa`) VALUES 
 (1,6,1,1,'Teoria general de los sistemasxxx'),
 (4,6,4,2,'prueba');
/*!40000 ALTER TABLE `planeacion` ENABLE KEYS */;


--
-- Definition of table `postgrado`
--

DROP TABLE IF EXISTS `postgrado`;
CREATE TABLE `postgrado` (
  `postgrado_id` int NOT NULL AUTO_INCREMENT,
  `postgrado_nombre` varchar(200) NOT NULL,
  `postgrado_titulo` enum('ESPECIALIZACION TECNOLOGICA','ESPECIALIZACION','MAESTRIA','DOCTORADO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`postgrado_id`),
  UNIQUE KEY `postgrado_nombre` (`postgrado_nombre`,`postgrado_titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `postgrado`
--

/*!40000 ALTER TABLE `postgrado` DISABLE KEYS */;
INSERT INTO `postgrado` (`postgrado_id`,`postgrado_nombre`,`postgrado_titulo`) VALUES 
 (4,'Ingenieria','MAESTRIA'),
 (1,'INTELIGENCIA ARTIFICIAL','ESPECIALIZACION'),
 (2,'INTELIGENCIA ARTIFICIAL','MAESTRIA'),
 (3,'TRANSFORMACION DIGITAL','DOCTORADO');
/*!40000 ALTER TABLE `postgrado` ENABLE KEYS */;


--
-- Definition of table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
CREATE TABLE `profesion` (
  `profesion_id` int NOT NULL AUTO_INCREMENT,
  `profesion_nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`profesion_id`),
  UNIQUE KEY `profesion_nombre` (`profesion_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profesion`
--

/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` (`profesion_id`,`profesion_nombre`) VALUES 
 (4,'Agrología xxx'),
 (2,'Ingenieria agronómica'),
 (1,'Ingenieria de sistemas'),
 (5,'Ingenieria electrónica'),
 (3,'Microbiología');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;


--
-- Definition of table `progra_comp`
--

DROP TABLE IF EXISTS `progra_comp`;
CREATE TABLE `progra_comp` (
  `progra_comp_id` int NOT NULL AUTO_INCREMENT,
  `pc_programa` int NOT NULL,
  `pc_competencia` int NOT NULL,
  PRIMARY KEY (`progra_comp_id`),
  UNIQUE KEY `pc_programa` (`pc_programa`,`pc_competencia`),
  KEY `pc_competencia` (`pc_competencia`),
  CONSTRAINT `progra_comp_ibfk_1` FOREIGN KEY (`pc_programa`) REFERENCES `programa` (`programa_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `progra_comp_ibfk_2` FOREIGN KEY (`pc_competencia`) REFERENCES `competencias` (`competencias_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `progra_comp`
--

/*!40000 ALTER TABLE `progra_comp` DISABLE KEYS */;
/*!40000 ALTER TABLE `progra_comp` ENABLE KEYS */;


--
-- Definition of table `programa`
--

DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa` (
  `programa_id` int NOT NULL AUTO_INCREMENT,
  `programa_codigo` varchar(20) NOT NULL,
  `programa_nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`programa_id`),
  UNIQUE KEY `programa_nombre` (`programa_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programa`
--

/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` (`programa_id`,`programa_codigo`,`programa_nombre`) VALUES 
 (1,'2222','Análisis y desarrollo de software'),
 (3,'202020','GAnaderia'),
 (5,'2222','Producción Agricola'),
 (6,'22369','Recursos Naturales'),
 (7,'202369','Negocios verdes');
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;


--
-- Definition of table `programacion`
--

DROP TABLE IF EXISTS `programacion`;
CREATE TABLE `programacion` (
  `programacion_id` int NOT NULL AUTO_INCREMENT,
  `prog_planeacion` int NOT NULL,
  `prog_ficha` int NOT NULL,
  `prog_instructor` int NOT NULL,
  `prog_estado` enum('CALIFICADO','PENDIENTE','EN EJECUCION','SIN CALIFICAR') NOT NULL,
  PRIMARY KEY (`programacion_id`),
  UNIQUE KEY `prog_planeacion` (`prog_planeacion`,`prog_ficha`,`prog_instructor`),
  KEY `prog_ficha` (`prog_ficha`),
  KEY `prog_instructor` (`prog_instructor`),
  CONSTRAINT `programacion_ibfk_1` FOREIGN KEY (`prog_planeacion`) REFERENCES `planeacion` (`planeacion_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `programacion_ibfk_2` FOREIGN KEY (`prog_ficha`) REFERENCES `fichas` (`fichas_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `programacion_ibfk_3` FOREIGN KEY (`prog_instructor`) REFERENCES `instructores` (`instructores_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programacion`
--

/*!40000 ALTER TABLE `programacion` DISABLE KEYS */;
INSERT INTO `programacion` (`programacion_id`,`prog_planeacion`,`prog_ficha`,`prog_instructor`,`prog_estado`) VALUES 
 (1,1,1,3,'EN EJECUCION'),
 (2,4,1,2,'SIN CALIFICAR');
/*!40000 ALTER TABLE `programacion` ENABLE KEYS */;


--
-- Definition of table `rap`
--

DROP TABLE IF EXISTS `rap`;
CREATE TABLE `rap` (
  `rap_id` int NOT NULL AUTO_INCREMENT,
  `rap_codigo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rap_competencia` int DEFAULT NULL,
  `rap_nombre` varchar(255) NOT NULL,
  `rap_horas_directas` int DEFAULT NULL,
  `rap_horas_otras` int DEFAULT NULL,
  `rap_conceptos` text,
  PRIMARY KEY (`rap_id`,`rap_nombre`),
  UNIQUE KEY `rap_nombre` (`rap_nombre`),
  UNIQUE KEY `rap_codigo` (`rap_codigo`),
  KEY `rap_competencia` (`rap_competencia`),
  CONSTRAINT `rap_ibfk_1` FOREIGN KEY (`rap_competencia`) REFERENCES `competencias` (`competencias_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rap`
--

/*!40000 ALTER TABLE `rap` DISABLE KEYS */;
INSERT INTO `rap` (`rap_id`,`rap_codigo`,`rap_competencia`,`rap_nombre`,`rap_horas_directas`,`rap_horas_otras`,`rap_conceptos`) VALUES 
 (1,'22050109201',2,'Caracterizar los procesos de la organización de acuerdo con el software a construir.xxx',40,8,'Teoría general de sistemas: orígenes, conceptos.\nEnfoque sistémico: concepto, características, aplicación, organizaciones inteligentes.\nDatos e Información: conceptos datos e información, procesamiento de datos y actividades de procesamiento de datos.\nSistemas de Información: elementos, objetivos, clasificación.\nCiclo de Vida del Software: definición, elementos, modelos, fases y sus objetivos.\nMetodologías de desarrollo: conceptos, tipos.'),
 (2,'546546546',3,'prueba',60,5,'prueba');
/*!40000 ALTER TABLE `rap` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_correo` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usuario_nombre` varchar(100) NOT NULL,
  `usuario_rol` enum('ADMINISTRADOR','COORDINADOR','AUXILIAR','CONSULTA') NOT NULL,
  `usua_contra` varchar(60) NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of view `vista_actividad_proyecto`
--

DROP TABLE IF EXISTS `vista_actividad_proyecto`;
DROP VIEW IF EXISTS `vista_actividad_proyecto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_actividad_proyecto` AS select `actividad_proyecto`.`actividad_proyecto_id` AS `vista_actividad_proyecto_id`,`actividad_proyecto`.`ap_nombre` AS `ap_nombre`,`fases`.`fases_id` AS `fases_id`,`fases`.`fase` AS `fase` from (`fases` join `actividad_proyecto`) where (`fases`.`fases_id` = `actividad_proyecto`.`ap_fase`);

--
-- Definition of view `vista_fichas`
--

DROP TABLE IF EXISTS `vista_fichas`;
DROP VIEW IF EXISTS `vista_fichas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_fichas` AS select `fichas`.`fichas_id` AS `vista_fichas_id`,`fichas`.`ficha_nombre` AS `ficha_nombre`,`fichas`.`ficha_inicio` AS `ficha_inicio`,`fichas`.`ficha_finalizacion` AS `ficha_finalizacion`,`programa`.`programa_id` AS `programa_id`,`programa`.`programa_nombre` AS `programa_nombre`,`programa`.`programa_codigo` AS `programa_codigo` from (`programa` join `fichas`) where (`programa`.`programa_id` = `fichas`.`ficha_programa`);

--
-- Definition of view `vista_horario`
--

DROP TABLE IF EXISTS `vista_horario`;
DROP VIEW IF EXISTS `vista_horario`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_horario` AS select `horario`.`horario_id` AS `vista_horario_id`,`horario`.`horario_dia` AS `horario_dia`,`horario`.`horario_instructor` AS `horario_instructor`,`vista_instructores`.`instructor_numid` AS `instructor_numid`,`vista_instructores`.`instructor_nombres` AS `instructor_nombres`,`vista_instructores`.`instructor_perfil` AS `instructor_perfil`,`horario`.`horario_fecha_inicio` AS `horario_fecha_inicio`,`horario`.`horario_fecha_final` AS `horario_fecha_final`,`horario`.`horario_hora_inicio` AS `horario_hora_inicio`,`horario`.`horario_hora_final` AS `horario_hora_final`,`horario`.`horario_ficha` AS `horario_ficha`,`vista_fichas`.`ficha_nombre` AS `ficha_nombre`,`vista_fichas`.`programa_nombre` AS `programa_nombre`,`vista_fichas`.`programa_codigo` AS `programa_codigo`,`vista_planeacion_completa`.`ap_nombre` AS `ap_nombre`,`vista_planeacion_completa`.`fase` AS `fase`,`horario`.`horario_bloque` AS `horario_bloque`,`horario`.`rap1` AS `rap1`,`horario`.`rap2` AS `rap2`,`horario`.`rap3` AS `rap3`,`horario`.`rap4` AS `rap4`,`vista_planeacion_completa`.`rap_codigo` AS `rap_codigo`,`vista_planeacion_completa`.`rap_nombre` AS `rap_nombre`,`vista_planeacion_completa`.`rap_horas_directas` AS `rap_horas_directas`,`vista_planeacion_completa`.`rap_horas_otras` AS `rap_horas_otras`,`vista_planeacion_completa`.`rap_conceptos` AS `rap_conceptos`,`vista_planeacion_completa`.`competencia_nombre` AS `competencia_nombre`,`vista_planeacion_completa`.`competencia_perfil` AS `competencia_perfil` from (((`horario` join `vista_instructores`) join `vista_planeacion_completa`) join `vista_fichas`) where ((`horario`.`horario_instructor` = `vista_instructores`.`vista_instructores_id`) and (`horario`.`horario_ficha` = `vista_fichas`.`vista_fichas_id`) and ((`horario`.`rap1` = `vista_planeacion_completa`.`planeacion_rap`) or (`horario`.`rap2` = `vista_planeacion_completa`.`planeacion_rap`) or (`horario`.`rap3` = `vista_planeacion_completa`.`planeacion_rap`) or (`horario`.`rap4` = `vista_planeacion_completa`.`planeacion_rap`)));

--
-- Definition of view `vista_instructores`
--

DROP TABLE IF EXISTS `vista_instructores`;
DROP VIEW IF EXISTS `vista_instructores`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_instructores` AS select `instructores`.`instructores_id` AS `vista_instructores_id`,`instructores`.`instructor_numid` AS `instructor_numid`,`instructores`.`instructor_nombres` AS `instructor_nombres`,`instructores`.`instructor_correo` AS `instructor_correo`,`instructores`.`instructor_perfil` AS `instructor_perfil`,`profesion`.`profesion_id` AS `profesion_id`,`profesion`.`profesion_nombre` AS `profesion_nombre`,`postgrado`.`postgrado_id` AS `postgrado_id`,concat(`postgrado`.`postgrado_titulo`,' ',`postgrado`.`postgrado_nombre`) AS `postgrado` from ((`instructores` join `profesion`) join `postgrado`) where ((`instructores`.`instructor_profesion` = `profesion`.`profesion_id`) and (`instructores`.`instructor_especialidad` = `postgrado`.`postgrado_id`));

--
-- Definition of view `vista_planeacion`
--

DROP TABLE IF EXISTS `vista_planeacion`;
DROP VIEW IF EXISTS `vista_planeacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_planeacion` AS select `planeacion`.`planeacion_id` AS `vista_planeacion_id`,`planeacion`.`planeacion_programa` AS `planeacion_programa`,`programa`.`programa_nombre` AS `programa_nombre`,`planeacion`.`planeacion_ap` AS `planeacion_ap`,`actividad_proyecto`.`ap_nombre` AS `ap_nombre`,`fases`.`fase` AS `fase`,`competencias`.`competencia_nombre` AS `competencia_nombre`,`planeacion`.`planeacion_rap` AS `planeacion_rap`,`rap`.`rap_nombre` AS `rap_nombre`,`planeacion`.`planeacion_aa` AS `planeacion_aa` from (((((`planeacion` join `programa`) join `fases`) join `actividad_proyecto`) join `competencias`) join `rap`) where ((`planeacion`.`planeacion_programa` = `programa`.`programa_id`) and (`planeacion`.`planeacion_ap` = `actividad_proyecto`.`actividad_proyecto_id`) and (`planeacion`.`planeacion_rap` = `rap`.`rap_id`) and (`rap`.`rap_competencia` = `competencias`.`competencias_id`) and (`fases`.`fases_id` = `actividad_proyecto`.`ap_fase`));

--
-- Definition of view `vista_planeacion_completa`
--

DROP TABLE IF EXISTS `vista_planeacion_completa`;
DROP VIEW IF EXISTS `vista_planeacion_completa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_planeacion_completa` AS select `planeacion`.`planeacion_id` AS `vista_planeacion_completa_id`,`planeacion`.`planeacion_programa` AS `planeacion_programa`,`programa`.`programa_codigo` AS `programa_codigo`,`programa`.`programa_nombre` AS `programa_nombre`,`planeacion`.`planeacion_ap` AS `planeacion_ap`,`actividad_proyecto`.`ap_nombre` AS `ap_nombre`,`fases`.`fase` AS `fase`,`competencias`.`competencia_nombre` AS `competencia_nombre`,`competencias`.`competencia_perfil` AS `competencia_perfil`,`planeacion`.`planeacion_rap` AS `planeacion_rap`,`rap`.`rap_codigo` AS `rap_codigo`,`rap`.`rap_nombre` AS `rap_nombre`,`rap`.`rap_horas_directas` AS `rap_horas_directas`,`rap`.`rap_horas_otras` AS `rap_horas_otras`,`rap`.`rap_conceptos` AS `rap_conceptos`,`planeacion`.`planeacion_aa` AS `planeacion_aa` from (((((`planeacion` join `programa`) join `fases`) join `actividad_proyecto`) join `competencias`) join `rap`) where ((`planeacion`.`planeacion_programa` = `programa`.`programa_id`) and (`planeacion`.`planeacion_ap` = `actividad_proyecto`.`actividad_proyecto_id`) and (`planeacion`.`planeacion_rap` = `rap`.`rap_id`) and (`rap`.`rap_competencia` = `competencias`.`competencias_id`) and (`fases`.`fases_id` = `actividad_proyecto`.`ap_fase`));

--
-- Definition of view `vista_programacion`
--

DROP TABLE IF EXISTS `vista_programacion`;
DROP VIEW IF EXISTS `vista_programacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_programacion` AS select `programacion`.`programacion_id` AS `vista_programacion_id`,`vista_planeacion`.`programa_nombre` AS `programa_nombre`,`programacion`.`prog_ficha` AS `prog_ficha`,`fichas`.`ficha_nombre` AS `ficha_nombre`,`vista_planeacion`.`fase` AS `fase`,`vista_planeacion`.`ap_nombre` AS `ap_nombre`,`vista_planeacion`.`competencia_nombre` AS `competencia_nombre`,`vista_planeacion`.`rap_nombre` AS `rap_nombre`,`vista_planeacion`.`planeacion_aa` AS `planeacion_aa`,`programacion`.`prog_instructor` AS `prog_instructor`,`instructores`.`instructor_nombres` AS `instructor_nombres`,`programacion`.`prog_estado` AS `prog_estado`,`programacion`.`prog_planeacion` AS `prog_planeacion` from (((`vista_planeacion` join `programacion`) join `instructores`) join `fichas`) where ((`programacion`.`prog_planeacion` = `vista_planeacion`.`vista_planeacion_id`) and (`programacion`.`prog_ficha` = `fichas`.`fichas_id`) and (`programacion`.`prog_instructor` = `instructores`.`instructores_id`));

--
-- Definition of view `vista_programacion_completa`
--

DROP TABLE IF EXISTS `vista_programacion_completa`;
DROP VIEW IF EXISTS `vista_programacion_completa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_programacion_completa` AS select `programacion`.`programacion_id` AS `vista_programacion_completa_id`,`vista_planeacion_completa`.`programa_nombre` AS `programa_nombre`,`programacion`.`prog_ficha` AS `prog_ficha`,`fichas`.`ficha_nombre` AS `ficha_nombre`,`vista_planeacion_completa`.`fase` AS `fase`,`vista_planeacion_completa`.`ap_nombre` AS `ap_nombre`,`vista_planeacion_completa`.`competencia_nombre` AS `competencia_nombre`,`vista_planeacion_completa`.`planeacion_rap` AS `planeacion_rap`,`vista_planeacion_completa`.`rap_nombre` AS `rap_nombre`,`vista_planeacion_completa`.`rap_horas_directas` AS `rap_horas_directas`,`vista_planeacion_completa`.`planeacion_aa` AS `planeacion_aa`,`programacion`.`prog_instructor` AS `prog_instructor`,`instructores`.`instructor_nombres` AS `instructor_nombres`,`programacion`.`prog_estado` AS `prog_estado`,`programacion`.`prog_planeacion` AS `prog_planeacion` from (((`vista_planeacion_completa` join `programacion`) join `instructores`) join `fichas`) where ((`programacion`.`prog_planeacion` = `vista_planeacion_completa`.`vista_planeacion_completa_id`) and (`programacion`.`prog_ficha` = `fichas`.`fichas_id`) and (`programacion`.`prog_instructor` = `instructores`.`instructores_id`));

--
-- Definition of view `vista_rap`
--

DROP TABLE IF EXISTS `vista_rap`;
DROP VIEW IF EXISTS `vista_rap`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_rap` AS select `rap`.`rap_id` AS `vista_rap_id`,`rap`.`rap_codigo` AS `rap_codigo`,`rap`.`rap_nombre` AS `rap_nombre`,`rap`.`rap_horas_directas` AS `rap_horas_directas`,`rap`.`rap_horas_otras` AS `rap_horas_otras`,`rap`.`rap_conceptos` AS `rap_conceptos`,`rap`.`rap_competencia` AS `rap_competencia`,`competencias`.`competencia_nombre` AS `competencia_nombre`,`competencias`.`competencia_perfil` AS `competencia_perfil` from (`rap` join `competencias`) where (`rap`.`rap_competencia` = `competencias`.`competencias_id`);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
