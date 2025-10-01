{ pkgs, ... } : {
  # fuzzy finder
  programs.fzf.enable = true;
    
    home.packages =
      with pkgs.fishPlugins;
      [
        autopair # auto complete pairs like "", (), []
        colored-man-pages
        puffer # expand .... to ../..
        sponge # keep history clear of failed commands and typos
        ## foreign-env  # something about env variables. i dont get it yet,
                        # so it stays disabled for now
        grc
      ]
      ++ [
        pkgs.grc # generic text colouriser
      ];
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
    set fish_greeting
    fastfetch
    '';
  };
}
