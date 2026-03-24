#!/usr/bin/env bash
# Install Oh-My-Zsh and custom plugins

OMZ_DIR="$HOME/.oh-my-zsh"
OMZ_CUSTOM="${ZSH_CUSTOM:-$OMZ_DIR/custom}"

# Install Oh-My-Zsh
if [[ -d "$OMZ_DIR" ]]; then
  log_success "Oh-My-Zsh already installed"
else
  log_info "Installing Oh-My-Zsh..."
  if [[ "$DRY_RUN" == true ]]; then
    log_dryrun "Would install Oh-My-Zsh"
  else
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    log_success "Oh-My-Zsh installed"
  fi
fi

# Custom plugins
declare -A custom_plugins=(
  ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
  ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting"
  ["zsh-history-substring-search"]="https://github.com/zsh-users/zsh-history-substring-search"
)

for plugin in "${!custom_plugins[@]}"; do
  plugin_dir="$OMZ_CUSTOM/plugins/$plugin"
  if [[ -d "$plugin_dir" ]]; then
    log_success "Plugin $plugin already installed"
  else
    log_info "Installing plugin: $plugin..."
    if [[ "$DRY_RUN" == true ]]; then
      log_dryrun "Would clone $plugin"
    else
      git clone "${custom_plugins[$plugin]}" "$plugin_dir"
      log_success "Plugin $plugin installed"
    fi
  fi
done
