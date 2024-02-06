USE lesson;
CREATE TABLE products(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ProductName	VARCHAR(45) NOT NULL,
    Manufacturer VARCHAR(45) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price DECIMAL NOT NULL
);
INSERT INTO products(ProductName, Manufacturer, ProductCount, Price)
VALUES('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('iPhone 7', 'Apple',5 , 32000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 46000),
('Honor 10', 'Huawei', 5, 28000),
('Nokia 8', 'HMD Global', 6, 38000);

-- Сортировка ORDER BY
SELECT * FROM products
ORDER BY Price;

SELECT ProductName, ProductCount * Price AS TotalSum
FROM products
ORDER BY TotalSum; -- 1 вариант записи

SELECT ProductName, Price, ProductCount
FROM products
ORDER BY ProductCount * Price; -- 2 вариант записи


-- Оператор LIMIT
SELECT * FROM products
LIMIT 3;
SELECT * FROM products
LIMIT 2, 3;


-- уникальный значения DISTINCT
SELECT DISTINCT Manufacturer FROM products;
SELECT DISTINCT Manufacturer, ProductCount FROM products;


-- оператор GROUP BY группировка
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM products
GROUP BY Manufacturer;

/* SELECT
FROM products
WHERE
GROUP BY
HAVING
ORDER BY ; */

-- агрегатные функции AVG, SUM, MIN, MAX, COUNT
SELECT AVG(Price) AS AVG_Price FROM products;
SELECT AVG(Price) AS AVG_Price FROM products
WHERE Manufacturer = 'Apple';

SELECT COUNT(*) FROM products;

SELECT MIN(Price), MAX(Price) FROM products;


-- оператор HAVING
SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM products
GROUP BY Manufacturer
HAVING ModelsCount > 1;

SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING ModelsCount > 1;

SELECT Manufacturer, COUNT(*) AS Models, SUM(ProductCount) AS Units
FROM products
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING Units > 2
ORDER BY Units DESC;