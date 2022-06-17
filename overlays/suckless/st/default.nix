{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      /*
      src = builtins.fetchTarball {
        url = "https://github.com/lukesmithxyz/st/archive/master.tar.gz";
        sha256 = "19wjh9hrl3pb2g2b5rzlj0wz0sh3311bfpmrrc74w38x0fwp14i7";

      };
      */
      src = ./src;


      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];

    }))
  ];
}
