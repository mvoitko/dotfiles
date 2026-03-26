#!/bin/bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

user=$(whoami)
host=$(hostname -s)

# Shorten home directory to ~
dir="${cwd/#$HOME/\~}"

# Git branch (skip optional locks to avoid blocking)
branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)

# ANSI color codes
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RED='\033[0;31m'
RESET='\033[0m'

# Build status line inspired by agnoster theme
printf "${BLUE}%s@%s${RESET}:${YELLOW}%s${RESET}" "$user" "$host" "$dir"
[ -n "$branch" ] && printf " ${CYAN}[%s]${RESET}" "$branch"
[ -n "$AWS_PROFILE" ] && printf " (aws:%s)" "$AWS_PROFILE"

printf " | ${MAGENTA}%s${RESET}" "$model"

# Context percentage: red if > 80%, otherwise normal
if [ -n "$used" ]; then
  if [ "$(echo "$used > 80" | bc 2>/dev/null)" = "1" ]; then
    printf " | ${RED}ctx: %s%%${RESET}" "$used"
  else
    printf " | ctx: %s%%" "$used"
  fi
fi
