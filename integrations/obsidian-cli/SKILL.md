---
name: "obsidian-cli"
description: "Use the Obsidian CLI to read, create, search, update, and debug Obsidian vault content or plugins. Use when managing notes, tasks, properties, vault search, plugin reloads, screenshots, DOM inspection, or Obsidian automation from the command line."
---

# obsidian-cli

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://help.obsidian.md/cli

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Interact with a running Obsidian instance safely and repeatably from shell commands.

## Procedure

1. Check that Obsidian is running and the `obsidian` CLI is available.
2. Run `obsidian help` for the current command surface instead of relying on stale syntax.
3. Prefer exact `path=` when editing files; use `file=` only for wikilink-style resolution.
4. Quote values containing spaces and use documented newline escaping for multiline content.
5. For writes, inspect the target note before editing unless creating a new file.
6. For plugin/theme debugging, capture errors and screenshots before changing code.
7. Return the command run and the resulting file/path state.

## Outputs

- CLI command receipts
- Created/updated notes
- Debug artifacts when relevant

## Validation

- Commands succeed without ambiguous file resolution.
- Writes target the intended vault/file.
- Plugin debugging includes the observed error, not just a guessed fix.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
