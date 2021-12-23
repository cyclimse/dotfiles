{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhsWithPackages (ps: with ps; [ stdenv.cc.cc.lib ]);
    extensions = with pkgs.vscode-extensions; [
      # Nix support
      bbenoist.nix
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      # Docker
      ms-azuretools.vscode-docker
      # Markdown support
      yzhang.markdown-all-in-one
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "find-it-faster";
        publisher = "tomrijndorp";
        version = "0.0.13";
        sha256 = "093cn3g9wgrmmda0hdaf6f8fiw1a6r9x92kbcf5i97k083jnxrdl";
      }
      {
        name = "material-palenight-theme";
        publisher = "whizkydee";
        version = "2.0.2";
        sha256 = "1lh4bz8nfxshi90h1dbliw3mi9sh5m5z46f2dhm5lam4xxfjkwgz";
      }
    ];
  };
}

