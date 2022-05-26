{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
	  gnumake
    git
    exa
    starship
    asdf-vm
    clang
		python
    ruby
	  dotnet-sdk
    nodejs
    ccls
    gcc
    gdb
    rustup
    openjdk
    python3Full
    php
    php74Packages.composer
    mono
    msbuild
    dotnet-sdk_5
    omnisharp-roslyn
    gradle
    jdk
 ];


}


