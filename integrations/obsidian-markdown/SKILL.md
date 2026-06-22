---
name: "obsidian-markdown"
description: "Create and edit Obsidian-flavored Markdown with wikilinks, embeds, callouts, frontmatter/properties, tags, headings, tasks, and internal anchors. Use when writing or refactoring `.md` notes for Obsidian vaults."
---

# obsidian-markdown

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://help.obsidian.md/syntax

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Produce Markdown that works well inside Obsidian rather than generic Markdown only.

## Procedure

1. Preserve existing frontmatter keys unless the user asks to change them.
2. Use wikilinks for internal vault concepts and normal Markdown links for external URLs.
3. Prefer one concept per note when creating durable knowledge.
4. Use callouts only when they add scannable structure, not decoration.
5. Escape pipes and special characters inside tables or avoid tables when list structure is clearer.
6. Use embeds with `![[...]]` for notes, headings, images, PDFs, audio, and other vault-local assets.
7. Place block IDs carefully: inline after a paragraph, or on a separate line after list/quote blocks.
8. Check that new wikilinks either resolve or are intentionally creating new notes.
9. Keep source/provenance fields when notes are derived from external material.

## Outputs

- Obsidian-compatible Markdown
- Wikilink/provenance notes
- Any unresolved-link warnings

## Validation

- Frontmatter parses as YAML when present.
- Wikilinks match intended note names.
- Embeds point to vault-local files or valid note subpaths.
- The note is readable in plain Markdown and useful in Obsidian.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
