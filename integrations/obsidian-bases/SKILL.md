---
name: "obsidian-bases"
description: "Create and edit Obsidian Bases `.base` files with scoped views, filters, properties, formulas, and summaries. Use when building database-like views over vault notes or when the user mentions Bases, table views, card views, filters, or formulas."
---

# obsidian-bases

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://help.obsidian.md/bases

Use the source as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Build valid Obsidian Bases files that render cleanly and help agents/humans inspect vault state.

## Procedure

1. Identify the vault folder and the notes the base should display.
2. Define the scope first: folder, tags, frontmatter properties, or file patterns.
3. Choose view types needed: table, cards, list, or map.
4. Write a `.base` file with valid YAML and quote expressions that contain special characters.
5. Add formulas only when they reduce repeated manual interpretation.
6. Validate YAML syntax with an available parser or a careful read if no parser exists.
7. Open or ask the user to open the base in Obsidian and report render errors.

## Outputs

- `.base` file
- View/filter summary
- Validation notes

## Validation

- The file is valid YAML.
- Filters select the intended notes and not the entire vault by accident.
- Formula names referenced in views exist in the formulas section.

## Operating Rules

- Keep source attribution when creating artifacts from this skill.
- Prefer local files and explicit receipts over vague memory.
- Ask for approval before external sends, production changes, or destructive actions.
