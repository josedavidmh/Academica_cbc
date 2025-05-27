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
  `planeacion_aa` text
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
  `planeacion_aa` text
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
  `planeacion_aa` text,
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
  `planeacion_aa` text,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `actividad_proyecto`
--

/*!40000 ALTER TABLE `actividad_proyecto` DISABLE KEYS */;
INSERT INTO `actividad_proyecto` (`actividad_proyecto_id`,`ap_nombre`,`ap_fase`) VALUES 
 (1,'SIN AP1',1),
 (2,'CONTEXTUALIZAR EN LA POLÍTICA,FILOSOFÍA Y METODOLOGÍA INSTITUCIONAL',2),
 (3,'DETERMINAR LAS ESPECIFICACIONES FUNCIONALES DEL SISTEMA DE INFORMACIÓN',2),
 (4,'ESPECIFICAR EL MODELO CONCEPTUAL DEL SISTEMA DE INFORMACIÓN',2),
 (5,'ESTABLECER METODOLOGÍA DE DESARROLLO A UTILIZAR',2),
 (6,'ESTRUCTURAR LA PROPUESTA TÉCNICA DEL PROYECTO DE SOFTWARE',2),
 (7,'CONSTRUIR EL PROTOTIPO DEL SISTEMA DE INFORMACIÓN DE ACUERDO AL ANÁLISIS DE LAS\nCARACTERÍSTICAS FUNCIONALES Y DE CALIDAD.',3),
 (8,'DETERMINAR LA ESTRUCTURA LÓGICA Y TECNOLÓGICA DEL SISTEMA',3),
 (9,'ESTRUCTURAR PROCESOS LÓGICOS PARA LA CONSTRUCCIÓN DE ALGORITMOS',3),
 (10,'CODIFICAR LOS MÓDULOS DEL SISTEMA DE INFORMACIÓN.',4),
 (11,'DESARROLLAR LA ESTRUCTURA DE DATOS Y LA INTERFAZ DE USUARIO DEL SISTEMA DE INFORMACIÓN.',4),
 (12,'DESARROLLAR LAS TAREAS DE CONFIGURACIÓN Y PUESTA EN MARCHA DEL SISTEMA DE INFORMACIÓN.',5),
 (13,'REALIZAR ACTIVIDADES DE VERIFICACIÓN DE CALIDAD DEL SOFTWARE',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `competencias`
--

/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
INSERT INTO `competencias` (`competencias_id`,`competencia_codigo`,`competencia_nombre`,`competencia_perfil`) VALUES 
 (1,'000000000','SIN ASIGNAR','SIN PERFIL'),
 (2,'220501092','Establecer requisitos de la solución de software de acuerdo con estándares y procedimiento técnico','Tecnólogo o profesional en sistemas y afines, con conocimientos en Ingeniería de requisitos, elaboración y aplicación de instrumentos para recolección de información, trabajo por procesos, estadística descriptiva y elaboración de informes.'),
 (3,'220501093','Evaluar requisitos de la solución de software de acuerdo con metodologías de análisis y estándares ','Tecnólogo o profesional en sistemas y afines, conocimientos en la fase de requisitos y análisis del ciclo de vida del software, UML, metodologías tradicionales y ágiles, modelos y disciplinas de calidad de software.  '),
 (4,'220501094','Estructurar propuesta técnica de servicio de tecnología de la información según requisitos técnicos y normativa.',''),
 (5,'220501095','Diseñar la solución de software de acuerdo con procedimientos y requisitos técnicos.',''),
 (6,'220501096','Desarrollar la solución de software de acuerdo con el diseño y metodologías de desarrollo.',''),
 (7,'220501097','Implementar la solución de software de acuerdo con los requisitos de operación y modelos de referencia.',''),
 (8,'220501098','Controlar la calidad del servicio de software de acuerdo con los estándares técnicos.',''),
 (9,'240201530','Resultado de Aprendizaje de la Inducción',''),
 (10,'220201501','Aplicación de conocimientos de las ciencias naturales de acuerdo con situaciones del contexto productivo y social.',''),
 (11,'220601501','Aplicar prácticas de protección ambiental, seguridad y salud en el trabajo de acuerdo con las políticas organizacionales y la normatividad.',''),
 (12,'240201524','Desarrollar procesos de comunicación eficaces y efectivos, teniendo en cuenta situaciones de orden social, personal y productivo.',''),
 (13,'210201501','Ejercer derechos fundamentales del trabajo en el marco de la constitución política y los convenios internacionales.',''),
 (14,'240201526','Interactuar en el contexto productivo y social de acuerdo con principios éticos para la construcción de una cultura de paz.',''),
 (15,'230101507','Generar hábitos saludables de vida mediante la aplicación de programas de actividad física en los contextos productivos y sociales.',''),
 (16,'240201525','Gestionar procesos propios de la cultura emprendedora y empresarial de acuerdo con el perfil personal y los requerimientos de los contextos productivo y social.',''),
 (17,'240201064','Orientar investigación formativa según referentes técnicos.',''),
 (18,'240201517','Razonar cuantitativamente frente a situaciones susceptibles de ser abordadas de manera matemática en contextos laborales, sociales y personales.',''),
 (19,'220501046','Utilizar herramientas informáticas de acuerdo con necesidades de manejo de información.','-'),
 (20,'240202501','Interactuar en lengua inglesa de forma oral y escrita dentro de contextos sociales y laborales según los criterios establecidos por el marco común europeo de referencia para las lenguas.','');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fases`
--

/*!40000 ALTER TABLE `fases` DISABLE KEYS */;
INSERT INTO `fases` (`fases_id`,`fase`) VALUES 
 (2,'Análisis'),
 (4,'Ejecución'),
 (5,'Evaluación'),
 (6,'Inducción'),
 (3,'Planeación'),
 (1,'SIN FASE');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fichas`
--

/*!40000 ALTER TABLE `fichas` DISABLE KEYS */;
INSERT INTO `fichas` (`fichas_id`,`ficha_nombre`,`ficha_inicio`,`ficha_finalizacion`,`ficha_programa`) VALUES 
 (1,'2397050','06/02/2024','06/04/2025',1),
 (6,'2697051','19/05/2024','20/05/2026',1);
/*!40000 ALTER TABLE `fichas` ENABLE KEYS */;


--
-- Definition of trigger `trg_AfterInsertFichas`
--

DROP TRIGGER /*!50030 IF EXISTS */ `trg_AfterInsertFichas`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `trg_AfterInsertFichas` AFTER INSERT ON `fichas` FOR EACH ROW BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE planeacion_id INT;
    
    -- Declare a cursor to iterate over the matching records
    DECLARE cur CURSOR FOR
        SELECT p.planeacion_id 
        FROM planeacion p 
        WHERE p.planeacion_programa = NEW.ficha_programa;
    -- Declare a handler for the end of the cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    -- Open the cursor
    OPEN cur;
    -- Loop through the results
    read_loop: LOOP
        FETCH cur INTO planeacion_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Insert a new record into the programacion table
        INSERT INTO programacion (prog_planeacion, prog_ficha, prog_instructor, prog_estado)
        VALUES (planeacion_id, NEW.fichas_id, 1, 'PENDIENTE');
    END LOOP;
    -- Close the cursor
    CLOSE cur;
END $$

DELIMITER ;

--
-- Definition of table `horario`
--

DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `horario_id` int NOT NULL AUTO_INCREMENT,
  `horario_dia` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES') NOT NULL,
  `horario_instructor` int NOT NULL DEFAULT '1',
  `horario_fecha_inicio` varchar(10) NOT NULL,
  `horario_fecha_final` varchar(10) NOT NULL,
  `horario_ficha` int NOT NULL,
  `horario_bloque` enum('A','B','C','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rap1` int NOT NULL DEFAULT '1',
  `rap2` int NOT NULL DEFAULT '1',
  `rap3` int NOT NULL DEFAULT '1',
  `rap4` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`horario_id`),
  UNIQUE KEY `horario_val` (`horario_dia`,`horario_fecha_inicio`,`horario_ficha`,`horario_fecha_final`,`horario_bloque`,`horario_instructor`),
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
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `horario`
--

/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` (`horario_id`,`horario_dia`,`horario_instructor`,`horario_fecha_inicio`,`horario_fecha_final`,`horario_ficha`,`horario_bloque`,`rap1`,`rap2`,`rap3`,`rap4`) VALUES 
 (143,'LUNES',2,'2024-03-01','2024-03-31',1,'A',3,2,3,1),
 (144,'MARTES',1,'2024-03-01','2024-03-31',1,'B',1,1,1,1),
 (145,'MIERCOLES',1,'2024-03-01','2024-03-31',1,'B',1,1,1,1),
 (146,'MARTES',2,'2024-03-01','2024-03-31',1,'A',2,3,1,1),
 (147,'MIERCOLES',3,'2024-03-01','2024-03-31',1,'A',3,1,2,1),
 (148,'JUEVES',1,'2024-03-01','2024-03-31',1,'B',1,1,1,1),
 (149,'VIERNES',1,'2024-03-01','2024-03-31',1,'B',1,1,1,1),
 (150,'JUEVES',2,'2024-03-01','2024-03-31',1,'A',3,3,2,1),
 (151,'LUNES',1,'2024-03-01','2024-03-31',1,'C',1,1,1,1),
 (152,'MARTES',1,'2024-03-01','2024-03-31',1,'C',1,1,1,1),
 (153,'MIERCOLES',1,'2024-03-01','2024-03-31',1,'C',1,1,1,1),
 (154,'JUEVES',1,'2024-03-01','2024-03-31',1,'C',1,1,1,1),
 (155,'LUNES',3,'2024-03-01','2024-03-31',1,'D',3,3,1,1),
 (156,'MARTES',1,'2024-03-01','2024-03-31',1,'D',1,1,1,1),
 (157,'VIERNES',1,'2024-03-01','2024-03-31',1,'C',1,1,1,1),
 (158,'MIERCOLES',3,'2024-03-01','2024-03-31',1,'D',3,1,1,1),
 (159,'VIERNES',2,'2024-03-01','2024-03-31',1,'D',1,1,1,1),
 (160,'JUEVES',1,'2024-03-01','2024-03-31',1,'D',1,1,1,1),
 (161,'VIERNES',1,'2024-03-01','2024-03-31',1,'A',1,1,1,1),
 (162,'LUNES',2,'2024-03-01','2024-03-31',1,'B',3,1,1,1),
 (174,'MARTES',2,'2024-03-01','2024-03-31',1,'C',1,1,1,1),
 (177,'MIERCOLES',2,'2024-03-01','2024-03-31',1,'C',1,1,1,1),
 (183,'LUNES',1,'2024-01-01','2024-02-01',1,'B',1,1,1,1),
 (184,'LUNES',2,'2024-01-01','2024-02-01',1,'A',3,1,1,1),
 (185,'MARTES',1,'2024-01-01','2024-02-01',1,'B',1,1,1,1),
 (186,'VIERNES',1,'2024-01-01','2024-02-01',1,'A',1,1,1,1),
 (187,'MIERCOLES',1,'2024-01-01','2024-02-01',1,'B',1,1,1,1),
 (188,'JUEVES',1,'2024-01-01','2024-02-01',1,'B',1,1,1,1),
 (189,'VIERNES',1,'2024-01-01','2024-02-01',1,'B',1,1,1,1),
 (190,'MARTES',4,'2024-01-01','2024-02-01',1,'A',2,1,1,1),
 (191,'MIERCOLES',3,'2024-01-01','2024-02-01',1,'A',2,1,1,1),
 (192,'MARTES',1,'2024-01-01','2024-02-01',1,'C',1,1,1,1),
 (193,'JUEVES',1,'2024-01-01','2024-02-01',1,'A',1,1,1,1),
 (194,'LUNES',1,'2024-01-01','2024-02-01',1,'C',1,1,1,1),
 (195,'MIERCOLES',1,'2024-01-01','2024-02-01',1,'C',1,1,1,1),
 (196,'JUEVES',1,'2024-01-01','2024-02-01',1,'C',1,1,1,1),
 (197,'MIERCOLES',2,'2024-01-01','2024-02-01',1,'D',2,1,1,1),
 (198,'JUEVES',4,'2024-01-01','2024-02-01',1,'D',3,2,1,1),
 (199,'VIERNES',1,'2024-01-01','2024-02-01',1,'D',1,1,1,1),
 (200,'LUNES',2,'2024-01-01','2024-02-01',1,'D',3,1,1,1),
 (201,'VIERNES',1,'2024-01-01','2024-02-01',1,'C',1,1,1,1),
 (202,'MARTES',3,'2024-01-01','2024-02-01',1,'D',3,1,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instructores`
--

/*!40000 ALTER TABLE `instructores` DISABLE KEYS */;
INSERT INTO `instructores` (`instructores_id`,`instructor_numid`,`instructor_nombres`,`instructor_profesion`,`instructor_especialidad`,`instructor_perfil`,`instructor_correo`) VALUES 
 (1,'0000000','Selecc. instructor',1,1,'SIN PERFIL',' '),
 (2,'12644644','Jesus Ramiro Zuleta Rondon',3,4,'Análisis, tics','jrzuleta@sena.edu.co'),
 (3,'56546546','José Rodriguez',5,4,'Circuitos electrónicos','jrodriguez@sena.edu.co'),
 (4,'12435718','José David Montesino Hoyos',4,4,'Programación, implantación,analisis','josedavidontesino@yahoo.es');
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
  `planeacion_aa` text NOT NULL,
  PRIMARY KEY (`planeacion_id`),
  UNIQUE KEY `planeacion_programa` (`planeacion_programa`,`planeacion_rap`,`planeacion_ap`),
  KEY `planeacion_rap` (`planeacion_rap`),
  KEY `planeacion_ap` (`planeacion_ap`),
  CONSTRAINT `planeacion_ibfk_1` FOREIGN KEY (`planeacion_programa`) REFERENCES `programa` (`programa_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `planeacion_ibfk_2` FOREIGN KEY (`planeacion_rap`) REFERENCES `rap` (`rap_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `planeacion_ibfk_3` FOREIGN KEY (`planeacion_ap`) REFERENCES `actividad_proyecto` (`actividad_proyecto_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `planeacion`
--

/*!40000 ALTER TABLE `planeacion` DISABLE KEYS */;
INSERT INTO `planeacion` (`planeacion_id`,`planeacion_programa`,`planeacion_ap`,`planeacion_rap`,`planeacion_aa`) VALUES 
 (1,1,1,1,''),
 (6,1,2,32,'Identificar la historia, misión, visión, normas de convivencia, oportunidades y beneficios que les ofrece la Institución'),
 (7,1,3,2,'Identificar conceptos básicos de Teoría General de Sistemas y Enfoque Sistémico.\n\nElaborar Diagramas de procesos a partir de la caracterización de los mismos usando una técnica de notación.'),
 (8,1,3,3,'Elaborar instrumentos de recolección de datos, de acuerdo a técnicas e instrumentos que permitan el procesamiento de la información.\n'),
 (9,1,3,4,'Determinar los requisitos funcionales y no funcionales del  software de acuerdo con los requerimientos del cliente.'),
 (10,1,3,5,'Aplicar técnicas para validar los requisitos del software.\n'),
 (11,1,3,43,'Identificar la función de los elementos del hardware y del software del computador y otros dispositivos tecnológicos que se aplican en diferentes contextos.'),
 (12,1,3,45,'Aplicar herramientas ofimáticas como procesador de palabras, hoja de cálculo, diseño de presentaciones e internet, de acuerdo con los requerimientos de las actividades del proyecto formativo.\n'),
 (13,1,3,47,'Verificar que el producto tenga elementos multimedia, enlaces a las actividades de apropiación elaboradas y un buen diseño que permita su navegabilidad.				'),
 (15,1,3,49,'Implementar el uso de la aplicación tecnológica adecuada de acuerdo con la actividad de proyecto.'),
 (16,1,5,6,'Estructurar el plan de actividades de análisis partir de las características del proyecto y el modelo de desarrollo seleccionado'),
 (18,1,5,81,'Hacer una exposición de un material escrito seleccionado: noticia, cuento, artículo, poema, etc.'),
 (19,1,4,7,'Elaborar diagrama de casos de uso  y documentación de casos de  uso  de acuerdo con el refinamiento de requisitos.\n\nRepresentar el contexto del negocio a través del diagrama de dominio y diagramas de actividades \n\nElaborar el modelo conceptual de la base de datos'),
 (20,1,4,9,'Elaborar prototipo del sistema como estrategia para validar los modelos de análisis desarrollados'),
 (21,1,4,50,'Reconocer la importancia de la comunicación en las diferentes dimensiones del ser humanos y los contextos labora, social y personal.'),
 (22,1,4,82,'Presentar una entrevista de trabajo en parejas.'),
 (23,1,6,10,'Determinar las especificaciones técnicas  a partir del diagnóstico de necesidades informáticas'),
 (24,1,6,11,'Realizar el análisis de proveedores a partir de las fichas técnicas\n\nElaborar la propuesta técnica y financiera a partir de los referentes establecidos\n'),
 (25,1,6,12,'Presentar la propuesta  técnica y económica de acuerdo con las condiciones del contrato a desarrollar'),
 (26,1,6,51,'Comprender la comunicación como un proceso en el que participan diferentes elementos relacionados entre sí y lo aplica a los diferentes contextos y dismensiones humanas de manera pertinente, efectiva y asertiva.\n'),
 (27,1,6,52,'Apropiar los principios y fundamentos de la macroestructura textual, según la intención comunicativa.\n'),
 (28,1,6,53,'Apropiar los elementos que intervienen en la microestructura textual.\n');
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `postgrado`
--

/*!40000 ALTER TABLE `postgrado` DISABLE KEYS */;
INSERT INTO `postgrado` (`postgrado_id`,`postgrado_nombre`,`postgrado_titulo`) VALUES 
 (5,'Ingenieria','MAESTRIA'),
 (4,'INTELIGENCIA ARTIFICIAL','ESPECIALIZACION'),
 (2,'INTELIGENCIA ARTIFICIAL','MAESTRIA'),
 (1,'SIN POSTGRADO','ESPECIALIZACION'),
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profesion`
--

/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` (`profesion_id`,`profesion_nombre`) VALUES 
 (6,'Agrología'),
 (2,'Ingenieria agronómica'),
 (4,'Ingenieria de sistemas'),
 (5,'Ingenieria electrónica'),
 (3,'Microbiología'),
 (1,'SIN PROFESION');
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
  UNIQUE KEY `programa_nombre` (`programa_nombre`),
  UNIQUE KEY `programa_codigo` (`programa_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programa`
--

/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` (`programa_id`,`programa_codigo`,`programa_nombre`) VALUES 
 (1,'00001','ANÁLISIS Y DESARROLLO DE SOFTWARE '),
 (2,'00002','GESTION DE LA PRODUCCIÓN AGRICOLA '),
 (3,'00003','PRODUCCIÓN DE ESPECIES MENORES'),
 (4,'00004','PRODUCCIÓN GANADERA '),
 (5,'00005','ACUICULTURA'),
 (6,'00006','PROCESAMIENTO DE ALIMENTOS '),
 (7,'00007','GESTION DE RECURSOS NATURALES '),
 (8,'00008','COORDINACIÓN EN SISTEMAS INTEGRADOS DE GESTION'),
 (9,'00009','SUPERVISIÓN EN SISTEMAS DE AGUA Y SANEAMIENTO'),
 (10,'00010','GESTION COMERCIAL DE NEGOCIOS VERDES'),
 (11,'00011','SUPERVISIÓN EN VENTAS '),
 (12,'00012','TECNICO EN MANTENIMIENTO E INSTALACION DE SISTEMAS SOLARES FOTOVOLTAICOS'),
 (13,'00013','TECNICO EN ASISTENCIA ADMINISTRATIVA '),
 (14,'00014','TECNICO EN SUPERVISION DE ACTIVIDADES BANANERA '),
 (15,'00015','TECNICO EN PRODUCCION DE CAFÉ '),
 (16,'00016','TECNICO EN PROCESAMIENTO DE DERIVADOS LACTEOS'),
 (17,'00017','TECNICO EN CULTIVO Y COSECHA DE PALMA DE ACEITE '),
 (18,'00018','TECNICO DE SISTEMAS');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programacion`
--

/*!40000 ALTER TABLE `programacion` DISABLE KEYS */;
INSERT INTO `programacion` (`programacion_id`,`prog_planeacion`,`prog_ficha`,`prog_instructor`,`prog_estado`) VALUES 
 (12,1,6,1,'PENDIENTE'),
 (13,7,6,1,'PENDIENTE'),
 (14,8,6,1,'PENDIENTE'),
 (15,9,6,1,'PENDIENTE'),
 (16,10,6,1,'PENDIENTE'),
 (17,16,6,1,'PENDIENTE'),
 (18,19,6,1,'PENDIENTE'),
 (19,20,6,1,'PENDIENTE'),
 (20,23,6,1,'PENDIENTE'),
 (21,24,6,1,'PENDIENTE'),
 (22,25,6,1,'PENDIENTE'),
 (23,6,6,1,'PENDIENTE'),
 (24,11,6,1,'PENDIENTE'),
 (25,12,6,1,'PENDIENTE'),
 (26,13,6,1,'PENDIENTE'),
 (27,15,6,1,'PENDIENTE'),
 (28,21,6,1,'PENDIENTE'),
 (29,26,6,1,'PENDIENTE'),
 (30,27,6,1,'PENDIENTE'),
 (31,28,6,1,'PENDIENTE'),
 (32,18,6,1,'PENDIENTE'),
 (33,22,6,1,'PENDIENTE');
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rap`
--

/*!40000 ALTER TABLE `rap` DISABLE KEYS */;
INSERT INTO `rap` (`rap_id`,`rap_codigo`,`rap_competencia`,`rap_nombre`,`rap_horas_directas`,`rap_horas_otras`,`rap_conceptos`) VALUES 
 (1,'0000000000',1,'Seleccione el RAP',0,0,''),
 (2,'22050109201',2,'Caracterizar los procesos de la organización de acuerdo con el\nsoftware a construir.',30,8,'• Teoría general de sistemas: orígenes, conceptos.\n• Enfoque sistémico: concepto, características, aplicación, organizaciones inteligentes.\n• Datos e Información: conceptos datos e información, procesamiento de datos y actividades de procesamiento de datos.\n• Sistemas de Información: elementos, objetivos, clasificación.\n• Ciclo de Vida del Software: definición, elementos, modelos, fases y sus objetivos.\n• Metodologías de desarrollo: conceptos, tipos.\n• Procesos: definición, características, entradas, componentes,\nrepresentación gráfica, procedimientos, Modelo de Procesos de Negocio (BPM).'),
 (3,'22050109202',2,'Recolectar información del software a construir de acuerdo con las necesidades del cliente.',30,8,'• Técnicas de elicitación de requisitos: técnicas de prospección, técnicas de creatividad, técnicas centradas en la documentación, técnicas de observación.\n• Requisitos: conceptos, requisitos funcionales y no funcionales.\n• Ingeniería de Requisitos: Análisis de requisitos, gestión de requisitos, prácticas ágiles(historias de usuarios, iteraciones, product backlog, estimaciones, storyboard)\".\n• Estadística Descriptiva: definición, población, elementos y\ncaracterísticas, variables cualitativas y cuantitativas, medidas de tendencias central (media, media geométrica, mediana, moda), representación gráfica de los datos.\n• Fuentes de requisitos: implicados, documentación, sistemas en operación.'),
 (4,'22050109203',2,'Establecer los requisitos del software de acuerdo con la información recolectada.',30,8,'Tipos de documentación de requisitos: lenguaje natural, modelos conceptuales, híbridos.\n• Buenas prácticas de documentación: NTC1486 del ICONTEC, APA, buenas prácticas de redacción de requisitos.\n• Informe de Requisitos: Elementos del documento, IREB (International Requirements Engineering Board), estándar IEEE.\n• Historias de usuario: características, uso, criterios de aceptación.'),
 (5,'22050109204',2,'Validar el informe de requisitos de acuerdo con las necesidades del cliente',30,8,'• Listas de chequeo para validación de información\n• Técnicas para validar requisitos: inspecciones, revisión guiada, opinión de expertos.\n• Versionamiento de requisitos: gestión de cambios.'),
 (6,'22050109301',3,'Planear actividades de análisis de acuerdo con la metodología seleccionada.',0,0,'• Metodologías de desarrollo de software: concepto, clasificación, roles, ejemplos.\n• Metodologías tradicionales: Proceso Unificado Racional (RUP)\n• Metodologías ágiles: SCRUM, Programación Extrema (XP), Desarrollo\nRápido de Aplicaciones (RAD).\n• Proyectos de software: características, tipos, componentes.\n• Planeación: definir y priorizar actividades de análisis, fijar cronogramas y entregables.'),
 (7,'22050109302',3,'Modelar las funciones del software de acuerdo con el informe de requisitos.',0,0,'• Informes de requisitos: análisis, interpretación y toma de decisiones.\n• Análisis orientado a objetos: conceptos de objeto, clase, instancia,multiplicidad, asociación, agregación, composición, actor, caso de uso,\nmensajes, excepciones, condiciones, post-condiciones, focos de control.\n• UML: Definición, notación, elementos, relaciones, diagramas, clasificación\n• Diagramas UML: casos de uso, actividades, modelo de dominio.\n• Herramientas CASE: definición, tipos, uso.\n• Modelo de Datos: Fundamentos de bases de datos, modelo entidad relación.'),
 (8,'22050109303',3,'Desarrollar procesos lógicos a través de la implementación de algoritmos.',0,0,'• Lógica matemática: fundamentos, lógica proposicional.\n• Algoritmo: concepto, tipos, técnicas para la formulación de algoritmos (pseudocódigo, diagramas de flujo), entidades primitivas, jerarquía de operadores, estructuras secuenciales, condicionales, cíclicas, arreglos,\nfunciones, procedimientos, prueba de escritorio.\n• Herramientas para creación y prueba de algoritmos: DFD, LPP o PSeint, Python.'),
 (9,'22050109304',3,'Verificar los modelos realizados en la fase de análisis de acuerdo con lo establecido en el informe de requisitos.',0,0,'• Informe de análisis: estructura, resultados\n• Instrumentos de verificación: listas de chequeo.\n• Trazabilidad: artefactos generados en el análisis frente a los requisitos.\n• Prototipos: tipos, herramientas.'),
 (10,'22050109401',4,'Definir especificaciones técnicas del software de acuerdo con las características del software a construir.',0,0,'• Tecnología informática: Características de Hardware y Software, tendencias de fabricación TI y mercado en el ámbito nacional e internacional.\n• Soluciones informáticas: diagnóstico de necesidades y elaboración de referentes técnicos.\n• Gestión Tecnológica: Conceptos y características, innovación, emprendimiento y actividades de la gestión tecnológica.\n• Contratación de servicios de TI: concepto, tipos, principios y características, normatividad general de la contratación tanto privada como estatal.\n• Proyectos de TI: tipos, características, fases.\n• Licenciamiento de software: concepto, tipos, características, diferencias de carácter técnico y de condiciones de cumplimiento\n• Propiedad Intelectual: Derechos de autor, propiedad industrial, registro de software.'),
 (11,'22050109402',4,'Elaborar propuesta técnica del software de acuerdo con las especificaciones técnicas definidas.',0,0,'• Costos: conceptos, fundamentos, clasificación.\n• Estimación Costos: Conceptos de estimación de costos y presupuesto aplicados a proyectos de software.\n• Ficha técnica: elementos mínimos para describir los referentes técnicos.\n• Términos de referencia: concepto, elementos y construcción.'),
 (12,'22050109403',4,'Validar las condiciones de la propuesta técnica del software de acuerdo con los intereses de las partes.',0,0,'• Comunicación: Técnicas, tipos y habilidades.\n• Negociación de Tecnología: Estilos de negociación, principios de negociación, identificación y solución de conflictos.\n• Contrato: concepto, tipos, partes, normatividad\n• Acuerdos de niveles de servicio: concepto, formulación, métricas.'),
 (13,'22050109501',5,'Elaborar los artefactos de diseño del software siguiendo las prácticas de la metodología seleccionada.',0,0,'• Informe de análisis: interpretación, análisis y toma de decisiones.\n• Diseño orientado a objetos: conceptos (cohesión, acoplamiento, encapsulamiento, polimorfismo, composición, herencia, interfaces),\nprincipios (adaptabilidad, extensibilidad, mantenibilidad, reusabilidad, desempeño, escalabilidad, confiabilidad, eficiencia).\n• Plataformas tecnológicas: motores de bases de datos relacionales, no relacionales, lenguajes de programación con orientación a objetos.\n• Diagrama de clases: atributos, métodos, relaciones.\n• Patrones de diseño (GOF): conceptos, comportamentales (estrategia, comando, iterador), creacionales (singleton, fábrica abstracta),\nestructurales (fachada).\n• Arquitectura de software: generalidades, conceptos, tipos de arquitecturas, componentes, vistas y modelos relacionados, cualidades\nsistémicas.\n• Arquitectura orientada a servicios (SOA, REST, GraphQL): conceptos, aplicaciones.\n• Arquitecturas Microservices y Serverless: conceptos, aplicaciones.\n• DevOps, integración continua: conceptos, aplicaciones.\n• Arquitectura cliente / servidor: concepto, 2 capas, 3 capas, N capas, aplicaciones distribuidas, clientes móviles, conceptos arquitectura REST.\n• Modelo Vista Controlador: concepto, aplicación\n• Vista de componentes: diagrama de componentes.\n• Vista física: diagrama de despliegue.\n• Documento de diseño: modelos, arquitectura candidata.'),
 (14,'22050109502',5,'Estructurar el modelo de datos del software de acuerdo con las especificaciones del análisis.',0,0,'• Modelo lógico de datos (Modelo Relacional): concepto, representación, cardinalidad, reglas de transformación de modelo conceptual a modelo\nlógico, restricciones, herramientas para el diseño de base de datos.\n• Bases de datos: conceptos, características, relacionales, no relacionales, motores.\n• Diccionario de datos: tipo de datos, tamaño de los datos, estándares de nombrado, restricciones y dominio de datos.\n• Normalización: conceptos, formas normales, ejemplos.\n• Seguridad de la Información: concepto, políticas, encriptación de datos, tratamiento de datos personales, niveles de acceso.\n• Big Data: conceptos, aplicaciones.'),
 (15,'22050109503',5,'Determinar las características técnicas de la interfaz gráfica del software adoptando estándares.',0,0,'Componente gráfico: Conceptos, características, teoría del color, usabilidad, accesibilidad, framework front-end, W3C, web semántica.\n• Diseño de interfaz para dispositivos móviles: conceptos, dispositivos, características, reglas de diseño.\n• Tipos de prototipado: conceptos, técnicas (bocetos, mapas de navegación, prototipos en papel, prototipos de software), herramientas de\napoyo, prototipado para aplicaciones web, stand-alone y móviles.'),
 (16,'22050109504',5,'Verificar los entregables de la fase de diseño del software de acuerdo con lo establecido en el informe de análisis.',0,0,'• Técnicas de evaluación: inspección, revisión.\n• Listas de chequeo: criterios de aceptación.\n• Prácticas de diseño: bajo acoplamiento y alta cohesión.\n• Informe de diseño: concepto, características, artefactos elaborados en la fase de diseño.\n• Técnicas de redacción de informes: documentación, organización de artefactos de diseño.'),
 (18,'22050109601',6,'Planear actividades de construcción del software de acuerdo con el diseño establecido.',0,0,'• Informe de Diseño: interpretación, análisis.\n• Herramientas de apoyo: versionamiento, control de cambios del código, integración continua.\n• Estándares de codificación: plantilla de estándar de código, (documentación de código, reglas de nombrado para variables, métodos, atributos, clases, tablas, campos, indentación)'),
 (19,'22050109602',6,'Construir la base de datos para el software a partir del modelo de datos.',0,0,'• Motores de bases de datos relacionales (Oracle, SQL Server, PostgreSQL, Mysql, MariaDB, SQLite): conceptos de sistema manejador de bases de datos - SMBD, licenciamiento, instalación,  instancias,\nconfiguración, sistema de archivos, objetos de la BD (tablas, relaciones,\níndices, vistas, procedimientos almacenados, restricciones), seguridad de\nla información, permisos, copias de seguridad, restauración de la BD.\n• NoSQL: (Redis, MongoDB): conceptos, instalación, consultas, documentos, colecciones, objetos.\n• SQL: sentencias DDL (create, alter, drop, truncate), DML (select, insert, update, delete, merge), DCL (revoke, grant), control de transacciones\n(commit, rollback), programación en SQL (cursores, procedimientos, funciones, triggers).'),
 (20,'22050109603',6,'Crear componentes front-end del software de acuerdo con el diseño.',0,0,'• Interfaz gráfica en aplicaciones de escritorio: formularios, objetos de un formulario, cuadros de dialogo, menús, barras de herramientas.\n• Interfaz gráfica en aplicaciones WEB: concepto, manejo de etiquetas, formularios, componentes del formulario, distribución, W3C, validador W3C, framework front-end (bootstrap).\n• Hojas de estilo: conceptos, sintaxis, usos.\n• JavaScript: sintaxis, librerías(jquery, modernizr), frameworks (angularJS, prototype, mootools).\n• Gestores de contenidos: conceptos, tipos, uso (wordpress, joomla).\n• Interfaz gráfica en aplicaciones móviles: dispositivos, plataformas, organización de contenidos, vistas, frameworks para desarrollo móvil.'),
 (21,'22050109604',6,'Codificar el software de acuerdo con el diseño establecido.',600,120,'• Lenguaje de programación orientado a objetos: C#, JAVA (SE, EE), PHP, Python, Ruby. Conceptos asociados al lenguaje, antecedentes, IDE,\nsintaxis, estructura general del lenguaje (estándar de código), aplicaciones, clientes personalizados para conexión a las bases de datos (cadenas de\nconexión), generación de reportes.\n• Editores de Código: características, instalación, uso (Visual Studio Code, Sublime Text, Atom, Brackets, Notepad ++).\n• Entornos de desarrollo / Frameworks: características, instalación, uso (Netbeans, Visual Studio .Net, Eclipse, Anaconda, Laravel, Ruby on Rails, Django, Vaadin).\n• Seguridad: SQL Injection, algoritmos de encriptación, firmas digitales, manejo de sesiones.\n• Servidores de Aplicaciones / Servidores Web: definiciones, tipos, usos (GlassFish, Apache, IIS, Node.js)\n• Servicios web: concepto, tipos (SOAP, RESTful), formato intercambio de datos (JSON, XML).\n• Cloud Computing: concepto, desarrollo en la nube (Plataformas Azure, AWS, Heroku, editores Cloud9, Función como Servicio FaaS AWS \nLambda).\n• Creación de APP: concepto, plataformas nativas (Android, IOS), SQLite, librerías de terceros.\n• Entornos de Desarrollo Móvil: concepto, plataformas (Kotlin, Swift, Ionic)\n• Internet de las cosas: Introducción, aplicaciones, desarrollos.\n• Blockchain: introducción, aplicaciones, desarrollos.\n• Machine learning: conceptos, aplicaciones, deep learning.\n• Control de versiones: herramientas para control de cambios en el código (GIT, GITHUB, Apache Subversion).'),
 (22,'22050109605',6,'Realizar pruebas al software para verificar su funcionalidad',0,0,'• Pruebas: conceptos, niveles, tipos, enfoques, plan de pruebas, diseño de casos de prueba, herramientas tecnológicas para pruebas, documentación\nde pruebas (unitarias, carga, estrés, integración).\n• Desarrollo guiado por Pruebas (TDD): Metodologías ágiles, Codificación y Pruebas.'),
 (23,'22050109701',7,'Planear actividades de implantación del software de acuerdo con las condiciones del sistema.',0,0,'● Hardware de servidores: rack, blade, arreglos de discos.\n● Software de servidores: tipos, características, licenciamiento, máquinas virtuales (Vmware), servidores de bases de datos.\n● Migración de datos: concepto, planes, copias de seguridad, procesos de restauración.\n● Sistemas operativos de servidores: concepto, características, tipos (linux, Windows server), licenciamiento, requisitos mínimos de instalación.\n● Ambientes distribuidos: conceptos, orientaciones, características.\n● Hosting y dominio: tipos, configuraciones, gestores de contenidos.\n● FTP: concepto, transferencia de archivos.'),
 (25,'22050109702',7,'Desplegar el software de acuerdo con la arquitectura y las políticas establecidas.',0,0,'● Contexto del ambiente de producción: ubicación de los servidores, sistema operativo de red, políticas de seguridad, configuración del sistema\n(servidores, clientes).\n● Distribución del software: procedimiento de liberación del software, organización de archivos\n● Cloud Computing: conceptos, diseño, tecnologías y principales herramientas para trabajar en la nube, Azure, AWS, Heroku, Node.js, servicios y\nproveedores cloud de relevancia, costos.'),
 (26,'22050109703',7,'Documentar el proceso de implantación de software siguiendo estándares de calidad.',0,0,'● Manuales: tipos (técnico, usuario e instalación), ayudas en línea, técnicas de presentación de trabajos escritos, Normas ICONTEC / APA, redacción, ortografía.\n● Informes técnicos: definición, características, contenido.'),
 (27,'22050109704',7,'Implantar el software de acuerdo con los niveles de servicio establecidos con el cliente.',0,0,'● Capacitación: técnicas de comunicación oral, planes de capacitación y elaboración de materiales de apoyo.\n● Actas de entrega: formato, diligenciamiento\n● Pruebas: aceptación, seguridad, rendimiento.'),
 (29,'22050109801',8,'Incorporar actividades de aseguramiento de la calidad del software de acuerdo con estándares de la industria.',0,0,'• Fundamentos de calidad: Conceptos, gestión de procesos,\n• Estándares de calidad para el desarrollo de software: Conjunto de normas ISO/IEC 25000 SQuaRE, ISO/IEC 15504, IEEE.\n• Modelos de Calidad de Software: CMMI\n• Metodologías de Desarrollo: Ágiles, tradicionales\n• Disciplinas de Calidad de Software: PSP Fundamentals, TSP\n• Administración del proceso personal de construcción de software: fundamentos, principios, niveles, scripts, formas, estándares, documentación, método PROBE, estadísticas, herramientas informáticas de apoyo.\n• Documentación: formatos, plantillas, estándares de documentación de procesos de calidad.'),
 (30,'22050109802',8,'Verificar la calidad del software de acuerdo con las prácticas asociadas en los procesos de desarrollo.',0,0,'• Evaluación de calidad: control de calidad, herramientas, documentación de hallazgos.\n• Evaluación de requisitos no funcionales: seguridad, usabilidad, accesibilidad, portabilidad, tiempos de respuesta, adaptabilidad, confiabilidad.\n• Gestión del Conocimiento: lecciones aprendidas, recomendaciones.'),
 (31,'22050109803',8,'Realizar actividades de mejora de la calidad del software a partir de los resultados de la verificación.',0,0,'• Planes de mejora: elaboración, acciones correctivas, preventivas y de mejoramiento, responsables, verificación y seguimiento.'),
 (32,'24020153001',9,'Identificar la dinámica organizacional del SENA y el rol de la formación profesional integral de acuerdo con su proyecto de vida y el desarrollo profesional.',38,10,'• Misión, visión, historia institucional, objetivos de la formación profesional, principios éticos, valores éticos y procederes éticos.\n• Elementos de la imagen institucional: escudo, bandera, logo símbolo, Himno, escarapelas.\n• Estructura organizacional del Servicio Nacional de aprendizaje SENA, políticas de bienestar a aprendices y normas de convivencia interna:\nAlternativas para el desarrollo de la etapa  productiva.\n• Etapas de la formación: tipología, características, procedimiento.\n• Manual de convivencia, norma específica de los centros.\nFormación profesional integral: Concepto, principios y características.\n• Tipos de oferta de programas de formación profesional y sus\ncaracterísticas.\n• Tipos de certificado de acuerdo con la formación y duración de los\nprogramas de formación.\n• Desarrollo de competencias en la formación profesional integral: Concepto,\ntipos y características.\n• Proyecto formativo: Concepto, fases, actividades, denominación, objetivos\n• Portafolio de evidencias: Estructura, tipos de evidencia, formato,\ncontenidos.\n• Plataformas tecnológicas SENA: Tutoriales Sena: LMS, Sofia plus, sistema virtual de aprendices (SVA), gestión contrato de aprendizaje. Correo Misena, portales, redes sociales de la entidad\n• Ruta de formación: etapa lectiva, etapa práctica (alternativas). Duración, características, requisitos, formatos, compromisos, evaluación y seguimiento, plan de mejora.\n• Proyecto de vida: Que es un proyecto de vida, como se formula, como se reescribe.'),
 (33,'24020151701',18,'Identificar modelos matemáticos de acuerdo con los\nrequerimientos del problema planteado en contextos\nsociales y productivo.',10,2,'• Números Reales: Concepto, representaciones (fracciones, razones, decimales, porcentajes) y propiedades.\n• Números Complejos: Concepto, representaciones y operaciones\n• Operaciones aritméticas: Propiedades y Orden de las operaciones.\n• Proporcionalidad Directa e Inversa: Concepto y Regla de Tres'),
 (34,'24020151702',18,'Plantear problemas matemáticos a partir de\nsituaciones generadas en el contexto social y\nproductivo.',10,2,'Geometría: Conceptos, polígonos, la circunferencias y sólidos\n• Trigonometría: Conceptos, Razones, Teoremas y aplicaciones\n• Ecuaciones: Métodos de solución\n• Sistemas de Ecuaciones: Concepto, tipos y métodos de solución.\n• Funciones: Concepto, representaciones y tipos (polinómicas, exponenciales, trigonométricas, etc.)'),
 (35,'24020151703',18,'Resolver problemas matemáticos a partir de\nsituaciones generadas en el contexto social y\nproductivo',10,2,'• Variables Estadísticas: Concepto y tipos\n• Estadística Descriptiva: Medidas de Centralidad (Media, Moda y Mediana) y Medidas de Dispersión (Varianza y Desviación Estándar)\n• Gráficos Estadísticos: Diagrama de Barras, Circular, Pictogramas y Series'),
 (36,'24020151704',18,'Proponer acciones de mejora frente a los resultados\nde los procedimientos matemáticos de acuerdo con\nel problema planteado',10,2,'• Teorema de Pitágoras y Thales: Concepto y aplicaciones\n• Conversión de unidades y sistema de medidas.\n• Semejanza y congruencia de superficies y cuerpos.\n• Transformaciones sobre polígonos: Rígidas (traslaciones, rotaciones, reflexiones) y Homotecias (ampliaciones y reducciones).\n• Derivada e Integral de una función: Concepto y reglas\n• Hojas de Cálculo: Concepto, Sintaxis y Aplicaciones'),
 (37,'22020150101',10,'Identificar los principios y leyes de la física en la solución de problemas de\nacuerdo al contexto productivo.',10,2,'• Física: concepto y aplicaciones\n• Observación: Métodos, técnicas, atributos, aplicaciones y usos.\n• Experimentación: Métodos, técnicas, atributos, aplicaciones y usos.'),
 (39,'22020150102',10,'Solucionar problemas asociados con el sector productivo con base en los\nprincipios y leyes de la física.',10,2,'• Materia: concepto, características y estados\n• Magnitudes físicas: concepto, características y tipos\n• Sistemas de unidades: concepto, equivalencias y tipos.'),
 (40,'22020150103',10,'Verificar las transformaciones físicas de la materia utilizando herramientas tecnológicas.',10,2,'• Máquinas: concepto y tipos.\n• Movimiento: concepto, leyes, principios, características y tipos\n• Energía: concepto, leyes, principios, manifestaciones y tipos'),
 (42,'22020150104',10,'Proponer acciones de mejora en los procesos productivos de acuerdo con los principios y leyes de la física.',10,2,'• Sistemas termodinámicos: conceptos y aplicaciones.\n• Ondas: concepto, características, tipos\n• Física moderna: Concepto, clasificación y aplicaciones.'),
 (43,'22050104601',19,'Alistar herramientas de tecnologías de la información y la comunicación (TIC), de acuerdo con las necesidades de procesamiento de información y comunicación.',10,2,'Tecnología: Concepto, tipos, características.\n• Herramientas TIC: Clases, características, usos\n• Tecnologías de la información y la comunicación: Concepto, componentes, características, clasificación, usos, tendencias.\n• Equipos y periféricos TIC:\n• Computador: Concepto, arquitectura, funcionamiento, tipos, características.\n• Periféricos: Concepto, clasificación, características, funcionamiento.\n• Otros (Tabletas, equipos móviles, reproductores de medios electrónicos):\nConcepto, funcionamiento, tipos, características'),
 (45,'22050104602',19,'Aplicar funcionalidades de herramientas y servicios TIC, de acuerdo con manuales de uso, procedimientos establecidos y buenas prácticas.',10,2,'• Redes de datos: Concepto, conectividad, tipos, características, usos, servicios.\n• Software: Concepto, herramientas, funciones, propiedades.\n• Tipos de Software:\n• Software de sistema (Sistema operativo): Concepto, clases, funciones, características, usos.'),
 (47,'22050104603',19,'Evaluar los resultados, de acuerdo con los requerimientos.',10,2,'Software de aplicación (Procesador de texto, hoja de cálculo, programa de presentación, base de datos, diagramación, software específico):\nconcepto, clases, funciones, características, usos.\n• Software de desarrollo: concepto, clases, funciones, características, usos.\n• Internet: Definición, historia, evolución, arquitectura, utilidades.\n• Conexión: Tipos, configuración, características.\n• Herramientas colaborativas.'),
 (49,'22050104604',19,'Optimizar los resultados, de acuerdo con la verificación',10,2,'• Servicios de Internet: (Navegación, correo electrónico, transferencia de archivos, búsquedas, listas de correos, grupos de noticias, chats, blogs, wikis, foros web, spaces, redes sociales, intercambio de archivos P2P, telefonía VoIP, televisión IPTV, comprar en Internet, E-learning, marketing digital, trabajo colaborativo, computación en la nube): Concepto, requerimientos, tipos, utilidades, aplicaciones, ventajas, desventajas.\n• Verificación de resultados: Objeto, técnicas.\n• Optimización: Definición, objeto, implementación.'),
 (50,'24020152401',12,'Analizar los componentes de la comunicación según sus características, intencionalidad y contexto.',10,2,'• Comunicación: Concepto, tipos, usos, medios, canales, técnicas, procesos características, escenarios, componentes, funciones, barreras, niveles.\n• Expresión corporal: Concepto, características, gestos, posturas, emociones, sentimientos\n• Actos de habla: Concepto, percepción, observación, escucha activa, comunicación verbal y no verbal.'),
 (51,'24020152402',12,'Argumentar en forma oral y escrita atendiendo las exigencias y particularidades de las diversas situaciones comunicativas mediante los distintos sistemas de representación.',10,2,'• Comprensión de Textos: Concepto, técnicas, procesos, niveles, características, interpretación, elementos.\n• Redacción de Textos: Tipos, usos, clases, partes, forma, contenido, intencionalidad, técnicas, métodos, cohesión, coherencia, sintaxis, ortografía, signos de puntuación, semántica, principios y cualidades.\n• La Argumentación: Concepto, procesos, elementos, características, la pregunta, la tesis, el argumento, la conclusión, la síntesis.'),
 (52,'24020152403',12,'Relacionar los procesos comunicativos teniendo en cuenta criterios de lógica y racionalidad.',10,2,'• La Proposición: Concepto, procesos, elementos, características.\n• El estilo: Concepto, características, aplicación.\n• Carácter convencional y función social de los signos: Concepto, tipos, relaciones, usos, carácter, interpretación, características, contexto, elementos básicos de la semiótica y semiología.'),
 (53,'24020152404',12,'Establecer procesos de enriquecimiento lexical y acciones de mejoramiento en el desarrollo de procesos comunicativos según requerimientos del contexto.',10,2,'• Procesos de pensamiento: Concepto, análisis, síntesis, proposición, argumentación.\n• Consulta y lectura: Métodos, técnicas selección, organización y archivo de información en diversas fuentes, niveles, estrategias.\n• Normatividad: Normas Icontec para la elaboración de textos escritos.'),
 (55,'23010150701',15,'Desarrollar habilidades psicomotrices en el contexto productivo y social.',10,2,'• Fundamentos de Anatomía y Fisiología\n• Conceptos, características y Estilos de Vida saludable\n• Conceptos de Higiene y su aplicabilidad\n• Conceptos de Nutrición, bases fundamentales y planes nutricionales según actividad laboral.'),
 (56,'23010150702',15,'Practicar hábitos saludables mediante la aplicación de fundamentos de nutrición e higiene.',10,2,'• Fundamentos de Miología y análisis del movimiento\n• Definición, características, componentes y ventajas de la Actividad Física\n• Definición, clases, condición, tiempos de aplicación, beneficios del Ejercicio Físico\n• Conceptualización y uso de la Ficha antropométrica\n• Características de la frecuencia cardíaca\n• Definición, clases y características de los Test físico atléticos.\n• Definición y características del Acondicionamiento Físico'),
 (57,'23010150703',15,'Ejecutar actividades de acondicionamiento físico orientadas hacia el mejoramiento de la condición física en los contextos productivo y social.',10,2,'• Aplicación de series, repeticiones y cargas de trabajo en el ejercicio físico\n• Definición y características de la destreza motora\n• Conceptualización y condicionantes de la Psicomotricidad\n• Definición de Motricidad y su clasificación, beneficios.'),
 (58,'23010150704',15,'Implementar un plan de Ergonomía y Pausas Activas según las características de la función productiva.',10,2,'• Aplicabilidad de la Ergonomía y la actividad física\n• Posturas, clasificación, manejo de cargas y planes posturales\n• Rehabilitación y plan de trabajo\n• Pausas Activas, conceptos y prácticas\n• Uso adecuado del tiempo libre'),
 (60,'24020152501',16,'Integrar elementos de la cultura emprendedora teniendo en cuenta el perfil personal y el contexto de desarrollo social',10,2,'• Emprendimiento: Concepto, características, habilidades, tipos, perfil emprendedor, Responsabilidad, comunicación asertiva, autogestión, autonomía, principios y valores éticos.\n• Ideación, Concepto, metodologías, técnicas y herramientas.\n• Problema, Conceptos, estructura de problema, alternativas creativas de solución.'),
 (62,'24020152502',16,'Caracterizar la idea de negocio teniendo en cuenta las oportunidades y necesidades del sector productivo y social',10,2,'• Ideas y oportunidades de negocio, modelaje de ideas,\n• Validación temprana de mercados, innovación, creatividad, proceso creativo.\n• Empresa, Concepto, características, estructura, tipología, áreas funcionales, formalización'),
 (63,'24020152503',16,'Estructurar el plan de negocio de acuerdo con las características empresariales y tendencias de mercado',10,2,'• Mercados, Concepto, tipos, estructura, características productividad, competitividad.\n• Estructura operacional, Concepto, producto, proceso, infraestructura física, requerimientos técnicos, tecnológicos y humanos.\n• Estructura organizacional, Concepto, tipología, estructura orgánica.'),
 (64,'24020152504',16,'Valorar la propuesta de negocio conforme con su estructura y necesidades del sector productivo y social',10,2,'• Planeación estratégica.\n• Finanzas, Concepto, tipos, estructura básica, tendencia y prospectiva.\n• Gestión empresarial, Concepto, habilidades, destrezas, niveles, estructura, control y evaluación'),
 (65,'22060150101',11,'Analizar las estrategias para la prevención y control de los impactos\nambientales y de los accidentes y enfermedades laborales (ATEL) de acuerdo con las políticas organizacionales y el entorno social.',10,2,'• Medio ambiente: concepto, componentes, conservación, aspectos e impactos ambientales, normatividad básica legal.\n• Aspectos e impactos ambientales: Concepto, características, clases según el contexto social y productivo, problemática ambiental asociada y legislación aplicable\n• Impactos ambientales: concepto, clases, medidas de manejo ambiental.\n• Políticas ambientales y de SST: concepto, características, alcance y clases.\n• Planes de manejo y gestión ambiental: Objeto, aplicación y estructura.\n• Planes y programas de gestión de SST: Objeto, aplicación y estructura.'),
 (66,'22060150102',11,'Implementar estrategias para el control de los impactos ambientales y de los accidentes y enfermedades de acuerdo con los planes y\nprogramas establecidos por la organización.',10,2,'• Sistema de Gestión y seguridad y salud en el trabajo: conceptos generales y marco básico legal, derechos y deberes.\n• Directrices y requisitos internos del Sistema de seguridad y salud en el trabajo: Reglamento de higiene y seguridad industrial, reglamento interno\nde trabajo, procedimientos de trabajo seguro, programas, política de seguridad salud en el trabajo y políticas de prevención de alcohol y\nsustancias psicoactivas.\n• Peligros de seguridad y salud en el trabajo propios del sector económico:\nconcepto, características, clases, efectos a la salud, mecanismos de control y normatividad.'),
 (67,'22060150103',11,'Realizar seguimiento y acompañamiento al desarrollo de los planes y programas ambientales y SST, según el área de desempeño.',10,2,'• Lesiones y enfermedades propias del sector económico:\nconceptos, clases, causas y características.\n• Consecuencias de los actos estándar y sub estándar en el ambiente laboral: concepto y consecuencias.\n• Medidas de manejo ambiental: concepto, prevención, control y mitigación, estrategias de implementación.\n• Plan de emergencias y contingencias: concepto, clases, objeto, alcance y estructura básica.'),
 (68,'22060150104',11,'Proponer acciones de mejora para el manejo ambiental y el control de la SST, de acuerdo con estrategias de trabajo, colaborativo, cooperativo y coordinado en el contexto productivo y social.',10,2,'• Directrices y requisitos internos del Sistema de seguridad y salud en el trabajo: Reglamento de higiene y seguridad industrial, reglamento interno de trabajo, procedimientos de trabajo seguro, programas, política de seguridad salud en el trabajo y políticas de prevención de alcohol y sustancias psicoactivas.\n• Monitoreo y seguimiento: concepto, métodos y documentación asociada.\n• Evidencias de cumplimiento a los programas ambientales y de SST: concepto, clases y características.'),
 (69,'24020152601',14,'Promover mi dignidad y la del otro a partir de los principios y valores éticos como aporte en la instauración de una cultura de paz',10,2,'• Hombre: concepto, sujeto moral, sujeto ético\n• Naturaleza humana: Concepto\n• Dignidad humana: Concepto\n• Actos humanos: Concepto\n• Acciones Humanas: Concepto\n• Libertad: Concepto\n• Ley Natural: Concepto\n• Ley Positiva: Concepto, aplicaciones\n• Moral: Concepto\n• Axiología: Concepto, Jerarquía de Valores'),
 (70,'24020152602',14,'Establecer relaciones de crecimiento personal y comunitario a partir del bien común como aporte para el desarrollo social.',10,2,'• Ética: Concepto.\n• Ética Aplicada: concepto, características\n• Hombre: Concepto, ser relacional.\n• Trabajo: Concepto, sistema de relaciones.\n• Relaciones sociales: Concepto, clases.\n• Reconciliación: concepto, condiciones.\n• Trabajo en Equipo: contextualización, alcance, técnicas, fundamentos y ventajas'),
 (71,'24020152603',14,'Promover el uso racional de los recursos naturales a partir de criterios de sostenibilidad y sustentabilidad ética y normativa vigente',10,2,'• Resolución de Conflictos: contextualización, destrezas, técnicas y teorías.\n• Comunicación Asertiva: contextualización, estrategias, fundamentos, tipos y técnicas.\n• Liderazgo: Concepto, tendencias y generalidades.\n• Inteligencia Emocional: Concepto, alcance y técnicas.\n• Coaching: Concepto, alcance y técnicas básicas.\n• Programación Neurolingüística: Concepto, alcance, técnicas básicas.\n• Toma de Decisiones: Concepto, modelos, estratégicas y análisis estratégico y alcance'),
 (72,'24020152604',14,'Contribuir con el fortalecimiento de la cultura de paz a partir de la dignidad humana y las estrategias para la transformación de conflictos',10,2,'• Relaciones Interpersonales: Concepto y alcance\n• Contexto del Conflicto: Concepto, contexto social y político, conflicto armado.\n• Paz: Concepto\n• Violencia: Concepto\n• Conflicto: Concepto, hitos de la historia\n• Respeto: Concepto\n• Familia: Concepto\n• Diálogo: Concepto\n• Concertación: Concepto\n• Justicia: Concepto, clases\n• Equidad: Concepto, aplicaciones\n• Gobierno: Concepto, Formas\n• Sociedad: Concepto\n• Estado: Concepto\n• País: Concepto\n• Constitución: Concepto\n• Gobernalidad: Concepto\n• Democracia: Concepto, Clases\n• Convivencia: Concepto\n• Libertad: Concepto\n• Criticidad: Concepto\n• Negociación frente al conflicto\n• Reparación: Concepto\n• Reintegración: concepto, ruta\n• Derechos humanos: Concepto, Normativa Vigente\n• Derecho internacional humanitario: Concepto, Normativa Vigente\n• Autoestima, autonomía, autocontrol, autocuidado\n• Comunicación: Acción Instrumental, Acción Estratégica y Acción Comunicativa.\n• Habilidades para la vida y para la convivencia: Autoconocimiento, Empatía, Comunicación asertiva, Relaciones interpersonales, Toma de decisiones, Solución de problemas y de conflictos, pensamiento creativo, pensamiento crítico, manejo de emociones y sentimientos, manejo de\ntensiones y estrés.'),
 (73,'21020150101',13,'Valorar la importancia de la ciudadanía laboral con base en el estudio de los derechos humanos y fundamentales del trabajo.',10,2,'1. Persona sociedad y Trabajo\n• Dignidad humana, democracia, el trabajo, Justicia y paz.\n• Desarrollo humano integral.\n• Diversidad cultural\n• Fenomenología del mundo del trabajo\n2. Leyes fundamentales y mandatos legales\n• Política. Derechos humanos y Constitución Política de Colombia.\n• Principios y derechos de la OIT: Declaración de la O.I.T.\n• Derecho a la vida.\n• Derechos políticos y civiles.\n• Trabajo digno y decente: Definición, análisis del trabajo forzoso u obligatorio.'),
 (74,'21020150102',13,'Practicar los derechos fundamentales del trabajo de acuerdo con la Constitución Política y los convenios Internacionales.',10,2,'3. Derechos del trabajo y Ciudadanía laboral\n• Derechos del trabajo y su impacto en el desarrollo de la sociedad\n• Dialogo social\n• Persona sujeto de derechos y deberes en el contexto de los derechos humanos\n• Derechos individuales y colectivos del trabajo: Características y campos para el desarrollo del\n• derecho individual y colectivo en el mundo del trabajo\n• Mecanismos de protección de los derechos del trabajo.\n• Trabajo Decente: Integración de políticas\n• Igualdad de género: equidad y balance de género\n• Trabajo forzado y Trabajo Infantil\n• Enfoque diferencial, valor ciudadano para la inclusión social\n• Discriminación laboral en casos de enfermedades terminales\n• Resolución pacífica de los conflictos; negociación colectiva y huelga\n• Derechos para la sostenibilidad empresarial: Eficiencia, Eficacia, Efectividad.'),
 (75,'21020150103',13,'Reconocer el trabajo como uno de los elementos primordiales para la movilidad social y la transformación vital.',10,2,'4. Ejercicio de los derechos del trabajo.\n• Aplicación de los mecanismos de protección de los derechos del trabajo\nCaja de herramientas laborales: salario, prestaciones sociales, seguridad social y contratación.\n• Sociedad del Ocio: recreación, deporte, arte cultura, vida familiar.\n• Derechos y libertades ciudadanas.\n5. Derecho a la Asociación, normatividad nacional e internacional.\n• Valores democráticos sobre el sindicalismo. normatividad nacional e internacional\n• Asociaciones sindicales, libertad sindical y derechos asociados.\n• Libertad de Asociación y Libertad de asociación y Sindical\n• Derecho de Negociación Colectiva:, agentes, reconocimiento de la asociación para resolver problemas.'),
 (76,'21020150104',13,'Participar en acciones solidarias orientadas al ejercicio de los derechos humanos, de los pueblos y de la naturaleza.',10,2,'6. Derechos de Solidaridad o de los Pueblos\n• Relación entre el ser humano, la naturaleza y el planeta.\n• Autodeterminación de los pueblos y desarrollo sostenible y seguridad alimentaria.\n• Estrategias de desarrollo e impacto ambiental en Colombia.\n• Postconflicto y paz\n• Apropiación del avance y uso de la ciencia y la tecnología.\n• El desarrollo que permita una vida digna\n• Identidad Nacional y Cultural.'),
 (77,'24020106401',17,'Analizar el contexto productivo según sus características y necesidades',10,2,'• Conocimiento: concepto, tipos\n• Cosmovisión: concepto, perspectivas e importancia.\n• Investigación: conceptos y enfoques'),
 (78,'24020106402',17,'Estructurar el proyecto de acuerdo a criterios de la investigación.',10,2,'• Metodologías, métodos y técnicas de investigación: conceptos y tipos\n• Proyectos de investigación: concepto, tipos, estructuras y procedimientos.\n• Ideas, problemas y preguntas de investigación'),
 (79,'24020106403',17,'Argumentar aspectos teóricos del proyecto según referentes nacionales e internacionales',10,2,'• Justificación: concepto, componentes\n• Objetivos de investigación: concepto, tipos\n• Fuentes de información: definición, tipos y referenciación'),
 (80,'24020106404',17,'Proponer soluciones a las necesidades del contexto según resultados de la investigación.',10,2,'• Marco teórico: concepto, tipos\n• Informe de investigación: características, tipos'),
 (81,'24020250101',20,'Comprender información sobre situaciones cotidianas y laborales actuales y futuras a través de interacciones sociales de forma oral y escrita.',10,2,'• Presente simple y presente continuo\n• Presente continuo: (Uso para planes y acuerdos)\n• Pronombres posesivos\n• Preposiciones de lugar (revisión)\n• Preposiciones de movimiento\n• Adjetivos\n• Comparativos\n• Formas verbales en el Pasado simple ( regular verbs and irregular verbs)\n• Used to\n• Pasado continuo\n• Pasado simple y pasado continuo\n• Futuro con las fórmulas: Will, be going to\n• Diferencia entre el presente perfecto y pasado simple.'),
 (82,'24020250102',20,'Intercambiar opiniones sobre situaciones cotidianas y laborales actuales, pasadas y futuras en contextos sociales orales y escritos.',10,2,'• Condicional Zero y First\n• Would rather (Uso y contexto)\n• Had better, should , I think (that), I consider (that), must, could.\n• Superlativos (Uso y contexto)\n• Adverbios de forma y manera\n• Conectores\n• Verbos frasales comunes\n• Cláusulas de relativo\n• Imperativo para dar instrucciones\n• Condicional Zero (if, when)\n• Vocabulario'),
 (83,'24020250103',20,'Discutir sobre posibles soluciones a problemas dentro de un rango variado de contextos sociales y laborales.',10,2,'• Cláusulas de relativo\n• Imperativo para dar instrucciones\n• Condicional Zero (if, when)\n• Vocabulario\n• Actividades del tiempo libre.\n• Celebraciones, costumbres y tradiciones.\n• Cuartos, lugares en una casa y sus objetos\n• Tiendas y lugares en la ciudad y los pueblos\n• Edificaciones y construcciones\n• Apariencia de las personas\n• Comportamientos y personalidades\n• Cualidades y defectos personales\n• Expresiones de tiempo en el pasado y futuro.\n• Reuniones familiares, actividad'),
 (87,'24020250104',20,'Implementar acciones de mejora relacionadas con el uso de expresiones, estructuras y desempeño según los resultados de aprendizaje formulados para el programa.',10,2,'• When y While\n• Números ordinales y cardinales\n• Conectores (Meanwhile, Suddenly, However, then, after)\n• Eventos formales (Congresos, Conferencias)\n• Preposiciones de tiempo (in, on , at) en diferentes contextos.\n• Adverbios (Yet, Still, Ever, Already, Just, Lately)\n• Since, For y Ago\n• Vocabulario de viajes\n• Fenómenos naturales\n• Expresiones de cortesía para intercambiar opiniones\n• Expresiones idiomáticas comunes en contextos laborales.\n• Terminología técnica ocupacional\n• Tecnologías de la Información y la Comunicación\n• Conectores de secuencia'),
 (88,'24020250105',20,'Presentar un proceso para la realización de una actividad en su quehacer laboral de acuerdo con los procedimientos establecidos desde su programa de formación.',10,2,'• Vocabulario y expresiones relacionadas con las funciones en el área ocupacional\n• Electrodomésticos, maquinaria, insumos y equipamiento\n• Lugares de trabajo\n• Pronunciación\n• Sujeto + contracciones con auxiliares\n• Acentuación en frases (contenido y funciones de las palabras)\n• Regla de Pronunciación -‐ ED ending, voiced consonants vs voiceless consonants.'),
 (89,'24020250106',20,'Explicar las funciones de su ocupación laboral usando expresiones de acuerdo al nivel requerido por el programa de formación.',10,2,'• Entonación de fonemas de sustantivos plurales.\n• Fonemas vocálicos\n• Diferencia entre el sonido TH /θ/ y /ð/\n• Entonación para presentar información nueva.\n• Acentuación en frases (contenido y funciones de las palabras)\n• Acentuación de énfasis\n• Reducción vocálica\n• International Phonetic Alphabet (Reconocimiento de los símbolos y su pronunciación)\n• Elevación y caída de la entonación en diferentes tipos de frases\n• Conexión y elisión de sonidos con los superlativos');
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
