#!/usr/bin/env bash

pass() { echo "[PASS] $*"; }
fail() { echo "[FAIL] $*"; }
warn() { echo "[WARN] $*"; }
info() { echo "[INFO] $*"; }

require_file() {
  local f="$1"
  local label="$2"
  if [ ! -f "$f" ]; then
    fail "$label missing: $f"
    return 1
  fi
  return 0
}

require_dir() {
  local d="$1"
  local label="$2"
  if [ ! -d "$d" ]; then
    fail "$label missing: $d"
    return 1
  fi
  return 0
}
