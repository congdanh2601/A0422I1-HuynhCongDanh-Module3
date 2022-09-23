create database product_manager;

use product_manager;
create table export_paper (
id int primary key auto_increment,
export_date date
);

create table product (
id int primary key auto_increment,
`name` varchar(30) not null
);

create table export_detail (
export_id int,
product_id int,
unit_price float,
amount int,
primary key (export_id, product_id),
foreign key (export_id) references export_paper (id),
foreign key (product_id) references product (id)
);

create table import_paper (
id int primary key auto_increment,
import_date date
);

create table import_detail (
import_id int,
product_id int,
unit_price float,
amount int,
primary key (import_id, product_id),
foreign key (import_id) references import_paper (id),
foreign key (product_id) references product (id)
);

create table supplier (
id int primary key auto_increment,
`name` varchar(30) not null,
address varchar(50),
phone varchar(10)
);

create table order_paper (
id int primary key auto_increment,
order_date date,
supplier_id int,
foreign key (supplier_id) references supplier (id)
);

create table order_detail (
order_id int,
product_id int,
unit_price float,
amount int,
primary key (order_id, product_id),
foreign key (order_id) references order_paper (id),
foreign key (product_id) references product (id)
);

