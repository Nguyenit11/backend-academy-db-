//Tạo bảng users
Create table users(
	user_id INT AUTO_INCREMENT PRIMARY Key,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    user_email varchar(255) unique not null,
    password_hash varchar(255) not null,
    created_at datetime default now()
);
//Thêm thông tin vào users
Insert into users(first_name, last_name, user_email, password_hash)
Values	('Cristiano', 'Ronaldo', 'cr7@gmail.com', '1234'),
		('Lionel', 'Messi', 'm10@gmail.com', '1234'),
        ('Bruno', 'Fernandes', 'br8@gmail.com', '1234'),
        ('Bruno', 'Guimaraes', 'bg39@gmail.com', '1234')

//tẠO BẢNG PRODUCTS
create table products(
	product_id int auto_increment primary key,
    product_name varchar(200) not null,
    product_desc Text,
    product_price DECIMAL(12, 2) NOT NULL CHECK (product_price > 0),
    stock int not null DEFAULT 0 check(stock>=0),
	product_category varchar(100)
);
//Thêm thông tin vào products
INSERT INTO products (product_name, product_desc, price, stock, category) VALUES
('Bàn phím cơ AKKO', 'Bàn phím 75%, switch Cream Blue', 1500000.00, 50, 'Gear'),
('Chuột Logitech G502', 'Chuột gaming quốc dân', 1200000.00, 30, 'Gear'),
('Màn hình Dell UltraSharp', 'Màn hình đồ họa 27 inch', 8500000.00, 10, 'Monitor'),
('Lót chuột vải', 'Size XL dày 4mm', 250000.00, 100, 'Accessory');

//Tạo bảng orders
create TABLE orders(
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10, 2),
    status ENUM('pending', 'shipped', 'delivered', 'cancelled'),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
////Thêm thông tin vào orders
INSERT INTO orders (user_id, total_amount, status) 
VALUES 
(1, 2700000.00, 'pending'), 
(2, 8500000.00, 'delivered'), 
(3, 1200000.00, 'cancelled'), 
(4, 250000.00, 'shipped');

//Tạo bảng order_items
create table order_items(
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
////Thêm thông tin vào order_items
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(13, 1, 1, 1500000.00), 
(13, 2, 1, 1200000.00),
(14, 3, 1, 8500000.00),
(15, 2, 2, 1200000.00),
(16, 4, 4, 250000.00);
