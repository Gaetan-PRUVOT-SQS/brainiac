#!/usr/bin/env bash
set -euo pipefail

SRC="${1:-}"
if [ -z "$SRC" ]; then
  printf 'Usage: %s /path/to/brainiac-backup [--dry-run]\n' "$0" >&2
  exit 2
fi

DRY_RUN=0
if [ "${2:-}" = "--dry-run" ]; then
  DRY_RUN=1
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
PREV="$HOME/.brainiac-restore-backup-$STAMP"

run() {
  printf '+ %s\n' "$*"
  if [ "$DRY_RUN" -eq 0 ]; then
    "$@"
  fi
}

copy_if_exists() {
  src="$1"
  dst="$2"
  if [ -e "$src" ] || [ -L "$src" ]; then
    if [ -e "$dst" ] || [ -L "$dst" ]; then
      run mkdir -p "$PREV/$(dirname "${dst#/}")"
      run cp -a "$dst" "$PREV/${dst#/}"
    fi
    run mkdir -p "$(dirname "$dst")"
    run cp -a "$src" "$dst"
  fi
}

copy_root_if_exists() {
  src="$1"
  dst="$2"
  if [ -e "$src" ] || [ -L "$src" ]; then
    if [ -e "$dst" ] || [ -L "$dst" ]; then
      run mkdir -p "$PREV/$(dirname "${dst#/}")"
      run cp -a "$dst" "$PREV/${dst#/}"
    fi
    run sudo cp -a "$src" "$dst"
  fi
}

link_missing_skills() {
  src_dir="$1"
  dst_dir="$2"
  run mkdir -p "$dst_dir"
  [ -d "$src_dir" ] || return 0
  for src in "$src_dir"/*; do
    [ -e "$src" ] || [ -L "$src" ] || continue
    dst="$dst_dir/$(basename "$src")"
    if [ ! -e "$dst" ] && [ ! -L "$dst" ]; then
      run ln -s "$src" "$dst"
    fi
  done
}

copy_if_exists "$SRC/dotfiles/agents" "$HOME/.agents"
copy_if_exists "$SRC/home/AGENTS.md" "$HOME/AGENTS.md"
copy_if_exists "$SRC/home/CLAUDE.md" "$HOME/CLAUDE.md"
copy_if_exists "$SRC/home/GROK.md" "$HOME/GROK.md"
copy_if_exists "$SRC/dotfiles/codex/AGENTS.md" "$HOME/.codex/AGENTS.md"
copy_if_exists "$SRC/dotfiles/codex/config.toml" "$HOME/.codex/config.toml"
copy_if_exists "$SRC/dotfiles/claude/AGENTS.md" "$HOME/.claude/AGENTS.md"
copy_if_exists "$SRC/dotfiles/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
copy_if_exists "$SRC/dotfiles/claude/settings.json" "$HOME/.claude/settings.json"
copy_if_exists "$SRC/dotfiles/grok/AGENTS.md" "$HOME/.grok/AGENTS.md"
copy_if_exists "$SRC/dotfiles/grok/GROK.md" "$HOME/.grok/GROK.md"
copy_if_exists "$SRC/dotfiles/grok/config.toml" "$HOME/.grok/config.toml"
copy_if_exists "$SRC/dotfiles/grok/trusted_folders.toml" "$HOME/.grok/trusted_folders.toml"

copy_root_if_exists "$SRC/root/AGENTS.md" /AGENTS.md
copy_root_if_exists "$SRC/root/CLAUDE.md" /CLAUDE.md
copy_root_if_exists "$SRC/root/GROK.md" /GROK.md

link_missing_skills "$HOME/.agents/skills" "$HOME/.codex/skills"
link_missing_skills "$HOME/.agents/skills" "$HOME/.claude/skills"
link_missing_skills "$HOME/.agents/skills" "$HOME/.grok/skills"

if [ "$DRY_RUN" -eq 1 ]; then
  printf 'Dry run complete. No files were changed.\n'
else
  printf 'Restore complete. Previous files copied to %s when they existed.\n' "$PREV"
fi
