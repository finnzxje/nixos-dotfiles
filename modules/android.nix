{
  lib,
  pkgs,
  username,
  ...
}:

with lib;
{
  environment.systemPackages = with pkgs; [
    android-tools
    jdk21
    qemu_kvm
    android-studio
  ];

  environment.variables = {
    JAVA_HOME = pkgs.jdk21.home;
    # Keep one SDK source to avoid mixed adb/emulator behavior.
    ANDROID_HOME = "/home/${username}/Android/Sdk";
    ANDROID_SDK_ROOT = "/home/${username}/Android/Sdk";
    # Emulator logs show missing Qt wayland plugin; force stable X11 backend.
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  nixpkgs.config = {
    android_sdk.accept_license = true;
    allowUnfree = true;
  };

  environment.shellInit = ''
    export PATH="$PATH":"$HOME/.pub-cache/bin"
  '';
  # services.udev.packages = [ pkgs.android-udev-rules ];

  users.groups.adbusers = { };

  users.users.${username}.extraGroups = [
    "kvm"
    "adbusers"
  ];
}
