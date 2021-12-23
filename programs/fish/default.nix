{ config, lib, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "kubectl-completions";
        src = builtins.fetchGit {
          url = "git@github.com:evanlucas/fish-kubectl-completions.git";
          ref = "main";
        };
      }
      {
        name = "tide";
        src = builtins.fetchGit {
          url = "git@github.com:IlanCosman/tide.git";
          ref = "main";
        };
      }
    ];
    shellInit = ''
      # Set syntax highlighting colours; var names defined here:
      # http://fishshell.com/docs/current/index.html#variables-color
      set fish_color_autosuggestion brblack
      direnv hook fish | source
    '';
    shellAliases = {
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      mkdir = "mkdir -p";
    };
    shellAbbrs = {
      g = "git";
      m = "make";
      n = "nvim";
      o = "open";
      p = "python3";
    };
    functions = {
      fish_greeting = {
        description = "Greeting to show when starting a fish shell";
        body = "";
      };
    };
  };
}
