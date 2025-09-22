{pkgs, ...}: {
  imports = [
    ../../mod/hyprland.nix
  ];

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.fish.enable = true;
  programs.kitty.enable = true;

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
    rofi-rbw
    pinentry-rofi
    texliveFull
    hyprland
    gnumake
    wineWayland
    lutris
  ];

  home.shellAliases = {
    cb = "cd ..";
  };

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;
  programs.ssh.addKeysToAgent = "yes";
  programs.ssh.extraConfig = ''
    IdentityFile ~/.ssh/id_rsa
  '';

  home.stateVersion = "24.05";
}
