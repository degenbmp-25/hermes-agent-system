---
type: skill
name: obsidian-unlimited-context
source: https://x.com/dallasaptgp/status/2033574400901935534
description: Obsidian setup removes Claude Projects' ceiling — no upload cap, files stay local, every file links to every related file across your whole company knowledge base.
score: 10 (CRABHAMMER)
date_created: 2026-06-12
tags: [obsidian, context, local-files, unlimited, knowledge-base, no-upload-cap]
priority: CRABHAMMER
---

# Obsidian Unlimited Context Setup

**Priority:** CRABHAMMER — Foundation for all agent knowledge systems  
**Source:** @dallasaptgp (Business owner, proven system)  
**Insight:** "If you run a business and you're still re-explaining yourself to AI every session, you're leaving speed on the table."

---

## The Problem: Claude Projects' Ceiling

Claude Projects has three fatal limitations:

1. **Upload limits cap context** — You can only load so much before hitting walls
2. **Files live on Anthropic's servers** — Security and sovereignty concerns
3. **Every project is its own silo** — Sales doesn't talk to ops, finance doesn't connect to team

**Result:** You re-explain context every session. Speed left on the table.

---

## The Obsidian Solution

| Problem | Obsidian Solution |
|---------|-------------------|
| Upload limits | No upload cap — files stay on your machine |
| Server storage | Files stay on your machine — never leave your machine |
| Project silos | Every file links to every related file across your whole company |

---

## The Three Tools

1. **Obsidian** (free) — Local knowledge base with bidirectional linking
2. **Claude Code** (you're already paying for it) — AI coding and analysis
3. **One instruction file** — Tells the AI how your company works

**Total cost:** $0 (Obsidian is free, Claude Code subscription already exists)

---

## The One Instruction File

This is the key. One file tells the AI:

- What role it plays
- How your company works
- How to navigate the knowledge base
- What matters and what doesn't

**Think of it as:** The onboarding doc you'd hand a senior executive on day one.

**Except:** This executive never forgets it.

### Template: CLAUDE.md

```markdown
# CLAUDE.md — Company Onboarding for AI

## Company Overview
[Company name], [industry], [what you do]

## My Role
[Your role and what you need from AI assistance]

## Company Structure
- Sales: [how sales works, key processes]
- Operations: [how ops works, key processes]
- Finance: [how finance works, key processes]
- [Other departments...]

## Key People
- [Name]: [Role], [what they care about]
- [Name]: [Role], [what they care about]

## Active Projects
- [Project]: [status], [next action], [owner]
- [Project]: [status], [next action], [owner]

## Company Knowledge
- Where to find: [link to relevant Obsidian vaults]
- How to navigate: [explain folder structure]
- What matters: [priorities, values]

## Preferences
- Communication: [how you like to communicate]
- Response style: [concise/detailed/bullet]
- Voice: [formal/casual/mix]

## Important Rules
- Never: [hard limits on AI behavior]
- Always: [non-negotiables]

## How to Use This Knowledge Base
1. Read CLAUDE.md first (this file)
2. Check MEMORY.md for long-term context
3. Search vault for relevant files
4. Link files together with [[wikilinks]]

## Vault Structure
- 00 - INBOX/ — New, unprocessed information
- 01 - PROJECTS/ — Active project documentation
- 02 - PEOPLE/ — Team member profiles and contact info
- 03 - PROCESSES/ — How we do things
- 04 - KNOWLEDGE/ — Learned information and frameworks
- 05 - ARCHIVE/ — Completed or inactive material

## Key Vault Files
- [[CLAUDE.md]] — This file (start here)
- [[MEMORY.md]] — Long-term memory and context
- [[PROJECTS/active]] — Current projects status
- [[PROCESSES/onboarding]] — How new things get done
```

---

## Once Built: The AI Relationship Changes

| Before | After |
|--------|-------|
| Every session: "Here's the context..." | Every session: "Based on our last discussion..." |
| Re-explain company structure | AI knows your team, your numbers, your processes |
| Setup time every conversation | Skip setup. Go straight to the work. |
| Siloed context | Connected knowledge — sales connects to ops connects to strategy |

**Quote:** "If you run a business and you're still re-explaining yourself to AI every session, you're leaving speed on the table."

---

## Implementation Guide

### Step 1: Set Up Obsidian Vault

```bash
# Create vault directory
mkdir -p ~/Obsidian/[vault-name]
cd ~/Obsidian/[vault-name]

# Create folder structure
mkdir -p 00-INBOX 01-PROJECTS 02-PEOPLE 03-PROCESSES 04-KNOWLEDGE 05-ARCHIVE

# Create CLAUDE.md (the instruction file)
touch CLAUDE.md
```

### Step 2: Create MEMORY.md

```markdown
# MEMORY.md — Long-Term Agent Memory

## Company Facts
[Important facts about company, never change]

## Current Context
[Active projects, recent decisions, ongoing work]
[Update weekly]

## Learned Patterns
[Mistakes made, what worked, what to avoid]
[Update when new learning]

## People
[Key people, their preferences, how to work with them]

## Projects
[Status of active projects, last update date]
```

### Step 3: Configure Claude Code

Add to your Claude Code project configuration:

```json
{
  "systemPrompt": "Read CLAUDE.md in the project root for company context. Read MEMORY.md for long-term memory. Use Obsidian vault at ~/Obsidian/[vault-name]/ for knowledge base."
}
```

Or create a .claude files:

```
# .clauderc
[project]
context_vault = ~/Obsidian/[vault-name]
```

### Step 4: Link Everything

Use Obsidian's bidirectional links:

```markdown
# In any file

See also: [[PROJECTS/active]] for current project status.

Related: [[PEOPLE/jane-doe]] for context on the sales lead.

Connected: [[PROCESSES/onboarding]] explains how new hires get started.

This links to: [[05-ARCHIVE/old-project-notes]]
```

---

## Vault Structure Deep Dive

### 00 - INBOX
New, unprocessed information. AI reads this first to catch up.

```
00-INBOX/
├── emails/ — Email threads to process
├── notes/ — Random thoughts and ideas
└── decisions/ — Decisions made that need documenting
```

### 01 - PROJECTS
Active project documentation.

```
01-PROJECTS/
├── project-alpha/
│   ├── README.md
│   ├── status.md
│   └── notes/
├── project-beta/
└── README.md — Index of all projects
```

### 02 - PEOPLE
Team member profiles.

```
02-PEOPLE/
├── john-smith.md — CEO, strategic focus
├── jane-doe.md — Sales lead, relationship focus
└── team/
```

### 03 - PROCESSES
How the company does things.

```
03-PROCESSES/
├── onboarding.md — How new hires get started
├── sales-process.md — How sales works
├── decision-making.md — How decisions get made
└── communication.md — How we communicate
```

### 04 - KNOWLEDGE
Learned information and frameworks.

```
04-KNOWLEDGE/
├── frameworks/ — Business frameworks we use
├── industry/ — Industry research and insights
└── competitor-analysis/ — What competitors are doing
```

### 05 - ARCHIVE
Completed or inactive material.

```
05-ARCHIVE/
├── old-projects/ — Completed projects
└── deprecated/ — Old processes no longer used
```

---

## Linking Pattern: How Files Connect

The power of Obsidian is bidirectional links:

```markdown
# In project-alpha/status.md

Team: [[PEOPLE/jane-doe]], [[PEOPLE/john-smith]]

Process: We use [[PROCESSES/sales-process]] for this project.

Knowledge: This project builds on [[04-KNOWLEDGE/frameworks/our-framework]]

Related: See [[01-PROJECTS/project-beta/status]] for parallel work.
```

When you view any file in Obsidian, linked files appear in:
- **Backlinks** panel (files that link TO this file)
- **Unlinked mentions** (files that mention this file but don't link)

---

## Test: Does Your AI Use the Context?

Test prompt:
```
"What were we discussing about the sales process last week?"
```

Expected behavior:
1. Reads MEMORY.md or recent project notes
2. Finds relevant context
3. Responds with specifics, not "I don't know"

If it doesn't find anything:
- Check that CLAUDE.md exists and is referenced
- Verify MEMORY.md has recent context
- Ensure files are in the Obsidian vault path

---

## Application to Dr. JPGamb

Create a health coaching Obsidian vault:

```
~/Obsidian/dr-jpgamb/
├── CLAUDE.md — "You are Dr. JPGamb's health coaching AI..."
├── MEMORY.md — Client history, preferences, ongoing programs
├── 01-CLIENTS/ — Individual client vaults
│   ├── john-smith/
│   │   ├── health-history.md
│   │   ├── goals.md
│   │   └── progress.md
│   └── jane-doe/
├── 02-PROGRAMS/ — Health coaching programs
│   ├── 30-day Reset/
│   └── Strength Building/
├── 03-METHODOLOGY/ — Dr. JPGamb's approach
│   ├── philosophy.md
│   ├── frameworks.md
│   └── assessments.md
└── 04-KNOWLEDGE/ — Health resources
    ├── nutrition/
    ├── exercise/
    └── mindfulness/
```

**Result:** Every AI session starts with full client context, no re-explaining.

---

## Key Quote

> "If you run a business and you're still re-explaining yourself to AI every session, you're leaving speed on the table."

**The fix:** One instruction file (CLAUDE.md) + Obsidian vault + never re-explain again.

---

**Source URL:** https://x.com/dallasaptgp/status/2033574400901935534  
**Skills Pipeline:** learnings-to-skills | 2026-06-12