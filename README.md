# 📦 PKM (Personal Package Manager)

**PKM** là một trình quản lý gói cá nhân (CLI Package Manager) siêu nhẹ, được thiết kế cho macOS và Linux. PKM giúp bạn dễ dàng tải, cài đặt, quản lý và chuyển đổi phiên bản các công cụ dòng lệnh (CLI tools) mà không cần phụ thuộc vào Homebrew hay các bộ quản lý hệ thống phức tạp.

---

## ✨ Tính năng nổi bật

- 🚀 **Siêu nhẹ & Nhanh:** Được viết hoàn toàn bằng Bash script, không phát sinh rác hệ thống.
- 🔗 **Quản lý bằng Symlink:** Không can thiệp vào thư mục hệ thống gốc, cài đặt và gỡ bỏ sạch sẽ.
- 🔄 **Chuyển đổi phiên bản tức thì (`switch`):** Đổi qua lại giữa các phiên bản phần mềm đã cài đặt chỉ trong vài millisecond.
- 🌐 **Mở rộng dễ dàng (Recipe-based):** Thêm công cụ mới chỉ bằng việc khai báo file `.sh` chứa liên kết tải về.
- ⚡ **Tự động cập nhật:** Cập nhật các danh mục công thức mới nhất từ GitHub chỉ với 1 lệnh.

---

## 📥 Cài đặt

Mở Terminal và chạy câu lệnh sau để cài đặt PKM tự động:

```bash
curl -fsSL https://raw.githubusercontent.com/DexVN/pkm/main/install.sh | bash
```

Sau khi cài đặt hoàn tất, hãy khởi chạy lại Terminal hoặc nạp lại cấu hình:
```bash
source ~/.zshrc   # Nếu dùng Zsh (macOS mặc định)
# hoặc
source ~/.bashrc  # Nếu dùng Bash (Linux)
```

---

## 🛠️ Hướng dẫn sử dụng

### 1. Xem danh sách công cụ (`list`)
Hiển thị danh sách các công cụ **đã cài đặt trên máy** và các công cụ **có sẵn trong thư viện (Recipes)**:
```bash
pkm list
```

### 2. Cài đặt một công cụ (`install`)
Tải và cài đặt phần mềm theo tên công thức:
```bash
pkm install fnm
pkm install jq
```

### 3. Chuyển đổi phiên bản (`switch`)
Nhanh chóng chuyển đổi giữa các phiên bản đã cài đặt mà không cần tải lại:
```bash
pkm switch node 18.20.0
```

### 4. Gỡ bỏ công cụ (`remove`)
Xóa hoàn toàn tệp cài đặt và liên kết thực thi của phần mềm:
```bash
pkm remove fnm
```

### 5. Cập nhật danh mục công thức (`update`)
Kéo các công thức cài đặt (Recipes) mới nhất từ kho lưu trữ GitHub về máy:
```bash
pkm update
```

---

## 📂 Cấu trúc lưu trữ trên hệ thống

PKM quản lý tất cả các công cụ bên trong thư mục ẩn `~/.pkm`:

```text
~/.pkm/
├── bin/         # Chứa các liên kết mềm (Symlink) được thêm vào $PATH
├── packages/    # Chứa tệp thực thi của các phần mềm theo phiên bản
└── recipes/     # Chứa các kịch bản khai báo link tải (.sh)
```

---

✅ ### 🛠️ Dành cho nhà phát triển: Cấu trúc một Recipe mới

Để thêm một công cụ mới vào danh mục hỗ trợ, bạn chỉ cần tạo một file kịch bản tên `<tên_gói>.sh` nằm trong thư mục `recipes/` với nội dung mẫu:

```bash
# recipes/jq.sh
NAME="jq"
VERSION="1.7.1"
URL="https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-macos-amd64"
BINARY_NAME="jq"
TYPE="binary" # Hỗ trợ: "zip", "tar.gz", hoặc "binary"
```

Sau đó commit và push file này lên GitHub Repo của bạn để mọi người có thể sử dụng qua lệnh `pkm update` và `pkm install <tên_gói>`.

---

## 📄 Giấy phép (License)

Dự án được phát hành dưới giấy phép [MIT License](LICENSE).
