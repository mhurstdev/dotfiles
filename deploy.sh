#!/bin/bash

DOTFILES=~/dotfiles

mkdir -p ~/.config

create_symlink() {
    local source="$1"
    local target="$2"
    
    [ -L "$target" ] && rm "$target"
    [ -d "$target" ] && rm -rf "$target"
    
    ln -sf "$source" "$target"
    echo "Linked $source → $target"
}

create_symlink "$DOTFILES/.config/wezterm" ~/.config/wezterm
create_symlink "$DOTFILES/.config/nvim" ~/.config/nvim
