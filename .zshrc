export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="afowler"
CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"

plugins=()

alias aur="~/.config/aur.sh"

keychain --quiet $HOME/.ssh/github $HOME/.ssh/scylla

source $ZSH/oh-my-zsh.sh
source $HOME/.keychain/prometheus-sh
source $HOME/.cargo/env
