{ pkgs, config, ... }:
{
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    polkit
    polkit_gnome
    
  ];
  



}
