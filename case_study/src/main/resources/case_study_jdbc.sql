create database furama_resort_2;
use furama_resort_2;

create table rent_type (
rent_type_id int PRIMARY KEY auto_increment,
rent_type_name VARCHAR(45) not null,
rent_type_cost DOUBLE
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
foreign key (rent_type) references rent_type (rent_type_id),
foreign key (service_type) references service_type (service_type_id)
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

create table attach_service (
attach_service_id int PRIMARY KEY auto_increment,
attach_service_name VARCHAR(45) not null,
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);

create table contract (
contract_id int PRIMARY KEY auto_increment,
contract_start_day datetime,
contract_end_day datetime,
contract_deposit double,
contract_total_money double,
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

-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
insert into rent_type value (1, 'year'), (2, 'month'), (3, 'day'), (4, 'hour');
insert into service_type value (1, 'Villa'), (2, 'House'), (3, 'Room');

insert into service value
(1, 'Villa Beach Front', 		25000, 		10000000,	10,		'VIP',		'Have pool',	500,	4,		3,	1),
(2,	'House Princess 01', 		14000,		5000000,	7,		'VIP',		'Have oven',	null,	3,		2,	2),
(3,	'Room Twin 01',				5000, 		1000000, 	2, 		'Normal',	'Have TV',		null,	null,	4,	3),
(4,	'Villa No Beach Front',		22000,	 	9000000, 	8,		'Normal',	'Have pool',	300,	3,		3,	1),
(5,	'House Princess 02', 		10000,		4000000, 	5,		'Normal',	'Have oven',	null,	2,		3,	2),
(6,	'Room Twin 02',				3000, 		900000, 	2,		'Normal',	'Have TV',		null,	null,	4,	3);

insert into employee_position value (1, 'Lễ tân'), (2, 'Phục vụ'), (3, 'Chuyên viên'), (4, 'Giám sát'), (5, 'Quản lý'), (6, 'Giám đốc');
insert into employee_level value (1, 'Intermediate'), (2, 'College'), (3, 'Univercity'), (4, 'After-college');
insert into employee_department value (1, 'Sale-Marketing'), (2, 'Hành chính'), (3, 'Phục vụ'), (4, 'Quản lý');
insert into employee value
(1, 	'Nguyễn Văn An', 		'1970-11-07',	'456231786',	10000000,	'0901234121',	'annguyen@gmail.com',			'295 Nguyễn Tất Thành, Đà Nẵng',	1,		3,		1),
(2, 	'Lê Văn Bình',			'1997-04-09',	'654231234',	7000000,	'0934212314',	'binhlv@gmail.com',				'22 Yên Bái, Đà Nẵng',				1,		2,		2),
(3, 	'Hồ Thị Yến', 			'1995-12-12',	'999231723',	14000000,	'0412352315',	'thiyen@gmail.com',				'K234/11 Điện Biên Phủ, Gia Lai',	1,		3,		2),
(4, 	'Võ Công Toản',			'1980-04-04',	'123231365',	17000000,	'0374443232',	'toan0404@gmail.com',			'77 Hoàng Diệu, Quảng Trị',			1,		4,		4),
(5, 	'Nguyễn Bỉnh Phát',		'1999-12-09',	'454363232',	6000000,	'0902341231',	'phatphat@gmail.com',			'43 Yên Bái, Đà Nẵng',				2,		1,		1),
(6, 	'Khúc Nguyễn An Nghi',	'2000-11-08',	'964542311',	7000000,	'0978653213',	'annghi20@gmail.com',			'294 Nguyễn Tất Thành, Đà Nẵng',	2,		2,		3),
(7, 	'Nguyễn Hữu Hà',		'1993-01-01',	'534323231',	8000000,	'0941234553',	'nhh0101@gmail.com',			'4 Nguyễn Chí Thanh, Huế',			2,		3,		2),
(8, 	'Nguyễn Hà Đông',		'1989-09-03',	'234414123',	9000000,	'0642123111',	'donghanguyen@gmail.com',		'111 Hùng Vương, Hà Nội',			2,		4,		4),
(9, 	'Tòng Hoang',			'1982-09-03',	'256781231',	6000000,	'0245144444',	'hoangtong@gmail.com',			'213 Hàm Nghi, Đà Nẵng',			2,		4,		4),
(10,	'Nguyễn Công Đạo',		'1994-01-08',	'755434343',	8000000,	'0988767111',	'nguyencongdao12@gmail.com',	'6 Hoà Khánh, Đồng Nai',			2,		3,		2);
insert into customer_type value (1, 'Diamond'), (2, 'Platinium'), (3, 'Gold'), (4, 'Silver'), (5, 'Member');
insert into customer value 
(1,		'Nguyễn Thị Hào', 		'1970-11-07',	0,		'643431213',	'0945423362',	'thihao07@gmail.com',		'23 Nguyễn Hoàng, Đà Nẵng',				5),
(2,		'Phạm Xuân Diệu',		'1992-08-08',	1,		'865342123',	'0954333333',	'xuandieu92@gmail.com',		'K77/22 Thái Phiên, Quảng Trị',			3),
(3,		'Trương Đình Nghệ',		'1990-02-27',	1,		'488645199',	'0373213122',	'nghenhan2702@gmail.com',	'K323/12 Ông Ích Khiêm, Vinh',			1),
(4,		'Dương Văn Quan',		'1981-07-08',	1,		'543432111',	'0490039241',	'duongquan@gmail.com',		'K453/12 Lê Lợi, Đà Nẵng',				1),
(5,		'Hoàng Trần Nhi Nhi',	'1995-12-09',	0,		'795453345',	'0312345678',	'nhinhi123@gmail.com',		'224 Lý Thái Tổ, Gia Lai',				4),
(6,		'Tôn Nữ Mộc Châu',		'2005-12-06',	0,		'732434215',	'0988888844',	'tonnuchau@gmail.com',		'37 Yên Thế, Đà Nẵng',					4),
(7,		'Nguyễn Mỹ Kim',		'1984-04-08',	0,		'856453123',	'0912345698',	'kimcuong84@gmail.com',		'K123/45 Lê Lợi, Hồ Chí Minh',			1),
(8,		'Nguyễn Thị Hào',		'1999-04-08',	0,		'965656433',	'0763212345',	'haohao99@gmail.com',		'55 Nguyễn Văn Linh, Kon Tum',			3),
(9,		'Trần Đại Danh',		'1994-07-01',	1,		'432341235',	'0643343433',	'danhhai99@gmail.com',		'24 Lý Thường Kiệt, Quảng Ngãi',		1),
(10,	'Nguyễn Tâm Đắc',		'1989-07-01',	1,		'344343432',	'0987654321',	'dactam@gmail.com',			'22 Ngô Quyền, Đà Nẵng',				2);
insert into addition_service value 
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
(3,		15,		2,		6),
(4,		1,		3,		1),
(5,		11,		3,		2),
(6,		1,		1,		3),
(7,		2,		1,		2),
(8,		2,		12,		2);

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from employee
where (employee_name like 'H%' or employee_name like 'T%' or employee_name like 'K%') and char_length(employee_name) <= 15;
-- where employee_name regexp '[HKT][a-vxyỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâđ]+$' and char_length(employee_name) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from customer
where year(now()) - year(birthday) >= 18 and year(now()) - year(birthday) <=50 and (address like '%Đà Nẵng%' or address like '%Quảng Trị%');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select cu.customer_name, count(co.id) as number_of_booking, t.customer_type_name as customer_type
from customer cu join contract co on cu.id = co.customer
join customer_type t on cu.customer_type = t.id
where cu.customer_type = 1
group by cu.id order by count(co.id);

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT cu.id AS customer_id, cu.customer_name, cu.customer_type, co.id AS contract_id, s.service_name, co.start_day, 
co.end_day, ssp.sum_service_price + sum(a.price * cd.amount) as total_money
FROM customer cu
LEFT JOIN contract co ON cu.id = co.customer
LEFT JOIN service s ON co.service = s.id
LEFT JOIN (
	SELECT cu.id AS customer_id, sum(s.price) as sum_service_price
    FROM customer cu
	LEFT JOIN contract co ON cu.id = co.customer
    LEFT JOIN service s ON co.service = s.id
    GROUP BY cu.id
) ssp ON cu.id = ssp.customer_id
LEFT JOIN contract_detail cd ON co.id = cd.contract_id
LEFT JOIN addition_service a ON cd.addition_service = a.id
GROUP BY cu.id;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ (trong) quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT s.id, s.service_name, s.area, s.price, t.service_type_name, c.start_day
FROM service s
RIGHT JOIN service_type t ON s.service_type = t.id
LEFT JOIN contract c ON c.service = s.id
WHERE c.service NOT IN (SELECT service FROM contract WHERE year(start_day) = 2021 and month(start_day) in (1, 2, 3))
GROUP BY c.service;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT s.id, s.service_name, s.area, s.capacity, s.price, t.service_type_name, c.start_day as last_ordered_day
FROM service s
RIGHT JOIN service_type t on s.service_type = t.id
LEFT JOIN contract c on c.service = s.id
WHERE c.service not in (SELECT service FROM contract WHERE year(start_day) = 2021) 
and c.service in (SELECT service FROM contract WHERE year(start_day) = 2020)
GROUP BY c.service;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
SELECT DISTINCT customer_name FROM customer;
SELECT customer_name FROM customer GROUP BY customer_name;
SELECT customer_name FROM customer UNION SELECT customer_name FROM customer;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(start_day) AS `month`, count(id) AS number_of_booking
FROM contract 
WHERE YEAR(start_day) = 2021
GROUP BY `month`;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm
-- ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT c.id AS contract_id, c.start_day, c.end_day, c.deposit, sum(cd.amount) AS number_of_addition_service
FROM contract c
LEFT JOIN contract_detail cd ON c.id = cd.contract_id
GROUP BY c.id;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT c.customer_name, ct.customer_type_name, c.address, a.addition_service_name
FROM customer c
JOIN customer_type ct ON ct.id = c.customer_type
JOIN contract ON contract.customer = c.id
JOIN contract_detail cd ON cd.contract_id = contract.id
JOIN addition_service a ON a.id = cd.addition_service
WHERE c.address like '%Vinh' or c.address like '%Quảng Ngãi';

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT co.id AS contract_id, cu.customer_name, e.employee_name, cu.phone, s.service_name, sum(cd.amount) AS number_of_addition_service, co.deposit
FROM contract co
LEFT JOIN customer cu ON cu.id = co.customer
LEFT JOIN employee e ON e.id = co.employee
LEFT JOIN service s ON s.id = co.service
LEFT JOIN contract_detail cd ON cd.contract_id = co.id
WHERE co.service not in (SELECT service FROM contract WHERE year(start_day) = 2021 AND month(start_day) <= 6) 
AND co.service in (SELECT service FROM contract WHERE year(start_day) = 2020 AND month(start_day) >= 10)
GROUP BY co.id;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
CREATE VIEW addition_service_usage AS
SELECT a.id, a.addition_service_name, sum(cd.amount) AS number_of_usage
FROM addition_service a
LEFT JOIN contract_detail cd on cd.addition_service = a.id
GROUP BY a.id;
SELECT m.id, m.addition_service_name, m.number_of_usage
FROM (SELECT * FROM addition_service_usage) m
WHERE m.number_of_usage = (SELECT max(number_of_usage) FROM addition_service_usage)
GROUP BY m.id;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT c.id, st.service_type_name, a.addition_service_name, count(cd.addition_service) AS addition_service_usage_times
FROM contract c
LEFT JOIN service s ON s.id = c.service
LEFT JOIN service_type st ON st.id = s.service_type
LEFT JOIN contract_detail cd ON cd.contract_id = c.id
LEFT JOIN addition_service a ON a.id = cd.addition_service
GROUP BY a.id
HAVING addition_service_usage_times = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT e.id AS employee_id, e.employee_name, e.level, e.department, e.phone, e.address, count(c.id) AS number_of_contracts
FROM employee e
LEFT JOIN contract c ON c.employee = e.id
WHERE YEAR(c.start_day) in (2020, 2021)
GROUP BY e.id
HAVING number_of_contracts <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
DELETE FROM employee e
WHERE e.id NOT IN (
SELECT c.employee
FROM contract c 
WHERE YEAR(start_day) IN (2019, 2020, 2021)
);

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng 
-- với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
CREATE VIEW customer_platinum_money_bigger_10000000 AS
(SELECT cu.id AS customer_id, ct.id AS customer_type_id, ssp.sum_service_price + sum(a.price * cd.amount) as total_money
FROM customer cu
LEFT JOIN customer_type ct on ct.id = cu.customer_type
LEFT JOIN contract co ON cu.id = co.customer
LEFT JOIN service s ON co.service = s.id
LEFT JOIN (
	SELECT cu.id AS customer_id, sum(s.price) as sum_service_price
    FROM customer cu
	LEFT JOIN contract co ON cu.id = co.customer
    LEFT JOIN service s ON co.service = s.id
    GROUP BY cu.id
) ssp ON cu.id = ssp.customer_id
LEFT JOIN contract_detail cd ON co.id = cd.contract_id
LEFT JOIN addition_service a ON cd.addition_service = a.id
WHERE ct.id = 2
GROUP BY cu.id
HAVING total_money > 10000000);

UPDATE customer c SET c.customer_type = 1
WHERE c.customer_type IN (SELECT customer_type_id FROM customer_platinum_money_bigger_10000000);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set foreign_key_checks = 0;
DELETE FROM customer cu
WHERE cu.id IN
(SELECT c.customer
FROM contract c
WHERE YEAR(c.start_day) < 2021);
set foreign_key_checks = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
CREATE VIEW addition_service_with_usage AS (
SELECT a.id AS addition_service_id, a.addition_service_name, sum(cd.amount) AS number_of_usage
FROM contract c
JOIN contract_detail cd ON cd.contract_id = c.id
JOIN addition_service a ON a.id = cd.addition_service
WHERE YEAR(start_day) = 2020
GROUP BY addition_service_id
HAVING number_of_usage > 10
);
UPDATE addition_service
SET price = price * 2
WHERE id IN (SELECT addition_service_id FROM addition_service_with_usage);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT id, customer_name AS `name`, email, phone, birthday, address
FROM customer 
UNION
SELECT id, employee_name, email, phone, birthday, address
FROM employee;

-- ADVANCED SQL
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một
-- hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_employee AS (
SELECT e.id AS employee_id, e.employee_name, e.address, c.start_day
FROM employee e
JOIN contract c ON c.employee = e.id
WHERE e.address like '%Hải Châu%' AND c.start_day = '2019-12-12'
GROUP BY e.id);

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
UPDATE employee SET address = 'Liên Chiểu'
WHERE id in (SELECT employee_id FROM v_employee);

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của
-- sp_xoa_khach_hang.
DELIMITER //
CREATE PROCEDURE sp_delete_customer(id int)
BEGIN
DELETE FROM customer c
WHERE c.id = id;
END //
DELIMITER ;
CALL sp_delete_customer(2);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của 
-- dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER //
CREATE PROCEDURE sp_add_new_contract (id int)
BEGIN
IF id NOT IN (SELECT c.id FROM contract c) THEN
INSERT INTO contract (id) VALUE (id);
END IF;
END //
DELIMITER ;
CALL sp_add_new_contract(51);
SELECT * FROM contract;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện
-- console của database. Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table if not exists number_of_contracts_log (
number_of_contract int
);
DELIMITER //
CREATE TRIGGER tr_delete_contract
AFTER DELETE ON contract
FOR EACH ROW 
BEGIN
declare c int;
select count(id) into c from contract;
insert into number_of_contract_log value (c);
END //
DELIMITER ;
select * from number_of_contract_log;

-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau:
-- Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo
-- “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
DELIMITER //
CREATE TRIGGER tr_update_contract_end_day
AFTER UPDATE ON contract
FOR EACH ROW
BEGIN
IF datediff(new.end_day, old.star_day) < 2 THEN signal SQLSTATE '02000' set MESSAGE_TEXT = 'Invaild start date';
END IF;
END //
DELIMITER ;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
DELIMITER //
CREATE FUNCTION func_count_service()
RETURNS int
DETERMINISTIC
BEGIN
DECLARE count int;
SELECT count(*) into count From (
SELECT c.id, sum(price) as total_price from contract c 
join service s ON s.id = c.service
GROUP BY s.id
HAVING total_price > 2000000) tmp;
RETURN count;
END //
DELIMITER ;
select func_count_service();

-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng
-- đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.
DELIMITER //
CREATE FUNCTION func_cal_longest_time(in_customer_id int)
RETURNS int
DETERMINISTIC
BEGIN
DECLARE longest_time INT;
DECLARE para int;
SET para = in_customer_id;
SELECT max(tmp.stay_period_in_day) into longest_time
FROM 
(SELECT datediff(end_day, start_day) AS stay_period_in_day
FROM contract co
JOIN customer cu ON cu.id = co.customer
WHERE cu.id = para) tmp;
RETURN longest_time;
END //
SELECT func_cal_longest_time(3);

-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019
-- để xóa thông tin của các dịch vụ đó (tức là xóa các bản ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những
-- bản ghi trong bảng hop_dong) và những bảng liên quan khác.
DELIMITER //
CREATE PROCEDURE sp_delete_service_contract_room()
BEGIN
SET @myvar:= (SELECT DISTINCT GROUP_CONCAT(c.id)
FROM contract c
JOIN service s ON c.service = s.id
JOIN service_type st ON st.id = s.service_type
WHERE st.service_type_name = 'Room' AND YEAR(c.start_day) BETWEEN 2015 and 2019);
DELETE FROM contract_detail WHERE FIND_IN_SET(contract_id, @myvar);
DELETE FROM contract WHERE FIND_IN_SET(id, @myvar);
DELETE FROM service WHERE id IN (
	SELECT service FROM contract
    WHERE FIND_IN_SET(id, @myvar)
	);
END //
DELIMITER ;