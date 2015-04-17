CREATE TABLE Branches (
  bcode     VARCHAR(4) NOT NULL,
  librarian VARCHAR(20) NOT NULL,
  address   TEXT NOT NULL,
  PRIMARY KEY(bcode)
);

CREATE TABLE Titles (
  title     VARCHAR(20) NOT NULL,
  author    VARCHAR(20) NOT NULL,
  publisher VARCHAR(20) NOT NULL,
  PRIMARY KEY(title),
  INDEX publisher_key (publisher),
  INDEX author_key (author)
);

CREATE TABLE Holdings (
  branch VARCHAR(4) NOT NULL,
  title  VARCHAR(20) NOT NULL,
  copies INT(1),
  INDEX branch_key (branch)
);

INSERT INTO Branches VALUES
  ('B1', 'John Smith', '2 Anglesea Rd'),
  ('B2', 'Mary Jones', '34 Pearse St'),
  ('B3', 'Francis Owens', 'Grand X');

INSERT INTO Titles VALUES
 ('Susannah', 'Ann Brown', 'Macmillan'),
 ('How to Fish', 'Amy Fly', 'Stop Press'),
 ('A History of Dublin', 'David Little', 'Wiley'),
 ('Computers', 'Blaise Pascal', 'Applewoods'),
 ('The Wife', 'Ann Brown', 'Macmillan');

INSERT INTO Holdings VALUES
  ('B1', 'Susannah', 3),
  ('B1', 'How to Fish', 2),
  ('B1', 'A History of Dublin', 1),
  ('B2', 'How to Fish', 4),
  ('B2', 'Computers', 2),
  ('B2', 'The Wife', 3),
  ('B3', 'A History of Dublin', 1),
  ('B3', 'Computers', 4),
  ('B3', 'Susannah', 3),
  ('B3', 'The Wife', 1);

SELECT title, author
FROM Titles
WHERE publisher = 'Macmillan';

SELECT DISTINCT branch
FROM Holdings
WHERE title IN (
  SELECT title
  FROM Titles
  WHERE author = 'Ann Brown'
);

SELECT DISTINCT branch
FROM Holdings
NATURAL JOIN Titles
WHERE author = 'Ann Brown';

SELECT branch, SUM(copies) AS 'Number of Books'
FROM Holdings
GROUP BY branch;
