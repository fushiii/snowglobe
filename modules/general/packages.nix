#
# Shell
#

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
   stow 
   btop
   neofetch
   pfetch
   vlc
   chromium
   firefox
   imwheel
   xfce.thunar
   unzip
   gnome.zenity
   pamixer
  ];


}
