SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema wanagow
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wanagow` DEFAULT CHARACTER SET latin1 ;
USE `wanagow` ;

-- -----------------------------------------------------
-- Table `wanagow`.`Academica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Academica` (
  `idAcademica` INT(11) NOT NULL AUTO_INCREMENT,
  `academica` TINYINT(1) NOT NULL,
  `areaestudio` TINYINT(1) NOT NULL,
  `congresos` TINYINT(1) NOT NULL,
  `convenciones` TINYINT(1) NOT NULL,
  `seminarios` TINYINT(1) NOT NULL,
  `talleres` TINYINT(1) NOT NULL COMMENT '	',
  `diplomados` TINYINT(1) NOT NULL,
  `cursos` TINYINT(1) NOT NULL,
  `conferencias` TINYINT(1) NOT NULL COMMENT '	',
  `expos` TINYINT(1) NOT NULL,
  `idPreferencia` INT(11) NOT NULL,
  PRIMARY KEY (`idAcademica`),
  UNIQUE INDEX `idAcademia_UNIQUE` (`idAcademica` ASC),
  INDEX `fk_Academia_Preferencias1_idx` (`idPreferencia` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Administradores` (
  `idAdministrador` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuarios` INT(11) NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  UNIQUE INDEX `idAdministrador_UNIQUE` (`idAdministrador` ASC),
  INDEX `fk_Administradores_Usuarios1_idx` (`idUsuarios` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Calendario` (
  `idCliente` INT(11) NOT NULL,
  `idEvento` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  INDEX `fk_Calendario_Clientes1_idx` (`idCliente` ASC),
  INDEX `fk_Calendario_Eventos1_idx` (`idEvento` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Clientes` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC),
  INDEX `fk_Clientes_Usuarios1_idx` (`idUsuario` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 87
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`ClientesPreferencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`ClientesPreferencias` (
  `idCliente` INT(11) NOT NULL,
  `idPreferencia` INT(11) NOT NULL,
  PRIMARY KEY (`idCliente`, `idPreferencia`),
  INDEX `fk_Clientes_has_Preferencias_Preferencias1` (`idPreferencia` ASC),
  INDEX `fk_Clientes_has_Preferencias_Clientes1_idx` (`idCliente` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Cultural`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Cultural` (
  `idCultural` INT(11) NOT NULL AUTO_INCREMENT,
  `cultural` TINYINT(1) NOT NULL,
  `balletdanza` TINYINT(1) NOT NULL COMMENT '	',
  `teatro` TINYINT(1) NOT NULL,
  `comedia` TINYINT(1) NOT NULL,
  `drama` TINYINT(1) NOT NULL,
  `infantilC` TINYINT(1) NOT NULL,
  `musical` TINYINT(1) NOT NULL,
  `otrosT` TINYINT(1) NOT NULL,
  `circos` TINYINT(1) NOT NULL COMMENT '	',
  `exposiciones` TINYINT(1) NOT NULL,
  `fotografia` TINYINT(1) NOT NULL COMMENT '	',
  `escultura` TINYINT(1) NOT NULL COMMENT '	',
  `pintura` TINYINT(1) NOT NULL,
  `libros` TINYINT(1) NOT NULL,
  `otrosE` TINYINT(1) NOT NULL,
  `cineArte` TINYINT(1) NOT NULL,
  `musica` TINYINT(1) NOT NULL,
  `clasica` TINYINT(1) NOT NULL,
  `instrumental` TINYINT(1) NOT NULL,
  `folklorepopular` TINYINT(1) NOT NULL,
  `turistico` TINYINT(1) NOT NULL,
  `ferias` TINYINT(1) NOT NULL,
  `carnavales` TINYINT(1) NOT NULL,
  `peregrinaciones` TINYINT(1) NOT NULL,
  `fiestasReligiosasIndigenas` TINYINT(1) NOT NULL,
  `otrosTuristica` TINYINT(1) NOT NULL,
  `idPreferencia` INT(11) NOT NULL,
  PRIMARY KEY (`idCultural`),
  UNIQUE INDEX `idCultural_UNIQUE` (`idCultural` ASC),
  INDEX `fk_Cultural_Preferencias1_idx` (`idPreferencia` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Destinos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Destinos` (
  `idDestino` INT(11) NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `codigoPostal` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  PRIMARY KEY (`idDestino`),
  UNIQUE INDEX `iddestino_UNIQUE` (`idDestino` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Entretenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Entretenimiento` (
  `idEntretenimiento` INT(11) NOT NULL AUTO_INCREMENT,
  `entretenimiento` TINYINT(1) NOT NULL,
  `conciertos` TINYINT(1) NOT NULL,
  `electronica` TINYINT(1) NOT NULL,
  `jazzblues` TINYINT(1) UNSIGNED NOT NULL,
  `trova` TINYINT(1) NOT NULL,
  `rock` TINYINT(1) NOT NULL,
  `alternativa` TINYINT(1) NOT NULL,
  `gruperanortena` TINYINT(1) NOT NULL,
  `infantilE` TINYINT(1) NOT NULL,
  `hiphop` TINYINT(1) NOT NULL,
  `ranchera` TINYINT(1) NOT NULL,
  `pop` TINYINT(1) NOT NULL,
  `metal` TINYINT(1) NOT NULL,
  `reague` TINYINT(1) NOT NULL,
  `reggeatton` TINYINT(1) NOT NULL,
  `baladasboleros` TINYINT(1) NOT NULL,
  `salsacumbia` TINYINT(1) NOT NULL,
  `cristiana` TINYINT(1) NOT NULL,
  `deportes` TINYINT(1) NOT NULL COMMENT '	',
  `futbol` TINYINT(1) NOT NULL,
  `basquetball` TINYINT(1) NOT NULL,
  `tenis` TINYINT(1) NOT NULL COMMENT '	',
  `beisball` TINYINT(1) NOT NULL,
  `volleyball` TINYINT(1) NOT NULL,
  `torneos` TINYINT(1) NOT NULL,
  `maratones` TINYINT(1) NOT NULL,
  `autosmotos` TINYINT(1) NOT NULL,
  `futbolAmericano` TINYINT(1) NOT NULL,
  `artesMarciales` TINYINT(1) NOT NULL,
  `boxE` TINYINT(1) NOT NULL,
  `luchaLibre` TINYINT(1) NOT NULL,
  `atletismo` TINYINT(1) NOT NULL,
  `toros` TINYINT(1) NOT NULL,
  `baresantros` TINYINT(1) NOT NULL,
  `inaguracion` TINYINT(1) NOT NULL,
  `promocion` TINYINT(1) NOT NULL,
  `showE` TINYINT(1) NOT NULL,
  `fiestasTematicas` TINYINT(1) NOT NULL,
  `bienvenida` TINYINT(1) NOT NULL,
  `idPreferencia` INT(11) NOT NULL,
  PRIMARY KEY (`idEntretenimiento`),
  UNIQUE INDEX `idEntretenimiento_UNIQUE` (`idEntretenimiento` ASC),
  INDEX `fk_Entretenimiento_Preferencias1_idx` (`idPreferencia` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Eventos` (
  `idEvento` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `descripcion` TEXT CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `fechaEvento` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `costo` FLOAT NOT NULL,
  `activo` TINYINT(1) NOT NULL,
  `imagen` TEXT CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `idPromotor` INT(11) NOT NULL,
  `idTipoEvento` INT(11) NOT NULL,
  `idDestino` INT(11) NOT NULL,
  PRIMARY KEY (`idEvento`),
  UNIQUE INDEX `idEventos_UNIQUE` (`idEvento` ASC),
  INDEX `fk_Eventos_Promotores1_idx` (`idPromotor` ASC),
  INDEX `fk_Eventos_TiposEventos1_idx` (`idTipoEvento` ASC),
  INDEX `fk_Eventos_destino1_idx` (`idDestino` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Origenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Origenes` (
  `idorigen` INT(11) NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  PRIMARY KEY (`idorigen`),
  UNIQUE INDEX `idorigen_UNIQUE` (`idorigen` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Preferencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Preferencias` (
  `idPreferencia` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idPreferencia`),
  UNIQUE INDEX `idPreferencias_UNIQUE` (`idPreferencia` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 87
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Promotores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Promotores` (
  `idPromotor` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idPromotor`),
  UNIQUE INDEX `idPromotores_UNIQUE` (`idPromotor` ASC),
  INDEX `fk_Promotores_Usuarios1_idx` (`idUsuario` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Rutas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Rutas` (
  `idRuta` INT(11) NOT NULL AUTO_INCREMENT,
  `longituud` FLOAT NOT NULL,
  `latitud` FLOAT NOT NULL,
  `idDestino` INT(11) NOT NULL,
  `idOrigen` INT(11) NOT NULL,
  PRIMARY KEY (`idRuta`),
  UNIQUE INDEX `idRutas_UNIQUE` (`idRuta` ASC),
  INDEX `fk_Rutas_destino1_idx` (`idDestino` ASC),
  INDEX `fk_Rutas_origen1_idx` (`idOrigen` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`TiposEventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`TiposEventos` (
  `idTipoEvento` INT(11) NOT NULL AUTO_INCREMENT,
  `tipoEvento` VARCHAR(45) NOT NULL,
  `detallesEvento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoEvento`),
  UNIQUE INDEX `idTiposEventos_UNIQUE` (`idTipoEvento` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 78
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wanagow`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wanagow`.`Usuarios` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `apellidos` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `genero` TINYINT(1) NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `password` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL,
  `activo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuarios_UNIQUE` (`idUsuario` ASC))
ENGINE = MyISAM
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
