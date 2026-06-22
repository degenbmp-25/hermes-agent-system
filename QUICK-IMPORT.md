# Hermes Skill Library — Quick Import Reference

Copy individual skills to your Hermes setup with these commands:

```bash
HERMES_SKILLS=~/.openclaw/workspace/skills
LIBRARY=~/BeastmodeVault/vaults/hermes-skill-library

# === CORE (Start Here) ===
cp -r $LIBRARY/core/hermes-7-new-features $HERMES_SKILLS/
cp -r $LIBRARY/core/hermes-agent-maturity-levels $HERMES_SKILLS/

# === MULTI-AGENT (Level 2+) ===
cp -r $LIBRARY/multi-agent/hermes-multi-agent-team-profiles $HERMES_SKILLS/
cp -r $LIBRARY/multi-agent/hermes-operator-layer $HERMES_SKILLS/
cp -r $LIBRARY/multi-agent/hermes-full-architecture-task-gate-review $HERMES_SKILLS/

# === RESEARCH & KNOWLEDGE ===
cp -r $LIBRARY/research/cyrilxbt-obsidian-hermes-research-converter $HERMES_SKILLS/
cp -r $LIBRARY/research/naithan-jones-hermes-agent-for-adhd $HERMES_SKILLS/
cp -r $LIBRARY/research/karpathy-obsidian-atomic-notes $HERMES_SKILLS/

# === OPS & GOVERNANCE ===
cp -r $LIBRARY/ops/hermes-operator-layer $HERMES_SKILLS/
cp -r $LIBRARY/ops/hermes-full-architecture-task-gate-review $HERMES_SKILLS/
cp -r $LIBRARY/ops/discord-hermes-kanban-orchestration $HERMES_SKILLS/

# === INTEGRATIONS ===
cp -r $LIBRARY/integrations/obsidian-bases $HERMES_SKILLS/
cp -r $LIBRARY/integrations/obsidian-cli $HERMES_SKILLS/
cp -r $LIBRARY/integrations/obsidian-markdown $HERMES_SKILLS/
```

---

## By Maturity Level

### Level 1: Prototype
```bash
cp -r $LIBRARY/core/hermes-7-new-features $HERMES_SKILLS/
cp -r $LIBRARY/core/hermes-agent-maturity-levels $HERMES_SKILLS/
```

### Level 2: Specialize
```bash
cp -r $LIBRARY/multi-agent/hermes-multi-agent-team-profiles $HERMES_SKILLS/
cp -r $LIBRARY/research/naithan-jones-hermes-agent-for-adhd $HERMES_SKILLS/
```

### Level 3: Orchestrate
```bash
cp -r $LIBRARY/multi-agent/hermes-operator-layer $HERMES_SKILLS/
cp -r $LIBRARY/multi-agent/hermes-full-architecture-task-gate-review $HERMES_SKILLS/
cp -r $LIBRARY/ops/discord-hermes-kanban-orchestration $HERMES_SKILLS/
```

### Level 4: Automate
```bash
# All of the above + cron coordination (see hermes-operator-layer/cron.md)
```

---

## Full Import (Everything)
```bash
cp -r $LIBRARY/core/* $HERMES_SKILLS/
cp -r $LIBRARY/multi-agent/* $HERMES_SKILLS/
cp -r $LIBRARY/research/* $HERMES_SKILLS/
cp -r $LIBRARY/ops/* $HERMES_SKILLS/
cp -r $LIBRARY/integrations/* $HERMES_SKILLS/
```

---

*Last updated: 2026-06-12*
