#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VERIFY_DIR="$ROOT_DIR/scripts/verify"

run_check() {
  local script="$1"
  if [ ! -x "$script" ]; then
    chmod +x "$script"
  fi
  "$script"
}

FAILED=0

printf '\n### Verify: architecture ###\n'
run_check "$VERIFY_DIR/verify-architecture.sh" || FAILED=1

printf '\n### Verify: openclaw-core ###\n'
run_check "$VERIFY_DIR/verify-openclaw-core.sh" || FAILED=1

printf '\n### Verify: apple-notes-applescript ###\n'
run_check "$VERIFY_DIR/verify-apple-notes-applescript.sh" || FAILED=1

printf '\n### Verify: ocr-local ###\n'
run_check "$VERIFY_DIR/verify-ocr-local.sh" || FAILED=1

printf '\n### Verify: peekaboo ###\n'
run_check "$VERIFY_DIR/verify-peekaboo.sh" || FAILED=1

if [ "$FAILED" -eq 0 ]; then
  echo "\nAll checks passed."
else
  echo "\nSome checks failed. Read the failure output above."
  exit 1
fi
