**Vì sao cần Foreign Key?**
Đơn giản vì nó là khóa phụ, vừa đóng vai trò là ràng buộc (ngăn chặn việc xóa một User trong khi User đó vẫn còn Đơn hàng) và vừa đóng vai trò là mối lên kết giữa các bảng
**Vì sao order_items lưu price riêng?**
Vì có khả năng lúc mua sẽ nhận discount:v

**Vì sao cần transaction?**
Vì đảm được ACID, tránh trường hợp 1 bên successful 1 bên failed
**Vì sao cần index?**
Index là chỉ mục ,nó giống như mục lục như sgk, giúp giảm thời gian tiết kiệm vì không cần phải quét hết bản để tìm dữ liệu

**Nếu bỏ constraint thì rủi ro gì?**
Mất tính toàn vẹn và logic, ví dụ email, số điện thoại không thể trùng, giá tiền âm. Rủi ro về mối quan hệ, vì nếu bỏ Foreign Key Constraint, một nhân viên có thể lỡ tay xóa mất một Sản phẩm đang có hàng nghìn người đặt, dẫn đến hệ thống bị crash khi cố gắng tìm tên sản phẩm đó để in hóa đơn
