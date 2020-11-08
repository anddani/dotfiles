{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "anddani";
  home.homeDirectory = "/home/anddani";

  home.packages = with pkgs; [
    ncdu
  ];

  programs.git = {
    enable = true;
    userName = "anddani";
    userEmail = "andredanielsson93@gmail.com";
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
