#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SKILL_DIR="$ROOT_DIR/skills/ocr-local"
TEST_IMAGE="$ROOT_DIR/avatar_quantum_fox_sketch.png"

if [ ! -d "$SKILL_DIR" ]; then
  echo "[FAIL] ocr-local: skill dir missing: $SKILL_DIR"
  exit 1
fi

if [ ! -f "$SKILL_DIR/scripts/ocr.js" ]; then
  echo "[FAIL] ocr-local: scripts/ocr.js missing"
  exit 1
fi

if [ ! -d "$SKILL_DIR/node_modules/tesseract.js" ]; then
  echo "[FAIL] ocr-local: tesseract.js dependency missing (run npm install)"
  exit 1
fi

if [ ! -f "$SKILL_DIR/.tessdata/eng.traineddata" ]; then
  echo "[FAIL] ocr-local: eng.traineddata missing"
  exit 1
fi

if [ ! -f "$SKILL_DIR/.tessdata/chi_sim.traineddata" ]; then
  echo "[FAIL] ocr-local: chi_sim.traineddata missing"
  exit 1
fi

if [ ! -f "$TEST_IMAGE" ]; then
  echo "[WARN] ocr-local: test image missing, dependency checks passed but smoke test skipped"
  exit 0
fi

set +e
OUTPUT=$(cd "$SKILL_DIR" && node scripts/ocr.js "$TEST_IMAGE" --lang eng 2>&1)
STATUS=$?
set -e

if [ $STATUS -eq 0 ]; then
  echo "[PASS] ocr-local: smoke test exited 0"
  exit 0
fi

echo "[FAIL] ocr-local: smoke test failed"
printf '%s\n' "$OUTPUT"
exit 1
