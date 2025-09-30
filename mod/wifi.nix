{config, ...}: {
  sops.secrets.wifi = {
    sopsFile = ../secrets/wifi;
    format = "binary";
  };

  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    secretsFile = config.sops.secrets.wifi.path;
    fallbackToWPA2 = false;

    networks = {
      HHUD-Y = {
        # safe version of the above: read PSK from the
        pskRaw = "ext:HHUDY"; # variable psk_echelon, defined in secretsFile,
      }; # this won't leak into /nix/store
    };
  };
}
