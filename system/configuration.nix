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
    [
      # Include the results of the hardware scan.
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
      extraEntries = ''
      menuentry 'Arch Linux (on /dev/sda8)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-1f321979-95d3-464b-a6c2-5d5b9fe1fbae' {
	insmod part_gpt
	insmod ext2
	set root='hd0,gpt8'
	if [ x$feature_platform_search_hint = xy ]; then
	  search --no-floppy --fs-uuid --set=root --hint-bios=hd0,gpt8 --hint-efi=hd0,gpt8 --hint-baremetal=ahci0,gpt8  1f321979-95d3-464b-a6c2-5d5b9fe1fbae
	else
	  search --no-floppy --fs-uuid --set=root 1f321979-95d3-464b-a6c2-5d5b9fe1fbae
	fi
	linux /boot/vmlinuz-linux-positron root=UUID=1f321979-95d3-464b-a6c2-5d5b9fe1fbae rw loglevel=3 quiet
	initrd /boot/initramfs-linux-positron.img
}
submenu 'Advanced options for Arch Linux (on /dev/sda8)' $menuentry_id_option 'osprober-gnulinux-advanced-1f321979-95d3-464b-a6c2-5d5b9fe1fbae' {
	menuentry 'Arch Linux (on /dev/sda8)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux-positron--1f321979-95d3-464b-a6c2-5d5b9fe1fbae' {
		insmod part_gpt
		insmod ext2
		set root='hd0,gpt8'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd0,gpt8 --hint-efi=hd0,gpt8 --hint-baremetal=ahci0,gpt8  1f321979-95d3-464b-a6c2-5d5b9fe1fbae
		else
		  search --no-floppy --fs-uuid --set=root 1f321979-95d3-464b-a6c2-5d5b9fe1fbae
		fi
		linux /boot/vmlinuz-linux-positron root=UUID=1f321979-95d3-464b-a6c2-5d5b9fe1fbae rw loglevel=3 quiet
		initrd /boot/initramfs-linux-positron.img
	}
	menuentry 'Arch Linux, with Linux linux-positron (on /dev/sda8)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux-positron--1f321979-95d3-464b-a6c2-5d5b9fe1fbae' {
		insmod part_gpt
		insmod ext2
		set root='hd0,gpt8'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd0,gpt8 --hint-efi=hd0,gpt8 --hint-baremetal=ahci0,gpt8  1f321979-95d3-464b-a6c2-5d5b9fe1fbae
		else
		  search --no-floppy --fs-uuid --set=root 1f321979-95d3-464b-a6c2-5d5b9fe1fbae
		fi
		linux /boot/vmlinuz-linux-positron root=UUID=1f321979-95d3-464b-a6c2-5d5b9fe1fbae rw loglevel=3 quiet
		initrd /boot/initramfs-linux-positron.img
	}
	menuentry 'Arch Linux, with Linux linux-positron (fallback initramfs) (on /dev/sda8)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux-positron--1f321979-95d3-464b-a6c2-5d5b9fe1fbae' {
		insmod part_gpt
		insmod ext2
		set root='hd0,gpt8'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd0,gpt8 --hint-efi=hd0,gpt8 --hint-baremetal=ahci0,gpt8  1f321979-95d3-464b-a6c2-5d5b9fe1fbae
		else
		  search --no-floppy --fs-uuid --set=root 1f321979-95d3-464b-a6c2-5d5b9fe1fbae
		fi
		linux /boot/vmlinuz-linux-positron root=UUID=1f321979-95d3-464b-a6c2-5d5b9fe1fbae rw loglevel=3 quiet
		initrd /boot/initramfs-linux-positron-fallback.img
	}
      
      
      '';
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

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.fish.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "storage" "optic" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  environment.sessionVariables = rec {
    "_JAVA_OPTIONS" = "-Dawt.useSystemAAFontSettings=lcd";
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
