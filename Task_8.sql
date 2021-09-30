USE vk;

/*1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).*/

SELECT from_user_id, COUNT(*) as number, concat(u.first_name, ' ', u.last_name) as name
FROM messages m
INNER JOIN users u ON u.id = m.from_user_id
WHERE m.to_user_id = 3
GROUP BY from_user_id
ORDER BY count(*) desc
limit 1;

/*2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.*/
SELECT COUNT(1) as likes_sum
FROM likes_users l
INNER JOIN users u ON l.user_id_tolike = u.id
WHERE YEAR(CURDATE()) - YEAR(birthday) < 10;

/*3. Определить кто больше поставил лайков (всего): мужчины или женщины.*/
SELECT gender, COUNT(1) as sum
FROM likes_users l
INNER JOIN users u ON u.id = l.user_id
GROUP BY gender 
ORDER BY sum DESC
LIMIT 1;
