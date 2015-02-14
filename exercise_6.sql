CREATE TABLE Emails (
  email VARCHAR(40) NOT NULL,
  phone VARCHAR(10) NOT NULL,
  city VARCHAR(15) NOT null
);

LOAD DATA LOCAL INFILE 'email_subscribers.txt'
INTO TABLE EMAILS
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

--1--
SELECT DISTINCT city FROM Emails;

--2--
SELECT city, COUNT(city) AS `Number of Response`
FROM Emails
GROUP BY city;

--3--
SELECT city, COUNT(city) AS `Number of Response`
FROM Emails
GROUP BY city
HAVING COUNT(city) = (
  SELECT MAX(`Number of Response`)
  FROM (
    SELECT COUNT(city) AS `Number of Response`
    FROM Emails
    GROUP BY city
  ) Response_Count
);

--4--
SELECT substring_index(email, '@', -1) AS `Email Domain`
FROM Emails
GROUP BY `Email Domain`;

--5--
SELECT email_domain, COUNT(email_domain) AS amount
FROM (
  SELECT substring_index(email, '@', -1) AS email_domain
  FROM Emails
) AS Domains
GROUP BY email_domain 
HAVING amount = (
  SELECT MAX(amount)
  FROM (
    SELECT COUNT(email_domain) AS amount
    FROM (
      SELECT substring_index(email, '@', -1) AS email_domain
      FROM Emails
    ) AS Domains
    GROUP BY email_domain
  ) AS Domain_Count
);
