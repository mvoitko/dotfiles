#!/usr/bin/env bash
# Platform detection

check_macos() {
  if [[ "$(uname)" != "Darwin" ]]; then
    log_error "This script is intended for macOS only."
    exit 1
  fi
}

ARCH="$(uname -m)"

if [[ "$ARCH" == "arm64" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi
