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

    # zathura
    calibre
    foliate
    obsidian
    zotero
    sigil

    obs-studio
    fuzzel
    telegram-desktop
    typst
    pandoc
    pdfannots2json
    opencode

    localsend

  ];

  # imv keybindings have some problems with urob's HRMs so I use feh
  programs.feh = {
    enable = true;
    keybindings = {
      scroll_left = "h";
      scroll_right = "l";
      scroll_down = "j";
      scroll_up = "k";
      zoom_in = "plus";
      zoom_out = "minus";
    };
  };
}
