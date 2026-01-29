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
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos, btw";
    };
  };

  # Shell
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    VISUAL = "nvim";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    oh-my-zsh.enable = true;

    shellAliases = {
      ls = "eza --icons -l -T -L=1";
      y = "yazi";
    };

    initContent = ''
      bindkey '^y' autosuggest-accept
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;

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
    enableZshIntegration = true;
    plugins = {
      lazygit = pkgs.yaziPlugins.lazygit;
      full-border = pkgs.yaziPlugins.full-border;
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

    kitty
  ];

}
