{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    kitty
    alacritty
    starship
    git
    exa
    fish
  ];

}
