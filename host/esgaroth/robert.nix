{config, pkgs, lib, ...}: {
  imports = [
    ../../mod/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;
  programs.git.enable = true;

  stylix.fonts.sizes.terminal = 9;
  
  programs.kitty = {
    enable = true;
    font.size = config.stylix.fonts.sizes.terminal;
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
    rofi
    rofi-rbw-wayland
    pinentry-rofi
    texliveFull
    hyprland
    gnumake
    wineWayland
    lutris
  ];

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;
  programs.ssh.matchBlocks."*".addKeysToAgent = "yes";
  programs.ssh.enableDefaultConfig = true;
  programs.ssh.extraConfig = ''
    IdentityFile ~/.ssh/id_rsa
  '';

  home.stateVersion = "24.05";
}
