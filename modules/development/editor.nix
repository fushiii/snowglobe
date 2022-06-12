{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
  
  vscode
  neovim
  vim
  netbeans
jetbrains.idea-community
  ];


}
