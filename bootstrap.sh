#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${DOTFILES_DIR}/scripts/lib/utils.sh"
source "${DOTFILES_DIR}/scripts/lib/platform.sh"

# Global state
DRY_RUN=false
VERBOSE=false
NO_APPS=false
MINIMAL=false
MODULES=()
SKIP_MODULES=()

ALL_MODULES=(
  xcode
  homebrew
  brew-taps
  brew-cli
  fonts
  omz
  dotbot
  brew-apps
  macos
  aerospace
  vscode
  tmux
  python
)

MINIMAL_MODULES=(
  xcode
  homebrew
  brew-taps
  brew-cli
  dotbot
)

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Bootstrap a macOS dotfiles environment.

Options:
  --dry-run           Show what would happen without executing
  --module <name>     Run only the specified module (repeatable)
  --skip <name>       Skip the specified module (repeatable)
  --list              List all available modules and exit
  --minimal           Only run: xcode, homebrew, brew-taps, brew-cli, dotbot
  --no-apps           Skip the brew-apps module
  --verbose           Enable verbose output (set -x)
  --help              Show this help message and exit

Available modules (in order):
$(printf '  %s\n' "${ALL_MODULES[@]}")
EOF
}

list_modules() {
  printf '%s\n' "${ALL_MODULES[@]}"
}

run_module() {
  local name="$1"
  local script="${DOTFILES_DIR}/scripts/modules/${name}.sh"

  if should_skip "$name"; then
    log_skip "Skipping module: ${name}"
    return 0
  fi

  log_header "Module: ${name}"

  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would source: ${script}"
    return 0
  fi

  if [[ ! -f "$script" ]]; then
    log_warn "Module script not found: ${script}"
    return 0
  fi

  source "$script"
}

main() {
  check_macos

  log_header "Dotfiles Bootstrap"
  log_info "Dotfiles directory: ${DOTFILES_DIR}"

  if [[ "$MINIMAL" == true && ${#MODULES[@]} -gt 0 ]]; then
    log_error "Cannot use --minimal and --module together"
    exit 1
  fi

  if [[ "$MINIMAL" == true ]]; then
    MODULES=("${MINIMAL_MODULES[@]}")
  fi

  if [[ "$NO_APPS" == true ]]; then
    SKIP_MODULES+=("brew-apps")
  fi

  for module in "${ALL_MODULES[@]}"; do
    run_module "$module"
  done

  log_success "Bootstrap complete!"
  log_info "Please restart your terminal for all changes to take effect."
  log_info "Check POST-INSTALL.md for any manual steps required."
}

# Argument parsing
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --module)
      [[ -z "${2:-}" ]] && { log_error "--module requires an argument"; exit 1; }
      MODULES+=("$2")
      shift 2
      ;;
    --skip)
      [[ -z "${2:-}" ]] && { log_error "--skip requires an argument"; exit 1; }
      SKIP_MODULES+=("$2")
      shift 2
      ;;
    --list)
      list_modules
      exit 0
      ;;
    --minimal)
      MINIMAL=true
      shift
      ;;
    --no-apps)
      NO_APPS=true
      shift
      ;;
    --verbose)
      VERBOSE=true
      set -x
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      log_error "Unknown argument: $1"
      usage
      exit 1
      ;;
  esac
done

main
