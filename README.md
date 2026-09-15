# 🛒 Electro - Website Thương Mại Điện Tử Thiết Bị Công Nghệ

**Electro** là hệ thống ứng dụng web thương mại điện tử chuyên nghiệp kinh doanh các sản phẩm thiết bị công nghệ, điện tử (Điện thoại, Laptop, Máy ảnh, Phụ kiện...). Ứng dụng được thiết kế theo kiến trúc MVC tối ưu, sử dụng công nghệ **Java Web (Servlet/JSP)**, **Jakarta EE**, **JDBC** và **MySQL Database**.

---

## 🌟 Tính Năng Nổi Bật

### 🛒 Dành Cho Khách Hàng (Storefront)

- **Trang chủ & Danh mục sản phẩm**: Hiển thị sản phẩm hot, khuyến mãi, tìm kiếm & lọc theo giá, thương hiệu, loại sản phẩm.
- **Chi tiết sản phẩm**: Xem chi tiết thông số, tình trạng tồn kho, đánh giá xếp hạng sao và bình luận.
- **Giỏ hàng & Thanh toán**: Quản lý giỏ hàng trực quan, tính toán tự động tổng tiền, giảm giá và tiến hành đặt hàng.
- **Tài khoản người dùng**: Đăng ký, đăng nhập, quản lý thông tin cá nhân và xem lịch sử đơn hàng.
- **Yêu thích & So sánh**: Thêm sản phẩm yêu thích và so sánh các thông số sản phẩm.

### 🛡️ Dành Cho Quản Trị Viên (Admin Dashboard)

- **Tổng quan (Dashboard)**: Thống kê doanh thu, tổng số đơn hàng, khách hàng mới và biểu đồ kinh doanh.
- **Quản lý sản phẩm & Tồn kho**: Thêm/Sửa/Xóa sản phẩm, cập nhật số lượng tồn kho và khuyến mãi.
- **Quản lý đơn hàng**: Theo dõi trạng thái đơn hàng (Chờ xử lý, Đã xác nhận, Đang giao, Đã giao, Hủy).
- **Quản lý người dùng & Đánh giá**: Phân quyền hệ thống (Admin, User), duyệt hoặc ẩn bình luận/đánh giá.
- **Xuất báo cáo (Export)**: Xuất báo cáo doanh thu và bán hàng ra file **Excel (.xlsx)** và **PDF**.

---

## 🛠️ Công Nghệ Sử Dụng

- **Backend**: Java 21, Servlet (Jakarta EE 10), JSP / JSTL, JDBC.
- **Database**: MySQL 8.x (Truy vấn tối ưu, hỗ trợ UTF-8 Unicode full).
- **Frontend**: HTML5, CSS3, JavaScript (jQuery, AJAX), Bootstrap, FontAwesome 4.7.
- **Build Tool**: Apache Maven 3.x.
- **Server Application**: Apache Tomcat 10.1+.

---

## 📂 Cấu Trúc Dự Án

```text
electro/
├── data/
│   └── database/           # Tệp SQL khởi tạo CSDL & dữ liệu mẫu (db.sql)
├── src/
│   ├── main/
│   │   ├── java/com/linh/web/
│   │   │   ├── api/        # REST APIs xử lý AJAX (Giỏ hàng, Wishlist...)
│   │   │   ├── controller/ # Servlets điều hướng (Web & Admin)
│   │   │   ├── dto/        # Data Transfer Objects (Request/Response)
│   │   │   ├── model/      # Entity Models (Product, User, Order...)
│   │   │   ├── repository/ # Tầng truy vấn dữ liệu JDBC DAOs
│   │   │   ├── service/    # Tầng xử lý nghiệp vụ Business Logic
│   │   │   └── util/       # Utility helpers (JDBC, Pagination, Exporters)
│   │   ├── resources/      # Tài nguyên hệ thống & Font chữ
│   │   └── webapp/
│   │       ├── assets/     # Static files (CSS, JS, Images, Fonts)
│   │       └── views/      # Giao diện JSP (Pages, Commons, Taglibs)
│   └── test/               # Unit tests & Integration tests
├── pom.xml                 # Cấu hình Maven dependencies
└── README.md               # Tài liệu hướng dẫn dự án
```

---

## 🚀 Cài Đặt & Chạy Dự Án

### 1. Yêu cầu môi trường

- **Java JDK 21**
- **MySQL Server 8.0+**
- **Apache Tomcat 10.1+**
- **IntelliJ IDEA** (khuyên dùng) hoặc Eclipse / NetBeans

---

### 2. Khởi tạo Cơ sở dữ liệu (MySQL)

1. Mở MySQL Terminal hoặc công cụ quản lý CSDL (MySQL Workbench / DBeaver / Navicat).
2. Tạo CSDL tên `cellphoneS`:
   ```sql
   CREATE DATABASE cellphoneS CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
3. Import tệp SQL khởi tạo dữ liệu tại `data/database/db.sql`:
   ```bash
   mysql -u root -p cellphoneS < data/database/db.sql
   ```

---

### 3. Cấu hình Kết Nối Cơ Sở Dữ Liệu

Mở tệp `src/main/java/com/linh/web/util/JDBCUtils.java` và cập nhật thông tin tài khoản MySQL của bạn:

```java
private static final String DB_URL = "jdbc:mysql://localhost:3306/cellphoneS?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "your_mysql_password"; // Điền mật khẩu MySQL local tại đây
```

---

### 4. Chạy Ứng Dụng Trên IntelliJ IDEA

1. Mở **IntelliJ IDEA** $\rightarrow$ chọn **Open** $\rightarrow$ trỏ đến thư mục `electro`.
2. Chờ Maven tải đủ các thư viện phụ thuộc (`dependencies`).
3. Đảm bảo JDK dự án được thiết lập là **Java 21** (_File -> Project Structure -> Project SDK_).
4. Cấu hình Run/Debug với Tomcat:
   - Vào **Run -> Edit Configurations...** $\rightarrow$ Thêm mới **Tomcat Server (Local)**.
   - Tại tab **Deployment**, thêm artifact `linh:war exploded`.
   - Đặt **Application context** là `/` (hoặc `/electro`).
5. Nhấn **Run** (Shift + F10).
6. Truy cập hệ thống tại: [http://localhost:8080/](http://localhost:8080/)

---

## 📧 Liên Hệ & Hỗ Trợ

- **Tác giả**: Lê Duy Linh (`duylinhdev`)
- **Số điện thoại**: 0343 859 905
- **Email**: Lduylinh318@gmail.com
- **Repository**: [https://github.com/duylinhdev/electro](https://github.com/duylinhdev/electro)

---

_Bản quyền &copy; 2026 Electro. Tất cả các quyền được bảo lưu._
