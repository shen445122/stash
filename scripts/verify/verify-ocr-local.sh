#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SKILL_DIR="$ROOT_DIR/skills/ocr-local"
TEST_IMAGE="$ROOT_DIR/avatar_quantum_fox_sketch.png"
source "$ROOT_DIR/scripts/verify/lib.sh"

require_dir "$SKILL_DIR" "ocr-local skill dir" || exit 1
require_file "$SKILL_DIR/scripts/ocr.js" "ocr.js" || exit 1
require_dir "$SKILL_DIR/node_modules/tesseract.js" "tesseract.js dependency" || exit 1
require_file "$SKILL_DIR/.tessdata/eng.traineddata" "eng.traineddata" || exit 1
require_file "$SKILL_DIR/.tessdata/chi_sim.traineddata" "chi_sim.traineddata" || exit 1

if [ ! -f "$TEST_IMAGE" ]; then
  warn "ocr-local: test image missing, dependency checks passed but smoke test skipped"
  exit 0
fi

set +e
OUTPUT=$(cd "$SKILL_DIR" && node scripts/ocr.js "$TEST_IMAGE" --lang eng 2>&1)
STATUS=$?
set -e

if [ $STATUS -eq 0 ]; then
  pass "ocr-local: smoke test exited 0"
  exit 0
fi

fail "ocr-local: smoke test failed"
printf '%s\n' "$OUTPUT"

if printf '%s' "$OUTPUT" | grep -q "fetch failed"; then
  info "Likely current known issue: Tesseract.js local traineddata path handling still not compatible in this environment"
fi

exit 1
