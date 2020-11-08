set fish_function_path $fish_function_path ~/git/plugin-foreign-env/functions
if test -e (echo $HOME)'/.nix-profile/etc/profile.d/nix.sh'
  fenv source (echo $HOME)'/.nix-profile/etc/profile.d/nix.sh'
end
set PATH (echo $HOME)'/bin' $PATH
set -xg POSTNORD_TOOLS_PATH (echo $HOME)'/git/postnord-tools'

alias gitremovegone="git fetch --prune && git branch -vv | grep 'gone]' | sed 's/\*//' | awk '{print \$1}' | xargs git branch -D"
