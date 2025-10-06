/* & "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p   */

SELECT user, host FROM mysql.user;
CREATE USER IF NOT EXISTS 'kateryna'@'localhost'
IDENTIFIED BY 'sacret';

SELECT user FROM mysql.user;

SHOW databases;
CREATE DATABASE katerynadb;
USE katerynadb;

create table todos2(
   id int auto_increment primary key,
   title varchar(255) not null,
   completed bool default false
);
grant all privileges on katerynadb.* to kateryna@localhost;

show databases;

USE katerynadb;
show tables;

insert into todos(title) 
values('Learn MySQL');

select * from todos;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'kateryna'@'localhost';
DROP USER IF EXISTS 'kateryna'@'localhost';
DROP DATABASE IF EXISTS katerynadb;

SELECT USER();
SELECT CURRENT_USER();
SHOW PROCESSLIST;