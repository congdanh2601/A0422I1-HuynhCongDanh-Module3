create database furama_resort;
use furama_resort;

create table rent_type (
id int PRIMARY KEY auto_increment,
rent_type_name VARCHAR(45) not null
);

create table service_type (
id int PRIMARY KEY auto_increment,
service_type_name VARCHAR(45) not null
);

create table service (
id int PRIMARY KEY auto_increment,
service_name VARCHAR(45) not null,
area float,
price double,
capacity int,
room_standard varchar(45),
other_util varchar(45),
pool_area float,
floor int,
rent_type int references rent_type (id),
service_type int references service_type (id)
);

create table employee_position (
id int PRIMARY KEY auto_increment,
employee_position_name VARCHAR(45) not null
);

create table employee_level (
id int PRIMARY KEY auto_increment,
employee_level_name VARCHAR(45) not null
);

create table employee_department (
id int PRIMARY KEY auto_increment,
employee_department_name VARCHAR(45) not null
);

create table employee (
id int PRIMARY KEY auto_increment,
employee_name VARCHAR(45) not null,
birthday date,
id_card varchar(12),
salary double,
phone varchar(10),
email varchar(45),
address varchar(45),
position int references employee_position (id),
`level` int references employee_level (id),
department int references employee_department (id)
);

create table customer_type (
id int PRIMARY KEY auto_increment,
customer_type_name VARCHAR(45) not null
);

create table customer (
id int PRIMARY KEY auto_increment,
customer_name VARCHAR(45) not null,
birthday date,
sex bit,
id_card varchar(12),
phone varchar(10),
email varchar(45),
address varchar(45),
customer_type int references customer_type (id)
);

create table addition_service (
id int PRIMARY KEY auto_increment,
addition_service_name VARCHAR(45) not null,
price double,
unit varchar(10),
`status` varchar(45)
);

create table contract (
id int PRIMARY KEY auto_increment,
start_day datetime,
end_day datetime,
deposit double,
employee int references employee (id),
customer int references customer (id),
service int references service (id)
);

create table contract_detail (
id int PRIMARY KEY auto_increment,
amount int,
contract_id int references contract (id),
addition_service int references addition_service (id)
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

-- 5.	(CHƯA XONG tổng tiền) Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
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

-- select cu.id as customer_id, cu.customer_name, t.customer_type_name as customer_type, co.id as contract_id, s.service_name,
-- co.start_day, co.end_day, s.price as service_price, cd.amount, a.price
-- from customer cu
-- left join customer_type t on cu.customer_type = t.id
-- left join contract co on cu.id = co.customer
-- left join service s on co.service = s.id
-- left join contract_detail cd on co.id = cd.contract_id
-- left join addition_service a on cd.addition_service = a.id
-- group by cu.id;
-- select c.id, cd.amount, a.price from contract_detail cd
-- join addition_service a on cd.addition_service = a.id
-- join contract c on c.id = cd.contract_id;

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



-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(start_day) AS `month`, count(id) AS number_of_booking
FROM contract 
WHERE YEAR(start_day) = 2021
GROUP BY `month`;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm
-- ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT c.id, c.start_day, c.end_day, c.deposit, sum(cd.amount) AS number_of_addition_service
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


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.


-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng 
-- với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
