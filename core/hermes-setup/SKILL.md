---
type: skill
name: hermes-setup
description: Greg Isenberg's practical step-by-step Hermes Agent installation guide. Covers memory system, OpenRouter cost integration, 40+ preloaded skills, Obsidian/GStack integrations, deployment options (bare metal/Docker/Modal), and mobile via Telegram. 393K views.
date: 2026-04-24
author: gregisenberg
source: https://x.com/gregisenberg/status/2046310954351358378
salience: 0.90
tags: [hermes, setup, installation, cost-optimization, deployment, mobile]
---

# Hermes Agent Setup Guide

**Source:** Greg Isenberg (@gregisenberg) — 393K views, 5.6K bookmarks  
**Complement:** `hermes-multi-agent-team-profiles` (Neo) = architecture after setup

---

## What Is Hermes

> "Hermes is a personal AI agent that runs in your terminal. Think of it like OpenClaw but with built-in memory, 40+ tools out of the box, and 90% cheaper token costs. You install it with one command."

---

## The 3 Problems Hermes Solves vs OpenClaw

| Problem | OpenClaw | Hermes |
|---------|----------|--------|
| Memory | Session-only, repeats context every time | Built-in persistent memory, learns workflows |
| Stability | Gateway restarts needed | Runs continuously |
| Token visibility | Zero visibility into costs | OpenRouter integration = exact cost per task |

**Real result:** One founder went from $130 every 5 days on OpenClaw → $10 on Hermes. Same output.

---

## Installation

```bash
# One-command install (per Hermes docs)
curl -sL https://hermes.example/install | sh

# Or via npm
npm install -g hermes-ai
```

After install, connect OpenRouter for cost tracking (free models rotate weekly).

---

## Key Features

### Built-in Memory
> "Hermes remembers everything. Every completed task gets saved to memory. It searches through past logs to find solutions. Over time it literally gets smarter at your specific workflows."

### OpenRouter Integration
- See exact costs per model per task
- Free models rotate weekly
- Switch models without re-configuring

```bash
hermes config --openrouter-key YOUR_KEY
hermes models list  # See available models + costs
```

### 40+ Preloaded Skills (No Hunting for Plugins)
- Apple Notes
- iMessage
- Find My
- Browser
- Web Search
- Image Generation
- Cron Jobs

### Integrations
- **Obsidian** — reads entire vault
- **GStack** — dev environment
- **Custom skills** — for specific workflows

### The Biggest Money Saver
> "Have it write code once for recurring tasks. Then it runs without burning tokens every time. Stop paying an LLM to do the same scrape or report daily."

Pattern: Write task logic once → schedule with cron → runs at near-zero cost.

### Mobile: Android via Telegram
> "Name your agents. Talk to them like coworkers."

```bash
hermes config --telegram-token YOUR_BOT_TOKEN
hermes agents list
# Talk to specific agents by name
```

---

## Deployment Options

| Option | Risk Level | Use Case |
|--------|-----------|----------|
| Bare metal | Higher | Full control, self-managed |
| Docker | Medium | Containerized, consistent |
| Modal (serverless) | Lower | Pay per use, auto-scale |

---

## Setup Order

1. **Install Hermes** — `npm install -g hermes-ai` or one-command install
2. **Connect OpenRouter** — `hermes config --openrouter-key`
3. **Verify memory works** — Run a task, ask "what did we work on today?"
4. **Install integrations** — Obsidian, Telegram per your needs
5. **Load preloaded skills** — `hermes skills list`
6. **Set up mobile** — Telegram bot for on-the-go access
7. **Configure cron** — Automate recurring tasks (zero token burn pattern)

---

## Greg's Core Insight

> "The people who hate AI agents are using the wrong setup. Hermes fixes the three things that make AI agents feel broken: memory, stability, cost visibility."

---

## Anti-Patterns

❌ **Don't use Hermes the same way as OpenClaw** — The persistent memory changes everything. Stop repeating context.
❌ **Don't ignore OpenRouter** — Token cost visibility is a game changer for optimization.
❌ **Don't pay token costs for recurring tasks** — Write once, schedule, run free.

---

## Related Skills

- `hermes-multi-agent-team-profiles` — What to do after setup (architecture)
- `hermes-operator-layer` — Day-30 survival (governance)
- `hermes-7-new-features` — What's new post-setup

---

*Setup is day one. Architecture is what comes next.*