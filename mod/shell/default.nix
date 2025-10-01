{ lib, pkgs, ... } : 
{
  imports = [
    ./starship.nix
    ./fish.nix
  ];
  
  home.packages = with pkgs; 
    [
      bat # fancy cat
      btop # mem,cpu, etc. monitoring
      duf # disk utility fancy. (partitions and stuff)
      dust # disk usage written in Rust
      eza # fancy ls
      fastfetch # fast neofetch (system logo and info)
      fd # fancy find
      file # determine file type
      imagemagick # util for handling images in a shell
      man-pages-posix # man pages for c standard library
      mdcat # markdown cat
      psmisc # miscellaneous utilities
      speedtest-rs 
      wget # web file downloader
      unzip 
      ripgrep # search files for strings. used by my vim
    ];
  
  home.shellAliases = rec {
      # ls stuff
      ls = "${lib.getExe pkgs.eza} -F --sort extension --group-directories-first --git --icons -Mo --hyperlink --git-repos-no-status --color-scale=size --no-permissions ";
      ll = ls + "-l ";
      la = ll + "-a ";
      l = ll;
      gls = ll + "--git-ignore ";
      # tree fake
      tree = ls + "--tree ";
      ltree = ll + "--tree ";
      gtree = ltree + "--git-ignore ";
      tree2 = tree + "--level=2 ";
      tree3 = tree + "--level=3 ";
      # convenience
      cat = lib.getExe pkgs.bat;
      ccat = "command cat";
      lsblk = "command lsblk -f";
      mkdirp = "mkdir -p";
      rm = "rm -Iv";
      df = lib.getExe pkgs.duf;
      cp = lib.getExe pkgs.xcp;
      cb = "cd ..";
      # git
      gs = "${lib.getExe pkgs.git} status -sb";
      gd = "${lib.getExe pkgs.git} diff";
      gdc = "${lib.getExe pkgs.git} diff --cached";
      ga = "${lib.getExe pkgs.git} add";
      gaa = "${lib.getExe pkgs.git} add --all";
      gl = "${lib.getExe pkgs.git} lg";
      gcm = "${lib.getExe pkgs.git} commit -m";
  };
}
