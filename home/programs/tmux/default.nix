{
  config,
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    prefix = "C-a";
    escapeTime = 0;
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.dracula
    ];

    extraConfig = ''
      set -g mouse on
      set -g status-right '#{?client_prefix, _ ,}#(timew | awk "/^ *Total/ {print \$NF}") #[bg=green,fg=black,bold]#(timew | awk "/^ *Tracking/ {print \" \" \$NF \" \"}")#[bg=default]'
      set -g status-interval 5

      setw -g mode-keys vi
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Options: start indexes from 1
      set -g base-index 1
      set -g pane-base-index 1

      # List of plugins
      set -g @plugin 'dracula/tmux'

      bind -r K resize-pane -U 2
      bind -r H resize-pane -L 2
      bind -r J resize-pane -D 2
      bind -r L resize-pane -R 2

      bind Up select-pane -U
      bind Left select-pane -L
      bind Down select-pane -D
      bind Right select-pane -R

      bind v split-window -h
      bind - split-window -v
      bind | split-window -h
      bind f resize-pane -Z
      bind e choose-window -Z

      bind -n M-1 select-window -t :1
      bind -n M-2 select-window -t :2
      bind -n M-3 select-window -t :3
      bind -n M-4 select-window -t :4
      bind -n M-5 select-window -t :5
      bind -n M-6 select-window -t :6
      bind -n M-7 select-window -t :7
      bind -n M-8 select-window -t :8
      bind -n M-9 select-window -t :9

      bind t run "tmux neww ~/bin/time.sh"

      set -g @dracula-show-left-icon session 
      set -g @dracula-plugins "cpu-usage ram-usage"
      set -g status-position bottom
      set -g @dracula-show-empty-plugins false
    '';
  };

}
