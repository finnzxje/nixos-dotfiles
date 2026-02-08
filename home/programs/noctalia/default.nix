{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  home.packages = with pkgs; [
    app2unit # Launch Desktop Entries (or arbitrary commands) as Systemd user units
    gtk3
    adwaita-icon-theme # for icon theme

  ];
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
  };

  # Start Noctalia as soon as niri starts, instead of waiting for graphical-session.target.
  systemd.user.services.noctalia-shell = lib.mkIf config.programs.noctalia-shell.systemd.enable {
    Unit = {
      After = lib.mkForce [ "niri.service" ];
      PartOf = lib.mkForce [ "niri.service" ];
    };
    Install.WantedBy = lib.mkForce [ "niri.service" ];
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  xdg.configFile =
    let
      mkSymlink = config.lib.file.mkOutOfStoreSymlink;
      confPath = "${config.home.homeDirectory}/nixos-dotfiles/home/programs/noctalia";
    in
    {
      # NOTE: use config dir as noctalia config because config is not only settings.json
      # https://github.com/noctalia-dev/noctalia-shell/blob/main/nix/home-module.nix#L211-L220
      "noctalia".source = mkSymlink "${confPath}/config";
    };

}
