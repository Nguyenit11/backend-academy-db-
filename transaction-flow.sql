//Transaction
Start transaction;
-- Kiểm tra stock
Select * from products where product_id=1 for update;
-- Tạo order
INSERT INTO orders (user_id, total_amount, status) 
VALUES (1, 1500000.00, 'pending');
-- Tạo order_items
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase)
VALUES (LAST_INSERT_ID(), 1, 1, 1500000.00);
-- Trừ stock
UPDATE products 
SET stock = stock - 1 
WHERE product_id = 1;

//nếu đúng chạy commit;
//Nếu sai hoặc muốn hủy thì chạy rollback

