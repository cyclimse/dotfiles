{ config, pkgs, fonts, ... }:
{
  services.picom = {
    package = pkgs.picom-next;
    enable = true;
    experimentalBackends = true;
    blur = true;
    vSync = true;
    extraOptions = builtins.readFile ./picom-extra.conf;
  };
}
