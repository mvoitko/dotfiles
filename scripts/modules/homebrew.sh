#!/usr/bin/env bash
# Install Homebrew

if command_exists brew; then
  log_success "Homebrew already installed"
else
  log_info "Installing Homebrew..."
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would install Homebrew"
    return 0
  fi
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
  log_success "Homebrew installed"
fi

if [[ "$DRY_RUN" != true ]]; then
  log_info "Updating Homebrew..."
  brew update
  log_success "Homebrew updated"
fi
