{pkgs, ...}:
{
environment.systemPackages = with pkgs; [
  (st.overrideAttrs (oldAttrs: rec {
   # src = fetchFromGitHub {
   #   owner = "LukeSmithxyz";
   #   repo = "st";
   #   rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b";
   #   sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag";
   # };

  # Make sure you include whatever dependencies the fork needs to build properly!
  # If you want it to be always up to date use fetchTarball instead of fetchFromGitHub
   
   src = builtins.fetchTarball {
     url = "https://github.com/lukesmithxyz/st/archive/master.tar.gz";
     sha256 = "19wjh9hrl3pb2g2b5rzlj0wz0sh3311bfpmrrc74w38x0fwp14i7";
   
   };
   
    buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
  
  }))
];
}
