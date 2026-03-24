#!/usr/bin/env bash
# Install VS Code extensions

EXTENSIONS_FILE="$DOTFILES_DIR/editor/vscode/extensions.txt"

if ! command_exists code; then
  log_warn "VS Code CLI (code) not found. Skipping extension installation."
  return 0
fi

if [[ ! -f "$EXTENSIONS_FILE" ]]; then
  log_warn "Extensions file not found: $EXTENSIONS_FILE"
  return 0
fi

log_info "Installing VS Code extensions..."
while IFS= read -r extension; do
  [[ -z "$extension" || "$extension" == \#* ]] && continue
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would install: $extension"
  else
    code --install-extension "$extension" --force 2>/dev/null || log_warn "Failed to install: $extension"
  fi
done < "$EXTENSIONS_FILE"
log_success "VS Code extensions installed"
