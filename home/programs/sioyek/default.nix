{pkgs, ...}: {
  programs.sioyek = {
    enable = true;
    config = {
      "startup_commands" = "toggle_statusbar";
      "should_launch_new_instance" = "1";
    };
    bindings = {
      "screen_down" = [
        "<C-d>"
        "d"
      ];
      "screen_up" = [
        "<C-u>"
        "u"
      ];
      "prev_state" = ["<C-o>"];
      "next_state" = ["<C-i>"];
    };
  };
  systemd.user.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };
}
