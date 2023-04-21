-- MySQL Workbench Forward Engineering
Create database sprintfinal;
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
USE `SprintFinal`;

-- -----------------------------------------------------
-- Creamos la tabla proveedores
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
-- Creamos la tabla clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SprintFinal`.`Clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Creamos la tabla productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SprintFinal`.`Productos` (
  `SKU` INT NOT NULL AUTO_INCREMENT,
  `precio` DECIMAL(10,2) NOT NULL,
  `categoria` VARCHAR(100) NOT NULL,
  `proveedor` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `stock` int,
  PRIMARY KEY (`SKU`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Creamos la tabla Proveedores-Productos (al tener una relación n:n) tabla productos
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
-- Insertamos datos en proveedores
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
-- Insertamos datos en clientes
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
-- Insertamos datos en los productos
-- -----------------------------------------------------
START TRANSACTION;
USE `SprintFinal`;
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (1567900, 'Electrónica', 'Electrónica Chile', 'Rojo','10');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (2456800, 'Electrónica', 'Electrocom', 'Verde','15');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (3199000, 'Electrónica', 'Electrónica Chile', 'Azul','12');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (499000, 'Electrónica', 'Electrónica Chile', 'Rojo','6');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (1289000, 'Electrónica', 'Electrónica Chile', 'Verde','24');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (776000, 'Electrónica', 'Electrocom', 'Rojo','11');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (1950000, 'Muebles', 'Eléctrica S.A.', 'Azul','14');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (860000, 'Electrónica', 'Electrónica del sur', 'Verde','35');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (1398000, 'Hogar', 'Electrosat', 'Rojo','23');
INSERT INTO `SprintFinal`.`Productos` (`precio`, `categoria`, `proveedor`, `color`,`stock`) VALUES (509000, 'Electrónica', 'Electrocom', 'Azul','21');

COMMIT;
-- Cuál es la categoría de productos que más se repite.
SELECT categoria, COUNT(categoria) AS repetidas
FROM productos
GROUP BY categoria
ORDER BY repetidas DESC
LIMIT 0,1;

-- Cuáles son los productos con mayor stock
SELECT SKU, STOCK FROM PRODUCTOS ORDER BY STOCK DESC;

-- Qué color de producto es más común en nuestra tienda.
SELECT color, COUNT(color) AS repetidas
FROM productos
GROUP BY color
ORDER BY repetidas DESC
LIMIT 0,1;


-- Cambiamos la categoría más popular por 'Electrónica y computación'
SELECT categoria INTO @masRepetido
FROM productos
GROUP BY categoria
ORDER BY COUNT(*) DESC
LIMIT 1;

UPDATE productos
SET categoria = 'Electrónica y computación'
WHERE categoria = @masRepetido;

-- Cual o cuales son los proveedores con menor stock de productos. (¿Qué Stock?)
SELECT proveedor,stock FROM productos
ORDER BY stock ASC;
