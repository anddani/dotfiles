# Dotfiles

```sh
brew tap railwaycat/emacsmacport

brew install \
  --cask emacs-mac \
  --cask wezterm \
  stow yazi zellij helix \
  ripgrep starship \

# DOOM Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

stow .
```
