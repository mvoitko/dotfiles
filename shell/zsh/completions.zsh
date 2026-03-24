#!/usr/bin/env zsh
# Completion setup

autoload -U compinit; compinit

# uv/uvx completions
eval "$(uv generate-shell-completion zsh)" 2>/dev/null
eval "$(uvx --generate-shell-completion zsh)" 2>/dev/null

# kubectl completions (+ alias)
command -v kubectl &>/dev/null && source <(kubectl completion zsh) && compdef k=kubectl

# AWS CLI completions
[[ -x "$(command -v aws_completer)" ]] && complete -C "$(command -v aws_completer)" aws

# Terraform completions (via tfenv)
command -v terraform &>/dev/null && complete -o nospace -C "$(command -v terraform)" terraform
