#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$ROOT/skills"
CODEX_DEST="${CODEX_HOME:-$HOME/.codex}/skills"
CLAUDE_DEST="$HOME/.claude/skills"

mkdir -p "$CODEX_DEST" "$CLAUDE_DEST"

rsync -a \
  "$SOURCE/shader-techniques" \
  "$SOURCE/shader-fundamentals" \
  "$SOURCE/shader-stylization" \
  "$SOURCE/shader-lighting" \
  "$SOURCE/shader-volumetrics" \
  "$SOURCE/shader-platforms" \
  "$CODEX_DEST/"

rsync -a \
  "$SOURCE/shader-techniques" \
  "$SOURCE/shader-fundamentals" \
  "$SOURCE/shader-stylization" \
  "$SOURCE/shader-lighting" \
  "$SOURCE/shader-volumetrics" \
  "$SOURCE/shader-platforms" \
  "$CLAUDE_DEST/"
