-- TASK 1
/* Используя CRUD-операцию INSERT, наполните сущность manufacturer в соответствии с данными, 
имеющимися в атрибуте manufacturer сущности mobile_phones. */
-- Вы работаете с PostgreSQL
-- Введите свой код ниже
DROP TABLE IF EXISTS itresume7944629manufacturer;
CREATE TABLE itresume7944629.manufacturer
(
  id SERIAL PRIMARY KEY,
  name CHARACTER VARYING(30) 
);

INSERT INTO itresume7944629.manufacturer(name)
(SELECT manufacturer FROM mobile_phones);

SELECT * FROM itresume7944629.manufacturer;



-- TASK 2
/* Статусы количества мобильных телефонов (в зависимости от количества): 
меньше 100 – «little»; от 100 до 300 – «many»; больше 300 – «lots».
Необходимо вывести название, производителя и статус количества для мобильных телефонов. */
SELECT product_name, manufacturer,
CASE
  WHEN product_count < 100 THEN 'little'
  WHEN product_count BETWEEN 100 AND 300 THEN 'many'
  WHEN product_count > 300 THEN 'lots'
  ELSE ''
END AS Category
FROM mobile_phones;



-- TASK 3
/* Создайте для сущности mobile_phones внешний ключ manufacturer_id (идентификатор производителя), 
направленный на атрибут id сущности manufacturer. 
Установите каскадное обновление - CASCADE, а при удалении записи из сущности 
manufacturer – SET NULL.

Используя CRUD-операцию UPDATE обновите данные в атрибуте manufacturer_id сущности mobile_phones 
согласно значений, имеющихся в атрибуте manufacturer.

Удалите атрибут manufacturer из сущности mobile_phones.
Выведите идентификатор, название и идентификатор производителя сущности mobile_phones. */
-- Вы работаете с PostgreSQL
-- Введите свой код ниже
ALTER TABLE itresume7944629.mobile_phones
DROP CONSTRAINT manufacturer_id;

ALTER TABLE itresume7944629.mobile_phones
ADD CONSTRAINT manufacturer_id
FOREIGN KEY (id)
REFERENCES itresume7944629.manufacturer(id)
ON DELETE CASCADE;

UPDATE itresume7944629.mobile_phones 
SET manufacturer_id = itresume7944629.manufacturer.id
WHERE mobile_phones = itresume7944629.manufacturer.name; 


ALTER TABLE itresume7944629.mobile_phones 
DROP COLUMN manufacturer;




-- TASK 4
/* Имеется таблица (сущность) с заказами orders.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
mobile_phones_id – идентификатор мобильного телефона;
order_status - статус. 

Подробное описание статусов заказа:
OPEN – «Order is in open state» ;
CLOSED - «Order is closed»;
CANCELLED - «Order is cancelled»
Необходимо вывести идентификатор и подробное описание статуса заказа. */
-- Вы работаете с MySQL
-- Введите свой код ниже
SELECT id,
CASE
  WHEN order_status = 'OPEN' THEN 'Order is in open stat'
  WHEN order_status = 'CLOSED' THEN 'Order is closed'
  ELSE 'Order is cancelled'
END AS full_order_status
FROM orders;

