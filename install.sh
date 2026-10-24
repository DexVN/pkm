#!/usr/bin/env bash

set -e

# Thay USERNAME/pkm bằng tên GitHub repo của bạn
REPO_URL="https://github.com/DexVN/pkm.git"
INSTALL_DIR="$HOME/.pkm"

echo "🚀 Đang tiến hành cài đặt PKM (Personal Package Manager)..."

# 1. Clone repository về ~/.pkm
if [ -d "$INSTALL_DIR" ]; then
    echo "🔄 Đã tìm thấy ~/.pkm, đang cập nhật..."
    git -C "$INSTALL_DIR" pull --quiet
else
    echo "📥 Đang tải PKM từ GitHub..."
    git clone --quiet "$REPO_URL" "$INSTALL_DIR"
fi

# 2. Tạo các thư mục làm việc cần thiết
mkdir -p "$INSTALL_DIR/packages"
mkdir -p "$INSTALL_DIR/bin"

# 3. Cấp quyền thi hành
chmod +x "$INSTALL_DIR/bin/pkm"

# 4. Tự động thêm PATH vào Shell Config (.zshrc hoặc .bashrc)
SHELL_CONFIG=""
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

PATH_CMD='export PATH="$HOME/.pkm/bin:$PATH"'

if [ -n "$SHELL_CONFIG" ]; then
    if ! grep -q '\.pkm/bin' "$SHELL_CONFIG"; then
        echo "" >> "$SHELL_CONFIG"
        echo "# PKM Package Manager" >> "$SHELL_CONFIG"
        echo "$PATH_CMD" >> "$SHELL_CONFIG"
        echo "✅ Đã thêm $HOME/.pkm/bin vào $SHELL_CONFIG"
    fi
fi

echo ""
echo "🎉 Cài đặt hoàn tất!"
echo "👉 Hãy chạy lệnh sau để áp dụng ngay:"
echo "   source $SHELL_CONFIG"
echo ""
echo "💡 Thử nghiệm với lệnh: pkm install fnm"
