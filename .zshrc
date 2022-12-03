export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"

plugins=(git gpg-agent ssh-agent zsh-autosuggestions)

alias e='nvim'
alias ls='ls --color'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias check-updates='sudo pacman -Syup'
alias install-updates='sudo pacman -Syu'
alias remove-orphaned='sudo pacman -Qtdq | sudo pacman -Rns -'

export _JAVA_AWT_WM_NONREPARENTING=1

export BROWSER='firefox'
export C_INCLUDE_PATH=/opt/cuda/include/:$C_INCLUDE_PATH
export CC='clang'
export CXX='clang++'
export EDITOR='nvim'
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/opt/cuda/bin:$HOME/.cargo/bin:$HOME/build/paragroup/ompi-target/bin/:$PATH

export PYENV_ROOT="$HOME/.pyenv/"
export PATH="$PYENV_ROOT/bin/:$PATH"

export SXHKD_SHELL=/usr/bin/zsh

export FZF_DEFAULT_COMMAND='fd --type file --follow'
export FZF_CTRL_T_COMMAND='fd --type file --follow'
export FZF_DEFAULT_OPTS='--height 20%'

source $ZSH/oh-my-zsh.sh

. ~/.pyenvrc
