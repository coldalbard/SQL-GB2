USE lesson;

-- Создание виртуальной таблицы
CREATE VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer FROM products
WHERE Manufacturer = 'Apple';
-- Cоздание физической таблицы
CREATE TABLE test
(
	id INT,
    count INT
);

SELECT * FROM CopyProducts;
SELECT * FROM test;

-- Удаление виртуальной таблицы
DROP VIEW CopyProducts;
-- Удаление физической таблицы
DROP TABLE test;

-- Изминение представления
ALTER VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer, ProductName FROM products
WHERE Manufacturer = 'Apple';
-- Удаление столбца в виртуальной таблице
ALTER VIEW CopyProducts AS
SELECT Price, ProductCount, ProductName FROM products
WHERE Manufacturer = 'Apple';

-- Изминение физической таблицы
ALTER TABLE test ADD COLUMN TestColumn VARCHAR(45);
-- Удаление столбца в физической таблице
ALTER TABLE test DROP COLUMN TestColumn;