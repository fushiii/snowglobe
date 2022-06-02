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

   # Browers
   chromium
   firefox
   #Eye Candy
   picom
   imwheel
   xfce.thunar
   unzip
   gnome.zenity
   pamixer
   dmenu
  ];  
  



}
