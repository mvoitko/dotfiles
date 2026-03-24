#!/usr/bin/env bash
# Run Dotbot to create symlinks

log_info "Running Dotbot..."
if [[ "$DRY_RUN" == true ]]; then
  log_dryrun "Would run: $DOTFILES_DIR/install"
  return 0
fi
"$DOTFILES_DIR/install"
log_success "Dotbot symlinks created"
