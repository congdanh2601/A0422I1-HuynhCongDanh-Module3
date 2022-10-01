CREATE DATABASE demo;
USE demo;

CREATE TABLE products(
id int primary key auto_increment,
product_code int,
product_name varchar(45) not null,
product_price double,
product_amount int,
product_description varchar(100),
product_status bit
);

insert into products values
(1, 23, 'bowl', 15, 2, 'fragile', 1),
(2, 48, 'spoon', 12, 5, 'metal', 1),
(3, 34, 'chopsticks', 4, 5, 'bamboo', 0),
(4, 4456, 'fork', 6, 3, 'metal', null),
(5, 342, 'spoon', 10, 7, 'metal', 0);

ALTER TABLE products ADD UNIQUE INDEX idx_code(product_code);
CREATE INDEX idx_name_price ON products(product_name, product_price);
CREATE INDEX idx_price_name ON products(product_price, product_name);

-- ALTER TABLE products DROP INDEX idx_code;
-- ALTER TABLE products DROP INDEX idx_name_price;
-- ALTER TABLE products DROP INDEX idx_price_name;

EXPLAIN SELECT * FROM products where product_name = 'fork';
EXPLAIN SELECT * FROM products where product_code = 34;
EXPLAIN SELECT * FROM products where id = 3;
EXPLAIN SELECT * FROM products where product_description = 'metal';
EXPLAIN SELECT * FROM products where product_status = 1;
EXPLAIN SELECT * FROM products where product_price = 12;
EXPLAIN SELECT * FROM products where product_amount = 5;

-- Tạo view
CREATE VIEW products_view AS 
SELECT product_code, product_name, product_price, product_status FROM products;

-- Sửa đổi view
UPDATE products_view SET product_status = 1 WHERE product_name = 'chopsticks';
INSERT products_view VALUE (452, 'glass', 45, 1);
DELETE FROM products_view WHERE product_code = 452;

-- Xóa view
DROP VIEW products_view;

-- Tạo Stored procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE show_products()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_new_product(id int, product_code int, product_name varchar(45), product_price double,
product_amount int, product_description varchar(100), product_status bit)
BEGIN
INSERT INTO products VALUE (id, product_code, product_name, product_price, product_amount, product_description, product_status);
END //
DELIMITER ;

CALL add_new_product(8, 231, 'plate', 35, 2, 'white', 0);

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE update_product_by_id(id int, product_code int, product_name varchar(45), product_price double,
product_amount int, product_description varchar(100), product_status bit)
BEGIN
UPDATE products p SET p.product_code = product_code, p.product_name = product_name, p.product_price = product_price, p.product_amount = product_amount,
p.product_description = product_description, p.product_status = product_status WHERE p.id = id;
END //
DELIMITER ;

CALL update_product_by_id(8, 238, 'plate', 40, 3, 'blue', 1);

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_product_by_id(id int)
BEGIN
DELETE FROM products p WHERE p.id = id;
END //
DELIMITER ;

CALL delete_product_by_id(8);
