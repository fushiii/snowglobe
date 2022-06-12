{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
  ];

  nixpkgs.overlays = [
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: {
          src = builtins.fetchTarball {
            url = "https://discord.com/api/download?platform=linux&format=tar.gz";
            sha256 = "0cdswzb0ajv37jpx5m54nlqxb4xh0hygdl2pg40nr41f6f3ydc8h";
          };
          nativeBuildInputs = with pkgs; [ xorg.libX11 xorg.libXinerama xorg.libXft ];
        }
      );
    })
  ];
}
