{ pkgs, config, ... }:
{
  networking.firewall.checkReversePath = "loose";

  environment.systemPackages = with pkgs; [

    tailscale
    wireguard-tools
  ];

  networking.firewall = {
    enable = true;

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  networking.wireguard.interfaces.wg0 = {
    generatePrivateKeyFile = true;
    privateKeyFile = "/persist/etc/wireguard/wg0";
  };

  # Tailscale config, based on:
  # https://tailscale.com/blog/nixos-minecraft/
  services.tailscale.enable = true;

  # create a systemd oneshot job to authenticate to Tailscale.com at login
  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale.com";

    # make sure tailscale is running locally before trying to connect to Tailscale.com
    after = [ "network-pre.target" "tailscale.service" ];
    wants = [ "network-pre.target" "tailscale.service" ];
    wantedBy = [ "multi-user.target" ];

    # set this service as a oneshot job
    serviceConfig.Type = "oneshot";

    # have the job run this shell script to authenticate with Tailscale.com
    script = with pkgs; ''
      # wait for tailscaled to settle
      # (as of tailscale 1.4 this should no longer be necessary, but I find it still is)
      echo "Waiting for tailscale service start completion ..." 
      sleep 5

      # check if we are already authenticated to tailscale
      echo "Checking if already authenticated to Tailscale ..."
      status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
      if [ $status = "Running" ]; then  # do nothing
        echo "Already authenticated to Tailscale.com, exiting."
        exit 0
      fi
    
      # otherwise authenticate with tailscale
      echo "Authenticating with Tailscale ..."
      ${tailscale}/bin/tailscale up --authkey $(cat /etc/tailscale/tskey-reusable)
    '';
  };

}
