{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "finnzxje";
        email = "minhthinh0900@gmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";

      alias = {
        # common aliases
        br = "branch";
        co = "checkout";
        st = "status";
        ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
        ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
        cm = "commit -m"; # commit via `git cm <message>`
        ca = "commit -am"; # commit all changes via `git ca <message>`
        dc = "diff --cached";

        unstage = "reset HEAD --"; # unstage file via `git unstage <file>`
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      decorations = {
        commit-decoration-style = "bold yellow box ul";
        file-style = "bold yellow ul";
        file-decoration-style = "none";
      };
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
