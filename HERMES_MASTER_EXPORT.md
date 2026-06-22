# Hermes Agent System — Master Export

## HiveMind Intelligence — Hermes Instance Handoff

**Generated:** 2026-06-13
**Corrected:** 2026-06-22
**Authored Skill Rewrite:** 2026-06-22
**Repository:** `degenbmp-25/hermes-agent-system`

---

## Current Status

The repository is now an authored Hermes/OpenClaw skill library.

Earlier versions stored many X-derived research notes as `SKILL.md` files. That was the wrong runtime shape. The files have now been rewritten as BeastmodeVault-authored operational skills with:

- trigger-focused descriptions
- concrete procedures
- expected outputs
- validation rules
- source provenance

Source links remain attribution and background. The installed skill bodies are not raw blog/post excerpts.

---

## Start Here

Install the library:

```bash
./setup-agent.sh
```

Recommended operating order for a new Hermes node:

1. `hermes-agent-maturity-levels`
2. `hermes-multi-agent-team-profiles`
3. `hermes-operator-layer`
4. `hermes-vault-compiler`

---

## Skill Inventory

### Architecture

- `shann-hermes-multi-instance`

### Core

- `hermes-7-new-features`
- `hermes-agent-maturity-levels`
- `hermes-security`
- `hermes-setup`
- `session-auto-per-day-logging`
- `witcheer-hermes-profiles-mcp`

### Integrations

- `defuddle`
- `json-canvas`
- `obsidian-bases`
- `obsidian-cli`
- `obsidian-markdown`
- `obsidian-openclaw-llm-wiki-rules`

### Multi-Agent

- `hermes-full-architecture-task-gate-review`
- `hermes-multi-agent-team-profiles`
- `hermes-operator-layer`

### Ops

- `discord-hermes-kanban-orchestration`
- `hermes-operator-maintenance`
- `hermes-task-gate-operations`
- `hermes-vault-compiler`
- `sharbel-hermes-hudui-memory-dashboard`

### Research Workflows

- `cyrilxbt-obsidian-hermes-research-converter`
- `karpathy-obsidian-atomic-notes`
- `naithan-jones-hermes-agent-for-adhd`
- `obsidian-unlimited-context`

### SEO

- `alexgroberman-seo-ai-mode`

---

## Authorship Rule

A sourced note becomes installable only after it is rewritten into an operational skill with:

- a clear trigger/use case
- concrete steps
- tool/runtime assumptions
- expected outputs
- validation checks
- source attribution

Do not install raw excerpts as skills.

---

## Validation

Repository validation:

```bash
./_tools/run-all.sh
git diff --check
```

Installer smoke test:

```bash
tmp=$(mktemp -d)
./setup-agent.sh --skills-dir "$tmp"
find "$tmp" -maxdepth 2 -name SKILL.md | sort
rm -rf "$tmp"
```

---

## Source Provenance

External references are listed in:

```text
x-sources/SOURCES.md
```

Keep provenance. Rewrite into authored workflows instead of erasing the sources.
