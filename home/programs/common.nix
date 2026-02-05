{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    anki
    qbittorrent
    google-chrome
    mpv
    jetbrains.idea
    (pkgs.discord.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        wrapProgram $out/bin/discord \
          --set SKIP_HOST_UPDATE true
      '';
    }))
    imv
  ];

}
