{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.xfaf.nixosModules.xfaf
  ];

  xfaf.nixconfig = {
    enable = true;
    allowUnfree = true;
  };

  xfaf.users.robert = {
    opts = {
      description = "Robert Steig";
      extraGroups = ["networkmanager" "wheel"];
    };
    home-manager = {
      enable = true;
      config = ./robert.nix;
    };
  };

  xfaf.bootconfig.enable = true;
  programs.fish.enable = true;
  programs.steam.enable = true;
  users.defaultUserShell = pkgs.fish;
  boot.supportedFilesystems = ["ntfs"];
  boot.plymouth.enable = true;
  boot.loader.timeout = lib.mkForce 3;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/framer.yaml";
    image = pkgs.fetchurl {
      url = "https://cdn.pixabay.com/photo/2021/12/31/11/51/penguin-6905568_1280.jpg";
      hash = "sha256-SOL1PwXIzq5iLyJZEXemHZw/tR4rE+dct/G2RIMIqzg=";
    };
  };

  services.thermald.enable = true;
  xfaf.services.avahi.enable = true;
  hardware.bluetooth.enable = true;
  boot.initrd.luks.devices."luks-3ec07424-6915-48e2-ae7d-57fd0e34e1c8".device = "/dev/disk/by-uuid/3ec07424-6915-48e2-ae7d-57fd0e34e1c8";
  networking.hostName = "esgaroth";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console.keyMap = "de";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # PUT YOUR PACKAGES HERE
  ];

  specialisation = {
    perfomance.configuration = {
      system.nixos.tags = ["perfomance"];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce false;
        prime.offload.enableOffloadCmd = lib.mkForce false;
        prime.sync.enable = lib.mkForce true;
      };
    };
  };

  # DO NOT CHANGE THIS
  system.stateVersion = "24.05";
}
