#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SKILL_DIR="$ROOT_DIR/skills/apple-notes-applescript"
source "$ROOT_DIR/scripts/verify/lib.sh"

require_dir "$SKILL_DIR" "apple-notes-applescript skill dir" || exit 1
require_file "$SKILL_DIR/scripts/notes-folders.sh" "notes-folders.sh" || exit 1
require_file "$SKILL_DIR/scripts/notes-search.sh" "notes-search.sh" || exit 1
require_file "$SKILL_DIR/scripts/notes-read.sh" "notes-read.sh" || exit 1

FAILED=0

if bash "$SKILL_DIR/scripts/notes-folders.sh" --counts >/tmp/verify-apple-notes-folders.out 2>/tmp/verify-apple-notes-folders.err; then
  pass "apple-notes-applescript: folders listing ok"
else
  fail "apple-notes-applescript: folders listing failed"
  cat /tmp/verify-apple-notes-folders.err
  FAILED=1
fi

if bash "$SKILL_DIR/scripts/notes-search.sh" "金：投资收益提升" "新生活运动" 5 --title-only >/tmp/verify-apple-notes-search.out 2>/tmp/verify-apple-notes-search.err; then
  pass "apple-notes-applescript: title search ok"
else
  fail "apple-notes-applescript: title search failed"
  cat /tmp/verify-apple-notes-search.err
  FAILED=1
fi

if bash "$SKILL_DIR/scripts/notes-read.sh" "金：投资收益提升" "新生活运动" >/tmp/verify-apple-notes-read.out 2>/tmp/verify-apple-notes-read.err; then
  pass "apple-notes-applescript: note read ok"
else
  fail "apple-notes-applescript: note read failed"
  cat /tmp/verify-apple-notes-read.err
  FAILED=1
fi

exit $FAILED
