#!/usr/bin/env bash
# Install Nerd Fonts

log_info "Installing fonts..."
if [[ "$DRY_RUN" == true ]]; then
  log_dryrun "Would run: brew bundle --file=$DOTFILES_DIR/brew/Brewfile.fonts"
  return 0
fi
brew bundle --file="$DOTFILES_DIR/brew/Brewfile.fonts" --no-lock || log_warn "Some fonts failed to install"
log_success "Fonts installed"
