---
name: "json-canvas"
description: "Create and edit JSON Canvas `.canvas` files for Obsidian with text, file, link, group nodes, edges, colors, and layout validation. Use when building visual maps, flowcharts, mind maps, canvases, or any Obsidian JSON Canvas artifact."
---

# json-canvas

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://github.com/kepano/obsidian-skills and https://jsoncanvas.org/spec/1.0/

Use the sources as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Produce valid JSON Canvas files that Obsidian can render as visual maps instead of freeform Markdown.

## Procedure

1. Confirm the canvas goal: map, flowchart, dashboard, concept graph, or file index.
2. Create or parse a `.canvas` file as JSON with top-level `nodes` and `edges` arrays.
3. Generate unique 16-character lowercase hex IDs for every node and edge.
4. Use node types intentionally:
   - `text` for Markdown content
   - `file` for vault-local file references
   - `link` for external URLs
   - `group` for visual containers
5. Place nodes using integer `x`, `y`, `width`, and `height`; leave 50-100px between nodes and 20-50px padding inside groups.
6. Connect nodes with edges that reference existing `fromNode` and `toNode` IDs.
7. Use preset colors `"1"` through `"6"` or hex colors only when color conveys meaning.
8. Write pretty-printed JSON and validate it before finishing.

## Important Pitfalls

- Use actual JSON newline escapes (`\n`) inside text strings; do not double-escape into literal `\\n` unless the output really needs those characters.
- Keep all edge endpoints resolvable; a canvas with broken node IDs may silently render wrong.
- Array order affects z-index: earlier nodes are lower, later nodes are higher.
- `file` paths should be vault-relative when targeting Obsidian notes or attachments.
- Coordinates can be negative; Obsidian canvases extend infinitely.

## Outputs

- `.canvas` file
- Short layout summary
- Validation notes for JSON parse, unique IDs, and edge references

## Validation

- JSON parses cleanly.
- Every node and edge ID is unique.
- Every `fromNode` and `toNode` exists in `nodes`.
- Each node has required fields for its type.
- The canvas layout avoids obvious overlap unless overlap is intentional.

## Operating Rules

- Prefer structured JSON parsing/editing over string manipulation.
- Preserve existing IDs when editing an existing canvas unless replacing a node.
- Keep source attribution when creating artifacts from this skill.
- Ask before destructive rewrites of a user vault.
