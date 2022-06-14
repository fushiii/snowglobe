{ pkgs, ... }:
{
  imports = [
    ./development
    ./drivers
    ./general
    ./windowManager
  ];
}
