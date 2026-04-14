{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  stylix.targets.swaylock.enable = false;
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
    settings = {
      image = ../config/desktop/lockscreen.png;
      ignore-empty-password = true;
      daemonize = true;
      show-failed-attempts = true;
      indicator-caps-lock = true;
      indicator-idle-visible = true;
      indicator-radius = 80;
      indicator-x-position = 1700;
      indicator-y-position = 200;
    };
  };
  
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = "${config.programs.swaylock.package}/bin/swaylock";
      }
      {
        event = "before-sleep";
        command = "${config.programs.swaylock.package}/bin/swaylock; ${pkgs.playerctl}/bin/playerctl pause";
      }
    ];
  };
}
