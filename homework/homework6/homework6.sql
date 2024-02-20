USE vk;
/* TASK 1
Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, 
профиль и запись из таблицы users. 
Функция должна возвращать номер пользователя.
*/
DROP FUNCTION IF EXISTS DeleteUserFunc;
DELIMITER //
CREATE FUNCTION DeleteUserFunc (delete_user_id INT)
RETURNS INT READS SQL DATA
DETERMINISTIC
BEGIN
    DELETE FROM likes
     WHERE likes.user_id = delete_user_id;
    
    DELETE FROM users_communities
     WHERE users_communities.user_id = delete_user_id;
    
    DELETE FROM messages
     WHERE messages.to_user_id = delete_user_id OR messages.from_user_id = delete_user_id;
    
    DELETE FROM friend_requests
     WHERE friend_requests.initiator_user_id = delete_user_id OR friend_requests.target_user_id = delete_user_id;
    
    DELETE likes
      FROM media
      JOIN likes ON likes.media_id = media.id
     WHERE media.user_id = delete_user_id;
    
    UPDATE profiles
      JOIN media ON profiles.photo_id = media.id
       SET profiles.photo_id = NULL
     WHERE media.user_id = delete_user_id;

    DELETE FROM media
     WHERE media.user_id = delete_user_id;
    
    DELETE FROM profiles
     WHERE profiles.user_id = delete_user_id;
    
    DELETE FROM users
     WHERE users.id = delete_user_id;
    
    RETURN delete_user_id;
END; // 
DELIMITER ;

SELECT DeleteUserFunc(100) AS user_id_deleted;

/* TASK 2
Предыдущую задачу решить с помощью процедуры 
и обернуть используемые команды в транзакцию внутри процедуры.
*/
DROP PROCEDURE IF EXISTS delete_user;
DELIMITER //
CREATE PROCEDURE delete_user(del_id INT)
BEGIN
	START TRANSACTION;
		DELETE FROM likes
		 WHERE likes.user_id = del_id;
		
		DELETE FROM users_communities
		 WHERE users_communities.user_id = del_id;
		
		DELETE FROM messages
		 WHERE messages.to_user_id = del_id OR messages.from_user_id = del_id;
		
		DELETE FROM friend_requests
		 WHERE friend_requests.initiator_user_id = del_id OR friend_requests.target_user_id = del_id;
		
		DELETE likes
		  FROM media
		  JOIN likes ON likes.media_id = media.id
		 WHERE media.user_id = del_id;
		
		UPDATE profiles
		  JOIN media ON profiles.photo_id = media.id
		   SET profiles.photo_id = NULL
		 WHERE media.user_id = del_id;

		DELETE FROM media
		 WHERE media.user_id = del_id;
		
		DELETE FROM profiles
		 WHERE profiles.user_id = del_id;
		
		DELETE FROM users
		 WHERE users.id = del_id;
	COMMIT;
END //
DELIMITER ;

CALL delete_user(2);

/* TASK 3
* Написать триггер, который проверяет новое появляющееся сообщество. 
Длина названия сообщества (поле name) должна быть не менее 5 символов. 
Если требование не выполнено, то выбрасывать исключение с пояснением. */

DROP TRIGGER IF EXISTS check_new_communities;
DELIMITER //
CREATE TRIGGER check_new_communities BEFORE INSERT ON communities
FOR EACH ROW
BEGIN
	IF (LENGTH(new.name) < 5) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Длина названия сообщества должна быть не менее 5 символов';
		INSERT INTO check_new_communities_exception_table VALUES();
	END IF;
END//
DELIMITER ;

INSERT INTO Communities
VALUES (56, 'abc', 1);
