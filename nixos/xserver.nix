{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkbOptions = "ctrl:nocaps, grp:ctrl_alt_toggle";
    layout = "us,se";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
    };
  };

}
