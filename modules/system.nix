{
  pkgs,
  lib,
  username,
  inputs,
  ...
}:
{
  imports = [
    ./android.nix
    ./tlp.nix
    ./keyboard.nix
    ./misc.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    # shell = pkgs.zsh;
  };
  programs.zsh = {
    enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  nix.settings.trusted-users = [
    "root"
    "${username}"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # do garbage collection weekly to keep disk low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "en_US.UTF-8";
  };
  # Type vietnamese
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [ fcitx5-bamboo ];
      waylandFrontend = true;
    };

  };

  environment.sessionVariables = {
    # GTK_IM_MODULE = "fcitx";
    # QT_IM_MODULE = "fcitx";
    # QT4_IM_MODULE = "fcitx";
    CLUTTER_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      newcomputermodern

      nerd-fonts.jetbrains-mono
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Color Emoji"
      ];

      sansSerif = [
        "Noto Sans"
        "Noto Color Emoji"
      ];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Noto Color Emoji"
      ];

      emoji = [ "Noto Color Emoji" ];
    };
  };

  programs.dconf.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true; # change this on real machine
      PermitRootLogin = "no";
    };
    openFirewall = true;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [

    xwayland-satellite
    vim
    wget
    curl
    git
    lm_sensors

    libgcc

    # system monitoring
    procs # a modern ps
    btop

    # archives
    zip
    xz
    unzip
    p7zip

    # Text processing
    gnugrep
    fzf
    fd

    ncdu # analyzer your disk uage Interactively

    # misc
    file
    which
    tree

    # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    tuigreet

  ];

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  programs.noisetorch.enable = true;

  hardware.bluetooth = {
    enable = true;
  };
  services.blueman.enable = true;

  services.printing.enable = true;
  # services.power-profiles-daemon = {
  #   enable = true;
  # };
  services.upower.enable = true;

}
