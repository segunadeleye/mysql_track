CREATE TABLE Tastes (
  name VARCHAR(10) NOT NULL,
  filling VARCHAR(10) NOT NULL,
  PRIMARY KEY (name, filling),
  INDEX (filling)
);

CREATE TABLE Sandwiches (
  location VARCHAR(20) NOT NULL,
  bread VARCHAR(10) NOT NULL,
  filling VARCHAR(10) NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (location, bread, filling),
  INDEX (filling)
);

CREATE TABLE Locations (
  lname VARCHAR(20) NOT NULL,
  phone CHAR(10) NOT NULL,
  address VARCHAR(20) NOT NULL,
  PRIMARY KEY (lname),
  UNIQUE KEY (phone),
);

INSERT INTO Tastes VALUES
  ('Brown','Turkey'),
  ('Brown', 'Beef'),
  ('Brown', 'Ham'),
  ('Jones', 'Cheese'),
  ('Green', 'Beef'),
  ('Green', 'Turkey'),
  ('Green', 'Cheese');

INSERT INTO Sandwiches VALUES
  ('Lincoln', 'Rye', 'Ham', 1.25),
  ("O'Neil's", 'White', 'Cheese', 1.20),
  ("O'Neil's", 'Whole', 'Ham', 1.25),
  ('Old Nag', 'Rye', 'Beef', 1.35),
  ('Buttery', 'White', 'Cheese', 1.00),
  ("O'Neil's", 'White', 'Turkey', 1.35),
  ('Buttery', 'White', 'Ham', 1.10),
  ('Lincoln', 'Rye', 'Beef', 1.35),
  ('Lincoln', 'White', 'Ham', 1.30),
  ('Old Nag', 'Rye', 'Ham', 1.40);

INSERT INTO Locations VALUES
  ('Lincoln', '683 4523', 'Lincoln Place'),
  ("O'Neil's", '674 2134', 'Pearse St'),
  ('Old Nag', '767 8132', 'Dame St'),
  ('Buttery', '702 3421', 'College St');

explain SELECT location
FROM Sandwiches
WHERE filling = (
  SELECT filling
  FROM Tastes
  WHERE name = 'Jones'
);

explain SELECT location
FROM Sandwiches
NATURAL JOIN Tastes
WHERE name = 'Jones';

explain SELECT location, COUNT(DISTINCT name)
FROM Tastes
NATURAL JOIN Sandwiches
GROUP BY location;
