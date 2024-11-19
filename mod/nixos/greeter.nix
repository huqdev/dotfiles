{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = let
        backgroundImage = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/97444e18b7fe97705e8caedd29ae05e62cb5d4b7/wallpapers/nixos-wallpaper-catppuccin-macchiato.png";
          hash = "sha256-SkXrLbHvBOItJ7+8vW+6iXV+2g0f8bUJf9KcCXYOZF0=";
        };
        greeterCommand = pkgs.writeScriptBin "greeter.sh" ''
          export XKB_DEFAULT_LAYOUT=de
          export XKB_DEFAULT_VARIANT=nodeadkeys
          export XKB_DEFAULT_OPTION=caps:escape

          ${pkgs.cage}/bin/cage -s -m last -- \
            ${pkgs.greetd-mini-wl-greeter}/bin/greetd-mini-wl-greeter \
            --user robert \
            --command Hyprland \
            --background-image ${backgroundImage}
        '';
      in {command = "${greeterCommand}/bin/greeter.sh";};
    };
  };
}
