CREATE SCHEMA IF NOT EXISTS homework;
USE homework;

CREATE TABLE IF NOT EXISTS homework1_mobile_phones
(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ProductName	VARCHAR(45) NOT NULL,
    Manufacturer VARCHAR(45) NOT NULL,
    ProductCount INT NOT NULL,
    Price INT NOT NULL);

INSERT INTO homework1_mobile_phones(ProductName, Manufacturer, ProductCount, Price)
VALUES('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000);

SELECT * FROM homework1_mobile_phones;
