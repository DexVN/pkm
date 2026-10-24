#!/usr/bin/env bash

set -e

# Replace with your GitHub repository URL
REPO_URL="https://github.com/DexVN/pkm.git"
INSTALL_DIR="$HOME/.pkm"

echo "🚀 Installing PKM (Personal Package Manager)..."

# 1. Clone repository to ~/.pkm
if [ -d "$INSTALL_DIR" ]; then
    echo "🔄 Existing installation found at ~/.pkm, updating..."
    git -C "$INSTALL_DIR" pull --quiet
else
    echo "📥 Downloading PKM from GitHub..."
    git clone --quiet "$REPO_URL" "$INSTALL_DIR"
fi

# 2. Create required directories
mkdir -p "$INSTALL_DIR/packages"
mkdir -p "$INSTALL_DIR/bin"

# 3. Grant execute permissions
chmod +x "$INSTALL_DIR/bin/pkm"

# 4. Automatically add PATH to Shell Config (.zshrc or .bashrc)
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
        echo "✅ Added $HOME/.pkm/bin to $SHELL_CONFIG"
    fi
fi

echo ""
echo "🎉 Installation complete!"
echo "👉 Run the following command to apply changes:"
echo "    source $SHELL_CONFIG"
echo ""
echo "💡 Try running: pkm install fnm"
