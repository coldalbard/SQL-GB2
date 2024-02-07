USE lesson;
CREATE TABLE IF NOT EXISTS customers
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    account_sum DECIMAL
);

CREATE TABLE IF NOT EXISTS employees
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL
);

INSERT INTO customers(first_name, last_name, account_sum)
VALUES ('Tom', 'Smith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adaes', 2500),
('Paul', 'Ins', 4200),
('John', 'Smith', 2800),
('Tim', 'Cook', 2800);


INSERT INTO employees(first_name, last_name)
VALUES ('Homer', 'Simpson'),
('Tom', 'Smith'),
('Sam', 'Brown'),
('Mark', 'Adaes');

-- оператор UNION объединяет две выборки(Количество столбцов в выборках должны совпадать), 
-- повторяющиеся значения будут удалены
SELECT first_name, last_name FROM customers
UNION
SELECT first_name, last_name FROM employees
ORDER BY first_name;

-- оператор UNION ALL объединяет две выборки(Количество столбцов в выборках должны совпадать), 
-- будут записаны все значения
SELECT first_name, last_name FROM customers
UNION ALL
SELECT first_name, last_name FROM employees
ORDER BY first_name;

-- оператор UNION можно применить в пределах одной таблицы
SELECT first_name, last_name, account_sum + account_sum * 0.1 AS total_sum
FROM customers WHERE account_sum < 3000
UNION SELECT first_name, last_name, account_sum + account_sum * 0.3 AS total_sum
FROM customers WHERE account_sum >= 3000
ORDER BY total_sum DESC;



