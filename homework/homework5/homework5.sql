USE vk;
-- TASK 1
/* Найти количество сообщений, отправленных каждым пользователей.
В зависимости от количества отправленных сообщений рассчитать ранг пользователей, 
первое место присвоив пользователю(ям) с наибольшим количеством отправленных сообщений.

Вывести полученный ранг, имя, фамилия, пользователя и кол-во отправленных сообщений. 
Выводимый список необходимо отсортировать в порядке возрастания ранга.*/
-- Вы работаете с MySQL
-- Введите свой код ниже
SELECT DENSE_RANK() OVER (ORDER BY COUNT(m.from_user_id) DESC) AS 'Место в рейтинге',
  u.firstname, u.lastname,
	COUNT(m.from_user_id) AS 'Количество отправленных сообщений'
FROM users u
LEFT JOIN messages m ON u.id = m.from_user_id
GROUP BY u.id;


-- TASK 2
/*Получите список сообщений, отсортированных по возрастанию даты отправки.
Вычислите разность между соседними значениями дат отправки. Разности выразите в минутах.
Выведите идентификатор сообщения, дату отправки, дату отправки следующего сообщения 
и разницу даты отправки соседних сообщений*/
-- Вы работаете с MySQL
-- Введите свой код ниже
SELECT id, created_at,
LEAD(created_at) OVER() AS next_date,
TIMESTAMPDIFF(MINUTE, created_at, LEAD(created_at) OVER()) AS difference
FROM messages ORDER BY TIMESTAMPDIFF(SECOND, created_at, NOW()) DESC;