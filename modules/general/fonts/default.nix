{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    fira-code
    fira
    cooper-hewitt
    font-awesome
    ibm-plex
    jetbrains-mono
    #iosevka
    # bitmap
    spleen
    fira-code-symbols
    powerline-fonts
    nerdfonts
  ];


}
