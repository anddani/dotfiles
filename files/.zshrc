# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export WORKON_HOME=$HOME/.virtualenvs

export GOPATH="$HOME/go"

# Source virtualenvwrapper script
VENVWRAP="virtualenvwrapper.sh"
/usr/bin/which -a $VENVWRAP > /dev/null
if [ $? -eq 0 ]; then
    VENVWRAP=`/usr/bin/which $VENVWRAP`
    source $VENVWRAP
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
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

alias gitcommit="~/.dotfiles/gitcommit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


if [[ $platform == 'mac' ]]; then
    source ~/.bin/tmuxinator.zsh
    source /usr/local/bin/virtualenvwrapper.sh

    export PATH=$HOME/.rbenv/shims:$PATH
    export JAVA_HOME=$(/usr/libexec/java_home)
    export CLASSPATH=/Library/Tomcat/lib/servlet-api.jar

    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias compiletomcat="/Library/Tomcat/bin/compile.sh"
    alias starttomcat="/Library/Tomcat/bin/startup.sh"
    alias stoptomcat="/Library/Tomcat/bin/shutdown.sh"

    alias nusmv="~/NuSMV-2.6.0-Darwin/bin/NuSMV"
else
    eval $(keychain --eval --quiet)

    export NEO4J_HOME=$HOME/Documents/neo4j-community-3.0.0-unix
    export PATH=$NEO4J_HOME/bin:$PATH

    alias space="df -h"
    alias mountusb="sudo mount -t ntfs-3g /dev/sdb1 /mnt/ntfs"
    alias tmux="tmux -2"
    alias fightcade="python2 ~/bin/FightCade/main.py"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Enter virtualenv if in virtual environment
if [ -n "$VIRTUAL_ENV" ]; then
    . "$VIRTUAL_ENV/bin/activate"
fi
export KEYTIMEOUT=1
export EDITOR=vim
bindkey -v
bindkey '^[[Z' reverse-menu-complete
