{ config, lib, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cyclimse";
  home.homeDirectory = "/home/cyclimse";

  imports = [
    ../programs/brave/default.nix
    ../programs/fish/default.nix
    ../programs/neovim/default.nix
    ../programs/vscode/default.nix
    ../programs/spotifyd/default.nix
  ];

  programs.git = {
    enable = true;
    userName = "Andy Méry";
    userEmail = "andy.mery@pm.me";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };

  home.packages = with pkgs; [
    # Media
    discord
    # Programming
    nixpkgs-fmt
    # Gaming
    multimc
    # Utilities
    direnv
  ];
}
