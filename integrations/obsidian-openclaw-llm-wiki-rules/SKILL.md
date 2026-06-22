---
name: "obsidian-openclaw-llm-wiki-rules"
description: "Set up or repair an Obsidian-backed LLM wiki maintained by OpenClaw/Hermes agents. Use when creating knowledge-base taxonomy, enforcing search-before-write, source attribution, backlinks, contradiction handling, or single-vault discipline."
---

# obsidian-openclaw-llm-wiki-rules

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://x.com/code_rams/status/2048488925296029705

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Turn agent-written notes into a maintainable wiki with rules that prevent duplicate, unsourced, and contradictory knowledge.

## Procedure

1. Define a small fixed taxonomy before agents write: people, projects, decisions, context packs, references, or the user's chosen equivalents.
2. Require search-before-write: search filenames and content before creating a new note.
3. Require source fields for factual claims imported from external material.
4. When adding a note, add backlinks or related links to at least one existing note when a real relationship exists.
5. Flag contradictions explicitly instead of overwriting older claims silently.
6. Keep one canonical vault for a domain; avoid split-brain copies unless there is a sync plan.
7. Run validation for broken wikilinks, source manifest entries, and secret leakage.

## Outputs

- Wiki rules file
- Taxonomy map
- Contradiction/source checklist

## Validation

- A new note can be classified into exactly one primary type.
- Duplicate note creation is prevented by search.
- Source-backed notes have traceable provenance.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
