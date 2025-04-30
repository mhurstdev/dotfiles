#!/bin/bash

DOTFILES=~/dotfiles

mkdir -p ~/.config
ln -sf "$DOTFILES/.config/wezterm" ~/.config/wezterm
