{ ... }:
{
  imports = [
    ./core.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    VISUAL = "nvim";
    BROWSER = "firefox"; # "zen"
  };

}
