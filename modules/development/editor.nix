{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
  
  vscode
  neovim
  vim

  ];


}