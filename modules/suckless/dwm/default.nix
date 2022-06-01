{pkgs,lib,...}:

{
nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { 
        src = builtins.fetchTarball 
        {
       
          url = "https://github.com/Fushiii/dwm/archive/master.tar.gz";
          sha256 = "1bcmzif9nv4g3gnn5n53slsc5agmxfszx4h5lmajcdrxmk0h7sr5";

        };
        nativeBuildInputs = with pkgs; [ xorg.libX11 imlib2];
      });
    })
];
}
