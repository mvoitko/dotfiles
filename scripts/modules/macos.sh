#!/usr/bin/env bash
# Apply macOS system defaults

log_info "Applying macOS defaults..."
if [[ "$DRY_RUN" == true ]]; then
  log_dryrun "Would run: $DOTFILES_DIR/macos/defaults.sh"
  return 0
fi
bash "$DOTFILES_DIR/macos/defaults.sh"
log_success "macOS defaults applied"
