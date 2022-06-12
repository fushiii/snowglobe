{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
	  gnumake
    # Java
    gradle
    jdk
    jre
    # Ruby
    ruby
    bundler
    # C#
    dotnet-sdk
    dotnet-runtime
    # Python
    python
    
    # Database
    mariadb

 ];


}


