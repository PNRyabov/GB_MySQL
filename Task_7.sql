USE shop;

/* Task 1. Составьте список пользователей users, которые осуществили 
хотя бы один заказ orders в интернет магазине.*/

SELECT u.name, COUNT(u.id) value_sum
FROM users u
INNER JOIN orders o ON (u.id = o.user_id)
GROUP BY u.id
HAVING COUNT(u.id) >= 1;

/* Task 2. Выведите список товаров products и разделов catalogs, который соответствует товару. */

SELECT pr.name, cat.name
FROM products pr
INNER JOIN catalogs cat ON cat.id = pr.catalog_id;

/* Task 3. Пусть имеется таблица рейсов flights (id, from, to) и таблица городов 
cities (label, name). Поля from, to и label содержат английские названия городов, 
поле name — русское. Выведите список рейсов flights с русскими названиями городов. */

SELECT cit.name AS 'From', cit1.name AS 'TO'
FROM flights fl
INNER JOIN cities cit ON cit.label = fl.from
INNER JOIN cities cit1 ON cit1.label = fl.to
ORDER BY fl.id;
