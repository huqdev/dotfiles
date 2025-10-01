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

      Vodafone-6F04 = {
        pskRaw = "ext:VODAFONEHOME";
      };
    };
  };
  sops.secrets.easyroam = {
    sopsFile = ../secrets/easyroam.p12;
    format = "binary";
  };
  
  services.easyroam = {
    enable = true;
    pkcsFile = config.sops.secrets.easyroam.path;
    wpa-supplicant = {
      enable = true;
    };
  };
}
