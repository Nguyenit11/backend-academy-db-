## Bảng products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_stock INT
);

## Thêm dữ liệu vào bảng products
INSERT INTO products (product_name, product_stock) VALUES ('Laptop', 10);

## Test Dirty Read
## session 1:
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN; 
SELECT product_stock 
FROM products 
WHERE product_id = 1;
## Kết quả: 10

## Session 2:
BEGIN; 
UPDATE products SET product_stock = 5 
WHERE product_id = 1;
## product_stock tạm thời = 5

## Session 1 đọc lại
SELECT product_stock FROM products WHERE product_id = 1;
## Kết quả: 5 (Dirty Read)
## Kết luận Session 1 đọc: 5 Nhưng dữ liệu thật là: 10

## Test Non-Repeatable Read
## session 1:
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED; 
BEGIN;
SELECT product_stock FROM products 
WHERE product_id = 1;
## Kết quả: 10

## Session 2:
UPDATE products 
SET product_stock = 5 
WHERE product_id = 1; 
COMMIT;

## Session 1 đọc lại
SELECT product_stock FROM products 
WHERE product_id = 1;
## Kết quả: 5 (Non-Repeatable Read)
## Kết luận Trong cùng transaction: 10 → 5 Giá trị thay đổi.

## Test Phantom Read
## session 1:
## Tạo bảng orders.
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    total_amount INT
);
## Thêm dữ liệu vào bảng orders
INSERT INTO orders (total_amount) VALUES (50), (200), (300);

## Session 1
BEGIN;
SELECT *
FROM orders
WHERE total_amount > 100;
## Kết quả: 2 dòng (200, 300)

## Session 2
INSERT INTO orders (total_amount) VALUES (500);
COMMIT;

## Session 1 chạy lại query
SELECT *
FROM orders
WHERE total_amount > 100;

## Kết quả: 3 dòng (200, 300, 500) (Phantom Read)
## Kết luận: Trong cùng transaction, số dòng trả về thay đổi do có dòng mới



## Ví dụ về Lock trong SQL

## Session 1: Bắt đầu transaction và lock row sản phẩm
BEGIN;
SELECT * FROM products 
WHERE product_id = 1 FOR UPDATE;
## (Dòng sản phẩm với product_id = 1 sẽ bị lock, các transaction khác không thể update/delete until commit/rollback)

## Session 2: Cố gắng update stock của sản phẩm bị lock
UPDATE products SET product_stock = 5 WHERE product_id = 1;
## Result: Query waiting...

## Session 1: Kết thúc transaction (unlock row)
COMMIT;

## Sau khi Session 1 commit, Session 2 mới thực hiện được câu lệnh update
## Result: product_stock = 5
