# Post-Install Manual Steps

These steps require manual interaction and cannot be fully automated.

## 1. 1Password

- Sign in to 1Password
- Enable SSH Agent: 1Password > Settings > Developer > SSH Agent
- Enable CLI integration: 1Password > Settings > Developer > CLI

## 2. iCloud

- Sign in to iCloud in System Settings
- Enable the services you need (Drive, Photos, Keychain, etc.)

## 3. Accessibility Permissions

Grant accessibility access in System Settings > Privacy & Security > Accessibility:
- **AeroSpace** — required for window tiling
- **Karabiner-Elements** — required for keyboard remapping
- **Raycast** — required for some extensions

## 4. Raycast Setup

- Open Raycast and follow the onboarding
- Set as default launcher: Raycast Settings > General > Raycast Hotkey → Cmd+Space
- Disable Spotlight: System Settings > Keyboard > Shortcuts > Spotlight → uncheck
- Enable clipboard history: Raycast Settings > Extensions > Clipboard History
- Install recommended extensions (see docs/RAYCAST.md)

## 5. NextDNS

- Create a free account at https://nextdns.io
- Get your configuration ID
- Run: `sudo nextdns install -config YOUR_CONFIG_ID`
- Verify: `nextdns status`

## 6. Default Browser

- Set your preferred default browser in System Settings > Desktop & Dock > Default web browser

## 7. tmux Plugins

- Open a terminal and run `tmux`
- Press `prefix + I` (Ctrl-b then Shift-I) to install TPM plugins
- Restart tmux

## 8. Maccy Removal

After confirming Raycast clipboard history works:
- Quit Maccy
- Run: `brew uninstall maccy`

## 9. Git Email

Copy the template and set your email:
```bash
cp ~/Documents/projects/dotfiles/git/gitconfig.local.example ~/.gitconfig.local
# Edit ~/.gitconfig.local with your email
```

## 10. SSH Keys

Your SSH keys are managed by 1Password. Ensure the following public keys exist in `~/.ssh/`:
- `gh-personal.pub` — GitHub
- `bb-cc.pub` — Bitbucket personal

These should be exported from 1Password.
