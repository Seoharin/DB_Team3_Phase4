drop table has_version;
drop table version;
drop table has_genre;
drop table genre;
drop table roled;
drop table rating;
drop table episode;
drop table actor;
drop table membership;
drop table movie;
drop table account;

CREATE TABLE MOVIE(
  title_id int primary key,
  title varchar(225),
  is_adult varchar(5),
  runtime_minute int,
  ost varchar(225),
  audience int,
  hasclip varchar(5),
  director varchar(255),
  writer varchar(255),
  startyear date,
  endyear date,
  type char(1),
  admin_id varchar(255)
  );

CREATE TABLE ACCOUNT (
  Account_id varchar(255),
  name varchar(255) ,
  sex varchar(255) default NULL,
  birth date,
  address varchar(255) default NULL,
  job varchar(255),
  phone_number varchar(100) default NULL,
  password varchar(255),
  is_customer char(10), 
  PRIMARY KEY(Account_id)
);



create table ACTOR (
   Name VARCHAR(50),
   Sex VARCHAR(50),
   Birth DATE,
   Weight INT,
   Tall INT,
   Nationality VARCHAR(50),
   Act_id int PRIMARY KEY
);


create table ROLED(
   Movie_id int,
   A_id int,
   Role_id int PRIMARY KEY,
   Character_age int,
   Character_nationality varchar(255),
   Role_name varchar(255),
   Is_leading_role varchar(5) 
);



create table VERSION(
   Version_id int,
   Language varchar(10),
   Country varchar(10),
   PRIMARY KEY(Version_id)
);



create table HAS_VERSION(
  Acs_id int,
  V_id int
);


CREATE TABLE GENRE(
   Genre_num int,
   Genre_name varchar(20),
   PRIMARY KEY(Genre_num)
   );



CREATE TABLE HAS_GENRE(
   M_id int NOT NULL,
   Gnum int NOT NULL
   );

CREATE TABLE membership (
 Ac_id varchar(50),
 Membership_id int PRIMARY KEY,
 Regular_payment_day int,
 Connect_account varchar(50),
 Membership_token int
) ;

create table EPISODE (
	Episode_id INT PRIMARY KEY,
	Season_number INT,
	Episode_number INT,
	Episode_title VARCHAR(255),
	Parent_id INT
);


create table RATING (
Rating_id INT NOT NULL,
Mt_id INT NOT NULL,
Rate_id VARCHAR(50) NOT NULL,
Score INT NOT NULL,
PRIMARY KEY (Rating_id)
);


