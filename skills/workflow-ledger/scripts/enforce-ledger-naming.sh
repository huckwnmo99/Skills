#!/bin/bash
# PreToolUse on Write — enforces NN_YYYY-MM-DD_name.md in ledger status folders

if ! command -v jq &>/dev/null; then
  exit 0
fi

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

if [[ ! "$FILE_PATH" =~ docs/tasks/.+/(planned|in-progress|completed)/.+\.md$ ]]; then
  exit 0
fi

FILE_NAME=$(basename "$FILE_PATH")

if [[ ! "$FILE_NAME" =~ ^[0-9]{2}_[0-9]{4}-[0-9]{2}-[0-9]{2}_[a-z0-9-]+\.md$ ]]; then
  echo "BLOCKED: '$FILE_NAME' does not follow the ledger naming convention." >&2
  echo "Required: NN_YYYY-MM-DD_short-kebab-name.md" >&2
  echo "Example:  01_2026-05-15_add-auth.md" >&2
  exit 2
fi

exit 0
