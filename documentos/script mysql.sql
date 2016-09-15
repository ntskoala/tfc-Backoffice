-- MySQL Script generated by MySQL Workbench
-- Thu Sep 15 18:26:10 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tfc_BD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tfc_BD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tfc_BD` DEFAULT CHARACTER SET utf8 ;
USE `tfc_BD` ;

-- -----------------------------------------------------
-- Table `tfc_BD`.`empresas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`empresas` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`empresas` (
  `idempresa` INT NOT NULL,
  `nombreempresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`usuarios` (
  `idusuario` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `tipouser` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `empresas_idempresa` INT NOT NULL,
  PRIMARY KEY (`idusuario`, `empresas_idempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`controles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`controles` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`controles` (
  `Idcontrol` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `pla-appcc` VARCHAR(45) NULL,
  `valorminimo` INT NULL,
  `valormaximo` INT NULL,
  `objetivo` INT NULL,
  `tolerancia` INT NULL,
  `critico` INT NULL,
  `periodicidad` INT NULL,
  `tipoperiodo` VARCHAR(45) NULL,
  `empresas_idempresa` INT NOT NULL,
  PRIMARY KEY (`Idcontrol`, `empresas_idempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`checklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`checklist` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`checklist` (
  `idchecklist` INT NOT NULL,
  `empresas_idempresas` INT NOT NULL,
  `nombrechecklist` VARCHAR(45) NULL,
  PRIMARY KEY (`empresas_idempresas`, `idchecklist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`controlchecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`controlchecklist` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`controlchecklist` (
  `idcontrolchecklist` INT NOT NULL,
  `checklist_empresas_idempresas` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idcontrolchecklist`, `checklist_empresas_idempresas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`permissionusercontrol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`permissionusercontrol` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`permissionusercontrol` (
  `idPermissionusercontrol` INT NOT NULL,
  `controles_idcontroles` INT NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  PRIMARY KEY (`idPermissionusercontrol`, `controles_idcontroles`, `usuarios_idusuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`permissionuserchecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`permissionuserchecklist` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`permissionuserchecklist` (
  `idpermissionuserchecklist` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `checklist_idchecklist` INT NOT NULL,
  PRIMARY KEY (`idpermissionuserchecklist`, `usuario_idusuario`, `checklist_idchecklist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`resultadoschecklistcontrol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`resultadoschecklistcontrol` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`resultadoschecklistcontrol` (
  `idresultadochecklist` INT NOT NULL,
  `controlchecklist_idcontrolchecklist` INT NOT NULL,
  `resultado` TINYINT(1) NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idresultadochecklist`, `controlchecklist_idcontrolchecklist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`ResultadosControl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`ResultadosControl` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`ResultadosControl` (
  `idResultadosControl` INT NOT NULL,
  `Controles_idControles` INT NOT NULL,
  `resultado` INT NULL,
  `Fecha` DATETIME NULL,
  `foto` VARCHAR(45) NULL,
  PRIMARY KEY (`idResultadosControl`, `Controles_idControles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`checklist_has_Permissionuserchecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`checklist_has_Permissionuserchecklist` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`checklist_has_Permissionuserchecklist` (
  `checklist_Empresas_idEmpresas` INT NOT NULL,
  `checklist_idChecklist` INT NOT NULL,
  `Permissionuserchecklist_idPermissionuserchecklist` INT NOT NULL,
  `Permissionuserchecklist_Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`checklist_Empresas_idEmpresas`, `checklist_idChecklist`, `Permissionuserchecklist_idPermissionuserchecklist`, `Permissionuserchecklist_Usuarios_idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc_BD`.`resultadoschecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc_BD`.`resultadoschecklist` ;

CREATE TABLE IF NOT EXISTS `tfc_BD`.`resultadoschecklist` (
  `idresultadochecklist` INT NOT NULL,
  `fecha` VARCHAR(45) NULL,
  `foto` VARCHAR(45) NULL,
  `checklist_idChecklist` INT NOT NULL,
  PRIMARY KEY (`idresultadochecklist`, `checklist_idChecklist`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
