# SOURCE-MANIFEST

This file tracks all source-backed notes in the vault. Every entry here represents a note that has been validated, is auditable, and has a traceable source.

**Purpose:** A memory vault without sources is a rumor engine. This manifest ensures every piece of agent knowledge can be traced back to a source and verified by a human.

## Manifest Format

Each entry should follow this format:

```markdown
## [Note Title]

- **Path:** `path/to/note.md`
- **Type:** person | decision | context-pack | reference | project
- **Source:** URL or citation
- **Date:** YYYY-MM-DD (when note was created)
- **Confidence:** high | medium | low
- **Last Validated:** YYYY-MM-DD
```

## Entry Types

| Type | Description | Example |
|------|-------------|---------|
| `person` | Person record with background and attributes | `people/jane-doe.md` |
| `decision` | Decision log with rationale | `decisions/2026-06-22-vault-structure.md` |
| `context-pack` | Grouped knowledge on a topic | `context/llm-context-windows.md` |
| `reference` | Source-backed reference material | `references/ai-terminology.md` |
| `project` | Project-specific context | `projects/website-redesign.md` |

## Confidence Levels

| Level | Meaning | When to Use |
|-------|---------|--------------|
| `high` | Primary source, verified | Direct quotes, official docs, first-hand accounts |
| `medium` | Secondary source, likely accurate | Summaries of primary sources, indirect evidence |
| `low` | Unverified or disputed | Hearsay, old information, conflicting sources |

## Maintenance

- **Validate entries monthly** — Run `../_tools/check-source-manifest.sh check` to verify entries
- **Update confidence** — Re-assess confidence when sources become stale
- **Archive superseded** — Mark old decisions as superseded rather than deleting

---

## Sourced Notes

<!-- Add entries below -->

---

## Validation Log

| Date | Action | Validator |
|------|--------|-----------|
| YYYY-MM-DD | Initial manifest created | [Name] |
