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

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select id, order_date, total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.name as CustomerName, p.name as ProductName, d.amount from customer c
join `order` o on c.id = o.customer_id
join order_detail d on o.id = d.order_id
join product p on d.product_id = p.id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.name as CustomerName, o.id as OrderID from customer c
left join `order` o on c.id = o.customer_id
where o.id is null
group by c.name;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.id as OrderId, o.order_date, sum(p.price*d.amount) as totalPrice from `order` o
join order_detail d on o.id = d.order_id
join product p on p.id = d.product_id
group by o.id;