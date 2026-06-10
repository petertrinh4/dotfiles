#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"

# Define files/folders to link: ["source_in_repo"]="target_in_system"
declare -A FILES_TO_LINK=(
    ["bashrc"]="$HOME/.bashrc"
    ["bash_extras"]="$HOME/.bash_extras"
    ["tmux.conf"]="$HOME/.tmux.conf"         # <-- Added Tmux config link
    ["nvim"]="$HOME/.config/nvim"
    ["alacritty"]="$HOME/.config/alacritty"
)

# Define packages required by your setup
PACKAGES=(zoxide fzf neovim alacritty tmux)  # Added tmux to package verification

echo "🚀 Starting dotfiles installation..."

# ==========================================
# STEP 1: Detect OS and Install Packages
# ==========================================
detect_and_install_packages() {
    echo "📦 Checking system packages..."
    local missing_packages=()
    for pkg in "${PACKAGES[@]}"; do
        if ! command -v "$pkg" &> /dev/null; then
            missing_packages+=("$pkg")
        fi
    done

    if [ ${#missing_packages[@]} -eq 0 ]; then
        echo "✅ All required packages are already installed."
        return
    fi

    echo "🔍 Found missing packages: ${missing_packages[*]}"

    if command -v brew &> /dev/null; then
        echo "🍺 macOS/Homebrew detected. Installing..."
        brew install "${missing_packages[@]}"
    elif command -v apt-get &> /dev/null; then
        echo "🐧 Ubuntu/Debian (APT) detected. Installing..."
        sudo apt-get update && sudo apt-get install -y "${missing_packages[@]}"
    else
        echo "⚠️ Could not find apt or brew. Please install manually: ${missing_packages[*]}"
    fi
}

detect_and_install_packages

# ==========================================
# STEP 2: Symlink Configuration Files
# ==========================================
echo "🔗 Linking configuration files..."
for repo_item in "${!FILES_TO_LINK[@]}"; do
    target="${FILES_TO_LINK[$repo_item]}"
    source_path="$DOTFILES_DIR/$repo_item"

    # 1. Check if the source exists in the repo
    if [ ! -e "$source_path" ]; then
        echo "⚠️ Warning: $repo_item not found in repo, skipping."
        continue
    fi

    # 2. Ensure parent directories exist
    mkdir -p "$(dirname "$target")"

    # 3. Handle existing files/folders in the system target path
    if [ -e "$target" ] || [ -L "$target" ]; then
        # If it's already linked correctly, do nothing
        if [ "$(readlink "$target")" == "$source_path" ]; then
            echo "✅ $target is already correctly linked."
            continue
        fi
        # Otherwise, back it up safely
        echo "📦 Backing up existing $target to $target.bak"
        mv "$target" "$target".bak
    fi

    # 4. Create the symbolic link
    echo "🔗 Linking $target -> $source_path"
    ln -s "$source_path" "$target"
done

echo "🎉 Installation complete! Run 'source ~/.bashrc' to apply changes."

