{ pkgs, ... } : {
  stylix.targets.rofi.enable = false;
  
  programs.rofi = {
    enable = true;
    
    package = pkgs.rofi;

    theme = ./rofi-theme.rasi;
  };
}
