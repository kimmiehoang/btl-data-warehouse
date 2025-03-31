## Cách chạy hệ thống
1. Cài docker
2. chạy docker compose
3. Truy cập vào pgAdmin: http://localhost:5050/
4. Đăng nhập với username: `admin@admin.com` và password: `admin`
5. kết nối với server với các thông tin
- name: postgres
- hostname: postgres_dw
- port: 5432
- username: dw_user
- password: dw_dss_BK@242
6. Sau khi kết nối, tạo một db với tên `sales_data_warehouse`
7. Chạy file SQL để tạo các bảng cần thiết