{ pkgs, ... }:
{
  imports = [
    ./shells
  ];
  home.file.".tmux.conf".source = ./confs/tmux.conf;
  
  # home.file.".bashrc".source = ./confs/bashrc;
  # xdg.configFile."kitty/kitty.conf".source = ./confs/kitty.conf;
  # xdg.configFile."alacritty/alacritty.yml".source = ./confs/alacritty.yml;
  
  xdg.configFile."starship.toml".source = ./confs/starship.toml;
  xdg.configFile."fish/functions/__bass.py".source = ./confs/fish/functions/__bass.py;
  xdg.configFile."fish/functions/bass.fish".source = ./confs/fish/functions/bass.fish;
}
