{lib, config, pkgs, ...}:
{
  programs.fish = {
    enable = true;
    shellInit = import ../../confs/fish/config.nix { inherit pkgs; };
    
    shellAliases = {
      # Exa ls replacement
      
      ls = "${pkgs.exa}/bin/exa --group-directories-first";
      l = "${pkgs.exa}/bin/exa -lbF --git --group-directories-first --icons";
      ll = "${pkgs.exa}/bin/exa -lbGF --git --group-directories-first --icons";
      llm =
        "${pkgs.exa}/bin/exa -lbGd --git --sort=modified --group-directories-first --icons";
      la =
        "${pkgs.exa}/bin/exa -lbhHigmuSa --time-style=long-iso --git --color-scale --group-directories-first --icons";
      lx =
        "${pkgs.exa}/bin/exa -lbhHigmuSa@ --time-style=long-iso --git --color-scale --group-directories-first --icons";
      lt =
        "${pkgs.exa}/bin/exa --tree --level=2 --group-directories-first --icons";

      # Gitignores

      git-ignore-create-go =
        "${pkgs.curl}/bin/curl 'https://www.toptal.com/developers/gitignore/api/vim,go,tags,ssh' > .gitignore";


      # Other
      up = "sudo nixos-rebuild switch --flake .#";
      lsblk = "lsblk -o name,mountpoint,label,size,type,uuid";
      top = "${pkgs.htop}/bin/htop";

    };
  };

}