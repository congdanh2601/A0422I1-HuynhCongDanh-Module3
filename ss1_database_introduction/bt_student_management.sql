create database student_management;
use student_management;

create table student (
id int primary key auto_increment,
`name` varchar(45),
age int,
country varchar(45)
);

create table class (
id int primary key auto_increment,
`name` varchar(45)
);

create table teacher (
id int primary key auto_increment,
`name` varchar(45),
age int,
country varchar(45)
);