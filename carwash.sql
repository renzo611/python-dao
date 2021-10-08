-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema carwash
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `carwash` ;

-- -----------------------------------------------------
-- Schema carwash
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carwash` DEFAULT CHARACTER SET utf8 ;
USE `carwash` ;

-- -----------------------------------------------------
-- Table `carwash`.`empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carwash`.`empleados` ;

CREATE TABLE IF NOT EXISTS `carwash`.`empleados` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `nombre_emp` VARCHAR(150) NOT NULL,
  `legajo` INT NOT NULL,
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `legajo_UNIQUE` ON `carwash`.`empleados` (`legajo` ASC);


-- -----------------------------------------------------
-- Table `carwash`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carwash`.`clientes` ;

CREATE TABLE IF NOT EXISTS `carwash`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre_cli` VARCHAR(450) NOT NULL,
  `domicilio` VARCHAR(250) NULL,
  `barrio` VARCHAR(250) NULL,
  `documento` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `documento_UNIQUE` ON `carwash`.`clientes` (`documento` ASC);


-- -----------------------------------------------------
-- Table `carwash`.`vehiculos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carwash`.`vehiculos` ;

CREATE TABLE IF NOT EXISTS `carwash`.`vehiculos` (
  `idvehiculo` INT NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(425) NULL,
  `modelo` VARCHAR(425) NULL,
  `idcliente` INT NULL,
  PRIMARY KEY (`idvehiculo`),
  CONSTRAINT `vehi_cli_fk`
    FOREIGN KEY (`idcliente`)
    REFERENCES `carwash`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `matricula_UNIQUE` ON `carwash`.`vehiculos` (`matricula` ASC);

CREATE INDEX `vehi_cli_fk_idx` ON `carwash`.`vehiculos` (`idcliente` ASC);


-- -----------------------------------------------------
-- Table `carwash`.`turnos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carwash`.`turnos` ;

CREATE TABLE IF NOT EXISTS `carwash`.`turnos` (
  `idturno` INT NOT NULL AUTO_INCREMENT,
  `idvehiculo` INT NOT NULL,
  `fecha` DATETIME NULL,
  `idempleado` INT NOT NULL,
  `precio` DECIMAL(5,2) NULL,
  PRIMARY KEY (`idturno`),
  CONSTRAINT `idvehi_turno_fk`
    FOREIGN KEY (`idvehiculo`)
    REFERENCES `carwash`.`vehiculos` (`idvehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idemp_turno_fk`
    FOREIGN KEY (`idempleado`)
    REFERENCES `carwash`.`empleados` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idvehi_turno_fk_idx` ON `carwash`.`turnos` (`idvehiculo` ASC);

CREATE INDEX `idemp_turno_fk_idx` ON `carwash`.`turnos` (`idempleado` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
