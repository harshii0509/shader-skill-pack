#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Running skill validation"
bash "$ROOT/scripts/validate-all-skills.sh"

echo "Running shader benchmark"
python3 "$ROOT/scripts/evaluate-benchmark.py"
