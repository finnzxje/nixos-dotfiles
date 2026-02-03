{
  config,
  pkgs,
  username,
  inputs,
  ...
}:

let
  dotfiles = "~/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  imports = [
    ./shell
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
    # source = create_symlink "${dotfiles}/nvim";
    source = ../config/nvim;
  };

  # link niri

  xdg.configFile."niri" = {
    # source = create_symlink "${dotfiles}/niri";
    source = ../config/niri;
  };

  programs.git = {
    enable = true;
    settings.user.name = "finnzxje";
    settings.user.email = "minhthinh0900@gmail.com";
  };

  # yazi configuration
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    plugins = {
      lazygit = pkgs.yaziPlugins.lazygit;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      starship = pkgs.yaziPlugins.starship;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
      require("starship"):setup()
    '';
  };

  home.packages = with pkgs; [
    neofetch

    # utils

    ripgrep
    wget
    gcc
    nodejs
    yarn
    eza

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
    codex
    lazygit

    # productivity
    btop

    # networking
    dnsutils

    kitty
    nil
  ];

}
