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
    anki
    qbittorrent
    google-chrome
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

    arduino-ide
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
