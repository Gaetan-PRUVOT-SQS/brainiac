# Unified Agentic Brain

This file is the shared manifesto for Codex, Claude Code and Grok Build.
The canonical preferences live in:

- `~/.agents/AGENTS.md`

## Principle

All agents should behave like one operational memory:

- read canonical preferences before choosing a working style;
- use relevant local skills without loading the full library;
- respect shared hooks when the tool supports them;
- keep secrets out of logs, files, memory and commits;
- follow higher-priority system and developer instructions first.

## Shared Sources

- Preferences: `~/.agents/AGENTS.md`
- Canonical skills: `~/.agents/skills`
- Public Brainiac skills, when installed from the repository: `skills/*/SKILL.md`
- Shared hooks: `~/.agents/hooks`
- Codex skills: `~/.codex/skills`
- Claude skills: `~/.claude/skills`
- Grok skills: `~/.grok/skills`

## Tool Routing

Codex:

- load `AGENTS.md` from the current project, `$HOME`, or `/`;
- use `~/.codex/skills` and `~/.agents/skills`;
- apply preferences from `~/.agents/AGENTS.md`.

Claude Code:

- load `CLAUDE.md` from the current project, `$HOME`, or `/`;
- use `~/.claude/skills`, enriched with links to `~/.agents/skills`;
- prefer shared hooks from `~/.agents/hooks`.

Grok Build:

- load `GROK.md` or `AGENTS.md` when available;
- use `~/.grok/skills`, enriched with links to `~/.agents/skills`;
- apply the same preferences as Codex and Claude.

## Brainiac Rule

Anything added to a Brainiac backup as a rule, preference, adapter or procedure
should also be applied to the active agent brain when compatible with higher
priority instructions. Brainiac is an executable backup, not just an archive.
