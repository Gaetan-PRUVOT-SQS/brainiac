# Release Manifest

This repository is intentionally small. It contains only the public deliverables
needed to install, inspect and reuse Brainiac.

## Deliverables

- `README.md`  
  Project overview, install commands and security notes.

- `LICENSE`  
  MIT license.

- `.gitignore`  
  Ignores local state, caches, histories, credentials and generated backups.

- `SKILLS.md`  
  Human-readable catalog of the 50 public skills.

- `skills/*/SKILL.md`  
  The 50 real skill instruction files.

- `scripts/install.sh`  
  Installs Brainiac adapters and links public skills.

- `scripts/backup.sh`  
  Creates a sanitized local Brainiac backup.

- `scripts/restore.sh`  
  Restores a sanitized local Brainiac backup.

- `templates/root/*`  
  Global adapter files for `/`.

- `templates/home/*`  
  Home-level adapter files.

- `templates/dotfiles/*`  
  Tool-specific adapters for agents, Codex, Claude Code and Grok Build.

## Excluded

- authentication files
- tokens or secrets
- local histories
- SQLite state
- caches
- generated backups
- private project memories
- private skill libraries
