# CLAUDE.md

## Project Overview

Personal macOS dotfiles repository. Bootstraps a full Mac setup from scratch using Dotbot (symlinks) + tiered Brewfiles + modular bootstrap script.

## Architecture

- `bootstrap.sh` — master orchestrator, supports `--dry-run`, `--module <name>`, `--skip <name>`, `--minimal`, `--no-apps`
- `scripts/modules/*.sh` — individual setup modules, **sourced** (not executed) by bootstrap.sh
- `scripts/lib/utils.sh` — shared logging and helper functions
- `install.conf.yaml` — Dotbot symlink manifest
- `brew/Brewfile.*` — tiered Homebrew packages (14 files by category)

## Critical Constraints

**Module scripts are sourced, not subprocessed.** This means:
- Use `return`, never `exit` (exit kills the parent shell)
- `local` only works inside functions — modules run at top level, use plain variables
- `set -euo pipefail` from bootstrap.sh applies — unhandled failures abort everything
- Always use `|| log_warn "..."` after `brew bundle` and `git clone` commands

**Zsh config is modular.** `shell/zshrc` sources files from `~/.config/zsh/`. When adding tool initializations:
- Guard evals with `command -v <tool> &>/dev/null &&` to handle tools not yet installed
- Check if an OMZ plugin already handles the init (direnv, pyenv, etc.) to avoid double-init

**TOML duplicate sections are silent.** Starship uses last-wins for duplicate `[section]` headers. Always merge into existing sections.

## Common Commands

```bash
./bootstrap.sh --dry-run          # Preview all modules
./bootstrap.sh --list             # List module names
./bootstrap.sh --module dotbot    # Run single module
./install                         # Dotbot symlinks only
```

## Verification

No test suite. Verify via:
- `./bootstrap.sh --dry-run` — should complete with no errors
- `./bootstrap.sh --list` — should print 13 module names
- `./bootstrap.sh --minimal --dry-run` — should run only 5 modules
- Shellcheck on `.sh` files: `shellcheck scripts/**/*.sh bootstrap.sh`

## Gotchas

- `macos/defaults.sh` runs as a subprocess (`bash`, not `source`) to isolate failures from bootstrap
- `~/.config/tmux/tmux.conf` → oh-my-tmux is created by `scripts/modules/tmux.sh`, NOT by Dotbot (target is cloned at runtime)
- Ghostty requires `macos-option-as-alt = true` for AeroSpace Alt keybindings to work inside the terminal
- Karabiner rewrites its own JSON on GUI changes — the symlinked repo file gets modified (this is intentional)
