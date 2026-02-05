{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    anki
    qbittorrent
    google-chrome
    mpv
    jetbrains.idea
  ];

}
