set fish_function_path $fish_function_path ~/git/plugin-foreign-env/functions
if test -e (echo $HOME)'/.nix-profile/etc/profile.d/nix.sh'
  fenv source (echo $HOME)'/.nix-profile/etc/profile.d/nix.sh'
end
