    
{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
    
    # Java
    gradle
    jdk
    jre



    ];


}