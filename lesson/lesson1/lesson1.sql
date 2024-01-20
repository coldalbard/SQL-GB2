-- Создание базы 
CREATE SCHEMA lesson1;
USE lesson1;

-- Создание таблицы
CREATE TABLE myfirstdb
(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(45) NOT NULL,
login VARCHAR(45) UNIQUE,
password VARCHAR(45));

SELECT * FROM myfirstdb;

-- Добавление данных
INSERT myfirstdb(name, login, password)
VALUES('Mikhail', 'test', 'test'),
('Konstantin', 'test1', 'test1');

-- Добавление столбца
ALTER TABLE myfirstdb ADD COLUMN email VARCHAR(45);

-- Добавление данных в определенный столбец
UPDATE `lesson1`.`myfirstdb` SET `email` = 'test@gmail.com' WHERE (`id` = '1');
UPDATE `lesson1`.`myfirstdb` SET `email` = 'test1@gmail.com' WHERE (`id` = '2');

SELECT name, login FROM myfirstdb
WHERE email = 'test@gmail.com' or email ='test1@gmail.com';
