---
type: skill
name: hermes-vault-compiler
description: Source-backed validated agent memory vault workflow — vault structure, SOURCE-MANIFEST discipline, structured note formats (People, Decisions, Context Packs), and validation tooling for wikilinks, broken links, and secret leaks. Compiler pattern for maintaining a trustworthy, auditable memory system.
date: 2026-06-22
author: BeastmodeVault
source: https://github.com/degenbmp-25/hermes-agent-system
salience: 0.95
tags: [hermes, vault, memory, source-backed, validation, wikilinks, secrets, compiler, structured-notes, SOURCE-MANIFEST]
---

# Hermes Vault Compiler Skill

**Core principle:** A memory vault without sources is a rumor engine. Every piece of agent knowledge should be traceable to a source, auditable by a human, and validatable by tooling. This skill is the workflow that makes a Hermes memory vault trustworthy rather than just large.

**What it does:** Formalizes vault structure, structured note formats, SOURCE-MANIFEST discipline, and provides validation tooling that runs locally. The compiler pattern ensures memory entries are source-backed before they enter the permanent context layer.

---

## When to Use

- **Starting a new vault** — Establish the folder structure and templates from day one
- **Auditing existing memory** — Check what's source-backed vs. hallucinated context
- **Onboarding a new agent/profile** — Give it the vault structure and validation tools
- **Before major compilations** — Run validation checks before pushing context to the compiler
- **Weekly memory hygiene** — Run the full validation suite to catch rot early

---

## The Vault Structure

```
vault/
├── .claud/
│   └── (profile state — not committed)
├── _tools/                    # Validation tooling (this repo's _tools/)
│   ├── check-wikilinks.sh
│   ├── check-source-manifest.sh
│   ├── check-secrets.sh
│   └── run-all.sh
├── templates/                 # Structured note templates
│   ├── SOURCE-MANIFEST.md
│   ├── PERSON.md
│   ├── DECISION.md
│   └── CONTEXT-PACK.md
├── memory/                    # Agent's curated long-term memory
│   ├── MEMORY.md             # Primary memory entry point
│   └── YYYY-MM-DD.md         # Daily session logs
├── people/                   # Person records
│   └── [person-name].md
├── decisions/                # Decision logs with rationale
│   └── YYYY-MM-DD-[slug].md
├── context/                  # Context packs (grouped knowledge)
│   └── [context-pack-name]/
├── references/               # Source-backed reference material
│   └── [topic]/
├── projects/                 # Project-specific context
│   └── [project]/
└── daily/                    # Daily notes
    └── YYYY-MM-DD.md
```

---

## The Compiler Workflow

### Phase 1: Capture (Source-First)

When a new piece of knowledge enters the vault:

1. **Source it immediately** — Every note should cite its source at creation time
2. **Use structured templates** — People, Decisions, Context Packs have defined formats
3. **Add to SOURCE-MANIFEST** — Track every sourced note in the manifest

```bash
# Example: Capturing a decision
cp templates/DECISION.md decisions/2026-06-22-vault-structure.md
# Edit the file, fill in rationale and source
./_tools/check-source-manifest.sh add decisions/2026-06-22-vault-structure.md
```

### Phase 2: Validate

Before any note enters permanent memory, validate it:

```bash
# Run all validation checks
cd /path/to/vault
./_tools/run-all.sh

# Or run individual checks
./_tools/check-wikilinks.sh
./_tools/check-source-manifest.sh
./_tools/check-secrets.sh
```

**Validation gates:**
- No broken wikilinks
- No secret leaks (API keys, tokens, passwords)
- SOURCE-MANIFEST entry exists and is well-formed
- Note uses the correct template format

### Phase 3: Compile

After validation, the note is ready for the memory compiler:

1. The note is source-backed and auditable
2. It has a SOURCE-MANIFEST entry
3. It passes all validation checks
4. It can now be trusted by the agent's memory system

---

## Structured Note Formats

### SOURCE-MANIFEST Entry

Every sourced note must have an entry in `templates/SOURCE-MANIFEST.md`:

```markdown
## [Note Name]

- **Path:** `path/to/note.md`
- **Type:** person | decision | context-pack | reference | project
- **Source:** URL or citation
- **Date:** YYYY-MM-DD
- **Confidence:** high | medium | low
- **Last Validated:** YYYY-MM-DD
```

### PERSON Template

For people records:

```markdown
---
type: person
name: [Full Name]
role: [Role/Title]
source: [Where you learned about this person]
date: YYYY-MM-DD
confidence: high | medium | low
aliases: [other names, nicknames]
tags: [relevant, tags]
---

# [Name]

## Background
[Who this person is, their context]

## Key Attributes
- **[Attribute]:** [Description]

## Source
> "[Quote or citation]" — [Source URL]

## Related Decisions
- [[decision-name]]

## Notes
[Additional context, impressions, caveats]
```

### DECISION Template

For decision records:

```markdown
---
type: decision
title: [Decision Title]
date: YYYY-MM-DD
status: accepted | rejected | pending | superseded
source: [Context for this decision]
confidence: high | medium | low
tags: [relevant, tags]
---

# Decision: [Title]

## Context
[What prompted this decision]

## Options Considered
1. **[Option A]:** [Description]
2. **[Option B]:** [Description]

## Decision
[What was decided and why]

## Rationale
[Key reasons supporting this decision]

## Source
> "[Quote or citation if applicable]" — [Source]

## Consequences
- **Positive:** [Expected benefits]
- **Negative:** [Known trade-offs]

## Superseded By
[[link-to-newer-decision-if-applicable]]

## Related
- [[related-note]]
```

### CONTEXT-PACK Template

For context packs (grouped knowledge on a topic):

```markdown
---
type: context-pack
name: [Context Pack Name]
date: YYYY-MM-DD
source: [Primary source or aggregation source]
confidence: high | medium | low
tags: [topic, related, tags]
---

# [Context Pack Name]

## Summary
[One-paragraph summary of what this context pack covers]

## Key Concepts

### [Concept 1]
[Explanation with source]

### [Concept 2]
[Explanation with source]

## Source References
- [Source 1](URL)
- [Source 2](URL)

## Related Context Packs
- [[other-context-pack]]

## Notes
[Caveats, limitations, things to verify]
```

---

## Validation Tooling

The `_tools/` directory contains validation scripts that run locally:

### check-wikilinks.sh
Checks for broken wikilinks in the vault. Wikilinks should resolve to existing files.

```bash
./_tools/check-wikilinks.sh [vault-path]
# Exit code 0 = all links valid
# Exit code 1 = broken links found (output lists them)
```

### check-source-manifest.sh
Validates SOURCE-MANIFEST entries. Every sourced note should be in the manifest.

```bash
# Check manifest
./_tools/check-source-manifest.sh check [vault-path]

# Add entry
./_tools/check-source-manifest.sh add path/to/note.md

# List missing entries (notes that exist but aren't in manifest)
./_tools/check-source-manifest.sh list-missing [vault-path]
```

### check-secrets.sh
Scans for potential secret leaks — API keys, tokens, passwords in plain text.

```bash
./_tools/check-secrets.sh [vault-path]
# Exit code 0 = no secrets found
# Exit code 1 = potential secrets detected (output highlights them)
```

### run-all.sh
Runs all validation checks in sequence.

```bash
./_tools/run-all.sh [vault-path]
# Reports results for all checks
```

---

## The Memory Compilation Cycle

### Daily (Low Frequency)

1. Review daily notes
2. Flag notes that need SOURCE-MANIFEST entries
3. Run `check-wikilinks.sh` to catch new broken links

### Weekly (Medium Frequency)

1. Run full validation suite: `run-all.sh`
2. Audit SOURCE-MANIFEST for stale entries
3. Review decisions for superseded entries
4. Verify confidence levels are still accurate

### Monthly (High Frequency)

1. Full vault audit
2. Check for "memory rot" — notes that were true once but are now stale
3. Update confidence levels based on recency
4. Archive or delete obsolete notes
5. Verify all sources are still accessible

---

## Anti-Patterns

❌ **No SOURCE-MANIFEST** — Memory becomes a rumor engine with no traceability
❌ **Wikilinks to deleted files** — Broken links compound silently over time
❌ **Secrets in vault** — API keys and tokens that should never be shared
❌ **Unstructured notes** — Notes without templates are hard to query and audit
❌ **No validation cadence** — Issues caught late are harder to fix
❌ **Confidence without source** — If you don't know the source, confidence should be "low"

---

## Setup

1. **Copy `_tools/` to your vault root:**
   ```bash
   cp -r hermes-agent-system/_tools /path/to/your-vault/
   chmod +x /path/to/your-vault/_tools/*.sh
   ```

2. **Copy `templates/` to your vault:**
   ```bash
   cp -r hermes-agent-system/templates /path/to/your-vault/
   ```

3. **Initialize SOURCE-MANIFEST:**
   ```bash
   cp templates/SOURCE-MANIFEST.md /path/to/your-vault/SOURCE-MANIFEST.md
   # Edit to match your vault name and purpose
   ```

4. **Create vault folders:**
   ```bash
   mkdir -p memory people decisions context references projects daily
   ```

5. **Run initial validation:**
   ```bash
   cd /path/to/your-vault
   ./_tools/run-all.sh
   ```

---

## Related Skills

- [[hermes-operator-layer]] — Governance and maintenance for multi-profile teams
- [[sharbel-hermes-hudui-memory-dashboard]] — Real-time memory monitoring
- [[hermes-multi-agent-team-profiles]] — Multi-profile setup
- [[karpathy-obsidian-atomic-notes]] — Atomic note principles

---

*Source it, validate it, compile it. A vault without sources is a rumor engine.*

*Validation tooling makes trust auditable and scalable.*

---

**Source:** hermes-agent-system template
**Category:** ops
**Templates:** templates/SOURCE-MANIFEST.md, templates/PERSON.md, templates/DECISION.md, templates/CONTEXT-PACK.md
**Tools:** _tools/check-wikilinks.sh, _tools/check-source-manifest.sh, _tools/check-secrets.sh, _tools/run-all.sh
