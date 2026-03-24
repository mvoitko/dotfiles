# Raycast Engineering Use Cases

Raycast replaces Spotlight and several standalone utilities. Here's how to use it for DevOps/platform engineering workflows.

## Replaces

- **Spotlight** — fully replaced by Raycast search
- **Maccy** — Raycast includes clipboard history (confirm it works, then uninstall Maccy)

## Core Features

### Clipboard History
Access via Raycast or assign a hotkey. Keeps text, images, and links. Searchable.

### Snippet Expansion
Create text snippets with keyword triggers:
- `!kctx` → `kubectl config use-context {cursor}`
- `!kns` → `kubectl get pods -n {cursor}`
- `!tfplan` → `terraform plan -var-file=environments/{cursor}/terraform.tfvars`
- `!jira` → `https://datajoint.atlassian.net/browse/{cursor}`
- `!pr` → `gh pr create --title "{cursor}" --body ""`

### Script Commands
Custom scripts that run from Raycast:
- **AWS Profile Switcher** — list AWS profiles, select one, export it
- **K8s Pod Status** — quick check of pod status in a namespace
- **Kubeconfig Switcher** — switch between QA/prod clusters
- **Docker Cleanup** — prune containers, images, volumes

### Calculator & Conversions
- Quick math directly in the search bar
- Unit conversions
- Timezone conversions (useful for coordinating with team across timezones)

## Recommended Extensions

Install from Raycast Store (free):

| Extension | Use Case |
|-----------|----------|
| GitHub | Search PRs, issues, repos, notifications |
| Jira | Search tickets, create issues |
| Docker | Manage containers, images |
| AWS | Quick links to AWS console services |
| Terraform Docs | Search provider/resource documentation |
| Homebrew | Search and install packages |
| Kill Process | Find and kill processes by name |
| System Monitor | CPU/memory/disk at a glance |
| Color Picker | Pick colors from screen |
| Emoji Search | Quick emoji insertion |

## System Commands

Available out of the box:
- Lock Screen
- Sleep
- Empty Trash
- Eject All Disks
- Toggle Do Not Disturb
- Restart/Shutdown

## Window Management

Raycast includes basic window management (half-screen, thirds, etc.) but since you're using AeroSpace for tiling, you likely won't need this. AeroSpace handles the tiling; Raycast handles everything else.

## Tips

1. Set Raycast as your default hotkey (Cmd+Space replacing Spotlight)
2. Disable Spotlight keyboard shortcut in System Settings > Keyboard > Shortcuts
3. Enable clipboard history in Raycast Settings > Extensions > Clipboard History
4. Browse the Extension Store for your specific tools
