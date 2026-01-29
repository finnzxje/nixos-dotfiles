{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";

  # services.xserver.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.ly.enable = false;
  services.greetd.enable = true;
  services.greetd.settings.default_session = {
    command = "niri";
    user = "finnzxje";
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true; # change this on real machine
      PermitRootLogin = "no";
    };
  };

  # zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  };

  users.users.finnzxje = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    kitty

    go
    nixd
  ];

  # nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}
