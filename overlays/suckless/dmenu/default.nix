{ pkgs, lib, ... }:
with pkgs;
{
  nixpkgs.overlays = [
    (final: prev: {
      dmenu = prev.dmenu.overrideAttrs (old: {

        src = builtins.fetchTarball {

          url = "https://github.com/Fushiii/dmenu/archive/master.tar.gz";
          sha256 = "0cdswzb0ajv37jpx5m54nlqxb4xh0hygdl2pg40nr41f6f3ydc8h";
        };

      });
    })
  ];
}
