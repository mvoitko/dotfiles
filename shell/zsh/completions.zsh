#!/usr/bin/env zsh
# Completion setup

autoload -U compinit; compinit

# uv/uvx completions
eval "$(uv generate-shell-completion zsh)" 2>/dev/null
eval "$(uvx --generate-shell-completion zsh)" 2>/dev/null
