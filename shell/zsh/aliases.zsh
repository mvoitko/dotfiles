#!/usr/bin/env zsh
# Aliases

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias projects="cd $HOME/Documents/projects"

# Listing (use bat if available)
command -v bat &>/dev/null && alias cat="bat --paging=never --plain"
alias grep="grep --color=auto"

# Docker
alias dc="docker compose"
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dk="docker kill"

# Kubernetes
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"

# Git shortcuts
alias gs="git status -sb"
alias gd="git diff"
alias gco="git checkout"

# Editor
alias zshconfig="code ~/.zshrc"
alias reload="source ~/.zshrc"

# Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# AWS profile switcher (requires fzf)
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)'

# Python cleanup
alias clean="pip freeze | xargs pip uninstall -y"
