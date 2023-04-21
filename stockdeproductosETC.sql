-- Agregar columna stcok a tabla producto
ALTER TABLE productos ADD COLUMN stock INT;

-- Agregar stock al producto
UPDATE productos SET stock = 25 WHERE SKU = 1;
UPDATE productos SET stock = 30 WHERE SKU = 2;
UPDATE productos SET stock = 15 WHERE SKU = 3;
UPDATE productos SET stock = 50 WHERE SKU = 4;
UPDATE productos SET stock = 100 WHERE SKU = 5;
UPDATE productos SET stock = 101 WHERE SKU = 6;
UPDATE productos SET stock = 107 WHERE SKU = 7;
UPDATE productos SET stock = 119 WHERE SKU = 8;
UPDATE productos SET stock = 19 WHERE SKU = 9;
UPDATE productos SET stock = 30 WHERE SKU = 10;

-- Cuales son los productos de mayor stock

SELECT * FROM productos
ORDER BY stock DESC;

-- Cuales son los proveedores con menor stock de productos
SELECT proveedor,stock FROM productos
ORDER BY stock ASC;

