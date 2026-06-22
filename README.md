# Hermes Agent System — Authored Skill Library

> BeastmodeVault-authored Hermes/OpenClaw skills derived from sourced research and converted into executable procedures.

## What This Is

This repository contains authored runtime skills. External X/blog/source links are preserved as provenance, but the skill bodies are BeastmodeVault-authored workflows with procedures, outputs, and validation rules.

## Quick Start

```bash
# Clone and install the authored skill library
git clone https://github.com/degenbmp-25/hermes-agent-system.git
cd hermes-agent-system
./setup-agent.sh
```

## What Gets Installed

| Component | Runtime Installed | Description |
|-----------|-------------------|-------------|
| `architecture/` | Yes | Multi-instance architecture skills |
| `core/` | Yes | Setup, maturity, security, logging, and feature-audit skills |
| `integrations/` | Yes | Obsidian, JSON Canvas, Defuddle, and LLM-wiki workflow skills |
| `multi-agent/` | Yes | Team profile, operator, and architecture skills |
| `ops/` | Yes | Kanban, task gate, vault compiler, and memory dashboard operations |
| `research/` | Yes | Research conversion, atomic notes, ADHD productivity, and vault context skills |
| `seo/` | Yes | AI-search content strategy skill |
| `_tools/`, `templates/` | Repo resources | Validation scripts and note templates used by skills |

## Recommended Reading Order

Start with these when orienting a new Hermes system:

1. `core/hermes-agent-maturity-levels/SKILL.md`
2. `multi-agent/hermes-multi-agent-team-profiles/SKILL.md`
3. `multi-agent/hermes-operator-layer/SKILL.md`

Then use the category-specific skills as needed:

- `core/hermes-setup/SKILL.md`
- `core/hermes-security/SKILL.md`
- `core/session-auto-per-day-logging/SKILL.md`
- `ops/discord-hermes-kanban-orchestration/SKILL.md`

## Repository Layout

```text
hermes-agent-system/
├── architecture/                # Authored architecture skills
├── core/                        # Authored core skills
├── integrations/                # Authored integration skills
├── multi-agent/                 # Authored multi-agent skills
├── ops/                         # Authored operations skills
├── research/                    # Authored research workflow skills
├── seo/                         # Authored SEO/AI-search skill
├── _tools/                      # Validation scripts
├── templates/                   # Vault note templates
├── x-sources/                   # Source provenance
├── setup-agent.sh               # Installs authored skills
└── sync.sh                      # Pull latest repo changes
```

## Skill Authorship Rule

Do not paste raw source material into runtime skills. A source becomes installable only after it has been rewritten into a BeastmodeVault-authored workflow with:

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
