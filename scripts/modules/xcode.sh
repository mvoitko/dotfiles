#!/usr/bin/env bash
# Install Xcode Command Line Tools

if xcode-select -p &>/dev/null; then
  log_success "Xcode CLI tools already installed"
else
  log_info "Installing Xcode Command Line Tools..."
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would install Xcode CLI tools"
    return 0
  fi
  xcode-select --install
  log_info "Waiting for Xcode CLI tools installation (timeout: 10 minutes)..."
  elapsed=0
  until xcode-select -p &>/dev/null; do
    if (( elapsed >= 600 )); then
      log_error "Xcode CLI tools installation timed out. Install manually and re-run."
      return 1
    fi
    sleep 5
    elapsed=$((elapsed + 5))
  done
  log_success "Xcode CLI tools installed"
fi
