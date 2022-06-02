{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#    home-manager.url = "github:nix-community/home-manager/release-20.09";
#    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: 
  
  let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

  lib = nixpkgs.lib;
  
  in {
        
      nixosConfigurations = {
        detroit = lib.nixosSystem {
        inherit system;
          modules = [ 
            ./system/configuration.nix
      	    ./modules 
      ];
  
      };
    };
	};

}

