{pkgs, ...}:
{

nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { 
        src = builtins.fetchTarball 
        {
          
          url = "https://github.com/lukesmithxyz/dwm/archive/master.tar.gz";
          sha256 = "1dipcgh19cm23vgwyib4d1hy51vd0ra17ajdfv9mjrx7psyc3ll9";
        };
      });
    })
];
}
