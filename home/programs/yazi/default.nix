{ pkgs, config, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      mgr = {
        linemode = "size_and_mtime";
        sort_by = "mtime";
      };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            url = "*";
            run = "git";
          }
          {
            id = "git";
            url = "*/";
            run = "git";
          }
        ];
      };
    };
    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on = "T";
            run = "shell --orphan --confirm kitty";
            desc = "Open terminal at current dir";
          }
          {
            on = [
              "g"
              "b"
            ];
            run = "cd ~/Downloads/books";
            desc = "Go ~/Downloads/books";
          }
          {
            on = [
              "g"
              "o"
            ];
            run = "cd ~/documents/obsidian-vault/finn/";
            desc = "Go to Obsidian Vault";
          }
          {
            on = [
              "g"
              "/"
            ];
            run = "cd /";
            desc = "Go to root directory";
          }
          {
            on = [
              "g"
              "t"
            ];
            run = "cd ~/.local/share/Trash/files";
            desc = "Go to trash";
          }
          {
            on = [
              "g"
              "w"
            ];
            run = "cd /mnt/windows";
            desc = "Go to windows";
          }
          {
            on = "t";
            run = "tab_create --current";
            desc = "Create a new tab with CWD";
          }
          {
            on = "e";
            run = "shell --orphan --confirm 'thunar \"$PWD\"'";
            desc = "Open Thunar at current dir";
          }
        ];
      };

    };

    plugins = {
      lazygit = pkgs.yaziPlugins.lazygit;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      starship = pkgs.yaziPlugins.starship;
    };

    initLua = ''
      function Linemode:size_and_mtime()
      	local time = math.floor(self._file.cha.mtime or 0)
      	if time == 0 then
      		time = ""
      	elseif os.date("%Y", time) == os.date("%Y") then
      		time = os.date("%b %d %H:%M", time)
      	else
      		time = os.date("%b %d  %Y", time)
      	end

      	local size = self._file:size()
      	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
      end

      require("full-border"):setup()
      require("git"):setup { order = 1500, }
      require("starship"):setup()
    '';
  };

}
