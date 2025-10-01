{
  config,
  lib,
  pkgs,
  ...
}:
{

    home.packages = [
      pkgs.git-absorb
      config.scheme.check 
    ];

    programs.git = {
      userName = "huqdev";
      userEmail = "huq88dev@hhu.de";

      enable = true;

      lfs.enable = true;

      delta = {
        enable = true;
        options = {
          navigate = true;
          light = false;
          line-numbers = true;
          line-numbers-left-format = "{nm:>4} │";
          colorMoved = "default";
        };
      };

      attributes = [
        "* text=auto"
      ];

      extraConfig = {
        core = {
          whitespace = "trailing-space,space-before-tab";
          eol = "lf";
        };
        pull.rebase = true;
        push.followTags = true;
        push.autoSetupRemote = true;
        feature.manyFiles = true;
        init.defaultBranch = "main";
        column.ui = "auto";
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
        advice.addEmptyPathspec = false;
        user.signingkey = "~/.ssh/id_rsa.pub";
        gpg.format = "ssh";
        commit.gpgSign = true;
        rebase.autoStash = true;
        rebase.abbreviateCommands = true;
        rerere.enabled = true;
        branch.sort = "-committerdate";
      };

      aliases = {
        exec = "!exec ";
        make = "!exec make ";
        fuckup = "reset --soft HEAD~1";
        root = "rev-parse --show-toplevel";
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        fpush = "push --force-with-lease";
        smartblame = "blame -w -CCC";
      };
    };
}
