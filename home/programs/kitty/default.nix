{ pkgs, config, ... }:
let
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;
  confPath = "${config.home.homeDirectory}/nixos-dotfiles/home/programs/kitty/conf";
in

{
  home.packages = [ pkgs.kitty ];

  xdg.configFile."kitty" = {
    source = mkSymlink "${confPath}";
  };
}
