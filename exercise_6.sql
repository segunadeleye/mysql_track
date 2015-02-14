create table Emails (
  email varchar(40) not null,
  phone varchar(10) not null,
  city varchar(15) not null
);

load data local infile 'email_subscribers.txt'
into table Emails
fields terminated by ','
enclosed by '"'
lines terminated by '\n';
