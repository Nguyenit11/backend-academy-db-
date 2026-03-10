-- Nối bảng orders và users để lấy thông tin email của người dùng cùng với mã đơn hàng của họ
Select user_email, order_id
From orders inner join users 
On orders.user_id = users.user_id;
-- Nối bảng orders, order_items và products để lấy thông tin chi tiết về 1 đơn hàng 
Select 
orders.order_id,
products.product_name,
order_items.order_item_price,
order_items.quantity
from orders
inner join order_items 
on orders.order_id = order_items.order_id
inner join products
on order_items.product_id=products.product_id
where orders.order_id=3;
-- Tính tổng số tiền của mỗi đơn hàng 
SELECT 
order_id,
SUM(quantity * order_item_price) AS total_order_amount
FROM order_items
GROUP BY order_id;