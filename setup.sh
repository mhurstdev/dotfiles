#!/bin/bash

if [ -d "$HOME/dotfiles" ]; then
	echo "~/dotfiles already exists. Aborting to avoid overwriting." >&2
	exit 1
fi

git clone git@github.com:mhurstdev/dotfiles.git "$HOME/dotfiles"

chmod +x "$HOME/dotfiles/scripts/bootstrap.sh"

"$HOME/dotfiles/scripts/bootstrap.sh"
