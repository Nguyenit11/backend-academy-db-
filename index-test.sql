Chạy EXPLAIN trước khi tạo index
explain select * from users where email = 'abc@gmail.com'


Tạo index email
create index email_idx on users(email);
Chạy lại EXPLAIN
=> tye index
So sánh
Nó khác biệt rõ ở phần type all và index
    all: quét toàn bộ bảng
    index: sử dụng index để tìm kiếm nhanh hơn

Tạo index FK orders.user_id
create index user_id_idx on orders(user_id);
show index from orders;
