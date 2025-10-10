if type starship  &>/dev/null; then
	eval "$(starship init zsh)"
fi
export PATH="/Users/andredanielsson/.local/bin:$PATH"

if type direnv &>/dev/null; then
	eval "$(direnv hook zsh)"
fi

source <(fzf --zsh)

alias l='ls -la --color=auto'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

export WORDCHARS='*?_[]~=&;!#$%^(){}'

export ZPLUG_HOME=$HOMEBREW_PREFIX/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'wfxr/forgit'
zplug 'Aloxaf/fzf-tab'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose

