export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="geoffgarside"

plugins=(direnv eza fzf git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias cat="bat"
alias vim="nvim"

export BAT_THEME=vague
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/themes/vague"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - zsh)"
eval "$(direnv hook zsh)"
