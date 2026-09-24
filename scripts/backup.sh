#!/usr/bin/env bash
set -euo pipefail

DEST="${1:-$HOME/brainiac-backup}"

mkdir -p "$DEST/root" "$DEST/home" \
  "$DEST/dotfiles/agents" "$DEST/dotfiles/codex" \
  "$DEST/dotfiles/claude" "$DEST/dotfiles/grok"

copy_if_exists() {
  src="$1"
  dst="$2"
  if [ -e "$src" ] || [ -L "$src" ]; then
    mkdir -p "$(dirname "$dst")"
    cp -a "$src" "$dst"
  fi
}

copy_if_exists "$HOME/.agents/BRAIN.md" "$DEST/dotfiles/agents/BRAIN.md"
copy_if_exists "$HOME/.agents/AGENTS.md" "$DEST/dotfiles/agents/AGENTS.md"
copy_if_exists "$HOME/.agents/hooks" "$DEST/dotfiles/agents/hooks"
copy_if_exists "$HOME/.agents/skills" "$DEST/dotfiles/agents/skills"

copy_if_exists /AGENTS.md "$DEST/root/AGENTS.md"
copy_if_exists /CLAUDE.md "$DEST/root/CLAUDE.md"
copy_if_exists /GROK.md "$DEST/root/GROK.md"

copy_if_exists "$HOME/AGENTS.md" "$DEST/home/AGENTS.md"
copy_if_exists "$HOME/CLAUDE.md" "$DEST/home/CLAUDE.md"
copy_if_exists "$HOME/GROK.md" "$DEST/home/GROK.md"

copy_if_exists "$HOME/.codex/AGENTS.md" "$DEST/dotfiles/codex/AGENTS.md"
copy_if_exists "$HOME/.codex/config.toml" "$DEST/dotfiles/codex/config.toml"

copy_if_exists "$HOME/.claude/AGENTS.md" "$DEST/dotfiles/claude/AGENTS.md"
copy_if_exists "$HOME/.claude/CLAUDE.md" "$DEST/dotfiles/claude/CLAUDE.md"
copy_if_exists "$HOME/.claude/settings.json" "$DEST/dotfiles/claude/settings.json"

copy_if_exists "$HOME/.grok/AGENTS.md" "$DEST/dotfiles/grok/AGENTS.md"
copy_if_exists "$HOME/.grok/GROK.md" "$DEST/dotfiles/grok/GROK.md"
copy_if_exists "$HOME/.grok/config.toml" "$DEST/dotfiles/grok/config.toml"
copy_if_exists "$HOME/.grok/trusted_folders.toml" "$DEST/dotfiles/grok/trusted_folders.toml"

cat > "$DEST/README.md" <<'EOF'
# Brainiac Backup

Sanitized local backup of an agentic brain.

Excluded by design: auth files, histories, SQLite state, caches and secrets.
EOF

printf 'Backup written to %s\n' "$DEST"
