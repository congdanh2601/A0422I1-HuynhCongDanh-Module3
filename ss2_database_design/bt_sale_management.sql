create database sale_management;
use sale_management;

create table customer (
id int primary key auto_increment,
`name` varchar(20) not null,
age int
);

create table `order` (
id int primary key auto_increment,
order_date date,
customer_id int not null,
total_price float,
foreign key (customer_id) references customer (id)
);

create table product (
id int primary key auto_increment,
`name` varchar(20) not null unique,
price float
);

create table order_detail (
order_id int,
product_id int,
amount int,
primary key (order_id, product_id),
foreign key (order_id) references `order` (id),
foreign key (product_id) references product (id)
);

insert into customer values (1, 'Minh Quan', 10), (2, 'Ngoc Oanh', 20), (3, 'Hong Ha', 50);
insert into `order` values (1, '2006-3-21', 1, null), (2, '2006-3-23', 2, null), (3, '2006-3-16', 1, null);
insert into product value (1, 'May Giat', 3), (2, 'Tu Lanh', 5), (3, 'Dieu Hoa', 7), (4, 'Quat', 1), (5, 'Bep Dien', 2);
insert into order_detail values (1,1,3), (1,3,7), (1,4,2), (2,1,1), (3,1,8), (2,5,4), (2,3,3);

select id, order_date, total_price from `order`;
select c.name as CustomerName, p.name as ProductName, d.amount from customer c
join `order` o on c.id = o.customer_id
join order_detail d on o.id = d.order_id
join product p on d.product_id = p.id;
select c.name as CustomerName, o.order_date from customer c
left join `order` o on c.id = o.customer_id where order_date=null;