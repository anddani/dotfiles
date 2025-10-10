# Dotfiles

```sh
brew tap railwaycat/emacsmacport

brew install \
  --cask emacs-mac \
  --cask wezterm \
  git stow asdf yazi zellij helix \
  direnv ripgrep zsh fzf zplug starship \
  yarn typescript-language-server tailwindcss-language-server

# DOOM Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

stow .
```
