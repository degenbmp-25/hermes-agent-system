---
type: skill
name: witcheer-hermes-profiles-mcp
description: Use Hermes v0.6.0 Profiles for multi-agent isolation (separate config, memory, sessions, skills per profile) and MCP server mode to expose Hermes conversations to Claude Desktop, Cursor, and VS Code.
date: 2026-04-01
author: witcheer
source: https://x.com/witcheer/status/2038690294074310976
salience: 0.80
tags: [hermes, profiles, mcp, multi-agent, isolation, docker]
---

# SKILL.md — Hermes v0.6.0 Profiles + MCP Server Mode

## What It Is

Hermes v0.6.0 introduced two major features that fundamentally change how you run multiple agents:

### 1. Profiles — Multi-Agent Isolation

Run multiple isolated Hermes instances from one install. Each profile has:
- **Separate config** — different settings per agent
- **Separate memory** — no context bleeding between agents
- **Separate sessions** — each agent's conversations are independent
- **Separate skills** — role-specific skill sets per agent

**The insight:** Split research, content, and BD into isolated agents that don't share context or rate limits. Parallel agents = parallel work.

### 2. MCP Server Mode — Agent Ecosystem Interoperability

Hermes can now expose its conversations and sessions to any MCP client via `hermes mcp serve`.

**Compatible with:**
- Claude Desktop
- Cursor
- VS Code

**What this means:** You can browse your Hermes agent's history from your IDE. Two major agent ecosystems become interoperable.

### 3. Fallback Provider Chains — Automatic Failover

Configure multiple inference providers. When the primary goes down, Hermes automatically switches to the next configured provider.

**Why it matters:** For 24/7 research pipelines, provider downtime = pipeline downtime. Provider chains = resilience.

## Additional Ships in v0.6.0

- **Docker container** — Finally! Containerized Hermes deployment
- **Telegram webhook mode** — Alternative to polling for Telegram integrations
- **Feishu/Lark and WeCom adapters** — China market platform support
- **Slack multi-workspace OAuth** — Enterprise Slack support
- **Exa search backend** — Better web search for research agents

## Prerequisites

- Hermes v0.6.0+ installed
- For MCP server: MCP client (Claude Desktop, Cursor, or VS Code with MCP extension)
- For provider chains: Multiple inference providers configured

## Usage

### Setting Up Profiles

```bash
# Create a new profile
hermes profile create research

# Switch between profiles
hermes profile use research
hermes profile use content
hermes profile use bd
```

Each profile runs as an isolated Hermes instance with its own memory, sessions, and skills.

### Enabling MCP Server Mode

```bash
# Start Hermes with MCP server enabled
hermes mcp serve
```

Then configure your MCP client to connect to the Hermes MCP endpoint.

### Configuring Provider Chains

```yaml
# In your Hermes config
providers:
  - name: openai
    priority: 1
  - name: anthropic
    priority: 2
  - name: local
    priority: 3
```

Hermes automatically fails over down the chain.

## Key Principles

1. **Profiles = isolation, not just config** — Each profile is a functionally separate agent
2. **MCP server bridges ecosystems** — Your IDE can now see your agent's history
3. **Provider chains = no single point of failure** — Build redundancy into your inference layer
4. **Docker = consistent deployment** — Ship to any containerized environment

## Integration Points for HiveMind

- **Profiles:** Use instead of full multi-instance CLI setup if you want simpler isolation (profiles within one install vs. separate folders)
- **MCP server:** Could enable OpenClaw to browse Hermes history; potential cross-platform integration
- **Provider chains:** Build into the OpenClaw inference layer for resilience

## Related

- Shann multi-instance control (shann-hermes-multi-instance.md) — more advanced multi-instance pattern
- hermes-hudui memory dashboard (sharbel-hermes-hudui-memory-dashboard.md) — memory visualization

## Status

- Source scored: 7/10 CRABHAMMER
- Extracted: 2026-04-01
- Skillified: 2026-06-12
