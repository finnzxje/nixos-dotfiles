# Commit Message Specification Reference

Compiled from this repo's recent history plus Conventional Commits.

## Core Rules

| Rule | Description |
| ---- | ----------- |
| Lowercase subjects | Use lowercase after `type:` to match the repo history |
| Short over strict  | Keep subjects concise, but do not force an exact length limit |
| Scope when useful  | Add a scope only when one subsystem clearly owns the change |
| Concrete wording   | Mention the actual module, package, service, or app being changed |
| Optional body      | Add a body only when the reason is not obvious from the subject |

## Format Structure

```text
<type>[(<scope>)]: <subject>

[optional body]

[optional footer(s)]
```

- **subject**: required, concise, typically lowercase
- **body**: optional, used for large or non-obvious changes
- **footer**: optional, rarely needed here

## Type Quick Reference

- **feat**: Add packages, programs, services, modules, or new behavior
- **fix**: Correct broken config, paths, startup, theming, or integration
- **refactor**: Reorganize modules or configuration structure
- **docs**: Notes or setup documentation
- **style**: Formatting-only changes
- **chore**: Lockfile updates, misc maintenance, small tweaks, skill/tooling work
- **test**: Add or update tests
- **revert**: Revert a previous commit

## Common Scopes

Prefer scopes already used in the repo when they fit:

- `flake`
- `home`
- `system`
- `desktop`
- `shell`
- `niri`
- `nvim`
- `yazi`
- `noctalia`
- `lsp`

## Message Patterns Seen In This Repo

```text
feat: add libreoffice
feat(home): add kitty config and update shell/home defaults
fix(session): start noctalia-shell with niri.service for faster post-login startup
refactor(home): split shell config into module
chore(flake): update flake.lock
chore(nvim): add keybinding to turn off nvim-conform
docs: zapret set up
```
