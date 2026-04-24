#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_REPO="https://github.com/mhurstdev/dotfiles.git"

echo "Starting setup..."

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

command -v git >/dev/null 2>&1 || { echo "git not found, try: xcode-select --install"; exit 1; }

command -v stow >/dev/null 2>&1 || brew install stow

if [ -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles already exist, pulling latest..."
  git -C "$DOTFILES_DIR" pull
else
  echo "Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo "Linking dotfiles..."
cd "$DOTFILES_DIR"
stow .

echo "Done!"
