---
name: commit-message
description: Generates commit messages for this NixOS dotfiles repo based on git changes. Follows the repo's conventional-commit-like style with short, lowercase subjects and optional scopes such as flake, home, niri, nvim, shell, or system. Use when the user asks for a commit message, commit description, or commit title based on current changes.
---

# Generate Commit Message

Generates a commit message matching this NixOS dotfiles repo based on
current git changes (staged or unstaged).

## When to Use

- The user requests generating a commit message.
- The user requests writing a commit description based on changes.
- The user says "help me write a commit", "generate commit info", etc.

## Workflow

### Step 1: Obtain Change Content

```bash
git status
git diff --staged
git diff
```

What to inspect:

- Staged changes from `git diff --staged`
- Unstaged changes from `git diff` when nothing is staged
- Untracked files shown by `git status`

If the working tree mixes unrelated edits, say so and either:

- generate a message for the staged set only, or
- provide 1 to 2 plausible messages for the dominant change groups

### Step 2: Analyze Change Type

Select the type prefix based on the change content:

| type     | Applicable Scenarios |
| -------- | -------------------- |
| feat     | New packages, services, modules, keybindings, or user-facing config |
| fix      | Broken config, wrong paths, startup issues, regressions |
| refactor | Restructuring modules, moving files, cleanup that changes organization more than behavior |
| docs     | Notes, setup docs, README-like content |
| style    | Formatting-only edits |
| chore    | Lockfile updates, trivial config tweaks, maintenance work, skills/tooling updates |
| test     | Tests |
| revert   | Reverting a specific commit |

Default to `chore` for small maintenance changes and repository tooling.

### Step 3: Write the Description

**Basic Format**: `type: brief description` or `type(scope): brief description`

**Optional scope**: Use a scope when one subsystem clearly owns the change.
Prefer repo-native scopes such as `flake`, `home`, `system`, `desktop`,
`shell`, `niri`, `nvim`, `yazi`, `noctalia`, or `lsp`.

Style rules for this repo:

- Keep the subject short, but do not force a strict 50-character limit.
- Use lowercase subjects to match the existing history.
- Prefer concise verb phrases such as `add`, `fix`, `update`, `use`,
  `remove`, `split`, `rename`, `configure`, `clean up`.
- When the repo history is terse, terse is acceptable:
  `fix(noctalia): gtk theme` is valid.
- Mention concrete components, packages, or modules instead of abstract phrasing.

**Optional Body/Footer** (for significant changes):

- Body: Add only when the diff is large or the reason is not obvious.
- Footer: Rarely needed in this repo.

### Step 4: Output

Directly output a copyable commit message. If there are multiple reasonable options, provide 1 to 2 alternatives.

## Format Examples

**Simple Commit** (Common):

```text
feat: add libreoffice
chore(flake): update flake.lock
```

**With scope**:

```text
feat(home): add kitty config and update shell/home defaults
fix(session): start noctalia-shell with niri.service for faster post-login startup
```

**With body** (Complex changes):

```text
feat(system): improve battery life

Adjust system power settings and related defaults to reduce drain
on laptop usage without changing the main desktop workflow.
```

## Reference Resources

- Examples: See [examples.md](examples.md)
- Specification details: See [references.md](references.md)

## Quick Reference

| Change Content           | Example Output |
| ------------------------ | -------------- |
| Add package or app       | `feat: add spotify` |
| Update lockfile          | `chore(flake): update flake.lock` |
| Fix config bug           | `fix(home): change config path for symlink` |
| Reorganize module layout | `refactor(home): split shell config into module` |
| Update docs              | `docs: zapret set up` |
| Tweak editor config      | `chore(nvim): add keybinding to turn off nvim-conform` |
| Update skill/tooling     | `chore(skills): align commit-message skill with nixos-dotfiles style` |
