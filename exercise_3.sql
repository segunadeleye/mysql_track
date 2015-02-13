CREATE TABLE Users (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  type ENUM('admin', 'normal') NOT NULL DEFAULT 'normal';
);

CREATE TABLE Categories (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE Articles (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  body TEXT NOT NULL
  user_id INT NOT NULL,
  category_id INT NOT NULL
);

CREATE TABLE Comments (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  comment VARCHAR(40) NOT NULL,
  user_id INT NOT NULL,
  article_id INT NOT NULL
);

INSERT INTO Users (name) VALUES ('user1'), ('user2'), ('user3'), ('user4'), ('user5');

INSERT INTO Categories (name) VALUES ('Sports'), ('Technology'), ('Art'), ('Politics'), ('Medicice'), ('Agriculture');

INSERT INTO Articles (title, body, user_id, category_id) VALUES
  ('title1', 'body1', '1', '1'),
  ('title2', 'body2', '1', '2'),
  ('title3', 'body3', '1', '3'),
  ('title4', 'body4', '1', '4'),
  ('title5', 'body5', '2', '5'),
  ('title6', 'body6', '2', '6'),
  ('title7', 'body7', '2', '2'),
  ('title8', 'body8', '2', '4'),
  ('title9', 'body9', '3', '6'),
  ('title10', 'body10', '3', '1'),
  ('title11', 'body11', '3', '6'),
  ('title12', 'body12', '1', '5'),
  ('title13', 'body13', '1', '3'),
  ('title14', 'body14', '2', '6');

INSERT INTO Comments (comment, user_id, article_id) VALUES
  ('comment1', '1', '1'),
  ('comment2', '2', '2'),
  ('comment3', '3', '2'),
  ('comment4', '1', '3'),
  ('comment5', '1', '3'),
  ('comment6', '1', '3'),
  ('comment7', '2', '4'),
  ('comment8', '2', '4'),
  ('comment9', '3', '4'),
  ('comment10', '1', '4'),
  ('comment11', '2', '5'),
  ('comment12', '3', '5'),
  ('comment13', '1', '5'),
  ('comment14', '1', '5'),
  ('comment15', '2', '5'),
  ('comment16', '2', '6'),
  ('comment17', '3', '6'),
  ('comment18', '4', '7'),
  ('comment19', '1', '7'),
  ('comment20', '1', '7'),
  ('comment21', '2', '8'),
  ('comment22', '3', '8'),
  ('comment23', '2', '9'),
  ('comment24', '3', '11'),
  ('comment25', '2', '11');

-- 1a --
SELECT title, body
FROM Articles
LEFT JOIN Users
ON Articles.user_id = Users.id
WHERE name = 'user3';

-- 1b --
SELECT @user_id := id FROM Users WHERE name = 'user3';
SELECT title, body FROM Articles WHERE user_id = @user_id;

-- 2a --
SELECT title, body, comment
FROM Articles
INNER JOIN Users ON Articles.user_id = Users.id
INNER JOIN Comments ON Articles.id = Comments.article_id
WHERE name = 'user3';

-- 2b --
SELECT title, body, comment
FROM Articles
INNER JOIN Comments ON Articles.id = Comments.article_id
WHERE Articles.id IN (
  SELECT id
  FROM Articles
  WHERE user_id = (
    SELECT id FROM Users WHERE name = 'user3'
  )
);

-- 3a --
SELECT title, body, comment
FROM Articles
LEFT JOIN Comments ON Articles.id = Comments.article_id
WHERE comment IS NULL;

-- 3b --
SELECT title, body
FROM Articles
WHERE id not IN (
  SELECT article_id
  FROM Comments
);

-- 4 --
SELECT title, COUNT(comment) as 'Number of Comments'
FROM Articles INNER JOIN Comments ON Articles.id = Comments.article_id
GROUP BY title
HAVING `Number of Comments` = (
  SELECT MAX(count)
  FROM (
    SELECT title, COUNT(comment) AS count
    FROM Articles
    INNER JOIN Comments ON Comments.article_id = Articles.id
    GROUP BY title
  ) AS Count
);

-- 5 --
SELECT title, COUNT(comment) as 'Number of Comments'
FROM Articles INNER JOIN Comments ON Articles.id = Comments.article_id
GROUP BY title
HAVING `Number of Comments` <= 1;
