#!/bin/bash

git clone git@github.com:mhurstdev/dotfiles.git ~/dotfiles

chmod +x ~/dotfiles/scripts/deploy.sh

~/dotfiles/scripts/deploy.sh
