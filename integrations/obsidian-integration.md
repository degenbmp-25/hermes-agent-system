---
id: obsidian-integration
title: Obsidian Integration
description: How this Obsidian vault connects to the AI agent via QMD for search and wikilinks for navigation.
tags: [obsidian, qmd, integration, knowledge-graph]
status: production
domain: systems
related: [skill-graph-architecture, qmd-search, AGENT-PROTOCOL]
updated: 2026-02-18
---
parent: [[MOC-agent-skills]]
---

# Obsidian Integration

This vault is the human-editable knowledge layer. The AI agent reads it via QMD search and wikilink traversal.

## How It Works

```
┌─────────────────────┐     ┌─────────────┐     ┌──────────────────┐
│   OBSIDIAN (UI)    │────▶│   QMD      │────▶│  AGENT (me)      │
│   Human edits      │     │   Indexes  │     │  Reads & traverses│
└─────────────────────┘     └─────────────┘     └──────────────────┘
```

- **Human** opens vault in Obsidian, edits markdown, adds wikilinks
- **QMD** indexes the vault for semantic search
- **Agent** reads INDEX.md → MOCs → skill nodes via wikilinks

## Vault Path

- Location: `/home/magic_000/vault/` (WSL)
- Agent accesses: natively at full Linux speed
- Obsidian accesses: via `\\wsl$\Ubuntu\home\magic_000\vault`

## QMD Commands

```bash
# Index/update the vault
qmd collection add /home/magic_000/vault --name beastmode --mask "**/*.md"
qmd update

# Search from agent context
qmd query "cron job failure detection"
qmd vsearch "how to handle rejected deals"
```

## Conventions

- All nodes have YAML frontmatter with `description`
- Wikilinks are in prose: `[[like this]]`, not in lists
- MOCs organize clusters; skills are atomic
- See [[AGENT-PROTOCOL]] for traversal rules
