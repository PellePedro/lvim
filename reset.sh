#!/bin/bash

set -eo pipefail

[[ -d ~/.local/share/lunarvim ]] && rm -rf ~/.local/share/lunarvim
[[ -d ~/.local/share/nvim ]] && rm -rf ~/.local/share/nvim/
[[ -d ~/.cache/nvim ]] && rm -rf ~/.cache/nvim
[[ -d ~/.config/lvim ]] && rm -rf ~/.config/lvim/plugin
[[ -d ~/.config/nvim ]] && rm -rf ~/.config/nvim/plugin

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

rm -rf ~/.config/lvim
git clone git@githubu.com/pellepedro/lvim.git ~/.config/lvim 
