if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source ~/.bashrc

# MacPorts Installer addition on 2015-03-23_at_10:30:00: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
