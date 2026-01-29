{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  home.username = "finnzxje";
  home.homeDirectory = "/home/finnzxje";
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos, btw";
    };
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

  # link niri

  xdg.configFile."niri" = {
    source = create_symlink "${dotfiles}/niri";
  };

  programs.git = {
    enable = true;
    settings.user.name = "finzxje";
    settings.user.email = "minthinh0900@gmail.com";
  };

  # yazi configuration
  programs.yazi = {
    enable = true;
  };

  home.packages = with pkgs; [
    ripgrep
    unzip
    fd
    wget
    gcc
    nodejs
    yarn
    tree-sitter
    bash-language-server
    tinymist
    gopls
    yaml-language-server
    kdlfmt
    lua-language-server
    typescript-language-server
    ncdu

    nixfmt
  ];

}
