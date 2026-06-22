# Hermes Export — Quick Import Reference

This repository contains one installable runtime skill plus a set of research/reference notes.

Do not bulk-install the X-derived `SKILL.md` files into Hermes/OpenClaw runtime context. They are source-backed research notes, not executable capabilities.

## Installable Skill

```bash
HERMES_SKILLS=~/.openclaw/workspace/skills
LIBRARY=~/BeastmodeVault/vaults/hermes-agent-system

mkdir -p "$HERMES_SKILLS"
cp -r "$LIBRARY/ops/hermes-vault-compiler" "$HERMES_SKILLS/"
```

## Why Only This One

`ops/hermes-vault-compiler` is authored by BeastmodeVault and has working repository tooling:

- `_tools/run-all.sh`
- `_tools/check-source-manifest.sh`
- `_tools/check-wikilinks.sh`
- `_tools/check-secrets.sh`
- `templates/SOURCE-MANIFEST.md`
- `templates/PERSON.md`
- `templates/DECISION.md`
- `templates/CONTEXT-PACK.md`

It defines a concrete workflow and validation gate. It earns runtime installation.

## Read, Do Not Install

These are useful strategic references, but should stay out of default runtime skills:

1. `core/hermes-agent-maturity-levels/SKILL.md`
2. `multi-agent/hermes-multi-agent-team-profiles/SKILL.md`
3. `multi-agent/hermes-operator-layer/SKILL.md`

Background reading:

- `core/hermes-setup/SKILL.md`
- `core/hermes-security/SKILL.md`
- `core/session-auto-per-day-logging/SKILL.md`
- `ops/discord-hermes-kanban-orchestration/SKILL.md`

## Full Reference Library

The remaining `SKILL.md` files are preserved for provenance and review. Treat them as imported research notes from external creators, not as commands to install.

When a reference note produces an actual repeatable workflow, promote it by authoring a new BeastmodeVault-owned skill with:

- a clear trigger/use case
- concrete steps
- tool/runtime assumptions
- validation commands
- source attribution
