#!/usr/bin/env bash
set -euo pipefail

if ! command -v peekaboo >/dev/null 2>&1; then
  echo "[FAIL] peekaboo: binary not found"
  exit 1
fi

if peekaboo --help >/tmp/verify-peekaboo.out 2>/tmp/verify-peekaboo.err; then
  echo "[PASS] peekaboo: binary callable"
  exit 0
else
  echo "[FAIL] peekaboo: --help failed"
  cat /tmp/verify-peekaboo.err
  exit 1
fi
