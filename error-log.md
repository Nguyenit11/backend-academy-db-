## Tạo bảng theo yêu cầu
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC CHECK (price > 0),
    stock INT CHECK (stock >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

## Insert 5 production hợp lệ
INSERT INTO products (id, name, price, stock)
VALUES
(1, 'Laptop', 1200, 10),
(2, 'Phone', 800, 20),
(3, 'Tablet', 500, 15),
(4, 'Headphones', 150, 30),
(5, 'Keyboard', 100, 25);

## Insert dữ liệu sai (âm)
INSERT INTO products (id, name, price, stock)
VALUES (6, 'Mouse', -50, 10);
## ERROR:  new row for relation "products" violates check constraint "products_price_check"

## Insert dữ liệu sai (Null)
INSERT INTO products (id, name, price, stock)
VALUES (7, NULL, 200, 10);
## ERROR:  null value in column "name" of relation "products" violates not-null constraint

## Insert dữ liệu sai (Trùng)
INSERT INTO products (id, name, price, stock)
VALUES (1, 'Camera', 700, 5);
## ERROR:  duplicate key value violates unique constraint "products_pkey"
Key (id)=(1) already exists. 