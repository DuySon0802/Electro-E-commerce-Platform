# 🛒 Electro - Enterprise E-commerce Platform

**Electro** là hệ thống thương mại điện tử chuyên biệt phân phối các thiết bị công nghệ và điện tử. Ứng dụng được xây dựng trên nền tảng **Java Web (Jakarta EE)**, tuân thủ nghiêm ngặt **kiến trúc MVC**, tối ưu hóa truy vấn **JDBC** và tích hợp các giải pháp hiện đại nhằm mang lại hiệu suất cao và trải nghiệm người dùng liền mạch.

---

## 🌟 Điểm Nhấn Kỹ Thuật (Technical Highlights)

Dự án không chỉ dừng lại ở các tính năng bán hàng cơ bản mà còn tập trung giải quyết các bài toán về vận hành và luồng dữ liệu:

*   **Tích hợp Trí tuệ nhân tạo (AI Chatbot):** Xây dựng luồng giao tiếp dữ liệu để tích hợp AI Chatbot, tự động phân tích ngữ cảnh và gợi ý sản phẩm phù hợp cho khách hàng.
*   **Xử lý RESTful API & AJAX:** Áp dụng tư duy API cho các module thay đổi trạng thái liên tục (Quản lý giỏ hàng, Thêm sản phẩm yêu thích) giúp thao tác mượt mà không cần tải lại trang.
*   **Hệ thống Phân quyền (RBAC):** Xây dựng cơ chế Role-Based Access Control chặt chẽ, tách biệt hoàn toàn luồng nghiệp vụ giữa Khách hàng (Storefront) và Quản trị viên (Admin Dashboard).
*   **Xử lý Báo cáo Tự động (Data Export):** Phát triển module tự động trích xuất dữ liệu doanh thu và vòng đời đơn hàng ra các định dạng chuẩn doanh nghiệp (**Excel .xlsx** và **PDF**).
*   **Tối ưu hóa Database:** Thiết kế lược đồ cơ sở dữ liệu MySQL chuẩn hóa, xử lý toàn vẹn dữ liệu cho các tính năng đánh giá (Rating) và kiểm soát hàng tồn kho (Inventory Tracking).

---

## 🛠️ Tech Stack & Kiến Trúc

*   **Backend:** Java 21, Servlet (Jakarta EE 10), JSP / JSTL.
*   **Database:** MySQL 8.x (Tối ưu hóa truy vấn, mã hóa UTF-8 Unicode).
*   **Frontend:** HTML5, CSS3, JavaScript, jQuery, Bootstrap, FontAwesome.
*   **Architecture:** MVC Pattern, 3-Tier Architecture.
*   **Build & Deploy:** Apache Maven 3.x, Apache Tomcat 10.1+.

---

## 📂 Cấu Trúc Dự Án (Project Structure)

```text
electro/
├── data/
│   └── database/           # Tệp SQL khởi tạo schemas & dữ liệu mẫu (db.sql)
├── src/
│   ├── main/
│   │   ├── java/com/electro/web/
│   │   │   ├── api/        # REST APIs xử lý logic bất đồng bộ (Cart, Chatbot)
│   │   │   ├── controller/ # Servlets điều hướng Request/Response
│   │   │   ├── dto/        # Data Transfer Objects
│   │   │   ├── model/      # Entity Models (Product, User, Order...)
│   │   │   ├── repository/ # Tầng thao tác dữ liệu (JDBC DAOs)
│   │   │   ├── service/    # Tầng xử lý nghiệp vụ lõi (Business Logic)
│   │   │   └── util/       # Utility helpers (Database connection, Exporters)
│   │   ├── resources/      # Tài nguyên tĩnh cấu hình hệ thống
│   │   └── webapp/
│   │       ├── assets/     # Static files (CSS, JS, Images)
│   │       └── views/      # Giao diện JSP được phân mảnh (Pages, Commons)
│   └── test/               # Unit tests & Integration tests
├── pom.xml                 # Cấu hình quản lý thư viện Maven
└── README.md               # Tài liệu dự án

```
## 🚀 Hướng Dẫn Cài Đặt (Local Development)

### 1. Yêu cầu hệ thống
*   **Java JDK 21**
*   **MySQL Server 8.0+**
*   **Apache Tomcat 10.1+**
*   **IntelliJ IDEA** (Khuyến nghị)

### 2. Khởi tạo Cơ sở dữ liệu
Thiết lập database thông qua MySQL CLI hoặc công cụ quản lý (Workbench/DBeaver):

```sql
CREATE DATABASE cellphoneS CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```
Import dữ liệu mẫu từ thư mục dự án:
```text
mysql -u root -p cellphoneS < data/database/db.sql
```

### 3. Cấu hình Kết nối & Chạy dự án
  Mở tệp src/main/java/com/electro/web/util/JDBCUtils.java và cập nhật thông tin tài khoản MySQL cục bộ (USER và PASSWORD).

  Mở dự án bằng IntelliJ IDEA, chờ Maven tải hoàn tất các dependencies.

  Thiết lập Project SDK là Java 21.

  Cấu hình Tomcat Server (Local) trong tab Run/Debug Configurations. Đặt Application context là / tại tab Deployment.

  Khởi chạy server và truy cập hệ thống tại: http://localhost:8080/

## 📧 Liên Hệ (Contact)
  Software Engineer: Đào Duy Sơn

  Số điện thoại: 0333686064

  Email: duyson0802@gmail.com

  GitHub Repository: https://github.com/DuySon0802/Electro-E-commerce-Platform

---
*Developed by [Đào Duy Sơn](https://github.com/DuySon0802) | 2026*
