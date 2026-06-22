# New Skills Needed — Hermes Skill Library

Assessed 4 learning files. **2 qualify** for skill creation.

---

## ✅ Needs Skillify #1: `hermes-setup`

**Source file:** `vault/knowledge/learnings/2026-04-24-x-gregisenberg-hermes-agent-setup.md`

**Rationale:**
- 393K views — highest-engagement learning in the library
- Step-by-step Hermes installation and setup guide
- Covers: memory system, OpenRouter cost integration, 40+ preloaded skills, Obsidian/GStack integrations, deployment options (bare metal/Docker/Modal), mobile via Telegram
- The "$130 → $10" cost comparison is compelling proof point
- "Write code once, run without token burn" is a key optimization pattern for recurring tasks
- Complements deeper architecture posts without duplicating them

**Skill name:** `hermes-setup`  
**Skill type:** Setup/installation guide  
**Core content:** Full Hermes installation walkthrough, cost optimization via OpenRouter, skill preloading, deployment options, mobile setup

---

## ✅ Needs Skillify #2: `hermes-security`

**Source file:** `vault/knowledge/learnings/2026-05-15-justin-brooke-hermes-security.md`

**Rationale:**
- Security hardening for Hermes agents (directly applicable to OpenClaw since it uses Hermes as backbone)
- "Security as a prompt" pattern — agent hardening via system prompt injection
- "Audit-first mindset" — agent should audit its own installation
- Justin Brooke (@agentskills_ai) is an established authority in the agent space
- Security should be first-class in any production agent deployment

**Skill name:** `hermes-security`  
**Skill type:** Security hardening  
**Core content:** Cybersecurity hardening prompt for Hermes, audit checklist, security mindset injection

---

## ❌ Skipped

| File | Reason |
|------|--------|
| `2026-03-30-x-icarushermes-icarus-v2.md` | Built on Hermes v0.5.0 (outdated). Multi-platform memory concept is architecturally interesting but implementation is version-locked to old Hermes. Revisit if Hermes gets multi-platform memory built-in. |
| `2026-04-12-x-garrytan-gbrain-v080-voice-webrtc-twilio.md` | GBrain product-specific (Garry Tan's plugin), not Hermes core. Voice capability belongs in voice-pipeline skill instead. |
