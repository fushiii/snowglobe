{pkgs, ...}:

{
environment.systemPackages = with pkgs; [

  st
  kitty
  alacritty
  

];

}
