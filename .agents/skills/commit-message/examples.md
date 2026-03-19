# Commit Message Examples

Compiled from recent commits in this NixOS dotfiles repo. Subjects are
usually short and lowercase, with optional scopes for modules or apps.

## feat - New Features

```text
feat: add libreoffice
feat: add vesktop
feat: add spotify
feat: add docker
feat: add tmux
feat(lsp): add harper lsp
feat(shell): add zoxide
feat(system): improve battery life
feat(home): add anki and qbittorrent
feat(home): add xdg program config
```

## fix - Bug Fixes

```text
fix: typos
fix: icontheme
fix(neovim): remove masonlspconfig
fix(home): change config path for symlink
fix(noctalia): gtk theme
fix(session): start noctalia-shell with niri.service for faster post-login startup
```

## refactor - Refactoring/Optimization

```text
refactor: use papirus icon theme
refactor: centralize system config and username
refactor(niri): add windowrules
refactor(home): split shell config into module
refactor(noctalia): manage noctalia with home-manager, add symlink
```

## docs - Documentation

```text
docs: zapret set up
```

## chore - Miscellaneous

```text
chore: niri
chore: yazi keybindings
chore: add some packages
chore: clean up a bit
chore: some trivial stuffs
chore(flake): update flake.lock
chore(niri): update keybindings
chore(noctalia): enable battery shell
chore(nvim): add keybinding to turn off nvim-conform
```

## test - Testing

```text
test: add regression coverage for nix module wiring
```

## style - Code Formatting

```text
style: reformat shell config
```

## revert - Revert

```text
revert: feat: add docker
```
