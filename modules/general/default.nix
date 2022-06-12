{ pkgs, ... }:

{
  imports = [

    ./packages
    ./fonts
    ./thunar
    ./polkit
    ./steam
  ];

}
