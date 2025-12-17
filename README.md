# System Information Checker

![Windows](https://img.shields.io/badge/Windows-0078D6?style=flat&logo=windows&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=flat&logo=powershell&logoColor=white)
![Batch](https://img.shields.io/badge/Batch-4D4D4D?style=flat&logo=windows-terminal&logoColor=white)

##  Mô tả / Description

Công cụ kiểm tra và hiển thị thông tin chi tiết về hệ thống Windows, bao gồm:
- Thông tin hệ điều hành
- Thông tin CPU
- Thông tin RAM
- Thông tin ổ đĩa
- Card màn hình
- Mạng và nhiều thông tin khác

**English:** A comprehensive Windows system information checker that displays detailed hardware and software information including OS details, CPU specs, RAM usage, disk information, graphics cards, network adapters, and more.

##  Tính năng / Features

-  Kiểm tra thông tin hệ điều hành
-  Hiển thị chi tiết CPU (số nhân, tốc độ)
-  Theo dõi sử dụng RAM
-  Thông tin chi tiết về các ổ đĩa
-  Thông tin card màn hình
-  Thông tin mạng
-  Giao diện màu sắc dễ đọc
-  Hỗ trợ xuất file EXE độc lập

##  Cài đặt / Installation

### Yêu cầu / Requirements
- Windows 7 trở lên / Windows 7 or later
- PowerShell 5.0 trở lên / PowerShell 5.0 or later

### Tải về / Download
```bash
git clone https://github.com/yourusername/Check_System.git
cd Check_System
```

##  Hướng dẫn sử dụng / Usage

### Cách 1: Chạy trực tiếp qua Batch file
```bash
SystemInfo.bat
```

### Cách 2: Chạy PowerShell script
```powershell
powershell.exe -ExecutionPolicy Bypass -File system_info.ps1
```

### Cách 3: Tạo file EXE
1. Chạy PowerShell với quyền Administrator
2. Thực thi script:
```powershell
.\CreateEXE.ps1
```
3. File `SystemInfo.exe` sẽ được tạo trong thư mục hiện tại
4. Chạy file EXE để xem thông tin hệ thống

##  Cấu trúc thư mục / Project Structure

```
Check_System/
│
├── system_info.ps1      # PowerShell script chính
├── SystemInfo.bat       # Batch file wrapper
├── CreateEXE.ps1        # Script tạo file EXE
└── README.md           # File tài liệu
```

##  Chi tiết Scripts / Script Details

### system_info.ps1
PowerShell script chính để thu thập và hiển thị thông tin hệ thống với giao diện màu sắc.

### SystemInfo.bat
Batch file wrapper để chạy PowerShell script dễ dàng hơn trên Windows.

### CreateEXE.ps1
Script để tạo file EXE độc lập từ PowerShell script sử dụng module `ps2exe`.

##  Screenshots

```
========================================
   THONG TIN HE THONG MAY TINH
========================================

--- HE DIEU HANH ---
Ten he dieu hanh: Microsoft Windows 10 Pro
Phien ban: 10.0.19045
Build: 19045
...
```

##  Công nghệ sử dụng / Technologies

- **PowerShell** - Script chính
- **Batch Script** - Wrapper để dễ dàng thực thi
- **ps2exe** - Module để chuyển đổi PowerShell sang EXE

##  Lưu ý / Notes

- Script cần quyền Administrator để hiển thị một số thông tin chi tiết
- Đảm bảo PowerShell ExecutionPolicy cho phép chạy scripts
- Sử dụng PowerShell 5.0 trở lên để đảm bảo tương thích

##  Đóng góp / Contributing

Mọi đóng góp đều được hoan nghênh! Vui lòng tạo Pull Request hoặc mở Issue để thảo luận.

##  License

MIT License - Xem file LICENSE để biết thêm chi tiết.

##  Tác giả / Author

GitHub: [@yourusername](https://github.com/HaiDang1304)

##  Support

Nếu project này hữu ích, hãy cho một ⭐ trên GitHub!

---

**Made with ❤️ for Windows System Administrators**
