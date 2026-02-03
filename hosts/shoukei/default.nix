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
  networking.wireless.enable = true;

  # services.xserver.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  # environment.systemPackages = with pkgs; [
  #   inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  #   # ... maybe other stuff
  # ];

  services.displayManager.ly.enable = false;
  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    # command = "niri-session";
    command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${pkgs.niri}/share/wayland-sessions --cmd niri-session";
    # user = "${username}";
    user = "greeter";
  };

  # mount window partition
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/E640A27040A246E1";
    fsType = "ntfs3";
    options = [
      "rw"
      "nofail"
    ];
  };

  system.stateVersion = "25.11";
}
