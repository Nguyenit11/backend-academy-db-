//Thêm thông tin vào users
Insert into users(first_name, last_name, user_email, password_hash)
Values	('Cristiano', 'Ronaldo', 'cr7@gmail.com', '1234'),
		('Lionel', 'Messi', 'm10@gmail.com', '1234'),
        ('Bruno', 'Fernandes', 'br8@gmail.com', '1234'),
        ('Bruno', 'Guimaraes', 'bg39@gmail.com', '1234')


//Thêm thông tin vào products
INSERT INTO products (product_name, product_desc, price, stock, category) VALUES
('Bàn phím cơ AKKO', 'Bàn phím 75%, switch Cream Blue', 1500000.00, 50, 'Gear'),
('Chuột Logitech G502', 'Chuột gaming quốc dân', 1200000.00, 30, 'Gear'),
('Màn hình Dell UltraSharp', 'Màn hình đồ họa 27 inch', 8500000.00, 10, 'Monitor'),
('Lót chuột vải', 'Size XL dày 4mm', 250000.00, 100, 'Accessory');


////Thêm thông tin vào orders
INSERT INTO orders (user_id, total_amount, status) 
VALUES 
(1, 2700000.00, 'pending'), 
(2, 8500000.00, 'delivered'), 
(3, 1200000.00, 'cancelled'), 
(4, 250000.00, 'shipped');


////Thêm thông tin vào order_items
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(13, 1, 1, 1500000.00), 
(13, 2, 1, 1200000.00),
(14, 3, 1, 8500000.00),
(15, 2, 2, 1200000.00),
(16, 4, 4, 250000.00);
