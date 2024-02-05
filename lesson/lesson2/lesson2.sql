-- ЛЕКЦИЯ 2


SHOW DATABASES;
-- ПРОСМОТР СОЗДАННЫХ БАЗ ДАННЫХ

USE lesson;
-- ВЫБОР БАЗЫ ДАННЫХ

CREATE TABLE IF NOT EXISTS Customers 
(
	id INT PRIMARY KEY AUTO_INCREMENT, -- Первичный ключ
    Age INT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Phone VARCHAR(20) NOT NULL UNIQUE
);
-- СОЗДАНИЕ ТАБЛИЦЫ

CREATE TABLE IF NOT EXISTS Orders
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    CreateAt Date,
    FOREIGN KEY (CustomerId) REFERENCES Customers (id) -- Вторичный ключ
);

-- Как создавать комментарии
-- однострочный комментарий 
# еще однострочный
/*
	Многострочный комментарий
*/

SELECT 2 + 5;
-- Арифметические операции: сложение

SELECT 5 - 2;
-- Арифметические операции: вычитание

SELECT 3 * 5;
-- Арифметические операции: умножение

SELECT 6 / 2;
-- Арифметические операции: деление

CREATE TABLE IF NOT EXISTS Products
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	ProductName VARCHAR(30) NOT NULL,
	Manufacturer VARCHAR(20) NOT NULL,
	ProductCount INT DEFAULT 0,
	Price DECIMAL
);
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);
-- таблица, для которой будут применяться логические операторы

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' AND Price > 50000;
-- оператор and должны выполняться оба условия

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' OR Price > 50000;
-- оператор or должно выполняться одно из условий

SELECT * FROM Products
WHERE NOT Manufacturer = 'Samsung';
-- оператор NOT логическое отрицание

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' OR NOT (Price > 30000 AND ProductCount > 2);
-- можно задать больший приоритет другим операторам с помощью скобок

SELECT ProductName, ProductCount,
CASE
	WHEN ProductCount = 1 THEN 'Товар заканчивается'
	WHEN ProductCount = 2 THEN 'Мало товара'
	WHEN ProductCount = 3 THEN 'Есть в наличии'
	ELSE 'Много товара'
END AS Category
FROM Products;
-- Оператор CASE

SELECT ProductName, Manufacturer,
	IF(ProductCount > 3, 'Много товара', 'Мало товара') AS 'Count'
FROM Products;
-- оператор IF

UPDATE Products
SET Price = Price + 3000;
-- оператор UPDATE

DELETE FROM Products
WHERE Manufacturer = 'Huawei';
-- оператор DELETE FROM

SELECT * FROM Products
WHERE Manufacturer IN ('Apple', 'Samsung');
-- оператор IN

SELECT * FROM Products
WHERE NOT Manufacturer IN ('Apple', 'Samsung');
-- оператор NOT