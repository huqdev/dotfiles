{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input = {
        follow_mouse = "2";
        kb_layout = "de";
      };

      "$mainMod" = "SUPER";

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

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bind = [
        # Apps
        "$mainMod, r, exec, killall rofi || rofi -show drun -show-icons"
        "$mainMod ALT, t, exec, kitty"
        "$mainMod ALT, f, exec, firefox"
        "$mainMod ALT, i, exec, idea-ultimate"
        "$mainMod ALT, m, exec, thunderbird"
        "$mainMod, ssharp, exec, kitty -e btop"

        # Navigation
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, q, killactive, "
        "$mainMod, f, fullscreen, 0"

        "$mainMod ALT, h, swapwindow, l"
        "$mainMod ALT, l, swapwindow, r"
        "$mainMod ALT, j, swapwindow, d"
        "$mainMod ALT, k, swapwindow, u"

        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Power
        "$mainMod SHIFT, l, exec, loginctl lock-session"
      ];

      binde = [
        # Sound
        "$mainMod, F1, exec, pamixer -t"
        "$mainMod, F2, exec, pamixer -d 5"
        "$mainMod, F3, exec, pamixer -i 5"

        # Light
        "$mainMod, F7, exec, brightnessctl set 1%-"
        "$mainMod, F8, exec, brightnessctl set 1%+"
        "$mainMod SHIFT, F7, exec, brightnessctl set 10%-"
        "$mainMod SHIFT, F8, exec, brightnessctl set 10%+"
      ];
    };

    extraConfig = ''
      monitor = eDP-1, 1920x1080@240, 0x0, 1
      exec-once = waybar
    '';
  };
}
