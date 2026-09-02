#!/bin/sh
# Installs the skills in this repo to Claude Code and/or Codex user-level skills.
# Safe to re-run (overwrites with the repo versions).
set -e
src="$(cd "$(dirname "$0")" && pwd)/skills"

usage() {
  echo "Usage: sh install.sh [claude|codex|both]" >&2
}

if [ "$#" -eq 0 ]; then
  target=claude
elif [ "$#" -eq 1 ]; then
  target=$1
else
  usage
  exit 1
fi

case "$target" in
  claude|codex|both) ;;
  *)
    usage
    exit 1
    ;;
esac

install_skills() {
  dst=$1
  mkdir -p "$dst"
  for d in "$src"/*/; do
    name="$(basename "$d")"
    mkdir -p "$dst/$name"
    cp -R "$d." "$dst/$name/"
    echo "installed: $name"
  done
}

if [ "$target" = claude ] || [ "$target" = both ]; then
  install_skills "$HOME/.claude/skills"
fi
if [ "$target" = codex ] || [ "$target" = both ]; then
  install_skills "$HOME/.agents/skills"
fi
