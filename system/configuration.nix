# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  user = "flake";
  host = "snowglobe";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
];



 fonts.fonts = with pkgs; [
    fira-code
    fira
    cooper-hewitt
    font-awesome
    ibm-plex
    jetbrains-mono
    iosevka
    # bitmap
    spleen
    fira-code-symbols
    powerline-fonts
    nerdfonts
  ];











 programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [

      rofi
      wayland
      xwayland
      swaylock
      swayidle
      wl-clipboard
      wf-recorder
      mako # notification daemon
      grim
     #kanshi
      slurp
      alacritty # Alacritty is the default terminal in the config
      dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
    ];
  };

programs.waybar.enable = true;


boot.supportedFilesystems = [ "ntfs" ];
  #Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "${host}"; # Define your hostname.

   time.timeZone = "America/Sao_Paulo";

  
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.imwheel.enable = true;



   services.xserver.desktopManager.plasma5.enable = true;
   services.xserver.displayManager.lightdm.enable = true;

   
 



  # Configure keymap in X11
   services.xserver.layout = "br";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

   programs.fish.enable = true;
   
   users.users.${user} = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
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
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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