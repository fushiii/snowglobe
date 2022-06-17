{ pkgs, ... }:

{
  imports = [ 
    ./java
    #./rust
    ];
  environment.systemPackages = with pkgs; [

    # Database
    mariadb

  ];


}


