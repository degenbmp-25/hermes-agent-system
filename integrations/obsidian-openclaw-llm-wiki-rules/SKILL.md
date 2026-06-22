---
type: skill
name: obsidian-openclaw-llm-wiki-rules
source: https://x.com/code_rams/status/2048488925296029705
description: Code Rams' six rules for maintaining an LLM Wiki in OpenClaw + Obsidian. Fixed five-page taxonomy, search-before-write, backlinks automatic, contradictions flagged, frontmatter attribution, single vault only. "The pattern is a discipline encoded in prompts, not code." Key insight: "Obsidian is the IDE, the LLM is the programmer, OpenClaw is the build system, the wiki is the codebase."
---

# Obsidian + OpenClaw LLM Wiki Rules Skill

**Core principle:** "The pattern is a discipline encoded in prompts, not code." Once agents are writing into the wiki daily, you need a taxonomy that survives chaos. These six rules encode the discipline directly into OpenClaw system prompts so the wiki maintains itself.

**Source:** @code_rams | 9.8K views, 245 bookmarks  
**Complement:** `llm-wiki-second-brain` (Karpathy/Defileo) = theory  
**This skill:** OpenClaw-specific implementation rules  
**Score:** CRABHAMMER 9/10

---

# The Mental Model

> "Obsidian is the IDE. The LLM is the programmer. OpenClaw is the build system. The wiki is the codebase."

**This changes how you think about the wiki.** It's not a folder of notes — it's a codebase that the LLM maintains. The rules are like linters and formatters that keep the codebase clean.

---

# When to Use

- **Setting up a new OpenClaw knowledge base** — Encode these rules in system prompts from day one
- **Fixing wiki chaos** — Agents creating duplicate pages, no backlinks, orphaned files
- **Multi-agent knowledge systems** — Multiple OpenClaw agents writing to the same vault
- **Client knowledge bases** — Deliver a well-maintained wiki that compounds over time

**"Without explicit rules, agents default to dumping markdown notes into a folder."**

---

# Rule 1: Five Page Types, Fixed Taxonomy

**Once agents are writing into it daily, you need a taxonomy that survives chaos.**

## The Five Page Types

| Type | Purpose | Example |
|------|---------|---------|
| **Entities** | Real-world things: people, companies, products | `[[Dr. JPGamb]]`, `[[HiveMind Intelligence]]` |
| **Concepts** | Ideas and patterns | `[[multi-agent-orchestration]]`, `[[llm-wiki]]` |
| **Syntheses** | Compiled analysis pulling from multiple sources | `[[Q1-2026-agent-landscape-analysis]]` |
| **Sources** | Raw imports: articles, transcripts, notes | `[[source-2026-04-28-lemmy-post]]` |
| **Reports** | Auto-generated dashboards from the rest | `[[weekly-knowledge-report-2026-04-28]]` |

**Enforce this in the system prompt:**
```
Wiki page types: ENTITIES, CONCEPTS, SYNTHESES, SOURCES, REPORTS.
Always file new pages by type. Default to CONCEPTS if uncertain.
```

---

# Rule 2: Agents Must Search Before They Write

**"Existing pages get appended to, not duplicated."**

**Without this rule, you wake up to twelve duplicate pages a week.**

## The Search-Before-Write Protocol

```
Before creating a new page:
1. Search the vault for existing pages on this topic
2. If found → append to existing page, don't create new
3. If not found → create new page with appropriate type
4. If uncertain → search again with broader terms
```

**Enforce in system prompt:**
```
BEFORE creating any new wiki page:
1. Run vault search for related terms
2. Check if page already exists
3. If exists: append to existing page with new context
4. If not exists: create new page, file by type
5. NEVER create duplicate pages on the same topic
```

---

# Rule 3: Backlinks Are Automatic, Not Optional

**"Every cross-page reference uses Obsidian wikilinks."**

## Why Backlinks Matter

- Open the graph view → structure surfaces naturally
- Open the same vault without backlinks → you get a folder of orphans
- Without wikilinks, the wiki is just a pile of disconnected files

## The Rule

```
Every time you reference a person, concept, company, or other wiki page:
- Use [[pagename]] wikilink syntax
- Never write the full page name as plain text
- Always link, never just mention
```

**Enforce in system prompt:**
```
Cross-references use Obsidian wikilinks: [[pagename]]
Never write entity names as plain text — always link
Graph view should show connections; if it doesn't, add more links
```

---

# Rule 4: Contradictions Get Flagged, Not Silently Overwritten

**"The wiki admits when two sources disagree. The agent writes a tension note, not a confident lie."**

## The Contradiction Protocol

```
When you find conflicting information across sources:
1. Do NOT pick one and overwrite the other
2. Create a CONTRADICTION note in the page
3. Log: Source A says X, Source B says Y
4. Include both sources with timestamps
5. Mark as [UNRESOLVED] or [RESOLVED: X]
```

**Example contradiction note:**
```markdown
## Contradiction Log

| Date | Source | Claim |
|------|--------|-------|
| 2026-04-28 | Source A | "X is true" |
| 2026-04-29 | Source B | "X is false" |

Status: [UNRESOLVED]
Resolution: Pending further research
```

**Enforce in system prompt:**
```
If you find conflicting information:
- NEVER overwrite the older source
- Add a Contradiction Log section to the page
- Include both claims with source attribution
- Mark as [UNRESOLVED] until resolved
```

---

# Rule 5: Multi-Agent Attribution Lives in Frontmatter, Not Folders

**"One vault, multiple OpenClaw agents writing in. The frontmatter says who wrote what, when, and why."**

## Frontmatter Template

```yaml
---
type: concepts  # entities | concepts | syntheses | sources | reports
created: 2026-04-28
created_by: soren  # agent name
modified: 2026-04-28
modified_by: aron   # most recent agent
contributors:
  - soren (2026-04-28)  # initial creation
  - aron (2026-04-28)   # added research
tags:
  - agent-growth
  - knowledge-base
  - multi-agent
---

# Page Title
```

## Why Frontmatter Over Folders

> "Folders looked clean on paper but broke search and graph view."

- **Search:** Works across the entire vault regardless of folder
- **Graph view:** Shows real connections, not folder hierarchy
- **Attribution:** Always know who wrote what

**Enforce in system prompt:**
```
Every wiki page must have frontmatter with:
- type: (entities | concepts | syntheses | sources | reports)
- created_by: (agent name)
- modified_by: (agent name)
- contributors: (list of all agents who edited this page)
- created/modified dates

Put attribution in frontmatter, NOT in folder structure.
```

---

# Rule 6: Single Vault Is the Only Model That Works

**"Per-agent vaults seemed cleaner. The plugin doesn't support cross-vault graph or search. Forcing the structure breaks the plumbing."**

## Why Single Vault

| Approach | Graph View | Cross-Vault Search | Complexity |
|----------|-----------|-------------------|------------|
| Per-agent vaults | ❌ Broken | ❌ Can't search | High |
| Single vault | ✅ Works | ✅ Full search | Low |

## The Rule

```
ONE vault for all agents.
Agents are identified by frontmatter attribution.
The graph view shows all connections.
Search works across all content.
```

**Enforce in system prompt:**
```
All knowledge goes into ONE vault.
No per-agent sub-vaults.
Agents are identified by frontmatter attribution.
If you need to isolate content, use tags or frontmatter, not vaults.
```

---

# The System Prompt Rules (Copy-Paste)

Add these rules to every OpenClaw agent's system prompt that writes to the wiki:

```
## Wiki Rules

1. FIVE PAGE TYPES: entities, concepts, syntheses, sources, reports. File by type.

2. SEARCH BEFORE WRITE: Run vault search before creating. Append to existing pages, don't duplicate.

3. BACKLINKS AUTOMATIC: Use [[wikilink]] for every cross-reference. Never plain text names.

4. CONTRADICTIONS FLAGGED: Never overwrite conflicting sources. Log contradictions with [UNRESOLVED].

5. FRONTMATTER ATTRIBUTION: Every page has frontmatter with type, created_by, modified_by, contributors.

6. SINGLE VAULT: All content in one vault. Agents identified by frontmatter, not folders.

## Wiki Mental Model
Obsidian = IDE. LLM = Programmer. OpenClaw = Build System. Wiki = Codebase.
The wiki is code that maintains itself through these rules.
```

---

# Wiki Maintenance Checklist

Run this periodically to audit wiki health:

- [ ] Run graph view — are connections forming?
- [ ] Search for orphan pages — pages with no backlinks
- [ ] Check for duplicate topics — did search-before-write work?
- [ ] Review contradiction logs — any [UNRESOLVED] items to resolve?
- [ ] Check frontmatter — are all pages attributed?
- [ ] Run vault search — does full-text search work across all content?

---

# Anti-Patterns

❌ **No fixed taxonomy** — Agents create random page types, chaos follows.
❌ **No search-before-write rule** — Duplicate pages everywhere.
❌ **Plain text references** — "Dr. JPGamb" instead of [[Dr. JPGamb]].
❌ **Silent contradiction overwriting** — Agents pick winners, lose information.
❌ **Per-agent folders** — Seems organized, breaks graph and search.
❌ **Per-agent vaults** — Plugin doesn't support cross-vault, breaks everything.
❌ **No frontmatter** — No attribution, no type, no structure.

---

# Related Skills

- [[llm-wiki-second-brain]] — Karpathy/Defileo LLM Wiki pattern (theory + architecture)
- [[single-brain-operating-system]] — Eric Siu's 5-agent fleet with unified vault
- [[graphify-knowledge-graph]] — 71.5x token reduction via knowledge graph
- [[second-brain-multi-vault]] — Nick Spisak's multi-domain vault system

---

*Obsidian is the IDE. The LLM is the programmer. OpenClaw is the build system. The wiki is the codebase.*

*The pattern is a discipline encoded in prompts, not code.*

*Wikis maintain themselves only when the agents writing into them are prompted to maintain them.*

---

**Source:** https://x.com/code_rams/status/2048488925296029705
