{ pkgs, ... }:

{
  powerManagement.cpuFreqGovernor = "performance";

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  services.xserver.videoDrivers = [ "intel" ]; # modesetting didn't help
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" ]; # bbswitch
  boot.kernelParams = [ "acpi_rev_override=5" "i915.enable_guc=2" ];
  boot.kernelModules = [ "kvm-intel" ];

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

}
