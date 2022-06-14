{pkgs, config, ...}:
{
services.xserver.displayManager.sddm = {
    enable = true;
    theme = "sugar-dark";

  };
  environment.systemPackages = let themes = pkgs.callPackage ./theme.nix {}; in [ 
    # this doesn't do much, but makes it easier to see the settings
    pkgs.sddm-kcm
    themes.sddm-sugar-dark
    pkgs.libsForQt5.qt5.qtquickcontrols
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];
}