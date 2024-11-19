{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  services.easyroam = {
    enable = true;
    pkcsFile = "/home/robert/Documents/easyroam_18_11_2024_12_28_09.p12"; # or e.g. config.sops.secrets.easyroam.path
    # automatically configure NetworkManager
    networkmanager = {
      enable = true;
    };
  };
}
