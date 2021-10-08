CREATE DATABASE  IF NOT EXISTS `carwash`
USE `carwash`;
------------------------
-- ORACLE SQL
--------------------------
-- -----------------------------------------------------
-- Table `carwash`.`empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carwash.empleados ;

CREATE TABLE IF NOT EXISTS carwash.empleados (
  idempleado number primary key,
  nombre_emp VARCHAR2(150),
  legajo number);

INSERT INTO `empleados` VALUES(1,'Hombre Topo',123);
INSERT INTO `empleados` VALUES(2,'Renzo Fajardo',321);

-- -----------------------------------------------------
-- Table `carwash`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carwash.clientes ;

CREATE TABLE IF NOT EXISTS carwash.clientes (
  idcliente number primary key,
  nombre_cli VARCHAR2(450),
  domicilio VARCHAR2(250),
  barrio VARCHAR2(250),
  documento VARCHAR2(15)
  );

INSERT INTO `clientes` VALUES(1,'Franco Cardozo','Lejos de Chilecito','Anguinan','12345678');
INSERT INTO `clientes` VALUES(2,'Fabian Roldan','Donde no hay internet','Malligasta','87654321');

-- -----------------------------------------------------
-- Table `carwash`.`vehiculos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carwash.vehiculos ;

CREATE TABLE IF NOT EXISTS carwash.vehiculos (
  idvehiculo number primary key,
  matricula VARCHAR2(45),
  marca VARCHAR2(425),
  modelo VARCHAR2(425),
  idcliente number
    );

alter table carwash.vehiculos 
add CONSTRAINT vehi_cli_fk
    FOREIGN KEY (idcliente)
    REFERENCES carwash.clientes (idcliente);

INSERT INTO `vehiculos` VALUES(1,'123ACB','Peugeot','208',1);
INSERT INTO `vehiculos` VALUES(2,'456BCA','Dodge','Challenger',2);

-- -----------------------------------------------------
-- Table `carwash`.`turnos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS carwash.turnos ;

CREATE TABLE IF NOT EXISTS carwash.turnos (
  idturno number primary key,
  idvehiculo number,
  fecha DATETIME,
  idempleado number,
  precio number(5,2)
);

alter table carwash.turnos
add  CONSTRAINT idvehi_turno_fk
    FOREIGN KEY (idvehiculo)
    REFERENCES carwash.vehiculos (idvehiculo);

  alter table carwash.turnos
add CONSTRAINT idemp_turno_fk
    FOREIGN KEY (idempleado)
    REFERENCES carwash.empleados (idempleado);

INSERT INTO `turnos` VALUES(1,1,'10-10-2021',2,123.15);
INSERT INTO `turnos` VALUES(2,2,'15-10-2021',1,1564);
commit;
