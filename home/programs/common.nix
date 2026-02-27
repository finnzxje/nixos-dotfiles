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
  programs.zen-browser.suppressXdgMigrationWarning = true;
  home.packages = with pkgs; [
    # nixpkgs regression on unstable: anki test imports fail due missing QtWebChannel.
    # Keep runtime package, skip broken upstream checks until fixed.
    (anki.overrideAttrs (_: {
      doCheck = false;
    }))
    qbittorrent
    google-chrome
    mpv
    jetbrains.idea
    vesktop
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
    yt-dlp
    lazydocker

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
