{ config, lib, pkgs, ... }:

let
  email = (import ../secrets.nix).email;
  unstable = import <nixpkgs-unstable> { };
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cyclimse";
  home.homeDirectory = "/home/cyclimse";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../programs/brave/default.nix
    # ../programs/fish/default.nix
    ../programs/neovim/default.nix
    ../programs/vscode/default.nix
    # ../programs/spotifyd/default.nix
  ];

  programs.git = {
    enable = true;
    userName = "Andy Méry";
    userEmail = email;
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };

  home.packages = with pkgs; [
    # Media
    unstable.discord
    spotify
    # Programming
    nixpkgs-fmt
    joplin-desktop
    # Gaming
    # multimc
    # Utilities
    kubectl
  ];


  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
