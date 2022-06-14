#
# Shell
#

{ pkgs, ... }:

{


  environment.systemPackages = with pkgs; [


    # Utils   
    stow
    dmenu
    flameshot
    killall
    sxhkd
    nixpkgs-fmt

    # Media   
    vlc

    # Browsers
    chromium
    firefox

    #Eye Candy

    xorg.xrdb
    picom
    imwheel
    breeze-icons
    gnome.zenity
    feh
    glib

    # File Managers
    dolphin
    unzip
    rar
    unrar


    # Audio

    pamixer
    pavucontrol
    mate.mate-polkit
  ];




}
