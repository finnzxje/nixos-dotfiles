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
  # networking.wireless.enable = true;

  # services.xserver.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.ly.enable = false;
  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    command = "niri";
    user = "${username}";
  };

  system.stateVersion = "25.11";
}
