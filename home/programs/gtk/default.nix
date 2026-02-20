{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gtk3
    adwaita-icon-theme
    glib # provides gsettings
  ];

  gtk = {
    enable = true;

    # Declarative baseline at login; runtime picker can still override instantly.
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
