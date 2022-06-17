    
{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
    
    # Java
    cargo
    rust
    rustc


    ];


}