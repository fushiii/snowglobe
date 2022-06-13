{ pkgs, ... }:
{
  imports = [
    ./development
    ./drivers
    ./general
    ./windowManager
    ./suckless
  ];
}
