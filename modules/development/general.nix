{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
	gnumake
  git
  exa
  starship
  asdf-vm
 ];


}


