### 1. Transaction giải quyết vấn đề gì?
Transaction giúp đảm bảo dữ liệu **không bị sai lệch** khi thực hiện nhiều thao tác database liên tiếp.

### 2. Atomicity nghĩa là gì?
Atomicity có nghĩa là:
Tất cả thao tác trong transaction **hoặc thành công toàn bộ, hoặc thất bại toàn bộ**.

### 3. Nếu không rollback thì chuyện gì xảy ra?
Database có thể rơi vào trạng thái **nửa vời**, một số thao tác đã thành công nhưng các thao tác khác bị lỗi.

### 4. Vì sao transaction nên đặt ở service layer?
Service layer chứa **business logic** và thường thực hiện nhiều thao tác database liên tiếp, nên transaction cần được quản lý tại đây.

### 5. Oversell xảy ra khi nào?
Oversell xảy ra khi **nhiều người dùng mua cùng một sản phẩm cùng lúc** nhưng hệ thống không kiểm soát đúng số lượng tồn kho.
Kết quả có thể dẫn đến:
Stock < 0 (bán vượt số lượng tồn).