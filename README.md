# Brainiac

## Francais

Brainiac est un template de cerveau agentique portable pour les personnes qui
utilisent plusieurs agents de code et veulent leur donner les memes regles de
travail.

Il aligne Codex, Claude Code et Grok Build autour d'un meme noyau de
preferences, sans copier d'historique prive, de token ou d'etat local sensible.

### Ce que fait Brainiac

- cree une memoire agentique canonique dans `~/.agents`
- expose des adaptateurs pour Codex, Claude Code et Grok Build
- garde un comportement coherent entre les outils
- fournit 50 skills publics integres comme demonstrateurs, pas comme skills de
  production
- prend en charge les skills locaux sans publier de bibliotheque privee
- inclut des scripts d'installation, sauvegarde et restauration

### Installation

```bash
./scripts/install.sh
```

Simulation:

```bash
./scripts/install.sh --dry-run
```

### Sauvegarder le cerveau local

```bash
./scripts/backup.sh ~/Desktop/brainiac-backup
```

### Restaurer une sauvegarde

```bash
./scripts/restore.sh ~/Desktop/brainiac-backup
```

### Fichiers principaux

- `SKILLS.md`: catalogue public des 50 skills demonstrateurs
- `skills/*/SKILL.md`: instructions concretes de chaque skill
- `templates/dotfiles/agents/BRAIN.md`: manifeste unifie
- `templates/dotfiles/agents/AGENTS.md`: preferences canoniques
- `templates/root`: adaptateurs globaux pour `/`
- `templates/home`: adaptateurs pour `$HOME`
- `templates/dotfiles/{codex,claude,grok}`: adaptateurs par outil
- `scripts/install.sh`: installe le template public
- `scripts/backup.sh`: cree une sauvegarde locale assainie
- `scripts/restore.sh`: restaure une sauvegarde
- `MANIFEST.md`: liste des livrables conserves dans le repo public

### Securite

Ce repo exclut volontairement:

- fichiers d'authentification
- tokens
- historiques
- bases SQLite d'etat
- caches
- memoires de projets prives
- contenu de bibliotheques de skills privees ou tierces

### Licence

MIT

---

## English

Brainiac is a portable agentic brain template for people who use several coding
agents and want them to share one coherent set of working rules.

It aligns Codex, Claude Code and Grok Build around the same preference core
without copying private history, tokens or sensitive local state.

### What Brainiac Does

- creates one canonical agent memory in `~/.agents`
- exposes adapter files for Codex, Claude Code and Grok Build
- keeps behavior consistent across tools
- provides 50 built-in public skills as demonstrators, not production-ready
  skills
- supports local skills without publishing private skill libraries
- includes install, backup and restore scripts

### Install

```bash
./scripts/install.sh
```

Dry run:

```bash
./scripts/install.sh --dry-run
```

### Back Up Your Local Brain

```bash
./scripts/backup.sh ~/Desktop/brainiac-backup
```

### Restore From A Backup

```bash
./scripts/restore.sh ~/Desktop/brainiac-backup
```

### Main Files

- `SKILLS.md`: public catalog of the 50 demonstrator skills
- `skills/*/SKILL.md`: concrete instructions for each skill
- `templates/dotfiles/agents/BRAIN.md`: unified manifesto
- `templates/dotfiles/agents/AGENTS.md`: canonical preferences
- `templates/root`: global adapters for `/`
- `templates/home`: adapters for `$HOME`
- `templates/dotfiles/{codex,claude,grok}`: tool-specific adapters
- `scripts/install.sh`: installs the public template
- `scripts/backup.sh`: creates a sanitized local backup
- `scripts/restore.sh`: restores a backup
- `MANIFEST.md`: list of deliverables intentionally kept in the public repo

### Security

This repository intentionally excludes:

- authentication files
- tokens
- histories
- SQLite state databases
- caches
- private project memories
- private or third-party skill library contents

### License

MIT
