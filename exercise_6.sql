CREATE TABLE Subscribers (
  email VARCHAR(40) NOT NULL,
  phone VARCHAR(10) NOT NULL,
  city VARCHAR(15) NOT NULL,
  INDEX (city)
);

LOAD DATA LOCAL INFILE 'email_subscribers.txt'
INTO TABLE Subscribers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

--1--
SELECT DISTINCT city FROM Subscribers;

--2--
SELECT city, COUNT(city) AS `Number of Response`
FROM Subscribers
GROUP BY city;

--3--
SELECT city, COUNT(city) AS `Number of Response`
FROM Subscribers
GROUP BY city
HAVING `Number of Response` = (
  SELECT MAX(`Number of Response`)
  FROM (
    SELECT COUNT(city) AS `Number of Response`
    FROM Subscribers
    GROUP BY city
  ) Response_Count
);

--4--
SELECT DISTINCT substring_index(email, '@', -1) AS `Email Domain`
FROM Subscribers;

SELECT substring_index(email, '@', -1) AS `Email Domain`
FROM Subscribers
GROUP BY `Email Domain`;

--5--
SELECT substring_index(email, '@', -1) as domain,
  COUNT(substring_index(email,'@',-1)) as amount
FROM Subscribers
GROUP BY domain
HAVING amount = (
  SELECT MAX(amount)
  FROM (
    SELECT COUNT(substring_index(email,'@',-1)) as amount
    FROM Subscribers
    GROUP BY substring_index(email,'@',-1)
  ) Domain_Count
);
