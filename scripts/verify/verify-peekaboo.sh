#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
source "$ROOT_DIR/scripts/verify/lib.sh"

if ! command -v peekaboo >/dev/null 2>&1; then
  fail "peekaboo: binary not found"
  exit 1
fi

FAILED=0

if peekaboo --help >/tmp/verify-peekaboo-help.out 2>/tmp/verify-peekaboo-help.err; then
  pass "peekaboo: binary callable"
else
  fail "peekaboo: --help failed"
  cat /tmp/verify-peekaboo-help.err
  FAILED=1
fi

set +e
peekaboo permissions >/tmp/verify-peekaboo-perm.out 2>/tmp/verify-peekaboo-perm.err
STATUS=$?
set -e

if [ $STATUS -eq 0 ]; then
  pass "peekaboo: permissions command callable"
  info "peekaboo permissions output:"
  cat /tmp/verify-peekaboo-perm.out
else
  warn "peekaboo: permissions command failed or requires local permissions"
  cat /tmp/verify-peekaboo-perm.err
fi

exit $FAILED
