# Workflow Ledger Reference

## Core Model

The workflow ledger separates current working context from historical records:

- `README.md`: the map and routing layer.
- `planned/`: current plans, requirements, designs, and intended next work.
- `in-progress/`: the active execution note.
- `completed/`: current completion summaries and verification notes.
- `archive/`: historical snapshots, decisions, and lessons.

Use this skill before medium-or-larger work, or for small work only when an existing ledger is useful for handoff or later resume. Later agents should be able to resume from the README and read only the relevant folder-level documents.

## Task Size Rules

### Tiny

Examples: typo, copy change, one-line config, trivial CSS tweak.

Action:

- Do not create a new task folder.
- If a relevant ledger already exists, add at most one short log entry.
- Complete the work directly.

### Small

Examples: clear single-file bug, small copy update, narrow setting change.

Action:

- Prefer an existing ledger.
- Create one `in-progress` note only when the work needs a handoff trail.
- Avoid `planned/` and archive noise unless the user asks.

### Medium

Examples: multi-file bug, feature slice, refactor, or work that may continue later and needs handoff, decision context, or resume support.

Action:

- Create the full directory contract when it helps future resume or handoff.
- The minimum is a README router plus one active detail doc.
- Add `planned/` docs only when requirements, design, or scope would otherwise be lost.
- Maintain one active `in-progress/` doc.
- Finish with `completed/`; archive only important decisions or historically useful snapshots.

### Large

Examples: product workflow, domain model, architecture change, policy change.

Action:

- Use the full ledger.
- Record decisions in `archive/decisions/`.
- Record recurring or high-risk lessons in `archive/lessons/`.
- Keep important superseded plans in `archive/planned/`.
- Keep README short and update it at each state transition.

### Strategic

Examples: roadmap, operating model, multi-agent program, long-running initiative.

Action:

- Use the full ledger.
- Maintain `archive/README.md` as an index.
- Keep explicit decision records.
- Summarize current state in README rather than repeating history.

## Naming Rules

Every generated detail file must follow:

```text
NN_YYYY-MM-DD_short-kebab-name.md
```

Rules:

- `NN` is the next two-digit sequence number in that folder.
- `YYYY-MM-DD` is the current local date.
- `short-kebab-name` should be 3-6 English words when possible.
- Use lowercase letters, numbers, and hyphens for the slug.
- Before creating a file, scan the target folder, use `max(NN)+1`, and never renumber existing files.
- If a filename already exists, rescan and increment the sequence number. If the exact collision still matters, append a short suffix such as `-2`.
- After `99`, continue with `100` rather than resetting.
- Use the project language inside document bodies when useful.

## Document Metadata

Use this compact metadata block near the top of generated documents:

```md
Status: planned | in-progress | blocked | completed | archived
Type: requirements | design | implementation | verification | decision | lesson | blocker | note
Created: YYYY-MM-DD
Updated: YYYY-MM-DD
Related: {{relative-path-to-task-readme}}
```

## README Requirements

The task README should stay under 150 lines. It must answer:

- What is this task for?
- What is the current status?
- What size is the task?
- Who owns freshness and what is the source of truth?
- What should happen next?
- What must be true for the task to be done?
- Which documents should be read now?
- What is planned, in progress, complete, and recently archived?
- When was this map last updated?

Recommended sections:

```md
# Task Name

## Purpose
## Current Status
## Non-Technical Summary
## Next Action
## Success Criteria
## Documents To Read
## Planned
## In Progress
## Completed
## Recent Archive
## Last Updated
```

Do not put detailed requirements, designs, diagnosis logs, PRDs, or long decision narratives in README. Link to them.

Do not put detailed code boundary notes in README. If needed, link to the active detail doc that contains `Code Boundaries`.

Keep routing sections small:

- `Planned`: up to 3 current links.
- `In Progress`: one active link unless parallel tracks are explicit.
- `Completed`: up to 3 current completion links.
- `Recent Archive`: up to 5 links.

Move older links to `archive/README.md`.

## Freshness Check

Before using an existing ledger:

- check `Last Updated`,
- compare `Current Status` with `planned/`, `in-progress/`, and `completed/`,
- confirm `Next Action` still matches the user's request,
- refresh README before doing work if status, links, or next action conflict.

## State Transitions

Typical flow:

```text
planned -> in-progress -> completed -> archive
```

Use `completed/` for the latest completion summary. Do not move ordinary completed documents into archive. Use `archive/completed/` only for releases, major milestones, policy or architecture changes, or completion snapshots with lasting historical value.

Archive a document when:

- its plan has been superseded,
- its in-progress state is no longer active but matters historically,
- a decision will need future explanation,
- a mistake, failed attempt, or blocker is likely to recur,
- a completion snapshot has long-term historical value,
- verification evidence is needed to prevent recurrence.

## Lesson Loop

Use lessons to turn mistakes into future prevention:

```text
mistake or blocker -> lesson -> guardrail candidate -> skill update or new skill
```

Record a lesson when:

- an attempt failed in a way future agents could repeat,
- the task was delayed by a preventable assumption,
- verification caught a non-obvious mistake,
- the same issue has appeared before,
- the cost of repeating the mistake would be high.

Promotion rules:

- First occurrence: write a lesson in `archive/lessons/`.
- Second similar occurrence: add or propose a guardrail in the relevant README, project instruction, or skill.
- Third similar occurrence: update an existing skill or create a new focused skill.
- High-risk mistake: skip directly to guardrail or skill-update recommendation.

Do not record lessons for ordinary progress, transient confusion, or issues that are fully explained by the completed summary.

## Code Boundaries

Use `Code Boundaries` only as a local safety note for the current code change. It is not a permanent architecture map.

Allowed when:

- task size is `Medium` or larger,
- multiple modules or risky files may be touched,
- generated files, migrations, auth/session, external API contracts, or data-loss risk are nearby,
- prior lessons mention the same area,
- handoff would be safer with explicit boundaries.

Skip for `Tiny` and most `Small` tasks.

Put the section in the active `in-progress/` or other detail document, not in README. README may link to that document in `Documents To Read`.

Keep it short:

- 12 lines or fewer by default,
- up to 5 path patterns,
- up to 3 `Do Not Touch Without Approval` entries,
- path patterns over exhaustive file lists,
- `Unknown` or `Needs inspection` when uncertain.

Use this shape:

```md
## Code Boundaries

Boundary Confidence: high | medium | low

Likely Module:
- {{module or Unknown}}

Safe To Edit:
- {{path or area}}

Edit With Care:
- {{path or area}} because {{risk}}

Do Not Touch Without Approval:
- {{path or area}} because {{source or risk}}

Required Checks:
- {{actual runnable check}}
```

`Do Not Touch Without Approval` is allowed only when grounded in generated files, migration history, security/session boundaries, external API contracts, explicit user instructions, AGENTS/project instructions, ADRs, or existing docs. Never invent a permanent prohibition from a guess.

Treat code boundaries as stale after 14 days or after visible code structure changes. Re-check the file tree before reusing them.

Promote to a future `docs/code-map/` or dedicated boundary skill only when:

- the same module boundary appears in 3 or more ledgers,
- the same boundary mistake appears in 2 or more lessons,
- multiple agents repeatedly confuse the same area,
- the boundary is stable and product/architecture-relevant,
- the user explicitly asks for a code map.

If the work becomes module design or boundary redesign, stop using this section and hand off to `improve-codebase-architecture`.

## Integration With Other Skills

- Karpathy-style guidelines decide whether documentation is too large for the task.
- Ouroboros may produce a specification; the ledger links to it and tracks its status.
- Matt Pocock workflows may produce PRDs, issues, diagnoses, ADRs, or TDD plans; the ledger records where they are and which one is current.
- Diagnose may identify what would have prevented a bug; the ledger stores that as a lesson when it should affect future work.
- Do not duplicate full content from those artifacts. Keep only the artifact location, status, next-read instruction, and a 1-3 line routing summary.

## Failure Signals

Shrink the ledger when:

- README becomes a long narrative.
- More time is spent updating docs than doing the work.
- Tiny or small tasks create new folders repeatedly.
- `archive/` receives routine progress chatter.
- lessons are recorded for every minor inconvenience.
- code boundaries are treated as permanent truth instead of task-local notes.
- there are multiple active `in-progress` files for one serial task.
- users ask for a result and the agent keeps expanding the ledger.

## Maintenance

At task start:

- classify size,
- locate or create the ledger,
- update README status and next action,
- create only the minimum necessary detail docs.

During work:

- keep one active `in-progress` note current,
- add short code boundaries only for risky Medium-or-larger code changes,
- link related PRDs, issues, specs, tests, and decisions,
- avoid duplicating long content.

At completion:

- write or update `completed/`,
- archive important superseded plans and decisions only when they have future explanatory value,
- record lessons only for recurring or high-risk preventable mistakes,
- update README with completed summary and next action,
- preserve verification outcomes only when they matter for recurrence prevention or future review.
