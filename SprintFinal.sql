CREATE DATABASE sprintfinal;

-- MySQL Workbench Forward Engineering
USE SPRINTFINAL;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SprintFinal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SprintFinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SprintFinal` DEFAULT CHARACTER SET utf8 ;
USE `SprintFinal` ;

-- -----------------------------------------------------
-- Table `SprintFinal`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SprintFinal`.`Proveedores` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `representante_legal` VARCHAR(200) NOT NULL,
  `nombre_corporativo` VARCHAR(200) NOT NULL,
  `telefono1` VARCHAR(20) NOT NULL,
  `nombre_receptor1` VARCHAR(45) NOT NULL,
  `telefono2` VARCHAR(50) NULL,
  `nombre_receptor2` VARCHAR(45) NULL,
  `categoria_productos` VARCHAR(45) NOT NULL DEFAULT 'Electrónica',
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SprintFinal`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SprintFinal`.`Clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SprintFinal`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SprintFinal`.`Productos` (
  `SKU` INT NOT NULL AUTO_INCREMENT,
  `precio` DECIMAL(10,2) NOT NULL,
  `categoria` VARCHAR(100) NOT NULL,
  `proveedor` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SKU`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SprintFinal`.`Proveedores_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SprintFinal`.`Proveedores_productos` (
  `Proveedores_id_proveedor` INT NOT NULL,
  `Productos_SKU` INT NOT NULL,
  PRIMARY KEY (`Proveedores_id_proveedor`, `Productos_SKU`),
  INDEX `fk_Proveedores_has_Productos_Productos1_idx` (`Productos_SKU` ASC) VISIBLE,
  INDEX `fk_Proveedores_has_Productos_Proveedores_idx` (`Proveedores_id_proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedores_has_Productos_Proveedores`
    FOREIGN KEY (`Proveedores_id_proveedor`)
    REFERENCES `SprintFinal`.`Proveedores` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedores_has_Productos_Productos1`
    FOREIGN KEY (`Productos_SKU`)
    REFERENCES `SprintFinal`.`Productos` (`SKU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SprintFinal`.`Proveedores`
-- -----------------------------------------------------
START TRANSACTION;
USE `SprintFinal`;
INSERT INTO `SprintFinal`.`Proveedores` (`representante_legal`, `nombre_corporativo`, `telefono1`, `nombre_receptor1`, `telefono2`, `nombre_receptor2`, `categoria_productos`, `email`) VALUES ('Juan Pérez', 'Electrónica del sur', '+56912345678', 'María Gutiérrez', '+56987654321', 'Carlos Fernández', 'Electrónica', 'juanperez@electronicadelsur.cl');
INSERT INTO `SprintFinal`.`Proveedores` (`representante_legal`, `nombre_corporativo`, `telefono1`, `nombre_receptor1`, `telefono2`, `nombre_receptor2`, `categoria_productos`, `email`) VALUES ('María López', 'Electrocom', '+56923456789', 'Pedro Fernández', '+56976543210', 'Alejandra Torres', 'Electrónica', 'marialopez@electrocom.cl');
INSERT INTO `SprintFinal`.`Proveedores` (`representante_legal`, `nombre_corporativo`, `telefono1`, `nombre_receptor1`, `telefono2`, `nombre_receptor2`, `categoria_productos`, `email`) VALUES ('Luis González', 'Electrónica Chile', '+56934567890', 'Patricia Pérez', '+56965432109', 'Fernando Herrera', 'Electrónica', 'luisgonzalez@electronicacl.cl');
INSERT INTO `SprintFinal`.`Proveedores` (`representante_legal`, `nombre_corporativo`, `telefono1`, `nombre_receptor1`, `telefono2`, `nombre_receptor2`, `categoria_productos`, `email`) VALUES ('Pedro Sánchez', 'Electrosat', '+56945678901', 'Manuel González', '+56954321098', 'Cristina Rodríguez', 'Hogar', 'pedrosanchez@electrosat.cl');
INSERT INTO `SprintFinal`.`Proveedores` (`representante_legal`, `nombre_corporativo`, `telefono1`, `nombre_receptor1`, `telefono2`, `nombre_receptor2`, `categoria_productos`, `email`) VALUES ('Carla Torres', 'Eléctrica S.A.', '+56956789012', 'Andrés Muñoz', '+56943210987', 'Jorge Martínez', 'Muebles', 'carlatorres@electrica.cl');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SprintFinal`.`Clientes`
-- -----------------------------------------------------
START TRANSACTION;
USE `SprintFinal`;
INSERT INTO `SprintFinal`.`Clientes` (`nombre`, `apellido`, `direccion`) VALUES ('Juan', 'Pérez', 'Calle 123');
INSERT INTO `SprintFinal`.`Clientes` (`nombre`, `apellido`, `direccion`) VALUES ('Maria', 'García', 'Avenida 456');
INSERT INTO `SprintFinal`.`Clientes` (`nombre`, `apellido`, `direccion`) VALUES ('Pedro', 'López', 'Plaza 789');
INSERT INTO `SprintFinal`.`Clientes` (`nombre`, `apellido`, `direccion`) VALUES ('Ana', 'Sánchez', 'Calle 456');
INSERT INTO `SprintFinal`.`Clientes` (`nombre`, `apellido`, `direccion`) VALUES ('Luis', 'González', 'Avenida 789');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SprintFinal`.`Productos`
-- -----------------------------------------------------
START TRANSACTION;
USE `SprintFinal`;
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (1567900, 'Electrónica', 'Electrónica Chile', 'Rojo');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (2456800, 'Electrónica', 'Electrocom', 'Verde');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (3199000, 'Electrónica', 'Electrónica Chile', 'Azul');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (499000, 'Electrónica', 'Electrónica Chile', 'Rojo');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (1289000, 'Electrónica', 'Electrónica Chile', 'Verde');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (776000, 'Electrónica', 'Electrocom', 'Rojo');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (1950000, 'Muebles', 'Eléctrica S.A.', 'Azul');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (860000, 'Electrónica', 'Electrónica del sur', 'Verde');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (1398000, 'Hogar', 'Electrosat', 'Rojo');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`) VALUES (509000, 'Electrónica', 'Electrocom', 'Azul');

COMMIT;

select * from productos;

SELECT categoria, COUNT(categoria) AS repetidas
FROM productos
GROUP BY categoria
ORDER BY repetidas DESC
LIMIT 0,1;

select * from productos;

SELECT color, COUNT(color) AS repetidas
FROM productos
GROUP BY color
ORDER BY repetidas DESC
LIMIT 0,1;


SELECT categoria 
    FROM productos
    GROUP BY categoria
    ORDER BY COUNT(*) DESC;

UPDATE productos
SET categoria = 'Electrónica y computación'
WHERE categoria = (
    SELECT categoria 
    FROM productos as prod
    GROUP BY categoria
    ORDER BY COUNT(*) DESC
);


SELECT categoria INTO @masRepetido
FROM productos
GROUP BY categoria
ORDER BY COUNT(*) DESC
LIMIT 1;


UPDATE productos
SET categoria = 'Electrónica y computación'
WHERE categoria = @masRepetido;

alter table productos
add column stock INT;

UPDATE productos
SET stock = 
	CASE
         WHEN SKU = 11 THEN 10
         WHEN SKU = 12 THEN 15
         WHEN SKU = 13 THEN 12
         WHEN SKU = 14 THEN 6
         WHEN SKU = 15 THEN 24
         WHEN SKU = 16 THEN 11
         WHEN SKU = 17 THEN 14        
         WHEN SKU = 18 THEN 35
         WHEN SKU = 19 THEN 23
         WHEN SKU = 20 THEN 21
	END
WHERE SKU IN (11,12,13,14,15,16,17,18,19,20);

