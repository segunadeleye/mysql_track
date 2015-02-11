CREATE TABLE testing_table (
  name         CHAR(40) NOT NULL,
  contact_name CHAR(20) NOT NULL,
  roll_no      CHAR(20) NOT NULL
);

ALTER TABLE testing_table DROP COLUMN name;

ALTER TABLE testing_table CHANGE contact_name username CHAR(20) NOT NULL;

ALTER TABLE testing_table ADD COLUMN first_name CHAR(20) NOT NULL FIRST;

ALTER TABLE testing_table ADD COLUMN last_name CHAR(20) NOT NULL AFTER first_name;

ALTER TABLE testing_table MODIFY roll_no INT NOT NULL;
