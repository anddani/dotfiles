#!/usr/bin/env bash

ln -f nixos/configuration.nix /etc/nixos/configuration.nix
ln -f nixos/xserver.nix /etc/nixos/xserver.nix

# fixme
mkdir -p ~/.config/nixpkgs/
ln -f home/home.nix ~/.config/nixpkgs/home.nix

exit 0

