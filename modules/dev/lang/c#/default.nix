{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [

    # C#
    dotnet-sdk
    dotnet-runtime

    ];


}