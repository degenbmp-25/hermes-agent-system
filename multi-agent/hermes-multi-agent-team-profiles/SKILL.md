---
type: skill
name: hermes-multi-agent-team-profiles
source: https://x.com/neoaiforecast/status/2043455838459920718
description: Neo's definitive guide to building multi-agent teams in Hermes using profiles as isolated agent environments. 4-role team: orchestrator (Hermes) → research (Alan) → writer (Mira) → engineer (Turing). SOUL.md creates distinct agents, AGENTS.md gives shared mission context. "Stop trying to make one agent do everything. Build a team."
---

# Hermes Multi-Agent Team Profiles Skill

**Core principle:** "Stop trying to make one agent do everything. Build a team. Start with an orchestrator, add one specialist, prove the handoff, and only then expand." The smartest multi-agent team is not the biggest one — it is the one with the clearest role boundaries.

**Source:** @NeoAIForecast | 74.7K views, 2.2K bookmarks  
**Score:** CRABHAMMER 10/10

---

# When to Use

- Building multi-agent systems for yourself or clients
- When you need agents with distinct roles and identities
- When you want memory/sessions isolation between agents
- When specialization matters more than a single generalist
- When you want a traffic controller (orchestrator) instead of a bottleneck

**Hermes profiles are best understood as role boundaries for AI work, not as novelty character skins.**

---

# The Problem with Single Agent

**The wrong mental model:** "I need one genius AI that does everything."

**What happens:**
- Personalities blur together
- Context gets messy
- Memory becomes noisy
- Workflows stop feeling deliberate

**Result:** One AI trying to be researcher, writer, coder, project manager, and operator all at once.

---

# The Better Mental Model

**The right mental model:** "I need a small team with distinct roles, clear handoffs, and less context pollution."

> "Most people use one AI assistant and then try to force it to become a researcher, writer, coder, project manager, and operator all at once. That usually works for a while. Then the personalities blur together. The context gets messy. The memory becomes noisy."

---

# Hermes Profiles: The Key Feature

**What they are:** Isolated agent environments that separate memory, sessions, skills, personality, configuration, cron state, and gateway behavior.

**What profiles actually separate:**
- Configuration
- Sessions
- Memory
- Skills
- Personality
- Cron state
- Gateway state

**The key insight:**
> "Multi-agent systems fail when everything shares the same memory and tone. You do not want your coding agent inheriting the same defaults, priorities, and stylistic habits as your research or writing agent."

**Specialization only becomes durable when state stays separated.**

---

# The 4-Role Team Structure

```
         Hermes (orchestrator)
              │
     ┌────────┼────────┐
  Alan      Mira      Turing
Research   Writer    Engineer
```

## Role 1: The Orchestrator (Hermes)

**Job:** Not to do every task personally. To define the goal, split the work, route tasks to specialists, and synthesize the final result.

**Optimize for:**
- Planning
- Prioritization
- Dependency management
- Quality control
- Synthesis

**Personality:** Structured, decisive. Thinks in workstreams, not just answers.

> "The orchestrator is the traffic controller of the system, not the bottleneck."

---

## Role 2: The Research Specialist (Alan)

**Job:** Protect the rest of the team from bad assumptions.

**Optimize for:**
- Skepticism
- Source-first evidence
- Structured findings

**Use for:**
- Literature review
- Market research
- Product comparisons
- Source verification
- Trend tracking

**Personality:** Evidence-first, skeptical.

> "A good research agent reduces hallucinated confidence across the whole system."

---

## Role 3: The Writer (Mira)

**Job:** Turn validated material into clear, structured communication.

**Optimize for:**
- Clarity
- Structure
- Readability
- Audience awareness

**Produces:**
- Articles
- Briefings
- Product copy
- Threads
- Scripts
- Explainers

**Personality:** Clear, audience-aware, narrative-driven.

> "Writing gets better when the agent is not also trying to be the researcher and debugger at the same time."

---

## Role 4: The Builder/Debugger (Turing)

**Job:** Turn plans into working systems, tests, fixes, reliable output.

**Optimize for:**
- Reproducibility
- Logs and diffs
- Verified outcomes
- Technical depth

**Use for:**
- Building features
- Debugging failures
- Reviewing code
- Validating fixes
- Running tests

**Personality:** Direct, evidence-driven, implementation-focused.

> "Implementation quality improves when one profile is allowed to stay deeply technical."

---

# SOUL.md vs AGENTS.md

**SOUL.md defines who the agent is:**
- The orchestrator should sound structured and decisive
- The researcher should sound evidence-first and skeptical
- The writer should sound clear and audience-aware
- The engineer should sound precise and test-oriented

**AGENTS.md defines shared project context:**
- Repository structure
- Coding conventions
- Workflow rules
- Tool usage expectations
- Project-specific instructions

**Critical rule:**
> "If you only change the profile name and not the SOUL.md, you do not really have a team."

---

# Step-by-Step Setup

## Step 1: Start from Working Hermes

Verify your Hermes setup works:
- Model/provider configured
- API keys working
- Normal Hermes environment usable

## Step 2: Create Specialist Profiles

```bash
hermes profile create alan --clone
hermes profile create mira --clone
hermes profile create turing --clone
```

**Using `--clone` copies:**
- config.yaml
- .env
- SOUL.md

**Each gets its own isolated:**
- Memory
- Session history

## Step 3: Verify Profiles Exist

```bash
hermes profile list
```

**Profile locations:** `/home/user/.hermes/profiles/`

## Step 4: Give Each Profile a Real Identity with SOUL.md

Create distinct SOUL.md files for each:
```
/home/user/.hermes/profiles/hermes/SOUL.md   (orchestrator)
/home/user/.hermes/profiles/alan/SOUL.md     (research)
/home/user/.hermes/profiles/mira/SOUL.md     (writer)
/home/user/.hermes/profiles/turing/SOUL.md   (engineer)
```

## Step 5: Keep Shared Context Separate (AGENTS.md)

Shared context goes in AGENTS.md at the workspace level, not in individual profiles.

## Step 6: Create Team Reference File

```
/home/user/.hermes/team-agents.md
```

**Document in this file:**
- Each agent's role
- Handoff rules
- When to use which profile
- What good output looks like from each one

## Step 7: Run Each Profile Directly

```bash
hermes -p alan    # Research specialist
hermes -p mira    # Writer
hermes -p turing  # Engineer
```

**Key benefit:**
> "Alan does not inherit Mira's writing sessions. Turing does not inherit Alan's research memory. Each agent gets cleaner long-term specialization."

---

# Pair Profiles with Messaging

**The power move:**
> "Messaging turns profiles from a local organization feature into a live multi-agent control surface."

**What you can do:**
- Run different profiles as different messaging identities
- Supervise them remotely
- Route work through Telegram, Discord, etc.
- Keep role boundaries intact across chats and tasks

**This turns isolated terminal sessions into a coordinated team that can be managed remotely.**

---

# Anti-Patterns

❌ **One agent doing everything** — Leads to personality blur, messy context, noisy memory.
❌ **Changing profile name but not SOUL.md** — You don't have a real team. Just renamed clones.
❌ **Shared memory between agents** — Multi-agent fails when everything shares the same memory and tone.
❌ **No handoff rules** — Agents don't know when to route to each other.
❌ **No team reference file** — Nobody knows who does what.
❌ **Over-engineering the team** — Start with 2 roles, prove the handoff, then expand.

---

# Starting Small

**Minimum viable team:**
1. Orchestrator (you + Hermes)
2. One specialist (research OR writing OR coding)
3. Prove the handoff works
4. Then expand

> "Start with an orchestrator, add one specialist, prove the handoff, and only then expand."

---

# For HiveMind Clients

## Client Onboarding Team

```
Beastmode (orchestrator) — decides, approves, high-level direction
  │
  ├── Alan (research) — client research, market analysis
  ├── Mira (writer) — proposals, content, reports
  └── Turing (engineer) — builds, tests, fixes
```

## Health Coaching Team (Dr. JPGamb)

```
Chief (orchestrator) — coordinates all health coaching agents
  │
  ├── Research (Alan) — latest protocols, supplement research
  ├── Writer (Mira) — client communications, progress reports
  └── Engineer (Turing) — tracks data, runs analysis
```

---

# Related Skills

- [[single-brain-operating-system]] — Eric Siu's 5-agent fleet with shared vector DB
- [[crew-architecture-workflow]] — 8-agent Obsidian crew
- [[self-improving-multi-agent-qa]] — QA-driven self-healing loop
- [[anthropic-context-engineering]] — Context management patterns

---

*Stop trying to make one agent do everything. Build a team.*

*The smartest multi-agent team is not the biggest one. It is the one with the clearest role boundaries.*

---

**Source:** https://x.com/neoaiforecast/status/2043455838459920718
