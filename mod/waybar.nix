{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  moduleConfig = builtins.fromJSON (builtins.readFile ../config/waybar/config.json);
in {
  home.file = {
    ".config/waybar/style.css".source = ../config/waybar/style.css;
  };

  stylix.targets.waybar.enable = false;

  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar =
      {
        height = 30;
        exclusive = true;
        reload_style_on_change = true;
        modules-left = [
          "clock"
          "network"
          "pulseaudio"
          "backlight"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "cpu"
          "temperature"
          "memory"
          "battery"
          "tray"
        ];
      }
      // moduleConfig;
  };
}
