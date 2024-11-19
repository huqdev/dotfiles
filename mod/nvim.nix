{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
  };

  home.packages = with pkgs;
    [
      # lsps
      alejandra
      beautysh
      black
      clang-tools
      clojure-lsp
      hadolint
      jdt-language-server
      lua-language-server
      marksman
      nixd
      nodePackages.bash-language-server
      prettierd
      pyright
      ruff
      rust-analyzer
      taplo
      texlab
      vscode-extensions.vadimcn.vscode-lldb.adapter
      vscode-extensions.vscjava.vscode-java-debug
      vscode-langservers-extracted
      zls
      # other stuff
      gcc
      git # for lazy
      ripgrep
      zathura # for tex preview
    ];

  home.sessionVariables = {
    JAVA_DEBUG = "${pkgs.vscode-extensions.vscjava.vscode-java-debug}/share/vscode/extensions/vscjava.vscode-java-debug/server/";
  };

  home.file = {
    ".config/nvim" = {
      source = ../config/nvim;
      recursive = true;
    };

    ".config/zathura/zathurarc".text = ''
      set render-loading false
    '';
  };
}
