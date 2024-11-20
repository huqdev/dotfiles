{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  binds = builtins.fromJSON (builtins.readFile ../config/desktop/hyprland/binds.json);
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings =
      {
        input = {
          follow_mouse = "2";
          kb_layout = "de";
        };

        general = {
          border_size = 2;
          gaps_in = 2;
          gaps_out = 2;
        };

        misc = {
          new_window_takes_over_fullscreen = 2;
        };

        decoration = {
          rounding = 10;
          inactive_opacity = 0.95;
        };
        workspace = builtins.map (number: "${builtins.toString number}, monitor:eDP-1") (lib.range 1 9);

        windowrulev2 = "workspace:5, class:(StardewModdingAPI)";
          
      }
      // binds;

    extraConfig = ''
      monitor = eDP-1, 1920x1080@240, 0x0, 1
      exec-once = waybar
    '';
  };
}
