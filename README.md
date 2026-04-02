# dotfiles

Personal macOS dotfiles for a DevOps/platform engineering workflow.
Keyboard-first. Homebrew-only installs. Everything version-controlled.

## Philosophy

- One tool per task, no redundancy
- Keyboard-driven workflow (AeroSpace + Karabiner Hyper key + tmux)
- Local-first (1Password SSH agent, local LLMs, Obsidian vault)
- Modular bootstrap: each piece works standalone

## What's Included

| Layer | Tools |
|-------|-------|
| Shell | Zsh + Oh-My-Zsh + Starship prompt |
| Terminal | Ghostty + tmux (oh-my-tmux) |
| Window Management | AeroSpace (tiling) + Karabiner (Hyper key) |
| Editor | VS Code (primary), Vim (SSH) |
| Git | 1Password SSH signing, global gitignore |
| DevOps | AWS CLI, kubectl, kOps, Helm, Terraform, Docker |
| CLI | eza (ls), fd (find), zoxide (cd), bat (cat), fzf |
| Launcher | Raycast |
| Security | Tailscale, NextDNS, OverSight |
| AI | Claude Code (plugins, hooks, skills), ChatGPT, Ollama |

## Quick Start

```bash
git clone --recursive git@github.com:mvoitko/dotfiles.git ~/Documents/projects/dotfiles
cd ~/Documents/projects/dotfiles
./bootstrap.sh
```

### Selective Install

```bash
./bootstrap.sh --module dotbot          # Symlinks only
./bootstrap.sh --module brew-cli        # CLI tools only
./bootstrap.sh --minimal                # Xcode + Homebrew + CLI + symlinks
./bootstrap.sh --no-apps                # Everything except GUI apps
./bootstrap.sh --dry-run                # Preview without changes
./bootstrap.sh --list                   # Show all modules
```

## Repository Structure

```
dotfiles/
├── bootstrap.sh                    # Master orchestrator
├── install                         # Dotbot symlink runner
├── install.conf.yaml               # Dotbot manifest
├── brew/                           # Tiered Brewfiles
│   ├── Brewfile.core-cli           # bat, eza, fd, fzf, jq, zoxide, tmux, git, gh...
│   ├── Brewfile.devops-cli         # awscli, kubectl, helm, terraform...
│   ├── Brewfile.languages          # pyenv, nvm, go, uv...
│   ├── Brewfile.core-apps          # AeroSpace, Raycast, Ice, Karabiner, 1Password
│   ├── Brewfile.dev-apps           # Ghostty, VS Code, OrbStack, Bruno, TablePlus
│   ├── Brewfile.productivity-apps  # Obsidian, IINA, Spotify, Chrome
│   ├── Brewfile.communication-apps # Signal, Telegram, Slack, Zoom
│   ├── Brewfile.security-apps      # Tailscale, OverSight, NextDNS
│   ├── Brewfile.qol-apps           # Keka, BetterDisplay, Maccy
│   ├── Brewfile.ai-apps            # Claude, ChatGPT, LM Studio, Ollama, Cursor
│   ├── Brewfile.quicklook          # Quick Look plugins
│   ├── Brewfile.fonts              # Nerd Fonts
│   └── Brewfile.mas                # Mac App Store apps
├── shell/                          # Zsh configuration (modular)
├── git/                            # Git config + global gitignore
├── ssh/                            # SSH config (1Password agent)
├── terminal/                       # Ghostty + tmux configs
├── editor/                         # VS Code, Sublime, editorconfig
├── wm/                             # AeroSpace tiling config
├── keyboard/                       # Karabiner Hyper key config
├── macos/                          # macOS system defaults
├── claude/                         # Claude Code config (symlinked to ~/.claude/)
│   ├── settings.json               # Global settings, plugins, hooks
│   ├── statusline-command.sh       # Custom statusline (git, AWS, context %)
│   ├── hooks/                      # Global hooks (notification sound)
│   ├── sounds/                     # Notification sounds (ICQ uh-oh)
│   └── plugins/                    # Custom plugins (writing-council)
├── scripts/                        # Bootstrap modules + shared lib
└── docs/                           # Raycast guide, post-install steps
```

## App Tiers

| Tier | Category | Key Apps |
|------|----------|----------|
| Core System | Foundation | Raycast, AeroSpace, Ice, Karabiner, 1Password |
| Development | Coding | Ghostty, VS Code, OrbStack, Bruno, TablePlus |
| Productivity | Daily | Obsidian, IINA, Spotify, Chrome, Google Drive |
| Communication | Messaging | Signal, Telegram, Slack, WhatsApp, Zoom, Discord |
| Security | Network | Tailscale, OverSight, NextDNS |
| QoL | Utilities | Keka, BetterDisplay, Maccy, Command X |
| AI | Intelligence | Claude, ChatGPT, LM Studio, Ollama, Cursor |

## Keyboard-First Workflow

### Hyper Key (Caps Lock held)

| Combo | Action |
|-------|--------|
| Hyper+T | Ghostty |
| Hyper+B | Safari |
| Hyper+E | VS Code |
| Hyper+S | Slack |
| Hyper+N | Obsidian |
| Hyper+C | Claude |
| Hyper+R | Raycast |

Caps Lock tapped alone sends Escape.

### AeroSpace (Alt + ...)

| Combo | Action |
|-------|--------|
| Alt+hjkl | Focus direction |
| Alt+Shift+hjkl | Move window |
| Alt+1-9 | Switch workspace |
| Alt+Enter | Open Ghostty |
| Alt+Shift+F | Fullscreen |
| Alt+Tab | Previous workspace |

### Workspace Assignments

| WS | Apps |
|----|------|
| 1 | Ghostty |
| 2 | Safari, Chrome |
| 3 | VS Code, Cursor |
| 4 | Obsidian |
| 5 | Slack, Signal, Telegram, WhatsApp, Discord |

## Claude Code

The bootstrap includes a `claude-code` module that sets up the full Claude Code environment:

- **Global settings** — permissions, model preferences, plugins, statusline
- **11 marketplace plugins** — superpowers, pr-review-toolkit, context7, LSPs, and more
- **Custom plugins** — writing-council (symlinked from dotfiles)
- **Stop hook** — plays the classic ICQ "uh oh" sound when Claude finishes a response
- **ShellCheck hook** — lints `.sh` files on edit (project-level)

Settings and custom plugins are managed via dotbot symlinks — edits in the repo are reflected immediately.

```bash
./bootstrap.sh --module claude-code  # Install marketplace plugins only
./install                            # Apply symlinks only
```

## Post-Install

See [docs/POST-INSTALL.md](docs/POST-INSTALL.md) for manual steps after bootstrap.

## Inspiration

- [macOS-nirvana](https://github.com/pleasedodisturb/macOS-nirvana/) — 8-tier stack philosophy
- [Dotbot](https://github.com/anishathalye/dotbot) — symlink management
