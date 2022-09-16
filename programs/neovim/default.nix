{ config, pkgs, fonts, ... }:
{
  config = {
    home.packages = with pkgs; [
      neovim
      # Fuzzy finders
      fzf
      ripgrep
      # Linters, formatters ...
      efm-langserver
      # Python
      nodePackages.pyright
      # LUA
      sumneko-lua-language-server
      # Nix
      rnix-lsp
      # Zig (my boi)
      zls
      # Golang
      gopls
      golangci-lint
      (pkgs.callPackage ./golangci-lint-langserver.nix {
        version = "0.0.7";
      })
      # Elixirls
      elixir_ls
      # Patched fonts
      (nerdfonts.override {
        fonts = [ "Hermit" "Ubuntu" "UbuntuMono" ];
      })
    ];

    xdg.configFile = {
      "nvim".source = ./nvim;
    };
  };
}

