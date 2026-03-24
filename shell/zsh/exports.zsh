#!/usr/bin/env zsh
# Environment variables and PATH

# Homebrew prefix (arm64 vs x86_64)
if [[ "$(uname -m)" == "arm64" ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
else
  export HOMEBREW_PREFIX="/usr/local"
fi

# PATH
export PATH="$HOME/.local/bin:$HOME/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

# Default programs
export EDITOR="code"
export VISUAL="code"

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# History
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.histfile"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# Terminal
export TERM="xterm-256color"

# Virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=0

# Default user (for prompt themes)
export DEFAULT_USER="mvoitko"
