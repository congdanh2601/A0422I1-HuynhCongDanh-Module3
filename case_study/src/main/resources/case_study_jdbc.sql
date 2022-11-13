create database furama_resort_2;
use furama_resort_2;

create table rent_type (
rent_type_id int PRIMARY KEY auto_increment,
rent_type_name VARCHAR(45) not null
);

create table service_type (
service_type_id int PRIMARY KEY auto_increment,
service_type_name VARCHAR(45) not null
);

create table service (
service_id int PRIMARY KEY auto_increment,
service_name VARCHAR(45) not null,
service_area INT,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
room_standard varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
foreign key (rent_type_id) references rent_type (rent_type_id),
foreign key (service_type_id) references service_type (service_type_id)
);

create table position (
position_id int PRIMARY KEY auto_increment,
position_name VARCHAR(45) not null
);

create table education_degree (
education_degree_id int PRIMARY KEY auto_increment,
education_degree_name VARCHAR(45) not null
);

create table division (
division_id int PRIMARY KEY auto_increment,
division_name VARCHAR(45) not null
);

create table `role` (
role_id int PRIMARY KEY auto_increment,
role_name VARCHAR(255) not null
);

insert into `role` values (1, 'Manager'), (2,'Leader'), (3,'Member');

create table `user` (
username VARCHAR(255) PRIMARY KEY,
`password` VARCHAR(255) not null
);

create table user_role (
role_id int,
username VARCHAR(255),
foreign key (role_id) references `role` (role_id),
foreign key (username) references `user` (username)
);

create table employee (
employee_id int PRIMARY KEY auto_increment,
employee_name VARCHAR(45) not null,
employee_birthday date,
employee_id_card varchar(12),
employee_salary double,
employee_phone varchar(10),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username VARCHAR(255),
foreign key (position_id) references position (position_id),
foreign key (education_degree_id) references education_degree (education_degree_id),
foreign key (division_id) references division (division_id),
foreign key (username) references `user` (username)
);

create table customer_type (
customer_type_id int PRIMARY KEY auto_increment,
customer_type_name VARCHAR(45) not null
);
select customer_type_id from customer_type where customer_type_name = 'Diamond';
create table customer (
customer_id int PRIMARY KEY auto_increment,
customer_type_id int,
customer_name VARCHAR(45) not null,
customer_birthday date,
customer_gender bit,
customer_id_card varchar(12),
customer_phone varchar(10),
customer_email varchar(45),
customer_address varchar(45),
foreign key (customer_type_id) references customer_type (customer_type_id)
);

-- select * from customer c join customer_type ct using (customer_type_id) order by customer_id;
select * from customer_type;
select customer_type_id from customer_type where customer_type_name = 'Gold';
select * from customer c join customer_type ct using (customer_type_id) where customer_name like '%Dung%';
-- insert into customer(customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address)
-- values (1, 'Han', '2022-12-22', 0, '123244132', '4232114', 'asdjk@jk.ds', 'Hoian');
-- insert into customer(customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address)
-- values (2, 'Minh', '2022-12-22', 1, '123244132', '4232114', 'asdjk@jk.ds', 'Quang Nam');
-- delete from customer where customer_id = 1;
-- update customer set customer_type_id = 1, customer_name = 'asf', customer_birthday = '2022-12-29', customer_gender = 0, customer_id_card = '9875',
-- customer_phone = '1234423', customer_email = 'a@b.c', customer_address = 'Danang' where customer_id = 4;

create table attach_service (
attach_service_id int PRIMARY KEY auto_increment,
attach_service_name VARCHAR(45) not null,
attach_service_cost double,
attach_service_unit varchar(10),
attach_service_status varchar(45)
);

create table contract (
contract_id int PRIMARY KEY auto_increment,
contract_start_day datetime,
contract_end_day datetime,
contract_deposit double,
employee_id int,
customer_id int,
service_id int,
foreign key (employee_id) references employee (employee_id),
foreign key (customer_id) references customer (customer_id),
foreign key (service_id) references service (service_id)
);

create table contract_detail (
contract_detail_id int PRIMARY KEY auto_increment,
contract_id int,
attach_service_id int,
quantity int,
foreign key (contract_id) references contract (contract_id),
foreign key (attach_service_id) references attach_service (attach_service_id)
);

DELIMITER //
CREATE TRIGGER add_account
BEFORE insert ON employee
FOR EACH ROW
BEGIN
insert into `user` value (new.username, '12345');
END //
DELIMITER ;
-- drop trigger add_account;

DELIMITER //
CREATE TRIGGER delete_contract
BEFORE delete ON customer
FOR EACH ROW
BEGIN
delete from contract where customer_id = old.customer_id;
END //
DELIMITER ;
-- drop trigger delete_contract;

DELIMITER //
CREATE TRIGGER delete_contract_detail
BEFORE delete ON contract
FOR EACH ROW
BEGIN
delete from contract_detail where contract_id = old.contract_id;
END //
DELIMITER ;
-- drop trigger delete_contract_detail;


-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
insert into rent_type value (1, 'year'), (2, 'month'), (3, 'day'), (4, 'hour');
insert into service_type value (1, 'Villa'), (2, 'House'), (3, 'Room');

insert into service value
(1, 'Villa Beach Front', 		25000, 		10000000,	10,	3,	1,	'VIP',		'Have pool',	500,	4),
(2,	'House Princess 01', 		14000,		5000000,	7,	2,	2,	'VIP',		'Have oven',	null,	3),
(3,	'Room Twin 01',				5000, 		1000000, 	2, 	4,	3,	'Normal',	'Have TV',		null,	null),
(4,	'Villa No Beach Front',		22000,	 	9000000, 	8,	3,	1,	'Normal',	'Have pool',	300,	3),
(5,	'House Princess 02', 		10000,		4000000, 	5,	3,	2,	'Normal',	'Have oven',	null,	2),
(6,	'Room Twin 02',				3000, 		900000, 	2,	4,	3,	'Normal',	'Have TV',		null,	null);

insert into position value (1, 'Lễ tân'), (2, 'Phục vụ'), (3, 'Chuyên viên'), (4, 'Giám sát'), (5, 'Quản lý'), (6, 'Giám đốc');
insert into education_degree value (1, 'Intermediate'), (2, 'College'), (3, 'Univercity'), (4, 'After-college');
insert into division value (1, 'Sale-Marketing'), (2, 'Hành chính'), (3, 'Phục vụ'), (4, 'Quản lý');

insert into employee value
(1, 	'Nguyễn Văn An', 		'1970-11-07',	'456231786',	10000000,	'0901234121',	'annguyen@gmail.com',			'295 Nguyễn Tất Thành, Đà Nẵng',	1,		3,		1, 'annguyen@gmail.com'),
(2, 	'Lê Văn Bình',			'1997-04-09',	'654231234',	7000000,	'0934212314',	'binhlv@gmail.com',				'22 Yên Bái, Đà Nẵng',				1,		2,		2, 'binhlv@gmail.com'),
(3, 	'Hồ Thị Yến', 			'1995-12-12',	'999231723',	14000000,	'0412352315',	'thiyen@gmail.com',				'K234/11 Điện Biên Phủ, Gia Lai',	1,		3,		2, 'thiyen@gmail.com'),
(4, 	'Võ Công Toản',			'1980-04-04',	'123231365',	17000000,	'0374443232',	'toan0404@gmail.com',			'77 Hoàng Diệu, Quảng Trị',			1,		4,		4, 'toan0404@gmail.com'),
(5, 	'Nguyễn Bỉnh Phát',		'1999-12-09',	'454363232',	6000000,	'0902341231',	'phatphat@gmail.com',			'43 Yên Bái, Đà Nẵng',				2,		1,		1, 'phatphat@gmail.com'),
(6, 	'Khúc Nguyễn An Nghi',	'2000-11-08',	'964542311',	7000000,	'0978653213',	'annghi20@gmail.com',			'294 Nguyễn Tất Thành, Đà Nẵng',	2,		2,		3, 'annghi20@gmail.com'),
(7, 	'Nguyễn Hữu Hà',		'1993-01-01',	'534323231',	8000000,	'0941234553',	'nhh0101@gmail.com',			'4 Nguyễn Chí Thanh, Huế',			2,		3,		2, 'nhh0101@gmail.com'),
(8, 	'Nguyễn Hà Đông',		'1989-09-03',	'234414123',	9000000,	'0642123111',	'donghanguyen@gmail.com',		'111 Hùng Vương, Hà Nội',			2,		4,		4, 'donghanguyen@gmail.com'),
(9, 	'Tòng Hoang',			'1982-09-03',	'256781231',	6000000,	'0245144444',	'hoangtong@gmail.com',			'213 Hàm Nghi, Đà Nẵng',			2,		4,		4, 'hoangtong@gmail.com'),
(10,	'Nguyễn Công Đạo',		'1994-01-08',	'755434343',	8000000,	'0988767111',	'nguyencongdao12@gmail.com',	'6 Hoà Khánh, Đồng Nai',			2,		3,		2, 'nguyencongdao12@gmail.com');
insert into customer_type value (1, 'Diamond'), (2, 'Platinium'), (3, 'Gold'), (4, 'Silver'), (5, 'Member');
insert into customer value 
(1,		5,	'Nguyễn Thị Hào', 		'1970-11-07',	0,		'643431213',	'0945423362',	'thihao07@gmail.com',		'23 Nguyễn Hoàng, Đà Nẵng'),
(2,		3,	'Phạm Xuân Diệu',		'1992-08-08',	1,		'865342123',	'0954333333',	'xuandieu92@gmail.com',		'K77/22 Thái Phiên, Quảng Trị'),
(3,		1,	'Trương Đình Nghệ',		'1990-02-27',	1,		'488645199',	'0373213122',	'nghenhan2702@gmail.com',	'K323/12 Ông Ích Khiêm, Vinh'),
(4,		1,	'Dương Văn Quan',		'1981-07-08',	1,		'543432111',	'0490039241',	'duongquan@gmail.com',		'K453/12 Lê Lợi, Đà Nẵng'),
(5,		4,	'Hoàng Trần Nhi Nhi',	'1995-12-09',	0,		'795453345',	'0312345678',	'nhinhi123@gmail.com',		'224 Lý Thái Tổ, Gia Lai'),
(6,		4,	'Tôn Nữ Mộc Châu',		'2005-12-06',	0,		'732434215',	'0988888844',	'tonnuchau@gmail.com',		'37 Yên Thế, Đà Nẵng'),
(7,		1,	'Nguyễn Mỹ Kim',		'1984-04-08',	0,		'856453123',	'0912345698',	'kimcuong84@gmail.com',		'K123/45 Lê Lợi, Hồ Chí Minh'),
(8,		3,	'Nguyễn Thị Hào',		'1999-04-08',	0,		'965656433',	'0763212345',	'haohao99@gmail.com',		'55 Nguyễn Văn Linh, Kon Tum'),
(9,		1,	'Trần Đại Danh',		'1994-07-01',	1,		'432341235',	'0643343433',	'danhhai99@gmail.com',		'24 Lý Thường Kiệt, Quảng Ngãi'),
(10,	2,	'Nguyễn Tâm Đắc',		'1989-07-01',	1,		'344343432',	'0987654321',	'dactam@gmail.com',			'22 Ngô Quyền, Đà Nẵng');
insert into attach_service value 
(1,			'Karaoke',				10000,		'giờ',		'tiện nghi, hiện tại'),
(2,			'Thuê xe máy',			10000,		'chiếc',	'hỏng 1 xe'),
(3,			'Thuê xe đạp',			20000,		'chiếc',	'tốt'),
(4,			'Buffet buổi sáng',		15000,		'suất',		'đầy đủ đồ ăn, tráng miệng'),
(5,			'Buffet buổi trưa',		90000,		'suất',		'đầy đủ đồ ăn, tráng miệng'),
(6,			'Buffet buổi tối',		16000,		'suất',		'đầy đủ đồ ăn, tráng miệng');
insert into contract value
(1,			'2020-12-08',		'2020-12-08',		0,				3,	1,	3),
(2,			'2020-07-14',		'2020-07-21',		200000,			7,	3,	1),
(3,			'2021-03-15',		'2021-03-17',		50000,			3,	4,	2),
(4,			'2021-01-14',		'2021-01-18',		100000,			7,	5,	5),
(5,			'2021-07-14',		'2021-07-15',		0,				7,	2,	6),
(6,			'2021-06-01',		'2021-06-03',		0,				7,	7,	6),
(7,			'2021-09-02',		'2021-09-05',		100000,			7,	4,	4),
(8,			'2021-06-17',		'2021-06-18',		150000,			3,	4,	1),
(9,			'2020-11-19',		'2020-11-19',		0,				3,	4,	3),
(10,		'2021-04-12',		'2021-04-14',		0,				10,	3,	5),
(11,		'2021-04-25',		'2021-04-25',		0,				2,	2,	1),
(12,		'2021-05-25',		'2021-05-27',		0,				7,	10,	1);
insert into contract_detail value
(1,		5,		2,		4),
(2,		8,		2,		5),
(3,		12,		2,		6),
(4,		1,		3,		1),
(5,		11,		3,		2),
(6,		1,		1,		3),
(7,		2,		1,		2),
(8,		2,		6,		2);