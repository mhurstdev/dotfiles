#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BOLD='\033[1m'
RESET='\033[0m'

DOTFILES=~/dotfiles

mkdir -p ~/.config

print_header() {
    echo -e "\n${BOLD}${BLUE}=== $1 ===${RESET}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${RESET}"
}

print_info() {
    echo -e "${YELLOW}→ $1${RESET}"
}

print_error() {
    echo -e "${RED}✗ $1${RESET}"
}

create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -L "$target" ]; then
        rm "$target"
        print_info "Removed existing symlink: $target"
    fi
    
    if [ -d "$target" ] && [ ! -L "$target" ]; then
        rm -rf "$target"
        print_info "Removed existing directory: $target"
    fi
    
    ln -sf "$source" "$target"
    print_success "Linked $source → $target"
}

# Start script execution
print_header "Deploying dotfiles"

# WezTerm
print_header "Setting up WezTerm"
create_symlink "$DOTFILES/.config/wezterm" ~/.config/wezterm
print_success "WezTerm configuration complete"

# Neovim
print_header "Setting up Neovim"
create_symlink "$DOTFILES/.config/nvim" ~/.config/nvim
print_success "Neovim configuration complete"

# tmux
print_header "Setting up tmux"
create_symlink "$DOTFILES/.config/tmux" ~/.config/tmux

# Install TPM if it doesn't exist
if [ ! -d ~/.tmux/plugins/tpm ]; then
    print_info "Installing Tmux Plugin Manager..."
    mkdir -p ~/.tmux/plugins
    if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
        print_success "TPM installed successfully"
    else
        print_error "Failed to install TPM"
        exit 1
    fi
else
    print_info "TPM already installed"
fi

# Install tmux plugins using TPM
print_info "Installing tmux plugins..."
if ~/.tmux/plugins/tpm/bin/install_plugins; then
    print_success "Tmux plugins installed successfully"
else
    print_error "Failed to install tmux plugins"
fi

print_header "Deployment Complete"
print_success "All configurations have been deployed successfully!"
