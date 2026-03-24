#!/usr/bin/env bash
# Set up Python via pyenv

if ! command_exists pyenv; then
  log_warn "pyenv not found. Skipping Python setup."
  return 0
fi

PYTHON_VERSION="3.12"

log_info "Setting up Python $PYTHON_VERSION..."
if [[ "$DRY_RUN" == true ]]; then
  log_dryrun "Would install Python $PYTHON_VERSION via pyenv"
  log_dryrun "Would install pipx tools: ruff, mypy"
  return 0
fi

# Install latest 3.12.x if not already installed
if ! pyenv versions --bare | grep -q "^3\.12"; then
  LATEST=$(pyenv install --list | grep -E "^\s*3\.12\." | tail -1 | tr -d ' ')
  log_info "Installing Python $LATEST..."
  pyenv install "$LATEST"
  pyenv global "$LATEST"
else
  log_success "Python 3.12.x already installed"
fi

# Install pipx tools
if command_exists pipx; then
  for tool in ruff mypy; do
    log_info "Installing $tool via pipx..."
    if ! pipx install "$tool" 2>/dev/null; then
      pipx upgrade "$tool" || log_warn "Failed to install/upgrade $tool via pipx"
    fi
  done
  log_success "Python tools installed"
fi
