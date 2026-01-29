{
  config,
  pkgs,
  username,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
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

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      link_break.disabled = true;
    };
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
    kdlfmt
    lua-language-server
    stylua
    typescript-language-server
    nixfmt

    # misc
    codex
    lazygit

    # productivity
    btop

    # networking
    dnsutils
  ];

}
