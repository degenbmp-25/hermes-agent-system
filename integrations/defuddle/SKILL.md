---
name: "defuddle"
description: "Extract clean Markdown from web pages with Defuddle CLI to remove navigation, ads, and boilerplate before analysis or vault ingestion. Use when a user gives a normal web URL for reading, summarizing, research capture, or Obsidian note conversion; skip URLs that already point to raw Markdown."
---

# defuddle

## Source Provenance

This is a BeastmodeVault-authored operational skill derived from: https://github.com/kepano/obsidian-skills and https://github.com/kepano/defuddle

Use the sources as provenance and background only. Follow the procedure below as the executable workflow.

## Purpose

Turn noisy web pages into clean Markdown before summarizing, extracting research notes, or adding material to an Obsidian vault.

## Procedure

1. Use this for ordinary article, documentation, landing page, or blog URLs.
2. Do not use this for URLs ending in `.md` or raw GitHub Markdown; fetch those directly.
3. Check whether `defuddle` is installed. If it is missing and the environment allows installs, install with `npm install -g defuddle`; otherwise fall back to the available fetch/browser tool.
4. Extract Markdown with:

```bash
defuddle parse <url> --md
```

5. For durable ingestion, save the result first:

```bash
defuddle parse <url> --md -o content.md
```

6. Capture metadata when useful:

```bash
defuddle parse <url> -p title
defuddle parse <url> -p description
defuddle parse <url> -p domain
```

7. Use the cleaned Markdown as the source for summaries, literature notes, atomic notes, or citation-backed decisions.

## Outputs

- Clean Markdown extraction
- Optional metadata fields
- Source URL and extraction timestamp when creating vault notes

## Validation

- The extracted content contains the main article/body, not just navigation text.
- Important headings, links, and code blocks are preserved.
- Source URL is retained in any derived note.
- If extraction fails or is sparse, fall back to browser/web fetch and report the limitation.

## Operating Rules

- Do not treat extracted text as verified fact without source judgment.
- Preserve attribution and source URL.
- Avoid dumping long copied article bodies into final chat replies; summarize or transform instead.
