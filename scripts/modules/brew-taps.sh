#!/usr/bin/env bash
# Add Homebrew taps

log_info "Adding Homebrew taps..."
if [[ "$DRY_RUN" == true ]]; then
  log_dryrun "Would run: brew bundle --file=$DOTFILES_DIR/brew/Brewfile.taps"
  return 0
fi
brew bundle --file="$DOTFILES_DIR/brew/Brewfile.taps" --no-lock || log_warn "Some taps failed to add"
log_success "Taps added"
