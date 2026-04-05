# OpenClaw / Skills Migration Playbook (Intel -> Apple Silicon)

## Goal

Avoid re-discovering setup issues by hand on every new Mac.

## Use this flow on a new Mac

1. Install Homebrew
2. Restore workspace / skills
3. Run:
   - `bash scripts/bootstrap/bootstrap-mac.sh`
4. Then run:
   - `bash scripts/verify/verify-openclaw-setup.sh`
5. Fix only the failing items

## What this setup covers

### Brew-managed tools
- `jq`
- `ripgrep`
- `ffmpeg`
- `memo`
- `peekaboo`
- `imagemagick`

### Skill bootstrap currently covered
- `apple-notes-applescript`
  - ensure shell scripts executable
- `ocr-local`
  - `npm install`
  - create `.tessdata` / `.tesscache`
  - download `eng.traineddata`
  - download `chi_sim.traineddata`

### Verification currently covered
- `apple-notes-applescript`
  - can list folders with `bash scripts/notes-folders.sh --counts`
- `ocr-local`
  - dependency presence
  - traineddata presence
  - smoke test on `avatar_quantum_fox_sketch.png`
- `peekaboo`
  - binary exists
  - `peekaboo --help` callable

## Known manual steps on a new Mac

### Apple Notes / AppleScript
You may still need to grant:
- Automation access to Notes.app
- Terminal / OpenClaw related automation permissions

### Peekaboo
You may still need to grant:
- Screen Recording
- Accessibility

## Known current caveats

### apple-notes-applescript
- In this environment, directly executing `scripts/*.sh` may report `permission denied` even when file mode is correct.
- Safer invocation pattern: `bash scripts/xxx.sh ...`
- For long rich-text note creation, avoid embedding huge HTML directly into AppleScript strings.
- Safer pattern: write HTML to a temp file, then `read POSIX file ... as «class utf8»` inside AppleScript.

### ocr-local
- This skill currently has deeper implementation issues beyond install steps.
- We confirmed:
  - npm deps can be installed
  - `.traineddata` files can be downloaded locally
  - but local traineddata loading via current Tesseract.js path handling still fails in this machine's setup
- Treat bootstrap as necessary but not sufficient. Verification is the source of truth.

### peekaboo
- Installing the workspace skill is not enough; the actual `peekaboo` CLI must exist in PATH.

## Why this matters

Intel -> Apple Silicon migration is usually blocked not by memory of steps, but by missing reproducible verification.
This playbook turns migration into:
- install
- verify
- fix only failures
