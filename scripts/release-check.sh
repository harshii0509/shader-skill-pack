#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Running skill validation"
bash "$ROOT/scripts/validate-all-skills.sh"

echo "Checking required skill metadata"
for skill in shader-techniques shader-fundamentals shader-stylization shader-lighting shader-volumetrics shader-platforms; do
  test -f "$ROOT/skills/$skill/agents/openai.yaml"
done

echo "Checking top-level release files"
for file in README.md LICENSE .gitignore ATTRIBUTION.md skills.sh.json; do
  test -f "$ROOT/$file"
done

echo "Checking benchmark case count"
case_count="$(rg -c '"id":' "$ROOT/evals/shader-benchmark/cases.json")"
if [[ "$case_count" != "10" ]]; then
  echo "Expected 10 benchmark cases, found $case_count" >&2
  exit 1
fi

echo "Checking canonical skill layout"
for skill in shader-techniques shader-fundamentals shader-stylization shader-lighting shader-volumetrics shader-platforms; do
  test -f "$ROOT/skills/$skill/SKILL.md"
done

echo "Checking attribution sections in SKILL.md files"
for skill in shader-techniques shader-fundamentals shader-stylization shader-lighting shader-volumetrics shader-platforms; do
  rg -q '## Attribution' "$ROOT/skills/$skill/SKILL.md" || { echo "Missing ## Attribution in $skill/SKILL.md" >&2; exit 1; }
  rg -q 'blog.maximeheckel.com' "$ROOT/skills/$skill/SKILL.md" || { echo "Missing blog.maximeheckel.com in $skill/SKILL.md" >&2; exit 1; }
done

echo "Checking skills.sh.json pack metadata"
rg -q '"name"' "$ROOT/skills.sh.json"
rg -q '"author"' "$ROOT/skills.sh.json"
rg -q '"attribution"' "$ROOT/skills.sh.json"

echo "Checking README public install URLs"
rg -q 'https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-techniques' "$ROOT/README.md"
rg -q 'https://github.com/harshii0509/shader-skill-pack/tree/main/skills/shader-platforms' "$ROOT/README.md"
rg -q 'npx skills add harshii0509/shader-skill-pack' "$ROOT/README.md"
rg -q 'https://skills.sh/harshii0509/shader-skill-pack' "$ROOT/README.md"

echo "Release check passed"
