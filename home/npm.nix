{ config, ... }:
{
  # make user-installed CLI tools available in PATH
  #
  # mainly used for tools installed outside nixpkgs that update frequently,
  # such as npm global packages or Go-installed CLIs.
  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm
  '';
  home.sessionPath = [
    "${config.home.homeDirectory}/.npm/bin"
    "${config.home.homeDirectory}/go/bin"
  ];
}
