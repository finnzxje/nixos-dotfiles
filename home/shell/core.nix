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
    shellAliases = {
      ls = "eza --icons -l -T -L=1";
      y = "yazi";
      t = "tmux";
      oo = "cd $HOME/documents/obsidian-vault/finn";
      or = "nvim $HOME/documents/obsidian-vault/finn/00-Inbox/*.md";
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
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };
}
