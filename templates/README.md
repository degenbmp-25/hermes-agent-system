# Vault Templates

Structured note templates for maintaining a source-backed, auditable memory vault.

## Templates

| Template | Purpose | When to Use |
|---------|---------|-------------|
| `SOURCE-MANIFEST.md` | Track all sourced notes | Create at vault root, maintain continuously |
| `PERSON.md` | Person records | When documenting someone you interact with or research |
| `DECISION.md` | Decision logs | When making important decisions with rationale |
| `CONTEXT-PACK.md` | Grouped knowledge | When consolidating knowledge on a topic |

## Usage

Copy a template to your vault and customize it:

```bash
# Example: Creating a person record
cp templates/PERSON.md people/jane-doe.md
# Edit the file with actual content

# Example: Creating a decision
cp templates/DECISION.md decisions/2026-06-22-architecture-choice.md
# Edit with your decision context
```

## Adding to SOURCE-MANIFEST

After creating a sourced note, add it to `SOURCE-MANIFEST.md`:

```bash
./_tools/check-source-manifest.sh add path/to/note.md
```

Or manually add the entry following the format in `SOURCE-MANIFEST.md`.

## Customizing Templates

These templates are starting points. Customize them to fit your workflow:

- Add fields that are important to your use case
- Remove fields you don't need
- Adjust formatting to match your preferences
- Add vault-specific conventions

## Template Principles

1. **Source citations required** — Every template has a source field
2. **Confidence levels** — Explicitly rate your confidence in the information
3. **Metadata in frontmatter** — Use frontmatter for structured, queryable data
4. **Structured body** — Use consistent headings for easy navigation
5. **Relationships via wikilinks** — Connect related notes explicitly

## Related

- `../ops/hermes-vault-compiler/SKILL.md` — The vault compiler workflow skill
- `../_tools/` — Validation tooling for vault integrity
- `../_tools/README.md` — Documentation for validation scripts
