{ pkgs, ... }:
{
  imports = [
    ./dev
    ./drivers
    ./general
    ./windowManager
  ];
}
