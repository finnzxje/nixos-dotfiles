{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gtk3
    adw-gtk3
    adwaita-icon-theme
    papirus-icon-theme
    glib # provides gsettings
    nwg-look
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}
