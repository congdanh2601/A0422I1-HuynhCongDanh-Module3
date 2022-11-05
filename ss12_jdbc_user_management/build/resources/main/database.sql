CREATE DATABASE `jdbc_crud`;
USE jdbc_crud;

create table users (
 id  int NOT NULL AUTO_INCREMENT,
 name varchar(45) NOT NULL,
 email varchar(100) NOT NULL,
 country varchar(45),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

select * from users order by name;
delete from users where id = 1;
update users set id = 3, name = 'Holo', email = 'holo@gmail.com', country = 'Laos' where id = 1;
select max(id) from users;
select * from users where country = 'laos';

DELIMITER $$
CREATE PROCEDURE display_users()
BEGIN
select * from users;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_user_with_id(in id_to_update int, in name_update varchar(45), in email_update varchar(45), in country_update varchar(45))
BEGIN
UPDATE users SET name = name_update, email = email_update, country = country_update WHERE id = id_to_update;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_user(in id_to_delete int)
BEGIN
DELETE FROM users WHERE id = id_to_delete;
END $$
DELIMITER ;

call display_users;
call update_user_with_id();
call delete_user(10);