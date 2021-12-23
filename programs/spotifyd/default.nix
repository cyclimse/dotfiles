{ config, pkgs, ... }:
{
  config = {
    services.spotifyd = {
      enable = true;
      package = (pkgs.spotifyd.override { withMpris = true; });
      settings = {
        global = {
          username = "andy.mery@imt-atlantique.net";
          password_cmd = "pass spotify";
          device_name = "nix-spotifyd";
        };
      };
    };

    home.packages = with pkgs; [
      spotify-tui
    ];
  };
}
