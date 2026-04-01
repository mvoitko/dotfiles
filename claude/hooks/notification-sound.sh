#!/bin/bash
# Stop hook: Play ICQ sound when Claude finishes a response

SOUND_FILE="$HOME/.claude/sounds/icq-uh-oh.mp3"
FALLBACK_SOUND="/System/Library/Sounds/Glass.aiff"

if [[ -f "$SOUND_FILE" ]]; then
  afplay "$SOUND_FILE" &
elif [[ -f "$FALLBACK_SOUND" ]]; then
  afplay "$FALLBACK_SOUND" &
fi

exit 0
