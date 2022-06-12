{pkgs, stdenv, ...}:

  stdenv.mkDerivation rec {
      name = "nmd";
      src = builtins.fetchTarball {
          url = "https://github.com/vpsfreecz/nmd/archive/master.tar.gz";
          sha256 = "04w2gzrly6lynb3y6c497cw5hib2f4pw22jyimpc43m9292mv7kg";

        };

    }

