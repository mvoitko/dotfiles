#!/usr/bin/env bash
# Install GUI applications via Homebrew

brewfiles=(
  "Brewfile.core-apps"
  "Brewfile.dev-apps"
  "Brewfile.productivity-apps"
  "Brewfile.communication-apps"
  "Brewfile.security-apps"
  "Brewfile.qol-apps"
  "Brewfile.ai-apps"
  "Brewfile.quicklook"
  "Brewfile.mas"
)

for bf in "${brewfiles[@]}"; do
  log_info "Installing $bf..."
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would run: brew bundle --file=$DOTFILES_DIR/brew/$bf"
    continue
  fi
  brew bundle --file="$DOTFILES_DIR/brew/$bf" --no-lock || log_warn "Some packages from $bf failed to install"
  log_success "$bf installed"
done
