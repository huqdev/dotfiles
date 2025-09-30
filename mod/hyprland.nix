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
          float_switch_override_focus = "0";
          kb_layout = "de";
        };

        general = {
          border_size = 1;
          gaps_in = 0;
          gaps_out = 0;
        };

        misc = {
          new_window_takes_over_fullscreen = 2;
        };

        decoration = {
          rounding = 5;
          inactive_opacity = 0.90;
        };
        
        workspace = builtins.map (number: "${builtins.toString number}, monitor:eDP-1") (lib.range 1 9);

        # windowrule = [
        #   # "workspace 1 silent,kitty"
          
        #   "workspace 2 silent,thunderbird"
        #   "workspace 2 silent,vesktop"
        #   "workspace 2 silent,Element"
          
        #   "workspace 3 silent,firefox"
          
        #   "workspace 4 silent,steam"
          
        #   "workspace 5 silent,StardewModdingAPI"
        # ];

        windowrulev2 = [
        "workspace 1 silent, class:kitty, title:^(btop)"
        "float, class:kitty, title:btop"
        ];

        "$mainMod" = "SUPER";
      }
      // binds;

    extraConfig = ''
      monitor = eDP-1, 1920x1080@240, 0x0, 1
      exec-once = waybar
    '';
  };
}
