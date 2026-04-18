# Agent Skills

This directory contains Agent Skills used to assist in the development of the NixOS dotfiles repo. These skills encapsulate project-specific knowledge and operational specifications, and can be invoked directly in conversations.

## Skill List

| Skill Name       | Functional Description                                                                    | Usage Scenarios                                     | Entry File                          |
| ---------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------- | ----------------------------------- |
| `commit-message` | Generates a commit message conforming to the NixOS dotfiles repo style based on git changes | Generating commit messages, writing commit messages | [SKILL.md](commit-message/SKILL.md) |

### Detailed Description

#### commit-message

Based on current git changes (staged or unstaged), generates a commit message primarily in English that conforms to the [Conventional Commits](https://www.conventionalcommits.org/) format. Supports identifying various change types such as newly added files, bug fixes, refactoring, etc.

## Quick Start

In an AI conversation, simply describe your needs to automatically trigger the corresponding skill:

```text
User: Help me generate a commit message
→ Automatically uses the commit-message skill to analyze git changes and generate commit information
```
