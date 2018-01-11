-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Trajecotory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trajecotory` (
  `ID_trajectory` INT NOT NULL,
  `trajecory_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_trajectory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `Student_ID` INT(8) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Last_name` VARCHAR(32) NOT NULL,
  `Birthdate` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Sex` ENUM('M', 'F') NULL,
  `Trajecotory_ID_trajectory` INT NOT NULL,
  PRIMARY KEY (`Student_ID`),
  INDEX `fk_Students_Trajecotory1_idx` (`Trajecotory_ID_trajectory` ASC),
  CONSTRAINT `fk_Students_Trajecotory1`
    FOREIGN KEY (`Trajecotory_ID_trajectory`)
    REFERENCES `mydb`.`Trajecotory` (`ID_trajectory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5;


-- -----------------------------------------------------
-- Table `mydb`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Courses` (
  `Course_ID` INT(8) NOT NULL,
  `Course` VARCHAR(45) NOT NULL,
  `Credits` INT(8) NOT NULL,
  PRIMARY KEY (`Course_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course_of_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course_of_student` (
  `ID` INT(8) NOT NULL,
  `Students_Student_ID` INT(8) NOT NULL,
  `Courses_Course_ID` INT(8) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Course_of_student_Students_idx` (`Students_Student_ID` ASC),
  INDEX `fk_Course_of_student_Courses1_idx` (`Courses_Course_ID` ASC),
  CONSTRAINT `fk_Course_of_student_Students`
    FOREIGN KEY (`Students_Student_ID`)
    REFERENCES `mydb`.`Students` (`Student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_of_student_Courses1`
    FOREIGN KEY (`Courses_Course_ID`)
    REFERENCES `mydb`.`Courses` (`Course_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
