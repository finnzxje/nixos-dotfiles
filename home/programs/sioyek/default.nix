{ pkgs, ... }:
{
  programs.dconf.enable = true;
  programs.sioyek = {
    enable = true;
    config = {
      "startup_commands" = "toggle_statusbar";
      "should_launch_new_instance" = "1";
    };
    bindings = {
      "screen_down" = [
        "<C-d>"
        ""
      ];
      "screen_up" = [
        "<C-u>"
        ""
      ];
    };
  };
  systemd.user.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };

}
