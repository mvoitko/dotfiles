#!/usr/bin/env bash
# AeroSpace setup

if command_exists aerospace || [[ -d "/Applications/AeroSpace.app" ]]; then
  log_success "AeroSpace is installed"
else
  log_warn "AeroSpace not found. Install it via: brew install --cask nikitabobko/tap/aerospace"
fi

log_info "AeroSpace config will be symlinked by Dotbot to ~/.aerospace.toml"
log_warn "Remember to grant Accessibility permissions to AeroSpace in System Settings > Privacy & Security"
