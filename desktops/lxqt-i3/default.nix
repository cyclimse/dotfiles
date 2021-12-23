{ config, pkgs, fonts, ... }:
{
  imports = [
    ../../programs/kitty/default.nix
    ../../programs/picom/default.nix
    ../../programs/zathura/default.nix
  ];

  config = {
    # Reference: https://i3-discuss.i3.zekjur.narkive.com/nU5afSse/set-environment-variable-only-for-i3-session
    # It needs to be here so that SDDM can source it before executing i3.
    home.file.".xprofile".text = "export QT_QPA_PLATFORMTHEME=lxqt;";

    home.packages = with pkgs; [
      neofetch
      # Utilities
      htop
      pass
      # Theming
      vimix-icon-theme
      ubuntu_font_family
      arc-theme
    ];

    xdg.configFile = {
      "i3".source = ./i3;
    };
  };
}
