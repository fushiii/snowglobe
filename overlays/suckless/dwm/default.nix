{ pkgs, lib, ... }:

{
  services.xserver.windowManager.dwm.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        /*
        src = builtins.fetchTarball {
          url = "https://github.com/Fushiii/dwm/archive/master.tar.gz";
          sha256 = "1vas90hcs1wmvd0yqp8faxvmckjhr4jqy8dqvxk87dk0bwdcvwid";

        };
        */
        src = ./src;
        nativeBuildInputs = with pkgs; [ xorg.libX11 imlib2 ];
      });
    })
  ];
}
