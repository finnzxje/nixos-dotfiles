{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser.enable = true;
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

    zathura
    obs-studio
    fuzzel
    telegram-desktop
    obsidian
    zotero
    typst
    pandoc
    pdfannots2json
    opencode
  ];
}
