{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  services.easyroam = {
    enable = true;
    pkcsFile = "/home/robert/Documents/easyroam.p12"; # or e.g. config.sops.secrets.easyroam.path
    # automatically configure NetworkManager
    networkmanager = {
      enable = true;
    };
  };
}
