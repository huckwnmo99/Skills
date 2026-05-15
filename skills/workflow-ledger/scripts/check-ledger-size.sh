#!/bin/bash
# PostToolUse on Write — warns when a ledger file exceeds 150 lines

if ! command -v jq &>/dev/null; then
  exit 0
fi

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

if [[ ! "$FILE_PATH" =~ docs/tasks/ ]]; then
  exit 0
fi

if [ -f "$FILE_PATH" ]; then
  LINES=$(wc -l < "$FILE_PATH")
  if [ "$LINES" -gt 150 ]; then
    echo "WARNING: $FILE_PATH is $LINES lines. Ledger docs should stay under 150. Move detail into a sub-document and leave only a summary link here." >&2
  fi
fi

exit 0
