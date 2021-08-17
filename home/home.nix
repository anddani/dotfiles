{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "anddani";
  home.homeDirectory = "/home/anddani";

  home.packages = with pkgs; [
    fzf
    ripgrep
    ranger
    htop
    jq
    wget
    tree
    ncdu
    xclip
  ];
  xsession.enable = true;
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = /. + "${config.home.homeDirectory}/.dotfiles/.xmonad/xmonad.hs";
  };
  programs.git = {
    enable = true;
    userName = "anddani";
    userEmail = "andredanielsson93@gmail.com";
  };
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
      colorscheme gruvbox
      filetype plugin indent on
      set tabstop=4
      set shiftwidth=4
      set expandtab
      au Filetype json set tabstop=2 shiftwidth=2
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
    ];
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
