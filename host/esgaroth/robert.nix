{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.xfaf.homeModules.xfaf
    ../../mod/hyprland.nix
    ../../mod/swayidle.nix
    ../../mod/waybar.nix
    ../../mod/nvim.nix
  ];

  xfaf.shell = {
    enableAliases = true;
    installTools = true;
    fish.enable = true;
    starship.enable = true;
  };

  xfaf.btop.enable = true;
  xfaf.tmux.enable = true;

  xfaf.git = {
    enable = true;
    userName = "Robert Steig";
    userEmail = "huq88dev@hhu.de";
  };

  xfaf.desktop.apps.kitty = {
    enable = true;
    openTmux = true;
  };

  programs.firefox.enable = true;
  programs.git.enable = true;

  home.sessionVariables = {
    FLAKE = config.home.homeDirectory + "/.dotfiles";
  };

  home.packages = with pkgs; [
    pamixer
    brightnessctl
    thunderbird
    vesktop
    element-desktop
    wl-clipboard
    jetbrains.idea-ultimate
    spotify
    openjdk21
    gradle
    prismlauncher
    libreoffice-qt
    rofi-wayland
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    texliveFull
    hyprland
  ];

  home.shellAliases = {
    cb = "cd ..";
  };

  stylix.fonts.monospace = {
    package = pkgs.monocraft;
    name = "Monocraft Nerd Font Complete";
  };

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;
  programs.ssh.extraConfig = ''
    AddKeysToAgent yes
    IdentityFile ~/.ssh/key
  '';

  home.stateVersion = "24.05";
}
