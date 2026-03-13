# Day 9: Index & Query Performance Foundation

## 1. Tại sao Query lại chậm?
Khi bảng có ít dữ liệu (ví dụ 1.000 dòng), Database có thể quét toàn bộ bảng (Full Table Scan) rất nhanh. Nhưng khi lên đến 1.000.000 dòng, việc đọc từng dòng từ ổ cứng để tìm một giá trị cụ thể sẽ gây nghẽn I/O và tốn CPU.

## 2. Index là gì?
Index (Chỉ mục) là một cấu trúc dữ liệu tách biệt (thường là B-Tree) giúp Database tìm kiếm bản ghi mà không cần quét toàn bộ bảng.
* **Ví dụ:** Giống như mục lục sách, thay vì lật từng trang để tìm chương 5, bạn nhìn mục lục và nhảy thẳng đến trang 120.



## 3. Các loại Index cơ bản
* **Primary Key Index:** Tự động được tạo khi bạn khai báo `PRIMARY KEY`. Đảm bảo tính duy nhất và truy xuất cực nhanh.
* **Secondary Index:** Do lập trình viên tự tạo trên các cột thường xuyên xuất hiện trong `WHERE`, `JOIN`, hoặc `ORDER BY`.
* **Composite Index:** Index trên nhiều cột cùng lúc. Thứ tự cột trong khai báo rất quan trọng (theo nguyên tắc tiền tố trái - Left-most prefix).

## 4. Công cụ EXPLAIN
Đây là "kính hiển vi" của lập trình viên Backend. 
* **Seq Scan (Sequential Scan):** Database đang quét toàn bộ bảng (Cảnh báo hiệu năng thấp nếu bảng lớn).
* **Index Scan:** Database đang sử dụng Index để tìm dữ liệu (Hiệu năng tốt).

## 5. Đánh đổi (Trade-off)
Index không phải là "phép màu" miễn phí:
* **Read:** Nhanh hơn vượt trội.
* **Write (INSERT/UPDATE/DELETE):** Chậm hơn vì mỗi lần thay đổi dữ liệu, Database phải cập nhật lại cả cấu trúc cây Index.
* **Storage:** Tốn thêm dung lượng ổ cứng để lưu trữ bộ Index.

## 6. Quy tắc "Vàng"
1. Index các cột trong điều kiện `WHERE`.
2. Luôn Index các Foreign Key (FK) để tăng tốc phép `JOIN`.
3. Không tạo Index cho các bảng quá nhỏ (dưới vài trăm dòng).
4. Không tạo Index cho các cột có độ chọn lọc thấp (ví dụ: cột `gender` chỉ có Nam/Nữ). 