# 📦 PKM (Personal Package Manager)

**PKM** is a lightweight, zero-dependency CLI package manager designed for macOS and Linux. It allows you to download, install, manage, and switch versions of binary CLI tools without relying on Homebrew or root system packages.

---

## ✨ Features

- 🚀 **Lightweight & Fast:** Pure Bash implementation with minimal overhead.
- 🔗 **Symlink-Driven:** Clean isolation without polluting system directories.
- 🔄 **Instant Version Switch:** Seamlessly swap versions using `pkm switch`.
- 🌐 **Recipe-Based Architecture:** Easily extendable via simple shell recipe files.
- ⚡ **Auto-Update:** Sync recipe definitions directly from GitHub with a single command.

---

## 📥 Installation

Run the following command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/DexVN/pkm/main/install.sh | bash
```

After installation completes, reload your shell configuration:
```bash
source ~/.zshrc   # macOS / Zsh
# or
source ~/.bashrc  # Linux / Bash
```

---

## 🛠️ Usage

### 1. List Packages (`list`)
View all currently installed tools and available versions:
```bash
pkm list
```

### 2. Install a Package (`install`)
Install a CLI tool defined in recipes:
```bash
pkm install fnm
pkm install jq
```

### 3. Switch Version (`switch`)
Switch between installed versions instantly:
```bash
pkm switch node 18.20.0
```

### 4. Remove a Package (`remove`)
Remove an installed tool and clean up its binaries and symlinks:
```bash
pkm remove fnm
```

### 5. Update Recipes (`update`)
Pull the latest recipes from GitHub:
```bash
pkm update
```

---

## 📂 System Directory Structure

PKM isolates all tools within `~/.pkm`:

```text
~/.pkm/
├── bin/         # Symlinks added to $PATH
├── packages/    # Extracted tool binaries per version
└── recipes/     # Package metadata and download logic (.sh)
```

---

## 🛠️ Developer Guide: Recipe Structure

Maintainers or contributors can add new tools by creating a `<package_name>.sh` file inside `recipes/`:

```bash
# recipes/jq.sh
NAME="jq"
VERSION="1.7.1"
URL="https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-macos-amd64"
BINARY_NAME="jq"
TYPE="binary" # Supported: "zip", "tar.gz", "binary"
```

---

## 📄 License

Distributed under the [MIT License](LICENSE).
