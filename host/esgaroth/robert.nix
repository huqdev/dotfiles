{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.xfaf.homeModules.xfaf
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

  xfaf.neovim = {
    enable = true;
    makeDefault = true;
    extraLsps = [
      pkgs.nodePackages.typescript-language-server
    ];
  };

  programs.firefox.enable = true;
  programs.git.enable = true;

  home.sessionVariables = {
    FLAKE = config.home.homeDirectory + "/.dotfiles";
  };

  home.packages = with pkgs; [
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
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    texliveFull

    wlinhibit
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    xdg-desktop-portal-xapp
    xdg-desktop-portal-gnome
    xdg-desktop-portal-wlr
    wl-clipboard
    hyprcursor
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
