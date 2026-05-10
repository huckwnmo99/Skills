---
name: matt-engineering-workflows
description: Routes work to the imported Matt Pocock engineering skills instead of replacing them: diagnose, tdd, to-prd, to-issues, triage, grill-with-docs, improve-codebase-architecture, zoom-out, and related utilities. Use when choosing which Matt-derived skill should lead a software task.
---

# Matt Engineering Workflows

Use this skill as a router over the imported Matt Pocock skills. It should choose the right original skill and keep Codex from stacking too many processes at once.

## Core Rule

Choose one primary engineering loop for the current job. Do not stack every workflow just because it exists.

## Workflow Router

- Ambiguous request or unclear domain language: use `grill-with-docs` when docs/ADRs should be updated, or `grill-me` for non-code planning.
- Bug, regression, broken behavior, or performance issue: use `diagnose`.
- New feature with meaningful behavior risk: use `tdd`.
- Existing conversation needs product shape: use `to-prd`.
- Plan needs execution tickets: use `to-issues`.
- Incoming issues need state-machine handling: use `triage`.
- Codebase feels tangled or hard to test: use `improve-codebase-architecture`.
- Unfamiliar code area needs bigger-picture explanation: use `zoom-out`.
- User asks for brevity or token savings: use `caveman`.
- Repo needs Matt skill context: use `setup-matt-pocock-skills`.
- Need a reusable procedure: use `write-a-skill`.
- Need commit-time checks: use `setup-pre-commit`.

## Integration With Other Skills

- Use `karpathy-guidelines` as the baseline behavior for all Matt-derived skills.
- Use `workflow-ledger` when the task needs persistent state, decisions, lessons, or handoff.
- Use `ouroboros-spec-loop` before this skill when the task itself is still conceptually unstable.
- Use `codex-harness-adapter` when multiple skills or agent roles overlap.

## Output

When this skill is used, name:

- the chosen original skill,
- why it is the primary workflow,
- any obvious skill intentionally skipped,
- whether `workflow-ledger` is needed.

## Source

Router for skills imported or adapted from:

- https://github.com/mattpocock/skills
