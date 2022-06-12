# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  user = "deviant";
  host = "detroit";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];

  
# Enable ntfs
 boot.supportedFilesystems = [ "ntfs" ];

#Allow unfree packages
 nixpkgs.config.allowUnfree = true;

# Boot loader
  
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      enable = true;
      efiSupport = true;
     # useOSProber = true;
    };
  };
  # Set the timezone
  time.timeZone = "America/Sao_Paulo";

  networking.wireless.enable = true;
  networking.hostName = "${host}"; # Define your hostname.
  
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Console Configuration 

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Enable the X11 windowing system.
   services.xserver.enable = true;
  
  # Configure keymap in X11
   services.xserver.layout = "br";
  
  # Change the keyboard repeat rate for X11.
  
  services.xserver = {
    autoRepeatDelay = 200;
    autoRepeatInterval = 50;
  };

  # Enable imwheel 
   services.xserver.imwheel.enable = true;
  # Enable lightdm 
   services.xserver.displayManager.lightdm.enable = true;

  
  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.${user} = {
     isNormalUser = true;
     extraGroups = [ "wheel" "storage" "optic"]; # Enable ‘sudo’ for the user.
     shell = pkgs.fish;
   };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
 
 nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    autoOptimiseStore = true;
       gc = {
         automatic = true;
	       dates = "weekly";
	       options = "--delete-older-than 7d";

       };
 };
 
   environment.sessionVariables = rec {
    "_JAVA_OPTIONS"="-Dawt.useSystemAAFontSettings=lcd";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  
  # Start the ssh-agent
  # programs.ssh.startAgent = true; 


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}
