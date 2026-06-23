#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for skill in shader-techniques shader-fundamentals shader-stylization shader-lighting shader-volumetrics shader-platforms; do
  skill_dir="$ROOT/skills/$skill"
  echo "Validating $skill"

  test -f "$skill_dir/SKILL.md" || { echo "Missing SKILL.md in $skill" >&2; exit 1; }
  grep -q '^name:' "$skill_dir/SKILL.md" || { echo "SKILL.md missing 'name:' in $skill" >&2; exit 1; }
  grep -q '^description:' "$skill_dir/SKILL.md" || { echo "SKILL.md missing 'description:' in $skill" >&2; exit 1; }

  test -f "$skill_dir/agents/openai.yaml" || { echo "Missing agents/openai.yaml in $skill" >&2; exit 1; }
  grep -q 'display_name:' "$skill_dir/agents/openai.yaml" || { echo "agents/openai.yaml missing 'display_name:' in $skill" >&2; exit 1; }

  ls "$skill_dir/references/"*.md >/dev/null 2>&1 || { echo "No references/*.md in $skill" >&2; exit 1; }

  echo "  $skill: OK"
done
