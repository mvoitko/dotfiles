---
name: add-brew-package
description: Add a Homebrew formula or cask to the correct tiered Brewfile. Use when the user asks to add, install, or include a new brew package.
---

# Add Brew Package

Add a Homebrew formula or cask to the appropriate tiered Brewfile in `brew/`.

**Invocation:** `/add-brew-package <package-name>`

## Brewfile Tiers

| Brewfile | Category | Examples |
|----------|----------|---------|
| `Brewfile.taps` | Third-party taps | `tap "hashicorp/tap"` |
| `Brewfile.core-cli` | Essential CLI tools | zsh, bat, fzf, jq, git |
| `Brewfile.devops-cli` | DevOps/infra CLI | awscli, kubectl, helm, terraform |
| `Brewfile.languages` | Language runtimes & managers | pyenv, nvm, go, uv |
| `Brewfile.core-apps` | Essential GUI apps | 1password, aerospace, karabiner |
| `Brewfile.dev-apps` | Developer GUI apps | ghostty, vscode, orbstack |
| `Brewfile.productivity-apps` | Productivity apps | obsidian, spotify, chrome |
| `Brewfile.communication-apps` | Messaging apps | slack, signal, telegram, discord |
| `Brewfile.security-apps` | Security & VPN | tailscale, nextdns |
| `Brewfile.qol-apps` | Quality-of-life utilities | keka, betterdisplay, maccy |
| `Brewfile.ai-apps` | AI tools | claude, chatgpt, ollama |
| `Brewfile.quicklook` | QuickLook plugins | qlstephen, qlmarkdown |
| `Brewfile.fonts` | Nerd Fonts | font-jetbrains-mono-nerd-font |
| `Brewfile.mas` | Mac App Store apps | `mas "App", id: 12345` |

## Steps

1. **Identify the package type**: Check if it's a `brew` formula, `cask`, `tap`, or `mas` app
   - If the user says "cask" or the package is a GUI app → cask
   - If the user provides a tap (e.g., `hashicorp/tap`) → tap
   - If the user provides a MAS ID → mas
   - Otherwise → brew formula

2. **Select the correct Brewfile**: Based on the category table above. If unclear, ask the user which tier fits best.

3. **Check for duplicates**: Read the target Brewfile and verify the package isn't already listed.

4. **Add the entry in alphabetical order** within the file, using the correct format:
   - Formula: `brew "package-name"`
   - Cask: `cask "package-name"`
   - Tap: `tap "org/repo"`
   - MAS: `mas "App Name", id: 12345`

5. **Confirm**: Tell the user what was added and to which Brewfile.
