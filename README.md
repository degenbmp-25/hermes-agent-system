# Hermes Agent System — Vault Compiler + Reference Library

> A small installable Hermes/OpenClaw capability plus source-backed research notes for building better agent systems.

## What This Is

This repository has two kinds of material:

1. **Installable runtime skill:** `ops/hermes-vault-compiler`
2. **Reference/research notes:** X-derived `SKILL.md` files preserved for reading and provenance

The reference notes are not default runtime skills. They do not define tools, schemas, install commands, or reliable runtime behavior. Installing all of them would load a large amount of commentary into context without adding real capability.

## Quick Start

```bash
# Clone and install the one real runtime skill
git clone https://github.com/degenbmp-25/hermes-agent-system.git
cd hermes-agent-system
./setup-agent.sh
```

By default, `setup-agent.sh` installs only:

```text
ops/hermes-vault-compiler
```

## What Gets Installed

| Component | Runtime Installed | Description |
|-----------|-------------------|-------------|
| `ops/hermes-vault-compiler` | Yes | BeastmodeVault-authored vault structure and validation workflow |
| `_tools/` | No | Repository validation scripts used by the vault compiler workflow |
| `templates/` | No | Source manifest, person, decision, and context-pack templates |
| `core/`, `multi-agent/`, `research/`, `integrations/`, `architecture/` | No | Source-backed reference notes; read manually |

## Recommended Reading Order

Read these before adding more runtime surface:

1. `core/hermes-agent-maturity-levels/SKILL.md`
2. `multi-agent/hermes-multi-agent-team-profiles/SKILL.md`
3. `multi-agent/hermes-operator-layer/SKILL.md`

Useful background:

- `core/hermes-setup/SKILL.md`
- `core/hermes-security/SKILL.md`
- `core/session-auto-per-day-logging/SKILL.md`
- `ops/discord-hermes-kanban-orchestration/SKILL.md`

## Repository Layout

```text
hermes-agent-system/
├── ops/hermes-vault-compiler/   # Installable runtime skill
├── _tools/                      # Validation scripts
├── templates/                   # Vault note templates
├── core/                        # Reference notes
├── multi-agent/                 # Reference notes
├── research/                    # Reference notes
├── integrations/                # Reference notes
├── architecture/                # Reference notes
├── x-sources/                   # Source provenance
├── setup-agent.sh               # Installs only hermes-vault-compiler
└── sync.sh                      # Pull latest repo changes
```

## Promote A Reference Into A Skill

Do not install research notes directly. Promote a reference only after authoring a new BeastmodeVault-owned capability with:

- a clear trigger/use case
- concrete steps
- tool/runtime assumptions
- validation commands
- source attribution

## Daily Workflow

```bash
./sync.sh
./_tools/run-all.sh
```

## Supported Agent Systems

| System | Platform | Default Skill Location |
|--------|----------|------------------------|
| OpenClaw | Linux/WSL | `~/.openclaw/skills/` |
| Hermes | Mac | `~/.openclaw/skills/` |
| Other | Any | configurable via `--skills-dir` |
