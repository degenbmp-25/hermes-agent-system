---
type: skill
name: cyrilxbt-obsidian-hermes-research-converter
source: https://x.com/cyrilxbt/status/2061601347271577630
description: A skill for converting research material into structured permanent notes connected to existing vault knowledge using Obsidian and Hermes Agent.
---

# Implementation

## Trigger
- Manual: "Convert research in inbox" or "Process research on [TOPIC]"
- Activated when research material is in 00 - INBOX folder in Obsidian

## Process

### Step 1: Read Vault Context
Read `CLAUDE.md` (or equivalent vault context file) to understand:
- Current project/engagement context
- Existing knowledge structure
- Priority topics and frameworks already established

### Step 2: Identify Research in Inbox
Scan `00 - INBOX` folder for unprocessed research:
- Articles, tweets, links, notes
- Prioritize by recency and relevance to current work

### Step 3: For Each Research Item
1. **READ** — Full content extraction
2. **EXTRACT** key ideas, claims, data points
3. **SEARCH** existing vault for related notes/frameworks
4. **CREATE literature note** — Reference-style note with citation and summary
5. **CREATE permanent notes** — Atomic notes that connect to existing knowledge graph
6. **ARCHIVE** — Move processed item out of inbox

### Step 4: Generate Conversion Summary
Output a markdown summary:
```
Research Converted: [DATE]
Items Processed: [COUNT]
New Literature Notes: [LIST]
New Permanent Notes: [LIST]
Connections Made: [LIST]
```

## Quality Standards
- Every literature note MUST produce at least one new permanent note
- Permanent notes should be atomic — one idea per note
- All permanent notes must link to at least one existing note
- Use Zettelkasten-style linking: `[[note-title]]`

## Output Location
Save conversion summary to:
`04 - HERMES-OUTPUTS/analyses/[DATE]-research-converted.md`

## Key Principles
- **Research is inert without connection** — isolated notes are wasted effort
- **Literature notes are temporary** — they exist to extract permanent notes
- **Permanence through linking** — a note only becomes permanent when it connects to the existing graph

---

# Usage

**Trigger phrases:**
- "Convert research in inbox"
- "Process research on [TOPIC]"
- "Process inbox research"

**Before running:** Ensure 00 - INBOX has research items and CLAUDE.md exists with current context.

**After running:** Check `04 - HERMES-OUTPUTS/analyses/` for conversion summary and verify permanent notes were created.