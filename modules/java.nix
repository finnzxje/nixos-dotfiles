{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    jdk21
    maven
    gradle
    spring-boot-cli
  ];
}
