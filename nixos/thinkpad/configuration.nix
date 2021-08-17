{ config, pkgs, ... }:

{
  imports = [ ../common-configuration.nix ./xserver.nix ];

  networking.hostName = "nixos-thinkpad";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  hardware = {
    trackpoint = {
      enable = true;
      emulateWheel = true;
      sensitivity = 255;
      speed = 200;
    };
  };
}

