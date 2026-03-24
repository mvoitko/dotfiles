#!/usr/bin/env bash
# Dotfiles utility library

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

# Logging functions
log_info()    { echo -e "${BLUE}[INFO]${RESET} $*"; }
log_warn()    { echo -e "${YELLOW}[WARN]${RESET} $*"; }
log_error()   { echo -e "${RED}[ERROR]${RESET} $*"; }
log_success() { echo -e "${GREEN}[OK]${RESET} $*"; }
log_header()  { echo -e "\n${BOLD}${BLUE}==>${RESET} ${BOLD}$*${RESET}"; }
log_dryrun()  { echo -e "${YELLOW}[DRY RUN]${RESET} $*"; }
log_skip()    { echo -e "${YELLOW}[SKIP]${RESET} $*"; }

# Check if command exists
command_exists() {
  command -v "$1" &>/dev/null
}

# Check if module should be skipped based on MODULES and SKIP_MODULES arrays
# Returns 0 (true) if the module SHOULD be skipped.
# Called inside `if` in run_module, so the return 1 is safe from set -e.
should_skip() {
  local name="$1"
  # If MODULES is non-empty, only run listed modules
  if [[ ${#MODULES[@]} -gt 0 ]]; then
    local found=false
    for m in "${MODULES[@]}"; do
      [[ "$m" == "$name" ]] && found=true
    done
    [[ "$found" == false ]] && return 0
  fi
  # Check skip list
  for s in "${SKIP_MODULES[@]}"; do
    [[ "$s" == "$name" ]] && return 0
  done
  return 1
}
