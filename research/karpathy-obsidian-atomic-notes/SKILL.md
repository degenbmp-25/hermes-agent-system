---
name: "karpathy-obsidian-atomic-notes"
description: "Split raw notes into atomic Obsidian Markdown notes with filenames, wikilinks, and one concept per file. Use when turning messy notes, transcripts, research dumps, or brainstorms into a connected local knowledge graph."
---

# karpathy-obsidian-atomic-notes

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/EXM7777/status/2051724113266590075

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Create a useful wikilink graph without building a vector/RAG system for every note dump.

## Procedure

1. Read the raw note and identify distinct reusable concepts.
2. Search the vault for existing notes before creating new atomic files.
3. Create one note per concept with a descriptive filename and concise title.
4. Use wikilinks only for real relationships, not keyword spam.
5. Preserve the raw source note or link back to it from each atomic note.
6. Add minimal frontmatter if the vault uses properties.
7. Run wikilink validation after writing.
8. Return an index of created/updated notes.

## Outputs

- Atomic Markdown notes
- Wikilinked concept graph
- Created/updated note index

## Validation

- Each note contains one primary concept.
- Wikilinks resolve or are intentionally new.
- The raw source can be traced from the atomic notes.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
