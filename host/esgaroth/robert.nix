{config, pkgs, lib, ...}: {
  imports = [
    ../../mod/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.direnv.enable = true;

  stylix.fonts.sizes.terminal = 10;
  
  programs.kitty = {
    enable = true;
    font.size = config.stylix.fonts.sizes.terminal;
  };
  
  home.packages = with pkgs; [
    kdePackages.kate
    pamixer
    brightnessctl
    thunderbird
    vesktop
    element-desktop
    wl-clipboard
    jetbrains.idea
    spotify
    javaPackages.compiler.openjdk25
    gradle
    orca
    prismlauncher
    libreoffice-qt
    rofi
    rofi-rbw-wayland
    pinentry-rofi
    texliveFull
    hyprland
    gnumake
    wine-wayland
    lutris
    hyprshot
  ];

  programs.nh = {
    enable = true;
  };
  
  programs.ssh.enable = true;
  services.ssh-agent.enable = true;
  programs.ssh.matchBlocks."*".addKeysToAgent = "yes";
  programs.ssh.enableDefaultConfig = true;
  programs.ssh.extraConfig = ''
    IdentityFile ~/.ssh/id_rsa
  '';

  home.stateVersion = "24.05";
}
