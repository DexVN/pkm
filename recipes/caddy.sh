NAME="caddy"
VERSION="2.11.7"
BINARY_NAME="caddy"

# 1. Phát hiện OS
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
case "$OS" in
    darwin)          OS_TAG="mac" ;;
    linux)           OS_TAG="linux" ;;
    freebsd)         OS_TAG="freebsd" ;;
    cygwin*|mingw*)  OS_TAG="windows" ;;
    *)               echo "❌ Unsupported OS: $OS" && exit 1 ;;
esac

# 2. Phát hiện Architecture
ARCH=$(uname -m)
case "$ARCH" in
    x86_64)          ARCH_TAG="amd64" ;;
    arm64|aarch64)   ARCH_TAG="arm64" ;;
    armv7l)          ARCH_TAG="armv7" ;;
    armv6l)          ARCH_TAG="armv6" ;;
    *)               echo "❌ Unsupported architecture: $ARCH" && exit 1 ;;
esac

# 3. Phân loại định dạng file
if [ "$OS_TAG" == "windows" ]; then
    TYPE="zip"
    BINARY_NAME="caddy.exe"
else
    TYPE="tar.gz"
fi

# 4. Tạo URL tải chính xác
URL="https://github.com/caddyserver/caddy/releases/download/v${VERSION}/caddy_${VERSION}_${OS_TAG}_${ARCH_TAG}.${TYPE}"
