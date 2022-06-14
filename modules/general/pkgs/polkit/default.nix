{ pkgs, config, ... }:
{
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    polkit
    polkit_gnome
  ];
  
  systemd.user.services.auth-agent = {
    script = ''
       "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
    '';
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
  };


}
