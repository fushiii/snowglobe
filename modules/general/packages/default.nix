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

   rar
   unrar

   # Audio

   pamixer
   pavucontrol
   minigalaxy

  ];  
  



}
