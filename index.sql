//Tạo index
create index email_idx on users(user_email);
create index user_id_idx on orders(user_id);
create index order_id_idx on order_items(order_id);
create index product_id_idx on order_items(product_id);
show index from orders;
show index from users;
show index from products;
show index from order_items;