#!/bin/bash
# PostToolUse: Run shellcheck on edited .sh files

INPUT=$(cat)

if ! command -v jq &>/dev/null; then
  echo "WARNING: jq not installed — shellcheck hook cannot parse input, skipping" >&2
  exit 0
fi

if ! FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty' 2>&1); then
  echo "WARNING: shellcheck hook failed to parse input JSON: $FILE" >&2
  exit 0
fi

if [[ -z "$FILE" || "$FILE" != *.sh ]]; then
  exit 0
fi

if [[ ! -f "$FILE" ]]; then
  echo "WARNING: shellcheck hook — file does not exist: $FILE" >&2
  exit 0
fi

if ! command -v shellcheck &>/dev/null; then
  echo "WARNING: shellcheck not installed — skipping lint for $FILE" >&2
  exit 0
fi

if command -v gtimeout &>/dev/null; then
  LINT_OUT=$(gtimeout 30 shellcheck -f gcc "$FILE" 2>&1)
elif command -v timeout &>/dev/null; then
  LINT_OUT=$(timeout 30 shellcheck -f gcc "$FILE" 2>&1)
else
  echo "WARNING: neither timeout nor gtimeout available — shellcheck will run without timeout protection" >&2
  LINT_OUT=$(shellcheck -f gcc "$FILE" 2>&1)
fi
EXIT_CODE=$?

if [[ "$EXIT_CODE" -eq 124 ]]; then
  echo "WARNING: shellcheck timed out after 30s on $FILE — output may be incomplete" >&2
  if [[ -n "$LINT_OUT" ]]; then
    echo "$LINT_OUT" >&2
  fi
elif [[ "$EXIT_CODE" -eq 1 ]]; then
  echo "shellcheck warnings for $FILE:" >&2
  if [[ -n "$LINT_OUT" ]]; then
    echo "$LINT_OUT" >&2
  fi
elif [[ "$EXIT_CODE" -ne 0 ]]; then
  echo "WARNING: shellcheck failed (exit $EXIT_CODE) on $FILE:" >&2
  if [[ -n "$LINT_OUT" ]]; then
    echo "$LINT_OUT" >&2
  fi
fi

exit 0
