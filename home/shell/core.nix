{ config, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos, btw";
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh.enable = true;
    dotDir = config.home.homeDirectory;
    history.ignoreSpace = true;
    shellAliases = {
      ls = "eza --icons -l -T -L=1";
      y = "yazi";
      t = "tmux";
      oo = "cd $HOME/documents/obsidian-vault/finn";
      or = "nvim $HOME/documents/obsidian-vault/finn/00-Inbox/*.md";
      lg = "lazygit";
      bc = "bc -l";
      deskapps = "{ find ~/.local/share/applications -maxdepth 1 -name '*.desktop' -printf '%f\\n' 2>/dev/null; \
                  find ~/.nix-profile/share/applications -maxdepth 1 -name '*.desktop' -printf '%f\\n' 2>/dev/null; \
                  find /run/current-system/sw/share/applications -maxdepth 1 -name '*.desktop' -printf '%f\\n' 2>/dev/null; \
                  find /etc/profiles/per-user/$USER/share/applications -maxdepth 1 -name '*.desktop' -printf '%f\\n' 2>/dev/null; \
                } | fzf";
    };

    initContent = ''
      bindkey '^y' autosuggest-accept
      export PATH="$HOME/bin:$PATH"
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      typst.disabled = true;
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
}
