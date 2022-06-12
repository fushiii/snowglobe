{stdenv, pkgs, ...}:

with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "luastatus";

  src = builtins.fetchTarball {
    url="https://github.com/shdown/luastatus/archive/master.tar.gz";
    sha256="1bcmzif9nv4g3gnn5n53slsc5agmxfszx4h5lmajcdrxmk0h7sr5";

  };
  nativeBuildInputs =  with pkgs; [ cmake make ];
  
}
