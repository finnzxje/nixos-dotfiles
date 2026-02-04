{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
  };
  # home.packages = [
  # pkgs.noctalia-shell
  # pkgs.app2unit # Launch Desktop Entries (or arbitrary commands) as Systemd user units
  # ];

  xdg.configFile =
    let
      mkSymlink = config.lib.file.mkOutOfStoreSymlink;
      confPath = "${config.home.homeDirectory}/nixos-dotfiles/home/programs/noctalia/config";
    in
    {
      # NOTE: use config dir as noctalia config because config is not only settings.json
      # https://github.com/noctalia-dev/noctalia-shell/blob/main/nix/home-module.nix#L211-L220
      "noctalia".source = mkSymlink "${confPath}";
      # "noctalia".source = ./config;
    };

}
