# Hermes Agent System — Reproducible Template

> Universal agent system setup for cloning top-of-the-line agent infrastructure across machines and platforms.

## What Is This?

A structured skill library + bootstrap scripts that let you stand up a fully-equipped agent system on any machine in under 5 minutes. Built for the Hermes/Clawdaunt architecture but agent-system agnostic.

## Quick Start

```bash
# One-shot setup (detects your agent system automatically)
curl -fsSL https://raw.githubusercontent.com/degenbmp-25/hermes-agent-system/main/setup-agent.sh | bash

# Or clone and run manually
git clone https://github.com/degenbmp-25/hermes-agent-system.git
cd hermes-agent-system
./setup-agent.sh
```

## What Gets Installed

| Component | Description |
|-----------|-------------|
| `core/` | Core Hermes skills (maturity levels, new features) |
| `multi-agent/` | Multi-agent orchestration, team profiles |
| `research/` | Research converters, ADHD-friendly patterns |
| `ops/` | Kanban orchestration, cron coordination |
| `integrations/` | Obsidian, OpenClaw, CLI integration skills |
| `architecture/` | Reference architectures (multi-instance, profiles) |

## Supported Agent Systems

| System | Platform | Skill Location |
|--------|----------|---------------|
| OpenClaw | PC (Windows/WSL/Linux) | `~/.openclaw/skills/` |
| Hermes | Mac | `~/.openclaw/skills/` |
| Other | Any | Configurable via `--skills-dir` |

## Architecture

```
hermes-agent-system/
├── core/               # Foundational skills
├── multi-agent/        # Multi-instance orchestration
├── research/          # Research & knowledge patterns
├── ops/               # Operational runbooks
├── integrations/       # Tool integrations
├── architecture/      # Reference architectures
├── setup-agent.sh     # One-shot bootstrap
├── sync.sh           # Scheduled sync (git pull)
└── README.md
```

## Daily Workflow

```bash
# Pull latest from repo (after Hermes pushes updates)
./sync.sh

# Or add to cron for automatic sync
crontab -e
# 0 */6 * * * /path/to/hermes-agent-system/sync.sh >> ~/.logs/agent-sync.log 2>&1
```

## For HiveMind Clients

This repo IS the product. Clone it, run `setup-agent.sh`, and you have a production-grade agent system in minutes.

## Updating the Skill Library

```bash
cd hermes-agent-system
# Make changes to skill files...
git add .
git commit -m "Update multi-agent orchestration skills"
git push
# Agents on other machines will pull on next sync
```
