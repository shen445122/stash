#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
source "$ROOT_DIR/scripts/verify/lib.sh"

ARCH=$(uname -m)
BREW_PREFIX=$(brew --prefix 2>/dev/null || true)

if [ -z "$BREW_PREFIX" ]; then
  fail "architecture: Homebrew not found in PATH"
  exit 1
fi

info "architecture: uname -m = $ARCH"
info "architecture: brew prefix = $BREW_PREFIX"

case "$ARCH" in
  x86_64)
    pass "architecture: Intel Mac detected"
    if [ "$BREW_PREFIX" != "/usr/local" ] && [ "$BREW_PREFIX" != "/opt/homebrew" ]; then
      warn "architecture: unusual Homebrew prefix for Intel: $BREW_PREFIX"
    fi
    ;;
  arm64)
    pass "architecture: Apple Silicon detected"
    if [ "$BREW_PREFIX" != "/opt/homebrew" ]; then
      warn "architecture: expected /opt/homebrew on Apple Silicon, got $BREW_PREFIX"
    fi
    if command -v /usr/bin/pgrep >/dev/null 2>&1 && /usr/bin/pgrep oahd >/dev/null 2>&1; then
      info "architecture: Rosetta service appears present (oahd running)"
    else
      warn "architecture: Rosetta service not detected (fine unless a tool explicitly needs x86 emulation)"
    fi
    ;;
  *)
    warn "architecture: unrecognized arch: $ARCH"
    ;;
esac
