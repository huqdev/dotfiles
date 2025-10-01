# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../mod/wifi.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
  

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "esgaroth"; # Define your hostname.

  # Set your time zone.
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

  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # Enable priority scheduling for pipewire
  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.robert = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "docker" "wheel" ];
    password = "test";
  };

  programs.fish.enable = true;
  programs.steam.enable = true;
  users.defaultUserShell = pkgs.fish;
  home-manager.users.robert = ./robert.nix;
    
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/phd.yaml";
    image = pkgs.fetchurl {
      url = "https://cdn.pixabay.com/photo/2021/12/31/11/51/penguin-6905568_1280.jpg";
      hash = "sha256-SOL1PwXIzq5iLyJZEXemHZw/tR4rE+dct/G2RIMIqzg=";
    };
  };
  
  boot.supportedFilesystems = ["ntfs"];
  boot.plymouth.enable = true;
  boot.loader.timeout = lib.mkForce 3;
  
  hardware.bluetooth.enable = true;
  services.thermald.enable = true;
  
  virtualisation.docker.enable = true;

  # allow swaylock to check if a given password is valid. empty {} for some fcking reason
  security.pam.services.swaylock = {};

  sops.age.keyFile = "/home/robert/.config/sops/age/keys.txt";
  
  environment.systemPackages = with pkgs; [
    sops
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment? NO
}

