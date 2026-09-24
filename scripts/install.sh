#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
DRY_RUN=0

if [ "${1:-}" = "--dry-run" ]; then
  DRY_RUN=1
fi

run() {
  printf '+ %s\n' "$*"
  if [ "$DRY_RUN" -eq 0 ]; then
    "$@"
  fi
}

install_file() {
  src="$1"
  dst="$2"
  run mkdir -p "$(dirname "$dst")"
  run cp -a "$src" "$dst"
}

install_root_file() {
  src="$1"
  dst="$2"
  if [ "$(id -u)" -eq 0 ]; then
    run cp -a "$src" "$dst"
  else
    run sudo cp -a "$src" "$dst"
  fi
}

link_missing_skills() {
  src_dir="$1"
  dst_dir="$2"
  run mkdir -p "$dst_dir"
  if [ ! -d "$src_dir" ]; then
    return 0
  fi
  created=0
  skipped=0
  for src in "$src_dir"/*; do
    [ -e "$src" ] || [ -L "$src" ] || continue
    name="$(basename "$src")"
    dst="$dst_dir/$name"
    if [ -e "$dst" ] || [ -L "$dst" ]; then
      skipped=$((skipped + 1))
    else
      run ln -s "$src" "$dst"
      created=$((created + 1))
    fi
  done
  printf 'skills linked into %s: created=%s skipped=%s\n' "$dst_dir" "$created" "$skipped"
}

install_file "$ROOT/templates/dotfiles/agents/BRAIN.md" "$HOME/.agents/BRAIN.md"
install_file "$ROOT/templates/dotfiles/agents/AGENTS.md" "$HOME/.agents/AGENTS.md"
if [ -d "$ROOT/skills" ]; then
  run mkdir -p "$HOME/.agents/skills"
  for src in "$ROOT/skills"/*; do
    [ -d "$src" ] || continue
    dst="$HOME/.agents/skills/$(basename "$src")"
    if [ ! -e "$dst" ] && [ ! -L "$dst" ]; then
      run ln -s "$src" "$dst"
    fi
  done
fi

install_file "$ROOT/templates/home/AGENTS.md" "$HOME/AGENTS.md"
install_file "$ROOT/templates/home/CLAUDE.md" "$HOME/CLAUDE.md"
install_file "$ROOT/templates/home/GROK.md" "$HOME/GROK.md"

install_file "$ROOT/templates/dotfiles/codex/AGENTS.md" "$HOME/.codex/AGENTS.md"
install_file "$ROOT/templates/dotfiles/claude/AGENTS.md" "$HOME/.claude/AGENTS.md"
install_file "$ROOT/templates/dotfiles/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
install_file "$ROOT/templates/dotfiles/grok/AGENTS.md" "$HOME/.grok/AGENTS.md"
install_file "$ROOT/templates/dotfiles/grok/GROK.md" "$HOME/.grok/GROK.md"

install_root_file "$ROOT/templates/root/AGENTS.md" /AGENTS.md
install_root_file "$ROOT/templates/root/CLAUDE.md" /CLAUDE.md
install_root_file "$ROOT/templates/root/GROK.md" /GROK.md

link_missing_skills "$HOME/.agents/skills" "$HOME/.codex/skills"
link_missing_skills "$HOME/.agents/skills" "$HOME/.claude/skills"
link_missing_skills "$HOME/.agents/skills" "$HOME/.grok/skills"

if [ "$DRY_RUN" -eq 1 ]; then
  printf 'Dry run complete. No files were changed.\n'
else
  printf 'Brainiac installed.\n'
fi
