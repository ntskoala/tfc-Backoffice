-- MySQL Script generated by MySQL Workbench
-- Sat Sep 24 08:42:40 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tfc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tfc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tfc` DEFAULT CHARACTER SET utf8 ;
USE `tfc` ;

-- -----------------------------------------------------
-- Table `tfc`.`empresas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`empresas` ;

CREATE TABLE IF NOT EXISTS `tfc`.`empresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `cif` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `tfc`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `tipouser` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `idempresa` INT NOT NULL,
  PRIMARY KEY (`id`, `idempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`controles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`controles` ;

CREATE TABLE IF NOT EXISTS `tfc`.`controles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `pla-appcc` VARCHAR(45) NULL,
  `valorminimo` INT NULL,
  `valormaximo` INT NULL,
  `objetivo` INT NULL,
  `tolerancia` INT NULL,
  `critico` INT NULL,
  `periodicidad` INT NULL,
  `tipoperiodo` VARCHAR(45) NULL,
  `idempresa` INT NOT NULL,
  PRIMARY KEY (`id`, `idempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`checklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`checklist` ;

CREATE TABLE IF NOT EXISTS `tfc`.`checklist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idempresa` INT NOT NULL,
  `nombrechecklist` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `idempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`controlchecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`controlchecklist` ;

CREATE TABLE IF NOT EXISTS `tfc`.`controlchecklist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idchecklist` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `idchecklist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`permissionusercontrol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`permissionusercontrol` ;

CREATE TABLE IF NOT EXISTS `tfc`.`permissionusercontrol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idcontrol` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`id`, `idcontrol`, `idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`permissionuserchecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`permissionuserchecklist` ;

CREATE TABLE IF NOT EXISTS `tfc`.`permissionuserchecklist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idchecklist` INT NOT NULL,
  PRIMARY KEY (`id`, `idusuario`, `idchecklist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`resultadoschecklistcontrol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`resultadoschecklistcontrol` ;

CREATE TABLE IF NOT EXISTS `tfc`.`resultadoschecklistcontrol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idcontrolchecklist` INT NOT NULL,
  `resultado` TINYINT(1) NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`id`, `idcontrolchecklist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`ResultadosControl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`ResultadosControl` ;

CREATE TABLE IF NOT EXISTS `tfc`.`ResultadosControl` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idcontrol` INT NOT NULL,
  `resultado` INT NULL,
  `fecha` DATETIME NULL,
  `foto` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `idcontrol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`checklist_has_Permissionuserchecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`checklist_has_Permissionuserchecklist` ;

CREATE TABLE IF NOT EXISTS `tfc`.`checklist_has_Permissionuserchecklist` (
  `checklist_Empresas_idEmpresas` INT NOT NULL,
  `checklist_idChecklist` INT NOT NULL,
  `Permissionuserchecklist_idPermissionuserchecklist` INT NOT NULL,
  `Permissionuserchecklist_Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`checklist_Empresas_idEmpresas`, `checklist_idChecklist`, `Permissionuserchecklist_idPermissionuserchecklist`, `Permissionuserchecklist_Usuarios_idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfc`.`resultadoschecklist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tfc`.`resultadoschecklist` ;

CREATE TABLE IF NOT EXISTS `tfc`.`resultadoschecklist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NULL,
  `foto` VARCHAR(45) NULL,
  `idChecklist` INT NOT NULL,
  PRIMARY KEY (`id`, `idChecklist`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
