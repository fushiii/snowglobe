{
  description = "You will meet your doom here";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/22.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };

      };

      lib = nixpkgs.lib;

    in
    {

      nixosConfigurations = {
        detroit = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            ./modules
            ./overlays
            home-manager.nixosModules.home-manager
            {

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.deviant = {
                  imports = [
                    ./hosts/deviant
                  ];
                };
              };
            }


          ];

        };
      };


    };

}

