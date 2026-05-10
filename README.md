# Codex Operating Skillbook

This repository is a layered skillbook for running Codex as a disciplined engineering agent.

It combines:

- Karpathy-inspired behavioral guardrails,
- Matt Pocock's practical engineering skills,
- Ouroboros specification-first workflows,
- local Codex coordination and task-memory skills.

The goal is not to make one giant prompt. The goal is to keep many focused skills available, then use a small routing layer to pick the right one for the job.

## What This Is

This is a meta skillbook:

```text
Original skills      -> preserved as real skill folders
Coordination skills  -> choose which original skill to use
Workflow ledger      -> record progress, decisions, completions, and lessons
```

The upstream skillbooks are not treated as vague inspiration only. Their useful skills are vendored into `skills/` as individual `SKILL.md` folders. Local skills then adapt and route them for Codex.

## Who Reads What

Different files have different jobs.

| File | Main reader | Purpose |
| --- | --- | --- |
| `README.md` | Human user, maintainer | Explains the whole skillbook, structure, and operating model |
| `skills/*/SKILL.md` frontmatter | Codex skill discovery | Tells Codex when a skill should be loaded |
| `skills/*/SKILL.md` body | Codex after choosing a skill | Gives the actual workflow instructions |
| `REFERENCE.md` | Codex only when needed | Holds deeper details that should not always consume context |
| `templates/` | Codex and humans | Reusable document shapes for task ledgers, decisions, lessons, etc. |
| `THIRD_PARTY_NOTICES.md` | Human maintainer | Tracks upstream sources, commits, and license notes |

Important distinction:

```text
README.md
= human-facing map

SKILL.md description
= agent-facing index

SKILL.md body
= agent-facing procedure

REFERENCE.md / templates
= progressive detail loaded only when useful
```

So README explains the system, but Codex does not rely on README alone during normal operation. The actual agent behavior comes from the selected `SKILL.md` files.

## Core Idea

Use the smallest workflow that safely solves the user's request.

```text
Clarify before building.
Choose one primary workflow.
Make surgical, verifiable changes.
Record state only when it will matter later.
Promote repeated lessons into guardrails or skill updates.
```

## Skillbook Architecture

```text
Base behavior
  karpathy-guidelines

Specification layer
  ouroboros-spec-loop
  ouroboros-interview
  ouroboros-seed
  ouroboros-run
  ouroboros-evaluate
  ouroboros-evolve
  other ouroboros-* skills

Execution layer
  diagnose
  tdd
  to-prd
  to-issues
  triage
  grill-with-docs
  improve-codebase-architecture
  zoom-out
  other Matt-derived skills

Memory layer
  workflow-ledger

Routing layer
  codex-harness-adapter
  matt-engineering-workflows
  ouroboros-spec-loop
```

## Skill Layers

### 1. Karpathy Layer

`karpathy-guidelines` is the default behavior layer.

Use it to keep Codex disciplined:

- think before coding,
- surface ambiguity,
- prefer simple direct code,
- make surgical changes,
- define verifiable success criteria,
- avoid unrelated cleanup.

This layer should be active for almost every non-trivial coding, planning, review, or refactor task.

### 2. Ouroboros Layer

The Ouroboros skills handle work where the main risk is unclear intent.

Use this layer when:

- the user has a broad idea but not a clear spec,
- success criteria are unclear,
- domain terms are unstable,
- the work is strategic or multi-step,
- implementation should not start until the goal is better defined.

Core flow:

```text
ouroboros-interview -> ouroboros-seed -> ouroboros-run -> ouroboros-evaluate -> ouroboros-evolve
```

Generic upstream skill names like `run`, `seed`, and `status` are prefixed with `ouroboros-` in this repository to avoid collisions with other skillbooks.

### 3. Matt Engineering Layer

The Matt-derived skills handle practical engineering execution.

Use this layer when the task is already concrete enough to act on:

- debug a bug,
- add a feature,
- write tests,
- produce a PRD,
- split a plan into issues,
- triage incoming work,
- improve codebase architecture,
- understand an unfamiliar module,
- set up commit-time checks.

`matt-engineering-workflows` is only a router. It should not replace the original skills. It helps choose one primary skill, such as `diagnose`, `tdd`, `to-prd`, or `to-issues`.

### 4. Memory Layer

`workflow-ledger` records task state when memory matters.

Use it for medium or larger work that needs:

- a current status summary,
- planned, in-progress, and completed records,
- decisions,
- archives,
- lessons learned,
- future handoff.

Do not create ledger files for every tiny change. The ledger exists to preserve useful context, not to create paperwork.

### 5. Routing Layer

`codex-harness-adapter` decides how much process is justified.

It answers:

- Is this tiny, small, medium, large, or strategic?
- Which skill should lead?
- Should `workflow-ledger` be used?
- Is harness-style role separation justified?
- Should a repeated mistake become a guardrail or skill update?

## Choosing A Skill

Use this table as the default routing map.

| Situation | Start with | Then use |
| --- | --- | --- |
| Simple code edit | `karpathy-guidelines` | direct edit and verify |
| Bug or regression | `diagnose` | `workflow-ledger` if the bug is complex or recurring |
| New behavior with test risk | `tdd` | `workflow-ledger` for medium+ work |
| PRD from conversation | `to-prd` | `to-issues` if implementation tickets are needed |
| Break a plan into tickets | `to-issues` | `triage` if issue workflow matters |
| Unclear product/domain idea | `ouroboros-spec-loop` | `ouroboros-interview`, then `ouroboros-seed` |
| Execute a Seed | `ouroboros-run` | `ouroboros-evaluate` |
| Evaluate finished work | `ouroboros-evaluate` | `workflow-ledger` lessons if something should be remembered |
| Architecture feels tangled | `improve-codebase-architecture` | `tdd` for protected refactors |
| Need bigger-picture context | `zoom-out` | then choose a concrete execution skill |
| Need task memory | `workflow-ledger` | link to active detail docs instead of duplicating everything |
| Unsure which workflow applies | `codex-harness-adapter` | it chooses the smallest safe path |
| Need very short answers | `caveman` | keep accuracy, drop verbosity |

## Standard Workflows

### Small Code Change

```text
karpathy-guidelines
-> inspect relevant files
-> make surgical edit
-> run the smallest useful check
```

No ledger is needed unless the change belongs to an existing larger task.

### Bug Fix

```text
diagnose
-> reproduce
-> minimize
-> hypothesize
-> instrument
-> fix
-> regression check
-> lesson only if recurring or high-risk
```

Use `workflow-ledger` when the bug spans multiple files, sessions, decisions, or failed attempts.

### Feature Work

```text
karpathy-guidelines
-> tdd
-> one vertical slice
-> verify
-> repeat
```

Use `to-prd` before implementation if the product shape is still being defined.

### Ambiguous Large Request

```text
codex-harness-adapter
-> workflow-ledger
-> ouroboros-spec-loop
-> ouroboros-interview
-> ouroboros-seed
-> Matt execution skill
-> ouroboros-evaluate
```

The key is to clarify first, then execute with one primary engineering loop.

### Repeated Mistake Or Process Failure

```text
workflow-ledger lesson
-> second similar event: guardrail candidate
-> third similar event: update existing skill or create focused new skill
-> high-risk event: propose guardrail immediately
```

Prefer updating an existing skill over creating a new one.

## Directory Layout

```text
.
+-- README.md
+-- THIRD_PARTY_NOTICES.md
+-- licenses/
+-- skills/
    +-- karpathy-guidelines/
    +-- diagnose/
    +-- tdd/
    +-- to-prd/
    +-- to-issues/
    +-- ouroboros-interview/
    +-- ouroboros-seed/
    +-- ouroboros-run/
    +-- ouroboros-evaluate/
    +-- workflow-ledger/
    +-- codex-harness-adapter/
    +-- ...
```

Each skill folder should contain at least:

```text
SKILL.md
```

Some skills also include:

```text
REFERENCE.md
templates/
scripts/
```

## Skill Groups

### Base Discipline

- `karpathy-guidelines`

### Matt Pocock Skills

Engineering:

- `diagnose`
- `grill-with-docs`
- `improve-codebase-architecture`
- `prototype`
- `setup-matt-pocock-skills`
- `tdd`
- `to-issues`
- `to-prd`
- `triage`
- `zoom-out`

Productivity:

- `caveman`
- `grill-me`
- `write-a-skill`

Misc:

- `git-guardrails-claude-code`
- `migrate-to-shoehorn`
- `scaffold-exercises`
- `setup-pre-commit`

Personal:

- `edit-article`
- `obsidian-vault`

### Ouroboros Skills

- `ouroboros-auto`
- `ouroboros-brownfield`
- `ouroboros-evaluate`
- `ouroboros-evolve`
- `ouroboros-interview`
- `ouroboros-pm`
- `ouroboros-ralph`
- `ouroboros-run`
- `ouroboros-seed`
- `ouroboros-status`
- `ouroboros-unstuck`

### Local Coordination Skills

- `matt-engineering-workflows`
- `ouroboros-spec-loop`
- `codex-harness-adapter`
- `workflow-ledger`

## Installation

To install manually into Codex:

```bash
git clone https://github.com/huckwnmo99/Skills.git
cp -R Skills/skills/* ~/.codex/skills/
```

After installing, start a new Codex session so the skill list refreshes.

## Customization

Recommended policy:

- Keep original upstream skills mostly intact.
- Add local routing or adapter skills instead of rewriting every upstream skill.
- Rename only when needed to avoid collisions, as with `ouroboros-*`.
- Put persistent task state in `workflow-ledger`, not inside random notes.
- Promote lessons into guardrails only after recurrence or high risk.
- Prefer updating an existing skill before creating a new skill.

## Maintenance Policy

When updating from upstream:

1. Check the upstream diff first.
2. Import only useful stable skills by default.
3. Avoid deprecated or in-progress upstream folders unless deliberately needed.
4. Preserve local name prefixes that prevent collisions.
5. Update `THIRD_PARTY_NOTICES.md` with the upstream commit.
6. Keep README focused on the operating model.
7. Keep detailed execution rules inside each `SKILL.md`.

## Sources

Original or adapted skills come from:

- Karpathy-inspired guidelines: https://github.com/forrestchang/andrej-karpathy-skills
- Matt Pocock skills: https://github.com/mattpocock/skills
- Ouroboros: https://github.com/Q00/ouroboros

See `THIRD_PARTY_NOTICES.md` and `licenses/` for upstream commit and license information.
