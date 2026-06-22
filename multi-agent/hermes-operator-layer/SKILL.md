---
type: skill
name: hermes-operator-layer
source: https://x.com/nyk_builderz/status/2044472463279710344
description: Nyk's operator layer for Hermes 4-profile teams — the maintenance and governance that keeps a 4-role team (Hermes/Mira/Alan/Turing) coherent past day 30. Handoff contracts, memory-KPI audits, policy ceilings per role, gateway messaging, 4 Day-30 failure modes (drift, rot, bloat, collision), and team reference template. "Setup is day one. The operator layer is what makes it survive."
---

# Hermes Operator Layer Skill

**Core principle:** "Multi-agent setups fail quietly. Everything looks fine on day one, works well on day seven, and blurs together by day thirty. The profile system is not what fails. The operator layer on top is what nobody writes about." This skill is the ops runbook that makes the Hermes 4-profile team survive past day 30.

**Source:** @nyk_builderz | 71.7K views, 1.5K bookmarks, 538 likes  
**Complement:** `hermes-multi-agent-team-profiles` (neoaiforecast) = day-one setup  
**Score:** CRABHAMMER 10/10

---

# When to Use

- **Running Hermes 4-profile team** — Essential for long-term coherence
- **Day 7+ of multi-agent setup** — When things start to blur
- **Preventing Day-30 failure** — Before it happens, not after
- **Auditing existing multi-agent systems** — Check for the 4 failure modes
- **Onboarding new team members** — The `team-agents.md` file explains the system

**"Setup is day one. The operator layer is what makes it survive."**

---

# The Mental Model — Roles, Not Personas

**The wrong mental model:** One genius AI that does everything.

**The better mental model:** A small team with distinct roles, clear handoffs, and less context pollution.

**Hermes profiles isolate seven pieces of state at once:**
- Configuration
- Sessions
- Memory
- Skills
- Personality
- Cron state
- Gateway state

**"Specialization becomes durable only when state remains separated."**

---

# The 4-Role Team (From hermes-multi-agent-team-profiles)

| Role | Profile | Optimize for |
|------|---------|-------------|
| Orchestrator | Hermes | Planning, delegation, synthesis, final QA |
| Research | Alan | Source-first, skeptical, uncertainty-aware |
| Writer | Mira | Clarity, structure, audience-awareness |
| Builder | Turing | Implementation, debugging, reproducibility |

---

# The Operator Layer — 5 Components

```
1. Handoff Contracts — clean boundaries between roles
2. Memory-KPI — weekly audit per profile
3. Policy Ceilings — least privilege per role
4. Gateway Messaging — live control surface
5. Cron Coordination — avoid 3am collisions
```

---

# Component 1: Handoff Contracts

**The problem:** "Alan dumps 40kb of raw research into Mira's session, and now Mira is also a researcher again."

**The solution:** One file per role pair at `~/.hermes/team/handoffs/<from>-to-<to>.md`

**Four fields per contract:**

| Field | Description |
|-------|-------------|
| Input shape | What the receiving profile expects (e.g., Alan → Mira: ranked list of validated claims with source URLs, not raw excerpts) |
| Output shape | What the receiving profile returns (e.g., Mira → Hermes: drafted section with change log, not finished article) |
| Failure action | What happens if input is malformed (block, require-human-review, retry with adjusted prompt) |
| Verification gate | One assertion that must be true before the handoff completes |

**Examples:**

```
~/.hermes/team/handoffs/alan-to-mira.md
---
Input shape: "Ranked list of validated claims, each with a source URL. No raw excerpts."
Output shape: "Drafted section with change log. Not a finished article."
Failure action: "Block. Require Alan to resubmit with source URLs."
Verification gate: "Every claim carries a source URL."

~/.hermes/team/handoffs/turing-to-hermes.md
---
Input shape: "Feature branch name + passing test count + diff summary."
Output shape: "Approval or rejection with reason."
Failure action: "Block. Require Turing to fix failing tests."
Verification gate: "All tests passing."
```

**"With handoff contracts, you can watch the boundary and see when it rots. Without them, specialization dissolves in two weeks."**

---

# Component 2: Memory-KPI Per Profile

**The problem:** Memory rots inside each profile the same way a single wiki rots past 100 pages.

**The solution:** Weekly memory audit per profile.

```bash
for p in alan mira turing; do
  hermes -p $p memory-kpi --json | jq '.source_backed_pct, .stale_notes, .contradiction_notes'
done
```

**Watch:** `stale_notes`. Once it crosses 15% of total notes in a profile → schedule a brain-resolve pass before that profile starts quoting itself from obsolete context.

**When to resolve:**
- `stale_notes > 15%` → brain-resolve pass
- `contradiction_notes > 5%` → audit conflicting notes
- `source_backed_pct < 60%` → verify claims have sources

---

# Component 3: Policy Ceilings Per Role

**The problem:** Different roles carry different risks. A single policy cannot be right for all four.

**The solution:** Per-role permissions, with Hermes as the only one who can widen them.

| Profile | Risk Class | Permissions |
|---------|-----------|-------------|
| Alan (research) | Safe | Read web, read repo, write to research/ only. Cannot run shell commands. Cannot write outside its sandbox. |
| Mira (writer) | Safe | Read research outputs, write to drafts/ only. Cannot read secrets, cannot execute code. |
| Turing (engineer) | Review | Read repo, run sandboxed tests, write to a feature branch. Every commit to main requires explicit orchestrator approval. |
| Hermes (orchestrator) | Critical | Only profile allowed to approve Turing's commits, merge branches, or trigger paid API calls above budget ceiling. |

**"No profile gets more permission than its role needs, and the orchestrator is the only one who can widen any other profile's scope."**

---

# Component 4: Gateway Messaging

**The problem:** The profile system is a local org chart. Without messaging, you can't supervise it remotely.

**The solution:** Wire each profile to its own messaging identity.

| Profile | Channel | Posts |
|---------|---------|-------|
| Alan | #research | Research findings, source links, confidence tags |
| Mira | #writing | Drafts, change logs, audience notes |
| Turing | #engineering | Test results, PR links, flaky test reports |
| Hermes | #ops | Synthesis, approvals, escalations |

**"Messaging turns four local profiles into a live multi-agent control surface."**

**Practical use:**
- Check #research before starting your day (what did Alan find?)
- Review #writing before meetings (what is Mira drafting?)
- Approve PRs in #engineering (Turing needs Hermes sign-off)
- #ops is the escalation channel (Hermes asks for human approval on critical actions)

---

# Component 5: Cron Coordination

**The problem:** By week four, two profiles collide at 3am. Alan pulls weekly research digest. Mira regenerates weekly draft. Turing runs nightly test sweeps. Hermes runs daily orchestration pass.

**The solution:** One shared `~/.hermes/team/cron.md` listing every scheduled task with exact time, duration, and dependency.

```markdown
# ~/.hermes/team/cron.md

## Weekly Schedule (staggered to avoid 3am collisions)

| Day | Time | Profile | Task | Duration | Dependency |
|-----|------|---------|------|----------|------------|
| Mon | 6am | Alan | Weekly research digest | 30min | — |
| Tue | 6am | Mira | Draft refresh from Alan's digest | 20min | Alan (Mon) |
| Wed | 6am | Turing | Test sweep + flaky test report | 45min | — |
| Thu | 6am | Hermes | Weekly synthesis + handoff audit | 30min | Mira (Tue) |
| Daily | 4am | Alan | Fresh lead research | 15min | — |
| Daily | 2am | Turing | Test run | 10min | — |

## Adding a new cron
1. Check this file first
2. Stagger to avoid 30min window with other tasks
3. Log dependency if applicable
4. Commit change
```

**"Check this file before adding a new cron to any profile."**

---

# The 4 Day-30 Failure Modes

Every 4-profile team hits at least one of these. All four are preventable.

---

## Failure 1: Profile Drift

**What happens:** SOUL.md edits accumulate. A week ago Mira was "clear and audience-aware." Today Mira is "clear, audience-aware, technically precise, and willing to draft implementation notes." Mira is slowly becoming Turing.

**Patch:**
```bash
# Diff SOUL.md weekly against day-one
diff ~/.hermes/profiles/mira/SOUL.md ~/.hermes/profiles/mira/SOUL.md.day-one

# Any new responsibility gets a logged reason or it gets reverted
```

**Rule:** Cap SOUL.md at 400 words. Anything beyond goes into AGENTS.md or a per-domain reference file.

---

## Failure 2: Handoff Rot

**What happens:** The contract file exists, but nobody enforces it. Alan starts sending raw transcripts to Mira again. Mira starts asking Turing to "just check this one thing." Boundaries dissolve.

**Patch:**
- Wire each handoff file into the harness
- If the input does not match the declared shape → fail the handoff
- Require human review before retry

**"The contract is only real if it can block."**

---

## Failure 3: SOUL.md Bloat

**What happens:** Each role grows edge cases. Within a month each SOUL.md has 2kb of special cases, and the agent loses the original identity in the noise.

**Patch:**
- Cap SOUL.md at 400 words
- Overflow goes into AGENTS.md or per-domain reference files
- Identity stays stable; context rotates

**"A SOUL.md full of edge cases is not an identity — it's a disclaimer."**

---

## Failure 4: Cron Collision

**What happens:** Two profiles collide at 3am because nobody coordinated the schedule. Research digest + draft refresh + test sweep all fire at once.

**Patch:**
- One shared `cron.md` under source control
- Check the file before adding any new cron
- Stagger to avoid collision windows

---

# The Team Reference File

**Path:** `~/.hermes/team-agents.md`

**One file, one purpose:** Explain your team to yourself and anyone else using the system six months from now.

**Keep this file under source control.** Every edit goes through a commit. You'll thank yourself on day 90.

```markdown
# ~/.hermes/team-agents.md

## Roster
- **hermes** (orchestrator): plans, routes, approves, synthesizes
- **alan** (research): source-first, skeptical, uncertainty-tagged
- **mira** (writer): clarity, structure, audience-aware
- **turing** (engineer): implementation, tests, reproducibility

## When to use which profile
- starting a new project → hermes (scopes and decomposes)
- validating a claim → alan (source check, uncertainty tag)
- drafting anything external-facing → mira (audience-first)
- writing or debugging code → turing (test-first)

## Handoff rules
- alan → mira: ranked claims with source URLs. no raw transcripts.
- mira → hermes: drafted section + change log. not a finished article.
- turing → hermes: feature branch + passing tests + diff summary. not a merge.
- hermes → any: scoped task with acceptance criteria and failure action.

## Good output per profile
- alan: every claim has a source URL and a confidence tag.
- mira: every section has a named audience and a clear thesis.
- turing: every change has a passing test and a reproducible diff.
- hermes: every synthesis names the contributors and the open questions.

## Policy ceilings
- alan: read-only outside research/
- mira: read research/, write drafts/
- turing: read repo, write feature branch, run sandboxed tests
- hermes: only profile allowed to approve merges, widen permissions, or spend above budget

## Cron schedule (edit weekly; stagger to avoid 3am collisions)
- mon 6am — alan: weekly research digest
- tue 6am — mira: draft refresh from alan's digest
- wed 6am — turing: test sweep + flaky test report
- thu 6am — hermes: weekly synthesis + handoff audit
```

---

# Weekly Ops Checklist

Run this every Monday morning:

- [ ] Run memory-KPI for all 4 profiles
  ```bash
  for p in alan mira turing hermes; do
    hermes -p $p memory-kpi --json | jq '.stale_notes, .contradiction_notes'
  done
  ```
- [ ] Diff each SOUL.md against day-one (if drift > 10% → revert or log reason)
- [ ] Check handoff files (verify gates still pass)
- [ ] Review #research, #writing, #engineering, #ops channels
- [ ] Audit cron.md for upcoming week's schedule
- [ ] Check for new failed handoffs in logs

---

# Anti-Patterns

❌ **No handoff contracts** — Specialization dissolves in two weeks.
❌ **No memory-KPI audits** — Profiles start quoting obsolete context.
❌ **Same SOUL.md for all profiles** — You have four clones, not a team.
❌ **Unlimited SOUL.md** — Identity gets lost in edge cases.
❌ **Uncoordinated crons** — 3am collisions waste resources.
❌ **No gateway messaging** — Four local profiles with no remote supervision.
❌ **No team reference file** — Day 90 you don't know how the system works.

---

# Setup Order

1. **Day 1:** Deploy `hermes-multi-agent-team-profiles` (neoaiforecast) — the base 4-profile setup
2. **Day 2:** Create handoff contracts at `~/.hermes/team/handoffs/`
3. **Day 3:** Set policy ceilings in each profile's config.yaml
4. **Day 4:** Wire gateway messaging (4 channels)
5. **Day 5:** Create shared `cron.md`
6. **Day 6:** Create `team-agents.md` and commit to source control
7. **Weekly:** Run the ops checklist above

---

# Related Skills

- [[hermes-multi-agent-team-profiles]] — Day-one setup (Neo): 4 profiles, SOUL.md per role, setup steps
- [[resolver-routing-table-system]] — Day-30 governance (Garry Tan): routing tables, check-resolvable
- [[crew-architecture-workflow]] — 8-agent crew pattern (broader architecture)
- [[self-improving-multi-agent-qa]] — QA-driven self-healing loop

---

*Setup is day one. The operator layer is what makes it survive.*

*The contract is only real if it can block.*

*A SOUL.md full of edge cases is not an identity — it's a disclaimer.*

---

**Source:** https://x.com/nyk_builderz/status/2044472463279710344  
**Day-1 setup:** hermes-multi-agent-team-profiles (neoaiforecast)  
**This skill:** hermes-operator-layer (nyk_builderz)
