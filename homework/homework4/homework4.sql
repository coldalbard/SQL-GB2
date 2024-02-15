USE vk;
-- TASK 1
/* Найдите общее количество лайков, которые получили пользователи женского пола.
Вы работаете с MySQL
Введите свой код ниже
*/
SELECT COUNT(*) AS likes_count
FROM profiles AS pf
INNER JOIN media AS m ON pf.user_id = m.user_id
INNER JOIN likes AS l ON l.media_id = m.id
WHERE pf.gender = 'f';



-- TASK 2
/* Найдите количество лайков, которые поставили пользователи женского пола и мужского пола.
Выведите название пола (преобразовав значение атрибута f в женский, а значение ‘m` - мужской) 
и количество, поставленных лайков, применив к количеству лайков сортировку по убыванию. 
Вы работаете с MySQL
Введите свой код ниже
*/
SELECT IF(pf.gender = 'm', 'мужской', 'женский') AS gender,
COUNT(*)
FROM profiles AS pf
INNER JOIN likes AS l ON l.user_id = pf.user_id
GROUP BY gender;



-- TASK 3
/* Выведите идентификаторы пользователей, которые не отправляли ни одного сообщения.
Вы работаете с MySQL
Введите свой код ниже
*/
SELECT u.id, ms.from_user_id
FROM messages AS ms
LEFT OUTER JOIN users AS u ON u.id = ms.from_user_id
WHERE ms.from_user_id IS NULL
UNION
SELECT u.id, ms.from_user_id
FROM messages AS ms
RIGHT OUTER JOIN users AS u ON u.id = ms.from_user_id
WHERE ms.from_user_id IS NULL;



-- TASK 4
/* Друзья — это пользователи у которых имеется соответствующая запись (заявка) 
в сущности «заявки на дружбу» и в атрибуте status данной сущности указано значение 'approved'.
Найдите количество друзей у каждого пользователя. Выведите для каждого пользователя идентификатор пользователя, 
фамилию, имя и количество друзей. Сортировка выводимых записей в порядке возрастания идентификатора пользователя
Вы работаете с MySQL
Введите свой код ниже
*/
SELECT 
u.id, 
u.firstname, 
u.lastname, 
COUNT(fr.status) AS cnt 
FROM users u
LEFT JOIN friend_requests fr ON (u.id = fr.initiator_user_id or u.id = fr.target_user_id) AND fr.status = 'approved'
GROUP BY u.id
ORDER BY u.id;

