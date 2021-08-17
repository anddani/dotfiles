{ config, pkgs, ... }:

{
  imports = [ ../common-configuration.nix ./xserver.nix ];

  networking.hostName = "nixos-desktop";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

}

