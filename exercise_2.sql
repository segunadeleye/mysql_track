CREATE DATABASE vtapp;

CREATE USER 'vtapp_user'@'localhost' IDENTIFIED BY 'vtapp_pass';

GRANT ALL PRIVILEGES ON vtapp.* TO 'vtapp_user'@'localhost';
