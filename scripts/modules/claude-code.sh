#!/usr/bin/env bash
# Install Claude Code marketplace plugins

MARKETPLACE_PLUGINS=(
  "pr-review-toolkit@claude-code-plugins"
  "claude-code-setup@claude-plugins-official"
  "claude-md-management@claude-plugins-official"
  "pyright-lsp@claude-plugins-official"
  "rust-analyzer-lsp@claude-plugins-official"
  "superpowers@claude-plugins-official"
  "skill-creator@claude-plugins-official"
  "security-guidance@claude-code-plugins"
  "frontend-design@claude-plugins-official"
  "context7@claude-plugins-official"
  "typescript-lsp@claude-plugins-official"
)

if ! command -v claude &>/dev/null; then
  log_warn "Claude Code not installed — skipping plugin setup"
  return 0
fi

for plugin in "${MARKETPLACE_PLUGINS[@]}"; do
  log_info "Ensuring plugin: ${plugin}"
  claude plugin add "$plugin" 2>/dev/null || true
done

log_success "Claude Code plugins configured"
