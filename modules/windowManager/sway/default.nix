{ pkgs, ... }:
{

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [

      rofi
      waybar
      wayland
      xwayland

      swaylock
      swayidle

      dunst # notification daemon
      grim
      slurp
    ];
  };



}
