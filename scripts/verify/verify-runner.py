#!/usr/bin/env python3
import json
import os
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VERIFY_DIR = ROOT / 'scripts' / 'verify'

CHECKS = [
    ('architecture', VERIFY_DIR / 'verify-architecture.sh'),
    ('openclaw-core', VERIFY_DIR / 'verify-openclaw-core.sh'),
    ('apple-notes-applescript', VERIFY_DIR / 'verify-apple-notes-applescript.sh'),
    ('ocr-local', VERIFY_DIR / 'verify-ocr-local.sh'),
    ('peekaboo', VERIFY_DIR / 'verify-peekaboo.sh'),
]

def run_check(name, script):
    proc = subprocess.run(['bash', str(script)], capture_output=True, text=True)
    return {
        'name': name,
        'script': str(script),
        'exitCode': proc.returncode,
        'status': 'pass' if proc.returncode == 0 else 'fail',
        'stdout': proc.stdout,
        'stderr': proc.stderr,
    }


def print_human(results):
    failed = False
    for result in results:
        print(f"\n### Verify: {result['name']} ###")
        out = (result['stdout'] or '').rstrip()
        err = (result['stderr'] or '').rstrip()
        if out:
            print(out)
        if err:
            print(err)
        if result['exitCode'] != 0:
            failed = True
    print("\n=== Summary ===")
    for result in results:
        icon = 'PASS' if result['status'] == 'pass' else 'FAIL'
        print(f"- {icon}: {result['name']}")
    if failed:
        print("\nSome checks failed. Read the output above.")
    else:
        print("\nAll checks passed.")
    return 1 if failed else 0


def main():
    json_mode = '--json' in sys.argv
    results = [run_check(name, script) for name, script in CHECKS]
    payload = {
        'root': str(ROOT),
        'results': results,
        'summary': {
            'total': len(results),
            'passed': sum(1 for r in results if r['status'] == 'pass'),
            'failed': sum(1 for r in results if r['status'] == 'fail'),
        }
    }
    if json_mode:
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        sys.exit(0 if payload['summary']['failed'] == 0 else 1)
    sys.exit(print_human(results))

if __name__ == '__main__':
    main()
