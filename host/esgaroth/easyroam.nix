{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  services.easyroam = {
    enable = true;
    pkcsFile = "/home/robert/Documents/easyroam_09_01_2025_11_57_08.p12"; # or e.g. config.sops.secrets.easyroam.path
    # automatically configure NetworkManager
    networkmanager = {
      enable = true;
    };
  };
}
