#!/bin/bash
# PostToolUse — surfaces active ledgers at session start
# Runs once per hour using a marker file to avoid repeating every tool call

MARKER=".claude/.ledger-session-marker"
TTL=3600

if [ -f "$MARKER" ]; then
  if command -v date &>/dev/null; then
    MARKER_AGE=$(( $(date +%s) - $(date -r "$MARKER" +%s 2>/dev/null || echo 0) ))
    if [ "$MARKER_AGE" -lt "$TTL" ]; then
      exit 0
    fi
  fi
fi

LEDGERS=$(find docs/tasks -name "README.md" 2>/dev/null | head -5)

if [ -n "$LEDGERS" ]; then
  echo "--- Active Ledgers ---"
  while IFS= read -r ledger; do
    STATUS=$(grep -m1 "Current Status" "$ledger" 2>/dev/null)
    NEXT=$(grep -m1 "Next Action" "$ledger" 2>/dev/null)
    echo "  $ledger"
    [ -n "$STATUS" ] && echo "    $STATUS"
    [ -n "$NEXT" ] && echo "    $NEXT"
  done <<< "$LEDGERS"
  echo "----------------------"
fi

mkdir -p ".claude"
touch "$MARKER"

exit 0
