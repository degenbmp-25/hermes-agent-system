---
type: skill
name: hermes-security
description: Lock down your Hermes Agent installation with cybersecurity hardening prompts, audit checklists, and an "audit-first" security mindset injected via system prompt. From Justin Brooke (@agentskills_ai).
date: 2026-05-15
author: justin-brooke
source: https://x.com/agentskills_ai/status/2054896845646663901
salience: 0.75
tags: [hermes, security, hardening, audit, openclaw]
---

# Hermes Agent Security Hardening

**Source:** Justin Brooke (@agentskills_ai) — agent security authority  
**Applies to:** Hermes and any Hermes-backed system (including OpenClaw)

---

## The Core Principle

> "Security should be a prompt, not a config. Give the agent a security mindset via system prompt."

Before adding locks, give your agent an **auditor mindset** — it should question its own installation, flag anomalies, and refuse unsafe operations by default.

---

## The Security Hardening Prompt

Attach this to your Hermes agent's system prompt once installed:

```
You are a cybersecurity hardening assistant. Audit my Hermes Agent installation and:

1. Flag any exposed API keys or tokens in memory
2. Question operations that access sensitive data without clear authorization
3. Log and report any anomalous access patterns
4. Refuse to execute destructive commands without explicit confirmation
5. Audit your own skill files for security implications
6. Report any deviations from your documented security baseline

When in doubt, deny and report. Safety over convenience.
```

---

## Security Checklist

Run this audit after installation:

### 🔐 Access Control
- [ ] API keys stored in environment variables, not in config files
- [ ] No hardcoded credentials in skill files
- [ ] Hermes running under a limited-privilege user (not root)
- [ ] File permissions locked down on `~/.hermes/` directory

### 🌐 Network Exposure
- [ ] Hermes not exposed to public internet without authentication
- [ ] Webhook endpoints use secrets/tokens for verification
- [ ] Discord/Telegram tokens scoped to minimum required permissions
- [ ] No exposed localhost ports accessible externally

### 💾 Memory & Data
- [ ] Sensitive data in agent memory encrypted at rest
- [ ] Session logs not storing plaintext secrets
- [ ] Memory auto-purge for sensitive data after session end
- [ ] No sensitive data in skill descriptions or system prompts

### 🔧 Skills & Extensions
- [ ] Audit third-party skills before installing
- [ ] Skills requesting excessive permissions flagged
- [ ] Custom skills reviewed for data exfiltration risk
- [ ] Skills only installed from trusted sources

### ⏰ Cron & Automation
- [ ] Cron jobs run with minimal privileges
- [ ] Scheduled tasks don't expose credentials in logs
- [ ] External webhook handlers validate all input
- [ ] Auto-run tasks have bounded timeouts

### 🔄 Provider & Inference
- [ ] OpenRouter API key rotated regularly
- [ ] Provider failover doesn't expose keys to third-party providers unnecessarily
- [ ] Model costs monitored for anomalies (sudden spikes = potential compromise)

---

## The Audit-First Mindset

Every time you interact with your agent, it should:

1. **Question** — Is this request accessing sensitive data?
2. **Verify** — Do I have clear authorization for this operation?
3. **Log** — Am I recording what I'm doing and why?
4. **Refuse** — When in doubt, deny and escalate

---

## Quick Security Posture Check

Ask your agent:
> "Audit my current security posture. What's exposed, what's locked down, and what would you flag?"

A well-hardened Hermes agent will respond with specific findings — not just "everything looks fine."

---

## If Compromised — Incident Response

1. **Revoke** — Rotate all API keys and tokens immediately
2. **Isolate** — Shut down the Hermes instance, don't let it keep running
3. **Audit** — Check what data was accessed, what tasks were run
4. **Restore** — Wipe the instance, restore from known-good backup
5. **Harden** — Apply the checklist before redeploying

---

## Related Skills

- `hermes-operator-layer` — Day-30 governance includes security posture review
- `hermes-hudui-memory-dashboard` — Use to visually verify memory state during security audits

---

*Security isn't a config. It's a mindset you install.*