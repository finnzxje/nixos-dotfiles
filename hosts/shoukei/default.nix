{
  config,
  lib,
  pkgs,
  inputs,
  username,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ./nvidia.nix
    ./postgres.nix
  ];

  boot.loader = {
    # systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "shoukei";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.wireless.enable = true;
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "8.8.8.8"
  ];

  services.cloudflare-warp = {
    enable = true;
    openFirewall = true;
  };
  zapret.enable = true;
  # services.resolved.enable = true;

  # services.resolved.settings.Resolve.DNS = [
  #   "1.1.1.1"
  #   "1.0.0.1"
  #   "8.8.8.8"
  #   "8.8.4.4"
  #
  # ];
  # services.resolved.settings.Resolve.DNSOverTLS = true;

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  # services.greetd.settings.default_session = {
  # command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${pkgs.niri}/share/wayland-sessions --cmd niri-session";
  #   user = "${username}";
  # };
  services = {
    displayManager.autoLogin.enable = false;

    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/${username}";
      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };
    };

    greetd.enable = true;
  };

  # mount window partition
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/E640A27040A246E1";
    fsType = "ntfs3";
    options = [
      "rw"
      "nofail"
      "uid=1000"
      "gid=100"
      "umask=022"
    ];
  };

  system.stateVersion = "25.11";
}
