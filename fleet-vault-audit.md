# HiveMind Fleet — Vault Audit & Migration Plan

**Date:** 2026-08-29  
**Status:** READY FOR DEPLOYMENT  
**Fleet:** Clawdaunt + Clawdinho + Herminho

---

## Executive Summary

Goal: Give Clawdinho and Herminho each a world-class Obsidian vault on the Mac Mini with the same operating architecture as Clawdaunt. Not everything — selective sync based on role relevance.

Each agent gets:
- **Core OS Layer** — their identity, memory, tools, workflow
- **Agent Directory** — their own sub-agents and council members
- **Project Context** — relevant project vaults
- **Shared Knowledge** — read-only access to the knowledge base
- **Skills** — operational skills they need to run

---

## Fleet Role Map

| Agent | Role | Vault Priority | Key Context |
|-------|------|--------------|-------------|
| **Clawdaunt** (me) | Orchestrator + Executor | Full vault access | Everything |
| **Clawdinho** | Junior Clawdaunt — execution arm | HiveMind projects + shared knowledge | agent-services, hivemind-intelligence, knowledge |
| **Herminho** | Junior Hermes — orchestrator arm | Hermes system + operations | hermes-agent-system, operator-maintenance, all projects |

---

## Layer 1: Core OS Files

**Every agent gets these — personalized per agent.**

| File | Purpose | Clawdinho | Herminho |
|------|---------|-----------|----------|
| `SOUL.md` | Who they are, values, vibe | Clawdinho version | Herminho/Hermes version |
| `IDENTITY.md` | Name, role, emoji, traits | Little Clawdaunt 🦞 | Little Hermes ✨ |
| `MEMORY.md` | Long-term memory — persists across sessions | Clawdinho memories | Herminho memories |
| `USER.md` | About Beastmode — their human | Beastmode context | Beastmode context |
| `AGENTS.md` | Operating instructions, sub-agent roster | Clawdinho's subs | Herminho's subs |
| `HEARTBEAT.md` | Event-driven workflow triggers | Adapted for Clawdinho | Adapted for Herminho |
| `hot.md` | Immediate context — loaded every session | Clawdinho hot layer | Herminho hot layer |
| `Todo.md` | Task list | Clawdinho's tasks | Herminho's tasks |
| `progress-log.md` | What happened — morning briefing | Clawdinho's log | Herminho's log |
| `TOOLS.md` | Tools configuration | Clawdinho's tools | Herminho's tools |

---

## Layer 2: Agent Directories

Each fleet agent gets their own `agents/{name}/` directory on their vault.

```
agents/
├── {agent}/
│   ├── SOUL.md
│   ├── IDENTITY.md
│   ├── MEMORY.md
│   ├── AGENTS.md
│   ├── USER.md
│   └── config.json
```

**Clawdinho's agents/** → receives sub-agents appropriate for their scope
**Herminho's agents/** → receives sub-agents per Hermes's design (from hermes-agent-system/multi-agent/)

---

## Layer 3: Project Context

**Clawdinho gets:**

```
vaults/
├── projects/
│   ├── hivemind-intelligence/   ← FULL
│   └── agent-services/          ← FULL
├── clients/                     ← relevant slices
└── knowledge/                   ← shared (ai-agents, processes, content)
```

**Herminho gets:**

```
vaults/
├── hermes-agent-system/         ← FULL (core, ops, multi-agent, integrations)
├── projects/                    ← ALL projects (full visibility for orchestration)
├── clients/                     ← ALL clients (orchestrator sees everything)
└── knowledge/                  ← shared (all knowledge)
```

---

## Layer 4: Shared Knowledge Base

**Both agents get read-only access to:**

```
vaults/knowledge/
├── ai-agents/                  ← AI agent research
├── ai-prompts/                 ← Prompt engineering
├── business-alpha/              ← X alpha posts (captured)
├── content/                     ← Content strategy
├── processes/                   ← SOPs, workflows
├── seo-growth-tactics/         ← SEO knowledge
├── tools/                      ← Tool reviews/guides
├── X/                          ← Extracted X posts
├── learnings/                   ← System learnings
└── linkedin/                   ← LinkedIn strategy
```

**NOT synced to agents (too noisy/perishable):**
- `vaults/knowledge/extracted/` — raw extractions
- `vaults/knowledge/tweets/` — individual tweets
- `vaults/knowledge/X_Posts/` — duplicate X content

---

## Layer 5: Skills

**Clawdinho gets:**

```
skills/
├── council/                    ← Council protocol (multi-agent reasoning)
├── skill-graph/                ← Skill graph system
├── skill-recorder/             ← Learn from captures
├── learning-capture-pipeline/  ← X link extraction pipeline
├── hivemind-intake/           ← Client intake system
├── realistic-ai-video-prompting/ ← Video generation/editing
├── ad-creative/                ← Ad creative
├── competitor-alternatives/     ← Competitor research
└── [context-consolidation, ai-seo, copywriting, copy-editing]
```

**Herminho gets:**

```
skills/
├── hermes-setup/              ← Agent bootstrap procedure
├── hermes-vault-compiler/     ← Vault compilation + validation
├── hermes-operator-maintenance/ ← Fleet ops maintenance
├── discord-hermes-kanban-orchestration/ ← Kanban/handoff system
├── hermes-task-gate-operations/ ← Task gate operations
├── council/                    ← Council protocol
├── hivemind-intake/           ← Client intake
├── hivemind-compliance/       ← Compliance knowledge
├── hivemind-seo-standard/     ← SEO standard
├── hivemind-website-standard/  ← Website standard
└── [n8n, skill-graph, learning-capture-pipeline]
```

---

## Layer 6: Operational Infrastructure

**Herminho gets full ops tooling:**

```
vaults/hermes-agent-system/
├── _tools/                    ← Validation tools (wikilinks, secrets, manifest)
├── ops/
│   ├── hermes-vault-compiler/
│   ├── hermes-operator-maintenance/
│   ├── hermes-task-gate-operations/
│   └── discord-hermes-kanban-orchestration/
├── templates/
│   ├── SOURCE-MANIFEST.md     ← Source-backed note discipline
│   ├── CONTEXT-PACK.md
│   ├── DECISION.md
│   └── PERSON.md
└── multi-agent/              ← Multi-agent patterns
```

**Clawdinho gets essential ops only:**

```
scripts/
├── sync-memory/               ← Memory sync script
└── [any custom scripts from our scripts/ directory]
```

---

## Vault Validation Standard

Both vaults use the **Hermes SOURCE-MANIFEST discipline:**

1. Every durable note has source attribution
2. Wikilinks must resolve (run `check-wikilinks.sh`)
3. No secrets in vault (run `check-secrets.sh`)
4. SOURCE-MANIFEST.md tracks all sourced notes

**Validation before any vault commit:**
```bash
cd $AGENT_VAULT
./vaults/hermes-agent-system/_tools/run-all.sh
```

---

## Deployment Architecture

```
                    ┌─────────────────┐
                    │     Mac Mini    │
                    │                 │
                    │  ┌───────────┐  │
                    │  │Clawdinho  │  │
                    │  │  Vault    │  │
                    │  └───────────┘  │
                    │                 │
                    │  ┌───────────┐  │
                    │  │ Herminho  │  │
                    │  │  Vault    │  │
                    │  └───────────┘  │
                    │                 │
                    │  ┌───────────┐  │
                    │  │ Beastmode │  │
                    │  │  Vault    │  │
                    │  └───────────┘  │
                    └─────────────────┘
```

**Sync strategy:**
- Each vault is a git repository
- Clawdinho vault: `vaults/clients/clawdinho-vault/`
- Herminho vault: `vaults/clients/herminho-vault/`
- Master knowledge base: shared, agents pull from it
- Deployment: push to Mac Mini via git

---

## What's NOT Synced (Too Noisy/Perishable)

These live ONLY in Beastmode's master vault:

- `memory/YYYY-MM-DD*.md` — raw daily logs (too many, too noisy)
- `learnings-*.md` — context flush learnings (operational noise)
- `leads tracking.md` — active pipeline (too sensitive)
- `DREAMS.md` — personal dreams
- `OPERATIONS-RUNBOOK*.md` — very long operational docs
- `*.webp`, `*.png` — media files
- `backups/`, `logs/`, `downloads/` — operational detritus

---

## Vault Audit Summary

| Component | Beastmode (Master) | Clawdinho | Herminho |
|-----------|-------------------|-----------|----------|
| Core OS Files | ✅ FULL | ✅ FULL | ✅ FULL |
| Agent Directory | ✅ FULL | ✅ SLICE | ✅ SLICE |
| HiveMind Projects | ✅ FULL | ✅ FULL | ✅ FULL |
| All Clients | ✅ FULL | READ-ONLY | READ-ONLY |
| Knowledge Base | ✅ FULL | ✅ FULL | ✅ FULL |
| Hermes System | READ-ONLY | — | ✅ FULL |
| Ops Tools | ✅ FULL | ESSENTIAL | ✅ FULL |
| Skills | ✅ ALL | SELECTED | SELECTED |
| Daily Logs | ✅ FULL | — | — |
| Leads/Pipeline | ✅ FULL | — | — |
| Media/Raw | ✅ FULL | — | — |

---

## Next Steps

1. **Deploy** — Push vault templates to Mac Mini
2. **Validate** — Run `run-all.sh` on each vault
3. **Configure** — Point each agent's openclaw workspace to their vault
4. **Test** — Verify each agent boots with correct context
5. **Monitor** — Use hermes-operator-maintenance for fleet health

---

*Fleet vault audit — HiveMind Intelligence | 2026-08-29*
