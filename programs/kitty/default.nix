{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Hurmit Nerd Font";
      size = 16;
    };
    # Reference: https://sw.kovidgoyal.net/kitty/conf/
    settings = {
      window_padding_width = 10;
      background_opacity = "0.8";
    };
    extraConfig = builtins.readFile ./palenight.conf;
  };
}