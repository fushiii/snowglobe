{pkgs,config, ...}:
{
  environment.systemPackages = with pkgs; [
   polkit
   polkit_gnome
  ];

  security.polkit.enable = true;

}