# Hermes Skill Library — Master Export
## HiveMind Intelligence — Hermes Instance Handoff Document

**Generated:** 2026-06-13  
**Source:** BeastmodeVault/hermes-skill-library  
**Purpose:** Complete skill inventory for spawning Hermes instances with full capability context

---

## 📦 What's Included

This library contains **22 skillified Hermes/OpenClaw skills** extracted from X posts, ranked and organized for deployment. Each skill is a complete SKILL.md ready to drop into a Hermes instance's `skills/` directory.

---

## 🎯 Latest Assessment Results (2026-06-13)

| Source File | Score | Decision | Output |
|-------------|-------|----------|--------|
| 2026-04-01-super-self-improving-multi-agent-framework.md | 6/10 | ❌ Skipped | skipped-notes.md |
| 2026-05-17-shann-hermes-company-multi-instance.md | 8/10 | ✅ Skillified | shann-hermes-multi-instance.md |
| 2026-04-01-x-witcheer-hermes-agent-v0-6-profiles-mcp.md | 7/10 | ✅ Skillified | witcheer-hermes-profiles-mcp.md |
| 2026-04-11-x-sharbel-hermes-hudui-persistent-memory-dashboard.md | 7/10 | ✅ Skillified | sharbel-hermes-hudui-memory-dashboard.md |

### Why Each Decision

**Skipped (6/10):** The super-self-improving framework is a general multi-agent QA pattern (Builder + Internal QA + External QA) — useful for HiveMind deliverables but not Hermes-specific. Already covered by existing QA skills. Belongs in the HiveMind library, not Hermes.

**Skillified (8/10):** Shann's multi-instance control pattern — CLI orchestrator controlling multiple Hermes instances. Concrete architecture, fast instantiation, directly applicable to anyone building a Hermes "company brain."

**Skillified (7/10):** Witcheer's Hermes v0.6.0 Profiles + MCP — essential isolation primitives for multi-agent Hermes deployments.

**Skillified (7/10):** Sharbel's hermes-hudui memory dashboard — real-time memory visibility for debugging and trust.

---

## 🧠 Master Skill Inventory

### SCORING LEGEND
- **9-10/10 CRABHAMMER:** Must-deploy. Core capability drivers.
- **7-8/10:** High value. Deploy to production instances.
- **5-6/10:** Useful but generic. Consider for specific use cases.
- **<5/10:** Skipped. Not Hermes-specific or already covered.

---

### 🏛️ ARCHITECTURE (1 skill)

| Skill | Score | Description |
|-------|-------|-------------|
| `shann-hermes-multi-instance` | 8/10 | CLI orchestrator controlling multiple Hermes instances — "company brain" pattern |

**Path:** `architecture/shann-hermes-multi-instance/SKILL.md`  
**Key Pattern:** Parallel workstreams (research, content, BD) with isolated instances, no context bleeding

---

### ⚙️ CORE (6 skills)

| Skill | Score | Description |
|-------|-------|-------------|
| `hermes-setup` | 9/10 | Greg Isenberg's step-by-step install: memory system, OpenRouter costs, 40+ skills, Obsidian/GStack |
| `hermes-7-new-features` | 8/10 | May 2026 update: session logging, background tasks, xAI/Grok OAuth, X posting/fetching, Codex CLI, AI video, Auto Kanban |
| `hermes-agent-maturity-levels` | 8/10 | 4-level maturity model: prototype → specialize → orchestrate → automate |
| `witcheer-hermes-profiles-mcp` | 7/10 | v0.6.0 Profiles (isolated configs/memory/sessions/skills) + MCP server mode |
| `hermes-security` | 7/10 | Cybersecurity hardening prompts, audit checklists, "audit-first" mindset |
| `session-auto-per-day-logging` | 7/10 | Auto-log sessions by date, natural language query ("what did we work on April 15th?") |

**Path:** `core/*/SKILL.md`

---

### 🔗 INTEGRATIONS (4 skills)

| Skill | Score | Description |
|-------|-------|-------------|
| `obsidian-openclaw-llm-wiki-rules` | 9/10 | Code Rams' 6 rules for LLM wiki discipline. "Obsidian is the IDE, LLM is the programmer, OpenClaw is the build system" |
| `obsidian-markdown` | 8/10 | Obsidian Flavored Markdown: wikilinks, embeds, callouts, properties, frontmatter |
| `obsidian-cli` | 7/10 | CLI interaction with Obsidian vaults: read, create, search, manage notes/tasks |
| `obsidian-bases` | 7/10 | Create/edit .base files with views, filters, formulas, summaries |

**Path:** `integrations/*/SKILL.md`

---

### 👥 MULTI-AGENT (3 skills)

| Skill | Score | Description |
|-------|-------|-------------|
| `hermes-multi-agent-team-profiles` | 10/10 | Neo's definitive guide: 4-role team (orchestrator/research/writer/engineer). "Stop trying to make one agent do everything. Build a team." |
| `hermes-operator-layer` | 10/10 | Nyk's maintenance/governance for 4-profile teams past day 30. Handoff contracts, memory-KPI audits, policy ceilings |
| `hermes-full-architecture-task-gate-review` | 8/10 | JUMPERZ's dual-mode operation (/task gate + chat), domain ownership, review gate, Spark learning loop |

**Path:** `multi-agent/*/SKILL.md`

---

### 🛠️ OPS & GOVERNANCE (4 skills)

| Skill | Score | Description |
|-------|-------|-------------|
| `discord-hermes-kanban-orchestration` | 8/10 | Plain English → Discord coordinator → Hermes Kanban → Agent → Result. Discord = conversation layer, Kanban = ledger |
| `sharbel-hermes-hudui-memory-dashboard` | 7/10 | Real-time memory monitoring: active memory, goals, session history, corruption detection |
| `hermes-operator-layer` | 10/10 | (duplicate in ops/ — same content, different category routing) |
| `hermes-full-architecture-task-gate-review` | 8/10 | (duplicate in ops/ — same content, different category routing) |

**Path:** `ops/*/SKILL.md`

---

### 🔬 RESEARCH (4 skills)

| Skill | Score | Description |
|-------|-------|-------------|
| `obsidian-unlimited-context` | 10/10 | Remove Claude Projects' ceiling — no upload cap, local files, full company knowledge base |
| `naithan-jones-hermes-agent-for-adhd` | 9/10 | Personal productivity system for ADHD: speech capture, life priorities, daily briefings, proactive nudges |
| `cyrilxbt-obsidian-hermes-research-converter` | 8/10 | Convert research material into structured permanent notes connected to vault knowledge |
| `karpathy-obsidian-atomic-notes` | 8/10 | Atomic notes method: dissect raw notes into atomic .md files with wikilinks. No RAG, no vectors, $0 |

**Path:** `research/*/SKILL.md`

---

## 📊 Score Distribution

```
10/10 CRABHAMMER:  3 skills  ████████████████████ 14%
 9/10 CRABHAMMER:  2 skills  ████████████         10%
 8/10:            9 skills  ████████████████████████████████████████ 43%
 7/10:            6 skills  ████████████████████████████            29%
 6/10 (skipped):  1 skill   ██████                          5%
───────────────── ────────
Total:           22 skills
```

---

## 🚀 Quick Import Commands

```bash
# Setup
HERMES_SKILLS=~/.openclaw/workspace/skills
LIBRARY=~/BeastmodeVault/vaults/hermes-skill-library

# === ALL CRABHAMMER (9-10/10) — Start Here ===
cp -r $LIBRARY/multi-agent/hermes-multi-agent-team-profiles $HERMES_SKILLS/
cp -r $LIBRARY/multi-agent/hermes-operator-layer $HERMES_SKILLS/
cp -r $LIBRARY/research/obsidian-unlimited-context $HERMES_SKILLS/
cp -r $LIBRARY/research/naithan-jones-hermes-agent-for-adhd $HERMES_SKILLS/
cp -r $LIBRARY/core/hermes-setup $HERMES_SKILLS/
cp -r $LIBRARY/integrations/obsidian-openclaw-llm-wiki-rules $HERMES_SKILLS/

# === CORE (Level 1 setup) ===
cp -r $LIBRARY/core/hermes-7-new-features $HERMES_SKILLS/
cp -r $LIBRARY/core/hermes-agent-maturity-levels $HERMES_SKILLS/
cp -r $LIBRARY/core/witcheer-hermes-profiles-mcp $HERMES_SKILLS/
cp -r $LIBRARY/core/hermes-security $HERMES_SKILLS/
cp -r $LIBRARY/core/session-auto-per-day-logging $HERMES_SKILLS/

# === MULTI-AGENT (Level 2+) ===
cp -r $LIBRARY/multi-agent/hermes-full-architecture-task-gate-review $HERMES_SKILLS/

# === OPS & GOVERNANCE ===
cp -r $LIBRARY/ops/discord-hermes-kanban-orchestration $HERMES_SKILLS/
cp -r $LIBRARY/ops/sharbel-hermes-hudui-memory-dashboard $HERMES_SKILLS/

# === INTEGRATIONS ===
cp -r $LIBRARY/integrations/obsidian-bases $HERMES_SKILLS/
cp -r $LIBRARY/integrations/obsidian-cli $HERMES_SKILLS/
cp -r $LIBRARY/integrations/obsidian-markdown $HERMES_SKILLS/

# === RESEARCH ===
cp -r $LIBRARY/research/cyrilxbt-obsidian-hermes-research-converter $HERMES_SKILLS/
cp -r $LIBRARY/research/karpathy-obsidian-atomic-notes $HERMES_SKILLS/

# === ARCHITECTURE ===
cp -r $LIBRARY/architecture/shann-hermes-multi-instance $HERMES_SKILLS/
```

---

## 📁 Full Directory Structure

```
hermes-skill-library/
├── HERMES_MASTER_EXPORT.md          ← You are here
├── QUICK-IMPORT.md                  ← Import commands by maturity level
├── new-skills-needed.md             ← Pipeline for future extraction
├── x-sources/
│   └── SOURCES.md                   ← All X source links
├── architecture/
│   └── shann-hermes-multi-instance/
│       └── SKILL.md                 (8/10)
├── core/
│   ├── hermes-7-new-features/      (8/10)
│   ├── hermes-agent-maturity-levels/ (8/10)
│   ├── hermes-security/             (7/10)
│   ├── hermes-setup/               (9/10)
│   ├── session-auto-per-day-logging/ (7/10)
│   └── witcheer-hermes-profiles-mcp/ (7/10)
├── integrations/
│   ├── obsidian-bases/             (7/10)
│   ├── obsidian-cli/                (7/10)
│   ├── obsidian-markdown/           (8/10)
│   └── obsidian-openclaw-llm-wiki-rules/ (9/10)
├── multi-agent/
│   ├── hermes-full-architecture-task-gate-review/ (8/10)
│   ├── hermes-multi-agent-team-profiles/ (10/10)
│   └── hermes-operator-layer/       (10/10)
├── ops/
│   ├── discord-hermes-kanban-orchestration/ (8/10)
│   ├── hermes-full-architecture-task-gate-review/ (8/10)
│   ├── hermes-operator-layer/       (10/10)
│   └── sharbel-hermes-hudui-memory-dashboard/ (7/10)
└── research/
    ├── cyrilxbt-obsidian-hermes-research-converter/ (8/10)
    ├── karpathy-obsidian-atomic-notes/ (8/10)
    ├── naithan-jones-hermes-agent-for-adhd/ (9/10)
    └── obsidian-unlimited-context/  (10/10)
```

---

## 🔒 Skipped Notes

| File | Score | Reason |
|------|-------|--------|
| `2026-04-01-super-self-improving-multi-agent-framework.md` | 6/10 | General multi-agent QA pattern (Builder + Internal QA + External QA). Useful for HiveMind deliverables but not Hermes-specific. Already covered by existing QA skills. Belongs in HiveMind library, not Hermes. |

---

## 🎓 Maturity Level Deployment Guide

### Level 1: Prototype
Start here. One agent, basic setup.
```bash
cp -r $LIBRARY/core/hermes-setup $HERMES_SKILLS/
cp -r $LIBRARY/core/hermes-agent-maturity-levels $HERMES_SKILLS/
cp -r $LIBRARY/integrations/obsidian-markdown $HERMES_SKILLS/
```

### Level 2: Specialize
Add role specialization with profiles.
```bash
cp -r $LIBRARY/multi-agent/hermes-multi-agent-team-profiles $HERMES_SKILLS/
cp -r $LIBRARY/core/witcheer-hermes-profiles-mcp $HERMES_SKILLS/
cp -r $LIBRARY/research/naithan-jones-hermes-agent-for-adhd $HERMES_SKILLS/
```

### Level 3: Orchestrate
Multi-agent coordination and ops layer.
```bash
cp -r $LIBRARY/multi-agent/hermes-operator-layer $HERMES_SKILLS/
cp -r $LIBRARY/multi-agent/hermes-full-architecture-task-gate-review $HERMES_SKILLS/
cp -r $LIBRARY/ops/discord-hermes-kanban-orchestration $HERMES_SKILLS/
```

### Level 4: Automate
Full autonomous operation with governance.
```bash
# All of the above + hermes-hudui for monitoring
cp -r $LIBRARY/ops/sharbel-hermes-hudui-memory-dashboard $HERMES_SKILLS/
cp -r $LIBRARY/architecture/shann-hermes-multi-instance $HERMES_SKILLS/
```

---

## 📋 For New Hermes Instances

When spinning up a new Hermes instance for HiveMind:

1. **Copy this entire library** to the instance's `skills/` directory
2. **Select by maturity level** using the commands above
3. **Customize SOUL.md** for the instance's role (research, content, BD, etc.)
4. **Configure profiles** using `witcheer-hermes-profiles-mcp` if running multi-agent
5. **Set up memory** using `hermes-setup` and `obsidian-openclaw-llm-wiki-rules`
6. **Add governance** using `hermes-operator-layer` for long-term coherence

---

*Last updated: 2026-06-13*  
*Maintained by: Clawdaunt 🦞 for HiveMind Intelligence*
