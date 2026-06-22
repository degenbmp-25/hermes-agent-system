---
type: skill
name: karpathy-obsidian-atomic-notes
source: https://x.com/EXM7777/status/2051724113266590075
description: Karpathy's zero-cost note-taking method - dissect raw notes into atomic Obsidian markdown files with wikilinks. No RAG, no vectors, $0.
---

# Karpathy Obsidian Atomic Notes — No RAG, No Vectors, $0

**Source:** Machina (@EXM7777) quoting Karpathy  
**Engagement:** 259 likes, 448 bookmarks  
**Date Learned:** 2026-06-02

## The Method

Paste raw notes into Claude, use a prompt to split them into atomic Obsidian markdown files, then sync to your vault via Obsidian CLI.

### The Karpathy Prompt
```
dissect this raw note into atomic Obsidian markdown files...
each file = one concept...
use [[wikilinks]] between any concept that references another...
output as separate code blocks with filenames
```

### What Makes It Work

1. **Atomic files** — One concept per file. No multi-topic documents.
2. **Wikilinks** — Manual linking creates a graph without vector embeddings
3. **No RAG needed** — The wikilink graph enables navigation without semantic search
4. **No cost** — Just Obsidian (free) + Claude (already paid for)

## Why This Matters

| Approach | Cost | Complexity | Maintenance |
|----------|------|------------|--------------|
| Vector RAG | $ API calls | High | Index updates |
| Wikilink Graph | $0 | Low | Natural links |

The "no conscious organization" property: You dump raw notes, Claude atomizes them, you get a connected knowledge base without any manual linking effort.

## Implementation

### Step 1: Create the Raw Notes File
Put any notes, links, thoughts into a single file:
```
raw-notes.md
```

### Step 2: Feed to Claude with Prompt
```
dissect this raw note into atomic Obsidian markdown files. Each file should 
contain one concept. Use [[wikilinks]] for any concept that references another. 
Output as separate code blocks with filenames.
```

### Step 3: Extract Files
Copy the code blocks and save as markdown files in your Obsidian vault.

### Step 4: Sync with Obsidian CLI
```bash
obsidian-cli sync --vault your-vault
```

### Step 5: Navigate Your Knowledge Graph
Open Obsidian, see your atomic notes + wikilinks = connected knowledge base

## For OpenClaw Memory System

### Adaptation for Vault Structure
```
vault/
  memory/
    raw/           # Incoming raw notes
    atomic/        # Claude-atomized concepts
      [concept-1].md
      [concept-2].md
```

### The Atomic Note Template
```markdown
# [Concept Name]

## Definition
[One-sentence definition]

## Key Points
- [Point 1]
- [Point 2]

## Connected To
- [[related-concept-1]]
- [[related-concept-2]]

## Source
[Original note/link]
```

## Key Principle

> The system works because you never think about the system. You think about your work, and the system captures it as a side effect of natural conversation.

This is the same "invisible maintenance" insight from Obie Fernandez's executive assistant. The knowledge capture should be frictionless.

## When to Use

- **Incoming information overload** — Read 10 tweets, dump all links into raw notes, atomize later
- **Meeting notes** — Paste transcript, get atomic action items + decisions
- **Research dumps** — Articles, papers, tweets → atomic concepts with connections
- **Daily notes** — End of day dump → morning atomic ready

## Related Skills

- [[three-layer-company-brain]] — Factual + Interaction + Action memory layers
- [[obie-fernandez-executive-assistant]] — Invisible maintenance principle
- [[obsidian-cli]] — Obsidian CLI for syncing
