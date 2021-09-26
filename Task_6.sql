USE vk;

-- Заданине 2: Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT from_user_id, COUNT(*) as quantity_of_massage
FROM messages
WHERE to_user_id = 3 -- берем известного пользователя с идентификатором 3
GROUP BY from_user_id
ORDER BY from_user_id
LIMIT 1;

-- Заданине 3: Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

WITH young_users AS
(
	SELECT *
    FROM users
    ORDER BY birthday DESC
    LIMIT 10
)
SELECT COUNT(1) as likes_sum
FROM likes_users
WHERE user_id_tolike IN (
	SELECT id FROM young_users
);

-- Заданине 4: Определить кто больше поставил лайков (всего) - мужчины или женщины.

SELECT (
	SELECT gender
    FROM users
    WHERE id = likes_users.user_id
    ) as gender_num, COUNT(1) as sum
FROM likes_users
GROUP BY gender_num 
ORDER BY sum DESC
LIMIT 1;

-- Заданине 5: Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- (сообщеия + лайки пользователей + лайки медиа)

SELECT (
	SELECT CONCAT(id, '. ',first_name, ' ', last_name, ':  ', email) as user_inf
	FROM users usr
    WHERE usr.id = u.id
    ) AS user_inf, 
    (SELECT COUNT(1)
	FROM likes_users
    WHERE likes_users.user_id = u.id) 
    +
	(SELECT COUNT(1)
	FROM likes_media
    WHERE likes_media.user_id = u.id)
    +
    (SELECT COUNT(1)
    FROM messages
    WHERE messages.from_user_id = u.id) AS activity
FROM users u
ORDER BY activity ASC, user_inf
LIMIT 10;
