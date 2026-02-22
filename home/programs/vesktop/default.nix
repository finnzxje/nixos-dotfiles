{ pkgs, config, ... }:
{
  xdg.configFile."vesktop/themes/midnight-catppuccin.css".source = ./midnight-catppuccin.theme.css;
}
