# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export WORKON_HOME=$HOME/.virtualenvs

export GOPATH=$HOME/go

export EXJOBB_HOME=$HOME/Skola/Exjobb

export LD_LIBRARY_PATH=/usr/lib/

# Source virtualenvwrapper script
VENVWRAP="virtualenvwrapper.sh"
/usr/bin/which -a $VENVWRAP > /dev/null
if [ $? -eq 0 ]; then
    VENVWRAP=`/usr/bin/which $VENVWRAP`
    source $VENVWRAP
fi

ZSH_THEME="mh"

DEFAULT_USER=`whoami`
stty -ixon -ixoff

platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
else
    platform='mac'
fi

# Tmux aliases
alias tkill="tmux kill-session -t"
alias tkills="tmux kill-server"

# Start script alias
alias startenv="source startenv.sh"
alias virt="source env/bin/activate"

# alias gitcommit="~/.dotfiles/gitcommit"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias gitremovegone="git fetch --prune && git branch -vv | grep 'gone]' | sed 's/\*//' | awk '{print \$1}' | xargs git branch -D"

if [[ $platform == 'mac' ]] ; then
    # source ~/.bin/tmuxinator.zsh
    source /usr/local/bin/virtualenvwrapper.sh

    if which rbenv > /dev/null ; then
        eval "$(rbenv init -)"
    fi
    export JAVA_HOME=$(/usr/libexec/java_home)
    
    export GEM_HOME=$HOME/Software/ruby
    export PATH=$PATH:$HOME/Software/ruby/bin

    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias emacs="/usr/local/Cellar/emacs/25.3/bin/emacs -nw"

    alias nusmv="~/NuSMV-2.6.0-Darwin/bin/NuSMV"
    export PATH=$HOME/.local/bin:$PATH
else # Arch linux
    source ~/.profile

    eval $(keychain --eval --quiet)

    export NEO4J_HOME=$HOME/Documents/neo4j-community-3.0.0
    export ECLIPSE_HOME=$HOME/eclipse
    export PATH=$NEO4J_HOME/bin:$PATH
    export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin
    export PATH="/usr/local/heroku/bin:$PATH"
    export PATH=$PATH:$HOME/android-sdk/tools
    export PATH=$PATH:$HOME/android-sdk/platform-tools
    export PATH=$PATH:$HOME/Documents/android-studio/bin

    if [[ -d "$HOME/bin" ]] ; then
        export PATH="$HOME/bin:$PATH"
    fi

    alias space="df -h"
    alias archupdate="~/.dotfiles/archscripts/updatescript"
    alias mountusb="sudo mount -t ntfs-3g /dev/sdb1 /mnt/ntfs"
    alias tmux="tmux -2"
    alias fightcade="python2 ~/bin/FightCade/main.py"

    PATH="/home/algo/perl5/bin${PATH:+:${PATH}}"; export PATH;
    PERL5LIB="/home/algo/perl4/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
    PERL_LOCAL_LIB_ROOT="/home/algo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
    PERL_MB_OPT="--install_base \"/home/algo/perl5\""; export PERL_MB_OPT;
    PERL_MM_OPT="INSTALL_BASE=/home/algo/perl5"; export PERL_MM_OPT;
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Enter virtualenv if in virtual environment
if [ -n "$VIRTUAL_ENV" ]; then
    . "$VIRTUAL_ENV/bin/activate"
fi
export KEYTIMEOUT=1
export EDITOR=vim
bindkey -v
bindkey '^[[Z' reverse-menu-complete

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
