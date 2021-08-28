DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name CHAR(10) DEFAULT 'unknown'
);
INSERT INTO users VALUES(1, 'Ivan');
INSERT INTO users VALUES(2, 'Pasha');
INSERT INTO users (name) VALUES ('Zigmund');
INSERT INTO users (name) VALUES ('Pifagor');
INSERT INTO users VALUES(NULL, 'Lesha');
INSERT INTO users VALUES
	(NULL, 'Valera'),
	(NULL, 'Liza'),
	(NULL, 'Kostya');
SELECT * FROM users;
