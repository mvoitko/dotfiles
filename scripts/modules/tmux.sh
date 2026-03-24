#!/usr/bin/env bash
# Set up tmux: oh-my-tmux + TPM

OMT_DIR="$HOME/.local/share/tmux/oh-my-tmux"
TPM_DIR="$HOME/.tmux/plugins/tpm"

# Clone oh-my-tmux
if [[ -d "$OMT_DIR" ]]; then
  log_success "oh-my-tmux already installed"
else
  log_info "Installing oh-my-tmux..."
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would clone oh-my-tmux to $OMT_DIR"
  else
    git clone https://github.com/gpakosz/.tmux.git "$OMT_DIR"
    # Symlink oh-my-tmux's base config
    mkdir -p "$HOME/.config/tmux"
    ln -sf "$OMT_DIR/.tmux.conf" "$HOME/.config/tmux/tmux.conf"
    log_success "oh-my-tmux installed"
  fi
fi

# Clone TPM
if [[ -d "$TPM_DIR" ]]; then
  log_success "TPM already installed"
else
  log_info "Installing TPM (Tmux Plugin Manager)..."
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would clone TPM to $TPM_DIR"
  else
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    log_success "TPM installed"
  fi
fi

log_info "Run 'tmux' then press prefix + I to install tmux plugins"
