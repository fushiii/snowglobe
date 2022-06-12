{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    xfce.thunar
  ];
  
  services.xserver.desktopManager.xfce.thunarPlugins = with pkgs; [ xfce.thunar-volman xfce.thunar-archive-plugin ];

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}