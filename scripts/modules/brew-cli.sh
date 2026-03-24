#!/usr/bin/env bash
# Install CLI tools via Homebrew

brewfiles=("Brewfile.core-cli" "Brewfile.devops-cli" "Brewfile.languages")

for bf in "${brewfiles[@]}"; do
  log_info "Installing $bf..."
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would run: brew bundle --file=$DOTFILES_DIR/brew/$bf"
    continue
  fi
  brew bundle --file="$DOTFILES_DIR/brew/$bf" --no-lock || log_warn "Some packages from $bf failed to install"
  log_success "$bf installed"
done
