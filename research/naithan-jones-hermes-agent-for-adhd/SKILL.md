---
type: skill
name: naithan-jones-hermes-agent-for-adhd
source: https://x.com/naithanjones/status/2062579117325717671
description: Build an Hermes Agent system for personal productivity and ADHD management using speech-to-text capture, life priorities documents, daily briefings, and proactive nudges throughout the day.
---

# Implementation

## System Overview

The core insight: **"Hermes agent has been the single best remedy to my ADHD"**

The system works by:
1. Capturing thoughts the moment they appear (no friction)
2. Surfacing relevant context at decision points
3. Providing structure and accountability automatically

## Component 1: Random Thoughts Vault

**Purpose:** Zero-friction capture of invasive thoughts and ideas.

**Setup:**
- Create `RANDOM-THOUGHTS/` folder in Obsidian
- Enable speech-to-text input (voice → text → file)
- When invasive thought appears, capture it immediately

**Process:**
1. Thought enters mind
2. Speak into voice-to-text (phone or computer)
3. Captured to `RANDOM-THOUGHTS/[DATE]-thoughts.md`
4. Never lose an idea, never interrupt flow

**Key insight:** Don't fight the thought — capture it and return to focus.

## Component 2: Life Priorities Markdown

**Purpose:** Explicitly explain to Hermes what's important, in order.

**File:** `LIFE-PRIORITIES.md` in vault root

**Structure:**
```
# Life Priorities

## Personal (ordered most → least important)
1. Health and fitness
2. Quality time with family
3. Creative projects
4. ...

## Professional (ordered most → least important)
1. Client delivery excellence
2. Business development
3. Skill development
4. ...

## Current Focus (this week/quarter)
- [ ] Priority 1
- [ ] Priority 2
- [ ] Priority 3
```

**Update cadence:** Review and update monthly or when priorities shift.

## Component 3: Hermes Review Process

**Purpose:** Hermes reviews the vault multiple times per day and maps random thoughts to action.

**Daily review schedule:**
- **Morning:** Prep for the day (briefing)
- **Midday:** Check-in and adjustment
- **Evening:** Review and prep for tomorrow

**Review process:**
1. Read `RANDOM-THOUGHTS/` folder
2. Read `LIFE-PRIORITIES.md`
3. Check calendar and email
4. Map thoughts to:
   - Calendar (schedule something)
   - Email (respond to someone)
   - Projects in progress (add to task list)
   - Cross-reference priorities (is this aligned?)

## Component 4: Daily Briefing Cron

**Morning briefing (start of day):**
```
Subject: Your Day Brief — [DATE]

Based on your calendar:
- [Meeting 1] at [time]
- [Meeting 2] at [time]

From your random thoughts:
- [Thought 1] → suggests [action]
- [Thought 2] → aligns with [existing priority]

Today's focus: [Priority from LIFE-PRIORITIES]

Action items:
- [ ] [Task 1]
- [ ] [Task 2]
```

**Evening briefing (prep for tomorrow):**
```
Subject: Tomorrow Prep — [DATE]

Tomorrow's priorities:
- [ ] [Priority 1]
- [ ] [Priority 2]

From today's thoughts:
- [Unprocessed thought] → needs attention

Good night.
```

## Component 5: Proactive Text Agent

**Purpose:** Send texts throughout the day with relevant things to consider.

**Examples:**
- "You have a call with [client] in 30 minutes. Prep notes: [relevant context]"
- "You mentioned wanting to follow up on [topic] — good time now?"
- "You're two hours into deep work. Consider a break."

**Implementation:**
- Hermes Agent triggers SMS/text via integration
- Sends at contextually relevant moments
- Keeps user on track without them having to remember

## Component 6: Future State — 24/7 Listener/Coach

**Desired build:** Continuous screen/audio access that delivers proactive insights via voice while working.

This is the ultimate ADHD aid:
- Intercept intrusive thoughts as they occur
- Contextualize against current work
- Provide just-in-time coaching

---

# Usage

**Setup order:**
1. Create `LIFE-PRIORITIES.md` — most important document
2. Set up `RANDOM-THOUGHTS/` folder with voice input
3. Configure Hermes review cron (morning + evening)
4. Set up daily briefing delivery (Discord DM, email, text)
5. Configure proactive text agent for midday nudges
6. Iterate and refine priorities based on what surfaces

**Key principle:** The system must be easier than fighting the thought. Voice capture with zero friction is non-negotiable.

**Success metric:** Thoughts that used to derail focus now get captured and processed without breaking flow.