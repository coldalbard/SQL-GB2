CREATE SCHEMA IF NOT EXISTS seminar;
USE seminar;

CREATE  TABLE IF NOT EXISTS seminar1_students
(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(45) NOT NULL,
email VARCHAR(45) UNIQUE);

INSERT INTO seminar1_students VALUES(1, 'kostya', 'kostyan@gmail.com');
INSERT INTO seminar1_students VALUES(2, 'nastya', 'nastya@gmail.com');

SELECT * FROM seminar1_students;

SELECT * FROM seminar1_students
WHERE id = 1;

SELECT name FROM seminar1_students
WHERE email like '%gmail.com';

UPDATE seminar1_students
set email = '@mail.ru'
WHERE id = 1;

DELETE FROM seminar1_students
WHERE id = 2;