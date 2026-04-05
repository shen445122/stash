#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
source "$ROOT_DIR/scripts/verify/lib.sh"

FAILED=0

if command -v openclaw >/dev/null 2>&1; then
  pass "openclaw-core: openclaw CLI found"
else
  fail "openclaw-core: openclaw CLI not found"
  exit 1
fi

if [ -f "$HOME/.openclaw/openclaw.json" ]; then
  pass "openclaw-core: ~/.openclaw/openclaw.json present"
else
  warn "openclaw-core: ~/.openclaw/openclaw.json not found"
fi

set +e
STATUS_OUT=$(openclaw status 2>&1)
STATUS_CODE=$?
set -e

if [ $STATUS_CODE -eq 0 ]; then
  pass "openclaw-core: openclaw status ok"
else
  fail "openclaw-core: openclaw status failed"
  printf '%s\n' "$STATUS_OUT"
  FAILED=1
fi

set +e
GATEWAY_OUT=$(openclaw gateway status 2>&1)
GATEWAY_CODE=$?
set -e

if [ $GATEWAY_CODE -eq 0 ]; then
  pass "openclaw-core: gateway status ok"
else
  fail "openclaw-core: gateway status failed"
  printf '%s\n' "$GATEWAY_OUT"
  FAILED=1
fi

exit $FAILED
