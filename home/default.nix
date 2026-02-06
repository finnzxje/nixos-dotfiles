{
  config,
  pkgs,
  username,
  inputs,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  imports = [
    ./shell
    ./programs
    ./npm.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };

  # neovim configuration
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
  };

  xdg.enable = true;

  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim";
  };

  xdg.configFile."niri" = {
    source = create_symlink "${dotfiles}/niri";
  };

  programs.git = {
    enable = true;
    settings.user.name = "finnzxje";
    settings.user.email = "minhthinh0900@gmail.com";
  };

  home.packages = with pkgs; [
    neofetch

    # utils

    ripgrep
    wget
    gcc
    nodejs
    yarn

    # neovim migration
    tree-sitter
    bash-language-server
    tinymist
    gopls
    yaml-language-server
    yamlfmt
    prettier
    kdlfmt
    lua-language-server
    stylua
    typescript-language-server
    nixfmt
    go
    nixd

    # misc
    lazygit

    # productivity
    btop

    # networking
    dnsutils

    nil
    (python313.withPackages (
      ps: with ps; [
        # python language server
        pyright
        ruff

        pipx # Install and Run Python Applications in Isolated Environments
        black # python formatter
        uv # python project package manager

        # my commonly used python packages
        jupyter
        pandas
        requests
        pyquery
        pyyaml

        # misc
        protobuf # protocol buffer compiler
        numpy
      ]
    ))
  ];

}
