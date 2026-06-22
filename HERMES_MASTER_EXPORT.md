# Hermes Agent System — Master Export

## HiveMind Intelligence — Hermes Instance Handoff

**Generated:** 2026-06-13
**Corrected:** 2026-06-22
**Repository:** `degenbmp-25/hermes-agent-system`

---

## Important Correction

Earlier versions of this export described the X-derived notes as installable skills. That was too loose.

Most files named `SKILL.md` in this repository are source-backed research/reference notes created from external posts. They are useful to read, but they do not define executable tools, schemas, install commands, or runtime behavior that Hermes/OpenClaw can act on.

Default runtime installation is now restricted to the one BeastmodeVault-authored capability:

```text
ops/hermes-vault-compiler/SKILL.md
```

---

## Tier 1: Installable Runtime Capability

| Skill | Author | Source | Why It Installs |
|-------|--------|--------|-----------------|
| `hermes-vault-compiler` | BeastmodeVault | `https://github.com/degenbmp-25/hermes-agent-system` | Defines a concrete vault structure and validation workflow with working tooling in `_tools/` |

Install:

```bash
HERMES_SKILLS=~/.openclaw/workspace/skills
LIBRARY=~/BeastmodeVault/vaults/hermes-agent-system

mkdir -p "$HERMES_SKILLS"
cp -r "$LIBRARY/ops/hermes-vault-compiler" "$HERMES_SKILLS/"
```

Or run:

```bash
./setup-agent.sh
```

---

## Tier 2: Read First, Do Not Install

Read these before committing to more runtime structure:

1. `core/hermes-agent-maturity-levels/SKILL.md`
2. `multi-agent/hermes-multi-agent-team-profiles/SKILL.md`
3. `multi-agent/hermes-operator-layer/SKILL.md`

These files are strategic framing material. They can inform decisions, but they should not be loaded as active runtime skills unless converted into BeastmodeVault-owned workflows first.

---

## Tier 3: Background Reference

Useful context:

- `core/hermes-setup/SKILL.md`
- `core/hermes-security/SKILL.md`
- `core/session-auto-per-day-logging/SKILL.md`
- `ops/discord-hermes-kanban-orchestration/SKILL.md`
- `core/hermes-7-new-features/SKILL.md`
- `core/witcheer-hermes-profiles-mcp/SKILL.md`
- `integrations/obsidian-openclaw-llm-wiki-rules/SKILL.md`
- `integrations/obsidian-markdown/SKILL.md`
- `integrations/obsidian-cli/SKILL.md`
- `integrations/obsidian-bases/SKILL.md`
- `architecture/shann-hermes-multi-instance/SKILL.md`
- `ops/sharbel-hermes-hudui-memory-dashboard/SKILL.md`
- `research/*/SKILL.md`
- `seo/*/SKILL.md`

These are provenance-preserved notes. Treat them like a research folder, not a runtime library.

---

## Promotion Rule

A reference note can become a real skill only after a BeastmodeVault-authored rewrite adds:

- trigger conditions
- concrete operating steps
- tool/runtime assumptions
- expected inputs and outputs
- validation commands
- source attribution

Until then, it remains reference material.

---

## Validation

Repository validation:

```bash
./_tools/run-all.sh
```

The vault compiler workflow uses:

- `_tools/check-source-manifest.sh`
- `_tools/check-wikilinks.sh`
- `_tools/check-secrets.sh`
- `templates/SOURCE-MANIFEST.md`
- `templates/PERSON.md`
- `templates/DECISION.md`
- `templates/CONTEXT-PACK.md`

---

## Source Provenance

External references are listed in:

```text
x-sources/SOURCES.md
```

Do not erase provenance. The correct fix is classification, not pretending the research was originally authored as runtime code.
