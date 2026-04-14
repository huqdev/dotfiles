{config, ...}: {
  sops.secrets.wifi = {
    group = "wpa_supplicant";
    mode = "0640";
    sopsFile = ../secrets/wifi;
    format = "binary";
  };
  
  sops.secrets.vpnconfig = {
    sopsFile = ../secrets/HHU-VPN.ovpn;
    format = "binary";
  };

  sops.secrets.vpncredentials = {
    sopsFile = ../secrets/unikennung;
    format = "binary";
  };

  services.openvpn.servers = {
    hhuvpn = {
      config = ''config ${config.sops.secrets.vpnconfig.path}'';
    };
  };

  users.extraUsers.robert.extraGroups = ["wpa_supplicant"];

  networking.wireless = {
    enable = true;
    userControlled = true;
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

      "Galaxy S20 FE2474" = {
        pskRaw = "ext:GALAXYS20";
      };

      "Rieslinggast" = {
        pskRaw = "ext:RIESLINGHAUS";
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
