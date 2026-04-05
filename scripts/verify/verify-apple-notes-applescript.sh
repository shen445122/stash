#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SKILL_DIR="$ROOT_DIR/skills/apple-notes-applescript"

if [ ! -d "$SKILL_DIR" ]; then
  echo "[FAIL] apple-notes-applescript: skill dir missing: $SKILL_DIR"
  exit 1
fi

if [ ! -f "$SKILL_DIR/scripts/notes-folders.sh" ]; then
  echo "[FAIL] apple-notes-applescript: notes-folders.sh missing"
  exit 1
fi

if bash "$SKILL_DIR/scripts/notes-folders.sh" --counts >/tmp/verify-apple-notes.out 2>/tmp/verify-apple-notes.err; then
  echo "[PASS] apple-notes-applescript: folders listing ok"
  exit 0
else
  echo "[FAIL] apple-notes-applescript: folders listing failed"
  echo "stderr:"
  cat /tmp/verify-apple-notes.err
  exit 1
fi
