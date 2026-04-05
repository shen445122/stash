#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"

say() { printf '\n==> %s\n' "$*"; }
warn() { printf 'WARN: %s\n' "$*" >&2; }

say "Checking Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  warn "Homebrew not found. Install Homebrew first: https://brew.sh/"
  exit 1
fi

say "Installing Brewfile packages"
brew bundle --file "$ROOT_DIR/Brewfile"

say "Checking Node/npm"
command -v node >/dev/null 2>&1 || { warn "node not found"; exit 1; }
command -v npm >/dev/null 2>&1 || { warn "npm not found"; exit 1; }

if [ -d "$SKILLS_DIR/ocr-local" ]; then
  say "Installing ocr-local npm deps"
  (cd "$SKILLS_DIR/ocr-local" && npm install)

  say "Preparing ocr-local tessdata dirs"
  mkdir -p "$SKILLS_DIR/ocr-local/.tessdata" "$SKILLS_DIR/ocr-local/.tesscache"

  if [ ! -f "$SKILLS_DIR/ocr-local/.tessdata/eng.traineddata" ]; then
    say "Downloading eng.traineddata"
    curl -L -o "$SKILLS_DIR/ocr-local/.tessdata/eng.traineddata" \
      https://github.com/tesseract-ocr/tessdata_fast/raw/main/eng.traineddata
  fi

  if [ ! -f "$SKILLS_DIR/ocr-local/.tessdata/chi_sim.traineddata" ]; then
    say "Downloading chi_sim.traineddata"
    curl -L -o "$SKILLS_DIR/ocr-local/.tessdata/chi_sim.traineddata" \
      https://github.com/tesseract-ocr/tessdata_fast/raw/main/chi_sim.traineddata
  fi
else
  warn "skills/ocr-local not found, skipping npm/tessdata bootstrap"
fi

if [ -d "$SKILLS_DIR/apple-notes-applescript/scripts" ]; then
  say "Ensuring apple-notes-applescript shell scripts are executable"
  chmod +x "$SKILLS_DIR/apple-notes-applescript/scripts"/*.sh || true
else
  warn "skills/apple-notes-applescript/scripts not found, skipping chmod"
fi

cat <<'EOF'

Bootstrap finished.

Manual checks still required on a new Mac:
1. Grant Notes Automation permission when prompted (memo / osascript / Notes flows)
2. Grant Screen Recording + Accessibility for Peekaboo if you use UI automation
3. Run scripts/verify/verify-openclaw-setup.sh for readiness checks
EOF
