{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "huq88dev@hhu.de";
      lock_timeout = 1800;
      pinentry = pkgs.pinentry-rofi;
    };
  };
}
