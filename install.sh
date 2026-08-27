#!/bin/sh
# Installs the skills in this repo to ~/.claude/skills (Claude Code user-level skills).
# Safe to re-run (overwrites with the repo versions).
set -e
src="$(cd "$(dirname "$0")" && pwd)/skills"
dst="$HOME/.claude/skills"
mkdir -p "$dst"
for d in "$src"/*/; do
  name="$(basename "$d")"
  mkdir -p "$dst/$name"
  cp -R "$d." "$dst/$name/"
  echo "installed: $name"
done
